#ifndef REQUISITION_H
#define REQUISITION_H

#include <fstream>
#include <iostream>
#include <list>
#include <string>
#include <vector>

#include <sys/socket.h> // Para socket
#include <arpa/inet.h>  // Para inet_pton
#include <netinet/in.h> // Para sockaddr_in
#include <cstring>      // Para memset
#include <unistd.h>     // Para close
#include <stdexcept>    // Para std::runtime_error

using namespace std;


/*
    Function to create the request message to be sent to 
    the server WRR (Write Request) and WRQ (Read Request)
*/

string requestMessage(int opcode, string filename, string mode);

#endif