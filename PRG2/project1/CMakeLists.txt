cmake_minimum_required(VERSION 3.13)
project(Projeto1)

set(CMAKE_CXX_STANDARD 14)

add_executable(Projeto1 src/main.cpp src/string_to_vector.cpp src/interface_clientes.cpp src/interface_atendente.cpp src/compara_senhas.cpp src/cria_classe.cpp)