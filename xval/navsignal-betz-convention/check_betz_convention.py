#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Row M004 diagnostic: an independent NumPy evaluation of the Betz (2001) side-lobe and
multipath quantities under the convention pre-registered in
tests/nav_signal_betz_hein_published_oracle.rs (ideal brick-wall band of the stated two-sided
width, normalised correlation, NELP S-curve |R(e - D/2)|^2 - |R(e + D/2)|^2 with D the full
early-late spacing, one specular ray 6 dB down, worst lock-point offset over phase and delay).

It shares no code with Kshana. Run 2026-10-01 after the first strict run: it reproduces
Kshana's numbers (for example BOC(10,5) at 24 MHz: first side lobe 52.55 ns, squared ratio 0.568;
BPSK(10) 0.5 chip multipath 4.82 m) and shows no band (20, 24, 30 MHz, 1 GHz) reproducing Betz's
(54 ns, 0.48), and that doubling the spacing gives 5.56 m for BPSK(10) but 7.38 m for BPSK(1)
against Betz's 5.4 and 4.9. The gap is therefore a convention of the paper's computation that
its text does not state, not a numerical defect of Kshana.
"""
import numpy as np
c=299792458.0
def psd_bpsk(f,fc): return np.sinc(f/fc)**2/fc
def psd_boc(f,m,n):
    fs=m*1.023e6; fc=n*1.023e6
    k=int(round(2*fs/fc))
    x=np.pi*f/fc
    with np.errstate(all='ignore'):
        if k%2==0:
            g=fc*(np.sin(x)*np.tan(np.pi*f/(2*fs))/(np.pi*f))**2
        else:
            g=fc*(np.cos(x)*np.tan(np.pi*f/(2*fs))/(np.pi*f))**2
    return np.nan_to_num(g)
def acf(psdf,B,taus):
    f=np.linspace(-B/2,B/2,200001); g=psdf(f); df=f[1]-f[0]
    R=np.array([np.sum(g*np.cos(2*np.pi*f*t))*df for t in taus]); return R
def bias(psdf,B,tc,d,gamma=10**(-6/20),half=False):
    step=0.1e-9; taus=np.arange(0,2.6*tc,step); R=acf(psdf,B,taus); R/=R[0]
    def Rat(t): return np.interp(np.abs(t),taus,R)
    worst=0
    for dl in np.arange(1e-9,1.2*(tc+d/2),2e-9):
        for ph in np.linspace(0,np.pi,21):
            def disc(t):
                e=Rat(t-d/2)+gamma*np.exp(1j*ph)*Rat(t-d/2-dl)
                l=Rat(t+d/2)+gamma*np.exp(1j*ph)*Rat(t+d/2-dl)
                return abs(e)**2-abs(l)**2
            # find zero nearest 0
            ts=np.linspace(-d/2*0.99,d/2*0.99+dl,400)
            v=np.array([disc(t) for t in ts])
            i=np.where(np.sign(v[:-1])!=np.sign(v[1:]))[0]
            if len(i)==0: continue
            z=ts[i]; zz=z[np.argmin(np.abs(z))]
            worst=max(worst,abs(zz))
    return worst*c
tc1=1/1.023e6
#bias(lambda f:psd_bpsk(f,10.23e6),24e6,tc1/10,0.5*tc1/10))
#-ish 200", bias(lambda f:psd_bpsk(f,10.23e6),200e6,tc1/10,0.5*tc1/10))


def side_lobes():
    for (m, n) in [(5, 2), (8, 4), (10, 5)]:
        for band in [20e6, 24e6, 30e6, 1e9]:
            tc = 1 / (n * 1.023e6)
            taus = np.arange(0, tc, 0.05e-9)
            r = acf(lambda f: psd_boc(f, m, n), band, taus)
            r /= r[0]
            z = np.argmax(r < 0)
            r2 = r ** 2
            k = z + np.argmax((r2[z:-1] >= r2[z - 1:-2]) & (r2[z:-1] > r2[z + 1:]))
            print(f"BOC({m},{n}) band {band / 1e6:.0f} MHz: first side lobe {taus[k] * 1e9:.2f} ns,"
                  f" squared ratio {r2[k]:.4f}")


if __name__ == "__main__":
    side_lobes()
    print("BPSK(10) 24 MHz 0.5 chip:", bias(lambda f: psd_bpsk(f, 10.23e6), 24e6, tc1 / 10, 0.5 * tc1 / 10))
    print("BPSK(10) 24 MHz spacing doubled:", bias(lambda f: psd_bpsk(f, 10.23e6), 24e6, tc1 / 10, tc1 / 10))
    print("BPSK(1) 24 MHz spacing doubled:", bias(lambda f: psd_bpsk(f, 1.023e6), 24e6, tc1, 0.1 * tc1))
