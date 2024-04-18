#include <iostream>
#include <list> 
#include <string>

using namespace std;

string junta(list<string> & l, const string & delim){

    string aux, outputString;

    if(l.empty()) return invalidInput;

    aux = l.front();
    l.pop_front();
    outputString += aux;

    while(!l.empty()){

        aux = l.front();
        l.pop_front();

        outputString += delim + aux;

    }

    return outputString;

}

int main() {
    
    list<string> input;

    string = output, sep;

    sep = "a";

	output = junta(input, sep);

 
}
