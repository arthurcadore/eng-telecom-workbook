cmake_minimum_required(VERSION 3.13)
project(deque)

set(CMAKE_CXX_STANDARD 14)

add_executable(deque src/main.cpp src/fila_circular.h src/fila_circular_impl.h src/deque.h src/deque_impl.h src/tipos_impl.h src/medias_impl.h) 

add_custom_target(run

COMMAND deque
DEPENDS deque
WORKING_DIRECTORY ${CMAKE_PROJECT_DIR})