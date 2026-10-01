function s = MT51()
% Stand-in for MAAST's auth/MT51 class (Kshana cross-validation driver; not MAAST code).
% GNU Octave 8.4 cannot parse MAAST's TESLA classes. With authentication off the decoded
% type-51 key message is only handed to the key state machine, so the stand-in decodes nothing.
s = struct('decode', @(bits) []);
end
