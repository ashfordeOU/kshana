% SPDX-License-Identifier: AGPL-3.0-only
% Kshana from MATLAB in five calls: load, version, validate, run, connect.
%
%   kshana_quickstart(lib)    % lib = path to libkshana_capi.so / .dylib / kshana_capi.dll
%
% Run from anywhere: the repository paths are found from this file's location.
% Not run on MATLAB in this repository's CI (no licence on the runners); the C calls it makes are
% replayed with Python ctypes by tests/sdk_wrappers.rs.
function kshana_quickstart(lib)
    here = fileparts(mfilename('fullpath'));
    repo = fullfile(here, '..', '..', '..', '..');
    addpath(here);                       % puts the +kshana package on the path
    kshana.loadLibrary(lib);
    cleanup = onCleanup(@() kshana.unloadLibrary());

    fprintf('engine %s\n', kshana.version());

    toml = fileread(fullfile(repo, 'scenarios', 'link-budget.toml'));
    problems = kshana.validate(toml);
    fprintf('validate: %d problem(s)\n', numel(problems));

    r = kshana.run(toml);
    fprintf('link budget: free-space loss %.2f dB, margin %.2f dB, closes = %d\n', ...
            r.free_space_loss_db, r.margin_db, r.closes);

    ex = fullfile(repo, 'examples');
    recs = kshana.connectMap(fileread(fullfile(ex, 'connect', 'timing-monitor.connect.toml')), ...
                             fileread(fullfile(ex, 'obs', 'station.toml')), ...
                             fileread(fullfile(ex, 'connect', 'timing-monitor.csv')));
    fprintf('connect: %d records (1 header + %d epochs)\n', numel(recs), numel(recs) - 1);
end
