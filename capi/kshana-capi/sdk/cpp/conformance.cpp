// SPDX-License-Identifier: AGPL-3.0-only
// Kshana SDK conformance driver for C++ (roadmap 0.42 I9). A small RAII wrapper (kshana::Engine) over
// include/kshana.h: every string the library returns is freed, errors become exceptions.
//
//   c++ -std=c++17 -I include sdk/cpp/conformance.cpp target/release/libkshana_capi.a -lpthread -ldl -lm
//   ./a.out <outdir> <s1.toml> <s2.toml> <s3.toml> <mapping.toml> <station.toml> <log>
#include <fstream>
#include <iostream>
#include <memory>
#include <sstream>
#include <stdexcept>
#include <string>

extern "C" {
#include "kshana.h"
}

namespace kshana {

using Owned = std::unique_ptr<char, decltype(&kshana_string_free)>;

/// Thin C++ facade over the C interface.
class Engine {
  public:
    static std::string version() { return kshana_version(); }

    static std::string run(const std::string &toml) {
        char *ok = nullptr, *err = nullptr;
        int rc = kshana_run_scenario(toml.c_str(), &ok, &err);
        return take(rc, ok, err);
    }

    static std::string map(const std::string &mapping, const std::string &station, const std::string &log) {
        char *ok = nullptr, *err = nullptr;
        int rc = kshana_connect_map(mapping.c_str(), station.c_str(), log.c_str(), &ok, &err);
        return take(rc, ok, err);
    }

  private:
    static std::string take(int rc, char *ok, char *err) {
        Owned o(ok, &kshana_string_free), e(err, &kshana_string_free);
        if (rc != KSHANA_OK || !o) {
            throw std::runtime_error("kshana error " + std::to_string(rc) + ": " + (e ? e.get() : ""));
        }
        return std::string(o.get());
    }
};

}  // namespace kshana

static std::string slurp(const char *path) {
    std::ifstream f(path, std::ios::binary);
    if (!f) throw std::runtime_error(std::string("cannot read ") + path);
    std::ostringstream s;
    s << f.rdbuf();
    return s.str();
}

static void put(const std::string &dir, const char *name, const std::string &text) {
    std::ofstream f(dir + "/" + name, std::ios::binary);
    f.write(text.data(), static_cast<std::streamsize>(text.size()));
    if (!f) throw std::runtime_error(std::string("cannot write ") + name);
}

int main(int argc, char **argv) {
    if (argc != 8) {
        std::cerr << "usage: " << argv[0] << " <outdir> <s1> <s2> <s3> <mapping> <station> <log>\n";
        return 2;
    }
    try {
        const char *names[3] = {"run-1.json", "run-2.json", "run-3.json"};
        for (int i = 0; i < 3; i++) put(argv[1], names[i], kshana::Engine::run(slurp(argv[2 + i])));
        put(argv[1], "map.jsonl", kshana::Engine::map(slurp(argv[5]), slurp(argv[6]), slurp(argv[7])));
    } catch (const std::exception &e) {
        std::cerr << e.what() << "\n";
        return 1;
    }
    std::cout << "kshana " << kshana::Engine::version() << " conformance: 4 outputs written\n";
    return 0;
}
