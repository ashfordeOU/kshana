// SPDX-License-Identifier: AGPL-3.0-only
//! The static mapping: public resilience frameworks → what each asks → the Kshana
//! capability whose output supports evidence for it → the gap.
//!
//! Wording rule, enforced by a test: this text says Kshana outputs *support evidence for*
//! a requirement. It never says a framework is met, certified or conformed to. Requirement
//! text is paraphrased, never reproduced; the licensed standard (EN 16803) is cited by part
//! and by the clause numbers that are publicly visible, and nothing else.
//!
//! The Markdown under `docs/compliance/` embeds the tables [`framework_table_md`] writes;
//! `tests/compliance_report.rs` fails when a committed table is stale.

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
}

impl Framework {
    /// Every framework, in document order.
    pub const ALL: [Framework; 5] = [
        Framework::DhsRpcf,
        Framework::ImoShips,
        Framework::EasaAviation,
        Framework::Nis2,
        Framework::En16803,
    ];

    /// Stable machine name (used in JSON and in file names).
    pub fn id(self) -> &'static str {
        match self {
            Framework::DhsRpcf => "dhs-rpcf",
            Framework::ImoShips => "imo-ships",
            Framework::EasaAviation => "easa-aviation",
            Framework::Nis2 => "nis2-art21",
            Framework::En16803 => "en-16803",
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
        checked: "revision 4 read in full; sections are cited by heading because the bulletin does not number its recommendations. Conflict Zone Information Bulletins were not opened",
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
        title: "Space - Use of GNSS-based positioning for road Intelligent Transport Systems (ITS), Parts 1 to 3",
        version: "EN 16803-1:2020, EN 16803-2:2020, EN 16803-3:2020 (CEN/CLC/JTC 5)",
        url: "https://www.evs.ee/en/evs-en-16803-3-2020",
        checked: "catalogue scope text only; the standard is paid and was not read. Only Part 3 clause 6 and Annex A are identified by number in public material",
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
        row("IMO-A1046-3", ImoShips, "Resolution A.1046(27), harbour entrance, approach and coastal requirements",
          "A system counts as available only while it delivers the stated integrity at the stated accuracy, updated at a stated rate, with an integrity warning within a stated time.",
          &["integrity-monitoring"],
          "Kshana computes protection levels and availability against an alert limit for a modelled geometry; the resolution's accuracy, availability and warning-time values are not asserted here."),
        row("IMO-A1046-2", ImoShips, "Resolution A.1046(27), ocean requirements",
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
          "Operate in the presence of the normal interference level named in the referenced receiver standard. This is not an anti-jamming or anti-spoofing requirement.",
          &["jamming-effects", "receiver-log-trust"],
          "Normal-interference testing is a laboratory measurement on the receiver."),

        // --- EASA ----------------------------------------------------------------------------
        row("EASA-DESC", EasaAviation, "SIB 2022-02R4, Description",
          "Spoofing is harder to detect and more hazardous than jamming; there is no cockpit alert that tells the two apart; effects range from false terrain alerts to corrupted surveillance data and can persist after leaving the area.",
          &["jamming-effects", "spoofing-detection"],
          "Kshana models detector and link effects; cockpit alerting is an equipment property."),
        row("EASA-MFR", EasaAviation, "SIB 2022-02R4, Recommendations to aircraft and equipment manufacturers",
          "Assess jamming and spoofing effects on the product, including cumulative effects, and give operators guidance on spotting suspected spoofing and on operating limits when GNSS is lost.",
          &["receiver-log-trust", "jamming-effects", "spoofing-detection", "holdover"],
          "The assessment of the product itself is the manufacturer's; Kshana supplies a repeatable scenario and a scored receiver log as evidence in it."),
        row("EASA-OPS-SPOOF", EasaAviation, "SIB 2022-02R4, Recommendations to air operators (spoofing)",
          "Compare GNSS position and time against non-GNSS sources and watch the position-uncertainty figure and navigation aids to notice spoofing.",
          &["spoofing-detection", "receiver-log-trust", "source-diversity"],
          "Operational procedure and training are outside simulation outputs."),
        row("EASA-ANSP", EasaAviation, "SIB 2022-02R4, Recommendations to ATM/ANS providers and equipment designers",
          "Assess the effect of GNSS timing loss on communication, navigation and surveillance systems, keep ground navigation aids, and help detect interference.",
          &["holdover", "jamming-effects"],
          "Timing-holdover runs speak to the timing-loss assessment; ground-system design and procedures are not covered."),
        row("EASA-REPORT", EasaAviation, "SIB 2022-02R4, Reporting",
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
    ]
}

/// Markdown table of one framework's rows (the part `docs/compliance/` embeds).
pub fn framework_table_md(fw: Framework) -> String {
    let mut s = String::from(
        "| Reference | What it asks (paraphrased) | Kshana outputs that support evidence for it | Gap |\n|---|---|---|---|\n",
    );
    for r in rows().iter().filter(|r| r.framework == fw) {
        let caps = if r.capabilities.is_empty() {
            "none".to_string()
        } else {
            r.capabilities
                .iter()
                .map(|c| {
                    CAPABILITIES
                        .iter()
                        .find(|k| k.id == *c)
                        .map(|k| k.name)
                        .unwrap_or("?")
                })
                .collect::<Vec<_>>()
                .join("; ")
        };
        s.push_str(&format!(
            "| {} | {} | {} | {} |\n",
            r.reference, r.asks, caps, r.gap
        ));
    }
    s
}

/// Markdown list of one framework's sources.
pub fn sources_md(fw: Framework) -> String {
    let mut s = String::new();
    for src in SOURCES.iter().filter(|x| x.framework == fw) {
        s.push_str(&format!(
            "- **{}**: {}. <{}>. Read {}: {}.\n",
            src.title, src.version, src.url, SOURCES_ACCESSED, src.checked
        ));
    }
    s
}
