/* SPDX-License-Identifier: MIT */
/* Oracle harness for tests/iq_gpssdrsim_cross_generator.rs.
 *
 * Built against gps-sdr-sim (MIT licence, https://github.com/osqzss/gps-sdr-sim, commit
 * 28ca29a6719475195e3aabd5930c4ed02d67190f) as a separate program; nothing of it is compiled
 * into Kshana. It repeats, with gps-sdr-sim's own functions, the channel set-up the
 * gps-sdr-sim program performs before it writes its first 0.1 s block of samples in static
 * mode with no start time given (-l, no -t, -i), and prints as JSON:
 *  - "g0_week", "g0_sec": the scenario start, the time of clock of the first valid satellite
 *    of the first ephemeris set (what gps-sdr-sim's main() uses when no -t is given);
 *  - "xyz": the receiver position llh2xyz() makes of the -l argument;
 *  - "sats": for every valid satellite of that set, the ephemeris values gps-sdr-sim parsed
 *    (17 significant digits) and its time of clock as a calendar date;
 *  - "chans": for every channel allocateChannel() opens at g0 (elevation mask 0), the state
 *    after the first computeCodePhase() at g0 + 0.1 s: the pseudorange, geometric range and
 *    look angles at g0 (rho0), the carrier and code frequencies of the first block, and the
 *    code phase, word, bit and code counters, data bit and chip at the first sample.
 * The ionosphere is disabled (ionoutc.enable = 0), as the -i option of gps-sdr-sim does.
 */
#include <stdio.h>
#include <stdlib.h>
#include "gpssim.h"

int readRinexNavAll(ephem_t eph[][MAX_SAT], ionoutc_t *ionoutc, const char *fname);
void llh2xyz(const double *llh, double *xyz);
int allocateChannel(channel_t *chan, ephem_t *eph, ionoutc_t ionoutc, gpstime_t grx, double *xyz, double elvMask);
void computeRange(range_t *rho, ephem_t eph, ionoutc_t *ionoutc, gpstime_t g, double xyz[]);
void computeCodePhase(channel_t *chan, range_t rho1, double dt);
gpstime_t incGpsTime(gpstime_t g0, double dt);
extern int allocatedSat[MAX_SAT];

static ephem_t eph[EPHEM_ARRAY_SIZE][MAX_SAT];
static channel_t chan[MAX_CHAN];

