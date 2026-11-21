% SPDX-License-Identifier: AGPL-3.0-only
% Lab 3 solution (MATLAB track): map a receiver log.   lab3(path_to_libkshana_capi)
% Worked answers: docs/teaching/lab-3-connect-a-log.md. Not run on MATLAB in CI; lab3.py checks the
% same answers on the same library.
function lab3(lib)
    repo = kit_setup(lib);
    cleanup = onCleanup(@() kshana.unloadLibrary());
    ex = fullfile(repo, 'examples');
    recs = kshana.connectMap(fileread(fullfile(ex, 'connect', 'timing-monitor.connect.toml')), ...
                             fileread(fullfile(ex, 'obs', 'station.toml')), ...
                             fileread(fullfile(ex, 'connect', 'timing-monitor.csv')));
    header = recs{1};
    epochs = recs(2:end);

    % 1. What came out.
    fprintf('1  %d records, %d epochs, skipped_records = %d\n', numel(recs), numel(epochs), header.skipped_records);

    % 2. Time and 3. units.
    fprintf('2  %s\n', epochs{1}.time_label);
    fprintf('3  %.2f m\n', epochs{1}.fix.height_m);

    % 4. What changes.
    for i = 1:numel(epochs)
        e = epochs{i};
        sats = {e.cn0.sat};
        g05 = e.cn0(strcmp(sats, 'G05')).cn0_dbhz;
        fprintf('4  t = %.0f s: %d satellites, G25 %s, G05 %.1f dB-Hz, agc %.0f, spoofing %d\n', ...
                e.t_s, numel(sats), ternary(any(strcmp(sats, 'G25')), 'present', 'missing'), ...
                g05, e.agc, e.self_report.spoofing);
    end
end

function s = ternary(c, a, b)
    if c, s = a; else, s = b; end
end
