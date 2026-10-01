function run_maast_araim(maast_dir, araim2_dir, fixture_dir, variant)
% Headless MAAST-for-ARAIM-2 driver for tests/integrity_araim_stanford_oracle.rs (Kshana
% cross-validation; not MAAST code).
%
% Runs Stanford "MAAST for ARAIM 2" (https://github.com/stanford-gps-lab/maast_for_araim_2,
% commit ab70e2a3, BSD-3-Clause) as a tool: for every geometry case in
% <fixture_dir>/geometry.csv it forms the user position and local-level frame with MAAST's
% llh2xyz/findxyz2enu, the lines of sight with find_los_xyzb/find_los_enub, applies the 5 degree
% mask the way usrprocess_araim does, builds G as usr_vhpl_araim does (GPS rows first, one clock
% column per constellation present) and calls mhss_raim_baseline_v5 with the pre-registered ISM,
% budget and settings. Writes
%   <fixture_dir>/maast_araim_levels.csv   case, n_gps, n_gal, vpl, hpl, emt, sig_acc, p_not_monitored
%   <fixture_dir>/maast_araim_subsets.csv  case, k, pfault_inst, excluded satellites (c:prn, '|'-separated)
% Usage: octave --no-gui --eval "run_maast_araim('<maast>', '<maast_for_araim_2>', '<fixture dir>' [, '<variant>'])"
global KSH_COMPAT_DIR
addpath(maast_dir);
addpath(araim2_dir, '-begin');
pkg load statistics;
% Octave 8.4 lacks unique(...,'rows','stable')'s third output, which MAAST's
% find_unique_subsets.m needs; octave_compat/unique.m supplies MATLAB's semantics.
KSH_COMPAT_DIR = fullfile(fileparts(mfilename('fullpath')), 'octave_compat');
addpath(KSH_COMPAT_DIR, '-begin');

% Pre-registered ISM and budget.
sig_ura = 1.0; sig_ure = 0.5; b_nom = 0.75; b_cont = 0;
p_sat = 1e-5; p_const_gps = 1e-8; p_const_gal = 1e-4;
% Optional matched-input variants for the uniform-sigma functions (second pre-registration):
%   'uniform_pc'   sigma_URE = sigma_URA = 1.0 m, P_const = 1e-4 for both constellations
%   'uniform_nopc' sigma_URE = sigma_URA = 1.0 m, P_const = 0 for both constellations
% Only the levels file is written, as maast_araim_<variant>_levels.csv.
if nargin < 4
    variant = '';
end
switch variant
    case ''
    case 'uniform_pc'
        sig_ure = 1.0; p_const_gps = 1e-4; p_const_gal = 1e-4;
    case 'uniform_nopc'
        sig_ure = 1.0; p_const_gps = 0; p_const_gal = 0;
    otherwise
        error('unknown variant %s', variant);
end
if isempty(variant)
    tag = 'maast_araim';
else
    tag = ['maast_araim_' variant];
end
prm.phmi_vert = 9.8e-8; prm.phmi_hor = 2e-9;
prm.pfa_vert = 3.9e-6; prm.pfa_hor = 9e-8;
prm.p_thres = 8e-8; prm.p_emt = 1e-5;
prm.fc_thres = 0.01; prm.p_exc_thres = 1;
prm.pl_tol = 1e-4;
prm.N_es_int = 1; prm.N_es_cont = 1;
prm.max_pmd_flag = 0; prm.fast = 0; prm.hpl_variant = 0;
prm.vpl_target = 35; prm.hpl_target = 40;     % only read in fast mode
prm.sig_acc_max_vert = Inf; prm.sig_acc_max_hor1 = Inf; prm.sig_acc_max_hor2 = Inf;
mask = sin(5 * pi / 180);

fid = fopen(fullfile(fixture_dir, 'geometry.csv'), 'r');
fgetl(fid);
C = textscan(fid, '%f %s %f %f %f %f %f %f %f %f', 'Delimiter', ',');
fclose(fid);
case_id = C{1}; lat = C{3}; lon = C{4}; cst = C{6}; prn = C{7};
xyz = [C{8}, C{9}, C{10}];

