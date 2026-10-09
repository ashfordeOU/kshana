// Plain-assert test of the $PKSHT parser against sentences recorded from the synthetic demo.
#include <cassert>
#include <fstream>
#include <iostream>
#include "../pksht.h"

int main(int argc, char** argv) {
  using namespace kshana;
  Trust t;
  const char* path = argc > 1 ? argv[1] : "../../signalk/test/fixtures/pksht-excerpt.nmea";
  std::ifstream f(path);
  assert(f.good());
  std::string l;
  int n = 0, untrusted = 0, withheld = 0, calibrating = 0;
  while (std::getline(f, l)) {
    Trust x;
    assert(parse_pksht(l, x));
    n++;
    if (x.band == 'U') untrusted++;
    if (x.gate == 'W') withheld++;
    if (x.band == 'C') { calibrating++; assert(!x.has_score); } else assert(x.has_score);
    if (x.band == 'U') { assert(x.score < 55); assert(!x.reasons.empty()); assert(x.reasons[0].monitor == "cn0-spread"); }
  }
  assert(n == 66 && calibrating == 3 && untrusted > 0 && withheld == untrusted);
  // corrupted checksum, wrong version, wrong talker
  std::string good = "$PKSHT,1,082640.00,54.8,U,W,cn0-spread:30.0/speed-log:14.8*58";
  assert(parse_pksht(good, t) && t.band == 'U' && t.gate == 'W' && t.reasons.size() == 2);
  assert(!parse_pksht("$PKSHT,1,082640.00,54.9,U,W,cn0-spread:30.0/speed-log:14.8*58", t));
  assert(!parse_pksht("$GPGGA,082640.00,5432.46891,N,01846.38384,E,0,12,1.1,18.1,M,26.5,M,,*5A", t));
  assert(!parse_pksht("$PKSHT,1,082640.00,54.8,X,W,*00", t));
  std::cout << "pksht ok: " << n << " sentences\n";
}
