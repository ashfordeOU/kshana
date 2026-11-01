// SPDX-License-Identifier: AGPL-3.0-only
//! The static mapping: public resilience frameworks → what each asks → the Kshana
//! capability whose output supports evidence for it → the gap.
//!
//! Wording rule, enforced by a test: this text says Kshana outputs *support evidence for*
//! a requirement. It never says a framework is met or that a product has been rated or approved. Requirement
//! text is paraphrased, never reproduced; the licensed standard (EN 16803) is cited by part
//! and by the clause numbers that are publicly visible, and nothing else.
//!
//! The Markdown under `docs/compliance/` embeds the tables [`framework_table_md`] writes;
//! `tests/compliance_report.rs` fails when a committed table is stale.

mod ids;

/// The catalogue text `id` in the current language ([`crate::i18n::current`]). The data tables below
/// stay English: they are the machine mapping. The Markdown renderers read this.
fn tr(id: &str) -> String {
    crate::i18n::tr(id, &[])
}

/// A public framework the mapping covers.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Hash, PartialOrd, Ord)]
pub enum Framework {
    /// US DHS Resilient PNT Conformance Framework.
    DhsRpcf,
    /// IMO guidance for ships.
    ImoShips,
    /// EASA guidance for aviation.
    EasaAviation,
    /// EU NIS2 Directive, Article 21.
    Nis2,
    /// EN 16803 (road ITS GNSS positioning).
    En16803,
    /// NIST IR 8323r1, the Foundational PNT Profile.
    NistIr8323,
}

impl Framework {
    /// Every framework, in document order.
    pub const ALL: [Framework; 6] = [
        Framework::DhsRpcf,
        Framework::ImoShips,
        Framework::EasaAviation,
        Framework::Nis2,
        Framework::En16803,
        Framework::NistIr8323,
    ];

    /// Stable machine name (used in JSON and in file names).
    pub fn id(self) -> &'static str {
        match self {
            Framework::DhsRpcf => "dhs-rpcf",
            Framework::ImoShips => "imo-ships",
            Framework::EasaAviation => "easa-aviation",
            Framework::Nis2 => "nis2-art21",
            Framework::En16803 => "en-16803",
            Framework::NistIr8323 => "nist-ir-8323r1",
        }
    }

    /// Human title.
    pub fn title(self) -> &'static str {
        match self {
            Framework::DhsRpcf => "US DHS Resilient PNT Conformance Framework",
            Framework::ImoShips => "IMO guidance on GNSS interference for ships",
            Framework::EasaAviation => "EASA guidance on GNSS interference for aviation",
            Framework::Nis2 => "EU NIS2 Directive, Article 21 risk-management measures",
            Framework::En16803 => "EN 16803, GNSS-based positioning for road ITS",
            Framework::NistIr8323 => "NIST IR 8323r1, Foundational PNT Profile",
        }
    }

    /// [`Self::title`] from the catalogue, in the current language (English: the same text). For a
    /// person; machine documents carry [`Self::title`].
    pub fn title_localised(self) -> String {
        let key = self.id();
        match ids::FRAMEWORK_TITLE_IDS.iter().find(|(k, _)| *k == key) {
            Some((_, id)) => tr(id),
            None => self.title().to_string(),
        }
    }
}

/// A source document the mapping cites.
#[derive(Clone, Copy, Debug)]
pub struct Source {
    /// The framework it belongs to.
    pub framework: Framework,
    /// Title.
    pub title: &'static str,
    /// Identifier and version or date.
    pub version: &'static str,
    /// Canonical URL.
    pub url: &'static str,
    /// What was checked, and what was not.
    pub checked: &'static str,
}

/// The date the sources below were last read.
pub const SOURCES_ACCESSED: &str = "2026-10-09";

