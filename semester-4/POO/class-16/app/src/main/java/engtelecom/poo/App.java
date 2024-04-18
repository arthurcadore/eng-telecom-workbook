package engtelecom.poo;

import engtelecom.poo.produtos.Telefone;
import engtelecom.poo.produtos.TelefoneSemFio;

public class App {

    public static void main(String[] args) {

        Double[] vector1 = { 1.0, 2.0, 3.0 };

        Telefone tel = new Telefone(01213, "testeSN", "telefone", "black", 0.5, vector1);

        System.out.println(tel.toString());

        TelefoneSemFio tel1 = new TelefoneSemFio(01213, "testeSN", "telefone", "black", 0.5, vector1, 1000.2, 1, 220.5);

        System.out.println(tel1.toString());

        Telefone c = tel1;

        ((TelefoneSemFio) c).setChannels(0);

        // TelefoneSemFio a = (TelefoneSemFio) tel;
    }
}
