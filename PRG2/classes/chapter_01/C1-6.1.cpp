#include <iostream>
#include <list> 
#include <string>
#include <cstdlib>

using namespace std;

bool ordenada(const list<int> & integerList){

int aux = 0;

if(integerList.empty() || integerList.size() == 1) return true;

for(auto &valueLoop: integerList){

 	if(valueLoop < aux) return false;

	else aux = valueLoop;
}
return true;
}

int main() {
    
    list<int> integer;

    int inputAux;
 
    bool output;

	for(int i =0; i < 10; i++){

	inputAux = rand();

	cout << inputAux << endl;

	integer.push_front(inputAux);

         }

	output = ordenada(integer);

	if(output) cout << "É VERDADE" << endl;

	else cout << "EMBILICA" << endl;

 
}