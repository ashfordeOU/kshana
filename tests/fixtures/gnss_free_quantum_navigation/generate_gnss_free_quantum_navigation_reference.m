% SPDX-License-Identifier: AGPL-3.0-only
%
% Generate EXTERNAL reference vectors for the GNSS-free quantum-navigation
% capability (kshana module `quantum_nav_od`: `QuantumNavOdScenario`, which
% composes `inertial::quantum_imu::QuantumNavBudget` and
% `quantum_trade::ClassicalInsBudget` through the `PositionDrift` trait).
%
% ORACLE (two independent external authorities):
%
%   (A) Freier 2016 "GAIN" mobile quantum gravity sensor -- PUBLISHED short-term
%       acceleration noise 96 nm/s^2/sqrt(Hz).
%       C. Freier, M. Hauth, V. Schkolnik, B. Leykauf, M. Schilling, H. Wziontek,
%       H.-G. Scherneck, J. Mueller, A. Peters, "Mobile quantum gravity sensor
%       with unprecedented stability", J. Phys.: Conf. Ser. 723, 012050 (2016);
%       arXiv:1512.05660. Rb-87; representative interrogation 2T ~ 0.52 s
%       (T ~ 0.26 s), N ~ 1e6, contrast C ~ 0.6, cycle ~ 1 s.
%       This script recomputes the shot-noise- (standard-quantum-) limited
%       acceleration ASD  n_a = (1/(C*sqrt(N)))/(k_eff*T^2) * sqrt(T_c) from the
%       Mach-Zehnder geometry (k_eff = 4*pi/lambda), entirely in Octave, and
%       emits both that SQL floor AND the published 96 nm/s^2/sqrt(Hz) value.
%       The Rust test checks (i) kshana's CaiAccelerometer::accel_asd reproduces
%       this Octave SQL value to <1e-9 rel, and (ii) published/SQL lies in
%       [10x, 100x] -- a real device is vibration-/technical-limited and so sits
%       above, but within ~2 orders of, its quantum-projection-noise floor.
%
%   (B) Independent Octave Monte-Carlo double-integration of white acceleration
%       noise + an independent closed-form double-integration of a constant bias
%       and a scale-factor specific-force error, for the EXACT error budgets the
%       `quantum_nav_od` scenario uses (quantum CAI budget AND classical INS
%       budget), evaluated at t in {60,120,300,600,1000} s.
%
%       The Monte-Carlo draws M white-acceleration paths with per-step velocity
%       increment std sqrt(q_va*dt), each double-integrated (cumulative sum of
%       velocity, then of position), and takes the empirical 1-sigma of the final
%       position over the realisations. This mirrors kshana's OWN discrete
%       AccelModel::step (vel += N(0, sqrt(q_va*dt)); pos += vel*dt) but is
%       written in a different language/runtime with no closed form, so its
%       agreement with kshana's analytic sqrt(q_va*t^3/3) is a genuine external
%       check of the velocity-random-walk double-integration. The deterministic
%       bias/scale-factor terms are integrated as  pos = 0.5*a*t^2  (the exact
%       continuum limit), reproduced here independently.
%
%       kshana drift_m(t) = sqrt( (0.5*b*t^2)^2 + (0.5*eps*a_ref*t^2)^2
%                                 + q_va*t^3/3 )    [root-sum-square of the three
%       independent error mechanisms]. The fixture emits each component plus the
%       MC velocity-random-walk 1-sigma so the Rust test can (i) reproduce the
%       deterministic terms to <1e-9 rel and (ii) check the VRW term lands inside
%       the +/-3% Monte-Carlo band.
%
% HONEST SCOPE -- what this DOES validate: the PRIMITIVES of the GNSS-free
% navigation scenario -- the shot-noise floor geometry (Freier-anchored,
% one-sided bracket), and the dead-reckoning position-error growth of BOTH the
% quantum and the classical budgets (double-integration of white noise, of a
% constant bias, and of a scale-factor force, and their RSS) -- against an
% independent Octave propagator. What it does NOT validate: that the quantum
% budget BEATS the classical one is the composite trade and remains MODELLED
% (an apples-to-apples device-vs-device comparison rests on the chosen
% public-source parameters, not on an external authority); nor the cold-atom
% device hardware, the RSS-independence assumption, or any flight heritage.
%
% Reproduce (offline, no kshana code involved):
%   octave --no-gui -q generate_gnss_free_quantum_navigation_reference.m \
%       > gnss_free_quantum_navigation_reference.txt
%
% Generated with GNU Octave 11 (rand/randn Mersenne-Twister), seed fixed below.

