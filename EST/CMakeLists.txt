
# Author: Arhur Cadore M. Barcella

# GitHub: arthurcadore

# This file contains the CMakeLists.txt of the project.

# This code is responsible for compiling the project.

cmake_minimum_required(VERSION 3.13)
project(dataAnalysis)

set(CMAKE_CXX_STANDARD 11)
include_directories(.)

add_executable(dataAnalysis src/main.cpp src/archiveReader.cpp)

add_custom_target(run
    COMMAND dataAnalysis
    DEPENDS dataAnalysis
    WORKING_DIRECTORY ${CMAKE_PROJECT_DIR}
)