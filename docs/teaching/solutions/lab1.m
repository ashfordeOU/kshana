% SPDX-License-Identifier: AGPL-3.0-only
% Lab 1 solution (MATLAB track): first calls.   lab1(path_to_libkshana_capi)
% Worked answers: docs/teaching/lab-1-first-calls.md. Not run on MATLAB in CI; lab1.py checks the
% same answers on the same library.
function lab1(lib)
    repo = kit_setup(lib);
    cleanup = onCleanup(@() kshana.unloadLibrary());
    toml = fileread(fullfile(repo, 'scenarios', 'link-budget.toml'));

    % 1. Check before you run.
    fprintf('1a %d problems\n', numel(kshana.validate(toml)));
    typo = kshana.validate(strrep(toml, 'kind = "link-budget"', 'kind = "link-budgt"'));
    fprintf('1b %s\n', typo{1});

    % 2. Run it.
    r = kshana.run(toml);
    fprintf('2  loss %.2f dB, Eb/N0 %.2f dB, margin %.2f dB, required G/T %.2f dB/K, closes %d\n', ...
            r.free_space_loss_db, r.eb_n0_db, r.margin_db, r.required_g_over_t_db, r.closes);

    % 3. The free-space loss by hand.
    c = 299792458;
    byHand = 20 * log10(4 * pi * r.range_km * 1e3 * r.link_constants.carrier_frequency_hz / c);
    fprintf('3  by hand %.2f dB (engine %.2f dB)\n', byHand, r.free_space_loss_db);

    % 4. An input the engine refuses.
    bad = regexprep(toml, '^range_km = [^\n]*$', 'range_km = -5.0', 'lineanchors');
    fprintf('4a validate: %d problems\n', numel(kshana.validate(bad)));
    try
        kshana.run(bad);
    catch err
        fprintf('4b %s: %s\n', err.identifier, err.message);
    end
end
