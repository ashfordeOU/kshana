// SPDX-License-Identifier: AGPL-3.0-only
//! Aperture duty cycle: the navigation-versus-communications time-share that a
//! contact plan implies for a pool of steerable apertures.
//!
//! A spacecraft (or a relay) that carries a small number of apertures has to spend
//! each one on exactly one service at a time. A contact plan says when each service
//! *wants* an aperture; the aperture count says how many of those requests can run
//! at once; and an arbitration policy says who wins when more sessions are active
//! than there are apertures. Only once all three are stated does a duty cycle mean
//! anything — which is why the policy is an input here, emitted back in the report,
//! and never a rule buried in the scheduler.
//!
//! The scheduler is an exact interval sweep. Every session start and end (clipped
//! to the reporting horizon) is a boundary; between two consecutive boundaries the
//! active set is constant, so the assignment is decided once per elementary
//! interval and no time is double-counted or lost. Three quantities are accumulated
//! independently during that one sweep — navigation aperture-seconds, communications
//! aperture-seconds, and idle aperture-seconds — so that their sum against the
//! available aperture-seconds is a genuine internal-consistency check rather than an
//! identity written down twice.
//!
//! The contact plan reuses the engine's existing pass vocabulary: a
//! [`ContactWindow`] is an `aos_s`/`los_s` interval, and [`windows_from_passes`]
//! turns the [`crate::passes::Pass`] list that [`crate::passes::predict_passes`]
//! produces straight into a plan, so a predicted pass list and a hand-written
//! contact plan are the same object.
//!
//! HONEST SCOPE (MODELLED): this is scheduling arithmetic over the supplied
//! windows, not a ground-segment simulation. No slew, retune or changeover time is
//! charged when an aperture switches service or session (an aperture changes hands
//! instantaneously at a boundary); no data volume, buffer state, energy budget or
//! link closure enters the decision; and the windows themselves are inputs — their
//! geometry is whatever produced them.

use crate::passes::Pass;
use serde::Deserialize;

/// Which service a contact session is asking the aperture for.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Service {
    /// Ranging / tracking for navigation and timing.
    Navigation,
    /// Data communications (telemetry downlink, command uplink).
    Communications,
}

impl Service {
    /// The canonical report string for this service.
    pub fn as_str(self) -> &'static str {
        match self {
            Service::Navigation => "navigation",
            Service::Communications => "communications",
        }
    }

    /// Resolve a TOML `service` string. Case-insensitive; `nav` and `comms` are
    /// accepted as the short forms an operations plan usually writes.
    pub fn parse(s: &str) -> Result<Service, String> {
        match s.trim().to_ascii_lowercase().as_str() {
            "navigation" | "nav" => Ok(Service::Navigation),
            "communications" | "comms" | "comm" => Ok(Service::Communications),
            other => Err(format!(
                "unknown service '{other}' (expected navigation|nav or communications|comms)"
            )),
        }
    }
}

/// What happens when more sessions are active than there are apertures.
///
/// The duty numbers are only meaningful relative to one of these, so the policy is
/// an explicit input with a documented default ([`Arbitration::DEFAULT`]) and is
/// echoed back in the report alongside the numbers it produced.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Arbitration {
    /// Navigation outranks communications, preemptively.
    NavigationPriority,
    /// Communications outranks navigation, preemptively.
    CommunicationsPriority,
    /// Whoever holds an aperture keeps it; free apertures go to the earliest
    /// unserved session. Service class does not enter the decision.
    FirstComeFirstServed,
}

impl Arbitration {
    /// The documented default: navigation wins the aperture.
    ///
    /// The reason is stated rather than assumed. In this engine's setting the
    /// navigation session is the one that holds a PNT solution inside its error
    /// budget, and a deferred downlink costs latency rather than integrity, so
    /// navigation is the service a resilience study is asking about. It is a
    /// *choice*, not a law: a mission whose downlink is the constrained resource
    /// should run `communications-priority`, and one whose scheduler cannot preempt
    /// a session in progress should run `first-come-first-served`. All three are
    /// first-class inputs and the report says which one produced its numbers.
    pub const DEFAULT: Arbitration = Arbitration::NavigationPriority;

    /// The canonical report string for this policy.
    pub fn as_str(self) -> &'static str {
        match self {
            Arbitration::NavigationPriority => "navigation-priority",
            Arbitration::CommunicationsPriority => "communications-priority",
            Arbitration::FirstComeFirstServed => "first-come-first-served",
        }
    }

    /// Resolve a TOML `arbitration` string. Case-insensitive.
    pub fn parse(s: &str) -> Result<Arbitration, String> {
        match s.trim().to_ascii_lowercase().as_str() {
            "navigation-priority" | "navigation" | "nav" => Ok(Arbitration::NavigationPriority),
            "communications-priority" | "communications" | "comms" => {
                Ok(Arbitration::CommunicationsPriority)
            }
            "first-come-first-served" | "fcfs" => Ok(Arbitration::FirstComeFirstServed),
            other => Err(format!(
                "unknown arbitration policy '{other}' (expected navigation-priority, \
                 communications-priority or first-come-first-served)"
            )),
        }
    }

    /// The policy stated in full, for the report. A duty number quoted without this
    /// sentence is not reproducible.
    pub fn definition(self) -> &'static str {
        match self {
            Arbitration::NavigationPriority => {
                "navigation-priority: at every instant the available apertures go to the \
                 highest-ranked active sessions, navigation ahead of communications; within \
                 one service the earlier aos_s ranks first, and ties are broken by the order \
                 the sessions are declared in the plan. PREEMPTIVE — a session can lose its \
                 aperture part-way through its window to a higher-ranked session that becomes \
                 active, and take one again when it frees."
            }
            Arbitration::CommunicationsPriority => {
                "communications-priority: at every instant the available apertures go to the \
                 highest-ranked active sessions, communications ahead of navigation; within \
                 one service the earlier aos_s ranks first, and ties are broken by the order \
                 the sessions are declared in the plan. PREEMPTIVE — a session can lose its \
                 aperture part-way through its window to a higher-ranked session that becomes \
                 active, and take one again when it frees."
            }
            Arbitration::FirstComeFirstServed => {
                "first-come-first-served: NON-PREEMPTIVE. A session that holds an aperture \
                 keeps it until its los_s; apertures that are free go to the active unserved \
                 sessions in order of aos_s, ties broken by the order the sessions are declared \
                 in the plan. Service class does not enter the decision at all. A session that \
                 finds every aperture busy at its aos_s is not dropped — it takes one as soon \
                 as one frees, and the wait is its outage."
            }
        }
    }
}

/// One contact window of a plan: an interval during which one service wants one
/// aperture. The `aos_s`/`los_s` naming is the engine's existing pass vocabulary
/// (see [`crate::passes::Pass`]), in seconds from the plan epoch.
#[derive(Clone, Debug, PartialEq)]
pub struct ContactWindow {
    /// Session name, as it appears in the report.
    pub name: String,
    /// The service this session asks the aperture for.
    pub service: Service,
    /// Acquisition of signal — the start of the window (s from the plan epoch).
    pub aos_s: f64,
    /// Loss of signal — the end of the window (s from the plan epoch).
    pub los_s: f64,
}

