% SPDX-License-Identifier: AGPL-3.0-only
% Kshana SDK conformance driver for MATLAB over the C interface with loadlibrary (roadmap 0.42 I9).
% MATLAB's loadlibrary is the documented route to a C shared library; a MEX gateway is not needed.
%
%   kshana_conformance(lib, header, outdir, s1, s2, s3, mapping, station, log)
%
% lib is libkshana_capi.so / .dylib / kshana_capi.dll; header is capi/kshana-capi/include/kshana.h.
% Not run in this repository's CI (no MATLAB licence on the runners); the C, C++, Python, Go, Java and
% .NET drivers run there and must give the same bytes.
function kshana_conformance(lib, header, outdir, s1, s2, s3, mapping, station, logfile)
    if ~libisloaded('kshana_capi')
        loadlibrary(lib, header, 'alias', 'kshana_capi');
    end
    cleanup = onCleanup(@() unloadlibrary('kshana_capi'));
    scen = {s1, s2, s3};
    for i = 1:3
        put(outdir, sprintf('run-%d.json', i), call('kshana_run_scenario', {slurp(scen{i})}));
    end
    put(outdir, 'map.jsonl', call('kshana_connect_map', {slurp(mapping), slurp(station), slurp(logfile)}));
    fprintf('kshana %s conformance: 4 outputs written\n', calllib('kshana_capi', 'kshana_version'));
end

function out = call(fn, inputs)
    % Inputs go in as NUL-terminated uint8 arrays. The two out-parameters are passed as void** so that
    % the returned pointers stay raw and can be handed back to kshana_string_free (a char** passed as
    % MATLAB's stringPtrPtr would be copied and could not be freed).
    args = cellfun(@(b) [b, uint8(0)], inputs, 'UniformOutput', false);
    okp = libpointer('voidPtrPtr'); errp = libpointer('voidPtrPtr');
    rc = calllib('kshana_capi', fn, args{:}, okp, errp);
    result = take(okp.Value); reason = take(errp.Value);
    if rc ~= 0 || isempty(result)
        error('kshana:error', 'kshana error %d: %s', rc, char(reason));
    end
    out = result;
end

function b = take(p)
    % Copy a returned string out of native memory, then free it with kshana_string_free.
    b = uint8([]);
    if isNull(p), return; end
    n = 0;
    setdatatype(p, 'uint8Ptr', 1);
    while true
        q = p + n; setdatatype(q, 'uint8Ptr', 1);
        if q.Value == 0, break; end
        n = n + 1;
    end
    setdatatype(p, 'uint8Ptr', n);
    b = p.Value(:)';
    calllib('kshana_capi', 'kshana_string_free', p);
end

function b = slurp(path)
    f = fopen(path, 'r'); c = onCleanup(@() fclose(f));
    b = fread(f, Inf, '*uint8')';
end

function put(dir, name, bytes)
    f = fopen(fullfile(dir, name), 'w'); c = onCleanup(@() fclose(f));
    fwrite(f, bytes, 'uint8');
end
