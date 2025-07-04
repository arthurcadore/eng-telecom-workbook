#include <omnetpp.h>
using namespace omnetpp;

class Splitter : public cSimpleModule {
    double prob;

  protected:
    virtual void initialize() override {
        prob = par("prob");
    }

    virtual void handleMessage(cMessage *msg) override {
        int outGate = (uniform(0, 1) < prob) ? 0 : 1;
        send(msg, "out", outGate);
    }
};

Define_Module(Splitter);
