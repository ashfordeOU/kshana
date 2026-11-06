"""Independent ASTERIX CAT021 (edition 2.6) encoder for tests/asterix_cat021.rs, written from the
EUROCONTROL specification's UAP and item layouts; it shares no code with src/asterix_cat021.rs.
Writes blocks.bin and expected.json. Deterministic (fixed seed)."""
import json, random, struct
random.seed(21)

# FRN -> (item, encoder) ; encoders return bytes
def fixed(n): return lambda v=None: bytes(random.randrange(256) for _ in range(n))
def fx(n):  # n octets, FX set on all but the last
    return lambda v=None: bytes(((random.randrange(128) << 1) | (1 if k < n - 1 else 0)) for k in range(n))

def met():
    p = random.choice([0x80, 0x40 | 0x10, 0xF0, 0x20])
    sizes = [(0x80, 2), (0x40, 2), (0x20, 2), (0x10, 1)]
    return bytes([p]) + b''.join(bytes(random.randrange(256) for _ in range(s)) for m, s in sizes if p & m)

def intent():
    # subfield 1 (TIS, 2 octets with FX), subfield 2 (TID, 2 repetitions of 15)
    return bytes([0xC0]) + bytes([0x81, 0x00]) + bytes([2]) + bytes(random.randrange(256) for _ in range(30))

def ages():
    # primary of 2 octets (FX on the first): 3 subfields flagged in octet 1, 2 in octet 2
    p1, p2 = 0b10101000 | 1, 0b01100000
    return bytes([p1, p2]) + bytes(random.randrange(256) for _ in range(5))

def modes():
    return bytes([3]) + bytes(random.randrange(256) for _ in range(24))

def re_field():
    body = bytes(random.randrange(256) for _ in range(4))
    return bytes([1 + len(body)]) + body

UAP = {1: ('010', fixed(2)), 2: ('040', fx(2)), 3: ('161', fixed(2)), 4: ('015', fixed(1)),
       5: ('071', fixed(3)), 6: ('130', None), 7: ('131', None), 8: ('072', fixed(3)), 9: ('150', fixed(2)),
       10: ('151', fixed(2)), 11: ('080', None), 12: ('073', None), 13: ('074', fixed(4)), 14: ('075', fixed(3)),
       15: ('076', fixed(4)), 16: ('140', fixed(2)), 17: ('090', None), 18: ('210', None), 19: ('070', fixed(2)),
       20: ('230', fixed(2)), 21: ('145', None), 22: ('152', fixed(2)), 23: ('200', fixed(1)),
       24: ('155', fixed(2)), 25: ('157', fixed(2)), 26: ('160', fixed(4)), 27: ('165', fixed(2)),
       28: ('077', fixed(3)), 29: ('170', fixed(6)), 30: ('020', fixed(1)), 31: ('220', met),
       32: ('146', fixed(2)), 33: ('148', fixed(2)), 34: ('110', intent), 35: ('016', fixed(1)),
       36: ('008', fixed(1)), 37: ('271', fx(2)), 38: ('132', fixed(1)), 39: ('250', modes),
       40: ('260', fixed(7)), 41: ('400', fixed(1)), 42: ('295', ages), 48: ('RE', re_field)}

def s(v, bits):
    return v & ((1 << bits) - 1)

def record(r):
    present = {}
    present[1] = fixed(2)()
    if r['tod'] is not None: present[12] = struct.pack('>I', round(r['tod'] * 128))[1:]
    if r['addr'] is not None: present[11] = struct.pack('>I', r['addr'])[1:]
    if r['hires']:
        la, lo = round(r['lat'] * (1 << 30) / 180), round(r['lon'] * (1 << 30) / 180)
        present[7] = struct.pack('>II', s(la, 32), s(lo, 32))
        present[6] = struct.pack('>I', s(round(r['lat'] * (1 << 23) / 180) + 7, 24))[1:] + struct.pack('>I', s(0, 24))[1:]
    else:
        la, lo = round(r['lat'] * (1 << 23) / 180), round(r['lon'] * (1 << 23) / 180)
        present[6] = struct.pack('>I', s(la, 24))[1:] + struct.pack('>I', s(lo, 24))[1:]
    present[21] = struct.pack('>H', s(round(r['fl'] * 4), 16))
    present[18] = bytes([r['mops'] << 3])
    present[17] = bytes([(3 << 5) | (r['nicraw'] << 1) | 1, (1 << 7) | (r['nacp'] << 1)])
    for frn in r['extra']:
        present[frn] = UAP[frn][1]()
    frns = sorted(present)
    nfspec = (max(frns) - 1) // 7 + 1
    fspec = bytearray(nfspec)
    for f in frns:
        k, bit = (f - 1) // 7, (f - 1) % 7
        fspec[k] |= 0x80 >> bit
    for k in range(nfspec - 1):
        fspec[k] |= 1
    return bytes(fspec) + b''.join(present[f] for f in frns)

reports = []
for n in range(40):
    mops = n % 3
    r = dict(tod=36000 + n * 0.5 + random.choice([0, 0.25, 0.0078125]), addr=random.randrange(1 << 24),
             lat=round(random.uniform(-80, 80), 6), lon=round(random.uniform(-179, 179), 6),
             fl=random.choice([-10.25, 0, 350, 410.75]), mops=mops, nicraw=random.randrange(12),
             nacp=random.randrange(12), hires=n % 2 == 0,
             extra=random.sample([2, 3, 9, 16, 26, 29, 31, 34, 37, 39, 42, 48], 5))
    reports.append(r)

out = b''
# a CAT048 block to be stepped over
out += bytes([48]) + struct.pack('>H', 3 + 6) + bytes(6)
for chunk in (reports[:15], reports[15:]):
    body = b''.join(record(r) for r in chunk)
    out += bytes([21]) + struct.pack('>H', 3 + len(body)) + body
exp = []
for r in reports:
    lsb = 180 / (1 << (30 if r['hires'] else 23))
    exp.append({'tod': round(r['tod'] * 128) / 128, 'addr': r['addr'], 'lat': r['lat'], 'lon': r['lon'],
                'lsb': lsb, 'fl': round(r['fl'] * 4) / 4, 'mops': r['mops'],
                'nic': r['nicraw'] if r['mops'] >= 1 else None, 'nacp': r['nacp']})
open('blocks.bin', 'wb').write(out)
json.dump({'reports': exp, 'other_category': 1}, open('expected.json', 'w'), indent=0)
print(len(out), len(exp))
