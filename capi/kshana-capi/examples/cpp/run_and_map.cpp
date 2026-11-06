// SPDX-License-Identifier: AGPL-3.0-only
//
// Example: the Kshana C interface from C++17, with RAII so every returned string is freed.
//
//   c++ -std=c++17 -I include examples/cpp/run_and_map.cpp target/release/libkshana_capi.a -lpthread -ldl -lm -o run_and_map_cpp
//   ./run_and_map_cpp scenario.toml mapping.toml station.toml log.csv
#include <algorithm>
#include <fstream>
#include <iostream>
#include <memory>
#include <sstream>
#include <string>

#include "kshana.h"

namespace {

// A string returned by the library, freed with kshana_string_free.
using KString = std::unique_ptr<char, decltype(&kshana_string_free)>;
KString own(char *p) { return KString(p, &kshana_string_free); }

std::string slurp(const char *path) {
    std::ifstream f(path, std::ios::binary);
    std::stringstream s;
    s << f.rdbuf();
    return s.str();
}

}  // namespace

int main(int argc, char **argv) {
    if (argc != 5) {
        std::cerr << "usage: " << argv[0] << " <scenario.toml> <mapping.toml> <station.toml> <log>\n";
        return 2;
    }
    std::cout << "kshana " << kshana_version() << "\n";

    const std::string scenario = slurp(argv[1]);
    char *json = nullptr, *err = nullptr;
    int rc = kshana_run_scenario(scenario.c_str(), &json, &err);
    auto json_s = own(json), err_s = own(err);
    if (rc != KSHANA_OK) {
        std::cerr << "run failed (" << rc << "): " << (err ? err : "?") << "\n";
        return 1;
    }
    std::cout << "result: " << std::string(json).substr(0, 60) << "...\n";

    const std::string mapping = slurp(argv[2]), station = slurp(argv[3]), log = slurp(argv[4]);
    char *jsonl = nullptr;
    rc = kshana_connect_map(mapping.c_str(), station.c_str(), log.c_str(), &jsonl, &err);
    auto jsonl_s = own(jsonl), err2 = own(err);
    if (rc != KSHANA_OK) {
        std::cerr << "map failed (" << rc << "): " << (err ? err : "?") << "\n";
        return 1;
    }
    const std::string records(jsonl);
    std::cout << "records: " << std::count(records.begin(), records.end(), '\n') << "\n";

    rc = kshana_run_scenario(nullptr, &json, &err);
    auto j3 = own(json), e3 = own(err);
    std::cout << "null scenario: " << rc << " (" << (err ? "with reason" : "no reason") << ")\n";
    return rc == KSHANA_BAD_ARGUMENT ? 0 : 1;
}
