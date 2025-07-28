//
// Copyright (C) 2005 OpenSim Ltd.
//
// SPDX-License-Identifier: LGPL-3.0-or-later
//

package inet.showcases.wireless.handover;

import inet.node.inet.WirelessHost;
import inet.node.inet.StandardHost;
import inet.node.wireless.AccessPoint;
import inet.node.ethernet.EthernetSwitch;
import inet.physicallayer.wireless.ieee80211.packetlevel.Ieee80211ScalarRadioMedium;
import inet.visualizer.canvas.integrated.IntegratedCanvasVisualizer;

network HandoverShowcase
{
    parameters:
        @display("bgb=800,600");
    types:
        channel Eth100M extends ned.DatarateChannel {
            datarate = 100Mbps;
            delay = 0.1ms;
        }

    submodules:
        visualizer: IntegratedCanvasVisualizer {
            parameters:
                @display("p=100,200");
        }

        radioMedium: Ieee80211ScalarRadioMedium {
            parameters:
                @display("p=100,100");
        }

        host1: WirelessHost {
            parameters:
                @display("p=50,280;r=,,#707070");
        }

        host2: StandardHost {
            parameters:
                @display("p=750,280;r=,,#707070");
        }

        ap1: AccessPoint {
            parameters:
                @display("p=100,350;r=,,#707070");
        }

        ap2: AccessPoint {
            parameters:
                @display("p=500,350;r=,,#707070");
        }

        sw: EthernetSwitch {
            parameters:
                @display("p=300,350;r=,,#707070");
        }

    connections allowunconnected:
        ap1.ethg++ <--> Eth100M <--> sw.ethg++;
        ap2.ethg++ <--> Eth100M <--> sw.ethg++;
        host2.ethg++ <--> Eth100M <--> sw.ethg++;
}
