cmake_minimum_required(VERSION 3.5)
project (euler++)

set(Boost_USE_STATIC_LIBS ON)
set(Boost_USE_MULTITHREADED ON)
set(Boost_USE_STATIC_RUNTIME OFF)
find_package(Boost
  1.58.0)


set(RANGES_CXX_STD 1z)
set(CMAKE_CXX_FLAGS -std=c++1z)

include_directories(vendor/range-v3/include)
include_directories(vendor/primesieve-6.3/include)
include_directories(${Boost_INCLUDE_DIRS})
add_subdirectory(vendor/primesieve-6.3)


add_executable(001 src/001.cpp)
add_executable(002 src/002.cpp)
add_executable(003 src/003.cpp)
add_executable(004 src/004.cpp)
add_executable(005 src/005.cpp)

target_link_libraries(003 libprimesieve )
#target_link_libraries(005 ${Boost_LIBRARIES})
enable_testing()
add_test(Problem-001 001)
