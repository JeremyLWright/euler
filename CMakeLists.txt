cmake_minimum_required(VERSION 3.5)
project (euler++)

set(RANGES_CXX_STD 1z)
set(CMAKE_CXX_FLAGS -std=c++1z)

include_directories(vendor/range-v3/include)



add_executable(001 src/001.cpp)
add_executable(002 src/002.cpp)
enable_testing()
add_test(Problem-001 001)
