/* SPDX-License-Identifier: AGPL-3.0-only
 * Kshana SDK conformance driver for C (roadmap 0.42 I9): runs the three conformance scenarios and the
 * connect mapping, writing each output byte for byte into <outdir>.
 *
 *   cc -std=c99 -I include sdk/c/conformance.c target/release/libkshana_capi.a -lpthread -ldl -lm -o conformance
 *   ./conformance <outdir> <s1.toml> <s2.toml> <s3.toml> <mapping.toml> <station.toml> <log>
 */
#ifndef _WIN32
#define _POSIX_C_SOURCE 200809L /* open() and fdopen() under -std=c99 */
#endif
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "kshana.h"
#ifndef _WIN32
#include <fcntl.h>
#include <sys/stat.h>
#include <unistd.h>
#endif

static char *slurp(const char *path) {
    FILE *f = fopen(path, "rb");
    if (!f) return NULL;
    if (fseek(f, 0, SEEK_END) != 0) { fclose(f); return NULL; }
    long n = ftell(f);
    if (n < 0) { fclose(f); return NULL; }
    rewind(f);
    char *buf = malloc((size_t)n + 1);
    if (buf && fread(buf, 1, (size_t)n, f) != (size_t)n) { free(buf); buf = NULL; }
    if (buf) buf[n] = '\0';
    fclose(f);
    return buf;
}

static int put(const char *dir, const char *name, const char *text) {
    char path[4096];
    snprintf(path, sizeof path, "%s/%s", dir, name);
#ifdef _WIN32
    FILE *f = fopen(path, "wb");
#else
    /* Owner read-write, everyone else read-only (0644), whatever the caller's umask allows. */
    int fd = open(path, O_WRONLY | O_CREAT | O_TRUNC, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
    if (fd < 0) return 1;
    FILE *f = fdopen(fd, "wb");
    if (!f) { close(fd); return 1; }
#endif
    if (!f) return 1;
    size_t n = strlen(text);
    int bad = fwrite(text, 1, n, f) != n;
    return fclose(f) != 0 || bad;
}

/* Hand the result to put() and free both strings; non-zero on any failure. */
static int finish(int rc, char *ok, char *err, const char *dir, const char *name) {
    int bad = rc != KSHANA_OK || !ok;
    if (bad) fprintf(stderr, "%s: %d %s\n", name, rc, err ? err : "");
    else bad = put(dir, name, ok);
    kshana_string_free(ok);
    kshana_string_free(err);
    return bad;
}

int main(int argc, char **argv) {
    if (argc != 8) {
        fprintf(stderr, "usage: %s <outdir> <s1> <s2> <s3> <mapping> <station> <log>\n", argv[0]);
        return 2;
    }
    const char *names[3] = {"run-1.json", "run-2.json", "run-3.json"};
    int failed = 0;
    for (int i = 0; i < 3; i++) {
        char *toml = slurp(argv[2 + i]), *ok = NULL, *err = NULL;
        if (!toml) { fprintf(stderr, "cannot read %s\n", argv[2 + i]); return 1; }
        int rc = kshana_run_scenario(toml, &ok, &err); /* call first: argument order is unspecified */
        failed |= finish(rc, ok, err, argv[1], names[i]);
        free(toml);
    }
    char *m = slurp(argv[5]), *s = slurp(argv[6]), *l = slurp(argv[7]), *ok = NULL, *err = NULL;
    if (!m || !s || !l) { fprintf(stderr, "cannot read the mapping inputs\n"); return 1; }
    int rc = kshana_connect_map(m, s, l, &ok, &err);
    failed |= finish(rc, ok, err, argv[1], "map.jsonl");
    free(m); free(s); free(l);
    printf("kshana %s conformance: %s\n", kshana_version(), failed ? "FAILED" : "4 outputs written");
    return failed;
}
