#include <iostream>
#include <string>

#include "list.h"

using namespace std;

int main() {
  auto l1 = list_create<string>();

  cout << "Criou uma lista" << endl;

  list_insert_back<string>(l1, "coisa");

  list_insert_front<string>(l1, "embilica");

  list_insert<string>(l1, 2, "embilica");

  cout << l1.lenght << endl;

  string teste = list_get_back(l1);

  for (auto i = 0; i < l1.lenght; i++) {
    cout << list_get(l1, i) << endl;
  }

  // cout << "teste" << endl;

  return 0;
}
