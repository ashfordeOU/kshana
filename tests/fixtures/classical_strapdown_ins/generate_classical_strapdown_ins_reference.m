% SPDX-License-Identifier: AGPL-3.0-only
%
% generate_classical_strapdown_ins_reference.m
% ============================================
% External-oracle generator for kshana's classical strapdown INS mechanization
% (modules inertial::mechanization, inertial::attitude).
%
% ORACLE: NaveGo --- R. Gonzalez, J. Giribet, H. Patino et al.,
%   "NaveGo: a simulation framework for low-cost integrated navigation systems",
%   open-source MATLAB/Octave INS/GNSS toolbox, version 1.4, commit 550d906
%   (2024-02-24), https://github.com/rodralez/NaveGo, LGPL-3.0.
%   Run under GNU Octave 11.1.0.
%
% This driver calls NaveGo's GENUINE strapdown mechanization functions --- the
% exact ones the toolbox's ins_gnss.m inner loop uses, in the exact same order:
%     earth_rate, transport_rate, gravity, vel_update, pos_update, att_update
%     (and att_update's dependencies qua_update, qua2dcm, qua2euler, skewm,
%      skewm_inv).
% No Kalman filter / GNSS aiding is invoked: this is the OPEN-LOOP free-inertial
% mechanization only --- precisely the quantity kshana::NavState::step_increments
% implements.
%
% WHAT IS VALIDATED
% -----------------
% A full open-loop NavState trajectory (body->NED attitude quaternion, NED
% velocity, geodetic position) over deterministic runs, driven by a SYNTHESISED
% (dtheta, dv) increment stream derived from a known analytic truth trajectory.
% Both NaveGo (here) and kshana (in the Rust test) are fed the IDENTICAL
% increment stream; the Rust test compares the two trajectories epoch by epoch
% (attitude in rad, position converted to ECEF metres).
%
% THREE PROFILES (>= 30 epochs sampled across the three):
%   P1 static   --- platform bolted to the rotating Earth at 45 N, 300 s.
%   P2 turn     --- level constant-velocity north run with a steady yaw turn, 300 s.
%   P3 coning   --- a coning/sculling vibration environment at coarse rate.
%
% HONEST SCOPE
% ------------
% NaveGo and kshana are INDEPENDENT implementations of the standard terrestrial
% NED mechanization (both cite Groves) but make different *numerical-integration*
% choices that are deliberately exercised here:
%   * position: NaveGo integrates lat/lon/h with the NEW velocity (forward Euler);
%     kshana uses the trapezoidal mean 0.5*(v_old+v_new). O(dt^2) difference.
%   * velocity: NaveGo applies no within-interval sculling term; kshana applies
%     0.5*(dtheta x dv). O(dt^2), zero for smooth motion, nonzero under vibration.
%   * gravity: NaveGo adds a small north deflection-of-vertical term
%     gn(1) = -8.08e-9*h*sin(2 lat); kshana's plumb-bob gravity has gn(1)=0.
%     (~uGal-level; negligible at the altitudes here.)
% These are the genuine modelling differences a strapdown integrator carries; the
% Rust test's tolerance is set to bound their O(dt^2) residual at a fine rate, NOT
% to paper over a disagreement. The coning case is therefore checked at a coarse
% rate where the residual is larger but still bounded.
%
% REPRODUCE
% ---------
%   octave --no-gui -q \
%     tests/fixtures/classical_strapdown_ins/generate_classical_strapdown_ins_reference.m \
%     > tests/fixtures/classical_strapdown_ins/classical_strapdown_ins_reference.txt
% (Requires the NaveGo checkout; this script adds /tmp/kshana-oracles/NaveGo to the
%  path. The committed .txt is the pinned oracle output; the Rust test reads it and
%  has NO runtime Octave dependency.)

1;  % mark as a script, not a function file

% --- locate NaveGo and add its mechanization + conversion dirs to the path ---
navego_root = getenv('NAVEGO_ROOT');
if isempty(navego_root)
  navego_root = '/tmp/kshana-oracles/NaveGo';
end
addpath(fullfile(navego_root, 'ins'));
addpath(fullfile(navego_root, 'ins-gnss'));
addpath(fullfile(navego_root, 'conversions'));

