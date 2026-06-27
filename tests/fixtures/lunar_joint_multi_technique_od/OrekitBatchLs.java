// SPDX-License-Identifier: AGPL-3.0-only
//
// External-oracle driver for the kshana lunar joint multi-technique OD + clock
// batch-LS cross-validation.
//
// ORACLE: Orekit 12.2 / Hipparchus 3.1 (CS GROUP + Hipparchus project,
//         Apache-2.0). Orekit's BatchLSEstimator is parameterised by a
//         Hipparchus LeastSquaresOptimizer; its default and canonical choice is
//         the LevenbergMarquardtOptimizer. This driver exercises that solver
//         directly on the multilateration + clock-offset weighted least-squares
//         problem -- minimising the SAME cost kshana's batch_ls::gauss_newton
//         minimises, reaching the identical optimum on a well-conditioned
//         full-rank network, but via a trust-region (LM) QR path, a
//         fundamentally different algorithm + linear algebra from kshana's
//         Gauss-Newton normal-equation inverse.
//
// It reads the flat `cases.txt` written by the Python generator (geometry,
// a-priori, byte-identical noisy observations + weights), builds the SAME
// observable model h(x) (an absolute station-clock anchor, anchor->station
// ranges, anchor->sat ranges, station<->sat ranges, inter-sat ranges, each
// range carrying the differenced clock term), supplies an ANALYTIC Jacobian,
// solves with the Hipparchus LevenbergMarquardtOptimizer, and prints, per case:
//   STATE seed v0 v1 ... v_{np-1}        (converged estimated state, m)
//   COVDIAG seed d0 d1 ... d_{np-1}      (diagonal of the formal covariance, m^2)
//   META seed iterations rms
//
// The Hipparchus covariance getCovariances() returns (J^T W J)^-1 from the QR
// of the whitened Jacobian -- the formal covariance whose sqrt-diagonal is the
// per-parameter 1-sigma. kshana computes the same (H^T W H)^-1.
//
// Compile/run:
//   source /tmp/kshana-oracles/orekit/cp.sh
//   javac -cp "$OREKIT_CP" OrekitBatchLs.java
//   java -cp ".:$OREKIT_CP" OrekitBatchLs cases.txt > lunar_joint_multi_technique_od_reference.txt

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Locale;

import org.hipparchus.linear.Array2DRowRealMatrix;
import org.hipparchus.linear.ArrayRealVector;
import org.hipparchus.linear.RealMatrix;
import org.hipparchus.linear.RealVector;
import org.hipparchus.optim.nonlinear.vector.leastsquares.LeastSquaresBuilder;
import org.hipparchus.optim.nonlinear.vector.leastsquares.LeastSquaresOptimizer;
import org.hipparchus.optim.nonlinear.vector.leastsquares.LeastSquaresProblem;
import org.hipparchus.optim.nonlinear.vector.leastsquares.LevenbergMarquardtOptimizer;
import org.hipparchus.optim.nonlinear.vector.leastsquares.MultivariateJacobianFunction;
import org.hipparchus.util.Pair;

public final class OrekitBatchLs {

    static int N_SAT;
    static int N_ANCHOR;
    static int N_PARAMS;
    static int N_OBS;
    static double[][] ANCHORS;   // [n_anchor][3]
    static int[][] PAIRS;        // [n_pairs][2]
    static double[] SIGMA;       // [n_obs]
    static double[] WEIGHT;      // [n_obs]

    // --- state layout helpers (mirror lunar_combination): -------------------
    static double[] station(double[] x) { return new double[] { x[0], x[1], x[2] }; }
    static double[] sat(double[] x, int k) {
        int b = 3 + 3 * k;
        return new double[] { x[b], x[b + 1], x[b + 2] };
    }
    static double clkSt(double[] x) { return x[3 + 3 * N_SAT]; }
    static double clkSat(double[] x, int k) { return x[3 + 3 * N_SAT + 1 + k]; }
    static int idxClkSt() { return 3 + 3 * N_SAT; }
    static int idxClkSat(int k) { return 3 + 3 * N_SAT + 1 + k; }

    static double norm(double[] a, double[] b) {
        double dx = a[0] - b[0], dy = a[1] - b[1], dz = a[2] - b[2];
        return Math.sqrt(dx * dx + dy * dy + dz * dz);
    }

    // Forward model h(x) -- order MUST match the Python generator + Rust test.
    static double[] forward(double[] x) {
        double[] st = station(x);
        double[][] sats = new double[N_SAT][];
        for (int k = 0; k < N_SAT; k++) sats[k] = sat(x, k);
        double clkst = clkSt(x);
        double[] clksat = new double[N_SAT];
        for (int k = 0; k < N_SAT; k++) clksat[k] = clkSat(x, k);

        List<Double> h = new ArrayList<>();
        // 0. station-clock anchor
        h.add(clkst);
        // 1. anchor -> station ranges
        for (int a = 0; a < N_ANCHOR; a++) h.add(norm(st, ANCHORS[a]));
        // 2. anchor -> sat ranges + sat clock
        for (int k = 0; k < N_SAT; k++)
            for (int a = 0; a < N_ANCHOR; a++)
                h.add(norm(sats[k], ANCHORS[a]) + clksat[k]);
        // 3. station -> sat ranges + diff clock
        for (int k = 0; k < N_SAT; k++)
            h.add(norm(sats[k], st) + (clksat[k] - clkst));
        // 4. inter-satellite ranges + diff clock
        for (int[] p : PAIRS)
            h.add(norm(sats[p[0]], sats[p[1]]) + (clksat[p[0]] - clksat[p[1]]));

        double[] out = new double[h.size()];
        for (int i = 0; i < out.length; i++) out[i] = h.get(i);
        return out;
    }

