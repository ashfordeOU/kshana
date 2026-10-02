/*
 * Snapshot RAIM oracle harness for tests/integrity_snapshot_raim_rtklib_oracle.rs (Kshana
 * cross-validation driver). It is compiled against RTKLIB v2.4.2-p13 (commit 71db0ffa,
 * BSD-2-Clause, copyright T. Takasu) as a separate program and includes pntpos.c to reach its
 * file-static estpos(), valsol() and raim_fde(). No RTKLIB code enters the crate.
 *
 * Build (see build.sh):  gcc -O2 -DENAGLO -DENAQZS -DENAGAL -DNFREQ=3 -I$RTKLIB/src \
 *     raim_harness.c <every RTKLIB src/*.c except pntpos.c> -lm -lrt
 * Usage: raim_harness <obs.rnx> <nav.rnx> <out dir>
 *
 * Per epoch (GPS satellites, C1C, 10 degree mask):
 *  1. satellite positions and clocks at transmit time from the broadcast ephemerides (satposs,
 *     from the recorded pseudoranges), ephemeris variance forced to 0;
 *  2. the pseudoranges are corrected by RTKLIB's Klobuchar (ionmodel, the file's GPSA/GPSB) and
 *     Saastamoinen (tropmodel, relative humidity 0.7) models evaluated at the station's ITRF2020
 *     coordinate; the solver then runs with ionosphere and troposphere options OFF;
 *  3. weighting err = [1, 1, 0] so every pseudorange variance is 1 + 0 + 0.3^2 + 5^2 + 3^2 =
 *     35.09 m^2; maximum GDOP 1e9 so only the chi-squared test validates;
 *  4. case 0 (fault free): estpos from the Earth's centre; if at least 6 satellites are used,
 *     the epoch counts. Cases 1..6 add a bias of +10, -20, +30, -40, +60, -100 m to the
 *     satellite with index (7 * epoch + j) mod n among the n used in case 0, and re-run estpos
 *     on those n satellites; when estpos fails its chi-squared test, raim_fde runs.
 * For every case the harness also re-solves each single-satellite exclusion with estpos (as
 * raim_fde does) and logs its chi-squared statistic, so a decision that falls between RTKLIB's
 * rounded table value and the exact quantile can be identified. For case 0 it forms the
 * slopes of the unweighted geometry with RTKLIB's matmul/matinv and xyz2enu.
 *
 * Outputs in <out dir>: rtklib_raim_cases.csv, rtklib_raim_sats.csv, rtklib_raim_subsets.csv.
 */
#include "pntpos.c"

#define MAXN 64

/* ITRF2020 ABMF solution 4 (valid from 2015:118), position at 2015.0 and velocity (m/yr). */
static const double ITRF_POS_2015[3] = {2919785.7538, -5383745.0105, 1774604.7867};
static const double ITRF_VEL[3] = {0.00718, 0.00980, 0.01425};
static const double BIAS_M[6] = {10.0, -20.0, 30.0, -40.0, 60.0, -100.0};

static double weighted_vv(const double *resp, const int *vsat, int n)
{
    /* the variance rescode forms with the harness options, in its order of summation */
    double var = 1.0 * (1.0 * 1.0 + 0.0) + 0.0 + SQR(ERR_CBIAS) + SQR(ERR_ION) + SQR(ERR_TROP);
    double sig = sqrt(var), vv = 0.0, v;
    int i;
    for (i = 0; i < n; i++) {
        if (!vsat[i]) continue;
        v = resp[i] / sig;
        vv += v * v;
    }
    return vv;
}

static int prn_of(int sat)
{
    int prn = 0;
    satsys(sat, &prn);
    return prn;
}

/* Slopes of the unweighted geometry at rr (RTKLIB matmul/matinv/xyz2enu). */
static void slopes(const double *rs, int n, const double *rr, double *sh_max, double *sv_max)
{
    double H[4 * MAXN], Q[16], S[4 * MAXN], e[3], pos[3], E[9], d[3], enu[3], pii;
    int i, k;
    for (i = 0; i < n; i++) {
        geodist(rs + 6 * i, rr, e);
        H[0 + 4 * i] = -e[0];
        H[1 + 4 * i] = -e[1];
        H[2 + 4 * i] = -e[2];
        H[3 + 4 * i] = 1.0;
    }
    matmul("NT", 4, 4, n, 1.0, H, H, 0.0, Q); /* Q = H H' (4x4) */
    matinv(Q, 4);
    matmul("NN", 4, n, 4, 1.0, Q, H, 0.0, S); /* S = Q H (4xn) */
    ecef2pos(rr, pos);
    xyz2enu(pos, E);
    *sh_max = *sv_max = 0.0;
    for (i = 0; i < n; i++) {
        for (pii = 0.0, k = 0; k < 4; k++) pii += H[k + 4 * i] * S[k + 4 * i];
        for (k = 0; k < 3; k++) d[k] = S[k + 4 * i];
        matmul("NN", 3, 1, 3, 1.0, E, d, 0.0, enu);
        if (sqrt((SQR(enu[0]) + SQR(enu[1])) / (1.0 - pii)) > *sh_max)
            *sh_max = sqrt((SQR(enu[0]) + SQR(enu[1])) / (1.0 - pii));
        if (fabs(enu[2]) / sqrt(1.0 - pii) > *sv_max) *sv_max = fabs(enu[2]) / sqrt(1.0 - pii);
    }
}

