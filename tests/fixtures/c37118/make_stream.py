"""Independent C37.118.2 frame encoder for tests/c37118.rs (written from public descriptions; does not
share code with src/c37118.rs). Writes stream.bin and expected.json.

Two PMUs at 30 frames/s for 10 s from 2025-01-01T00:00:00Z. PMU 1: 2 integer phasors, integer freq,
1 analogue, 1 digital word. PMU 2: 3 float phasors, float freq, 0 analogues, 0 digitals.
PMU 2 loses sync (STAT bit 13) from frame 90 to frame 179 inclusive, with unlocked-time class rising and
time quality 5 (< 1 ms); message time quality in FRACSEC is 0 throughout except frames 150-179 (class 6).
A frame with a broken CRC and a data frame before the configuration are included and must be counted.
"""
import json, struct

def crc(b):
    c = 0xFFFF
    for x in b:
        c ^= x << 8
        for _ in range(8):
            c = ((c << 1) ^ 0x1021) if c & 0x8000 else c << 1
            c &= 0xFFFF
    return c

def frame(ftype, idcode, soc, fracsec, body):
    size = 16 + len(body)
    head = struct.pack('>BBHHII', 0xAA, (ftype << 4) | 1, size, idcode, soc, fracsec)
    f = head + body
    return f + struct.pack('>H', crc(f))

TB = 1_000_000
PMUS = [
    dict(name='SUBSTATION A', id=1, fmt=0b0000, ph=2, an=1, dg=1),
    dict(name='SUBSTATION B', id=2, fmt=0b1110, ph=3, an=0, dg=0),
]

def cfg2(soc):
    b = struct.pack('>I', TB) + struct.pack('>H', len(PMUS))
    for p in PMUS:
        b += p['name'].ljust(16).encode()
        b += struct.pack('>HHHHH', p['id'], p['fmt'], p['ph'], p['an'], p['dg'])
        b += b''.join(f'CH{k:02d}'.ljust(16).encode() for k in range(p['ph'] + p['an'] + 16 * p['dg']))
        b += b'\x00\x00\x00\x00' * (p['ph'] + p['an'] + p['dg'])
        b += struct.pack('>HH', 0, 1)  # FNOM, CFGCNT
    b += struct.pack('>h', 30)  # DATA_RATE
    return frame(3, 99, soc, 0, b)

def block(p, stat):
    b = struct.pack('>H', stat)
    fl = p['fmt']
    b += (b'\x00' * 8 if fl & 2 else b'\x00' * 4) * p['ph']
    b += (b'\x00' * 4 if fl & 8 else b'\x00' * 2) * 2
    b += (b'\x00' * 4 if fl & 4 else b'\x00' * 2) * p['an']
    b += b'\x00\x00' * p['dg']
    return b

def stat(sync_err, tq, unlocked):
    return (int(sync_err) << 13) | (tq << 6) | (unlocked << 4)

SOC0 = 1735689600
out = b''
expected = []
# a data frame before any configuration
out += frame(0, 99, SOC0 - 1, 0, block(PMUS[0], 0) + block(PMUS[1], 0))
out += cfg2(SOC0)
for n in range(300):
    soc, k = SOC0 + n // 30, n % 30
    frac = k * TB // 30
    mtq = 6 if 150 <= n <= 179 else 0
    lost = 90 <= n <= 179
    unl = 0 if not lost else (0 if n < 120 else 1)
    s1, s2 = stat(False, 0, 0), stat(lost, 5 if lost else 0, unl)
    f = frame(0, 99, soc, (mtq << 24) | frac, block(PMUS[0], s1) + block(PMUS[1], s2))
    if n == 200:
        f = f[:-1] + bytes([f[-1] ^ 0xFF])  # broken CRC: this frame must be dropped
    else:
        t = soc + frac / TB
        expected += [[t, 1, False, 0, 0, mtq], [t, 2, lost, 5 if lost else 0, unl, mtq]]
    out += f
open('stream.bin', 'wb').write(out)
json.dump({'reports': expected, 'bad_crc': 1, 'data_without_config': 1,
           'loss': [2, SOC0 + 90 / 30, SOC0 + 179 / 30, 90]}, open('expected.json', 'w'))
print(len(out), len(expected))
