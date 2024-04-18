#include <fstream>
#include <iostream>
#include <list>
#include <string>
#include <vector>

#include "compara_senhas.h"
#include "cria_classe.h"
#include "errno.h"
#include "interface_atendente.h"
#include "interface_clientes.h"
#include "string_to_vector.h"
#include "time.h"
#include "tipos.h"

using namespace std;

int main(int argc, char* argv[]) {
  ifstream arq(argv[1]);

  if (!arq.is_open()) {
    perror(
        "Ao abrir arquivo, verifique se digitou o nome corretamente no "
        "argumento da linha de comando.");
    return errno;
  }

  list<senha> senhas;
  vector<classe> classes;

  string linha;
  while (getline(arq, linha)) {
    classes.push_back(cria_classe(linha));
  }

  // INICIO DO PROGRAMA

  while (true) {
    cout << endl;
    cout << "Menu" << endl << endl;
    cout << "-> Digite '1' para acesso à interface de cliente" << endl;
    cout << "-> Digite '2' para acesso à interface de atendente" << endl;

    cout << endl;

    string input_confirm;

    cin >> input_confirm;

    if (!(input_confirm == "1" || input_confirm == "2")) {
      cout << "Opção inválida, por favor, tente novamente!" << endl;
    } else {
      int input_usuario = stoi(input_confirm);

      if (input_usuario == 1)
        interface_clientes(classes, senhas);
      else if (input_usuario == 2)
        interface_atendente(classes, senhas);
    }
  }
}