/// Every source document, with its version and URL.
pub const SOURCES: &[Source] = &[
    Source {
        framework: Framework::DhsRpcf,
        title: "Resilient Positioning, Navigation, and Timing (PNT) Conformance Framework",
        version: "Version 2.0, 26 April 2022 (DHS Science and Technology Directorate, with CISA)",
        url: "https://www.dhs.gov/sites/default/files/2022-05/22_0531_st_resilient_pnt_conformance_framework_v2.0.pdf",
        checked: "document read in full; the publication landing page was not fetched",
    },
    Source {
        framework: Framework::ImoShips,
        title: "Deliberate interference with the United States Global Positioning System and other global navigation satellite systems",
        version: "IMO MSC.1/Circ.1644, 18 October 2021",
        url: "https://rntfnd.org/wp-content/uploads/IMO-Circular-MSC.1-Circ.1644-Deliberate-Interference-With-The-United-States-Global-Positioning-System-Gps-And-Other...-Secretariat.pdf_safe.pdf",
        checked: "text read in full from this third-party mirror of the circular, not from the IMO site; check the IMO document library for the authoritative copy",
    },
    Source {
        framework: Framework::ImoShips,
        title: "Worldwide Radionavigation System",
        version: "IMO Assembly resolution A.1046(27), adopted 30 November 2011",
        url: "https://wwwcdn.imo.org/localresources/en/KnowledgeCentre/IndexofIMOResolutions/AssemblyDocuments/A.1046(27).pdf",
        checked: "document read in full",
    },
    Source {
        framework: Framework::ImoShips,
        title: "Performance standards for multi-system shipborne radionavigation receivers",
        version: "IMO MSC.401(95), adopted 8 June 2015 (amended by MSC.432(98), 2017)",
        url: "https://wwwcdn.imo.org/localresources/en/KnowledgeCentre/IndexofIMOResolutions/MSCResolutions/MSC.401(95).pdf",
        checked: "original resolution read in full; the 2017 amendment text was not read. No IMO circular on GNSS interference later than MSC.1/Circ.1644 was found; check the IMO document library for newer ones",
    },
    Source {
        framework: Framework::EasaAviation,
        title: "Global Navigation Satellite System Outage and Alterations Leading to Communication / Navigation / Surveillance Degradation",
        version: "EASA Safety Information Bulletin SIB 2022-02R4, issued 3 July 2026, corrected 22 July 2026 (informational, not mandatory)",
        url: "https://ad.easa.europa.eu/ad/2022-02R4",
        checked: "revision 4 read in full; sections are cited by heading because the bulletin does not number its recommendations. Re-checked 2026-10-10: the bulletin PDF, the EASA AD-tool page (which lists its supersedure as none) and the EASA GNSS page name no later revision and no bulletin numbered 2026-07; a banner naming Revision 2 of SIB 2026-07 was not found, so the question is open and should be checked on the live EASA page. Conflict Zone Information Bulletins were not opened",
    },
    Source {
        framework: Framework::Nis2,
        title: "Directive (EU) 2022/2555 on measures for a high common level of cybersecurity across the Union (NIS 2 Directive)",
        version: "OJ L 333, 27.12.2022, pp. 80-152",
        url: "https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:32022L2555",
        checked: "the Article 21 paragraph letters were read from a summary of the EUR-Lex page and match the published text; confirm against the page before citing a letter in a filing",
    },
    Source {
        framework: Framework::En16803,
        title: "Space - Use of GNSS-based positioning for road Intelligent Transport Systems (ITS) - Part 1: Definitions and system engineering procedures for the establishment and assessment of performances",
        version: "EN 16803-1:2020 (catalogue: valid from 2 October 2020, replacing the 2016 edition)",
        url: "https://www.evs.ee/en/evs-en-16803-1-2020",
        checked: "catalogue scope text only; the standard is paid and was not read",
    },
    Source {
        framework: Framework::En16803,
        title: "Space - Use of GNSS-based positioning for road Intelligent Transport Systems (ITS) - Part 2: Assessment of basic performances of GNSS-based positioning terminals",
        version: "EN 16803-2:2020 (catalogue: valid from 2 October 2020)",
        url: "https://www.evs.ee/en/evs-en-16803-2-2020",
        checked: "catalogue scope text only; the standard is paid and was not read",
    },
    Source {
        framework: Framework::En16803,
        title: "Space - Use of GNSS-based positioning for road Intelligent Transport Systems (ITS) - Part 3: Assessment of security performances of GNSS-based positioning terminals",
        version: "EN 16803-3:2020 (catalogue: valid from 2 October 2020)",
        url: "https://www.evs.ee/en/evs-en-16803-3-2020",
        checked: "catalogue scope text only; the standard is paid and was not read. The catalogue text names clause 6 (recorded versus simulated signals) and Annex A (a high-level categorisation of attacks) and nothing else by number; the catalogue gives no committee name, so none is stated here",
    },
    Source {
        framework: Framework::NistIr8323,
        title: "Foundational PNT Profile: Applying the Cybersecurity Framework for the Responsible Use of Positioning, Navigation, and Timing (PNT) Services",
        version: "NIST IR 8323r1, January 2023 (NIST Internal Report)",
        url: "https://nvlpubs.nist.gov/nistpubs/ir/2023/NIST.IR.8323r1.pdf",
        checked: "the PDF was fetched on 2026-10-18 (SHA-256 recorded in tests/fixtures/compliance/headings.json) and its Profile tables 3 to 25 were read for the subcategories cited; the other sections, the appendices and the publication landing page were not read. Subcategory identifiers follow the Profile's own tables, which use Cybersecurity Framework 1.1 identifiers",
    },
];

/// A capability: something Kshana computes or reads, and the run kinds that carry it.
#[derive(Clone, Copy, Debug)]
pub struct Capability {
    /// Stable id.
    pub id: &'static str,
    /// Short name.
    pub name: &'static str,
    /// What the output is, in a sentence.
    pub output: &'static str,
    /// Scenario kinds whose result carries it (`receiver-trust` is a kind here too).
    pub kinds: &'static [&'static str],
}

