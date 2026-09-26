# A signed command applied at a deceived time still misroutes

A technical note for operators of time-indexed networks: constellations that route,
task or hand over by a schedule, where each node acts when its own clock reaches a
scheduled instant.

Abbreviations: GNSS, Global Navigation Satellite System; TPL, timing protection level;
PNT, positioning, navigation and timing.

## The claim

Authenticating control messages, including with post-quantum signatures, proves who
sent a message and that it was not altered. It does not prove **when the receiver acts
on it**. A node executes a time-indexed command against its own clock. If that clock has
been pulled by `δ`, a command valid for instant `T` runs at true time `T + δ`, with
every signature intact. Once `|δ|` exceeds the slot guard, traffic lands in the wrong
slot, a link switches while the other end is still pointed elsewhere, or a handover
happens early. The network misroutes, and every integrity check in the command path
reports success.

## Why the clock is the soft target

- **GNSS time is the usual reference, and it is spoofable.** A node that disciplines
  its clock to GNSS inherits whatever time the receiver serves. A spoofer that holds
  the receiver's own quality flags green can pull that time slowly.
- **Freshness checks use the same clock.** A validity window ("accept this command
  until `T + w`") or a replay counter tied to time is judged against the local clock,
  so a pulled clock can also widen the window in which a captured signed command is
  accepted.
- **The attack needs no key.** Nothing in the signed channel is touched. Stronger
  cryptography raises the cost of forging a command and leaves this cost unchanged.

This sits beside post-quantum work, not against it: the two close different holes.
Signatures stop a forged command. Time integrity stops a genuine command from being
executed at the wrong moment.

## What bounds it

Four measures, each quantified by the `slot-timing` scenario kind
([`SLOT-TIMING.md`](SLOT-TIMING.md)):

1. **A clock-aided monitor.** Compare GNSS time with the node's own clock coasting
   over a window, and alarm when the difference is too large to be clock noise. The
   conditional TPL bounds the error that can go unnoticed before the alarm.
2. **Independent checks, scheduled.** A ground-station two-way time transfer or a
   crosslink comparison with a neighbour outside the spoofer's reach caps how long a
   slow pull can run. Their revisit interval is a security parameter, not only an
   operations one.
3. **Geometry.** A ground spoofer reaches a low-Earth-orbit satellite only while it is
   above the spoofer's horizon, so the pull is capped by the spoofer's ramp rate times
   that window. As arithmetic: a ramp of 10 ns/s held for 600 s is 6 µs.
4. **A guard sized from the bound, and a safe action on alarm.** The slot guard should
   cover the largest undetected error the monitor and checks allow, not only the
   clock's free-running noise. On alarm, a node should hold its last good schedule on
   its coasting clock rather than follow GNSS.

## What this note does not claim

It does not claim a spoofed satellite has been observed misrouting; it does not
estimate any operator's exposure; and the bounds it points to are MODELLED, conditional
on detection and on the stated threat assumptions. It argues a composition: a valid
signature and a correct execution time are separate properties, and a time-indexed
network needs both.
