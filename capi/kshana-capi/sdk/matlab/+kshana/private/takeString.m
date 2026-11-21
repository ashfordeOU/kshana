% SPDX-License-Identifier: AGPL-3.0-only
function b = takeString(p)
%TAKESTRING  Copy a NUL-terminated string the library returned, then free it.
%   p is a lib.pointer (or empty). Returns the bytes as a uint8 row vector (no NUL);
%   empty when p is NULL. The pointer is freed with kshana_string_free, never free().
    b = uint8([]);
    if isempty(p) || isNull(p)
        return;
    end
    n = 0;
    setdatatype(p, 'uint8Ptr', 1);
    while true
        q = p + n;
        setdatatype(q, 'uint8Ptr', 1);
        if q.Value == 0
            break;
        end
        n = n + 1;
    end
    if n > 0
        setdatatype(p, 'uint8Ptr', n);
        b = reshape(p.Value, 1, []);
    end
    calllib(libAlias(), 'kshana_string_free', p);
end
