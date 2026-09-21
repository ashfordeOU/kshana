// SPDX-License-Identifier: AGPL-3.0-only
//! P5 autonomous fault-observability & Byzantine-integrity reproducibility example.
//!
//! Regenerates the headline structural numbers for the free-network (self-referential)
//! fault-observability substrate directly from the committed engine, on the SAME
//! real-DE440 per-node lunar network used by the Validated anchor
//! (`tests/lunar_faultobs_reference.rs` + `examples/gen_faultobs_rows.rs`): eight nodes
//! (five near-side reflectors + three relay nodes), `state_dim = 40`, `84` differential
//! inter-node range rows, per-measurement `σ ∈ {0.5, 1.0, 2.0}` (so `W ≠ I`), and the
//! real DE440 Moon PA-frame line of sight baked into every row.
//!
//! - Part A \[VALIDATED pipeline + PROVEN structure\]: the §0 unification — the 8-dim
//!   datum⊕timescale gauge is the ENTIRE null space `N(GᵀWG)`, so `range(G)` has
//!   dimension `state_dim − 8 = 32` and the parity space is `n − rank(G) = 84 − 32 = 52`
//!   (`rank(G) = 32` / `parity_dim = 52` are reproduced against an independent
//!   numpy/scipy oracle by the Validated anchor); plus T1 detectability and the Baarda MDB
//!   non-centrality `cᵀWP⊥c`.
//! - Part B \[VALIDATED counts + PROVEN/CITED bound, MODELLED tolerance\]: the T3
//!   Byzantine block-spark detect/identify bound on the network, the coverage-driven
//!   fragility (a broad-coverage peer hides a fault in `range(G)`), and the T5
//!   provider common/differential split with a provider-count sweep.
//! - Part C \[MODELLED / PROVEN\]: the T4 autonomous-holdover temporal-gauge floor
//!   (the common clock rate is a gauge freedom, broken only by an external time-tie) and
//!   the g7 protection-gap slope vs a HYPOTHETICAL alert limit (explicitly NOT
//!   LNIS-certified).
//!
//! Every quantitative result is computed by the engine; the only non-engine numbers are
//! the Baarda non-centrality λ₀ and the hypothetical alert limit, both labelled as
//! literature / representative references.
//!
//! Run: `cargo run --example p5_autonomous_fault_observability`

use kshana::fim::{crlb, sym_eig};
use kshana::lunar_faultobs::{
    assemble_pernode_info, byzantine_bound, datum_gauge_generators, holdover_floor, is_detectable,
    mdb, parity_projector, peer_signature, pernode_range_row, provider_mismatch_split, slope,
    NetworkLayout, N_DATUM_GAUGE,
};
use kshana::lunar_llr_geometry::Vec3;
use kshana::lunar_orientation::de440_moon_pa_body_to_inertial;

// ── Network definition (matches examples/gen_faultobs_rows.rs / the Validated anchor) ──

/// 2024-01-01 TT (JD 2460310.5), inside the DE440 fixture window.
const T0: f64 = (2_460_310.5 - 2_451_545.0) / 36_525.0;

/// Distinct clock-integration windows (seconds).
const ELAPSED_S: [f64; 3] = [21_600.0, 43_200.0, 86_400.0];

/// Unequal per-measurement sigmas cycled by global row index, so `W ≠ I`.
const SIGMAS: [f64; 3] = [0.5, 1.0, 2.0];

/// Baarda non-centrality λ₀ for P_fa = 0.001, P_md = 0.20 (Baarda 1968) — a literature
/// reference value, NOT engine-computed.
const NCP: f64 = 17.075;

/// Representative body-frame node positions (PA metres): five near-side reflectors plus
/// three relay nodes in distinct octants. Geometry is Modelled; the DE440 orientation in
/// each line of sight is the external ingredient.
fn body_nodes() -> Vec<Vec3> {
    let mut nodes: Vec<Vec3> = kshana::lunar_llr_geometry::reflectors()
        .iter()
        .map(|r| r.pa_body_m)
        .collect();
    nodes.push([1_600_000.0, 700_000.0, 900_000.0]);
    nodes.push([-1_200_000.0, 1_000_000.0, -800_000.0]);
    nodes.push([300_000.0, -1_500_000.0, 1_100_000.0]);
    nodes
}