cases = unique(case_id);
lev = fopen(fullfile(fixture_dir, [tag '_levels.csv']), 'w');
fprintf(lev, 'case,n_gps,n_gal,vpl_m,hpl_m,emt_m,sig_acc_m,p_not_monitored\n');
if isempty(variant)
    sub = fopen(fullfile(fixture_dir, 'maast_araim_subsets.csv'), 'w');
else
    sub = fopen('/dev/null', 'w');
end
fprintf(sub, 'case,k,pfault_inst,excluded\n');
for ci = 1:numel(cases)
    rows = find(case_id == cases(ci));
    llh = [lat(rows(1)), lon(rows(1)), 0];
    usr_xyz = llh2xyz(llh);
    % As init_usrdata.m does (findxyz2enu returns a transposed matrix for a single user, so
    % call it for a duplicated user and take the first row of each unit vector).
    T = findxyz2enu([llh(1); llh(1)] * pi / 180, [llh(2); llh(2)] * pi / 180);
    ehat = reshape(T(1, 1, :), 1, 3);
    nhat = reshape(T(1, 2, :), 1, 3);
    uhat = reshape(T(1, 3, :), 1, 3);
    los_xyzb = find_los_xyzb(usr_xyz, xyz(rows, :));
    los_enub = find_los_enub(los_xyzb, ehat, nhat, uhat);
    above = -los_enub(:, 3) >= mask;
    ig = find(above & cst(rows) == 0);
    ie = find(above & cst(rows) == 1);
    idx = [ig; ie];
    ngps = numel(ig); ngal = numel(ie); nsat = ngps + ngal;
    clk = [];
    pc = [];
    if ngps > 0
        clk = [clk, [ones(ngps, 1); zeros(ngal, 1)]];
        pc = [pc; p_const_gps];
    end
    if ngal > 0
        clk = [clk, [zeros(ngps, 1); ones(ngal, 1)]];
        pc = [pc; p_const_gal];
    end
    if nsat <= 3
        fprintf(lev, '%d,%d,%d,Inf,Inf,Inf,Inf,NaN\n', cases(ci), ngps, ngal);
        continue;
    end
    G = [los_enub(idx, 1:3), clk];
    o = ones(nsat, 1);
    try
        [vpl, hpl, sig_acc, emt, subsets, pfault_inst, ~, p_nm] = mhss_raim_baseline_v5( ...
            G, sig_ura^2 * o, sig_ure^2 * o, b_nom * o, b_cont * o, p_sat * o, pc, ...
            zeros(nsat, 1), zeros(numel(pc), 1), 0, prm, 1);
    catch err
        % MAAST itself stops on this case; record that, with its message, rather than a number.
        fprintf(lev, '%d,%d,%d,NaN,NaN,NaN,NaN,NaN\n', cases(ci), ngps, ngal);
        fprintf(sub, '%d,0,NaN,MAAST error: %s\n', cases(ci), strrep(err.message, ',', ';'));
        continue;
    end
    fprintf(lev, '%d,%d,%d,%.17g,%.17g,%.17g,%.17g,%.17g\n', cases(ci), ngps, ngal, ...
            vpl, hpl, emt, sig_acc, p_nm);
    ids = [cst(rows(idx)), prn(rows(idx))];
    for k = 1:size(subsets, 1)
        out = find(subsets(k, :) == 0);
        names = arrayfun(@(j) sprintf('%d:%d', ids(j, 1), ids(j, 2)), out, ...
                         'UniformOutput', false);
        fprintf(sub, '%d,%d,%.17g,%s\n', cases(ci), k, pfault_inst(k), strjoin(names, '|'));
    end
end
fclose(lev);
fclose(sub);
fprintf('MAAST ARAIM: %d cases\n', numel(cases));
end