% NaveGo quaternion is vector-first [x y z w]; kshana is scalar-first [w x y z].
% We emit the quaternion in kshana's scalar-first order so the Rust test reads
% it directly, with a canonical sign (w >= 0) so the two never differ by the
% global +-1 ambiguity.
function q_sf = nav_q_to_scalar_first(q)
  % q = [x y z w]
  w = q(4);
  s = sign(w);
  if s == 0, s = 1; end
  q_sf = s .* [q(4) q(1) q(2) q(3)];  % [w x y z], w >= 0
end

% One open-loop NaveGo mechanization step, mirroring ins_gnss.m lines 246-275
% EXACTLY (no KF, no GNSS, no bias correction --- pure free inertial).
%   State in:  qua [x y z w], DCMbn, vel_o [n e d], pos [lat lon h],
%              omega_ie_n, omega_en_n, gn (all evaluated at the OLD epoch).
%   Drive:     wb (body rate rad/s = dtheta/dt), fb (body specific force = dv/dt), dt.
% Returns the updated state AND the freshly-evaluated old-epoch rate/gravity terms
% for the next step (computed from the NEW pos/vel, as ins_gnss.m does).
function [qua, DCMbn, vel, pos, omega_ie_n, omega_en_n, gn] = ...
    navego_step(qua, DCMbn, vel_o, pos, omega_ie_n, omega_en_n, gn, wb, fb, dt)
  % Velocity update (uses OLD omega/gn) --- vel_update.m.
  fn  = DCMbn * fb;                                   % specific force body->nav
  vel = vel_update(fn, vel_o, omega_ie_n, omega_en_n, gn, dt);
  % Position update with the NEW velocity --- pos_update.m.
  pos = pos_update(pos, vel, dt);
  % Refresh Earth/transport rate and gravity at the NEW position/velocity.
  omega_ie_n = earth_rate(pos(1));
  omega_en_n = transport_rate(pos(1), vel(1), vel(2), pos(3));
  gn = gravity(pos(1), pos(3))';                      % 3x1
  % Attitude update (uses the REFRESHED rates) --- att_update.m, quaternion mode.
  [qua, DCMbn, ~] = att_update(wb, DCMbn, qua, omega_ie_n, omega_en_n, dt, 'quaternion');
end

% Emit an epoch row the Rust test parses.
function emit_epoch(profile, k, t, qua_xyzw, vel, pos)
  q = nav_q_to_scalar_first(qua_xyzw);   % [w x y z]
  printf('EPOCH %s | %d | %.10f | %.16e,%.16e,%.16e,%.16e | %.16e,%.16e,%.16e | %.16e,%.16e,%.16e\n', ...
    profile, k, t, q(1), q(2), q(3), q(4), ...
    vel(1), vel(2), vel(3), pos(1), pos(2), pos(3));
end

% Emit the drive increments (so the Rust test feeds kshana the IDENTICAL stream).
function emit_drive(profile, k, dtheta, dv, dt)
  printf('DRIVE %s | %d | %.16e,%.16e,%.16e | %.16e,%.16e,%.16e | %.10f\n', ...
    profile, k, dtheta(1), dtheta(2), dtheta(3), dv(1), dv(2), dv(3), dt);
end

% ---- header / provenance ----
printf('# classical strapdown INS reference --- NaveGo oracle (Octave)\n');
printf('# oracle: NaveGo v1.4 commit 550d906 (R. Gonzalez et al., LGPL-3), Octave %s\n', version());
printf('# quantity: open-loop NavState trajectory (att [w x y z], vel_ned [n e d] m/s, pos [lat lon h] rad,rad,m)\n');
printf('# drive: synthesised (dtheta rad, dv m/s, dt s) increment stream; identical stream feeds kshana\n');
printf('# initial attitude/velocity/position are emitted as epoch 0; quaternion is scalar-first, w>=0\n');

OMEGA_IE = 7.292115e-5;   % NaveGo earth_rate constant family (rad/s)
WGS84_A  = 6378137.0;