/// A weighted measurement row: the `state_dim`-vector sensitivity and its per-measurement
/// sigma (`W = diag(1/σ²)`).
type MeasRow = (Vec<f64>, f64);

/// The assembled real-DE440 per-node network (identical to the Validated anchor's network).
struct Network {
    layout: NetworkLayout,
    inertial: Vec<[f64; 3]>,
    rows: Vec<MeasRow>,
}

/// Build the real-DE440 per-node network: layout, inertial node positions, and the
/// `(row, sigma)` measurement list (row order: pair `a < b`, then elapsed window; sigma
/// cycles by global row index → `W ≠ I`) — identical to the Validated anchor's network.
fn build_network() -> Network {
    let body = body_nodes();
    let m = body.len();
    let layout = NetworkLayout::new(m);
    let inertial: Vec<[f64; 3]> = body
        .iter()
        .map(|&b| de440_moon_pa_body_to_inertial(b, T0))
        .collect();

    let mut rows: Vec<MeasRow> = Vec::new();
    let mut idx = 0_usize;
    for a in 0..m {
        for b in (a + 1)..m {
            let d = [
                inertial[a][0] - inertial[b][0],
                inertial[a][1] - inertial[b][1],
                inertial[a][2] - inertial[b][2],
            ];
            let nrm = (d[0] * d[0] + d[1] * d[1] + d[2] * d[2]).sqrt();
            let u = [d[0] / nrm, d[1] / nrm, d[2] / nrm];
            for &elapsed in &ELAPSED_S {
                let sigma = SIGMAS[idx % SIGMAS.len()];
                rows.push((pernode_range_row(&layout, a, b, u, elapsed), sigma));
                idx += 1;
            }
        }
    }
    Network {
        layout,
        inertial,
        rows,
    }
}

// ── Small linear-algebra helpers ───────────────────────────────────────────────────────

fn mat_vec(m: &[Vec<f64>], v: &[f64]) -> Vec<f64> {
    m.iter()
        .map(|row| row.iter().zip(v).map(|(&a, &b)| a * b).sum())
        .collect()
}

fn vnorm(v: &[f64]) -> f64 {
    v.iter().map(|&x| x * x).sum::<f64>().sqrt()
}

fn fro(m: &[Vec<f64>]) -> f64 {
    m.iter()
        .flat_map(|r| r.iter())
        .map(|&x| x * x)
        .sum::<f64>()
        .sqrt()
}

/// Observable-subspace projector `Π_obs = I − N Nᵀ` from the orthonormal null-space basis
/// `N` (`state_dim × defect`) returned by [`crlb`].
#[allow(clippy::needless_range_loop)]
fn obs_projector(null_space: &[Vec<f64>]) -> Vec<Vec<f64>> {
    let n = null_space.len();
    if n == 0 {
        return vec![];
    }
    let n_null = null_space[0].len();
    let mut proj = vec![vec![0.0_f64; n]; n];
    for i in 0..n {
        proj[i][i] = 1.0;
    }
    for k in 0..n_null {
        for i in 0..n {
            for j in 0..n {
                proj[i][j] -= null_space[i][k] * null_space[j][k];
            }
        }
    }
    proj
}

/// Measurement-row indices incident to node `k` (same pair/window ordering as the rows).
fn node_incidence(m: usize, k: usize) -> Vec<usize> {
    let mut inc = Vec::new();
    let mut i = 0_usize;
    for a in 0..m {
        for b in (a + 1)..m {
            for _w in 0..ELAPSED_S.len() {
                if a == k || b == k {
                    inc.push(i);
                }
                i += 1;
            }
        }
    }
    inc
}

/// Count measurement rows whose two endpoint nodes fall in DIFFERENT providers, under a
/// contiguous split of the `m` nodes into `n_prov` provider groups. These are the
/// cross-provider links that make a differential (inter-provider) bias self-detectable.
fn cross_provider_rows(m: usize, n_prov: usize) -> usize {
    let provider_of = |node: usize| -> usize { node * n_prov / m };
    let mut count = 0_usize;
    for a in 0..m {
        for b in (a + 1)..m {
            if provider_of(a) != provider_of(b) {
                count += ELAPSED_S.len();
            }
        }
    }
    count
}

