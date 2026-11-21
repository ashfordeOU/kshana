% SPDX-License-Identifier: AGPL-3.0-only
function repo = kit_setup(lib)
%KIT_SETUP  Put the +kshana package on the path, load the library, return the repository root.
%   Used by lab1.m, lab2.m and lab3.m. Not run on MATLAB in CI (see docs/teaching/README.md).
    here = fileparts(mfilename('fullpath'));
    repo = fullfile(here, '..', '..', '..');
    addpath(fullfile(repo, 'capi', 'kshana-capi', 'sdk', 'matlab'));
    kshana.loadLibrary(lib);
end