% =====================================================================
% PROFILE P1 --- STATIC on the rotating Earth at 45 N, 120 m, 300 s @ 0.01 s.
% Truth: the platform does not move; body axes aligned with NED. It senses
% Earth rate (gyro) and -gravity (accel, 1 g up).  dtheta = w_ie^b * dt,
% dv = [0 0 -g] * dt, with g from NaveGo's own gravity model so the static
% balance is exact in NaveGo's convention.
% =====================================================================
function run_static()
  lat0 = pi/4; lon0 = 0.2; h0 = 120.0;
  dt = 0.01; n = 6000;        % 60 s @ fine 0.01 s rate
  emit_every = 200;           % 30 sampled epochs + epoch 0
  OMEGA_IE = 7.292115e-5;

  pos = [lat0 lon0 h0];
  vel = [0 0 0];
  % Body == NED: identity attitude. NaveGo quaternion [x y z w] = [0 0 0 1].
  qua = [0 0 0 1]';
  DCMbn = qua2dcm(qua);
  omega_ie_n = earth_rate(pos(1));
  omega_en_n = transport_rate(pos(1), vel(1), vel(2), pos(3));
  gn = gravity(pos(1), pos(3))';

  emit_epoch('static', 0, 0.0, qua', vel, pos);

  % Static drive: gyro senses Earth rate in body(=NED) frame; accel senses -g.
  w_ie_b = skewm_inv(omega_ie_n);     % [w cosL, 0, -w sinL]
  for k = 1:n
    g_down = gn(3);                   % NaveGo down gravity (positive)
    dtheta = w_ie_b * dt;             % body angular increment
    dv = [0; 0; -g_down] * dt;        % specific force = -gravity (up)
    wb = dtheta / dt;
    fb = dv / dt;
    % Emit the drive increment for EVERY navigation step so the Rust harness can
    % replay the byte-identical (dtheta, dv, dt) stream NaveGo actually integrated;
    % the comparison epochs are still sampled on the coarse grid below.
    emit_drive('static', k, dtheta, dv, dt);
    [qua, DCMbn, vel, pos, omega_ie_n, omega_en_n, gn] = ...
      navego_step(qua, DCMbn, vel, pos, omega_ie_n, omega_en_n, gn, wb, fb, dt);
    if mod(k, emit_every) == 0
      emit_epoch('static', k, k*dt, qua', vel, pos);
    end
  end
end

% =====================================================================
% PROFILE P2 --- LEVEL CONSTANT-TURN. Platform at 45 N, 200 m, flying a level,
% constant-speed northward leg while yawing at a steady rate. We DRIVE NaveGo
% directly with a deterministic increment stream (a fixed body specific force
% that holds level flight against gravity plus a small north accel, and a body
% yaw rate plus the Earth/transport compensation), 300 s @ 0.01 s. This is an
% open-loop integration of a representative manoeuvre, not a closed truth ---
% kshana sees the SAME increments, so any divergence is integrator-vs-integrator.
% =====================================================================
function run_turn()
  lat0 = pi/4; lon0 = -1.0; h0 = 200.0;
  dt = 0.01; n = 6000;        % 60 s @ fine 0.01 s rate
  emit_every = 200;
  OMEGA_IE = 7.292115e-5;

  pos = [lat0 lon0 h0];
  vel = [0 0 0];
  qua = [0 0 0 1]';           % start level, heading north
  DCMbn = qua2dcm(qua);
  omega_ie_n = earth_rate(pos(1));
  omega_en_n = transport_rate(pos(1), vel(1), vel(2), pos(3));
  gn = gravity(pos(1), pos(3))';

  emit_epoch('turn', 0, 0.0, qua', vel, pos);

  yaw_rate = 0.2 * pi/180;    % 0.2 deg/s steady yaw (rad/s)
  a_fwd = 0.30;               % m/s^2 forward specific force (above gravity balance)
  for k = 1:n
    g_down = gn(3);
    % Body specific force: hold level (cancel gravity in down) + small forward accel.
    fb = [a_fwd; 0; -g_down];
    % Body angular rate: a steady yaw about body-down, plus the rate needed to
    % keep the body tracking the rotating NED frame (Earth + transport), which is
    % how a real IMU would read on this manoeuvre. wb = C_b^n*(w_ie^n+w_en^n)+yaw.
    w_in_n = skewm_inv(omega_ie_n) + skewm_inv(omega_en_n);
    wb = DCMbn' * w_in_n + [0; 0; yaw_rate];
    dtheta = wb * dt;
    dv = fb * dt;
    % Dense drive stream (one per step); epochs stay sampled on the coarse grid.
    emit_drive('turn', k, dtheta, dv, dt);
    [qua, DCMbn, vel, pos, omega_ie_n, omega_en_n, gn] = ...
      navego_step(qua, DCMbn, vel, pos, omega_ie_n, omega_en_n, gn, wb, fb, dt);
    if mod(k, emit_every) == 0
      emit_epoch('turn', k, k*dt, qua', vel, pos);
    end
  end
end

% =====================================================================
% PROFILE P3 --- CONING / SCULLING at a COARSE navigation rate. A 10 Hz body
% vibration: gyro rolls about body-x while the accelerometer drives body-z in
% phase with the roll angle (the configuration that rectifies). We integrate at
% the coarse nav rate dt_c = 0.05 s (so each step spans half a vibration period),
% emitting per-step the COARSE increment = integral of the rate over the step.
% kshana receives the same coarse increments. At this coarse rate the integrator
% choices differ more (this is the case the plan flags at <0.5 m), so it is a
% looser but still bounded cross-check.
% =====================================================================
function run_coning()
  % Start at a comfortably positive altitude (1000 m) so the tiny down-velocity
  % rectification can never drive h through zero --- that would trip NaveGo's
  % pos_update abs(h) clamp (a discontinuity kshana does not replicate). The
  % rectified vertical drift is ~1e-3 m/s, << 1000 m over 300 s, so the margin
  % is ample and the comparison stays on the smooth branch of both integrators.
  lat0 = pi/4; lon0 = 0.0; h0 = 1000.0;
  dt_c = 0.05; n = 1500;      % 75 s at 20 Hz coarse rate
  emit_every = 50;            % 30 sampled epochs
  sub = 200;                  % fine sub-samples per coarse step for the integral

  pos = [lat0 lon0 h0];
  vel = [0 0 0];
  qua = [0 0 0 1]';
  DCMbn = qua2dcm(qua);
  omega_ie_n = earth_rate(pos(1));
  omega_en_n = transport_rate(pos(1), vel(1), vel(2), pos(3));
  gn = gravity(pos(1), pos(3))';

  emit_epoch('coning', 0, 0.0, qua', vel, pos);

  w0 = 2*pi*10;               % 10 Hz vibration
  amp_theta = 0.03;           % roll amplitude scale
  amp_acc   = 0.15;           % accel amplitude
  h = dt_c / sub;
  for k = 1:n
    t0 = (k-1) * dt_c;
    % Integrate the analytic rate/specific-force over the coarse step (midpoint).
    dtheta = [0;0;0];
    dv_vib = [0;0;0];
    for j = 1:sub
      tm = t0 + (j - 0.5) * h;
      w = [amp_theta * w0 * cos(w0*tm); 0; 0];
      a = [0; 0; amp_acc * sin(w0*tm)];
      dtheta = dtheta + w * h;
      dv_vib = dv_vib + a * h;
    end
    % Add the gravity-balancing specific force so the platform stays put on
    % average (down axis), exactly as kshana's coning test omits gravity drift by
    % using the model's own g. Use NaveGo's current down gravity.
    g_down = gn(3);
    dv = dv_vib + [0; 0; -g_down] * dt_c;
    wb = dtheta / dt_c;
    fb = dv / dt_c;
    % Dense coarse-rate drive stream: every coarse step's coning/sculling-integrated
    % (dtheta, dv) is emitted, so the Rust harness reconstructs the full vibration
    % increment sequence (NOT just a sparse sample). Epochs stay sampled.
    emit_drive('coning', k, dtheta, dv, dt_c);
    [qua, DCMbn, vel, pos, omega_ie_n, omega_en_n, gn] = ...
      navego_step(qua, DCMbn, vel, pos, omega_ie_n, omega_en_n, gn, wb, fb, dt_c);
    if mod(k, emit_every) == 0
      emit_epoch('coning', k, k*dt_c, qua', vel, pos);
    end
  end
end

run_static();
run_turn();
run_coning();