    // Analytic Jacobian dh/dx ([n_obs][n_params]).
    static double[][] jacobian(double[] x) {
        double[] st = station(x);
        double[][] sats = new double[N_SAT][];
        for (int k = 0; k < N_SAT; k++) sats[k] = sat(x, k);

        double[][] J = new double[N_OBS][N_PARAMS];
        int row = 0;
        // 0. anchor: d clk_st = 1
        J[row][idxClkSt()] = 1.0;
        row++;
        // 1. anchor -> station ranges: unit vector (station - anchor) wrt station xyz
        for (int a = 0; a < N_ANCHOR; a++) {
            double d = norm(st, ANCHORS[a]);
            for (int c = 0; c < 3; c++) J[row][c] = (st[c] - ANCHORS[a][c]) / d;
            row++;
        }
        // 2. anchor -> sat ranges: unit vector wrt sat_k xyz + d clk_sat_k = 1
        for (int k = 0; k < N_SAT; k++) {
            int b = 3 + 3 * k;
            for (int a = 0; a < N_ANCHOR; a++) {
                double d = norm(sats[k], ANCHORS[a]);
                for (int c = 0; c < 3; c++) J[row][b + c] = (sats[k][c] - ANCHORS[a][c]) / d;
                J[row][idxClkSat(k)] = 1.0;
                row++;
            }
        }
        // 3. station -> sat ranges: unit (sat-station) wrt sat (+), wrt station (-);
        //    + d clk_sat_k = 1, d clk_st = -1
        for (int k = 0; k < N_SAT; k++) {
            int b = 3 + 3 * k;
            double d = norm(sats[k], st);
            for (int c = 0; c < 3; c++) {
                double u = (sats[k][c] - st[c]) / d;
                J[row][b + c] = u;     // wrt sat
                J[row][c] += -u;       // wrt station
            }
            J[row][idxClkSat(k)] = 1.0;
            J[row][idxClkSt()] += -1.0;
            row++;
        }
        // 4. inter-satellite ranges: unit (sat_i - sat_j) wrt sat_i (+), sat_j (-);
        //    + d clk_sat_i = 1, d clk_sat_j = -1
        for (int[] p : PAIRS) {
            int i = p[0], j = p[1];
            int bi = 3 + 3 * i, bj = 3 + 3 * j;
            double d = norm(sats[i], sats[j]);
            for (int c = 0; c < 3; c++) {
                double u = (sats[i][c] - sats[j][c]) / d;
                J[row][bi + c] += u;
                J[row][bj + c] += -u;
            }
            J[row][idxClkSat(i)] += 1.0;
            J[row][idxClkSat(j)] += -1.0;
            row++;
        }
        return J;
    }

