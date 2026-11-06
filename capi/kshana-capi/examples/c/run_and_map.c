/* SPDX-License-Identifier: AGPL-3.0-only
 *
 * Example: run a scenario and map a receiver log from C.
 *
 *   cc -I include examples/c/run_and_map.c target/release/libkshana_capi.a -lpthread -ldl -lm -o run_and_map
 *   ./run_and_map scenario.toml mapping.toml station.toml log.csv
 *
 * Prints the version, the first 60 characters of the scenario's result, and the number of
 * observation records. Exits non-zero on any failure, printing the engine's reason.
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "kshana.h"

static char *slurp(const char *path) {
    FILE *f = fopen(path, "rb");
    if (!f) return NULL;
    fseek(f, 0, SEEK_END);
    long n = ftell(f);
    fseek(f, 0, SEEK_SET);
    char *buf = malloc((size_t)n + 1);
    if (buf && fread(buf, 1, (size_t)n, f) != (size_t)n) { free(buf); buf = NULL; }
    if (buf) buf[n] = '\0';
    fclose(f);
    return buf;
}

int main(int argc, char **argv) {
    if (argc != 5) {
        fprintf(stderr, "usage: %s <scenario.toml> <mapping.toml> <station.toml> <log>\n", argv[0]);
        return 2;
    }
    printf("kshana %s\n", kshana_version());

    char *scenario = slurp(argv[1]);
    char *json = NULL, *err = NULL;
    int rc = kshana_run_scenario(scenario, &json, &err);
    if (rc != KSHANA_OK) {
        fprintf(stderr, "run failed (%d): %s\n", rc, err ? err : "?");
        kshana_string_free(err);
        free(scenario);
        return 1;
    }
    printf("result: %.60s...\n", json);
    kshana_string_free(json);
    free(scenario);

    char *mapping = slurp(argv[2]), *station = slurp(argv[3]), *log = slurp(argv[4]);
    char *jsonl = NULL;
    rc = kshana_connect_map(mapping, station, log, &jsonl, &err);
    if (rc != KSHANA_OK) {
        fprintf(stderr, "map failed (%d): %s\n", rc, err ? err : "?");
        kshana_string_free(err);
        return 1;
    }
    size_t records = 0;
    for (const char *p = jsonl; *p; p++) records += (*p == '\n');
    printf("records: %zu\n", records);
    kshana_string_free(jsonl);
    free(mapping);
    free(station);
    free(log);

    /* A refused input: a null scenario is a bad argument, and the error string says so. */
    rc = kshana_run_scenario(NULL, &json, &err);
    printf("null scenario: %d (%s)\n", rc, err ? "with reason" : "no reason");
    kshana_string_free(err);
    kshana_string_free(json);
    return rc == KSHANA_BAD_ARGUMENT ? 0 : 1;
}
