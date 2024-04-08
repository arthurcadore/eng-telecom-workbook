public class Primeira {

    public static void main(String[] args) {

        // receba dois argumentos de linha de comando.
        // dois inteiros, faça a soma e imprima o resultado.
        // recebe também um operador.

        if(args.length == 3){

            int valor1 = Integer.parseInt(args[0]);
            String operando = args[1];
            int valor2 = Integer.parseInt(args[2]);

            double resultado = 0;

            switch (operando){

                case "+":

                     resultado = valor1 + valor2;

                    break;

                case "-":

                    resultado = valor1 - valor2;

                    break;

                case "x":

                    resultado = (valor1 * valor2);

                    break;

                case "/":

                     resultado = ((double) valor1 / valor2);

                    break;
            }

            System.out.println(resultado);

        }else {

            System.out.println("por favor, insira três argumentos de linha de comando!");

        }
    }
}



































































































































































