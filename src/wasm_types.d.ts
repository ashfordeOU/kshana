// SPDX-License-Identifier: AGPL-3.0-only
// Typed declarations appended to the wasm-pack `kshana.d.ts` (CAP-34), through
// `typescript_custom_section` in src/wasm.rs. The three closed vocabularies below are
// kept equal to the engine's own lists by tests/typed_api_sync.rs: the scenario kinds
// (`api::list_scenario_kinds`), the error tags (`KshanaError::kind_tag`) and the
// provenance classes (`field_schema::ProvenanceClass::ALL`).

/** Every built-in scenario kind, the value of a scenario's top-level `kind`. */
export type ScenarioKind =
  | "clock"
  | "inertial"
  | "orbit"
  | "ephemeris"
  | "integrity"
  | "lunar-integrity"
  | "lunar-time-offset"
  | "lunar-vlbi"
  | "lunar-joint-od-clock"
  | "lunar-frame-realisation"
  | "moonlight-service-volume"
  | "lunar-differential-pnt"
  | "lunar-station-coverage"
  | "lunar-interop-export"
  | "timetransfer"
  | "quantum-anomaly-detect"
  | "quantum-gnss-free-nav"
  | "quantum-time-transfer"
  | "hybrid"
  | "fusion"
  | "hybrid-ukf"
  | "gnss-ins"
  | "gnss-sim"
  | "jamming"
  | "spoof"
  | "spoof-detect"
  | "sweep"
  | "sweep-nd"
  | "gravity-map"
  | "terrain-nav"
  | "terrain-slam"
  | "combined-altpnt"
  | "pvt"
  | "mars-pnt"
  | "impairment-eval"
  | "quantum-trade"
  | "space-weather"
  | "oem-interop"
  | "launch-window"
  | "reentry"
  | "eo-coverage"
  | "space-packet"
  | "attitude-budget"
  | "passes"
  | "link-budget"
  | "lunar-time-budget"
  | "hybrid-optical-rf"
  | "cislunar-observability"
  | "conflict-resilience"
  | "lunar-attack-surface"
  | "realtime-frame-eop"
  | "aperture-duty-cycle"
  | "lunar-jamming"
  | "ins-trn-coast"
  | "lunar-vlbi-fim"
  | "tracking-loop"
  | "araim-reference-check"
  | "lunar-frame-campaign"
  | "lunar-llr-datum"
  | "lunar-beacon"
  | "earth-gnss-lunar"
  | "cislunar-arc-recovery"
  | "telecom-timing"
  | "slot-timing"
  | "spectrum"
  | "solar-system"
  | "body-pnt"
  | "constellation-design"
  | "campaign"
  | "leo-signal"
  | "leo-pass"
  | "leo-navmsg"
  | "leo-pvt"
  | "leo-ppp"
  | "ntn-positioning"
  | "leo-pnt-chain"
  | "contact-schedule"
  | "acm-link"
  | "aocs"
  | "entry-heating"
  | "eo-radiometry"
  | "ascent-losses"
  | "time-transfer-budget"
  | "optical-atmosphere";

/** The failure category `error_kind` returns (`""` on success). */
export type ErrorKind = "invalid_input" | "non_convergence" | "unsupported" | "io_error";

/** One entry of `scenario_kinds()`. */
export interface KindMeta {
  name: ScenarioKind;
  description: string;
  required_fields: string[];
  optional_fields: string[];
}

/** Where an emitted number came from (`docs/SCHEMA.md`). */
export type ProvenanceClass =
  | "input"
  | "modelled-input"
  | "computed"
  | "closed-form"
  | "spec"
  | "published"
  | "constant"
  | "modelled"
  | "internal-consistency"
  | "measured"
  | "measured-or-input"
  | "derived";

/** One entry of a result document's `units` block. */
export interface FieldUnit {
  unit: string;
  provenance: ProvenanceClass;
  note?: string;
}

/**
 * A parsed result document. Every kind has its own fields (`docs/SCHEMA.md`,
 * `docs/field-units-schema.json`); the ones named here are the shared envelope.
 */
export interface ResultDocument {
  [field: string]: unknown;
  schema_version?: string;
  engine_version?: string;
  units?: Record<string, FieldUnit>;
}

/** What `run_typed` returns: one run's outputs, with the document already parsed. */
export interface RunOutput {
  json: string;
  svg: string;
  summary: string;
  csv: string | null;
  data: ResultDocument;
}

/** The object `run_all` encodes as JSON. */
export interface RunAllOutput {
  json: string;
  svg: string;
  summary: string;
  csv: string | null;
}
