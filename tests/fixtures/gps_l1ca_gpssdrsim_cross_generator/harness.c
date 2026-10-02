/* SPDX-License-Identifier: MIT */
/* Oracle harness for tests/gps_l1ca_gpssdrsim_cross_generator.rs.
 *
 * Built against gps-sdr-sim (MIT licence, https://github.com/osqzss/gps-sdr-sim, commit
 * 28ca29a6719475195e3aabd5930c4ed02d67190f) as a separate program; nothing of it is compiled
 * into Kshana. It calls gps-sdr-sim's own functions and prints, as JSON:
 *  - "ca": codegen() for PRN 1..32, 1023 chips each, as gps-sdr-sim stores them (0 or 1);
 *  - "sats": for every valid satellite of the first ephemeris set readRinexNavAll() returns
 *    from the bundled brdc0010.22n, the ephemeris values gps-sdr-sim parsed (printed with 17
 *    significant digits), the transmission time, and the 60 transmitted 30-bit words
 *    generateNavMsg(g, &chan, 1) leaves in chan.dwrd after eph2sbf(): words 0..9 are the
 *    previous subframe 5, words 10..59 subframes 1..5.
 * The transmission time g is the t_oe of the first valid satellite of that set.
 */
#include <stdio.h>
#include "gpssim.h"

int readRinexNavAll(ephem_t eph[][MAX_SAT], ionoutc_t *ionoutc, const char *fname);
void eph2sbf(const ephem_t eph, const ionoutc_t ionoutc, unsigned long sbf[5][N_DWRD_SBF]);
int generateNavMsg(gpstime_t g, channel_t *chan, int init);
void codegen(int *ca, int prn);

static ephem_t eph[EPHEM_ARRAY_SIZE][MAX_SAT];

int main(int argc, char **argv)
{
	ionoutc_t ionoutc = {0};
	const char *nav = argc > 1 ? argv[1] : "brdc0010.22n";
	int neph = readRinexNavAll(eph, &ionoutc, nav);
	if (neph <= 0) { fprintf(stderr, "no ephemeris read from %s\n", nav); return 1; }
	ionoutc.enable = 1;
	printf("{\"neph\": %d,\n\"ca\": [\n", neph);
	for (int prn = 1; prn <= 32; prn++) {
		int ca[CA_SEQ_LEN];
		codegen(ca, prn);
		printf("  [");
		for (int i = 0; i < CA_SEQ_LEN; i++) printf("%d%s", ca[i], i + 1 < CA_SEQ_LEN ? "," : "");
		printf("]%s\n", prn < 32 ? "," : "");
	}
	printf("],\n\"sats\": [\n");
	gpstime_t g = {0, 0.0};
	int first = 1;
	for (int sv = 0; sv < MAX_SAT; sv++) {
		if (!eph[0][sv].vflg) continue;
		if (first) g = eph[0][sv].toe;
		channel_t chan = {0};
		chan.prn = sv + 1;
		eph2sbf(eph[0][sv], ionoutc, chan.sbf);
		generateNavMsg(g, &chan, 1);
		const ephem_t *e = &eph[0][sv];
		printf("%s  {\"prn\": %d, \"g_week\": %d, \"g_sec\": %.17g, \"g0_sec\": %.17g,\n", first ? "" : ",\n", sv + 1, g.week, g.sec, chan.g0.sec);
		printf("   \"toc_week\": %d, \"toc_sec\": %.17g, \"toe_week\": %d, \"toe_sec\": %.17g, \"iodc\": %d, \"iode\": %d,\n", e->toc.week, e->toc.sec, e->toe.week, e->toe.sec, e->iodc, e->iode);
		printf("   \"deltan\": %.17g, \"cuc\": %.17g, \"cus\": %.17g, \"cic\": %.17g, \"cis\": %.17g, \"crc\": %.17g, \"crs\": %.17g,\n", e->deltan, e->cuc, e->cus, e->cic, e->cis, e->crc, e->crs);
		printf("   \"ecc\": %.17g, \"sqrta\": %.17g, \"m0\": %.17g, \"omg0\": %.17g, \"inc0\": %.17g, \"aop\": %.17g, \"omgdot\": %.17g, \"idot\": %.17g,\n", e->ecc, e->sqrta, e->m0, e->omg0, e->inc0, e->aop, e->omgdot, e->idot);
		printf("   \"af0\": %.17g, \"af1\": %.17g, \"af2\": %.17g, \"tgd\": %.17g, \"svhlth\": %d, \"codeL2\": %d,\n", e->af0, e->af1, e->af2, e->tgd, e->svhlth, e->codeL2);
		printf("   \"dwrd\": [");
		for (int i = 0; i < N_DWRD; i++) printf("%lu%s", chan.dwrd[i] & 0x3FFFFFFFUL, i + 1 < N_DWRD ? "," : "");
		printf("]}");
		first = 0;
	}
	printf("\n]}\n");
	return 0;
}
