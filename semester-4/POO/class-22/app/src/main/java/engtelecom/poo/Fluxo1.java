package engtelecom.poo;

public class Fluxo1 extends Thread {

  public void imprimirFluxo1() throws InterruptedException {

    for (int i = 0; i < 10; i++) {

      System.err.println("Fluxo1 : " + i);
      Thread.sleep(100);
    }
  }

  @Override
  public void run() {

    try {
      this.imprimirFluxo1();

    } catch (Exception e) {
    }
  }

}
