#include <fstream>
#include <iostream>
#include <list>
#include <string>

using namespace std;

list<int> mescla(const list<int> & l1, const list<int> & l2){

list<int> aux = l1;

for (auto it=l2.begin(); it != l2.end(); it++) aux.push_back(*it);
aux.sort();

return aux;
}

int main() {
  list<int> list1, list2; 

  mescla(list1, list2);
}