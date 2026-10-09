// $PKSHT parser for the Kshana score panel. Header-only, C++11, no wxWidgets and no OpenCPN
// headers, so it builds and is tested on its own. Advisory software, not type-approved equipment.
#pragma once
#include <cstdlib>
#include <string>
#include <vector>

namespace kshana {

struct Reason { std::string monitor; double points; };

struct Trust {
  std::string time;   // hhmmss.ss, may be empty
  bool has_score = false;
  double score = 0;   // 0..100
  char band = 'C';    // C calibrating, N nominal, D degraded, U untrusted
  char gate = '-';    // - off, P passed, W withheld
  std::vector<Reason> reasons;
};

inline std::string split_field(const std::string& s, size_t& pos) {
  size_t e = s.find(',', pos);
  std::string f = s.substr(pos, e == std::string::npos ? std::string::npos : e - pos);
  pos = e == std::string::npos ? s.size() + 1 : e + 1;
  return f;
}

// Returns true and fills `out` for a valid `$PKSHT,1,...*CS` sentence (checksum checked, format
// version 1 only).
inline bool parse_pksht(const std::string& line, Trust& out) {
  std::string s = line;
  while (!s.empty() && (s.back() == '\r' || s.back() == '\n' || s.back() == ' ')) s.pop_back();
  if (s.size() < 8 || s[0] != '$') return false;
  size_t star = s.rfind('*');
  if (star == std::string::npos || star + 3 != s.size()) return false;
  unsigned cs = 0;
  for (size_t i = 1; i < star; i++) cs ^= static_cast<unsigned char>(s[i]);
  char* endp = nullptr;
  unsigned want = std::strtoul(s.substr(star + 1).c_str(), &endp, 16);
  if (*endp != '\0' || cs != want) return false;
  std::string body = s.substr(1, star - 1);
  size_t pos = 0;
  if (split_field(body, pos) != "PKSHT") return false;
  if (split_field(body, pos) != "1") return false;
  Trust t;
  t.time = split_field(body, pos);
  std::string sc = split_field(body, pos);
  std::string band = split_field(body, pos);
  std::string gate = split_field(body, pos);
  if (band.size() != 1 || std::string("CNDU").find(band[0]) == std::string::npos) return false;
  if (gate.size() != 1 || std::string("-PW").find(gate[0]) == std::string::npos) return false;
  t.band = band[0];
  t.gate = gate[0];
  if (!sc.empty()) { t.has_score = true; t.score = std::atof(sc.c_str()); }
  if (pos <= body.size()) {
    std::string rs = body.substr(pos);
    size_t p = 0;
    while (p <= rs.size() && !rs.empty()) {
      size_t e = rs.find('/', p);
      std::string r = rs.substr(p, e == std::string::npos ? std::string::npos : e - p);
      size_t c = r.rfind(':');
      if (c != std::string::npos) t.reasons.push_back({r.substr(0, c), std::atof(r.c_str() + c + 1)});
      if (e == std::string::npos) break;
      p = e + 1;
    }
  }
  out = t;
  return true;
}

}  // namespace kshana