/// Turn a predicted pass list into a contact plan for one service, naming the
/// sessions `<prefix>1`, `<prefix>2`, … in pass order.
///
/// This is the seam that keeps the contact plan and the pass predictor the same
/// object: whatever [`crate::passes::predict_passes`] emits can be scheduled
/// directly, with no second window type in between.
pub fn windows_from_passes(
    passes: &[Pass],
    service: Service,
    name_prefix: &str,
) -> Vec<ContactWindow> {
    passes
        .iter()
        .enumerate()
        .map(|(i, p)| ContactWindow {
            name: format!("{name_prefix}{}", i + 1),
            service,
            aos_s: p.aos_s,
            los_s: p.los_s,
        })
        .collect()
}

/// What one session of the plan actually got.
#[derive(Clone, Debug, PartialEq)]
pub struct SessionOutage {
    /// Session name, as declared in the plan.
    pub name: String,
    /// The service it asked for.
    pub service: Service,
    /// Declared window start (s from the plan epoch).
    pub aos_s: f64,
    /// Declared window end (s from the plan epoch).
    pub los_s: f64,
    /// Requested aperture time (s): the window length clipped to the horizon.
    pub requested_s: f64,
    /// Time an aperture was actually assigned to it (s).
    pub served_s: f64,
    /// Requested minus served (s) — the per-session outage.
    pub outage_s: f64,
    /// `outage_s / requested_s`, or 0 when nothing was requested inside the horizon.
    pub outage_fraction: f64,
}

/// The duty-cycle answer for one (plan, aperture count, policy) triple.
#[derive(Clone, Debug, PartialEq)]
pub struct DutyCycle {
    /// Apertures in the pool.
    pub apertures: usize,
    /// The policy that produced these numbers.
    pub policy: Arbitration,
    /// Reporting-horizon start (s from the plan epoch).
    pub horizon_start_s: f64,
    /// Reporting-horizon end (s from the plan epoch).
    pub horizon_end_s: f64,
    /// Horizon length (s).
    pub horizon_s: f64,
    /// `apertures × horizon_s` — the denominator of every duty below.
    pub aperture_seconds_available: f64,
    /// Aperture-seconds spent on navigation.
    pub navigation_served_aperture_s: f64,
    /// Aperture-seconds spent on communications.
    pub communications_served_aperture_s: f64,
    /// Aperture-seconds no session was assigned, accumulated in the same sweep.
    pub idle_aperture_s: f64,
    /// Navigation aperture-seconds over the available aperture-seconds.
    pub navigation_duty: f64,
    /// Communications aperture-seconds over the available aperture-seconds.
    pub communications_duty: f64,
    /// Idle aperture-seconds over the available aperture-seconds.
    pub idle_duty: f64,
    /// Per-session outage, in plan order.
    pub sessions: Vec<SessionOutage>,
    /// The largest number of sessions active at any one instant.
    pub peak_concurrent_demand: usize,
    /// Wall-clock seconds during which more sessions were active than apertures.
    pub contention_s: f64,
    /// Sum of `requested_s` over the plan (s).
    pub total_requested_s: f64,
    /// Sum of `served_s` over the plan (s).
    pub total_served_s: f64,
    /// Sum of `outage_s` over the plan (s).
    pub total_outage_s: f64,
}

/// A plan window clipped to the reporting horizon.
struct Clipped {
    lo: f64,
    hi: f64,
    requested: f64,
}

/// Rank a service under a policy: 0 wins the aperture, 1 yields it. The
/// non-preemptive policy does not use this at all.
fn service_rank(service: Service, policy: Arbitration) -> u8 {
    match (policy, service) {
        (Arbitration::CommunicationsPriority, Service::Communications) => 0,
        (Arbitration::CommunicationsPriority, Service::Navigation) => 1,
        (_, Service::Navigation) => 0,
        (_, Service::Communications) => 1,
    }
}

/// Schedule `plan` onto `apertures` apertures under `policy` over the reporting
/// horizon `[horizon_start_s, horizon_end_s)`, and report the resulting duty cycle
/// and per-session outage.
///
/// The sweep is exact: the boundary set is the horizon ends plus every clipped
/// `aos_s`/`los_s`, so between two consecutive boundaries each window is either
/// wholly active or wholly inactive and the assignment is decided once. A window
/// that ends exactly where the next begins therefore never contends with it.
pub fn aperture_duty_cycle(
    plan: &[ContactWindow],
    apertures: usize,
    policy: Arbitration,
    horizon_start_s: f64,
    horizon_end_s: f64,
) -> Result<DutyCycle, String> {
    if plan.is_empty() {
        return Err("a contact plan needs at least one contact window".to_string());
    }
    if apertures == 0 {
        return Err("apertures must be >= 1".to_string());
    }
    if !horizon_start_s.is_finite() || !horizon_end_s.is_finite() {
        return Err("the reporting horizon must be finite".to_string());
    }
    if horizon_end_s <= horizon_start_s {
        return Err(
            "the reporting horizon must have positive length (horizon_end_s > horizon_start_s)"
                .to_string(),
        );
    }
    for w in plan {
        if !w.aos_s.is_finite() || !w.los_s.is_finite() {
            return Err(format!(
                "contact '{}' has a non-finite aos_s or los_s",
                w.name
            ));
        }
        if w.los_s <= w.aos_s {
            return Err(format!("contact '{}' must have los_s > aos_s", w.name));
        }
    }

    let n = plan.len();
    let mut boundaries: Vec<f64> = Vec::with_capacity(2 * n + 2);
    boundaries.push(horizon_start_s);
    boundaries.push(horizon_end_s);
    let clipped: Vec<Clipped> = plan
        .iter()
        .map(|w| {
            let lo = w.aos_s.max(horizon_start_s);
            let hi = w.los_s.min(horizon_end_s);
            let requested = if hi > lo { hi - lo } else { 0.0 };
            if requested > 0.0 {
                boundaries.push(lo);
                boundaries.push(hi);
            }
            Clipped { lo, hi, requested }
        })
        .collect();
    boundaries.sort_by(f64::total_cmp);
    boundaries.dedup();

    let mut served = vec![0.0_f64; n];
    let mut navigation_served_aperture_s = 0.0;
    let mut communications_served_aperture_s = 0.0;
    let mut idle_aperture_s = 0.0;
    let mut peak_concurrent_demand = 0_usize;
    let mut contention_s = 0.0;

    // Never more apertures than sessions can occupy, so a large declared aperture
    // count costs no memory. The duty denominator still uses the declared count.
    let mut holders: Vec<Option<usize>> = vec![None; apertures.min(n)];
    let mut active: Vec<usize> = Vec::with_capacity(n);
    let mut chosen: Vec<usize> = Vec::with_capacity(n);

    for pair in boundaries.windows(2) {
        let (t0, t1) = (pair[0], pair[1]);
        let dt = t1 - t0;
        if dt <= 0.0 {
            continue;
        }
        active.clear();
        for (i, c) in clipped.iter().enumerate() {
            // Every clipped edge is a boundary, so an elementary interval is either
            // wholly inside a window or wholly outside it — no partial overlap.
            if c.requested > 0.0 && c.lo <= t0 && t1 <= c.hi {
                active.push(i);
            }
        }
        peak_concurrent_demand = peak_concurrent_demand.max(active.len());
        if active.len() > apertures {
            contention_s += dt;
        }

        chosen.clear();
        match policy {
            Arbitration::FirstComeFirstServed => {
                // Non-preemptive: a holder that is still active keeps its aperture.
                for h in holders.iter_mut() {
                    if let Some(i) = *h {
                        if !active.contains(&i) {
                            *h = None;
                        }
                    }
                }
                let mut waiting: Vec<usize> = active
                    .iter()
                    .copied()
                    .filter(|i| !holders.contains(&Some(*i)))
                    .collect();
                waiting.sort_by(|&x, &y| {
                    clipped[x]
                        .lo
                        .total_cmp(&clipped[y].lo)
                        .then_with(|| x.cmp(&y))
                });
                let mut next = waiting.into_iter();
                for h in holders.iter_mut() {
                    if h.is_none() {
                        *h = next.next();
                    }
                }
                chosen.extend(holders.iter().flatten().copied());
            }
            _ => {
                // Preemptive: the top-ranked active sessions hold the apertures.
                let mut ranked = active.clone();
                ranked.sort_by(|&x, &y| {
                    service_rank(plan[x].service, policy)
                        .cmp(&service_rank(plan[y].service, policy))
                        .then_with(|| clipped[x].lo.total_cmp(&clipped[y].lo))
                        .then_with(|| x.cmp(&y))
                });
                ranked.truncate(apertures);
                chosen.extend(ranked);
            }
        }

        for &i in &chosen {
            served[i] += dt;
            match plan[i].service {
                Service::Navigation => navigation_served_aperture_s += dt,
                Service::Communications => communications_served_aperture_s += dt,
            }
        }
        // Accumulated independently of the two service totals, so that checking
        // navigation + communications + idle against the available aperture-seconds
        // is a real consistency test and not the same sum written twice.
        idle_aperture_s += dt * (apertures - chosen.len()) as f64;
    }

    let sessions: Vec<SessionOutage> = plan
        .iter()
        .enumerate()
        .map(|(i, w)| {
            let requested_s = clipped[i].requested;
            let served_s = served[i];
            let outage_s = (requested_s - served_s).max(0.0);
            SessionOutage {
                name: w.name.clone(),
                service: w.service,
                aos_s: w.aos_s,
                los_s: w.los_s,
                requested_s,
                served_s,
                outage_s,
                outage_fraction: if requested_s > 0.0 {
                    outage_s / requested_s
                } else {
                    0.0
                },
            }
        })
        .collect();

    let horizon_s = horizon_end_s - horizon_start_s;
    let aperture_seconds_available = apertures as f64 * horizon_s;
    Ok(DutyCycle {
        apertures,
        policy,
        horizon_start_s,
        horizon_end_s,
        horizon_s,
        aperture_seconds_available,
        navigation_served_aperture_s,
        communications_served_aperture_s,
        idle_aperture_s,
        navigation_duty: navigation_served_aperture_s / aperture_seconds_available,
        communications_duty: communications_served_aperture_s / aperture_seconds_available,
        idle_duty: idle_aperture_s / aperture_seconds_available,
        total_requested_s: sessions.iter().map(|s| s.requested_s).sum(),
        total_served_s: sessions.iter().map(|s| s.served_s).sum(),
        total_outage_s: sessions.iter().map(|s| s.outage_s).sum(),
        sessions,
        peak_concurrent_demand,
        contention_s,
    })
}

