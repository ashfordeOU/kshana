% SPDX-License-Identifier: AGPL-3.0-only
function problems = validate(scenarioToml)
%KSHANA.VALIDATE  Check a scenario without running it.
%   problems = kshana.validate(toml) returns a cell array of char, one entry per problem;
%   it is empty ({}) when the scenario is valid. Checks are structural (the kind, required
%   fields); a value the model refuses (a negative range, say) is reported by kshana.run.
    json = callEntry('kshana_validate_scenario', {scenarioToml});
    decoded = jsondecode(json);
    if isempty(decoded)
        problems = {};
    elseif ischar(decoded)
        problems = {decoded};
    else
        problems = reshape(cellstr(decoded), 1, []);
    end
end
