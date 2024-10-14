cmake_minimum_required(VERSION 3.13)
project(tftpclient)

set(CMAKE_CXX_STANDARD 14)

# Define o diretório de saída para o binário
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/out)

add_executable(tftpclient app/main.cpp app/main.h) 

add_custom_target(run
    COMMAND tftpclient
    DEPENDS tftpclient
    
  # Define o diretório de trabalho para ./out
    WORKING_DIRECTORY ${CMAKE_BINARY_DIR}/out
)
