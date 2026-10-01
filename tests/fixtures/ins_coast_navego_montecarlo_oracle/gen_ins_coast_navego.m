% SPDX-License-Identifier: AGPL-3.0-only
%
% Fixture generator for tests/ins_coast_navego_montecarlo_oracle.rs (matrix row
% "INS/TRN coasting error growth & threshold crossings").
%
% The oracle is NaveGo v1.4 (https://github.com/rodralez/NaveGo, tag v1.4, commit
% 24d9488, LGPL-3.0), run as a tool under GNU Octave. NaveGo's own strapdown
% mechanization (att_update in quaternion mode, vel_update, pos_update, earth_rate,
% transport_rate, gravity, radius) propagates a free-inertial solution, with the
% loop order of NaveGo's ins_gnss.m and no aiding. The IMU coefficients are handed
% to NaveGo in datasheet units and converted by NaveGo's imu_si_errors.m. Nothing
% here calls or reads Kshana.
%
% Usage (from this directory, after `source ~/Code/kshana-oracles/env.sh`):
%   octave --no-gui -q --eval "gen_ins_coast_navego('T1', 0, 0, 'out_T1.csv')"
%   octave --no-gui -q --eval "gen_ins_coast_navego('T5', 1, 75, 'out_T5_a.csv')"
% Terms: T1 accel bias, T2 gyro bias, T3 scale factor (cruise), T4 scale factor
% (sustained acceleration), T5 velocity random walk, T6 angle random walk. For
% T1-T4 the seed range is ignored (one deterministic run). Each output row is
%   term,seed,t_s,dn_m,de_m
% the north and east position difference between the run with the error source and
% the error-free run on the same trajectory, at each coast duration of G.

function gen_ins_coast_navego(term, seed_lo, seed_hi, out_path)
  navego = getenv('NAVEGO');
  if isempty(navego)
    error('NAVEGO is not set: source ~/Code/kshana-oracles/env.sh');
  end
  addpath(fullfile(navego, 'ins'));
  addpath(fullfile(navego, 'conversions'));
  addpath(fullfile(navego, 'simulation'));

  % ---- fixed by the pre-registration -------------------------------------
  G_S   = [30 60 120 300 600 1200 1800 3600];   % coast durations (s)
  FREQ  = 10;                                   % IMU rate (Hz)
  DT    = 1 / FREQ;
  LAT0  = 45 * pi / 180;  LON0 = 0;  H0 = 1000;
  GRAV  = 9.80665;                              % NaveGo's G
  % Kshana ImuGrade::Tactical, datasheet units:
  ACC_BIAS_UG  = 300.0;
  VRW_MS_RTHR  = 0.06;
  SF_PPM       = 300.0;
  GYRO_BIAS_DH = 1.0;
  ARW_DEG_RTHR = 0.05;
  % Motion profiles:
  CRUISE_V = 10.0;  BURST_S = 1.0;              % T3: 10 m/s^2 for 1 s, then 10 m/s
  SUSTAINED_A = 0.01;                           % T4
  % -------------------------------------------------------------------------

  % NaveGo's unit conversion (white-noise per-sample standard deviations).
  dsheet.vrw = VRW_MS_RTHR * [1 1 1];
  dsheet.arw = ARW_DEG_RTHR * [1 1 1];
  dsheet.vrrw = [0 0 0];  dsheet.arrw = [0 0 0];
  dsheet.ab_dyn = [0 0 0];  dsheet.gb_dyn = [0 0 0];
  dsheet.ab_corr = [Inf Inf Inf];  dsheet.gb_corr = [Inf Inf Inf];
  dsheet.ab_sta = [0 0 0];  dsheet.gb_sta = [0 0 0];
  si = imu_si_errors(dsheet, DT);
  a_std = si.a_std(1);
  g_std = si.g_std(1);
  b_a = ACC_BIAS_UG * 1e-6 * GRAV;
  b_g = GYRO_BIAS_DH * (pi / 180) / 3600;
  s   = SF_PPM * 1e-6;

  n_steps = round(G_S(end) * FREQ);
  idx_g = round(G_S * FREQ) + 1;                % sample index of each duration

  switch term
    case {'T1', 'T2', 'T5', 'T6'}
      profile = 'static';
    case 'T3'
      profile = 'cruise';
    case 'T4'
      profile = 'sustained';
    otherwise
      error('unknown term %s', term);
  end
  [fb0, wb0, ~] = clean_signal(profile, n_steps, DT, LAT0, LON0, H0, ...
                               CRUISE_V, BURST_S, SUSTAINED_A);
  ref = mechanize(fb0, wb0, DT, LAT0, LON0, H0, 0, idx_g);

  if any(strcmp(term, {'T1', 'T2', 'T3', 'T4'}))
    seeds = 0;
  else
    seeds = seed_lo:seed_hi;
  end

  fid = fopen(out_path, 'w');
  for k = seeds
    fb = fb0;  wb = wb0;
    switch term
      case 'T1'
        fb(:, 1) = fb(:, 1) + b_a;
      case 'T2'
        wb(:, 1) = wb(:, 1) + b_g;
      case {'T3', 'T4'}
        fb(:, 1) = fb(:, 1) * (1 + s);
      case 'T5'
        randn('seed', k);
        fb(:, 1:2) = fb(:, 1:2) + a_std .* randn(size(fb, 1), 2);
      case 'T6'
        randn('seed', k);
        wb(:, 1:2) = wb(:, 1:2) + g_std .* randn(size(wb, 1), 2);
    end
    run = mechanize(fb, wb, DT, LAT0, LON0, H0, ref.v0, idx_g);
    for j = 1:numel(G_S)
      [RM, RN] = radius(ref.lat(j));
      dn = (run.lat(j) - ref.lat(j)) * (RM + ref.h(j));
      de = (run.lon(j) - ref.lon(j)) * (RN + ref.h(j)) * cos(ref.lat(j));
      fprintf(fid, '%s,%d,%g,%.12e,%.12e\n', term, k, G_S(j), dn, de);
    end
  end
  fclose(fid);