int main(int argc, char **argv)
{
	ionoutc_t ionoutc = {0};
	const char *nav = argc > 1 ? argv[1] : "brdc0010.22n";
	double llh[3] = {35.681298, 139.766247, 10.0};
	if (argc > 4) { llh[0] = atof(argv[2]); llh[1] = atof(argv[3]); llh[2] = atof(argv[4]); }
	int neph = readRinexNavAll(eph, &ionoutc, nav);
	if (neph <= 0) { fprintf(stderr, "no ephemeris read from %s\n", nav); return 1; }
	ionoutc.enable = 0;

	/* main(): llh in degrees from -l, converted to radians, then llh2xyz. */
	double llr[3] = {llh[0] / R2D, llh[1] / R2D, llh[2]};
	double xyz[3];
	llh2xyz(llr, xyz);

	/* main(): with no -t, g0 = gmin, the toc of the first valid satellite of set 0; the
	 * current set is then set 0 (|g0 - toc| < 1 h). */
	gpstime_t g0 = {0, 0.0};
	for (int sv = 0; sv < MAX_SAT; sv++)
		if (eph[0][sv].vflg == 1) { g0 = eph[0][sv].toc; break; }

	printf("{\"neph\": %d, \"g0_week\": %d, \"g0_sec\": %.17g,\n", neph, g0.week, g0.sec);
	printf("\"llh_deg\": [%.17g, %.17g, %.17g], \"xyz\": [%.17g, %.17g, %.17g],\n",
		llh[0], llh[1], llh[2], xyz[0], xyz[1], xyz[2]);

	printf("\"sats\": [\n");
	int first = 1;
	for (int sv = 0; sv < MAX_SAT; sv++) {
		if (!eph[0][sv].vflg) continue;
		const ephem_t *e = &eph[0][sv];
		printf("%s  {\"prn\": %d, \"toc_ymdhms\": [%d, %d, %d, %d, %d, %.17g],\n", first ? "" : ",\n", sv + 1,
			e->t.y, e->t.m, e->t.d, e->t.hh, e->t.mm, e->t.sec);
		printf("   \"toc_week\": %d, \"toc_sec\": %.17g, \"toe_week\": %d, \"toe_sec\": %.17g, \"iodc\": %d, \"iode\": %d,\n", e->toc.week, e->toc.sec, e->toe.week, e->toe.sec, e->iodc, e->iode);
		printf("   \"deltan\": %.17g, \"cuc\": %.17g, \"cus\": %.17g, \"cic\": %.17g, \"cis\": %.17g, \"crc\": %.17g, \"crs\": %.17g,\n", e->deltan, e->cuc, e->cus, e->cic, e->cis, e->crc, e->crs);
		printf("   \"ecc\": %.17g, \"sqrta\": %.17g, \"m0\": %.17g, \"omg0\": %.17g, \"inc0\": %.17g, \"aop\": %.17g, \"omgdot\": %.17g, \"idot\": %.17g,\n", e->ecc, e->sqrta, e->m0, e->omg0, e->inc0, e->aop, e->omgdot, e->idot);
		printf("   \"af0\": %.17g, \"af1\": %.17g, \"af2\": %.17g, \"tgd\": %.17g, \"svhlth\": %d, \"codeL2\": %d}", e->af0, e->af1, e->af2, e->tgd, e->svhlth, e->codeL2);
		first = 0;
	}
	printf("\n],\n");

	/* main(): clear the channels and the allocation flags, allocate at g0. */
	for (int i = 0; i < MAX_CHAN; i++) chan[i].prn = 0;
	for (int sv = 0; sv < MAX_SAT; sv++) allocatedSat[sv] = -1;
	allocateChannel(chan, eph[0], ionoutc, g0, xyz, 0.0);

	/* main(): the first block refreshes every channel at grx = g0 + 0.1 s. */
	gpstime_t grx = incGpsTime(g0, 0.1);
	printf("\"chans\": [\n");
	first = 1;
	for (int i = 0; i < MAX_CHAN; i++) {
		if (chan[i].prn <= 0) continue;
		int sv = chan[i].prn - 1;
		range_t rho0 = chan[i].rho0;
		double alloc_az = chan[i].azel[0], alloc_el = chan[i].azel[1];
		range_t rho;
		computeRange(&rho, eph[0][sv], &ionoutc, grx, xyz);
		computeCodePhase(&chan[i], rho, 0.1);
		printf("%s  {\"prn\": %d, \"alloc_az_rad\": %.17g, \"alloc_el_rad\": %.17g,\n", first ? "" : ",\n", chan[i].prn, alloc_az, alloc_el);
		printf("   \"rho0_range\": %.17g, \"rho0_d\": %.17g, \"rho0_az_rad\": %.17g, \"rho0_el_rad\": %.17g, \"rho0_iono\": %.17g,\n", rho0.range, rho0.d, rho0.azel[0], rho0.azel[1], rho0.iono_delay);
		printf("   \"rho1_range\": %.17g, \"rho1_d\": %.17g,\n", rho.range, rho.d);
		printf("   \"f_carr\": %.17g, \"f_code\": %.17g, \"code_phase\": %.17g,\n", chan[i].f_carr, chan[i].f_code, chan[i].code_phase);
		printf("   \"iword\": %d, \"ibit\": %d, \"icode\": %d, \"dataBit\": %d, \"codeCA\": %d}", chan[i].iword, chan[i].ibit, chan[i].icode, chan[i].dataBit, chan[i].codeCA);
		first = 0;
	}
	printf("\n]}\n");
	return 0;
}