    public static void main(String[] args) throws Exception {
        if (args.length < 1) {
            System.err.println("usage: OrekitBatchLs cases.txt");
            System.exit(2);
        }
        Map<String, String> hdr = new HashMap<>();
        List<int[]> caseSeeds = new ArrayList<>();
        List<double[]> x0s = new ArrayList<>();
        List<double[]> zs = new ArrayList<>();

        // Parse the flat cases.txt.
        try (BufferedReader br = new BufferedReader(new FileReader(args[0]))) {
            String line;
            int curSeed = -1;
            double[] curX0 = null, curZ = null;
            while ((line = br.readLine()) != null) {
                line = line.trim();
                if (line.isEmpty() || line.startsWith("#")) continue;
                int sp = line.indexOf(' ');
                String tag = sp < 0 ? line : line.substring(0, sp);
                String rest = sp < 0 ? "" : line.substring(sp + 1).trim();
                switch (tag) {
                    case "C": case "N_SAT": case "N_ANCHOR": case "N_PARAMS":
                    case "N_OBS": case "N_PAIRS":
                        hdr.put(tag, rest);
                        break;
                    case "ANCHORS": {
                        N_SAT = Integer.parseInt(hdr.get("N_SAT"));
                        N_ANCHOR = Integer.parseInt(hdr.get("N_ANCHOR"));
                        N_PARAMS = Integer.parseInt(hdr.get("N_PARAMS"));
                        N_OBS = Integer.parseInt(hdr.get("N_OBS"));
                        double[] flat = parseDoubles(rest);
                        ANCHORS = new double[N_ANCHOR][3];
                        for (int a = 0; a < N_ANCHOR; a++)
                            for (int c = 0; c < 3; c++) ANCHORS[a][c] = flat[a * 3 + c];
                        break;
                    }
                    case "PAIRS": {
                        int np = Integer.parseInt(hdr.get("N_PAIRS"));
                        String[] toks = rest.isEmpty() ? new String[0] : rest.split("\\s+");
                        PAIRS = new int[np][2];
                        for (int p = 0; p < np; p++) {
                            PAIRS[p][0] = Integer.parseInt(toks[2 * p]);
                            PAIRS[p][1] = Integer.parseInt(toks[2 * p + 1]);
                        }
                        break;
                    }
                    case "SIGMA": SIGMA = parseDoubles(rest); break;
                    case "WEIGHT": WEIGHT = parseDoubles(rest); break;
                    case "CASE":
                        if (curSeed >= 0) { caseSeeds.add(new int[]{curSeed}); x0s.add(curX0); zs.add(curZ); }
                        curSeed = Integer.parseInt(rest);
                        curX0 = null; curZ = null;
                        break;
                    case "XTRUE": break; // truth not needed by the oracle
                    case "X0": curX0 = parseDoubles(rest); break;
                    case "Z": curZ = parseDoubles(rest); break;
                    default: break;
                }
            }
            if (curSeed >= 0) { caseSeeds.add(new int[]{curSeed}); x0s.add(curX0); zs.add(curZ); }
        }

        StringBuilder out = new StringBuilder();
        out.append("# Orekit 12.2 / Hipparchus 3.1 LevenbergMarquardtOptimizer reference output\n");
        out.append("# Oracle: Hipparchus 3.1 weighted batch least squares (the LM solver under\n");
        out.append("#   Orekit's BatchLSEstimator), Apache-2.0. Multilateration + clock joint OD.\n");
        out.append("# Consumed by tests/lunar_joint_multi_technique_od_reference.rs.\n");
        out.append("# STATE   seed x0..x_{np-1}     converged estimated state (m; clocks as c*dt m)\n");
        out.append("# COVDIAG seed d0..d_{np-1}     diagonal of formal covariance (m^2)\n");
        out.append("# META    seed iterations rms\n");

        for (int ci = 0; ci < zs.size(); ci++) {
            int seed = caseSeeds.get(ci)[0];
            final double[] x0 = x0s.get(ci);
            final double[] z = zs.get(ci);

            // Weight matrix W = diag(1/sigma^2) (Hipparchus whitens by sqrt(W)).
            double[][] wfull = new double[N_OBS][N_OBS];
            for (int i = 0; i < N_OBS; i++) wfull[i][i] = WEIGHT[i];
            RealMatrix W = new Array2DRowRealMatrix(wfull, false);

            MultivariateJacobianFunction model = (RealVector point) -> {
                double[] xv = point.toArray();
                double[] hv = forward(xv);
                double[][] jv = jacobian(xv);
                return new Pair<RealVector, RealMatrix>(
                        new ArrayRealVector(hv, false),
                        new Array2DRowRealMatrix(jv, false));
            };

            LeastSquaresProblem problem = new LeastSquaresBuilder()
                    .start(x0)
                    .model(model)
                    .target(z)
                    .weight(W)
                    .maxEvaluations(1000)
                    .maxIterations(1000)
                    .build();

            // Levenberg-Marquardt: the solver Orekit's BatchLSEstimator uses by
            // default. It minimises the SAME weighted-LS cost as kshana's
            // Gauss-Newton (a trust-region damping of the Gauss-Newton step that
            // internally rescales the columns), reaching the identical optimum on a
            // well-conditioned full-rank problem -- but via QR of the (damped)
            // Jacobian, a fundamentally different linear-algebra path from kshana's
            // (H^T W H)^-1 normal-equation inverse. Tight tolerances so it grinds to
            // the true minimum, not an early stop.
            LevenbergMarquardtOptimizer optimizer = new LevenbergMarquardtOptimizer()
                    .withCostRelativeTolerance(1.0e-14)
                    .withParameterRelativeTolerance(1.0e-14)
                    .withOrthoTolerance(1.0e-14);
            LeastSquaresOptimizer.Optimum opt = optimizer.optimize(problem);

            double[] xhat = opt.getPoint().toArray();
            RealMatrix cov = opt.getCovariances(1.0e-12);

            out.append("STATE ").append(seed);
            for (double v : xhat) out.append(' ').append(repr(v));
            out.append('\n');

            out.append("COVDIAG ").append(seed);
            for (int p = 0; p < N_PARAMS; p++) out.append(' ').append(repr(cov.getEntry(p, p)));
            out.append('\n');

            out.append("META ").append(seed).append(' ')
               .append(opt.getIterations()).append(' ')
               .append(repr(opt.getRMS())).append('\n');
        }
        System.out.print(out);
    }

    static double[] parseDoubles(String s) {
        if (s.isEmpty()) return new double[0];
        String[] toks = s.split("\\s+");
        double[] d = new double[toks.length];
        for (int i = 0; i < toks.length; i++) d[i] = Double.parseDouble(toks[i]);
        return d;
    }

    // Full-precision, round-trippable double formatting.
    static String repr(double v) {
        return String.format(Locale.ROOT, "%.17g", v);
    }
}
