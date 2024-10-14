#ifndef MAIN_H
#define MAIN_H

#include <fstream>
#include <iostream>
#include <list>
#include <string>
#include <vector>

#include <arpa/inet.h>  // Para inet_pton
#include <netinet/in.h> // Para sockaddr_in
#include <cstring>      // Para memset

using namespace std;

sockaddr_in stringToIPv4(const std::string& ipAddress);

void download(sockaddr_in ip, int porta, string arquivo);

void upload(sockaddr_in ip, int porta, string arquivo);

int main(int argc, char* argv[]);


#endif
