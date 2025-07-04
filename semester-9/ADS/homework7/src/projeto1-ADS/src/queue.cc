#include <string.h>
#include <omnetpp.h>

using namespace omnetpp;

class Queue : public cSimpleModule {
private:
    // local variable
    cQueue buffer;
    cMessage *endServiceEvent;
    cMessage *currentClient;
    simtime_t service_time;
    simsignal_t queueSizeSignal;
    cOutVector queueLengthVector;
public:
    // constructor
    Queue(); // constructor
    virtual ~Queue(); // destructor
protected:
    virtual void initialize();
    virtual void finish();
    virtual void handleMessage(cMessage *msg);
};

Define_Module(Queue);
    Queue::Queue() {
    endServiceEvent=NULL;
}

Queue::~Queue() {
    cancelAndDelete(endServiceEvent);
}

void Queue::initialize() {
    queueSizeSignal = registerSignal("queueLength");
    endServiceEvent=new cMessage("endService");  // sef message para controle do final de serviço
    // Emitir sinal inicial com tamanho 0
    emit(queueSizeSignal, 0);
    queueLengthVector.setName("queueLength");
    queueLengthVector.record(0);
}

void Queue::finish() {}

void Queue::handleMessage(cMessage *msg) {
    cMessage *pkt;
    if (msg==endServiceEvent) {       // SE MENSAGEM for final de serviço...
        send(currentClient,"out");       // envia o cliente atual para fora...
        if (!buffer.isEmpty()) {         // Se existe requisição na fila
            currentClient=(cMessage*)buffer.pop();   // retira a requsisição da fila e faz como cliente corrente
            emit(queueSizeSignal, buffer.getLength());
            queueLengthVector.record(buffer.getLength()); // Grava no vetor
            service_time=par("serviceTime");
            scheduleAt(simTime()+service_time,endServiceEvent); // escalona o tempo de serviço do novo cliente
        } else {
            // Fila ficou vazia
            emit(queueSizeSignal, 0);
            queueLengthVector.record(0); // Grava no vetor
        }
    } else {                           // SE MENSAGEM for chegada de nova requisição
        if (endServiceEvent->isScheduled()) { // se o servidor estiver ocupado...
            buffer.insert(msg); //Enfileira a mensagem
            emit(queueSizeSignal, buffer.getLength());
            queueLengthVector.record(buffer.getLength()); // Grava no vetor
        } else {                              // senão atende de imediato e  escalona o tempo de serviço para este cliente
            currentClient = msg;
            service_time=par("serviceTime");
            scheduleAt(simTime()+service_time,endServiceEvent);
        }
    }
}