end

% The error-free body-frame signal for a body locked to the local NED frame
% (level, heading north). Specific force is NaveGo's acc_gen formula (kinematic
% acceleration + Coriolis/transport - gravity, with NaveGo's gravity() and
% coriolis()); the angular rate is omega_ib^b = omega_ie^n + omega_en^n from
% NaveGo's earth_rate() and transport_rate(). (NaveGo's gyro_gen does not add the
% Earth rate to a supplied rate, so the rate is formed from the same two functions
% its mechanization subtracts.)
function [fb, wb, traj] = clean_signal(profile, n_steps, dt, lat0, lon0, h0, ...
                                       v_cruise, burst_s, a_sus)
  n = n_steps + 1;
  t = (0:n_steps)' * dt;
  acc = zeros(n, 1);
  switch profile
    case 'static'
      % no motion
    case 'cruise'
      % Sample i carries the interval (t(i-1), t(i)] (the mechanization never
      % integrates sample 1), so the burst occupies the samples with 0 < t <= burst.
      acc(t > 1e-9 & t <= burst_s + 1e-9) = v_cruise / burst_s;
    case 'sustained'
      acc(:) = a_sus;
  end
  vn = zeros(n, 1);  lat = zeros(n, 1);  lat(1) = lat0;
  for i = 2:n
    vn(i) = vn(i - 1) + acc(i) * dt;
    [RM, ~] = radius(lat(i - 1));
    lat(i) = lat(i - 1) + 0.5 * (vn(i - 1) + vn(i)) * dt / (RM + h0);
  end
  h = h0 * ones(n, 1);
  vel = [vn zeros(n, 1) zeros(n, 1)];
  gn = gravity(lat, h);
  cor = coriolis(lat, vel, h);
  fb = [acc zeros(n, 1) zeros(n, 1)] + cor - gn;
  wb = zeros(n, 3);
  for i = 1:n
    w = skewm_inv(earth_rate(lat(i))) + ...
        skewm_inv(transport_rate(lat(i), vn(i), 0, h(i)));
    wb(i, :) = w';
  end
  traj.lat = lat;  traj.vn = vn;  traj.lon0 = lon0;
end

% NaveGo free-inertial propagation, in the loop order of ins_gnss.m. Returns the
% position at the requested sample indices.
function out = mechanize(fb, wb, dt, lat0, lon0, h0, v0, idx_g)
  lat = lat0;  lon = lon0;  h = h0;  vel = [0 0 0];
  qua = euler2qua([0 0 0]);
  DCMbn = qua2dcm(qua);
  n = size(fb, 1);
  out.lat = zeros(numel(idx_g), 1);  out.lon = out.lat;  out.h = out.lat;
  out.v0 = v0;
  j = 1;
  if idx_g(1) == 1
    out.lat(1) = lat;  out.lon(1) = lon;  out.h(1) = h;  j = 2;
  end
  for i = 2:n
    omega_ie_n = earth_rate(lat);
    omega_en_n = transport_rate(lat, vel(1), vel(2), h);
    gn = gravity(lat, h);
    fn = DCMbn * fb(i, :)';
    [qua, DCMbn] = att_update(wb(i, :)', DCMbn, qua, omega_ie_n, omega_en_n, dt, 'quaternion');
    vel = vel_update(fn, vel, omega_ie_n, omega_en_n, gn', dt);
    pos = pos_update([lat lon h], vel, dt);
    lat = pos(1);  lon = pos(2);  h = pos(3);
    if j <= numel(idx_g) && i == idx_g(j)
      out.lat(j) = lat;  out.lon(j) = lon;  out.h(j) = h;
      j = j + 1;
    end
  end
end
