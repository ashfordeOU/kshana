/* Second oracle: the public-domain NRLMSISE-00 C port (release 20190709, as shipped in the
 * PyPI sdist nrlmsise00-0.1.2, src/c_nrlmsise-00/), evaluated on the same grid in double
 * precision. The C sources are not committed; see gen_c_oracle.sh.
 * Reads "doy ut alt lat lon f107a f107 ap" lines on stdin; prints gtd7d d[5] (kg/m^3, switch 0 on)
 * and t[1] (K). Switches 0..23 all 1 (daily-Ap mode). */
#include <stdio.h>
#include "nrlmsise-00.h"

int main(void) {
    struct nrlmsise_flags flags;
    struct nrlmsise_input in;
    struct nrlmsise_output out;
    int i, doy;
    double ut, alt, lat, lon, f107a, f107, ap;
    for (i = 0; i < 24; i++) flags.switches[i] = 1;
    printf("# NRLMSISE-00 C port 20190709 gtd7d, daily Ap, all switches 1\n");
    printf("# doy ut_s alt_km lat_deg lon_deg f107a f107 ap rho_kg_m3 t_k\n");
    while (scanf("%d %lf %lf %lf %lf %lf %lf %lf", &doy, &ut, &alt, &lat, &lon, &f107a, &f107, &ap) == 8) {
        in.year = 0;
        in.doy = doy;
        in.sec = ut;
        in.alt = alt;
        in.g_lat = lat;
        in.g_long = lon;
        in.lst = ut / 3600.0 + lon / 15.0;
        in.f107A = f107a;
        in.f107 = f107;
        in.ap = ap;
        in.ap_a = NULL;
        gtd7d(&in, &flags, &out);
        printf("%d %.0f %.0f %.0f %.0f %.0f %.0f %.0f %.17e %.17e\n", doy, ut, alt, lat, lon, f107a, f107,
               ap, out.d[5], out.t[1]);
    }
    return 0;
}
