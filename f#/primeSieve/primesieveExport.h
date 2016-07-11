#pragma once

#if defined PRIMESIEVE_EXPORTS
#define PRIMESIEVE_EXPORT __declspec(dllexport)
#else
#define PRIMESIEVE_EXPORT __declspec(dllimport)
#endif
