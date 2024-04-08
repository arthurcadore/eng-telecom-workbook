package engtelecom.poo;

public class OlaMundo extends Thread {

  OlaMundo novaTread;
  String name;

  public OlaMundo(String name) {
    this.name = name;

  }

  @Override
  public void run() {

    for (int i = 0; i < 2; i++) {

      String[] Vetor = this.name.split("-");

      int numero = Integer.parseInt(Vetor[1]);

      System.out.println(numero++);

      this.novaTread = new OlaMundo("Ola2");

      System.out.println("Thread " + name + " Criada!");

    }

  }

}
