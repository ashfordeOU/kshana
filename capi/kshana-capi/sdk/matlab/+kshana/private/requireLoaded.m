% SPDX-License-Identifier: AGPL-3.0-only
function requireLoaded()
%REQUIRELOADED  Fail with a clear message when kshana.loadLibrary has not run.
    if ~libisloaded(libAlias())
        error('kshana:notLoaded', 'load the library first: kshana.loadLibrary(path_to_libkshana_capi)');
    end
end
