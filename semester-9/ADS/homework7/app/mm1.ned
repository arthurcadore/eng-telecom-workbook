//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
//
// *** mm1.ned ***
simple Generator {
parameters:
	volatile double interArrivalTime; // sec
	@display("i=block/source");
gates:
	output out;
}

simple Queue {
parameters:
	volatile double serviceTime; // sec
	@display("i=block/queue");
gates:
	input in;
	output out;
}

simple Sink {
parameters:
	@display("i=block/sink");
gates:
	input in;
}

network MM1 {
submodules:
	gen: Generator{
		@display("p=273,101");
        }
	queue: Queue{
                @display("p=165,79");
        }
	sink: Sink{
                @display("p=50,79");
        }
connections:
	gen.out --> queue.in;
	queue.out --> sink.in;
}