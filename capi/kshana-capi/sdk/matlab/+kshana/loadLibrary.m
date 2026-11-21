% SPDX-License-Identifier: AGPL-3.0-only
function loadLibrary(lib, header)
%KSHANA.LOADLIBRARY  Load the Kshana C library (libkshana_capi) into MATLAB.
%   kshana.loadLibrary(lib) loads lib (libkshana_capi.so, libkshana_capi.dylib or
%   kshana_capi.dll) with the header shipped next to this package
%   (capi/kshana-capi/include/kshana.h).
%   kshana.loadLibrary(lib, header) names the header explicitly.
%
%   The library stays loaded under the alias 'kshana_capi' until kshana.unloadLibrary.
%   Calling it again while loaded does nothing. loadlibrary parses the header, which on
%   64-bit MATLAB needs a supported C compiler (`mex -setup C`).
%
%   Not run on MATLAB in this repository's CI (no licence on the runners); the same call
%   sequence is replayed with Python ctypes by tests/sdk_wrappers.rs.
    if nargin < 1 || isempty(lib)
        error('kshana:usage', 'kshana.loadLibrary(lib[, header]): give the path to libkshana_capi');
    end
    if nargin < 2 || isempty(header)
        here = fileparts(fileparts(mfilename('fullpath')));       % .../sdk/matlab
        header = fullfile(here, '..', '..', 'include', 'kshana.h');
    end
    if ~isfile(lib)
        error('kshana:noLibrary', 'no library at %s (build it: cd capi/kshana-capi && cargo build --release)', lib);
    end
    if ~isfile(header)
        error('kshana:noHeader', 'no header at %s', header);
    end
    if ~libisloaded(libAlias())
        loadlibrary(lib, header, 'alias', libAlias());
    end
end
