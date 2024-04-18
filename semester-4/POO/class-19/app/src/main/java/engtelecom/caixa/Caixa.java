package engtelecom.caixa;

public class Caixa<T> {

  private T dado;

  public void set(T obj) {

    this.dado = obj;

  }

  public T getDado() {

    return this.dado;
  }
}