int main(int argc, char **argv)
{
    obs_t obs = {0};
    nav_t nav = {0};
    sta_t sta = {{0}};
    prcopt_t opt = prcopt_default;
    obsd_t ep[MAXN], use[MAXN], sub[MAXN];
    double rs[6 * MAXN], dts[2 * MAXN], vare[2 * MAXN], rs_u[6 * MAXN], dts_u[2 * MAXN];
    double rs_s[6 * MAXN], dts_s[2 * MAXN], zero[MAXN] = {0};
    double azel[2 * MAXN], resp[MAXN], rr_sta[3], pos_sta[3], e[3], az[2], yr;
    int svh[MAXN], svh_u[MAXN], svh_s[MAXN], vsat[MAXN], i, j, k, m, n, nu, nep = 0, epoch = 0;
    char path[1024], msg[256];
    FILE *fc, *fs, *fx;

    if (argc < 4) {
        fprintf(stderr, "usage: raim_harness obs nav outdir\n");
        return 2;
    }
    if (readrnx(argv[1], 1, "", &obs, &nav, &sta) <= 0 || readrnx(argv[2], 0, "", NULL, &nav, NULL) <= 0) {
        fprintf(stderr, "read error\n");
        return 1;
    }
    sortobs(&obs);
    uniqnav(&nav);

    opt.mode = PMODE_SINGLE;
    opt.nf = 1;
    opt.navsys = SYS_GPS;
    opt.elmin = 10.0 * D2R;
    opt.ionoopt = IONOOPT_OFF;
    opt.tropopt = TROPOPT_OFF;
    opt.sateph = EPHOPT_BRDC;
    opt.err[0] = 1.0;
    opt.err[1] = 1.0;
    opt.err[2] = 0.0;
    opt.maxgdop = 1e9;
    opt.posopt[4] = 1;

    sprintf(path, "%s/rtklib_raim_cases.csv", argv[3]);
    fc = fopen(path, "w");
    sprintf(path, "%s/rtklib_raim_sats.csv", argv[3]);
    fs = fopen(path, "w");
    sprintf(path, "%s/rtklib_raim_subsets.csv", argv[3]);
    fx = fopen(path, "w");
    fprintf(fc, "epoch,case,tow_s,n,bias_prn,bias_m,x_m,y_m,z_m,estpos_ok,msg,vv,chisqr_table,"
                "fde_ok,fde_excluded_prn,slope_h,slope_v\n");
    fprintf(fs, "epoch,case,prn,rs_x_m,rs_y_m,rs_z_m,resp_m\n");
    fprintf(fx, "epoch,case,excluded_prn,estpos_ok,n_used,vv,chisqr_table,rms_m\n");

    for (i = 0; i < obs.n; i = j) {
        gtime_t t = obs.data[i].time;
        int week;
        double tow = time2gpst(t, &week);
        for (j = i; j < obs.n && timediff(obs.data[j].time, t) == 0.0; j++);
        /* GPS satellites with a C1C pseudorange */
        for (n = 0, k = i; k < j && n < MAXN; k++) {
            if (satsys(obs.data[k].sat, NULL) != SYS_GPS || obs.data[k].P[0] == 0.0) continue;
            ep[n++] = obs.data[k];
        }
        if (n < 4) continue;
        satposs(t, ep, n, &nav, EPHOPT_BRDC, rs, dts, vare, svh);
        for (k = 0; k < n; k++) vare[k] = 0.0;
        /* station ITRF2020 coordinate at the epoch */
        yr = 2018.0 + (time2doy(t) - 1.0) / 365.0;
        for (k = 0; k < 3; k++) rr_sta[k] = ITRF_POS_2015[k] + ITRF_VEL[k] * (yr - 2015.0);
        ecef2pos(rr_sta, pos_sta);
        for (k = 0; k < n; k++) {
            if (geodist(rs + 6 * k, rr_sta, e) <= 0.0) continue;
            satazel(pos_sta, e, az);
            ep[k].P[0] -= ionmodel(t, nav.ion_gps, pos_sta, az) + tropmodel(t, pos_sta, az, REL_HUMI);
        }
        /* case 0: fault free, all GPS satellites in view */
        {
            sol_t sol = {{0}};
            int ok = estpos(ep, n, rs, dts, vare, svh, &nav, &opt, &sol, azel, vsat, resp, msg);
            for (nu = 0, k = 0; k < n; k++) nu += vsat[k];
            if (nu < 6) continue;
            /* restrict every case to the satellites used here */
            for (m = 0, k = 0; k < n; k++) {
                if (!vsat[k]) continue;
                use[m] = ep[k];
                matcpy(rs_u + 6 * m, rs + 6 * k, 6, 1);
                matcpy(dts_u + 2 * m, dts + 2 * k, 2, 1);
                svh_u[m] = svh[k];
                m++;
            }
            (void)ok;
        }
        nep++;
        {
            int c;
            for (c = 0; c <= 6; c++) {
                obsd_t cs[MAXN];
                sol_t sol = {{0}}, solf = {{0}};
                int bias_idx = -1, ok, fde = 0, exprn = 0, nv;
                double vv, sh = 0.0, sv = 0.0, azel_f[2 * MAXN], resp_f[MAXN];
                int vsat_f[MAXN];
                char msgf[256] = "";
                for (k = 0; k < nu; k++) cs[k] = use[k];
                if (c > 0) {
                    bias_idx = (7 * epoch + (c - 1)) % nu;
                    cs[bias_idx].P[0] += BIAS_M[c - 1];
                }
                msg[0] = '\0';
                ok = estpos(cs, nu, rs_u, dts_u, zero, svh_u, &nav, &opt, &sol, azel, vsat, resp, msg);
                for (nv = 0, k = 0; k < nu; k++) nv += vsat[k];
                vv = weighted_vv(resp, vsat, nu);
                if (c == 0) slopes(rs_u, nu, sol.rr, &sh, &sv);
                if (!ok && strstr(msg, "chi-square")) {
                    solf = sol;
                    for (k = 0; k < nu; k++) {
                        azel_f[2 * k] = azel[2 * k];
                        azel_f[2 * k + 1] = azel[2 * k + 1];
                        vsat_f[k] = vsat[k];
                        resp_f[k] = resp[k];
                    }
                    fde = raim_fde(cs, nu, rs_u, dts_u, zero, svh_u, &nav, &opt, &solf, azel_f,
                                   vsat_f, resp_f, msgf);
                    if (fde) {
                        for (k = 0; k < nu; k++)
                            if (!vsat_f[k]) exprn = prn_of(cs[k].sat);
                    }
                }
                for (k = 0; k < (int)strlen(msg); k++)
                    if (msg[k] == ',') msg[k] = ';';
                fprintf(fc, "%d,%d,%.3f,%d,%d,%.1f,%.17g,%.17g,%.17g,%d,%s,%.17g,%.17g,%d,%d,%.17g,%.17g\n",
                        epoch, c, tow, nv, bias_idx >= 0 ? prn_of(cs[bias_idx].sat) : 0,
                        c > 0 ? BIAS_M[c - 1] : 0.0, sol.rr[0], sol.rr[1], sol.rr[2], ok, msg, vv,
                        nv > 4 ? chisqr[nv - 4 - 1] : 0.0, fde, exprn, sh, sv);
                for (k = 0; k < nu; k++) {
                    if (!vsat[k]) continue;
                    fprintf(fs, "%d,%d,%d,%.17g,%.17g,%.17g,%.17g\n", epoch, c, prn_of(cs[k].sat),
                            rs_u[6 * k], rs_u[6 * k + 1], rs_u[6 * k + 2], resp[k]);
                }
                /* every single-satellite exclusion, solved as raim_fde solves it */
                for (m = 0; m < nu; m++) {
                    sol_t se = {{0}};
                    double azel_s[2 * MAXN], resp_s[MAXN], rms = 0.0;
                    int vsat_s[MAXN], okx, ns = 0, q;
                    char msgx[256];
                    for (q = k = 0; k < nu; k++) {
                        if (k == m) continue;
                        sub[q] = cs[k];
                        matcpy(rs_s + 6 * q, rs_u + 6 * k, 6, 1);
                        matcpy(dts_s + 2 * q, dts_u + 2 * k, 2, 1);
                        svh_s[q] = svh_u[k];
                        q++;
                    }
                    okx = estpos(sub, nu - 1, rs_s, dts_s, zero, svh_s, &nav, &opt, &se, azel_s,
                                 vsat_s, resp_s, msgx);
                    for (k = 0; k < nu - 1; k++) {
                        if (!vsat_s[k]) continue;
                        rms += SQR(resp_s[k]);
                        ns++;
                    }
                    fprintf(fx, "%d,%d,%d,%d,%d,%.17g,%.17g,%.17g\n", epoch, c, prn_of(cs[m].sat),
                            okx, ns, weighted_vv(resp_s, vsat_s, nu - 1),
                            ns > 4 ? chisqr[ns - 4 - 1] : 0.0, ns > 0 ? sqrt(rms / ns) : 0.0);
                }
            }
        }
        epoch++;
    }
    fclose(fc);
    fclose(fs);
    fclose(fx);
    fprintf(stderr, "epochs used: %d\n", nep);
    return 0;
}
