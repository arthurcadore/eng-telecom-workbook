package src;

simple Queue
{
    parameters:
        @display("i=block/queue");
        double serviceTime @unit(s);
    gates:
        input in[2];
        output out;
}