/// The capabilities rows refer to.
pub const CAPABILITIES: &[Capability] = &[
    Capability {
        id: "receiver-log-trust",
        name: "Receiver-log trust assessment",
        output: "per-epoch trust state of a real receiver's own log, alarm times, and agreement with events stated before the run",
        kinds: &["receiver-trust"],
    },
    Capability {
        id: "jamming-effects",
        name: "Jamming link-budget effects",
        output: "carrier-to-noise density and lock state per satellite under a stated jammer geometry",
        kinds: &["jamming", "lunar-jamming", "conflict-resilience"],
    },
    Capability {
        id: "spoofing-detection",
        name: "Spoofing and meaconing detection",
        output: "detector decisions and detector discrimination under a stated spoofing attack",
        kinds: &["spoof", "spoof-detect", "impairment-eval"],
    },
    Capability {
        id: "integrity-monitoring",
        name: "Integrity monitoring and protection levels",
        output: "protection levels, availability against alert limits, and fault-detection results",
        kinds: &["integrity", "araim-reference-check", "lunar-integrity"],
    },
    Capability {
        id: "holdover",
        name: "Holdover and coasting",
        output: "position or time error growth while GNSS is denied, against a stated threshold",
        kinds: &[
            "clock",
            "inertial",
            "gnss-ins",
            "ins-trn-coast",
            "hybrid",
            "hybrid-ukf",
            "fusion",
            "timetransfer",
            "quantum-gnss-free-nav",
            "quantum-time-transfer",
        ],
    },
    Capability {
        id: "source-diversity",
        name: "Alternative and diverse PNT sources",
        output: "navigation or timing performance from sources independent of the primary GNSS band",
        kinds: &[
            "combined-altpnt",
            "terrain-nav",
            "terrain-slam",
            "gravity-map",
            "leo-pass",
            "leo-pvt",
            "leo-pnt-chain",
            "hybrid-optical-rf",
            "ntn-positioning",
            "hybrid",
            "fusion",
        ],
    },
    Capability {
        id: "resilience-scoring",
        name: "Resilience scoring over threat ensembles",
        output: "survival and resilience ratios per threat vector over a stated ensemble, with the assumptions stated",
        kinds: &["conflict-resilience", "campaign"],
    },
    Capability {
        id: "run-provenance",
        name: "Reproducible run provenance",
        output: "scenario hash, engine version and seed carried in each result so a run can be repeated",
        kinds: &[],
    },
];

/// The result fields a run of each kind must carry before it counts as evidence for a
/// capability. A kind label alone is not evidence: `{"kind": "jamming"}` carries no per-satellite
/// figure. Each pointer is a JSON pointer (RFC 6901) that must resolve to a non-empty value.
/// The fields are the ones the engine writes for that kind (checked against bundled
/// scenarios); a result missing any of them is listed as carrying nothing for the capability.
pub const KIND_FIELDS: &[(&str, &[&str])] = &[
    (
        "receiver-trust",
        &["/log/epochs", "/monitors_run", "/events_evaluable"],
    ),
    ("jamming", &["/fom", "/epochs"]),
    ("lunar-jamming", &["/fom", "/links"]),
    (
        "conflict-resilience",
        &["/per_vector_survival", "/resilience_ratio"],
    ),
    ("spoof", &["/threshold_ns", "/quantum", "/classical"]),
    ("spoof-detect", &["/decision", "/verdict"]),
    ("impairment-eval", &["/auc", "/per_class_pd"]),
    ("integrity", &["/samples_total", "/samples_available"]),
    ("araim-reference-check", &["/vectors", "/acceptance_met"]),
    (
        "lunar-integrity",
        &["/samples_total", "/samples_available", "/max_hpl_m"],
    ),
    ("clock", &["/threshold_ns", "/quantum", "/classical"]),
    ("inertial", &["/threshold_m", "/quantum", "/classical"]),
    ("gnss-ins", &["/threshold_m", "/quantum", "/classical"]),
    ("ins-trn-coast", &["/imu", "/trn"]),
    ("hybrid", &["/quantum", "/classical"]),
    ("hybrid-ukf", &["/coast", "/consistency"]),
    ("fusion", &["/quantum", "/classical"]),
    ("timetransfer", &["/quantum", "/classical"]),
    (
        "quantum-gnss-free-nav",
        &["/quantum_pos_err_m", "/classical_pos_err_m"],
    ),
    (
        "quantum-time-transfer",
        &["/quantum_chain_sigma_s", "/protection_level_ns"],
    ),
    (
        "combined-altpnt",
        &["/free_inertial_drift_m", "/combined_m"],
    ),
    (
        "terrain-nav",
        &["/free_inertial_drift_m", "/matched_error_m"],
    ),
    (
        "terrain-slam",
        &["/free_inertial_final_m", "/matched_final_m"],
    ),
    (
        "gravity-map",
        &["/free_inertial_drift_m", "/map_matched_error_m"],
    ),
    ("leo-pass", &["/satellites", "/user"]),
    ("leo-pvt", &["/joint", "/systems"]),
    ("leo-pnt-chain", &["/fusion", "/handoffs"]),
    (
        "hybrid-optical-rf",
        &["/optical_availability", "/rf_availability"],
    ),
    ("ntn-positioning", &["/cn0_dbhz", "/n_satellites"]),
    ("campaign", &["/timeline", "/reproducibility"]),
];

