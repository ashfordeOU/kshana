% SPDX-License-Identifier: AGPL-3.0-only
%
% Fixture generator for tests/gnss_ins_navego_dataset_oracle.rs (matrix row
% "GNSS/INS sensor fusion", scoped to the loosely coupled filter).
%
% The oracle is NaveGo v1.4 (https://github.com/rodralez/NaveGo, tag v1.4, commit
% 24d9488, LGPL-3.0), run as a tool under GNU Octave: its loosely coupled
% ins-gnss/ins_gnss.m on its own real example dataset (examples/real-data:
% ekinox_imu.mat, ekinox_gnss.mat, ref.mat). Nothing here calls or reads Kshana.
%
% Usage (from this directory, after `source ~/Code/kshana-oracles/env.sh`):
%   octave --no-gui -q --eval "gen_gnss_ins_navego"
%
% It writes, next to itself:
%   imu_20hz_f32.bin  the 200 Hz IMU averaged over groups of 10 samples (mean
%                     angular rate and mean specific force over each 50 ms group),
%                     groups ending on the GNSS epochs, rounded to float32; rows of
%                     6 little-endian float32 [wx wy wz fx fy fz] (rad/s, m/s^2).
%                     Row 0 is the first 200 Hz sample (the initial epoch).
%   imu_time.csv      t0 and the uniform step of those rows
%   gnss.csv          k (IMU row the fix coincides with, NaveGo's own eps rule),
%                     t, lat, lon (rad), h (m), vn, ve, vd (m/s)
%   ref.csv           the Ekinox reference trajectory: t, lat, lon, h
%   navego_at_ref.csv NaveGo's solution on the float32 20 Hz input, linearly
%                     interpolated at every reference epoch strictly inside it
%   navego_innov.csv  gnss row (1-based), NaveGo position innovation N, E, D (m)
%                     at every GNSS epoch where it applied a position update
%   meta.json         the dataset's IMU and GNSS parameters, NaveGo's own RMS
%                     figures (20 Hz float32 input and, for context, the original
%                     200 Hz input), and the source SHA-256 values

function gen_gnss_ins_navego()
  navego = getenv('NAVEGO');
  if isempty(navego)
    error('NAVEGO is not set: source ~/Code/kshana-oracles/env.sh');
  end
  addpath(fullfile(navego, 'ins'));
  addpath(fullfile(navego, 'ins-gnss'));
  addpath(fullfile(navego, 'conversions'));
  addpath(fullfile(navego, 'performance-analysis'));
  addpath(fullfile(navego, 'misc'));
  src = fullfile(navego, 'examples', 'real-data');
  here = fileparts(mfilename('fullpath'));
  % obsv() is only used by ins_gnss.m for its diagnostic observability count; the
  % Octave control package is not installed, so a standard-definition stand-in is used.
  if ~exist('obsv')
    addpath(fullfile(here, 'octave_shims'));
  end

  load(fullfile(src, 'ref.mat'));          % ref
  load(fullfile(src, 'ekinox_imu.mat'));   % ekinox_imu
  load(fullfile(src, 'ekinox_gnss.mat'));  % ekinox_gnss
  imu = ekinox_imu;  gnss = ekinox_gnss;

  % ---- the common 20 Hz float32 input ------------------------------------
  M = 10;
  ngroups = floor((numel(imu.t) - 1) / M);
  t20 = zeros(ngroups + 1, 1);
  wb20 = zeros(ngroups + 1, 3);  fb20 = zeros(ngroups + 1, 3);
  t20(1) = imu.t(1);  wb20(1, :) = imu.wb(1, :);  fb20(1, :) = imu.fb(1, :);
  for g = 1:ngroups
    rows = (2 + (g - 1) * M):(1 + g * M);
    t20(g + 1) = imu.t(rows(end));
    wb20(g + 1, :) = mean(imu.wb(rows, :), 1);
    fb20(g + 1, :) = mean(imu.fb(rows, :), 1);
  end
  wb20 = double(single(wb20));
  fb20 = double(single(fb20));
  dt20 = (t20(end) - t20(1)) / (numel(t20) - 1);
  if max(abs(diff(t20) - dt20)) > 1e-6
    error('20 Hz grid is not uniform');
  end
  fid = fopen(fullfile(here, 'imu_20hz_f32.bin'), 'w', 'ieee-le');
  fwrite(fid, single([wb20 fb20])', 'float32');
  fclose(fid);
  fid = fopen(fullfile(here, 'imu_time.csv'), 'w');
  fprintf(fid, 't0_s,dt_s,rows\n%.6f,%.6f,%d\n', t20(1), dt20, numel(t20));
  fclose(fid);

  imu20 = imu;
  imu20.t = t20;  imu20.wb = wb20;  imu20.fb = fb20;  imu20.freq = 1 / dt20;

  % ---- GNSS rows and the IMU row each coincides with (ins_gnss's eps rule) -
  kk = zeros(numel(gnss.t), 1);
  for j = 1:numel(gnss.t)
    hit = find(t20 >= gnss.t(j) - gnss.eps & t20 < gnss.t(j) + gnss.eps);
    if numel(hit) == 1
      kk(j) = hit - 1;              % 0-based row
    else
      kk(j) = -1;
    end
  end
  fid = fopen(fullfile(here, 'gnss.csv'), 'w');
  fprintf(fid, 'k,t,lat_rad,lon_rad,h_m,vn,ve,vd\n');
  for j = 1:numel(gnss.t)
    fprintf(fid, '%d,%.3f,%.11f,%.11f,%.4f,%.4f,%.4f,%.4f\n', kk(j), gnss.t(j), ...
            gnss.lat(j), gnss.lon(j), gnss.h(j), gnss.vel(j, 1), gnss.vel(j, 2), gnss.vel(j, 3));
  end
  fclose(fid);

  fid = fopen(fullfile(here, 'ref.csv'), 'w');
  fprintf(fid, 't,lat_rad,lon_rad,h_m\n');
  for j = 1:numel(ref.t)
    fprintf(fid, '%.3f,%.11f,%.11f,%.4f\n', ref.t(j), ref.lat(j), ref.lon(j), ref.h(j));
  end
  fclose(fid);

  % ---- NaveGo on the common input -----------------------------------------
  nav20 = ins_gnss(imu20, gnss, 'quaternion');
  inside = ref.t > nav20.t(1) & ref.t < nav20.t(end);
  tr = ref.t(inside);
  lat_i = interp1(nav20.t, nav20.lat, tr, 'linear');
  lon_i = interp1(nav20.t, nav20.lon, tr, 'linear');
  h_i   = interp1(nav20.t, nav20.h,   tr, 'linear');
  fid = fopen(fullfile(here, 'navego_at_ref.csv'), 'w');
  fprintf(fid, 't,lat_rad,lon_rad,h_m\n');
  for j = 1:numel(tr)
    fprintf(fid, '%.3f,%.11f,%.11f,%.4f\n', tr(j), lat_i(j), lon_i(j), h_i(j));
  end
  fclose(fid);

  % Position innovations where NaveGo applied a position update (non-ZUPT rows).
  vpos = nav20.v(:, 4:6);
  used = find(any(vpos ~= 0, 2));
  fid = fopen(fullfile(here, 'navego_innov.csv'), 'w');
  fprintf(fid, 'gnss_row,vn_m,ve_m,vd_m\n');
  for j = used'
    fprintf(fid, '%d,%.6e,%.6e,%.6e\n', j, vpos(j, 1), vpos(j, 2), vpos(j, 3));
  end
  fclose(fid);

  [h20, v20] = rms_vs_ref(nav20, ref);

  % Context only: NaveGo on the original 200 Hz record.
  nav200 = ins_gnss(imu, gnss, 'quaternion');
  [h200, v200] = rms_vs_ref(nav200, ref);

  fid = fopen(fullfile(here, 'meta.json'), 'w');
  fprintf(fid, '{\n');
  fprintf(fid, '  "navego": "NaveGo v1.4 (tag v1.4, commit 24d9488), ins_gnss.m, GNU Octave %s",\n', version());
  pr = @(name, v) fprintf(fid, '  "%s": [%s],\n', name, strjoin(arrayfun(@(x) sprintf('%.10g', x), v, 'UniformOutput', false), ', '));
  pr('gnss_stdm', gnss.stdm);  pr('gnss_stdv', gnss.stdv);  pr('gnss_larm', gnss.larm);
  pr('imu_ini_align', imu.ini_align);  pr('imu_ini_align_err', imu.ini_align_err);
  pr('imu_ab_sta', imu.ab_sta);  pr('imu_gb_sta', imu.gb_sta);
  pr('imu_ab_dyn', imu.ab_dyn);  pr('imu_gb_dyn', imu.gb_dyn);
  pr('imu_ab_psd', imu.ab_psd);  pr('imu_gb_psd', imu.gb_psd);
  pr('imu_ab_corr', imu.ab_corr);  pr('imu_gb_corr', imu.gb_corr);
  pr('imu_arw', imu.arw);  pr('imu_vrw', imu.vrw);
  fprintf(fid, '  "navego_20hz_f32_horizontal_rms_m": %.6f,\n', h20);
  fprintf(fid, '  "navego_20hz_f32_vertical_rms_m": %.6f,\n', v20);
  fprintf(fid, '  "navego_200hz_context_horizontal_rms_m": %.6f,\n', h200);
  fprintf(fid, '  "navego_200hz_context_vertical_rms_m": %.6f,\n', v200);
  fprintf(fid, '  "navego_position_updates": %d\n', numel(used));
  fprintf(fid, '}\n');
  fclose(fid);
  printf('NaveGo 20 Hz f32: horizontal %.4f m, vertical %.4f m; 200 Hz: %.4f, %.4f\n', h20, v20, h200, v200);
end

function [hr, vr] = rms_vs_ref(nav, ref)
  inside = ref.t > nav.t(1) & ref.t < nav.t(end);
  tr = ref.t(inside);
  lat = interp1(nav.t, nav.lat, tr, 'linear');
  lon = interp1(nav.t, nav.lon, tr, 'linear');
  h   = interp1(nav.t, nav.h,   tr, 'linear');
  [RM, RN] = radius(ref.lat(inside));
  dn = (lat - ref.lat(inside)) .* (RM + ref.h(inside));
  de = (lon - ref.lon(inside)) .* (RN + ref.h(inside)) .* cos(ref.lat(inside));
  dd = -(h - ref.h(inside));
  hr = sqrt(mean(dn .^ 2 + de .^ 2));
  vr = sqrt(mean(dd .^ 2));
end
