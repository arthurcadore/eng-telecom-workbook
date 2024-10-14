#include "requisition.h"

/*
 2 bytes     string    1 byte     string   1 byte
 ------------------------------------------------
| Opcode |  Filename  |   0  |   "octet"   |   0  |
 ------------------------------------------------

- Opcode: 1 ou 2 
- String1: Nome do arquivo
- Delimitador: 0x00 (1 byte)
- String2: octet
- Delimitador: 0x00 (1 byte)
*/

string requestMessage(int opcode, string filename, string mode) {

    string msg;
    msg += (char) (opcode >> 8);
    msg += (char) (opcode & 0xFF);
    msg += filename;
    msg += '\0';
    msg += mode;
    msg += '\0';

    // imprime a mensagem completa no terminal em hexa decimal para verificação:

    cout << "Mensagem: ";

    for (int i = 0; i < msg.size(); i++) {
        cout << hex << (int) msg[i] << " ";
    }

    cout << endl;

    return msg;
}