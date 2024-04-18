public class divisionRemainder {

  public static void main(String[] args) {

    int argOne = Integer.parseInt(args[0]);

    int argTwo = Integer.parseInt(args[1]);

    if (argOne % argTwo == 0) {

      System.out.println(argOne + " it's divisible by " + argTwo);
    } else {

      System.out.println(argOne + " it's not divisible by " + argTwo);
    }

  }

}