/// One contact window as written in TOML.
#[derive(Deserialize)]
pub struct ContactWindowInput {
    /// Session name. Defaults to `session-<n>` in declaration order.
    #[serde(default)]
    pub name: String,
    /// `navigation`|`nav` or `communications`|`comms`.
    pub service: String,
    /// Window start (s from the plan epoch).
    pub aos_s: f64,
    /// Window end (s from the plan epoch).
    pub los_s: f64,
}

fn ad_default_apertures() -> usize {
    2
}

fn ad_default_arbitration() -> String {
    Arbitration::DEFAULT.as_str().to_string()
}

/// The bundled illustrative contact plan: three navigation sessions and three
/// communications sessions over a 9 000 s planning envelope, arranged so that each
/// navigation session overlaps a communications session. It is an ILLUSTRATIVE
/// plan, not a flown schedule.
fn ad_default_contacts() -> Vec<ContactWindowInput> {
    [
        ("nav-1", "navigation", 0.0, 600.0),
        ("comms-1", "communications", 300.0, 1500.0),
        ("nav-2", "navigation", 3600.0, 4500.0),
        ("comms-2", "communications", 4200.0, 6000.0),
        ("nav-3", "navigation", 7200.0, 7800.0),
        ("comms-3", "communications", 7200.0, 9000.0),
    ]
    .into_iter()
    .map(|(name, service, aos_s, los_s)| ContactWindowInput {
        name: name.to_string(),
        service: service.to_string(),
        aos_s,
        los_s,
    })
    .collect()
}

/// The `aperture-duty-cycle` scenario: what share of a pool of apertures a contact
/// plan spends on navigation, what share on communications, and what each session
/// loses to contention — under a named arbitration policy.
#[derive(Deserialize)]
pub struct ApertureDutyCycleScenario {
    /// Apertures in the pool (≥ 1).
    #[serde(default = "ad_default_apertures")]
    pub apertures: usize,
    /// Arbitration policy: `navigation-priority` (default), `communications-priority`
    /// or `first-come-first-served`.
    #[serde(default = "ad_default_arbitration")]
    pub arbitration: String,
    /// Reporting-horizon start (s). Defaults to the earliest `aos_s` in the plan.
    #[serde(default)]
    pub horizon_start_s: Option<f64>,
    /// Reporting-horizon end (s). Defaults to the latest `los_s` in the plan.
    #[serde(default)]
    pub horizon_end_s: Option<f64>,
    /// The contact plan, as `[[contacts]]` tables.
    #[serde(default = "ad_default_contacts")]
    pub contacts: Vec<ContactWindowInput>,
}

