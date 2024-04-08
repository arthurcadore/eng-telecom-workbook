
package engtelecom.poo;

import java.time.LocalTime;

import edu.princeton.cs.algs4.Draw;

public class App {

    // atributos da classe App.
    private Draw desenho;
    private Relogio[] vetorDeRelogios = new Relogio[3];
    private int contadorDeObjetos;

    public App() {
        this.desenho = new Draw();
        // definindo a área de desenho --
        // https://introcs.cs.princeton.edu/java/stdlib/javadoc/Draw.html
        this.desenho.setCanvasSize(600, 600);
        // definindo a escala da área de desenho -- leia mais na documentação da classe
        this.desenho.setXscale(0, 600);
        this.desenho.setYscale(0, 600);
        this.contadorDeObjetos = 0;

    }

    // adicionar relógio ao vetor.
    public boolean adicionarRelogio(Relogio relogio1) {
        if (this.contadorDeObjetos < 3) {
            this.vetorDeRelogios[this.contadorDeObjetos] = relogio1;
            contadorDeObjetos++;
            return true;
        }
        return false;
    }

    // desenha todos os relógios do vetor na tela.
    public void desenharRelogios() {
        LocalTime hararioAtual = LocalTime.now();
        this.desenho.clear();
        for (int i = 0; i < this.contadorDeObjetos; i++) {
            this.vetorDeRelogios[i].desenharRelogio(this.desenho, hararioAtual.getHour()
                    + 3, hararioAtual.getMinute(),
                    hararioAtual.getSecond());
        }
    }

    public static void main(String[] args) {

        App relogioNovo = new App();

        Relogio relogio1 = new Relogio(150, 150);
        Relogio relogio2 = new Relogio(450, 450, -4, "TESTE 2");
        Relogio relogio3 = new Relogio(150, 450, 2, "TESTE 1");
        Relogio relogio4 = new Relogio(450, 150, -4);

        relogioNovo.adicionarRelogio(relogio1);
        relogioNovo.adicionarRelogio(relogio2);
        relogioNovo.adicionarRelogio(relogio3);
        relogioNovo.adicionarRelogio(relogio4);

        relogioNovo.desenharRelogios();

    }
}
