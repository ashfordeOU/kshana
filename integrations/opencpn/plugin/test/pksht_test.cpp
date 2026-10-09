// SPDX-License-Identifier: GPL-3.0-or-later
// Plain-assert test of the $PKSHT parser against sentences recorded from the synthetic demo.
#include "check.h"
#include <fstream>
#include <iostream>
#include "../pksht.h"

int main(int argc, char** argv) {
  using namespace kshana;
  Trust t;
  const char* path = argc > 1 ? argv[1] : "../../signalk/test/fixtures/pksht-excerpt.nmea";
  std::ifstream f(path);
  CHECK(f.good());
  std::string l;
  int n = 0, untrusted = 0, withheld = 0, calibrating = 0;
  while (std::getline(f, l)) {
    Trust x;
    CHECK(parse_pksht(l, x));
    n++;
    if (x.band == 'U') untrusted++;
    if (x.gate == 'W') withheld++;
    if (x.band == 'C') { calibrating++; CHECK(!x.has_score); } else CHECK(x.has_score);
    if (x.band == 'U') { CHECK(x.score < 55); CHECK(!x.reasons.empty()); CHECK(x.reasons[0].monitor == "cn0-spread"); }
  }
  CHECK(n == 66 && calibrating == 3 && untrusted > 0 && withheld == untrusted);
  // corrupted checksum, wrong version, wrong talker
  std::string good = "$PKSHT,1,082640.00,54.8,U,W,cn0-spread:30.0/speed-log:14.8*58";
  CHECK(parse_pksht(good, t) && t.band == 'U' && t.gate == 'W' && t.reasons.size() == 2);
  CHECK(!parse_pksht("$PKSHT,1,082640.00,54.9,U,W,cn0-spread:30.0/speed-log:14.8*58", t));
  CHECK(!parse_pksht("$GPGGA,082640.00,5432.46891,N,01846.38384,E,0,12,1.1,18.1,M,26.5,M,,*5A", t));
  CHECK(!parse_pksht("$PKSHT,1,082640.00,54.8,X,W,*00", t));
  std::cout << "pksht ok: " << n << " sentences\n";
}
