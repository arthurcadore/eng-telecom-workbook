package engtelecom.poo;

public class App {

    private Contador contador = new Contador();

    public static void main(String[] args) {

        // App app = new App();

        // Thread f1 = new Fluxo1();
        // Thread f2 = new Thread(new Fluxo2());

        // System.err.println("Iniciando o programa");

        // f1.start();
        // f2.start();

        // try {

        // f1.join();
        // f2.join();
        // } catch (Exception e) {
        // }

        // System.err.println("Fim do programada");

        OlaMundo test = new OlaMundo("Ola-1");
        test.run();


    }
}
