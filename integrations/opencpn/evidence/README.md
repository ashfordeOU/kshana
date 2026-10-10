# Evidence: the plugin running inside a real OpenCPN

What this shows, from one scripted run (`run-in-opencpn.sh`) on 2026-10-09:

* **Host:** the Ubuntu 24.04 `opencpn` package, 5.8.4, under Xvfb (software OpenGL, 1280x800, no charts installed, no
  window manager). Plugin: `libkshana_pi.so` built from `../plugin/` against wxWidgets 3.2.4.
* **Input:** the recorded synthetic gated stream `../test/fixtures/gated-excerpt.nmea` (26 epochs, made-up data), served on TCP
  port 10110 one epoch per second, which OpenCPN reads as a network connection (input, TCP, 127.0.0.1:10110).
* **Plugin loaded and initialised** (`plugin-log.txt`): OpenCPN loaded `libkshana_pi.so`, `Init` ran, and
  `SetNMEASentence` **was handed the proprietary `$PKSHT` sentences**: band D / gate P (degraded, passing), then band U / gate W
  (untrusted, fix withheld).
* `1-early.png`: before the collapse. The ship position is moving, the panel is hidden (it opens itself on the alarm), the
  status bar's fix indicator has three bars.
* `2-after-collapse.png`: after it. The panel opened, red, "UNTRUSTED", gate: fix marked invalid, the top two reasons.
  In OpenCPN's own status bar the **ship position stopped updating** (it stays at 54 32.4672 N, 018 46.2227 E from the moment
  the gate engaged) and the fix indicator dropped a bar, which is what the gate is meant to cause. SOG and COG kept
  updating, because the gate marks the speed fields' mode indicator but leaves the values as received.

Limits: one run, one OpenCPN version, no charts, no window manager, so toolbar placement and the panel's look on a real desktop are
not shown; preferences, the toolbar button and the stale state were not exercised here. This shows the plumbing works and that
OpenCPN reacts to the gated fix, not that any alarm is timely or correct for a real vessel. Advisory software, not
type-approved equipment; the operator stays responsible.

## Direct connection (`--listen`)

The same script, with `KSHANA_BIN` and `KSHANA_DEMO` set, feeds OpenCPN from a real
`kshana receiver-trust live --gate --listen tcp:10110` (the recommended setup) instead of the relay, from the one-hour demo log:
the first 1600 epochs at once (baseline and lead-up), then one epoch per second. `direct-listen-plugin-log.txt` shows OpenCPN
handing the plugin the `$PKSHT` of that stream (calibrating, then degraded, then untrusted/withheld), and
`direct-listen-after-collapse.png` the red panel. That run does **not** support the position-freeze observation above: OpenCPN
was still working through the 1600-epoch burst when the early shot was taken, so its status bar was not a clean before/after. The log also shows no nominal band before the degraded one, which is consistent with the gate (which gives each client a bounded queue and drops one that cannot keep up) having dropped OpenCPN during the burst and OpenCPN reconnecting; this is the likely explanation and was not verified. A paced feed does not do this: the end-to-end test feeds in modest chunks for the same reason.

Reproduce (needs `opencpn`, `xvfb`, `xdotool`, `scrot`, `node`):

```sh
cmake -S integrations/opencpn/plugin -B build-pi && cmake --build build-pi
integrations/opencpn/evidence/run-in-opencpn.sh build-pi/libkshana_pi.so /tmp/evidence-out
# direct --listen variant:
KSHANA_BIN=target/release/kshana KSHANA_DEMO=examples/maritime-trust integrations/opencpn/evidence/run-in-opencpn.sh build-pi/libkshana_pi.so /tmp/evidence-out-direct
```

The script uses a fresh temporary HOME, a private X display (`:98`) and changes nothing else. Screen coordinates for the
first-run dialogs are for that 1280x800 display and this OpenCPN version.