1;  % mark as a script, not a function file

PI = pi;
RB87_D2_WAVELENGTH_M = 780.241209e-9;  % matches kshana RB87_D2_WAVELENGTH_M

function k = k_eff(lambda_m)
  k = 4.0 * pi / lambda_m;
end

% Shot-noise- (standard-quantum-) limited acceleration ASD (m/s^2/sqrt(Hz)):
%   sigma_phi = 1/(C*sqrt(N));  sigma_a = sigma_phi/(k_eff*T^2);  n_a = sigma_a*sqrt(Tc)
function na = shot_noise_asd(lambda_m, T, N, C, Tc)
  sigma_phi = 1.0 / (C * sqrt(N));
  sigma_a   = sigma_phi / (k_eff(lambda_m) * T * T);
  na        = sigma_a * sqrt(Tc);
end

% q_va = n_a^2 ((m/s^2)^2/Hz)
function q = cai_q_va(lambda_m, T, N, C, Tc)
  na = shot_noise_asd(lambda_m, T, N, C, Tc);
  q  = na * na;
end

% Deterministic double-integration of a constant acceleration a over t: 0.5*a*t^2.
function p = pos_from_const_accel(a, t)
  p = 0.5 * a * t * t;
end

% Independent Monte-Carlo double-integration of WHITE acceleration noise of PSD
% q_va over [0, t], returning the empirical 1-sigma of the final position.
% Discretisation matches kshana's AccelModel::step continuum:
%   per-step velocity increment ~ N(0, sqrt(q_va*dt)); pos += vel*dt.
function s = mc_vrw_pos_sigma(q_va, t, nsteps, M)
  dt = t / nsteps;
  sd = sqrt(q_va * dt);
  finalpos = zeros(M, 1);
  for m = 1:M
    dv = sd * randn(nsteps, 1);   % white-accel velocity increments
    v  = cumsum(dv);              % velocity path
    finalpos(m) = sum(v) * dt;    % pos += v*dt over the path
  end
  s = std(finalpos, 1);          % population 1-sigma (mean is ~0)
end

% ---- Fixed configuration: EXACTLY what kshana's quantum_nav_od scenario uses ----
% Quantum CAI budget (src/quantum_nav_od.rs quantum_budget):
%   cai{ lambda=Rb87, T=0.05, N=1e6, C=0.5, Tc=0.5 }, bias=1e-7, ppm=1.0, a_ref=0.0
Q_lambda = RB87_D2_WAVELENGTH_M;
Q_T  = 0.05; Q_N = 1.0e6; Q_C = 0.5; Q_Tc = 0.5;
Q_bias = 1.0e-7; Q_ppm = 1.0; Q_aref = 0.0;
Q_qva = cai_q_va(Q_lambda, Q_T, Q_N, Q_C, Q_Tc);

% Classical navigation-grade INS budget (src/quantum_nav_od.rs classical_budget):
%   bias=5e-5, ppm=50.0, a_ref=9.81, vrw_psd=1e-4
C_bias = 5.0e-5; C_ppm = 50.0; C_aref = 9.81; C_vrw = 1.0e-4;

% Freier-2016 GAIN published config + achieved noise (the part-(A) anchor).
F_lambda = RB87_D2_WAVELENGTH_M; F_T = 0.26; F_N = 1.0e6; F_C = 0.6; F_Tc = 1.0;
F_pub = 96.0e-9;  % 96 nm/s^2/sqrt(Hz), Freier 2016 short-term noise
F_sql = shot_noise_asd(F_lambda, F_T, F_N, F_C, F_Tc);

TIMES = [60, 120, 300, 600, 1000];

% Monte-Carlo settings: M paths, nsteps integration steps. M=200000 gives ~0.16%
% sampling noise on the std; nsteps=2000 keeps the discretisation bias <0.1%.
rand('twister', 20260627);  % fix the Octave PRNG for a reproducible fixture
randn('twister', 20260627);
M = 200000;
NSTEPS = 2000;

