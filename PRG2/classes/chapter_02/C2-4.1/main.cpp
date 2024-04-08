#include "main.h"
#include <fstream>

using std::ofstream;

arvore<string> cria_arvore() {
    arvore<string> arv;

    arv.adiciona("mar");
    arv.adiciona("ferias");
    arv.adiciona("areia");
    arv.adiciona("luz");
    arv.adiciona("praia");
    arv.adiciona("onda");
    arv.adiciona("sol");

    auto desenho = desenha_arvore(arv);
    ofstream out("arvore.dot");
    out << desenho;
    out.close();

    return arv;
}