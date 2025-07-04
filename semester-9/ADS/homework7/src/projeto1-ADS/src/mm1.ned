package src;
import src.Generator;
import src.Queue;
import src.Sink;
import src.Splitter;

network MM1
{
    submodules:
        gen0: Generator;
        gen1: Generator;
        gen2: Generator;

        queue0: Queue;
        queue1: Queue;
        queue2: Queue;

        splitter: Splitter {
            parameters:
                prob = default(0.6); // pode ser sobrescrito no .ini
        }

        sink1: Sink;
        sink2: Sink;

    connections allowunconnected:
        gen0.out --> queue0.in[0];
        queue0.out --> splitter.in[0];
        splitter.out[0] --> queue1.in[0];
        splitter.out[1] --> queue2.in[0];
        gen1.out --> queue1.in[1];
        gen2.out --> queue2.in[1];
        queue1.out --> sink1.in[0];
        queue2.out --> sink2.in[0];
}
