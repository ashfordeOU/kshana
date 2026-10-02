% SPDX-License-Identifier: AGPL-3.0-only
% Driver: calls the authors' TDOAFDOALocMvgSrcSenCRLB(s, s_dot, uo, u_doto, Q_alpha) for the
% Ho and Xu (2004) Table I receivers and three sources, noise power c^2 sigma_d^2 = 1 m^2,
% Q = blkdiag(R, 0.1 R), R = (I + 1 1')/2, and writes every 6x6 bound to JSON.
function ho_xu_author_crlb_driver(out)
  s = [300 400 300 350 -100; 100 150 500 200 -100; 150 100 200 100 -100];
  s_dot = [30 -30 10 10 -20; -20 10 -20 20 10; 20 20 10 30 10];
  M = size(s, 2);
  R = (eye(M-1) + ones(M-1)) / 2;
  Q = [R, zeros(M-1); zeros(M-1), 0.1 * R];
  names = {'far_2000_2500_3000', 'near_printed_300_325_275', 'near_erratum_600_650_550'};
  srcs = {[2000; 2500; 3000], [300; 325; 275], [600; 650; 550]};
  u_dot = [-20; 15; 40];
  fid = fopen(out, 'w');
  fprintf(fid, '{\n  "octave_version": "%s",\n  "cases": {\n', OCTAVE_VERSION);
  for k = 1:numel(srcs)
    C = TDOAFDOALocMvgSrcSenCRLB(s, s_dot, srcs{k}, u_dot, Q);
    fprintf(fid, '    "%s": [\n', names{k});
    for i = 1:6
      fprintf(fid, '      [%s]', strjoin(arrayfun(@(v) sprintf('%.17g', v), C(i, :), 'UniformOutput', false), ', '));
      if i < 6, fprintf(fid, ',\n'); else, fprintf(fid, '\n'); end
    end
    if k < numel(srcs), fprintf(fid, '    ],\n'); else, fprintf(fid, '    ]\n'); end
  end
  fprintf(fid, '  }\n}\n');
  fclose(fid);
end
