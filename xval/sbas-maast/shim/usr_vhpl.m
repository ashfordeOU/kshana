function vhpl = usr_vhpl(los_xyzb, usr_idx, sig2_i, prn, pa_mode)
% Recording shim for MAAST's usr_vhpl (Kshana cross-validation driver; not MAAST code).
% It records the inputs MAAST's usrprocess hands to usr_vhpl together with the four variance
% components usrprocess summed into sig2_i (read from the caller's workspace), then removes
% itself from the path and calls MAAST's own, unmodified usr_vhpl for the protection levels.
global KSH_SHIM_DIR KSH_SAT_ROWS KSH_PL_ROWS

rmpath(KSH_SHIM_DIR);
vhpl = usr_vhpl(los_xyzb, usr_idx, sig2_i, prn, pa_mode);
addpath(KSH_SHIM_DIR, '-begin');

good_los = evalin('caller', 'good_los');
dual_freq = evalin('caller', 'dual_freq');
sig2_uire = evalin('caller', 'sig2_uire');    % full LOS length
sig2_trop = evalin('caller', 'sig2_trop');    % full LOS length
sig2_cnmp = evalin('caller', 'sig2_cnmp');    % full LOS length
tnow = evalin('caller', 'time');
if dual_freq
    % Dual-frequency branch: sig2 = sig_flt^2 + sig2_uire + sig2_cnmp*factor + sig2_trop.
    global CONST_F1 CONST_F5
    sig_flt = evalin('caller', 'sig_flt');
    c_flt = sig_flt(good_los) .^ 2;
    air_factor = (CONST_F1^4 + CONST_F5^4) / ((CONST_F1^2 - CONST_F5^2)^2);
else
    sig2_flt = evalin('caller', 'sig2_flt');  % only defined on good_los (L1 branch)
    c_flt = sig2_flt(:);
    air_factor = 1;
end
c_uire = sig2_uire(good_los);
c_trop = sig2_trop(good_los);
c_air = sig2_cnmp(good_los);
total = c_flt + c_uire + c_trop + air_factor * c_air;
if max(abs(total - sig2_i(:))) > 1e-12 * max(abs(sig2_i(:)))
    error('shim: the four components do not sum to the sig2 MAAST passed to usr_vhpl');
end

rows = [repmat(tnow, numel(usr_idx), 1), usr_idx(:), prn(:), los_xyzb(:, 1:3), ...
        c_flt, c_uire, c_trop, c_air];
KSH_SAT_ROWS = [KSH_SAT_ROWS; rows];
n_usr = size(vhpl, 1);
KSH_PL_ROWS = [KSH_PL_ROWS; [repmat(tnow, n_usr, 1), (1:n_usr)', vhpl(:, 1), vhpl(:, 2)]];
end