printf("# GNSS-free quantum-navigation external reference (module quantum_nav_od).\n");
printf("# Oracle A: Freier+2016 GAIN published 96 nm/s^2/sqrt(Hz) (arXiv:1512.05660)\n");
printf("#   vs Octave-recomputed shot-noise floor n_a = (1/(C*sqrt(N)))/(k_eff*T^2)*sqrt(Tc).\n");
printf("# Oracle B: independent Octave Monte-Carlo double-integration of white accel\n");
printf("#   (M=%d paths, %d steps) + closed-form 0.5*a*t^2 deterministic terms, for the\n", M, NSTEPS);
printf("#   EXACT quantum CAI and classical INS budgets quantum_nav_od uses.\n");
printf("# Consumed by tests/gnss_free_quantum_navigation_reference.rs.\n");
printf("# Generated with GNU Octave 11; seed 20260627.\n");
printf("# Units: m/s^2/sqrt(Hz) (n_a), m (positions), s (times).\n");
printf("#\n");

% ---- (A) Freier shot-noise anchor -------------------------------------------
% FREIER lambda | T | N | C | Tc | sql_n_a | published_n_a | ratio_pub_over_sql
printf("FREIER %s | %s | %s | %s | %s | %s | %s | %s\n", ...
       mat2str(F_lambda,17), mat2str(F_T,17), mat2str(F_N,17), mat2str(F_C,17), ...
       mat2str(F_Tc,17), mat2str(F_sql,17), mat2str(F_pub,17), ...
       mat2str(F_pub / F_sql, 17));

% ---- Emit each budget's CAI/PSD identity row so the test rebuilds it ---------
% QCFG lambda | T | N | C | Tc | q_va | bias | ppm | a_ref
printf("QCFG %s | %s | %s | %s | %s | %s | %s | %s | %s\n", ...
       mat2str(Q_lambda,17), mat2str(Q_T,17), mat2str(Q_N,17), mat2str(Q_C,17), ...
       mat2str(Q_Tc,17), mat2str(Q_qva,17), mat2str(Q_bias,17), ...
       mat2str(Q_ppm,17), mat2str(Q_aref,17));
% CCFG vrw_psd | bias | ppm | a_ref
printf("CCFG %s | %s | %s | %s\n", ...
       mat2str(C_vrw,17), mat2str(C_bias,17), mat2str(C_ppm,17), mat2str(C_aref,17));

% ---- (B) Per-time double-integration for BOTH budgets ------------------------
% DRIFT budget(Q/C) | t | bias_pos | sf_pos | vrw_analytic | vrw_mc | drift_rss
for k = 1:numel(TIMES)
  t = TIMES(k);

  % Quantum budget at t.
  qb = pos_from_const_accel(Q_bias, t);
  qsf = pos_from_const_accel(Q_ppm * 1e-6 * Q_aref, t);
  qvrw_an = sqrt(Q_qva * t^3 / 3.0);
  qvrw_mc = mc_vrw_pos_sigma(Q_qva, t, NSTEPS, M);
  qrss = sqrt(qb^2 + qsf^2 + qvrw_an^2);
  printf("DRIFT Q | %s | %s | %s | %s | %s | %s\n", ...
         mat2str(t,17), mat2str(qb,17), mat2str(qsf,17), ...
         mat2str(qvrw_an,17), mat2str(qvrw_mc,17), mat2str(qrss,17));

  % Classical budget at t.
  cb = pos_from_const_accel(C_bias, t);
  csf = pos_from_const_accel(C_ppm * 1e-6 * C_aref, t);
  cvrw_an = sqrt(C_vrw * t^3 / 3.0);
  cvrw_mc = mc_vrw_pos_sigma(C_vrw, t, NSTEPS, M);
  crss = sqrt(cb^2 + csf^2 + cvrw_an^2);
  printf("DRIFT C | %s | %s | %s | %s | %s | %s\n", ...
         mat2str(t,17), mat2str(cb,17), mat2str(csf,17), ...
         mat2str(cvrw_an,17), mat2str(cvrw_mc,17), mat2str(crss,17));
end
