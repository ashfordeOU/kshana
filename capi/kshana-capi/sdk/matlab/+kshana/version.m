% SPDX-License-Identifier: AGPL-3.0-only
function v = version()
%KSHANA.VERSION  The engine version, for example '0.41.0'.
%   The C function returns a static string, so nothing is freed here.
    requireLoaded();
    v = calllib(libAlias(), 'kshana_version');
end