impl ApertureDutyCycleScenario {
    /// Run the scenario, returning `(json, summary)`.
    pub fn run_json(&self) -> Result<(String, String), String> {
        let policy = Arbitration::parse(&self.arbitration)?;
        if self.contacts.is_empty() {
            return Err("a contact plan needs at least one [[contacts]] window".to_string());
        }
        let mut plan: Vec<ContactWindow> = Vec::with_capacity(self.contacts.len());
        for (i, c) in self.contacts.iter().enumerate() {
            let name = if c.name.trim().is_empty() {
                format!("session-{}", i + 1)
            } else {
                c.name.clone()
            };
            plan.push(ContactWindow {
                name,
                service: Service::parse(&c.service)?,
                aos_s: c.aos_s,
                los_s: c.los_s,
            });
        }
        for w in &plan {
            if !w.aos_s.is_finite() || !w.los_s.is_finite() {
                return Err(format!(
                    "contact '{}' has a non-finite aos_s or los_s",
                    w.name
                ));
            }
        }
        // The horizon defaults to the plan's own envelope, so a duty cycle is never
        // silently diluted by dead time the caller never declared.
        let start = self
            .horizon_start_s
            .unwrap_or_else(|| plan.iter().map(|w| w.aos_s).fold(f64::INFINITY, f64::min));
        let end = self.horizon_end_s.unwrap_or_else(|| {
            plan.iter()
                .map(|w| w.los_s)
                .fold(f64::NEG_INFINITY, f64::max)
        });
        let d = aperture_duty_cycle(&plan, self.apertures, policy, start, end)?;

        let worst = d
            .sessions
            .iter()
            .enumerate()
            .max_by(|(ia, a), (ib, b)| {
                a.outage_fraction
                    .total_cmp(&b.outage_fraction)
                    .then_with(|| ib.cmp(ia))
            })
            .map(|(_, s)| s);
        let worst_outage_fraction = worst.map_or(0.0, |s| s.outage_fraction);
        let worst_outage_session = match worst {
            Some(s) if s.outage_s > 0.0 => serde_json::json!(s.name),
            // No session lost any time, so there is no worst session — an empty
            // field, not a zero-named one.
            _ => serde_json::Value::Null,
        };

        let rows: Vec<serde_json::Value> = d
            .sessions
            .iter()
            .map(|s| {
                serde_json::json!({
                    "name": s.name,
                    "service": s.service.as_str(),
                    "aos_s": s.aos_s,
                    "los_s": s.los_s,
                    "requested_s": s.requested_s,
                    "served_s": s.served_s,
                    "outage_s": s.outage_s,
                    "outage_fraction": s.outage_fraction,
                    "fully_served": s.outage_s == 0.0,
                })
            })
            .collect();

        // Unit and provenance class for every numeric field the report publishes,
        // built separately so the report document stays inside the json! macro's
        // expansion depth.
        let units = serde_json::json!({
            "apertures": {"unit": "count", "provenance": "input"},
            "session_count": {"unit": "count", "provenance": "input"},
            "horizon_start_s": {"unit": "s", "provenance": "input", "note": "seconds from the plan epoch; defaults to the earliest aos_s in the plan"},
            "horizon_end_s": {"unit": "s", "provenance": "input", "note": "seconds from the plan epoch; defaults to the latest los_s in the plan"},
            "horizon_s": {"unit": "s", "provenance": "computed", "note": "horizon_end_s - horizon_start_s"},
            "aperture_seconds_available": {"unit": "aperture*s", "provenance": "computed", "note": "apertures * horizon_s; the denominator of every duty"},
            "navigation_served_aperture_s": {"unit": "aperture*s", "provenance": "computed"},
            "communications_served_aperture_s": {"unit": "aperture*s", "provenance": "computed"},
            "idle_aperture_s": {"unit": "aperture*s", "provenance": "computed", "note": "accumulated independently of the two service totals in the same sweep"},
            "navigation_duty": {"unit": "fraction (dimensionless)", "provenance": "computed", "note": "navigation_served_aperture_s / aperture_seconds_available"},
            "communications_duty": {"unit": "fraction (dimensionless)", "provenance": "computed", "note": "communications_served_aperture_s / aperture_seconds_available"},
            "idle_duty": {"unit": "fraction (dimensionless)", "provenance": "computed", "note": "idle_aperture_s / aperture_seconds_available"},
            "peak_concurrent_demand": {"unit": "count", "provenance": "computed", "note": "the most sessions active at any one instant; contention exists where this exceeds apertures"},
            "contention_s": {"unit": "s", "provenance": "computed", "note": "wall-clock seconds during which more sessions were active than there are apertures"},
            "total_requested_s": {"unit": "s", "provenance": "computed", "note": "summed over sessions; one aperture-second per session-second, so this is not scaled by the aperture count"},
            "total_served_s": {"unit": "s", "provenance": "computed"},
            "total_outage_s": {"unit": "s", "provenance": "computed", "note": "total_requested_s - total_served_s"},
            "worst_outage_fraction": {"unit": "fraction (dimensionless)", "provenance": "computed", "note": "the largest per-session outage_fraction in the plan"},
            "sessions[].aos_s": {"unit": "s", "provenance": "input"},
            "sessions[].los_s": {"unit": "s", "provenance": "input"},
            "sessions[].requested_s": {"unit": "s", "provenance": "computed", "note": "the declared window clipped to the reporting horizon"},
            "sessions[].served_s": {"unit": "s", "provenance": "computed"},
            "sessions[].outage_s": {"unit": "s", "provenance": "computed", "note": "requested_s - served_s"},
            "sessions[].outage_fraction": {"unit": "fraction (dimensionless)", "provenance": "computed"},
        });

        let mut json = serde_json::json!({
            "kind": "aperture-duty-cycle",
            "label": "MODELLED — aperture scheduling arithmetic over a supplied contact plan: \
                      an exact interval sweep of navigation-versus-communications time-share \
                      and per-session contention loss under a named arbitration policy. No \
                      slew / retune / changeover time is charged when an aperture changes \
                      service or session, no data volume, buffer state, energy budget or link \
                      closure enters the decision, and the contact windows are inputs — their \
                      geometry is whatever produced them. NOT a ground-segment scheduling \
                      product.",
            "arbitration_policy": d.policy.as_str(),
            "arbitration_policy_definition": d.policy.definition(),
            "arbitration_policy_default": Arbitration::DEFAULT.as_str(),
            "apertures": d.apertures,
            "session_count": d.sessions.len(),
            "horizon_start_s": d.horizon_start_s,
            "horizon_end_s": d.horizon_end_s,
            "horizon_s": d.horizon_s,
            "aperture_seconds_available": d.aperture_seconds_available,
            "navigation_served_aperture_s": d.navigation_served_aperture_s,
            "communications_served_aperture_s": d.communications_served_aperture_s,
            "idle_aperture_s": d.idle_aperture_s,
            "navigation_duty": d.navigation_duty,
            "communications_duty": d.communications_duty,
            "idle_duty": d.idle_duty,
            "duty_definition": "navigation_duty = navigation_served_aperture_s / \
                                aperture_seconds_available, with aperture_seconds_available = \
                                apertures * horizon_s; communications_duty and idle_duty are the \
                                same ratio over their own aperture-seconds, and the three sum to \
                                1 by construction. The denominator is the whole aperture POOL's \
                                time over the reporting horizon, so with one aperture a duty is \
                                literally the fraction of wall-clock time that aperture serves \
                                the service, and with N apertures it is the fraction of the \
                                pool's capacity. The horizon defaults to the plan envelope \
                                (earliest aos_s to latest los_s) and is overridable.",
            "outage_definition": "per-session outage is the part of a session's requested \
                                  contact time — its window clipped to the reporting horizon — \
                                  during which the arbitration policy assigned it no aperture. A \
                                  session that loses arbitration is NOT dropped: it is served for \
                                  whatever part of its window an aperture is free, and outage_s = \
                                  requested_s - served_s is the remainder; outage_fraction = \
                                  outage_s / requested_s, and is 0 when the session requests \
                                  nothing inside the horizon. Outage is contention loss only: a \
                                  session outside the horizon, or a gap between sessions, is not \
                                  an outage.",
            "sessions": rows,
            "peak_concurrent_demand": d.peak_concurrent_demand,
            "contention_s": d.contention_s,
            "total_requested_s": d.total_requested_s,
            "total_served_s": d.total_served_s,
            "total_outage_s": d.total_outage_s,
            "worst_outage_fraction": worst_outage_fraction,
            "worst_outage_session": worst_outage_session,
        });
        json["units"] = units;

        let summary = format!(
            "aperture-duty-cycle: {} session(s) on {} aperture(s) under {} -> navigation duty \
             {:.4}, communications duty {:.4}, idle {:.4}; {:.0} s of {:.0} s requested lost to \
             contention (MODELLED)",
            d.sessions.len(),
            d.apertures,
            d.policy.as_str(),
            d.navigation_duty,
            d.communications_duty,
            d.idle_duty,
            d.total_outage_s,
            d.total_requested_s,
        );
        let json = serde_json::to_string_pretty(&json).map_err(|e| e.to_string())?;
        Ok((json, summary))
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    /// Build a plan from `(name, service, aos, los)` tuples.
    fn plan(rows: &[(&str, Service, f64, f64)]) -> Vec<ContactWindow> {
        rows.iter()
            .map(|(name, service, aos_s, los_s)| ContactWindow {
                name: (*name).to_string(),
                service: *service,
                aos_s: *aos_s,
                los_s: *los_s,
            })
            .collect()
    }

    /// The horizon a scenario with no override would use: the plan envelope.
    fn envelope(p: &[ContactWindow]) -> (f64, f64) {
        (
            p.iter().map(|w| w.aos_s).fold(f64::INFINITY, f64::min),
            p.iter().map(|w| w.los_s).fold(f64::NEG_INFINITY, f64::max),
        )
    }

    fn run(p: &[ContactWindow], apertures: usize, policy: Arbitration) -> DutyCycle {
        let (a, b) = envelope(p);
        aperture_duty_cycle(p, apertures, policy, a, b).expect("plan schedules")
    }

    #[test]
    fn a_window_that_ends_exactly_when_the_next_begins_does_not_contend_for_the_aperture() {
        // Touching windows share one instant and no interval. A sweep that treated the
        // shared boundary as overlap would invent an outage here; one that dropped it
        // would lose a second of service. Both totals are pinned.
        let p = plan(&[
            ("a", Service::Navigation, 0.0, 100.0),
            ("b", Service::Communications, 100.0, 200.0),
        ]);
        let d = run(&p, 1, Arbitration::NavigationPriority);
        assert_eq!(d.peak_concurrent_demand, 1, "touching is not overlapping");
        assert_eq!(d.contention_s, 0.0);
        assert_eq!(d.total_outage_s, 0.0);
        assert_eq!(d.navigation_served_aperture_s, 100.0);
        assert_eq!(d.communications_served_aperture_s, 100.0);
        assert_eq!(d.horizon_s, 200.0);

        // Move the second window one second earlier and exactly one second is lost —
        // the off-by-one the boundary arithmetic would otherwise hide.
        let q = plan(&[
            ("a", Service::Navigation, 0.0, 100.0),
            ("b", Service::Communications, 99.0, 200.0),
        ]);
        let e = run(&q, 1, Arbitration::NavigationPriority);
        assert_eq!(e.peak_concurrent_demand, 2);
        assert_eq!(e.contention_s, 1.0);
        assert_eq!(e.total_outage_s, 1.0);
        assert_eq!(e.sessions[1].outage_s, 1.0);
        assert_eq!(e.sessions[1].requested_s, 101.0);
        assert_eq!(e.sessions[1].served_s, 100.0);
    }

    #[test]
    fn overlapping_windows_beyond_the_aperture_count_put_the_lower_ranked_session_in_outage() {
        // Three sessions overlap over 40..60; two apertures serve the two highest-ranked
        // and the third is out for exactly that stretch.
        let p = plan(&[
            ("nav-a", Service::Navigation, 0.0, 60.0),
            ("nav-b", Service::Navigation, 20.0, 80.0),
            ("comms-a", Service::Communications, 40.0, 100.0),
        ]);
        let d = run(&p, 2, Arbitration::NavigationPriority);
        assert_eq!(d.peak_concurrent_demand, 3);
        assert_eq!(
            d.contention_s, 20.0,
            "40..60 has three sessions on two apertures"
        );
        assert_eq!(d.sessions[0].outage_s, 0.0);
        assert_eq!(d.sessions[1].outage_s, 0.0);
        assert_eq!(d.sessions[2].outage_s, 20.0, "communications yields 40..60");
        assert_eq!(d.sessions[2].served_s, 40.0);
        // With a third aperture nobody contends.
        let e = run(&p, 3, Arbitration::NavigationPriority);
        assert_eq!(e.contention_s, 0.0);
        assert_eq!(e.total_outage_s, 0.0);
    }

    #[test]
    fn the_arbitration_policy_decides_which_service_holds_the_aperture() {
        // One aperture, a communications session already running when a navigation
        // session opens. The three policies give two genuinely different answers, and
        // the numbers are pinned for each — a duty figure without its policy is not a
        // number anyone can reproduce.
        let p = plan(&[
            ("comms-a", Service::Communications, 0.0, 100.0),
            ("nav-a", Service::Navigation, 50.0, 150.0),
        ]);

        let nav = run(&p, 1, Arbitration::NavigationPriority);
        assert_eq!(nav.navigation_served_aperture_s, 100.0);
        assert_eq!(nav.communications_served_aperture_s, 50.0);
        assert_eq!(
            nav.sessions[0].outage_s, 50.0,
            "communications is preempted"
        );
        assert_eq!(nav.sessions[1].outage_s, 0.0);

        let comms = run(&p, 1, Arbitration::CommunicationsPriority);
        assert_eq!(comms.navigation_served_aperture_s, 50.0);
        assert_eq!(comms.communications_served_aperture_s, 100.0);
        assert_eq!(comms.sessions[0].outage_s, 0.0);
        assert_eq!(comms.sessions[1].outage_s, 50.0);

        let fcfs = run(&p, 1, Arbitration::FirstComeFirstServed);
        assert_eq!(fcfs.navigation_served_aperture_s, 50.0);
        assert_eq!(fcfs.communications_served_aperture_s, 100.0);

        // The two preemptive policies disagree; that disagreement is the whole reason
        // the policy is an input.
        assert_ne!(nav.navigation_duty, comms.navigation_duty);
        // On this plan first-come-first-served happens to land where
        // communications-priority does, because the communications session got there
        // first. It is not the same rule — see the next test.
        assert_eq!(fcfs.navigation_duty, comms.navigation_duty);
    }

    #[test]
    fn first_come_first_served_does_not_preempt_a_session_already_holding_an_aperture() {
        // A long communications session holds the only aperture; a navigation session
        // opens inside it. Under first-come-first-served the holder keeps the aperture
        // to the end of its window even though the newcomer outranks it everywhere else.
        let p = plan(&[
            ("comms-long", Service::Communications, 0.0, 200.0),
            ("nav-short", Service::Navigation, 100.0, 120.0),
        ]);
        let d = run(&p, 1, Arbitration::FirstComeFirstServed);
        assert_eq!(
            d.sessions[0].served_s, 200.0,
            "the holder is never preempted"
        );
        assert_eq!(d.sessions[1].served_s, 0.0);
        assert_eq!(d.sessions[1].outage_s, 20.0);
        // Under navigation-priority the same plan preempts the holder for those 20 s.
        let e = run(&p, 1, Arbitration::NavigationPriority);
        assert_eq!(e.sessions[0].served_s, 180.0);
        assert_eq!(e.sessions[1].served_s, 20.0);
    }

    #[test]
    fn a_session_that_loses_arbitration_at_its_start_acquires_an_aperture_when_one_frees() {
        // Losing arbitration is not being dropped. The communications session waits out
        // the navigation window and is served for the rest of its own.
        let p = plan(&[
            ("nav-a", Service::Navigation, 0.0, 30.0),
            ("comms-a", Service::Communications, 10.0, 100.0),
        ]);
        let d = run(&p, 1, Arbitration::NavigationPriority);
        assert_eq!(d.sessions[1].requested_s, 90.0);
        assert_eq!(d.sessions[1].outage_s, 20.0, "waits 10..30");
        assert_eq!(d.sessions[1].served_s, 70.0, "served 30..100");
        assert!(d.sessions[1].outage_fraction > 0.0);
        assert!((d.sessions[1].outage_fraction - 20.0 / 90.0).abs() < 1e-12);
    }

    #[test]
    fn the_three_duties_account_for_every_available_aperture_second() {
        // Idle is accumulated in the sweep independently of the two service totals, so
        // this is a real closure check over the available aperture-seconds, not the same
        // sum compared with itself.
        for policy in [
            Arbitration::NavigationPriority,
            Arbitration::CommunicationsPriority,
            Arbitration::FirstComeFirstServed,
        ] {
            for apertures in 1..=4 {
                let p = plan(&[
                    ("n1", Service::Navigation, 0.0, 600.0),
                    ("c1", Service::Communications, 300.0, 1500.0),
                    ("n2", Service::Navigation, 1400.0, 2000.0),
                    ("c2", Service::Communications, 1450.0, 1600.0),
                    ("n3", Service::Navigation, 1500.0, 1700.0),
                ]);
                let d = run(&p, apertures, policy);
                let sum = d.navigation_duty + d.communications_duty + d.idle_duty;
                assert!(
                    (sum - 1.0).abs() < 1e-12,
                    "{policy:?} / {apertures} apertures: duties sum to {sum}"
                );
                let accounted = d.navigation_served_aperture_s
                    + d.communications_served_aperture_s
                    + d.idle_aperture_s;
                assert!(
                    (accounted - d.aperture_seconds_available).abs() < 1e-9,
                    "{policy:?} / {apertures}: {accounted} != {}",
                    d.aperture_seconds_available
                );
                // The per-session served times must add up to the two service totals.
                let per_session: f64 = d.sessions.iter().map(|s| s.served_s).sum();
                assert!(
                    (per_session
                        - (d.navigation_served_aperture_s + d.communications_served_aperture_s))
                        .abs()
                        < 1e-9
                );
            }
        }
    }

    #[test]
    fn adding_an_aperture_never_increases_any_session_outage() {
        // Measured, not assumed: over 200 pseudo-random plans and all three policies,
        // every session's served time is non-decreasing in the aperture count. This is
        // not obvious for the non-preemptive policy, where an extra aperture changes who
        // is holding what at every later boundary.
        fn xorshift(state: &mut u64) -> u64 {
            *state ^= *state << 13;
            *state ^= *state >> 7;
            *state ^= *state << 17;
            *state
        }
        let mut seed: u64 = 0x2545_F491_4F6C_DD1D;
        let next = &mut || xorshift(&mut seed);
        for _ in 0..200 {
            let n = 2 + (next() % 6) as usize;
            let rows: Vec<ContactWindow> = (0..n)
                .map(|i| {
                    let aos = (next() % 400) as f64;
                    let len = 1.0 + (next() % 200) as f64;
                    ContactWindow {
                        name: format!("s{i}"),
                        service: if next() % 2 == 0 {
                            Service::Navigation
                        } else {
                            Service::Communications
                        },
                        aos_s: aos,
                        los_s: aos + len,
                    }
                })
                .collect();
            let (h0, h1) = envelope(&rows);
            for policy in [
                Arbitration::NavigationPriority,
                Arbitration::CommunicationsPriority,
                Arbitration::FirstComeFirstServed,
            ] {
                let mut prev: Option<DutyCycle> = None;
                for apertures in 1..=(n + 1) {
                    let d = aperture_duty_cycle(&rows, apertures, policy, h0, h1)
                        .expect("random plan schedules");
                    if let Some(p) = &prev {
                        for (before, after) in p.sessions.iter().zip(d.sessions.iter()) {
                            assert!(
                                after.served_s >= before.served_s - 1e-9,
                                "{policy:?}: {} served {} with {} apertures but {} with {}",
                                before.name,
                                before.served_s,
                                apertures - 1,
                                after.served_s,
                                apertures
                            );
                        }
                        assert!(p.total_outage_s + 1e-9 >= d.total_outage_s);
                    }
                    prev = Some(d);
                }
            }
        }
    }

    #[test]
    fn enough_apertures_for_every_session_leave_no_outage_at_all() {
        let p = plan(&[
            ("a", Service::Navigation, 0.0, 100.0),
            ("b", Service::Communications, 0.0, 100.0),
            ("c", Service::Navigation, 0.0, 100.0),
        ]);
        for policy in [
            Arbitration::NavigationPriority,
            Arbitration::CommunicationsPriority,
            Arbitration::FirstComeFirstServed,
        ] {
            let d = run(&p, 3, policy);
            assert_eq!(d.total_outage_s, 0.0, "{policy:?}");
            assert_eq!(d.idle_aperture_s, 0.0, "{policy:?}");
            // A fourth aperture cannot be used by three sessions: it is pure idle.
            let e = run(&p, 4, policy);
            assert_eq!(e.total_outage_s, 0.0, "{policy:?}");
            assert_eq!(e.idle_aperture_s, 100.0, "{policy:?}");
            assert!((e.idle_duty - 0.25).abs() < 1e-12, "{policy:?}");
        }
    }

    #[test]
    fn the_reporting_horizon_clips_the_plan_and_sets_the_duty_denominator() {
        let p = plan(&[
            ("a", Service::Navigation, 0.0, 100.0),
            ("b", Service::Communications, 99.0, 200.0),
        ]);
        let d = aperture_duty_cycle(&p, 1, Arbitration::NavigationPriority, 50.0, 150.0)
            .expect("clipped plan schedules");
        assert_eq!(d.horizon_s, 100.0);
        assert_eq!(d.aperture_seconds_available, 100.0);
        assert_eq!(d.sessions[0].requested_s, 50.0, "a is clipped to 50..100");
        assert_eq!(d.sessions[1].requested_s, 51.0, "b is clipped to 99..150");
        assert_eq!(d.sessions[1].outage_s, 1.0);
        assert!((d.navigation_duty - 0.5).abs() < 1e-12);
        assert!((d.communications_duty - 0.5).abs() < 1e-12);
        assert_eq!(d.idle_duty, 0.0);
        // A window wholly outside the horizon requests nothing and is not an outage.
        let q = plan(&[
            ("a", Service::Navigation, 0.0, 100.0),
            ("late", Service::Communications, 500.0, 600.0),
        ]);
        let e = aperture_duty_cycle(&q, 1, Arbitration::NavigationPriority, 0.0, 200.0)
            .expect("plan schedules");
        assert_eq!(e.sessions[1].requested_s, 0.0);
        assert_eq!(e.sessions[1].outage_s, 0.0);
        assert_eq!(e.sessions[1].outage_fraction, 0.0);
    }

    #[test]
    fn a_predicted_pass_list_becomes_a_contact_plan_without_a_second_window_type() {
        // The contact plan is the engine's existing pass vocabulary: whatever the pass
        // predictor emits schedules directly.
        use crate::orbit::{Orbit, Propagator, R_EARTH_EQUATORIAL_M};
        let orbit = Propagator::Kepler(Orbit::new(
            R_EARTH_EQUATORIAL_M + 550_000.0,
            90.0_f64.to_radians(),
            0.0,
            0.0,
        ));
        let station = crate::frames::Geodetic {
            lat_rad: 52.0_f64.to_radians(),
            lon_rad: 0.0,
            alt_m: 0.0,
        };
        let jd0 = crate::timescales::julian_date(2024, 1, 1, 0, 0, 0.0);
        let passes = crate::passes::predict_passes(&orbit, station, jd0, 10.0, 24.0 * 3600.0, 10.0);
        assert!(
            !passes.is_empty(),
            "the predictor must give this test passes"
        );
        let windows = windows_from_passes(&passes, Service::Navigation, "pass-");
        assert_eq!(windows.len(), passes.len());
        assert_eq!(windows[0].aos_s, passes[0].aos_s);
        assert_eq!(windows[0].los_s, passes[0].los_s);
        assert_eq!(windows[0].name, "pass-1");
        let d = aperture_duty_cycle(&windows, 1, Arbitration::DEFAULT, 0.0, 24.0 * 3600.0)
            .expect("a predicted pass list schedules");
        // Every predicted pass is a navigation session and nothing else competes.
        assert_eq!(d.communications_served_aperture_s, 0.0);
        let total_access: f64 = passes.iter().map(|p| p.duration_s).sum();
        assert!((d.navigation_served_aperture_s - total_access).abs() < 1e-9);
        assert!((d.navigation_duty - total_access / (24.0 * 3600.0)).abs() < 1e-12);
    }

    /// serde_json parses floats without the `float_roundtrip` feature, so a value read
    /// back out of the rendered report can sit one ULP from the f64 the engine computed.
    /// Ratios are therefore compared with a tolerance; the aperture-second totals they
    /// are formed from are integers and are compared exactly.
    fn close(v: &serde_json::Value, expect: f64) -> bool {
        v.as_f64()
            .is_some_and(|x| (x - expect).abs() <= 1e-15 * expect.abs().max(1.0))
    }

    #[test]
    fn the_bundled_plan_duty_numbers_are_engine_outputs_for_one_and_two_apertures() {
        // The acceptance figures. The bundled plan asks for 6 900 s of contact across a
        // 9 000 s envelope: 2 100 s of navigation and 4 800 s of communications.
        let bundled = |apertures: usize| ApertureDutyCycleScenario {
            apertures,
            arbitration: "navigation-priority".to_string(),
            horizon_start_s: None,
            horizon_end_s: None,
            contacts: ad_default_contacts(),
        };

        let (j2, s2) = bundled(2).run_json().expect("two-aperture run");
        let v2: serde_json::Value = serde_json::from_str(&j2).expect("valid JSON");
        assert_eq!(v2["horizon_s"], 9000.0);
        assert_eq!(v2["aperture_seconds_available"], 18000.0);
        assert_eq!(v2["navigation_served_aperture_s"], 2100.0);
        assert_eq!(v2["communications_served_aperture_s"], 4800.0);
        assert_eq!(v2["idle_aperture_s"], 11100.0);
        assert!(close(&v2["navigation_duty"], 2100.0 / 18000.0));
        assert!(close(&v2["communications_duty"], 4800.0 / 18000.0));
        assert!(close(&v2["idle_duty"], 11100.0 / 18000.0));
        assert_eq!(v2["total_requested_s"], 6900.0);
        assert_eq!(v2["total_served_s"], 6900.0);
        assert_eq!(v2["total_outage_s"], 0.0);
        assert_eq!(v2["contention_s"], 0.0);
        assert_eq!(v2["peak_concurrent_demand"], 2);
        assert_eq!(v2["worst_outage_session"], serde_json::Value::Null);
        assert!(s2.contains("navigation-priority"));

        let (j1, s1) = bundled(1).run_json().expect("one-aperture run");
        let v1: serde_json::Value = serde_json::from_str(&j1).expect("valid JSON");
        assert_eq!(v1["aperture_seconds_available"], 9000.0);
        assert_eq!(v1["navigation_served_aperture_s"], 2100.0);
        assert_eq!(v1["communications_served_aperture_s"], 3600.0);
        assert_eq!(v1["idle_aperture_s"], 3300.0);
        assert!(close(&v1["navigation_duty"], 2100.0 / 9000.0));
        assert!(close(&v1["communications_duty"], 0.4));
        assert!(close(&v1["idle_duty"], 3300.0 / 9000.0));
        assert_eq!(v1["total_requested_s"], 6900.0);
        assert_eq!(v1["total_served_s"], 5700.0);
        assert_eq!(v1["total_outage_s"], 1200.0);
        assert_eq!(v1["contention_s"], 1200.0);
        assert_eq!(v1["worst_outage_session"], "comms-3");
        assert!(close(&v1["worst_outage_fraction"], 600.0 / 1800.0));
        assert!(s1.contains("navigation-priority"));

        // Dropping to one aperture costs communications alone on this plan: navigation
        // is served in full either way, and the whole 1 200 s loss lands on the three
        // communications sessions.
        for (i, row) in v1["sessions"].as_array().expect("rows").iter().enumerate() {
            let expect = [0.0, 300.0, 0.0, 300.0, 0.0, 600.0][i];
            assert_eq!(row["outage_s"], expect, "session {i}");
        }

        // The same two figures straight off the library type, with no JSON round trip
        // between the computation and the assertion.
        let p: Vec<ContactWindow> = ad_default_contacts()
            .iter()
            .map(|c| ContactWindow {
                name: c.name.clone(),
                service: Service::parse(&c.service).expect("known service"),
                aos_s: c.aos_s,
                los_s: c.los_s,
            })
            .collect();
        let two = run(&p, 2, Arbitration::NavigationPriority);
        assert_eq!(two.navigation_duty, 2100.0 / 18000.0);
        assert_eq!(two.communications_duty, 4800.0 / 18000.0);
        let one = run(&p, 1, Arbitration::NavigationPriority);
        assert_eq!(one.navigation_duty, 2100.0 / 9000.0);
        assert_eq!(one.communications_duty, 3600.0 / 9000.0);
    }

    #[test]
    fn the_report_states_the_policy_that_produced_the_numbers() {
        for (input, canonical) in [
            ("navigation-priority", "navigation-priority"),
            ("communications-priority", "communications-priority"),
            ("first-come-first-served", "first-come-first-served"),
            ("FCFS", "first-come-first-served"),
            ("comms", "communications-priority"),
        ] {
            let scn = ApertureDutyCycleScenario {
                apertures: 1,
                arbitration: input.to_string(),
                horizon_start_s: None,
                horizon_end_s: None,
                contacts: ad_default_contacts(),
            };
            let (json, summary) = scn.run_json().expect("run");
            let v: serde_json::Value = serde_json::from_str(&json).expect("valid JSON");
            assert_eq!(v["arbitration_policy"], canonical);
            assert!(
                v["arbitration_policy_definition"]
                    .as_str()
                    .is_some_and(|s| s.starts_with(canonical)),
                "the policy must state itself in full"
            );
            assert!(summary.contains(canonical), "the summary names the policy");
        }
        // The default is documented and is what a plan with no policy field gets.
        let bare: ApertureDutyCycleScenario =
            toml::from_str("kind = \"aperture-duty-cycle\"\n").expect("bare scenario parses");
        let (json, _) = bare.run_json().expect("run");
        let v: serde_json::Value = serde_json::from_str(&json).expect("valid JSON");
        assert_eq!(v["arbitration_policy"], "navigation-priority");
        assert_eq!(v["arbitration_policy_default"], "navigation-priority");
    }

    #[test]
    fn every_reported_figure_carries_a_unit_and_a_provenance_class() {
        let scn = ApertureDutyCycleScenario {
            apertures: 1,
            arbitration: "navigation-priority".to_string(),
            horizon_start_s: None,
            horizon_end_s: None,
            contacts: ad_default_contacts(),
        };
        let (json, _) = scn.run_json().expect("run");
        let v: serde_json::Value = serde_json::from_str(&json).expect("valid JSON");
        let units = v["units"].as_object().expect("a units block");
        assert!(!units.is_empty());
        for (field, meta) in units {
            assert!(meta["unit"].is_string(), "{field} has no unit");
            assert!(
                meta["provenance"].is_string(),
                "{field} has no provenance class"
            );
        }
        // The dimensionless fractions say so rather than leaving the unit blank.
        for f in ["navigation_duty", "communications_duty", "idle_duty"] {
            assert_eq!(units[f]["unit"], "fraction (dimensionless)");
        }
        // Every numeric field of the report is described. Strings, booleans and the
        // nullable worst-session name are not numbers and carry no unit.
        let described: std::collections::HashSet<&str> = units.keys().map(|k| k.as_str()).collect();
        for (key, value) in v.as_object().expect("an object") {
            if value.is_number() {
                assert!(
                    described.contains(key.as_str()),
                    "numeric field {key} is missing from the units block"
                );
            }
        }
        for (key, value) in v["sessions"][0].as_object().expect("a session row") {
            if value.is_number() {
                let path = format!("sessions[].{key}");
                assert!(
                    described.contains(path.as_str()),
                    "numeric field {path} is missing from the units block"
                );
            }
        }
    }

    #[test]
    fn the_units_block_describes_only_fields_that_exist() {
        // A units block that names a field nobody emits reads as a guarantee and
        // documents a ghost. `sessions[]` descends into the first row.
        let scn = ApertureDutyCycleScenario {
            apertures: 2,
            arbitration: "navigation-priority".to_string(),
            horizon_start_s: None,
            horizon_end_s: None,
            contacts: ad_default_contacts(),
        };
        let (json, _) = scn.run_json().expect("run");
        let v: serde_json::Value = serde_json::from_str(&json).expect("valid JSON");
        for field in v["units"].as_object().expect("units").keys() {
            let mut cur = &v;
            for seg in field.split('.') {
                cur = if let Some(name) = seg.strip_suffix("[]") {
                    let arr = cur
                        .get(name)
                        .and_then(|x| x.as_array())
                        .unwrap_or_else(|| panic!("{field}: {name} is not an array"));
                    arr.first()
                        .unwrap_or_else(|| panic!("{field}: {name} is empty"))
                } else {
                    cur.get(seg)
                        .unwrap_or_else(|| panic!("units names a missing field: {field}"))
                };
            }
            assert!(!cur.is_null(), "units names a null field: {field}");
        }
    }

    #[test]
    fn the_scenario_is_reproducible_and_declares_itself_modelled() {
        let scn = ApertureDutyCycleScenario {
            apertures: 2,
            arbitration: "navigation-priority".to_string(),
            horizon_start_s: None,
            horizon_end_s: None,
            contacts: ad_default_contacts(),
        };
        let (a, _) = scn.run_json().expect("run");
        let (b, _) = scn.run_json().expect("run");
        assert_eq!(a, b, "the duty cycle must be reproducible");
        let v: serde_json::Value = serde_json::from_str(&a).expect("valid JSON");
        assert_eq!(v["kind"], "aperture-duty-cycle");
        assert!(v["label"].as_str().is_some_and(|s| s.contains("MODELLED")));
        assert!(!a.contains("VALIDATED"));
        // The exclusions are stated, not implied.
        assert!(v["label"]
            .as_str()
            .is_some_and(|s| s.contains("No slew / retune / changeover time is charged")));
    }

    #[test]
    fn the_scenario_rejects_a_plan_it_cannot_schedule() {
        let base = || ApertureDutyCycleScenario {
            apertures: 2,
            arbitration: "navigation-priority".to_string(),
            horizon_start_s: None,
            horizon_end_s: None,
            contacts: ad_default_contacts(),
        };
        // Zero apertures has no duty cycle, not a zero one.
        let mut s = base();
        s.apertures = 0;
        assert!(s.run_json().is_err());
        // An unknown policy is refused rather than silently defaulted.
        let mut s = base();
        s.arbitration = "whoever-asks-loudest".to_string();
        assert!(s.run_json().is_err());
        // An unknown service likewise.
        let mut s = base();
        s.contacts[0].service = "weather".to_string();
        assert!(s.run_json().is_err());
        // A window that ends before it starts.
        let mut s = base();
        s.contacts[0].los_s = s.contacts[0].aos_s - 1.0;
        assert!(s.run_json().is_err());
        // A zero-length window.
        let mut s = base();
        s.contacts[0].los_s = s.contacts[0].aos_s;
        assert!(s.run_json().is_err());
        // An empty plan.
        let mut s = base();
        s.contacts.clear();
        assert!(s.run_json().is_err());
        // A horizon with no length.
        let mut s = base();
        s.horizon_start_s = Some(100.0);
        s.horizon_end_s = Some(100.0);
        assert!(s.run_json().is_err());
        // A non-finite window bound.
        let mut s = base();
        s.contacts[0].los_s = f64::NAN;
        assert!(s.run_json().is_err());
    }

    #[test]
    fn an_unnamed_session_is_given_its_position_in_the_plan_as_a_name() {
        let src = "kind = \"aperture-duty-cycle\"\n\
                   apertures = 1\n\
                   [[contacts]]\nservice = \"nav\"\naos_s = 0.0\nlos_s = 10.0\n\
                   [[contacts]]\nservice = \"comms\"\naos_s = 5.0\nlos_s = 20.0\n";
        let scn: ApertureDutyCycleScenario = toml::from_str(src).expect("parses");
        let (json, _) = scn.run_json().expect("run");
        let v: serde_json::Value = serde_json::from_str(&json).expect("valid JSON");
        assert_eq!(v["sessions"][0]["name"], "session-1");
        assert_eq!(v["sessions"][1]["name"], "session-2");
        assert_eq!(v["sessions"][0]["service"], "navigation");
        assert_eq!(v["sessions"][1]["service"], "communications");
        assert_eq!(v["sessions"][1]["outage_s"], 5.0);
    }
}
