# Synthetic labelled data packs (`kshana data-pack`)

```sh
kshana data-pack pack-v1 --seed 42 --logs 200 --log-seconds 600 --iq 40 --iq-seconds 2
```

A pack is a directory of generated items with their labels, for training and testing detectors. The same
seed and options give the same files, byte for byte, on any machine. Every label is exact, because the
generator made the condition it labels. `manifest.json` lists every file with its SHA-256 and counts the
items per class; an existing directory is never written over.

## Log items (`logs/`)

Vessel NMEA 0183 voyages (GGA, RMC, VTG, HDT, VHW, ZDA, GSV at 1 Hz) on random routes in the Baltic, from
the same generator as the maritime trust demo. Even-numbered items are `nominal`; odd-numbered items carry a
position drag-off, a spoofed receiver drawn away along a bearing at a few metres a second while its fix
stays valid and its speed and course follow the counterfeit track. `log-NNNN.labels.jsonl` gives every
epoch's `t_s`, its `label` (`nominal`, or `spoofed-drag-off` from the onset on) and the vessel's true
position. The spoofing is in the text: no radio waveform is written.

## IQ items (`iq/`)

GPS L1 C/A baseband scenes (four satellites, SigMF), written by `kshana iq scene`, with the scene's truth
sidecar (`truth.csv`: per satellite and epoch the C/N0, pseudorange, Doppler and carrier phase). The classes
cycle through:

| Class | What the generator does | Labelled window |
|---|---|---|
| `nominal` | no impairment | the whole item |
| `obstruction` | a C/N0 drop of 15 to 30 dB on one or two satellites (1 ms edges), as a building or terrain would cause | the stated window, the stated satellites |
| `scintillation` | Rice fading on every satellite at a stated S4 (0.3 to 0.8) and decorrelation time | the whole item |
| `multipath` | a ground reflection on every satellite at a stated antenna height and ground type | the whole item |

`iq-NNNN.labels.json` states the class, the satellites, the base C/N0, the affected satellites, the window
and the parameters. `tests/data_pack.rs` checks that two packs from one seed are identical, that another
seed differs, that every listed digest matches, that the drag-off label starts once and stays, and that the
obstruction label's window and satellites are exactly where the truth sidecar's C/N0 drops.

These are legitimate GNSS signals and natural impairments. The open engine writes no jamming or spoofing
waveform ([HARDWARE-SAFETY.md](HARDWARE-SAFETY.md)). Packs with interference classes are a separate,
licensed product and not part of this engine.

The data are synthetic and say nothing about any real receiver, place or day.
