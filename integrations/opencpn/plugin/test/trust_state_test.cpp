// SPDX-License-Identifier: GPL-3.0-or-later
// Panel state over the recorded synthetic $PKSHT excerpt (calibrating, nominal, degraded, untrusted).
#include "check.h"
#include <fstream>
#include <iostream>
#include <vector>
#include "../trust_state.h"

int main(int argc, char** argv) {
  using namespace kshana;
  const char* path = argc > 1 ? argv[1] : "../../signalk/test/fixtures/pksht-excerpt.nmea";
  std::ifstream f(path);
  CHECK(f.good());
  std::vector<std::string> lines;
  for (std::string l; std::getline(f, l);) lines.push_back(l);
  CHECK(lines.size() == 66);

  {  // default config: warn on degraded, alarm on untrusted, edge reported once
    TrustState s;
    CHECK(s.level(0) == Level::Waiting && !s.has_data());
    CHECK(!s.feed("$GPGGA,082640.00,5432.46891,N,01846.38384,E,1,12,1.1,18.1,M,26.5,M,,*5B", 0));
    CHECK(!s.has_data());
    double t = 0;
    int edges = 0;
    bool saw_warn = false;
    for (auto& l : lines) {
      CHECK(s.feed(l, t));
      if (s.level(t) == Level::Warn) saw_warn = true;
      if (s.take_alarm_edge()) edges++;
      t += 1.0;
    }
    CHECK(saw_warn && edges == 1);
    CHECK(s.level(t) == Level::Alarm && s.last().gate == 'W' && s.last().score < 55);
    CHECK(!s.last().reasons.empty());
  }
  {  // raise_after delays the alarm; the first two untrusted sentences do not raise it
    PanelConfig c; c.raise_after = 3;
    TrustState s(c);
    double t = 0;
    int first_u = -1, edge_at = -1, i = 0;
    for (auto& l : lines) {
      Trust x; parse_pksht(l, x);
      if (x.band == 'U' && first_u < 0) first_u = i;
      s.feed(l, t); t += 1;
      if (s.take_alarm_edge() && edge_at < 0) edge_at = i;
      i++;
    }
    CHECK(first_u > 0 && edge_at == first_u + 2);
  }
  {  // clear_after holds the alarm over a short return to nominal
    TrustState s;
    s.feed("$PKSHT,1,082640.00,54.8,U,W,cn0-spread:30.0/speed-log:14.8*58", 0);
    CHECK(s.level(0) == Level::Alarm);
    unsigned cs = 0; std::string body = "PKSHT,1,082641.00,100.0,N,P,";
    for (char ch : body) cs ^= (unsigned char)ch;
    char buf[8]; std::snprintf(buf, sizeof buf, "%02X", cs);
    std::string n = std::string("$") + body + "*" + buf;
    for (int k = 1; k < 10; k++) { CHECK(s.feed(n, k)); CHECK(s.level(k) == Level::Alarm); }
    CHECK(s.feed(n, 10) && s.level(10) == Level::Normal);
  }
  {  // stale: no sentence for stale_after_s
    TrustState s;
    s.feed("$PKSHT,1,082640.00,54.8,U,W,cn0-spread:30.0/speed-log:14.8*58", 100);
    CHECK(s.level(105) == Level::Alarm);
    CHECK(s.level(111) == Level::Stale);
    CHECK(s.age_s(111) == 11);
  }
  std::cout << "trust_state ok\n";
}
