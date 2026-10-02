// SPDX-License-Identifier: AGPL-3.0-only
// Oracle harness for tests/leo_navmsg_services_gnsstk_oracle.rs (M125). It is compiled against
// a local GNSSTk build (LGPL-3.0, https://github.com/SGL-UT/gnsstk) and run as a separate
// program; nothing of GNSSTk is copied into this repository. It writes klobuchar.tsv, az.tsv and
// utc_drift.tsv with the values GNSSTk computes for the pre-registered inputs.
//
// Build: g++ -std=c++17 -O2 gnsstk_services_harness.cpp -I$GNSSTK/include -I$GNSSTK/include/gnsstk \
//            -L$GNSSTK/lib -lgnsstk -Wl,-rpath,$GNSSTK/lib -o harness
#include <cmath>
#include <cstdio>
#include <vector>
#include "GPSLNavIono.hpp"
#include "GalINavIono.hpp"
#include "GPSLNavTimeOffset.hpp"
#include "GPSWeekSecond.hpp"
#include "YDSTime.hpp"
#include "Position.hpp"
#include "FreqConv.hpp"

using namespace gnsstk;

struct AzProbe : public GalINavIono {
   double az(double modip) const { return getEffIonoLevel(modip); }
};

// Satellite position 20 000 km from the receiver along geodetic elevation/azimuth (deg).
static Position satAt(const Position& rx, double el, double az) {
   Position c(rx);
   c.transformTo(Position::Cartesian);
   double lat = rx.getGeodeticLatitude() * M_PI / 180, lon = rx.getLongitude() * M_PI / 180;
   double e = el * M_PI / 180, a = az * M_PI / 180, r = 2.0e7;
   double n = r * std::cos(e) * std::cos(a), ea = r * std::cos(e) * std::sin(a), u = r * std::sin(e);
   double dx = -std::sin(lat) * std::cos(lon) * n - std::sin(lon) * ea + std::cos(lat) * std::cos(lon) * u;
   double dy = -std::sin(lat) * std::sin(lon) * n + std::cos(lon) * ea + std::cos(lat) * std::sin(lon) * u;
   double dz = std::cos(lat) * n + std::sin(lat) * u;
   return Position(c.X() + dx, c.Y() + dy, c.Z() + dz, Position::Cartesian);
}

int main() {
   // Klobuchar: real GPS broadcast set (BRDC00IGS_R_20242550000_01D_MN header GPSA/GPSB) and the
   // IS-GPS-200 example set of the module's unit test.
   double sets[2][8] = {
      {2.8871e-08, 2.2352e-08, -1.1921e-07, -1.1921e-07, 1.3722e+05, 1.6384e+04, -1.9661e+05, 3.9322e+05},
      {0.1118e-7, -0.7451e-8, -0.5961e-7, 0.1192e-6, 0.1167e6, -0.2294e6, -0.1311e6, 0.1049e7}};
   CarrierBand bands[3] = {CarrierBand::L1, CarrierBand::L2, CarrierBand::L5};
   double sows[4] = {259200.0 + 3600.0, 259200.0 + 30000.0, 259200.0 + 50400.0, 259200.0 + 72000.0};
   FILE* k = std::fopen("klobuchar.tsv", "w");
   std::fprintf(k, "f_hz\tlat_deg\tlon_deg\tel_deg\taz_deg\tsod\ta0\ta1\ta2\ta3\tb0\tb1\tb2\tb3\tdelay_m\n");
   for (auto& s : sets) {
      GPSLNavIono io;
      for (int i = 0; i < 4; i++) { io.alpha[i] = s[i]; io.beta[i] = s[4 + i]; }
      for (double lat : {-75.0, -40.0, 0.0, 40.0, 75.0})
         for (double lon : {-150.0, 0.0, 120.0})
            for (double el : {5.0, 20.0, 45.0, 90.0})
               for (double az : {0.0, 135.0, 270.0})
                  for (double sow : sows)
                     for (CarrierBand b : bands) {
                        Position rx(lat, lon, 100.0, Position::Geodetic);
                        Position sv = satAt(rx, el, az);
                        CommonTime when = GPSWeekSecond(2331, sow);
                        double d = io.getIonoCorr(when, rx, sv, b);
                        std::fprintf(k, "%.6f\t%.15g\t%.15g\t%.15g\t%.15g\t%.9f\t%.6e\t%.6e\t%.6e\t%.6e\t%.6e\t%.6e\t%.6e\t%.6e\t%.12f\n",
                                     getFrequency(b), rx.getGeodeticLatitude(), rx.getLongitude(),
                                     rx.elevationGeodetic(sv), rx.azimuthGeodetic(sv), YDSTime(when).sod,
                                     s[0], s[1], s[2], s[3], s[4], s[5], s[6], s[7], d);
                     }
   }
   std::fclose(k);

   // Az: real Galileo set (header GAL), three broadcast-quantised activity sets (ai0 step
   // 2^-2 sfu, ai1 2^-8 sfu/deg, ai2 2^-15 sfu/deg^2), the all-zero set and a set above 400 sfu.
   double az_sets[6][3] = {{1.9575e+02, 1.6406e-01, 1.7700e-02},
                           {63.75, 0.0, 0.0},
                           {121.25, 0.3515625, 0.0062561035},
                           {236.75, -0.39453125, 0.0040283203},
                           {0.0, 0.0, 0.0},
                           {420.0, 1.0, 0.03125}};
   FILE* a = std::fopen("az.tsv", "w");
   std::fprintf(a, "ai0\tai1\tai2\tmodip_deg\taz_sfu\n");
   for (auto& s : az_sets) {
      AzProbe p;
      p.ai[0] = s[0]; p.ai[1] = s[1]; p.ai[2] = s[2];
      for (int m = -90; m <= 90; m += 5)
         std::fprintf(a, "%.10g\t%.10g\t%.10g\t%d\t%.12f\n", s[0], s[1], s[2], m, p.az(m));
   }
   std::fclose(a);

   // UTC drift: real GPS UTC parameters (header GPUT and LEAP SECONDS), case (a).
   GPSLNavTimeOffset to;
   to.a0 = 1.8626451492E-09; to.a1 = 7.105427358E-15; to.deltatLS = 18; to.deltatLSF = 18;
   to.tot = 503808; to.wnot = 2331; to.wnLSF = 1929; to.dn = 7;
   to.refTime = GPSWeekSecond(2331, 503808.0);
   to.effTime = GPSWeekSecond(1929, (7 - 1) * 86400.0);
   FILE* u = std::fopen("utc_drift.tsv", "w");
   std::fprintf(u, "a0\ta1\tdt_ls\tt_ot\twn_ot\twn_lsf\tdn\tdt_lsf\tweek\ttow\toffset_s\n");
   for (int i = 0; i < 50; i++) {
      double total = 2331 * 604800.0 + 503808.0 - 86400.0 + i * (4 * 604800.0 / 49.0);
      int wk = (int)std::floor(total / 604800.0);
      double tow = std::round((total - wk * 604800.0) * 4.0) / 4.0;
      CommonTime when = GPSWeekSecond(wk, tow);
      double off = 0;
      to.getOffset(TimeSystem::GPS, TimeSystem::UTC, when, off);
      std::fprintf(u, "%.10e\t%.10e\t18\t503808\t2331\t1929\t7\t18\t%d\t%.2f\t%.15f\n",
                   to.a0, to.a1, wk, tow, off);
   }
   std::fclose(u);
   return 0;
}
