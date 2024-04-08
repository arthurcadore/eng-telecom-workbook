package engtelecom.poo;

public class Fluxo2 implements Runnable {

  public void imprimirFluxo2() throws InterruptedException {

    for (int i = 0; i < 10; i++) {

      System.err.println("Fluxo2 : " + i);
      Thread.sleep(100);
    }
  }

  public void run() {

    try {
      this.imprimirFluxo2();

    } catch (Exception e) {
    }
  }
}