/// The fields a kind must carry, or `None` for a kind the mapping does not use.
pub fn required_fields(kind: &str) -> Option<&'static [&'static str]> {
    KIND_FIELDS
        .iter()
        .find(|(k, _)| *k == kind)
        .map(|(_, f)| *f)
}

/// One row of the mapping.
#[derive(Clone, Copy, Debug)]
pub struct Row {
    /// Stable id.
    pub id: &'static str,
    /// Framework.
    pub framework: Framework,
    /// Clause, requirement or section reference.
    pub reference: &'static str,
    /// What it asks, paraphrased.
    pub asks: &'static str,
    /// Capability ids whose output supports evidence for it. Empty: no Kshana output speaks to it.
    pub capabilities: &'static [&'static str],
    /// What Kshana does not provide for this row, which the user must supply by other means.
    pub gap: &'static str,
}

#[allow(clippy::too_many_arguments)]
const fn row(
    id: &'static str,
    framework: Framework,
    reference: &'static str,
    asks: &'static str,
    capabilities: &'static [&'static str],
    gap: &'static str,
) -> Row {
    Row {
        id,
        framework,
        reference,
        asks,
        capabilities,
        gap,
    }
}

/// Every row, grouped by framework in document order.
pub fn rows() -> Vec<Row> {
    use Framework::*;
    vec![
        // --- DHS Resilient PNT Conformance Framework v2.0 -------------------------------
        row("DHS-S5.2", DhsRpcf, "Section 5.2 (Prevent, Respond, Recover)",
          "Resilience is described as three functions: preventing harm, responding (detect, report, mitigate, contain) and recovering. Detection is probabilistic, so false alarms and missed detections both matter.",
          &["receiver-log-trust", "spoofing-detection", "holdover"],
          "Prevention is a product-design property that no simulation output shows. Detection statistics from a synthetic or single-session run are not a measured false-alarm or miss rate for a fielded product."),
        row("DHS-L1-R1", DhsRpcf, "Level 1, requirement 1",
          "Check that stored data arriving from external sources matches the formats and value ranges of the relevant standards.",
          &[],
          "A software-assurance and input-validation property of the product under test. Kshana does not inspect a product's input handling."),
        row("DHS-L1-R2", DhsRpcf, "Level 1, requirement 2",
          "Allow full manual recovery by clearing or resetting memory, returning the system to defined performance once the threat is gone.",
          &["receiver-log-trust"],
          "A receiver log shows when a fix became untrusted and when it recovered; it does not show that a manual reset clears every stored state."),
        row("DHS-L1-R3", DhsRpcf, "Level 1, requirement 3",
          "Reload or update firmware securely.",
          &[],
          "Firmware update security is outside what any Kshana output observes."),
        row("DHS-L2-R4", DhsRpcf, "Level 2, requirement 4",
          "Identify compromised PNT sources and stop them corrupting the solution.",
          &["spoofing-detection", "receiver-log-trust", "integrity-monitoring"],
          "Kshana scores detectors and monitors it models or runs over a log; whether a product's own source exclusion works needs the product's internal state, not only its log."),
        row("DHS-L2-R5", DhsRpcf, "Level 2, requirement 5",
          "Recover sources and the system automatically without interrupting output; a solution is still provided during the threat, with possibly unbounded degradation.",
          &["holdover", "receiver-log-trust"],
          "Holdover runs bound modelled drift for a stated clock or inertial model, not the product's own recovery behaviour."),
        row("DHS-L3-R6", DhsRpcf, "Level 3, requirement 6",
          "Corrupt data from one source must not contaminate another source.",
          &["source-diversity"],
          "Kshana runs sources side by side; source isolation inside a product needs design review or fault injection into the product."),
        row("DHS-L3-R7", DhsRpcf, "Level 3, requirement 7",
          "Cross-verify the solutions of all sources, and keep degradation during a threat bounded.",
          &["integrity-monitoring", "holdover", "source-diversity"],
          "Bounded degradation is shown for the modelled sensors; the product's own cross-checking is not observed."),
        row("DHS-L4-R8", DhsRpcf, "Level 4, requirement 8",
          "Use sources of different technologies against common-mode threats, with no degradation during the threat.",
          &["source-diversity", "jamming-effects"],
          "A common-mode argument needs the real product's source set and a threat that spans them; a scenario states one, it does not prove the product has no shared weakness."),
        row("DHS-S5.5", DhsRpcf, "Section 5.5 (common mode)",
          "Diverse mechanisms must not share a weakness: for example a jammer that covers two bands defeats band diversity.",
          &["jamming-effects", "resilience-scoring", "source-diversity"],
          "Scoring uses a synthetic threat ensemble, stated as such; it is not field data."),
        row("DHS-S8.1-8.3", DhsRpcf, "Sections 8.1 to 8.3 (evaluation)",
          "Evaluation combines static analysis with dynamic analysis, where test vectors stand in for threats; the test classes are source failure, interference and internal faults. Simulators are named as a test method.",
          &["receiver-log-trust", "jamming-effects", "spoofing-detection"],
          "Exported motion and events can drive a laboratory simulator (docs/TEST-BENCH.md). Kshana writes no signal, so the simulator and its authorised operator supply the threat."),
        row("DHS-S8.6", DhsRpcf, "Section 8.6 (test-plan elements)",
          "A test plan states the level, requirement, inputs, references, data access needed, procedure with pass or fail criteria, results and notes.",
          &["run-provenance", "receiver-log-trust"],
          "Pass or fail criteria are chosen by the assessor; Kshana records the inputs, thresholds and hashes it ran with."),

        // --- IMO ---------------------------------------------------------------------------
        row("IMO-1644-3", ImoShips, "MSC.1/Circ.1644, paragraph 3",
          "Deliberate GNSS interference is a substantial risk to the safety of navigation, people, property and the environment.",
          &["jamming-effects", "spoofing-detection"],
          "A statement of risk; Kshana quantifies effects for a stated geometry, not the risk in a sea area."),
        row("IMO-1644-5", ImoShips, "MSC.1/Circ.1644, paragraph 5",
          "Member States are asked to limit interference from their territory, consider warnings to mariners, and consider measures against unauthorised transmissions.",
          &[],
          "Addressed to States and administrations; no simulation output speaks to it."),
        row("IMO-A1046-3", ImoShips, "Resolution A.1046(27), annex paragraph 3 (harbour entrances, harbour approaches and coastal waters)",
          "A system counts as available only while it delivers the stated integrity at the stated accuracy, updated at a stated rate, with an integrity warning within a stated time.",
          &["integrity-monitoring"],
          "Kshana computes protection levels and availability against an alert limit for a modelled geometry; the resolution's accuracy, availability and warning-time values are not asserted here."),
        row("IMO-A1046-2", ImoShips, "Resolution A.1046(27), annex paragraph 2 (ocean waters)",
          "Ocean-phase accuracy, update rate, availability and integrity-warning requirements for the radionavigation system.",
          &["integrity-monitoring"],
          "As above for the ocean phase."),
        row("IMO-401-3.1", ImoShips, "MSC.401(95), 3.1 to 3.2",
          "The receiver uses civil signals from at least two independent systems and delivers a position, velocity and time solution with the resilience and integrity needed.",
          &["source-diversity", "integrity-monitoring"],
          "Multi-constellation integrity is modelled; the receiver's actual use of two systems is a product test."),
        row("IMO-401-3.11", ImoShips, "MSC.401(95), 3.11 to 3.14",
          "The receiver assesses accuracy and integrity per navigation phase, cautions when it cannot, warns when no new solution arrives in time, and shows the last plausible value with an explicit state.",
          &["receiver-log-trust", "integrity-monitoring", "holdover"],
          "Kshana reads timing and trust from a log; whether the displayed caution and warning intervals match the standard's needs the receiver's user interface, which a log does not show."),
        row("IMO-401-3.16", ImoShips, "MSC.401(95), 3.15 to 3.16",
          "Show the status of augmentation, and the position, course, speed, time and the sources used.",
          &[],
          "Display requirements; no Kshana output speaks to them."),
        row("IMO-401-4.2", ImoShips, "MSC.401(95), 4.2",
          "Operate satisfactorily under normal interference conditions, consistent with resolution A.694(17) (general requirements for shipborne radio equipment) and the typical on-board and external radio environment. This is not an anti-jamming or anti-spoofing requirement.",
          &["jamming-effects", "receiver-log-trust"],
          "Normal-interference testing is a laboratory measurement on the receiver; resolution A.694(17) itself was not read."),

        // --- EASA ----------------------------------------------------------------------------
        row("EASA-DESC", EasaAviation, "SIB 2022-02R4, Description",
          "Spoofing is harder to detect and more hazardous than jamming; there is no cockpit alert that tells the two apart; effects range from false terrain alerts to corrupted surveillance data and can persist after leaving the area.",
          &["jamming-effects", "spoofing-detection"],
          "Kshana models detector and link effects; cockpit alerting is an equipment property."),
        row("EASA-MFR", EasaAviation, "SIB 2022-02R4, Recommendation(s): aircraft and equipment manufacturers, should",
          "Assess jamming and spoofing effects on the product, including cumulative effects, and give operators guidance on spotting suspected spoofing and on operating limits when GNSS is lost.",
          &["receiver-log-trust", "jamming-effects", "spoofing-detection", "holdover"],
          "The assessment of the product itself is the manufacturer's; Kshana supplies a repeatable scenario and a scored receiver log as evidence in it."),
        row("EASA-OPS-SPOOF", EasaAviation, "SIB 2022-02R4, Recommendation(s): air operators should (spoofing)",
          "Compare GNSS position and time against non-GNSS sources and watch the position-uncertainty figure and navigation aids to notice spoofing.",
          &["spoofing-detection", "receiver-log-trust", "source-diversity"],
          "Operational procedure and training are outside simulation outputs."),
        row("EASA-ANSP", EasaAviation, "SIB 2022-02R4, Recommendation(s): ATM/ANS providers should; organisations involved in the design or production of ATM/ANS equipment, should",
          "Assess the effect of GNSS timing loss on communication, navigation and surveillance systems, keep ground navigation aids, and help detect interference.",
          &["holdover", "jamming-effects"],
          "Timing-holdover runs speak to the timing-loss assessment; ground-system design and procedures are not covered."),
        row("EASA-REPORT", EasaAviation, "SIB 2022-02R4, Recommendation(s): closing reminders on reporting",
          "Report events affecting safety under the occurrence-reporting regulation, and report suspected spoofing and higher-risk jamming to the manufacturer.",
          &[],
          "A reporting duty; no output speaks to it."),

        // --- NIS2 Article 21 -------------------------------------------------------------------
        row("NIS2-21-1", Nis2, "Article 21(1)",
          "Take proportionate technical, operational and organisational measures to manage the risks to network and information systems, in light of the state of the art, exposure, size and the likelihood and severity of incidents.",
          &["resilience-scoring", "jamming-effects"],
          "Kshana speaks only to the positioning and timing dependency of a system, not to information-security risk in general."),
        row("NIS2-21-2-a", Nis2, "Article 21(2)(a)",
          "Policies on risk analysis and on information system security.",
          &["resilience-scoring", "jamming-effects", "spoofing-detection"],
          "Supports the PNT part of a risk analysis; the policy itself is organisational."),
        row("NIS2-21-2-b", Nis2, "Article 21(2)(b)",
          "Incident handling.",
          &["receiver-log-trust"],
          "A scored receiver log helps date the start and end of a PNT interference incident; the handling process is organisational."),
        row("NIS2-21-2-c", Nis2, "Article 21(2)(c)",
          "Business continuity, such as backup management, disaster recovery and crisis management.",
          &["holdover", "source-diversity"],
          "Shows how long a modelled fallback keeps a timing or position bound; continuity plans are organisational."),
        row("NIS2-21-2-d", Nis2, "Article 21(2)(d)",
          "Supply chain security, including relationships with direct suppliers.",
          &[],
          "Kshana does not assess suppliers. Using a neutral, reproducible bench for receiver acceptance is one input a buyer can use, not a supply-chain assessment."),
        row("NIS2-21-2-e", Nis2, "Article 21(2)(e)",
          "Security in acquiring, developing and maintaining systems, including vulnerability handling and disclosure.",
          &["receiver-log-trust", "run-provenance"],
          "Repeatable acceptance tests of a receiver's interference behaviour support evidence for the acquisition part; vulnerability handling is outside."),
        row("NIS2-21-2-f", Nis2, "Article 21(2)(f)",
          "Policies and procedures to assess how effective the cybersecurity risk-management measures are.",
          &["run-provenance", "receiver-log-trust"],
          "Hashed, repeatable runs and events stated before scoring support evidence for an effectiveness test; the policy and its schedule are organisational."),
        row("NIS2-21-2-ghij", Nis2, "Article 21(2)(g) to (j)",
          "Cyber hygiene and training; cryptography and encryption; human-resources security, access control and asset management; multi-factor authentication and secured communications.",
          &[],
          "Not addressable by positioning and timing run outputs."),
        row("NIS2-21-3", Nis2, "Article 21(3)",
          "When choosing supply chain measures, consider each supplier's vulnerabilities and the quality and secure development of its products.",
          &[],
          "See Article 21(2)(d)."),

        // --- EN 16803 ----------------------------------------------------------------------------
        row("EN16803-1", En16803, "EN 16803-1 (definitions and system engineering procedures)",
          "Defines the road-ITS architecture, performance features and metrics, and a method to compare test environments. Sets no requirements.",
          &["run-provenance"],
          "Clause numbers are not publicly visible. A licence holder should map Kshana's output fields to the metric definitions."),
        row("EN16803-2", En16803, "EN 16803-2 (basic performance of GNSS-based terminals)",
          "Replay-based laboratory test procedures for availability, continuity, accuracy, integrity and time to first fix of the position output. Sets no minimum values.",
          &["holdover", "integrity-monitoring"],
          "Kshana's exported motion can drive a replay; the standard's procedure, its recorded-signal handling and its metric computation are not reproduced here and need the licensed text."),
        row("EN16803-3-6", En16803, "EN 16803-3, clause 6",
          "Distinguishes recorded signals from simulated signals in the security tests.",
          &["receiver-log-trust"],
          "Kshana neither records nor simulates a signal. It exports motion and events and scores the receiver's log."),
        row("EN16803-3-A", En16803, "EN 16803-3, Annex A",
          "A high-level categorisation of attacks on GNSS: interference, jamming, meaconing and spoofing.",
          &["jamming-effects", "spoofing-detection"],
          "Kshana's scenarios name attack classes in the same broad terms; a clause-level crosswalk needs the licensed Annex."),

        // --- NIST IR 8323r1, Foundational PNT Profile -------------------------------------------
        row("NIST-ID.RA-1", NistIr8323, "ID.RA-1 (Risk Assessment)",
          "Identify, document and report vulnerabilities of the PNT system and of what distributes PNT data; where safe, test susceptibility to disruption or manipulation, which may use PNT signal simulation, under the law and business-continuity limits.",
          &["receiver-log-trust", "jamming-effects", "spoofing-detection"],
          "Kshana characterises susceptibility in modelled scenarios and in a receiver's recorded log. An inventory of the real system's vulnerabilities is the operator's, and any RF test is run with the operator's own equipment and authorisation: Kshana transmits nothing."),
        row("NIST-ID.RA-3", NistIr8323, "ID.RA-3 (Risk Assessment)",
          "Identify and document internal and external threats to PNT, from natural and unintentional disruption to deliberate attack such as jamming, spoofing and delay attacks.",
          &["jamming-effects", "spoofing-detection", "resilience-scoring"],
          "Scenarios state threats and their effects. A documented threat assessment for the user's own site and system is the user's to write; no scenario is evidence that a threat exists there."),
        row("NIST-ID.RA-4", NistIr8323, "ID.RA-4 (Risk Assessment)",
          "Identify potential impacts and likelihoods; for each threat state the extent of impact, how the error shows (step or ramp), the detection thresholds and what the error does downstream.",
          &["holdover", "jamming-effects", "spoofing-detection", "integrity-monitoring"],
          "Runs give impact figures (error growth, protection levels, link effects) for modelled sensors and a stated threat. Likelihoods are not produced, and a modelled impact is not a measured one."),
        row("NIST-ID.RA-5", NistIr8323, "ID.RA-5 (Risk Assessment)",
          "Use threats, vulnerabilities, likelihoods and impacts to assess risk, and reassess it periodically and when the system or the threat changes.",
          &["resilience-scoring", "run-provenance"],
          "Scoring uses a synthetic threat ensemble, stated as such. Hashed, repeatable runs make a reassessment comparable; the risk judgement and its schedule are organisational."),
        row("NIST-PR.DS-6", NistIr8323, "PR.DS-6 (Data Security)",
          "Verify the integrity of PNT data when sources disagree, for example by cross-checking several frequencies, constellations or independent sources.",
          &["integrity-monitoring", "source-diversity"],
          "Kshana computes protection levels and cross-source results for modelled geometry and sensors; the integrity checks inside a product are not observed."),
        row("NIST-PR.IP-10", NistIr8323, "PR.IP-10 (Information Protection Processes and Procedures)",
          "Test response and recovery plans; for a system with a backup time source, remove the primary source and confirm that time accuracy, steps and ramps stay within the stated clock requirements.",
          &["holdover", "receiver-log-trust"],
          "A holdover run models the removal and checks the error against a stated threshold; a scored receiver log shows a real loss and recovery. The test on the operator's own time server, and any RF used for it, are the operator's."),
        row("NIST-PR.PT-5", NistIr8323, "PR.PT-5 (Protective Technology)",
          "Use mechanisms for resilience in normal and adverse conditions: reject bad signals and data, and pair holdover with anomaly detection, redundant or fused sources and recovery.",
          &["holdover", "source-diversity", "integrity-monitoring"],
          "Modelled mechanisms and their limits are shown; whether a product implements them is a product test."),
        row("NIST-DE.AE-2", NistIr8323, "DE.AE-2 (Anomalies and Events)",
          "Analyse detected PNT events in real time and afterwards (source, error statistics, duration, frequency, location), tell harmful events from normal operation, and keep the raw data and analysis.",
          &["receiver-log-trust", "spoofing-detection", "run-provenance"],
          "Kshana scores a recorded log after the fact and keeps hashes of what it ran. It does not locate or attribute an interference source and does not monitor in real time as a service."),
        row("NIST-DE.AE-3", NistIr8323, "DE.AE-3 (Anomalies and Events)",
          "Collect and correlate event data from several sources and sensors, and cross-check PNT data from more than one source to detect anomalous behaviour.",
          &["receiver-log-trust", "spoofing-detection", "source-diversity"],
          "Kshana's monitors cross-check the streams of one receiver log or one scenario; correlation across an operator's own sensors and logs is theirs."),
        row("NIST-DE.AE-4", NistIr8323, "DE.AE-4 (Anomalies and Events)",
          "Determine the impact of events on PNT data and on the applications that depend on it, including infrequent events.",
          &["holdover", "integrity-monitoring", "receiver-log-trust"],
          "Impact is shown on the PNT output of a run or a log. Effects on a specific downstream application need that application's own requirements."),
        row("NIST-DE.AE-5", NistIr8323, "DE.AE-5 (Anomalies and Events)",
          "Set and document incident alert thresholds from the error and uncertainty tolerances the application needs, with the notification time.",
          &["integrity-monitoring", "holdover", "receiver-log-trust"],
          "Runs are scored against thresholds the user states and record them. Choosing the thresholds and the alert procedure is the user's."),
        row("NIST-DE.CM-1", NistIr8323, "DE.CM-1 (Security Continuous Monitoring)",
          "Monitor PNT sources and outputs against baselines to detect anomalies, using diverse sources and fault detection and exclusion, and check that monitoring covers the identified fault modes.",
          &["receiver-log-trust", "integrity-monitoring", "spoofing-detection", "source-diversity"],
          "Kshana runs and scores such monitors on logs and scenarios. Continuous monitoring of a live system, and coverage of every fault mode of a product, are not shown by a set of runs."),
        row("NIST-DE.DP-3", NistIr8323, "DE.DP-3 (Detection Processes)",
          "Test that event detection works as intended, periodically and after upgrades, against current threat profiles.",
          &["receiver-log-trust", "spoofing-detection", "run-provenance"],
          "Repeatable, hashed scenarios and events stated before scoring support evidence for such a test; running it on the operator's equipment on a schedule is theirs."),
        row("NIST-RS.AN-5", NistIr8323, "RS.AN-5 (Analysis)",
          "Set up verification and validation for known fault modes and newly found vulnerabilities, and record nominal and anomalous PNT data from incidents to improve later detection.",
          &["receiver-log-trust", "spoofing-detection"],
          "A scored log characterises one incident after the fact. Receiving and acting on disclosed vulnerabilities is a process outside any run."),
        row("NIST-RS.MI-2", NistIr8323, "RS.MI-2 (Mitigation)",
          "Once an incident is contained, mitigate it with alternate or complementary PNT sources so operation continues, and return the system to a proper working state.",
          &["source-diversity", "holdover"],
          "Runs show how long modelled fallback sources keep an error bounded; containment and the return to service are operational steps."),
    ]
}

