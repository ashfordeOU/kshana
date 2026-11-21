% SPDX-License-Identifier: AGPL-3.0-only
function out = callEntry(fn, inputs)
%CALLENTRY  Call one string-in, string-out entry point of kshana.h.
%   Each input (char or string) is encoded as UTF-8 and passed NUL-terminated as uint8.
%   The two out-parameters are passed as void** so the returned pointers stay raw and can
%   be handed back to kshana_string_free (a char** passed as MATLAB's stringPtrPtr would
%   be copied and could not be freed). Both strings are copied out and freed exactly once,
%   before any error is raised. The same pattern is in ../../kshana_conformance.m.
    requireLoaded();
    args = cell(1, numel(inputs));
    for i = 1:numel(inputs)
        v = inputs{i};
        if isstring(v), v = char(v); end
        if ~ischar(v)
            error('kshana:usage', '%s: argument %d must be text (char or string)', fn, i);
        end
        args{i} = [unicode2native(v, 'UTF-8'), uint8(0)];
    end
    okp = libpointer('voidPtrPtr');
    errp = libpointer('voidPtrPtr');
    rc = calllib(libAlias(), fn, args{:}, okp, errp);
    hasResult = ~isNull(okp.Value);
    result = takeString(okp.Value);
    reason = takeString(errp.Value);
    if rc ~= 0 || ~hasResult
        error('kshana:error', 'kshana error %d (%s): %s', rc, codeName(rc), ...
              native2unicode(reason, 'UTF-8'));
    end
    out = native2unicode(result, 'UTF-8');
end

function s = codeName(rc)
    names = {'KSHANA_OK', 'KSHANA_ERROR', 'KSHANA_BAD_ARGUMENT', 'KSHANA_INTERNAL'};
    if rc >= 0 && rc < numel(names)
        s = names{rc + 1};
    else
        s = 'unknown code';
    end
end
