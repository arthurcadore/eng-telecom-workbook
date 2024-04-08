#include "interface_clientes.h"

void interface_clientes(vector<classe>& classes, list<senha>& senhas) {
  cout << "Voce escolheu a opção cliente!" << endl << endl;

  cout << "Por favor, escolha qual seu atendimento!" << endl << endl;

  int client_input;
  do {
    while (true) {
      int count = 1;
      for (auto& classe : classes) {
        cout << "Pressione " << count << " para " << classe.descricao << endl;

        count++;
      }

      cin >> client_input;

      if (!cin.fail()) {
        cin.ignore();
        break;
      }

      cout << endl
           << "Opção inválida, por favor, tente novamente!" << endl
           << endl;
      cin.clear();
      cin.ignore();
    }

  } while (client_input > classes.size() || client_input <= 0);

  classe& classe_escolhida = classes[client_input - 1];
  classe_escolhida.contador_senhas++;

  senha nova_senha;

  nova_senha.senha_usuario =
      classe_escolhida.nome + to_string(classe_escolhida.contador_senhas);
  nova_senha.expiracao = time(NULL) + (classe_escolhida.max_espera * 60);
  nova_senha.prioridade = classe_escolhida.prioridade;

  cout << endl << nova_senha.senha_usuario << endl;

  senhas.push_back(nova_senha);

  senhas.sort(compara_senhas);
}
