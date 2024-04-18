#include <fstream>
#include <iostream>
#include <list>
#include <string>

using namespace std;

void insere_ordenado(list<float> & l, const float & algo){

if (algo > l.back()) l.push_back(algo);
  else {   
    for (auto it=l.begin(); it != l.end(); it++) {
      if (*it > algo) {
        l.insert(it, algo);
        break;
      }
    }
  }

}

int main() {
  list<int> l = {4, 8, 15, 16, 23, 42, 108};

  int n;
  
  cout << "Digite um número: ";
  cin >> n;

  insere_ordenado(l, n);
}