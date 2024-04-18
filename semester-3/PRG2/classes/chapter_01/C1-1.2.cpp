#include <iostream>
#include <string>

using namespace std;

int main(int argc, char *argv[]) {
   
   cout << " ";

    for (int i = 1; i < argc; i++) {
        if (i == argc - 1) {
                cout << argv[i];
            }
         else {
            cout << argv[i] << " ";
        }
    }
}