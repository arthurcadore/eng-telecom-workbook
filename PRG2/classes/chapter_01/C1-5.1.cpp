#include <iostream>
#include <string>
#include <stack>

using namespace std; 

int main(int agrc, char* argv[]){

    string input, output; 
    
    input = argv[1];
    
    stack<char> pile; 

    for(int i =0; i <input.size(); i++){

        pile.push(input[i]);

    }

    while(! pile.empty()){
 
        output += pile.top();

        pile.pop();
    }
    if(output == input) cout << "VERDADEIRO" << endl;

    else cout << "FALSO" << endl;

}