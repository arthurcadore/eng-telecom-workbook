
package engtelecom.poo;

public class App {

    // Liga uma máquina veritual e verifica se a mesma foi de fato ligada;
    public static void maquinaligar(Rack rack, String MaquinaReal, String MaquinaVirtual) {

        rack.turnOnVirtualMachine(MaquinaReal, MaquinaVirtual);

        if (rack.getVirtualMachineState(MaquinaReal, MaquinaVirtual)) {
            System.out.println(MaquinaVirtual + " está ligada!");
        }
    }

    // Liga uma máquina veritual e verifica se a mesma foi de fato desligada;
    public static void maquinadesligar(Rack rack, String MaquinaReal, String MaquinaVirtual) {

        rack.turnOffVirtualMachine(MaquinaReal, MaquinaVirtual);

        if (!rack.getVirtualMachineState(MaquinaReal, MaquinaVirtual)) {
            System.out.println(MaquinaVirtual + " está desligada!");
        }
    }

    public static void main(String[] args) {

        Rack NovoRack = new Rack();

        // Adicionando máquinas reais ao Rack;
        NovoRack.addMachine("Maquina1", 2000, 2000);
        NovoRack.addMachine("Maquina2", 4000, 4000);
        NovoRack.addMachine("Maquina3", 6000, 6000);
        NovoRack.addMachine("Maquina4", 8000, 8000);
        NovoRack.addMachine("Maquina5", 10000, 10000);

        // Adicionando máquinas virtuais a máquina real;
        NovoRack.addVirtualMachine("Maquina1", "Virtual1", 500, 500);
        NovoRack.addVirtualMachine("Maquina1", "Virtual2", 500, 500);
        NovoRack.addVirtualMachine("Maquina1", "Virtual3", 500, 500);
        NovoRack.addVirtualMachine("Maquina1", "Virtual4", 200, 200);
        NovoRack.addVirtualMachine("Maquina1", "Virtual5", 200, 200);

        // Ligando as máquinas virtuais
        maquinaligar(NovoRack, "Maquina1", "Virtual1");
        maquinaligar(NovoRack, "Maquina1", "Virtual2");
        maquinaligar(NovoRack, "Maquina1", "Virtual3");

        // Desligando as máquinas virtuais
        maquinadesligar(NovoRack, "Maquina1", "Virtual1");
        maquinadesligar(NovoRack, "Maquina1", "Virtual2");
        maquinadesligar(NovoRack, "Maquina1", "Virtual3");

    }
}
