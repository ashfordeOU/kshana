/* SPDX-License-Identifier: AGPL-3.0-only
 *
 * RTKLIB external-oracle driver for kshana RINEX broadcast-ephemeris ->
 * satellite-ECEF-position validation.
 *
 * Oracle:  RTKLIB (T. Takasu) library version "2.4.2", patch level p13,
 *          git tag v2.4.2-p13, commit 71db0ffa0d9735697c6adfd06fdf766d0e5ce807
 *          (2018-01-30). github.com/tomojitakasu/RTKLIB. BSD-2-Clause + two
 *          non-commercial/non-exclusivity clauses (see NOTICE).
 *
 * This driver links against RTKLIB's ACTUAL C functions:
 *   - readrnx()  (src/rinex.c)     : parse a RINEX 3 navigation file into a
 *                                     nav_t of eph_t broadcast records, using
 *                                     RTKLIB's own field decoding (decode_eph).
 *   - eph2pos()  (src/ephemeris.c) : the IS-GPS-200 §20.3.3.4.3 / Galileo OS
 *                                     SIS ICD / BeiDou OS SIS ICD broadcast
 *                                     Keplerian-to-ECEF user algorithm, with
 *                                     RTKLIB's per-system mu and Earth-rate
 *                                     constants (MU_GPS=3.9860050E14,
 *                                     MU_GAL=MU_CMP=3.986004418E14,
 *                                     OMGE_GAL=7.2921151467E-5,
 *                                     OMGE_CMP=7.292115E-5).
 *   - gpst2time()/timeadd()/timediff()/satsys()/satno2id() : the time and
 *     satellite-id primitives (src/rtkcmn.c).
 *
 * Compiled with -ULAPACK so the pure-C path is used (no BLAS/LAPACK).
 *
 * INDEPENDENCE / WHAT IS VALIDATED:
 *   Both sides read the IDENTICAL vendored RINEX file (brdc_multignss_slice.rnx).
 *   RTKLIB parses it with its own RINEX decoder and evaluates positions with its
 *   own, separately-authored implementation of the broadcast user algorithm.
 *   kshana parses the same bytes with kshana::rinex::parse_nav and evaluates with
 *   kshana::rinex::RinexEphemeris::sv_position_ecef. Agreement is therefore a
 *   genuine cross-implementation check of the parser + the Kepler/harmonic/
 *   ECEF-rotation position algorithm against an independent IS-GPS-200 codebase.
 *
 * TIME-BASE NOTE (why we drive eph2pos by tk, not by absolute ToW):
 *   The thing under test is the POSITION algorithm, i.e. the map from
 *   (ephemeris, tk = t - toe) to ECEF, where tk is the time from the ephemeris
 *   reference epoch. RTKLIB and kshana keep slightly different time bookkeeping
 *   around that map: RTKLIB converts BeiDou BDT->GPST on read (toe shifts by the
 *   14 s BDT-GPST offset and the BDT->GPS week offset), whereas kshana keeps
 *   BeiDou's toe in BDT week/seconds. To isolate the position algorithm from this
 *   benign time-system bookkeeping, this driver evaluates each ephemeris at a set
 *   of tk OFFSETS relative to that ephemeris's own toe: it passes RTKLIB
 *   timeadd(eph->toe, tk), and the Rust side evaluates kshana at eph.toe + tk.
 *   Both then compute exactly the same tk, so the comparison is apples-to-apples
 *   on the quantity being validated. (For GPS/Galileo, where toe is already GPST,
 *   eph.toe + tk is simply the absolute ToW anyway.)
 *
 * Emits one fixture line per (ephemeris, tk):
 *   <sysid> <prn> <toes> <iode> <tk> <X> <Y> <Z>
 * where sysid is the RINEX system letter (G/E/J/C), toes is the ephemeris toe
 * seconds-in-week (the matching key), iode the issue-of-data, tk the offset (s),
 * and X,Y,Z the RTKLIB eph2pos ECEF position (m), each to 17 significant digits.
 */
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include "rtklib.h"

/* RTKLIB requires these two globals to be defined by the application. */
int    showmsg(char *format, ...)        { (void)format; return 0; }
void   settspan(gtime_t ts, gtime_t te)  { (void)ts; (void)te; }
void   settime (gtime_t time)            { (void)time; }

/* tk offsets (s) from each ephemeris's toe at which to sample the orbit.
 * GPS/Galileo/BeiDou broadcast records are nominally valid for a couple of
 * hours either side of toe; we stay safely inside +/- 1 h. */
static const double TK[] = {
    -3600.0, -1800.0, -600.0, 0.0, 600.0, 1800.0, 3600.0
};
static const int NTK = (int)(sizeof(TK) / sizeof(TK[0]));

int main(int argc, char **argv)
{
    if (argc < 2) {
        fprintf(stderr, "usage: %s <rinex_nav_file>\n", argv[0]);
        return 2;
    }
    nav_t nav = {0};
    obs_t obs = {0};
    sta_t sta = {0};

    /* rcv=0 selects navigation data; opt NULL = defaults. */
    if (readrnx(argv[1], 0, "", &obs, &nav, &sta) < 0) {
        fprintf(stderr, "readrnx failed on %s\n", argv[1]);
        return 3;
    }
    if (nav.n <= 0) {
        fprintf(stderr, "no Keplerian ephemerides parsed from %s\n", argv[1]);
        return 4;
    }

    for (int k = 0; k < nav.n; k++) {
        const eph_t *eph = &nav.eph[k];
        int prn = 0;
        int sys = satsys(eph->sat, &prn);
        char sid;
        switch (sys) {
            case SYS_GPS: sid = 'G'; break;
            case SYS_GAL: sid = 'E'; break;
            case SYS_QZS: sid = 'J'; break;
            case SYS_CMP: sid = 'C'; break;
            default:      continue; /* skip anything else (none expected) */
        }
        /* Only emit healthy satellites (svh==0); the parser may still hold an
         * unhealthy record we do not want to validate against. */
        if (eph->svh != 0) continue;
        if (eph->A <= 0.0) continue;

        for (int j = 0; j < NTK; j++) {
            gtime_t t = timeadd(eph->toe, TK[j]);
            double rs[6] = {0}, dts[2] = {0}, var = 0.0;
            eph2pos(t, eph, rs, dts, &var);
            printf("%c %d %.6f %d %.6f %.17e %.17e %.17e\n",
                   sid, prn, eph->toes, eph->iode, TK[j],
                   rs[0], rs[1], rs[2]);
        }
    }

    free(nav.eph);
    free(obs.data);
    return 0;
}
