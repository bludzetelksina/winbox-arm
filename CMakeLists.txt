cmake_minimum_required(VERSION 3.15)
project(WinBoxARM)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

find_package(Qt6 REQUIRED COMPONENTS Widgets Network LinguistTools)

add_subdirectory(src)
add_subdirectory(tests)