/// Markdown table of one framework's rows (the part `docs/compliance/` embeds), in the current
/// language; in English it is exactly the table of the English constants.
pub fn framework_table_md(fw: Framework) -> String {
    let mut s = format!(
        "| {} | {} | {} | {} |\n|---|---|---|---|\n",
        crate::t!("compliance-mapping-header-reference"),
        crate::t!("compliance-mapping-header-asks"),
        crate::t!("compliance-mapping-header-capabilities"),
        crate::t!("compliance-mapping-header-gap")
    );
    for r in rows().iter().filter(|r| r.framework == fw) {
        let caps = if r.capabilities.is_empty() {
            crate::t!("compliance-mapping-none")
        } else {
            r.capabilities
                .iter()
                .map(|c| {
                    ids::CAPABILITY_IDS
                        .iter()
                        .find(|k| k.0 == *c)
                        .map(|k| tr(k.1))
                        .unwrap_or_else(|| "?".to_string())
                })
                .collect::<Vec<_>>()
                .join("; ")
        };
        let (reference, asks, gap) = match ids::ROW_IDS.iter().find(|k| k.0 == r.id) {
            Some((_, a, b, c)) => (tr(a), tr(b), tr(c)),
            None => (
                r.reference.to_string(),
                r.asks.to_string(),
                r.gap.to_string(),
            ),
        };
        s.push_str(&format!("| {reference} | {asks} | {caps} | {gap} |\n"));
    }
    s
}

