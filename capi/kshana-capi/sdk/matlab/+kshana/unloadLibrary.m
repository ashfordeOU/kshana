% SPDX-License-Identifier: AGPL-3.0-only
function unloadLibrary()
%KSHANA.UNLOADLIBRARY  Unload the Kshana C library loaded by kshana.loadLibrary.
%   Does nothing when it is not loaded.
    if libisloaded(libAlias())
        unloadlibrary(libAlias());
    end
end
