#include "interface_atendente.h"

void interface_atendente(vector<classe>& classes, list<senha>& senhas) {
  cout << "Voce escolheu a opção atendente!" << endl << endl;

  if (senhas.empty()) {
    cout << "Não há senhas para atender." << endl << endl;
    return;
  }

  time_t tempo_atual = time(NULL);
  list<senha> senhas_expiradas;

  for (auto const& senha : senhas) {
    if (senha.expiracao < tempo_atual) {
      senhas_expiradas.push_back(senha);
    }
  }

  if (!senhas_expiradas.empty()) {
    senhas_expiradas.sort(compara_senhas);

    cout << senhas_expiradas.front().senha_usuario << endl;

    for (auto it = senhas.begin(); it != senhas.end(); it++) {
      if (it->senha_usuario == senhas_expiradas.front().senha_usuario) {
        senhas.erase(it);
        break;
      }
    }

    return;
  }

  cout << senhas.front().senha_usuario << endl;

  senhas.pop_front();
}
