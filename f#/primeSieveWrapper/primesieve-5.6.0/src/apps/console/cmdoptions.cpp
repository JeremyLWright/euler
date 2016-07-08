///
/// @file   cmdoptions.cpp
/// @brief  Parse command-line options for the primesieve console
///         (terminal) application.
///
/// Copyright (C) 2015 Kim Walisch, <kim.walisch@gmail.com>
///
/// This file is distributed under the BSD License. See the COPYING
/// file in the top level directory.
///

#include <primesieve.hpp>
#include "cmdoptions.hpp"
#include "calculator.hpp"

#include <string>
#include <map>
#include <exception>
#include <cstdlib>
#include <cstddef>
#include <stdint.h>

void help();
void version();

using namespace std;
using namespace primesieve;

namespace {

/// e.g. id = "--threads", value = "4"
struct Option
{
  string id;
  string value;
  template <typename T>
  T getValue() const
  {
    return calculator::eval<T>(value);
  }
};

enum OptionValues
{
  OPTION_COUNT,
  OPTION_HELP,
  OPTION_NTHPRIME,
  OPTION_NUMBER,
  OPTION_DISTANCE,
  OPTION_PRINT,
  OPTION_QUIET,
  OPTION_SIZE,
  OPTION_TEST,
  OPTION_THREADS,
  OPTION_TIME,
  OPTION_VERSION
};

/// Command-line options
map<string, OptionValues> optionMap;

void initOptionMap()
{
  optionMap["-c"]         = OPTION_COUNT;
  optionMap["--count"]    = OPTION_COUNT;
  optionMap["-h"]         = OPTION_HELP;
  optionMap["--help"]     = OPTION_HELP;
  optionMap["-n"]         = OPTION_NTHPRIME;
  optionMap["--nthprime"] = OPTION_NTHPRIME;
  optionMap["--number"]   = OPTION_NUMBER;
  optionMap["-d"]         = OPTION_DISTANCE;
  optionMap["--dist"]     = OPTION_DISTANCE;
  optionMap["-o"]         = OPTION_DISTANCE;
  optionMap["--offset"]   = OPTION_DISTANCE;
  optionMap["-p"]         = OPTION_PRINT;
  optionMap["--print"]    = OPTION_PRINT;
  optionMap["-q"]         = OPTION_QUIET;
  optionMap["--quiet"]    = OPTION_QUIET;
  optionMap["-s"]         = OPTION_SIZE;
  optionMap["--size"]     = OPTION_SIZE;
  optionMap["--test"]     = OPTION_TEST;
  optionMap["-t"]         = OPTION_THREADS;
  optionMap["--threads"]  = OPTION_THREADS;
  optionMap["--time"]     = OPTION_TIME;
  optionMap["-v"]         = OPTION_VERSION;
  optionMap["--version"]  = OPTION_VERSION;
}

void test()
{
  bool ok = primesieve_test();
  exit(ok ? 0 : 1);
}

int check(int primeType)
{
  primeType--;

  if (primeType < 0 ||
      primeType > 5)
    help();

  return primeType;
}

int getCountFlags(int n)
{
  int flags = 0;

  do {
    int primeType = check(n % 10);
    flags |= PrimeSieve::COUNT_PRIMES << primeType;
    n /= 10;
  } while (n > 0);

  return flags;
}

int getPrintFlags(int n)
{
  return PrimeSieve::PRINT_PRIMES << check(n);
}

/// e.g. "--threads=8" -> (id = "--threads", value = "8")
Option makeOption(const string& str)
{
  Option option;
  size_t delimiter = str.find_first_of("=0123456789");

  if (delimiter == string::npos)
    option.id = str;
  else
  {
    option.id = str.substr(0, delimiter);
    option.value = str.substr(delimiter + (str.at(delimiter) == '=' ? 1 : 0));
  }

  if (option.id.empty() && !option.value.empty())
    option.id = "--number";
  if (optionMap.count(option.id) == 0)
    option.id = "--help";

  return option;
}

} // end namespace

PrimeSieveOptions parseOptions(int argc, char** argv)
{
  initOptionMap();
  PrimeSieveOptions pso;

  try
  {
    for (int i = 1; i < argc; i++)
    {
      Option option = makeOption(argv[i]);

      switch (optionMap[option.id])
      {
        case OPTION_COUNT:    if (option.value.empty())
                                option.value = "1";
                              pso.flags |= getCountFlags(option.getValue<int>());
                              break;
        case OPTION_PRINT:    if (option.value.empty())
                                option.value = "1";
                              pso.flags |= getPrintFlags(option.getValue<int>());
                              pso.quiet = true;
                              break;
        case OPTION_SIZE:     pso.sieveSize = option.getValue<int>(); break;
        case OPTION_THREADS:  pso.threads = option.getValue<int>(); break;
        case OPTION_QUIET:    pso.quiet = true; break;
        case OPTION_NTHPRIME: pso.nthPrime = true; break;
        case OPTION_TIME:     pso.time = true; break;
        case OPTION_NUMBER:   pso.numbers.push_back(option.getValue<uint64_t>()); break;
        case OPTION_DISTANCE: pso.numbers.push_back(option.getValue<uint64_t>() + pso.numbers.front()); break;
        case OPTION_TEST:     test(); break;
        case OPTION_VERSION:  version(); break;
        case OPTION_HELP:     help(); break;
      }
    }
  }
  catch (exception&)
  {
    help();
  }

  if (pso.numbers.size() < 1 ||
      pso.numbers.size() > 2)
    help();

  if (!pso.quiet)
    pso.time = true;

  return pso;
}
