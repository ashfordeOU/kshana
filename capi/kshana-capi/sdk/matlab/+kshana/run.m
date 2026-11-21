% SPDX-License-Identifier: AGPL-3.0-only
function [result, json] = run(scenarioToml)
%KSHANA.RUN  Run one scenario and return its result document.
%   result = kshana.run(toml) runs the scenario text toml (char or string, TOML) and
%   returns the result document decoded with jsondecode (a struct).
%   [result, json] = kshana.run(toml) also returns the JSON text exactly as the engine
%   wrote it (char, UTF-8 decoded).
%
%   To run a file: kshana.run(fileread('scenarios/link-budget.toml')).
%   An input the engine refuses raises the error 'kshana:error' with the engine's reason.
    json = callEntry('kshana_run_scenario', {scenarioToml});
    result = jsondecode(json);
end
