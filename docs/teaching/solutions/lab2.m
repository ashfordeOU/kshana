% SPDX-License-Identifier: AGPL-3.0-only
% Lab 2 solution (MATLAB track): a link-budget sweep.   lab2(path_to_libkshana_capi)
% Worked answers: docs/teaching/lab-2-link-budget-sweep.md. Not run on MATLAB in CI; lab2.py checks
% the same answers on the same library.
function lab2(lib)
    repo = kit_setup(lib);
    cleanup = onCleanup(@() kshana.unloadLibrary());
    base = fileread(fullfile(repo, 'scenarios', 'link-budget.toml'));

    % 1. Range.
    m2k = margin(setValue(base, 'range_km', '2000.0'));
    m20k = margin(setValue(base, 'range_km', '20000.0'));
    fprintf('1  %.2f dB at 2,000 km, %.2f dB at 20,000 km, difference %.2f dB\n', m2k, m20k, m2k - m20k);

    % 2. The longest range at which the link closes.
    dMax = 2000 * 10^(m2k / 20);
    at = margin(setValue(base, 'range_km', sprintf('%.1f', dMax)));
    fprintf('2  %.0f km; margin there %.3f dB\n', dMax, abs(at));

    % 3. One astronomical unit.
    au = setValue(base, 'range_km', '1.496e8');
    mAu = margin(au);
    fprintf('3  %.2f dB at 1 AU; highest rate %.1f kbit/s; at 290 kbit/s %+.2f dB\n', ...
            mAu, 1e6 * 10^(mAu / 10) / 1e3, margin(setValue(au, 'data_rate_bps', '2.9e5')));

    % 4. Band.
    bands = {'s', 'x', 'ka'};
    loss = zeros(1, 3);
    for i = 1:3
        r = kshana.run(setValue(base, 'band', ['"' bands{i} '"']));
        loss(i) = r.free_space_loss_db;
        fprintf('4  band %-2s margin %.2f dB\n', bands{i}, r.margin_db);
    end
    fprintf('4  Ka minus X loss %.2f dB\n', loss(3) - loss(2));

    % A plot for the write-up.
    ranges = logspace(3, 8.5, 23);
    m = arrayfun(@(d) margin(setValue(base, 'range_km', sprintf('%.6g', d))), ranges);
    semilogx(ranges, m, '-o'); grid on; yline(0);
    xlabel('range (km)'); ylabel('margin (dB)'); title('Link margin against range (MODELLED)');
end

function m = margin(toml)
    r = kshana.run(toml);
    m = r.margin_db;
end

function toml = setValue(toml, key, value)
    % Replace the line "key = ..." (one line, as the Python solution does).
    toml = regexprep(toml, ['^' key ' = [^\n]*$'], [key ' = ' value], 'lineanchors');
end
