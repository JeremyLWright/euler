export CC=clang
export CXX=clang++
mkdir -p build
pushd build
conan install .. -s compiler=clang -s compiler.version=6.0 -s compiler.libcxx=libc++ --build=missing

