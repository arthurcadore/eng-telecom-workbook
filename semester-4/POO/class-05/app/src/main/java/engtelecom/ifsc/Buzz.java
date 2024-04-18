

package engtelecom.ifsc;

import java.util.Random;

public class Buzz {

  private boolean capaceteAberto;
  private boolean asasAbertas;
  private boolean laserDisparado;
  private boolean bracoGolpe;
  private String[] frases;


  public Buzz() {

    this.capaceteAberto = true;
    this.asasAbertas = true;
    this.laserDisparado = true;
    this.bracoGolpe = true;

    this.frases = new String[] { "Ao infinito e além! ",
        "Embora você tenha tentado acabar comigo, a vingança não é um ideal que promovemos no meu planeta.",
        "Eu sou seu Buzz Lightyear. Vamos voar pra bem longe daqui. Ao infinito e além!",
        "Deus não é aquilo que vai no infinito e no além. O nome disso é Buzz Lightyear. Deus é outra coisa.",
        "É quase como diz Buzz Lightyear. Minha imaginação me leva ao infinito e ao além",
        "Isto não é voar. Isto é cair, com estilo!" };
  }

  public boolean acionaCapacete() {
    if (capaceteAberto) {
      capaceteAberto = false;
      return true;
    } else {
      capaceteAberto = true;
      return false;
    }
  }

  public boolean isCapaceteAberto() {
    return capaceteAberto;
  }

  public boolean acionaAsas() {
    if (asasAbertas) {
      asasAbertas = false;
      return true;
    } else {
      asasAbertas = true;
      return false;
    }
  }

  public boolean isAsasAbertas() {
    return asasAbertas;
  }

  public boolean acionaLaser() {
    this.laserDisparado = !this.laserDisparado;
    return this.laserDisparado;
  }

  public boolean isLaserDisparado() {
    return laserDisparado;
  }


  public boolean acionaBraco() {
    if (bracoGolpe) {
      bracoGolpe = false;
      return true;
    } else {
      bracoGolpe = true;
      return false;
    }
  }

  public boolean isBracoGolpe() {
    return bracoGolpe;
  }

  public String randomFrases(){

    Random random = new Random();
    return frases[random.nextInt(this.frases.length)];
  }

}
