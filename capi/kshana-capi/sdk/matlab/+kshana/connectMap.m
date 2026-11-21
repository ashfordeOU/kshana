% SPDX-License-Identifier: AGPL-3.0-only
function [records, jsonl] = connectMap(mappingToml, stationToml, logText)
%KSHANA.CONNECTMAP  Map a receiver log to kshana.obs/1 records (Kshana Connect).
%   records = kshana.connectMap(mapping, station, logText) applies a kshana.connect/1
%   mapping (TOML text) to a log's text for a station (TOML text). records is a cell
%   array with one decoded struct per line: first the header ("type": "header"), then
%   one "epoch" per log row. The records differ in shape, so they are kept in a cell.
%   [records, jsonl] = ... also returns the JSON-lines text as the engine wrote it.
    jsonl = callEntry('kshana_connect_map', {mappingToml, stationToml, logText});
    lines = regexp(jsonl, '\n', 'split');
    lines = lines(~cellfun(@isempty, strtrim(lines)));
    records = cellfun(@jsondecode, lines, 'UniformOutput', false);
end