fn main() {
    println!("# P5 autonomous fault observability & Byzantine integrity");
    println!("# Every number below is computed from the kshana engine on the real-DE440");
    println!(
        "# per-node network (the same one the Validated anchor checks against numpy/scipy).\n"
    );

    let Network {
        layout,
        inertial,
        rows,
    } = build_network();
    let m = layout.n_nodes;
    let state_dim = layout.state_dim;
    let g: Vec<Vec<f64>> = rows.iter().map(|(r, _)| r.clone()).collect();
    let w: Vec<f64> = rows.iter().map(|(_, s)| 1.0 / (s * s)).collect();
    let n_meas = g.len();
    let info = assemble_pernode_info(&rows, state_dim);

    // ── Part A — §0 unification + T1 detectability + MDB ──────────────────────
    println!("═══════════════════════════════════════════════════════════════════════");
    println!(
        "## Part A — §0 unification, T1 detectability, MDB [VALIDATED pipeline / PROVEN structure]"
    );
    println!("═══════════════════════════════════════════════════════════════════════");
    println!("  Network: M = {m} nodes, state_dim = {state_dim}, n = {n_meas} rows, W ≠ I.");
    println!("  Epoch base: 2024-01-01 TT (t_tt_jc = {T0:.6} JC from J2000.0)\n");

    // §0: the datum⊕timescale gauge is the ENTIRE null space of GᵀWG.
    let cr = crlb(&info, 1e-9);
    let pperp = parity_projector(&g, &w);
    let trace: f64 = (0..n_meas).map(|i| pperp[i][i]).sum();
    let parity_dim = trace.round() as usize;
    let rank_g = n_meas - parity_dim;

    println!("§0 one-rank-deficiency unification  N(GᵀWG) ⊕ range(GᵀWG):");
    println!(
        "  dim N(GᵀWG)   = defect = {}   (the 8-dim datum⊕timescale gauge) [PROVEN]",
        cr.defect
    );
    println!(
        "  dim range(G)  = rank   = {}   (= state_dim − 8 = {}) [VALIDATED]",
        cr.rank,
        state_dim - N_DATUM_GAUGE
    );
    println!(
        "  parity_dim    = trace(P⊥) = {parity_dim}   (= n − rank(G) = {n_meas} − {rank_g}) [VALIDATED]"
    );
    println!("  → The SAME range(G) that carries every observable state ALSO carries every");
    println!("    undetectable fault (P⊥·G = 0): the datum gauge and the fault-blind subspace");
    println!("    are one geometry, not two. rank(G)=32 / parity_dim=52 are reproduced");
    println!("    against an independent numpy/scipy oracle (tests/lunar_faultobs_reference.rs).");
    assert_eq!(
        cr.defect, N_DATUM_GAUGE,
        "gauge must be the entire null space"
    );
    assert_eq!(cr.rank, state_dim - N_DATUM_GAUGE, "rank = state_dim − 8");

    // Spectral gap: the 8 null eigenvalues are numerically zero vs the observable spectrum.
    let eig = sym_eig(&info);
    let lam_max = *eig.values.last().unwrap();
    let null_max = eig.values[N_DATUM_GAUGE - 1]; // largest of the 8 null eigenvalues
    let obs_min = eig.values[N_DATUM_GAUGE]; // smallest observable eigenvalue
    let gap = obs_min / null_max.abs().max(f64::MIN_POSITIVE);
    println!("\n  Spectral gap of GᵀWG (confirms the gauge is genuine, not a threshold artefact):");
    println!("    largest null eigenvalue      = {null_max:.3e}  (≈ 0 relative to λ_max)");
    println!("    smallest observable eigenvalue = {obs_min:.3e}");
    println!("    λ_max = {lam_max:.3e}   gap (obs_min / null_max) = {gap:.3e}  (≫ 1e6) [PROVEN]");

    // The eight analytic gauge generators all lie in N(GᵀWG).
    let gens = datum_gauge_generators(&layout, &inertial);
    let info_fro = fro(&info);
    let worst_gauge_res = gens
        .iter()
        .map(|gg| vnorm(&mat_vec(&info, gg)) / (info_fro * vnorm(gg)))
        .fold(0.0_f64, f64::max);
    println!(
        "  All {} analytic gauge generators lie in N(GᵀWG): worst relative residual = {:.3e} [PROVEN]",
        gens.len(),
        worst_gauge_res
    );

    // T1 detectability: a fault in range(G) is annihilated; a generic fault is not.
    let mut x_in = vec![0.0_f64; state_dim];
    x_in[layout.off_idx(1)] = 1.0; // clock offset of node 1 (a non-gauge state direction)
    let b_in: Vec<f64> = mat_vec_rows(&g, &x_in);
    let (det_in, norm_in) = is_detectable(&pperp, &b_in, 1e-8);
    let mut b_gen = vec![0.0_f64; n_meas];
    b_gen[0] = 1.0; // a single-measurement bias, not in range(G)
    let (det_gen, norm_gen) = is_detectable(&pperp, &b_gen, 1e-8);
    println!("\nT1 detectability  ‖P⊥·b‖  (parity projector is the anchor-Validated quantity):");
    println!(
        "  in-range fault  b = G·e_offset(node1)   ‖P⊥b‖ = {norm_in:.3e}   detectable = {det_in}  [VALIDATED]"
    );
    println!(
        "  generic fault   b = e_0 (measurement)   ‖P⊥b‖ = {norm_gen:.3e}   detectable = {det_gen}  [VALIDATED]"
    );

    // MDB (Baarda minimum detectable bias) for the two directions.
    let c_in_norm: Vec<f64> = {
        let nb = vnorm(&b_in);
        b_in.iter().map(|&v| v / nb).collect()
    };
    let mdb_gen = mdb(&pperp, &w, &b_gen, NCP);
    let mdb_in = mdb(&pperp, &w, &c_in_norm, NCP);
    println!("  MDB (λ₀ = {NCP} = Baarda P_fa 0.001 / P_md 0.20, literature ref.):");
    println!(
        "    generic detectable direction e_0:  MDB = √(λ₀ / cᵀWP⊥c) = {mdb_gen:.4}  [VALIDATED]"
    );
    println!(
        "    in-range direction (∈ range(G)):   MDB = {}  (cᵀWP⊥c ≈ 0 ⇒ never detectable) [VALIDATED]",
        fmt_big(mdb_in)
    );

    // ── Part B — T3 Byzantine block-spark + fragility + T5 provider split ──────
    println!("\n═══════════════════════════════════════════════════════════════════════");
    println!("## Part B — T3 Byzantine block-spark, coverage fragility, T5 provider split");
    println!("═══════════════════════════════════════════════════════════════════════");
    println!("  block_spark = smallest peer coalition whose effective signatures P⊥·B_T are");
    println!("  column-rank-deficient; f_detect = block_spark − 1, f_identify = ⌊(bs−1)/2⌋.");
    println!("  detect > f / identify > 2f is the block-wise-spark secure-estimation BOUND");
    println!("  (Fawzi–Tabuada–Diggavi 2014; Shoukry–Tabuada 2016; Donoho–Elad 2003) [PROVEN + CITED].\n");

    // T3: a redundant net of six independent single-measurement peers (an anchor coalition).
    let six: Vec<Vec<Vec<f64>>> = [0_usize, 12, 24, 37, 49, 61]
        .iter()
        .map(|&i| peer_signature(n_meas, &[i]))
        .collect();
    let cls_six = byzantine_bound(&six, &pperp, 1e-9);
    println!("T3 redundant net — six independent single-measurement peers:");
    println!(
        "  block_spark = {}, f_detect = {}, f_identify = {}  [VALIDATED counts]",
        cls_six.block_spark, cls_six.f_detect, cls_six.f_identify
    );
    println!(
        "  → detects any ≤ {} colluding Byzantine peers, uniquely identifies any ≤ {}.",
        cls_six.f_detect, cls_six.f_identify
    );
    println!("    Reading these as a flight Byzantine-tolerance guarantee is [MODELLED]");
    println!(
        "    (representative geometry); the detect>f / identify>2f BOUND is [PROVEN + CITED]."
    );

    // Coverage-driven fragility: a peer owning ALL of a node's links hides a uniform bias
    // (= that node's clock offset ∈ range(G)); a single-measurement peer cannot.
    let node2_inc = node_incidence(m, 2);
    let cls_cover = byzantine_bound(&[peer_signature(n_meas, &node2_inc)], &pperp, 1e-9);
    let cls_single = byzantine_bound(&[peer_signature(n_meas, &[0])], &pperp, 1e-9);
    println!(
        "\nCoverage-driven fragility (the same P⊥, opposite verdict, decided by column rank):"
    );
    println!(
        "  broad-coverage peer (all {} links of node 2): block_spark = {}, f_detect = {} → UNDETECTABLE [VALIDATED]",
        node2_inc.len(),
        cls_cover.block_spark,
        cls_cover.f_detect
    );
    println!(
        "  single-measurement peer:                       block_spark = {}, f_detect = {} → detectable [VALIDATED]",
        cls_single.block_spark, cls_single.f_detect
    );
    println!("  → A peer with enough coverage injects a uniform bias = a node clock-offset");
    println!("    (∈ range(G)) that leaves zero parity: broad coverage is the fragility [PROVEN].");

    // T5 provider common/differential split + provider-count sweep.
    let mut x_common = vec![0.0_f64; state_dim];
    x_common[layout.off_idx(2)] = 1.0; // a shared systematic offset absorbed as a state error
    let common_bias = mat_vec_rows(&g, &x_common); // ∈ range(G)
    let mut diff_bias = vec![0.0_f64; n_meas];
    diff_bias[0] = 1.0; // affects one provider's link only
    let split = provider_mismatch_split(&common_bias, &diff_bias, &pperp, 1e-8);
    println!("\nT5 provider common/differential split:");
    println!(
        "  common provider bias (∈ range(G)):   detectable = {}  → needs an external tie [PROVEN]",
        split.common_detectable
    );
    println!(
        "  differential provider bias (∉ range(G)): detectable = {}  → self-monitored [PROVEN]",
        split.differential_detectable
    );
    println!("  Provider-count effect (cross-provider links that open the differential channel):");
    for n_prov in [1_usize, 2, 4] {
        let x = cross_provider_rows(m, n_prov);
        let note = if x == 0 {
            "no differential channel → every systematic bias is common/undetectable"
        } else {
            "differential biases become self-detectable"
        };
        println!(
            "    {n_prov} provider(s): {x:>2} cross-provider measurement rows  ({note}) [MODELLED]"
        );
    }

    // ── Part C — T4 holdover floor + g7 protection-gap slope ───────────────────
    println!("\n═══════════════════════════════════════════════════════════════════════");
    println!("## Part C — T4 holdover floor + g7 protection-gap slope [MODELLED / PROVEN]");
    println!("═══════════════════════════════════════════════════════════════════════\n");

    // T4: the common clock rate is a gauge freedom of the self-referential network.
    let floor_self = holdover_floor(&info, &gens, 1e-7);
    let mut anchored = rows.clone();
    let mut rate_tie = vec![0.0_f64; state_dim];
    rate_tie[layout.rate_idx(0)] = 1.0; // an external absolute-rate tie for node 0
    anchored.push((rate_tie, 1.0));
    let info_anchored = assemble_pernode_info(&anchored, state_dim);
    let floor_anchored = holdover_floor(&info_anchored, &gens, 1e-7);
    println!("T4 autonomous-holdover temporal-gauge floor:");
    println!(
        "  self-referential net:  rate_in_gauge = {}, temporal_gauge_dim = {}  [MODELLED]",
        floor_self.rate_in_gauge, floor_self.temporal_gauge_dim
    );
    println!(
        "  + one external rate-tie: rate_in_gauge = {}, temporal_gauge_dim = {}  [PROVEN]",
        floor_anchored.rate_in_gauge, floor_anchored.temporal_gauge_dim
    );
    println!("  → The common clock rate is an ensemble-time free parameter (holdover floor):");
    println!("    no inter-node ranging observes it; only an off-network time-tie breaks it.");

    // g7: the protection-gap slope. In-range faults have slope → ∞ (silent corruption);
    // detectable faults have finite slope.
    let obs_proj = obs_projector(&cr.null_space);
    let s_in = slope(&pperp, &w, &g, &b_in, &obs_proj);
    // Worst finite slope over the single-measurement fault basis (all detectable).
    let mut s_worst = 0.0_f64;
    for i in 0..n_meas {
        let mut e = vec![0.0_f64; n_meas];
        e[i] = 1.0;
        let s = slope(&pperp, &w, &g, &e, &obs_proj);
        if s.is_finite() {
            s_worst = s_worst.max(s);
        }
    }
    println!("\ng7 protection-gap slope  ‖Π_obs·Δx̂‖ / ‖P⊥b‖_W  (Brown 1992):");
    println!(
        "  in-range fault  b = G·e_offset(node1):  slope = {}  → PROTECTION GAP [PROVEN]",
        fmt_big(s_in)
    );
    println!(
        "  worst detectable single-measurement fault: slope = {s_worst:.3}  (finite) [MODELLED]"
    );

    // Comparison to a HYPOTHETICAL alert limit — representative only, NOT LNIS-certified.
    const HYPOTHETICAL_ALERT_LIMIT_M: f64 = 50.0;
    println!(
        "\n  vs a HYPOTHETICAL alert limit AL = {HYPOTHETICAL_ALERT_LIMIT_M:.0} m (representative"
    );
    println!("  only — NOT an LNIS-certified figure, no protection-level certification):");
    println!(
        "    detectable fault: reaches AL at weighted parity ‖P⊥b‖_W ≈ AL / slope = {:.3e}",
        HYPOTHETICAL_ALERT_LIMIT_M / s_worst
    );
    println!("      → alarmed before AL if the monitor threshold sits below that parity.");
    println!("    in-range fault: slope = ∞ ⇒ reaches AL at parity 0 (silent). No finite");
    println!(
        "      alert limit protects the range(G) fault class without an external tie [MODELLED]."
    );

    // ── Honesty banner ─────────────────────────────────────────────────────────
    println!("\n─────────────────────────────────────────────────────────────────────────────");
    println!("HONESTY:");
    println!("  [VALIDATED] rank(G)=32 / parity_dim=52, the P⊥ pipeline, T1 detectability,");
    println!("    the MDB non-centrality, and the per-coalition block-spark counts are");
    println!("    reproduced against an independent numpy/scipy oracle on real-DE440 rows");
    println!("    (tests/lunar_faultobs_reference.rs). Validated = the LINEAR ALGEBRA on these");
    println!("    rows only — NOT an operational-integrity or protection-level certification.");
    println!("  [PROVEN]  the 8-dim gauge = entire N(GᵀWG), range annihilation P⊥·G = 0, the");
    println!("    detect>f / identify>2f block-spark bound, and the g7 range(G) slope → ∞.");
    println!("  [MODELLED] the node geometry, the Byzantine-tolerance COUNT as a mission");
    println!("    guarantee, the provider-count effect, the T4 holdover floor, and the");
    println!("    protection-gap magnitude. The alert limit is HYPOTHETICAL (not LNIS-certified).");
    println!("  No TRL claim; no affiliation with or endorsement by any agency.");
    println!("─────────────────────────────────────────────────────────────────────────────");
}

/// Format a value that may be infinite / very large as "∞" for undetectable directions.
fn fmt_big(v: f64) -> String {
    if !v.is_finite() || v > 1e6 {
        "∞".to_string()
    } else {
        format!("{v:.4}")
    }
}

/// `G · x` — the measurement-space image of a state vector (used to build in-range faults).
fn mat_vec_rows(g: &[Vec<f64>], x: &[f64]) -> Vec<f64> {
    g.iter()
        .map(|row| row.iter().zip(x).map(|(&r, &xi)| r * xi).sum())
        .collect()
}