/// Markdown list of one framework's sources, in the current language.
pub fn sources_md(fw: Framework) -> String {
    let mut s = String::new();
    for (i, src) in SOURCES
        .iter()
        .enumerate()
        .filter(|(_, x)| x.framework == fw)
    {
        let (title, version, checked) = match ids::SOURCE_IDS.get(i) {
            Some((a, b, c)) => (tr(a), tr(b), tr(c)),
            None => (
                src.title.to_string(),
                src.version.to_string(),
                src.checked.to_string(),
            ),
        };
        s.push_str("- ");
        s.push_str(&crate::t!(
            "compliance-source-line",
            title = title,
            version = version,
            url = src.url,
            accessed = SOURCES_ACCESSED,
            checked = checked
        ));
        s.push('\n');
    }
    s
}

#[cfg(test)]
mod tests {
    use super::*;

    /// The English catalogue says exactly what the English constants say, so the human renderings in
    /// English equal the machine data, and the pseudo-locale touches every field.
    #[test]
    fn catalogue_english_equals_the_constants() {
        crate::i18n::in_english(|| {
            for fw in Framework::ALL {
                assert_eq!(fw.title_localised(), fw.title());
            }
            assert_eq!(ids::SOURCE_IDS.len(), SOURCES.len());
            for (s, (a, b, c)) in SOURCES.iter().zip(ids::SOURCE_IDS) {
                assert_eq!(
                    (tr(a), tr(b), tr(c)),
                    (s.title.into(), s.version.into(), s.checked.into())
                );
            }
            for c in CAPABILITIES {
                let (_, n, o) = ids::CAPABILITY_IDS.iter().find(|k| k.0 == c.id).unwrap();
                assert_eq!((tr(n), tr(o)), (c.name.into(), c.output.into()));
            }
            let all = rows();
            assert_eq!(ids::ROW_IDS.len(), all.len());
            for r in &all {
                let (_, a, b, g) = ids::ROW_IDS.iter().find(|k| k.0 == r.id).unwrap();
                assert_eq!(
                    (tr(a), tr(b), tr(g)),
                    (r.reference.into(), r.asks.into(), r.gap.into())
                );
            }
        });
    }
}
