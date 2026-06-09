# IERS Conventions (2010) Chapter 6 — solid/ocean tide reference values

Source: IERS Conventions (2010), Chapter 6 "Geopotential" (rev. 01 Feb 2018),
<https://iers-conventions.obspm.fr/content/chapter6/icc6.pdf>. Values transcribed
verbatim for use as external validation oracles (not derived from this engine).

## Geopotential normalization (Eq 6.1, 6.2b)

`V = GM/r · Σ_n (a_e/r)^n Σ_m [C̄_nm cos(mλ) + S̄_nm sin(mλ)] P̄_nm(sin φ)`,
with `N_nm = sqrt[(n−m)!(2n+1)(2−δ_0m)/(n+m)!]`, `P̄_nm = N_nm·P_nm`.
(Matches `gravity_sh::SphericalHarmonicField`.)

## Solid Earth tide — Step 1, frequency-independent (Eq 6.6)

`ΔC̄_nm − i·ΔS̄_nm = (k_nm/(2n+1)) · Σ_{j∈{Moon,Sun}} (GM_j/GM_⊕)·(R_e/r_j)^(n+1)·P̄_nm(sin Φ_j)·e^(−i m λ_j)`

for n = 2,3 and all m. `Φ_j` = body-fixed (ECEF) geocentric latitude, `λ_j` = body-fixed
east longitude from Greenwich, `r_j` = geocentric distance of Moon/Sun.

Degree-4 induced by degree-2 (Eq 6.7):
`ΔC̄_4m − i·ΔS̄_4m = (k₂ₘ^(+)/5)·Σ_{j}(GM_j/GM_⊕)(R_e/r_j)^3·P̄_2m(sin Φ_j)·e^(−i m λ_j)`, m=0,1,2.

### Table 6.3 — nominal Love numbers

| n | m | k_nm (elastic) | k_nm^(+) (elastic) | Re k_nm (anelastic) | Im k_nm (anelastic) | k_nm^(+) (anelastic) |
|---|---|----------------|--------------------|---------------------|---------------------|----------------------|
| 2 | 0 | 0.29525 | −0.00087 | 0.30190 | −0.00000 | −0.00089 |
| 2 | 1 | 0.29470 | −0.00079 | 0.29830 | −0.00144 | −0.00080 |
| 2 | 2 | 0.29801 | −0.00057 | 0.30102 | −0.00130 | −0.00057 |
| 3 | 0 | 0.093   | …       | —       | —       | — |
| 3 | 1 | 0.093   | …       | —       | —       | — |
| 3 | 2 | 0.093   | …       | —       | —       | — |
| 3 | 3 | 0.094   | …       | —       | —       | — |

The IERS conventional (anelastic) model uses the Re/Im degree-2 values; `k₂₀` is real
(no closed form for the Im contribution to ΔC̄₂₀). Degree-3 uses the single tabulated set.

## ORACLE 1 — Permanent (zero-frequency) tide (Eq 6.13, 6.14)

`ΔC̄₂₀^perm = A₀·H₀·k₂₀`, with `A₀ = 4.4228×10⁻⁸ m⁻¹`, `H₀ = −0.31460 m`.
**For EGM2008 the zero-tide↔tide-free C₂₀ difference = −4.1736×10⁻⁹**, giving the tide-free
`C₂₀ = −0.48416531×10⁻³` (zero-tide `C̄₂₀ = −0.48416948×10⁻³`, Table 6.2).
→ Engine check: `ΔC̄₂₀^perm` from A₀H₀k₂₀ must reproduce −4.1736×10⁻⁹ (to rounding).

## ORACLE 2 — K1 constituent, Step 2 worked example (IERS Ch.6, below Eq 6.11)

Given `A_m = A_1 = −3.1274×10⁻⁸`, `H_f = 0.36870`, `θ_f = (θ_g+π)`,
`k₂₁ = (0.25746 + 0.00118 i)` for K1, IERS finds `δk_f = (−0.04084 + 0.00262 i)` and Eq 6.8b yields:
- `ΔC̄₂₁_K1 = 470.9×10⁻¹²·sin(θ_g+π) − 30.2×10⁻¹²·cos(θ_g+π)`
- `ΔS̄₂₁_K1 = 470.9×10⁻¹²·cos(θ_g+π) + 30.2×10⁻¹²·sin(θ_g+π)`

Step-2 constants: `A₀ = 1/(R_e√(4π)) = 4.4228×10⁻⁸ m⁻¹` (Eq 6.8c);
`A_m = (−1)^m/(R_e√(8π)) = (−1)^m·3.1274×10⁻⁸ m⁻¹` (Eq 6.8d); `η₁=−i, η₂=1` (Eq 6.8e).

## Ocean tide — Eq 6.15 (data: FES2004, fetched at Task 1.3)

`[ΔC̄_nm − i·ΔS̄_nm](t) = Σ_f Σ_± (C±_f,nm ∓ i·S±_f,nm)·e^(±iθ_f(t))`.
Coefficients from the IERS-distributed FES2004 `fes2004_Cnm-Snm.dat`; load deformation
coefficients `k′₂=−0.3075, k′₃=−0.195, k′₄=−0.132, k′₅=−0.1032, k′₆=−0.0892` (Eq 6.21).
8 dominant constituents: M2, S2, N2, K2 (semidiurnal); K1, O1, P1, Q1 (diurnal).

## Constituent Doodson/Delaunay multipliers (Table 6.5a, for phase θ_f)

`θ_f = m(θ_g+π) − Σ_j N_j F_j`, F = Delaunay (l, l′, F, D, Ω); from `nutation::delaunay_args`.
K1: Doodson 165.555, Delaunay multipliers (ℓ,ℓ′,F,D,Ω) = (0,0,0,0,0), τ s h p N′ ps = (1,1,0,0,0,0).
