function run_maast_sbas(maast_dir, out_dir, mode)
% Headless MAAST driver for tests/integrity_sbas_stanford_oracle.rs (Kshana cross-validation).
%
% Runs Stanford MAAST (https://github.com/stanford-gps-lab/maast, commit 7d32b049) as a tool on
% its own recorded real broadcasts, primary source GEO PRN 131 (WAAS), with the configuration of
% MAAST's own execution test (test/MAASTExecutionTests.m) and authentication off:
%   mode 'L1': sbas_messages_2020_001.mat, dual_freq = 0, tow 258803..261803 s every 300 s
%              (start one second after the file's fifth type-18 message: MAAST's L1 start-up
%              mask check fails once any band has been received twice)
%   mode 'L5': maast_messages_2019_365.mat, dual_freq = 1, tow 259800..262800 s every 300 s,
%              authentication off (see the stand-in receiver below)
% (precision-approach mode in both). A recording
% shim (shim/usr_vhpl.m) captures, per protected user and epoch, the satellites' ENU lines of
% sight, the four variance components and MAAST's VPL/HPL. Writes
%   <out_dir>/maast_sbas_<mode>_sats.csv t, usr, prn, los_e, los_n, los_u, s2_flt, s2_uire, s2_tropo, s2_air
%   <out_dir>/maast_sbas_<mode>_levels.csv t, usr, lat_deg, lon_deg, vpl_m, hpl_m
% Usage: octave --no-gui --eval "run_maast_sbas('<maast clone>', '<out dir>', 'L1')"
global KSH_SHIM_DIR KSH_SAT_ROWS KSH_PL_ROWS
KSH_SAT_ROWS = [];
KSH_PL_ROWS = [];
here = fileparts(mfilename('fullpath'));
KSH_SHIM_DIR = fullfile(here, 'shim');
addpath(maast_dir);
addpath(KSH_SHIM_DIR, '-begin');
pkg load statistics;

work = tempname();
mkdir(work);
old = cd(work);

init_const;
init_col_labels_pub;
init_mops;

global COL_USR_LL
global UDREI_CONST GEOUDREI_CONST MT27
global TRUTH_FLAG BRAZPARAMS RTR_FLAG IPP_SPREAD_FLAG
global GUI_OUT_AVAIL GUI_OUT_UDREMAP GUI_OUT_GIVEMAP GUI_OUT_COVAVAIL ...
       GUI_OUT_UDREHIST GUI_OUT_GIVEHIST GUI_OUT_VHPL
global SBAS_MESSAGE_FILE SBAS_PRIMARY_SOURCE AUTHENTICATION_ENABLED

% Authentication off. Octave 8.4 cannot parse MAAST's TESLA classes; MAAST's L5 decoder still
% dereferences the receiver for type-50 messages, so give it a stand-in that keeps the CRC check
% and reports every message verified (MAAST's own authentication-off behaviour).
% The type-51 key messages go to a stand-in key state machine (and auth_stub/MT51.m) that
% ignores them.
global mt50Receiver keyStateMachine
AUTHENTICATION_ENABLED = false;
mt50Receiver = struct('include_crc', true, 'check_if_message_verified', @(t) true(size(t)));
keyStateMachine = struct('process_mt51', @(m) [], 'full_stack_authenticated', @(varargin) false);
if strcmp(mode, 'L5')
    addpath(fullfile(here, 'auth_stub'), '-begin');
end
GUI_OUT_AVAIL = 1; GUI_OUT_VHPL = 2; GUI_OUT_UDREMAP = 3; GUI_OUT_GIVEMAP = 4;
GUI_OUT_UDREHIST = 5; GUI_OUT_GIVEHIST = 6; GUI_OUT_COVAVAIL = 7;
% TRUTH_FLAG = 1 for L1 only: in replay mode its only effect is to let usr_vhpl protect a user
% without a ranging GEO among its satellites (see the test's Amendment 5).
TRUTH_FLAG = strcmp(mode, 'L1'); BRAZPARAMS = 0; RTR_FLAG = 0; IPP_SPREAD_FLAG = 0;

gpsudrefun = 'af_udreconst'; UDREI_CONST = 6; MT27 = [];
geoudrefun = 'af_geoconst'; GEOUDREI_CONST = 11;
givefun = '';
dual_freq = strcmp(mode, 'L5');
igpfile = 'igpjoint_R51CY18.txt';
wrsgpscnmpfun = ''; wrsgeocnmpfun = [];
usrcnmpfun = 'af_cnmp_mops';
init_cnmp_mops;
wrsfile = 'wrs_foc.txt';
usrpolyfile = 'usrn_america.txt';
usrlatstep = 5; usrlonstep = 5;
svfile = 'alm01jan2020.txt';
if strcmp(mode, 'L5')
    TStart = 3 * 86400 + 2086 * 604800 + 600;  % tow 259800 s
else
    TStart = 2086 * 604800 + 258803;           % tow 258803 s
end
TEnd = TStart + 3000 + 1;   % svmrunpub subtracts 1 s from the end time
TStep = 300;
geodata = [131  -117.0  213  401 37 455  51  -28 42  30  3  1   5    1];
if dual_freq
    SBAS_MESSAGE_FILE = 'maast_messages_2019_365';
else
    SBAS_MESSAGE_FILE = 'sbas_messages_2020_001';
end
SBAS_PRIMARY_SOURCE = 131;
pa_mode = 1;
vhal = [35, 40];
init_hist;
outputs = [0 0 0 0 0 0 0];
percent = 0.95;

svmrunpub(gpsudrefun, geoudrefun, givefun, usrcnmpfun, ...
          wrsgpscnmpfun, wrsgeocnmpfun, wrsfile, usrpolyfile, ...
          igpfile, svfile, geodata, TStart, TEnd, TStep, usrlatstep, ...
          usrlonstep, outputs, percent, vhal, pa_mode, dual_freq);

S = load('outputs', 'usrdata', 'vpl', 'hpl');
cd(old);

% Cross-check: the shim's recorded levels are the levels svmrunpub stored.
times = unique(KSH_PL_ROWS(:, 1));
for k = 1:numel(times)
    r = KSH_PL_ROWS(KSH_PL_ROWS(:, 1) == times(k), :);
    v = S.vpl(r(:, 2), k); h = S.hpl(r(:, 2), k);
    ok = (isnan(v) & (r(:, 3) <= 0 | isnan(r(:, 3)))) | abs(v - r(:, 3)) == 0;
    if ~all(ok) || ~all((isnan(h) & (r(:, 4) <= 0 | isnan(r(:, 4)))) | abs(h - r(:, 4)) == 0)
        error('recorded levels differ from svmrunpub outputs at epoch %d', k);
    end
end

ll = S.usrdata(:, COL_USR_LL);
lv = KSH_PL_ROWS;
lv = [lv(:, 1:2), ll(lv(:, 2), 1), ll(lv(:, 2), 2), lv(:, 3:4)];
fid = fopen(fullfile(out_dir, ['maast_sbas_' mode '_levels.csv']), 'w');
fprintf(fid, 't_gps_s,usr,lat_deg,lon_deg,vpl_m,hpl_m\n');
fprintf(fid, '%.17g,%d,%.17g,%.17g,%.17g,%.17g\n', lv');
fclose(fid);
fid = fopen(fullfile(out_dir, ['maast_sbas_' mode '_sats.csv']), 'w');
fprintf(fid, 't_gps_s,usr,prn,los_e,los_n,los_u,s2_flt_m2,s2_uire_m2,s2_tropo_m2,s2_air_m2\n');
fprintf(fid, '%.17g,%d,%d,%.17g,%.17g,%.17g,%.17g,%.17g,%.17g,%.17g\n', KSH_SAT_ROWS');
fclose(fid);
fprintf('wrote %d level rows and %d satellite rows\n', size(lv, 1), size(KSH_SAT_ROWS, 1));
end
