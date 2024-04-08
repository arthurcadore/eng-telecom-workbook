package engtelecom.ifsc;

public class Pessoa {

  private static int count = 0;

  private int id;
  private String nome;
  private boolean cabelo;

  public Pessoa(String nome) {
    this.nome = nome;
    this.id = ++count;
  }

  @Override
  public String toString() {

    return "Pessoa [id=" + id + ", nome=" + nome + "]";

  }

  // TODO fazer toString que retorne o ID e Nome;

}
