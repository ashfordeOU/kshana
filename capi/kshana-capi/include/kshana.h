/* SPDX-License-Identifier: AGPL-3.0-only
 *
 * kshana.h: C interface to the Kshana PNT-resilience engine (kshana-capi).
 *
 * Link with libkshana_capi.a (static; also link -lpthread -ldl -lm on Linux) or libkshana_capi.so /
 * .dylib / .dll (shared). Every function is safe to call from several threads at once.
 *
 * Strings in: NUL-terminated UTF-8. A null pointer, invalid UTF-8 or an input larger than
 * KSHANA_MAX_INPUT_BYTES returns KSHANA_BAD_ARGUMENT.
 * Strings out: always written (NULL when there is nothing), owned by the caller, and freed only with
 * kshana_string_free. Freeing NULL is allowed.
 *
 * Advisory software, not type-approved navigation or timing equipment.
 */
#ifndef KSHANA_H
#define KSHANA_H

#ifdef __cplusplus
extern "C" {
#endif

#define KSHANA_OK 0           /* success */
#define KSHANA_ERROR 1        /* the engine refused the input; see the error string */
#define KSHANA_BAD_ARGUMENT 2 /* a null pointer, non-UTF-8 text, or an input over the cap */
#define KSHANA_INTERNAL 3     /* an internal failure; please report it */

#define KSHANA_MAX_INPUT_BYTES (64u << 20)

/* The engine version, a static string: do not free it. */
const char *kshana_version(void);

/* Run one scenario (TOML). On KSHANA_OK, *out_json is the result document (JSON). */
int kshana_run_scenario(const char *scenario_toml, char **out_json, char **out_err);

/* Check one scenario without running it. On KSHANA_OK, *out_json is a JSON array of problems
 * (empty when the scenario is valid). */
int kshana_validate_scenario(const char *scenario_toml, char **out_json, char **out_err);

/* Kshana Connect: apply a kshana.connect/1 mapping (TOML) to a log's text for a station (TOML).
 * On KSHANA_OK, *out_jsonl holds the kshana.obs/1 records, one JSON object per line. */
int kshana_connect_map(const char *mapping_toml, const char *station_toml, const char *log_text,
                       char **out_jsonl, char **out_err);

/* Free a string returned by this library. NULL is ignored. */
void kshana_string_free(char *s);

#ifdef __cplusplus
}
#endif

#endif /* KSHANA_H */
