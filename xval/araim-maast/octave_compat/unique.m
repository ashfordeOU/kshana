function varargout = unique(varargin)
% Octave-compatibility shim (Kshana cross-validation driver; not MAAST code).
% GNU Octave 8.4's unique() does not implement the third output J with the 'stable' option and
% returns it empty; MAAST's find_unique_subsets.m relies on it to sum the probabilities of
% identical subsets. This shim computes [C, IA, IC] = unique(A, 'rows', 'stable') with MATLAB's
% semantics (C = A(IA,:) in order of first occurrence, A = C(IC,:)) and defers every other call
% to Octave's own unique().
global KSH_COMPAT_DIR
if nargin == 3 && ischar(varargin{2}) && ischar(varargin{3}) && ...
        strcmp(varargin{2}, 'rows') && strcmp(varargin{3}, 'stable')
    A = varargin{1};
    n = size(A, 1);
    ia = zeros(0, 1);
    ic = zeros(n, 1);
    for i = 1:n
        hit = 0;
        for k = 1:numel(ia)
            if isequal(A(ia(k), :), A(i, :))
                hit = k;
                break;
            end
        end
        if hit == 0
            ia(end + 1, 1) = i;
            hit = numel(ia);
        end
        ic(i) = hit;
    end
    varargout = {A(ia, :), ia, ic};
    return;
end
rmpath(KSH_COMPAT_DIR);
try
    [varargout{1:max(nargout, 1)}] = unique(varargin{:});
catch err
    addpath(KSH_COMPAT_DIR, '-begin');
    rethrow(err);
end
addpath(KSH_COMPAT_DIR, '-begin');
end
