// Always-on check: unlike assert, it is not compiled out by NDEBUG, and its argument is always evaluated.
#pragma once
#include <cstdio>
#include <cstdlib>
#define CHECK(cond)                                                          \
  do {                                                                       \
    if (!(cond)) {                                                           \
      std::fprintf(stderr, "CHECK failed %s:%d: %s\n", __FILE__, __LINE__, #cond); \
      std::exit(1);                                                          \
    }                                                                        \
  } while (0)
