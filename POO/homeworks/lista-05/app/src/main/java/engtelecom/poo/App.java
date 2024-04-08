package engtelecom.poo;

import java.util.ArrayList;

public class App {

    private ArrayList<Veiculo> veiculos;
    private ArrayList<Conversivel> conversiveis;

    public void adicionarVeiculos() {

        Ferrari F = new Ferrari("Ferrari");
        Pampa P1 = new Pampa("Pampa");
        Panther P2 = new Panther("Panther");

        veiculos = new ArrayList<>();
        this.veiculos.add(F);
        this.veiculos.add(P1);
        this.veiculos.add(P2);

        conversiveis = new ArrayList<>();
        this.conversiveis.add(F);
        this.conversiveis.add(P2);

    }

    // Usando polimorfismo nas funções abaixo:
    public void acelerarVeiculos(int valorAceleracao) {

        System.out.println("Acelerando carros:");
        for (Veiculo i : veiculos) {
            i.acelerar(valorAceleracao);

            System.out.println("Carro " + i.nome + " em " + i.velocidadeAtual);

        }
        System.out.println("");

    }

    // Usando polimorfismo nas funções abaixo:
    public void frearVeiculos(int valorFrenagem) {

        System.out.println("Freando carros:");
        for (Veiculo i : veiculos) {
            i.frear(valorFrenagem);

            System.out.println("Carro " + i.nome + " em " + i.velocidadeAtual);

        }
        System.out.println("");

    }

    // Usando polimorfismo nas funções abaixo:
    public void abrirCapotaVeiculos() {

        System.out.println("abrindo capotas:");
        for (Conversivel i : conversiveis) {
            if (i.abrirCapota()) {
                System.out.println("capota aberta!");
            } else {
                System.out.println("Capota não abriu!");
            }

        }
        System.out.println("");

    }

    // Usando polimorfismo nas funções abaixo:
    public void fecharCapotaVeiculos() {

        System.out.println("fechando capotas:");
        for (Conversivel i : conversiveis) {

            if (i.fecharCapota()) {
                System.out.println("capota fechada!");
            } else {
                System.out.println("Capota não fechou!");
            }
        }
        System.out.println("");

    }

    public static void main(String[] args) {

        App app = new App();

        app.adicionarVeiculos();

        // Usando polimorfismo nas funções abaixo:
        app.acelerarVeiculos(150);
        app.frearVeiculos(100);

        app.abrirCapotaVeiculos();
        app.fecharCapotaVeiculos();

        app.frearVeiculos(31);

        app.abrirCapotaVeiculos();
        app.fecharCapotaVeiculos();

    }
}
