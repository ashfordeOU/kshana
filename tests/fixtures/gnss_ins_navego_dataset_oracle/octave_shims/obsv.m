% SPDX-License-Identifier: AGPL-3.0-only
%
% Stand-in for the Octave control package's obsv(A, C), which NaveGo's ins_gnss.m
% calls only to count observable states for its diagnostic output `ob` (the count
% never feeds back into the navigation solution). Standard definition: the
% observability matrix [C; C A; C A^2; ...; C A^(n-1)].
function O = obsv(A, C)
  n = size(A, 1);
  O = zeros(size(C, 1) * n, n);
  blk = C;
  for k = 1:n
    O((k - 1) * size(C, 1) + (1:size(C, 1)), :) = blk;
    blk = blk * A;
  end
end
