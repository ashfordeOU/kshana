// SPDX-License-Identifier: AGPL-3.0-only
//! Oscillator models (`kshana oscillator`, src/oscillator/): reference checks and behaviour tests.
//! The sideband check against Filler (1988) Tables I and II is the one external reference; the rest
//! are closed-form and internal-consistency checks (docs/OSCILLATOR.md).

mod common {
    use kshana::oscillator::*;
    use kshana::telecom_timing::PRESETS;

    #[test]
    fn presets_resolve_and_unknown_ids_are_refused() {
        for p in PRESETS {
            let s = ClockRef::Preset(p.id.into()).resolve().unwrap();
            assert_eq!(s.adev_points, p.adev_points.to_vec());
            assert!(s.g_sensitivity_per_g.is_none());
        }
        assert!(ClockRef::Preset("nope".into()).resolve().is_err());
    }

    #[test]
    fn the_noise_model_envelopes_the_datasheet_points() {
        for p in PRESETS {
            let s = OscSpec::from_preset(p.id).unwrap();
            let n = s.noise();
            for &(t, a) in p.adev_points {
                assert!(n.adev(t) >= a * (1.0 - 1e-9), "{} at {t}", p.id);
            }
        }
    }

    #[test]
    fn bad_figures_are_refused() {
        let mut s = OscSpec::from_preset("ocxo").unwrap();
        s.adev_points.push((-1.0, 1e-11));
        assert!(s.validate().is_err());
        let mut s = OscSpec::from_preset("ocxo").unwrap();
        s.power_w = Some(f64::NAN);
        assert!(s.validate().is_err());
    }

    #[test]
    fn unknown_parts_print_the_usage() {
        assert!(run_json("nope", "{}").is_err());
        assert!(run_json("vibration", "not json").is_err());
    }
}

mod vibration {
    use kshana::oscillator::vibration::*;

    /// Filler (1988) Table I (5 MHz) and Table II (1575 MHz): Γ = 2e-9/g, 5 g peak.
    /// `(carrier_hz, f_v, printed β, printed first sideband dBc)`.
    const FILLER_TABLES: &[(f64, f64, f64, f64)] = &[
        (5e6, 5.0, 0.01, -46.0),
        (5e6, 25.0, 0.002, -60.0),
        (5e6, 50.0, 0.001, -66.0),
        (5e6, 500.0, 0.0001, -86.0),
        (1575e6, 25.0, 0.63, -9.6),
        (1575e6, 50.0, 0.315, -16.0),
        (1575e6, 500.0, 0.0315, -36.0),
    ];

    #[test]
    fn sidebands_reproduce_filler_1988_tables_i_and_ii() {
        for &(f0, fv, beta_printed, dbc) in FILLER_TABLES {
            let beta = modulation_index(2e-9, 5.0, f0, fv);
            assert!(
                (beta - beta_printed).abs() <= 1e-9 + 1e-6 * beta_printed,
                "{f0} {fv}"
            );
            let l = sideband_dbc(beta);
            assert!((l - dbc).abs() <= 0.5, "{f0} {fv}: {l} vs {dbc}");
        }
        // The eighth row (1575 MHz, 5 Hz, β = 3.15, printed +2.3 dBc) is not reproduced.
        let beta = modulation_index(2e-9, 5.0, 1575e6, 5.0);
        assert!((beta - 3.15).abs() < 1e-9);
        assert!((sideband_dbc(beta) + 0.75).abs() < 0.05);
    }

    #[test]
    fn bessel_matches_known_values() {
        // Abramowitz and Stegun Table 9.1.
        assert!((bessel_j(0, 1.0) - 0.765_197_686_6).abs() < 1e-9);
        assert!((bessel_j(1, 1.0) - 0.440_050_585_7).abs() < 1e-9);
        assert!((bessel_j(0, 2.404_825_557_7)).abs() < 1e-9);
    }

    #[test]
    fn flat_profile_integral_is_closed_form() {
        // ∫ G/f² over [f1, f2] with G flat = G (1/f1 − 1/f2).
        let (g, f1, f2) = (0.04, 20.0, 2000.0);
        let prof = [(f1, g), (f2, g)];
        let want = g * (1.0 / f1 - 1.0 / f2);
        assert!((psd_over_f2_integral(&prof) - want).abs() < 1e-12 * want.max(1.0));
        // The filtered integral is below the whole-band one and tends to it for a narrow loop.
        let narrow = psd_over_f2_filtered(&prof, 3, 0.01);
        assert!((narrow - want).abs() / want < 1e-3, "{narrow} {want}");
        let wide = psd_over_f2_filtered(&prof, 3, 50.0);
        assert!(wide < want);
    }

    #[test]
    fn sloped_segments_integrate_like_the_numeric_grid() {
        let prof = [(10.0, 0.001), (100.0, 0.04), (1000.0, 0.04), (2000.0, 0.01)];
        let exact = psd_over_f2_integral(&prof);
        let numeric = psd_over_f2_filtered(&prof, 3, 1e-6);
        assert!((exact - numeric).abs() / exact < 1e-4, "{exact} {numeric}");
    }

    #[test]
    fn loop_error_response_is_high_pass() {
        for order in [2u8, 3] {
            assert!(loop_error_gain2(order, 10.0, 0.01) < 1e-6);
            assert!((loop_error_gain2(order, 10.0, 1e5) - 1.0).abs() < 1e-3);
        }
    }

    #[test]
    fn thermal_jitter_and_threshold_follow_the_rule_of_thumb() {
        // Bn 15 Hz, T 1 ms, 30 dB-Hz: sqrt(15/1000·(1 + 1/2)) = 0.15 rad = 8.59°.
        let t = thermal_jitter_deg(15.0, 1e-3, 30.0);
        assert!((t - 0.15f64.to_degrees()).abs() < 1e-9, "{t}");
        let thr = tracking_threshold_dbhz(15.0, 1e-3, 0.0, 0.0).unwrap();
        assert!((3.0 * thermal_jitter_deg(15.0, 1e-3, thr) - 45.0).abs() < 1e-6);
        // More jitter from elsewhere raises the threshold.
        let thr2 = tracking_threshold_dbhz(15.0, 1e-3, 5.0, 0.0).unwrap();
        assert!(thr2 > thr);
        // Beyond 15° of other jitter the rule can never be met.
        assert!(tracking_threshold_dbhz(15.0, 1e-3, 15.1, 0.0).is_none());
    }

    #[test]
    fn higher_g_sensitivity_raises_the_threshold() {
        let mk = |gamma: f64| VibrationInput {
            carrier_hz: 1575.42e6,
            g_sensitivity_per_g: gamma,
            random: vec![(20.0, 0.01), (2000.0, 0.01)],
            sine: vec![],
            pll: PllConfig {
                order: 3,
                bandwidth_hz: 15.0,
                coherent_s: 1e-3,
                los_dynamics: 0.0,
            },
            adev_at_loop: None,
            clock: None,
            cn0_dbhz: vec![35.0],
        };
        let quartz = run(&mk(2e-9)).unwrap();
        let low = run(&mk(9e-12)).unwrap();
        assert!(quartz.vibration_deg_whole_band > 100.0 * low.vibration_deg_whole_band);
        let (q, l) = (
            quartz.thresholds.whole_band_dbhz,
            low.thresholds.whole_band_dbhz.unwrap(),
        );
        assert!(q.is_none_or(|q| q > l));
        assert!(quartz.vibration_deg_loop_filtered <= quartz.vibration_deg_whole_band);
        // σ_v for the flat profile: Γ f0 sqrt(G (1/20 − 1/2000)) rad.
        let want = (2e-9 * 1575.42e6 * (0.01f64 * (1.0 / 20.0 - 1.0 / 2000.0)).sqrt()).to_degrees();
        assert!((quartz.vibration_deg_whole_band - want).abs() < 1e-9 * want);
    }

    #[test]
    fn bad_inputs_are_refused() {
        let mut inp: VibrationInput = serde_json::from_str(
            r#"{"carrier_hz":1575.42e6,"g_sensitivity_per_g":1e-9,
                "loop":{"order":3,"bandwidth_hz":15,"coherent_s":0.001}}"#,
        )
        .unwrap();
        assert!(run(&inp).is_ok());
        inp.pll.order = 4;
        assert!(run(&inp).is_err());
        inp.pll.order = 2;
        inp.random = vec![(100.0, 0.01), (50.0, 0.01)];
        assert!(run(&inp).is_err());
    }
}

mod environment {
    use kshana::oscillator::environment::*;
    use kshana::oscillator::{ClockRef, OscSpec};

    fn quiet_clock(kt: f64) -> ClockRef {
        ClockRef::Spec(OscSpec {
            id: "test".into(),
            source: String::new(),
            adev_points: vec![(1.0, 1e-20)],
            aging_per_day: 0.0,
            temp_coeff_per_k: Some(kt),
            g_sensitivity_per_g: None,
            initial_accuracy: None,
            power_w: None,
        })
    }

    fn input(clock: ClockRef) -> EnvHoldoverInput {
        EnvHoldoverInput {
            clock,
            duration_s: 3600.0,
            step_s: Some(1.0),
            threshold_s: 1.0,
            k_sigma: 1.0,
            initial_freq_offset: 0.0,
            temperature: None,
            shocks: vec![],
        }
    }

    fn last(r: &EnvHoldoverReport) -> &HoldoverPoint {
        r.series.last().unwrap()
    }

    #[test]
    fn a_ramp_without_lag_integrates_to_half_k_r_t_squared() {
        let mut inp = input(quiet_clock(1e-9));
        // 0.5 K per minute for an hour.
        inp.temperature = Some(TemperatureProfile {
            points: vec![(0.0, 20.0), (3600.0, 50.0)],
            lag_s: 0.0,
        });
        let r = run(&inp).unwrap();
        let want = 0.5 * 1e-9 * (30.0 / 3600.0) * 3600.0 * 3600.0;
        assert!(
            (last(&r).temperature_s - want).abs() < 1e-9 * want,
            "{}",
            last(&r).temperature_s
        );
    }

    #[test]
    fn a_lag_delays_and_shrinks_the_step_response() {
        let step = TemperatureProfile {
            points: vec![(0.0, 20.0), (1.0, 30.0)],
            lag_s: 0.0,
        };
        let mut a = input(quiet_clock(1e-9));
        a.temperature = Some(step.clone());
        let mut b = a.clone();
        b.temperature = Some(TemperatureProfile {
            lag_s: 600.0,
            ..step
        });
        let (ra, rb) = (run(&a).unwrap(), run(&b).unwrap());
        assert!(last(&rb).temperature_s < last(&ra).temperature_s);
        // A first-order lag of a step loses exactly k·ΔT·τ (1 − e^(−t/τ)) of phase to the instant
        // response; the stepped lag on a 1 s grid gets within 0.5 %.
        let lost = 1e-9 * 10.0 * 600.0 * (1.0 - (-3599.0f64 / 600.0).exp());
        let diff = last(&ra).temperature_s - last(&rb).temperature_s;
        assert!((diff - lost).abs() / lost < 5e-3, "{diff} {lost}");
    }

    #[test]
    fn ageing_and_offset_are_closed_form() {
        let mut inp = input(quiet_clock(0.0));
        if let ClockRef::Spec(s) = &mut inp.clock {
            s.aging_per_day = 8.64e-10; // 1e-14 per second
        }
        inp.initial_freq_offset = 1e-11;
        let r = run(&inp).unwrap();
        let t: f64 = 3600.0;
        let want = 1e-11 * t + 0.5 * 1e-14 * t * t;
        assert!((last(&r).deterministic_s - want).abs() < 1e-12 * want.max(1e-30));
    }

    #[test]
    fn shocks_step_frequency_and_phase() {
        let mut inp = input(quiet_clock(0.0));
        inp.shocks = vec![Shock {
            t_s: 600.0,
            freq_step: 5e-10,
            phase_step_s: 1e-9,
            outage_s: 180.0,
            outage_freq_offset: 1e-9,
        }];
        let r = run(&inp).unwrap();
        let want = 5e-10 * 3000.0 + 1e-9 + 1e-9 * 180.0;
        // The steps fall between grid points: one trapezoid step of error each.
        assert!(
            (last(&r).shock_s - want).abs() < 2e-9,
            "{} {want}",
            last(&r).shock_s
        );
        assert!(r.holdover_s.is_none());
        inp.threshold_s = 1e-6;
        let r = run(&inp).unwrap();
        let h = r.holdover_s.unwrap();
        assert!(h > 600.0 && h < 3600.0);
    }

    #[test]
    fn presets_run_and_report_a_holdover() {
        let mut inp = input(ClockRef::Preset("csac".into()));
        inp.duration_s = 7.0 * 86_400.0;
        inp.step_s = None;
        inp.threshold_s = 1e-6;
        inp.temperature = Some(TemperatureProfile {
            points: vec![(0.0, 20.0), (4800.0, 60.0)],
            lag_s: 300.0,
        });
        let r = run(&inp).unwrap();
        assert_eq!(r.label, "MODELLED");
        let h = r.holdover_s.unwrap();
        assert!(h > 0.0 && h < 7.0 * 86_400.0);
        assert!(r.series.len() <= SERIES_POINTS + 2);
        assert!(r.holdover_deterministic_s.is_none_or(|d| d >= h));
    }

    #[test]
    fn bad_inputs_are_refused() {
        let mut inp = input(quiet_clock(0.0));
        inp.step_s = Some(1e-6);
        assert!(run(&inp).is_err());
        let mut inp = input(quiet_clock(0.0));
        inp.temperature = Some(TemperatureProfile {
            points: vec![(10.0, 20.0), (5.0, 21.0)],
            lag_s: 0.0,
        });
        assert!(run(&inp).is_err());
    }
}

mod select {
    use kshana::oscillator::select::*;
    use kshana::oscillator::vibration::PllConfig;
    use kshana::oscillator::{ClockRef, OscSpec};
    use kshana::telecom_timing::PRESETS;

    fn cold() -> ColdStartReq {
        ColdStartReq {
            carrier_hz: 1575.42e6,
            doppler_hz: 5000.0,
            coherent_s: 1e-3,
            days_since_calibration: 30.0,
            temperature_delta_k: 20.0,
            max_search_factor: Some(1.5),
        }
    }

    #[test]
    fn search_factor_counts_bins() {
        let c = cold();
        assert_eq!(search_factor(&c, 0.0), 1.0);
        // 1 ppm at L1 adds 1575 Hz each side: bins ceil(2·6575.42/666.67) = 20 over 15.
        assert!((search_factor(&c, 1e-6) - 20.0 / 15.0).abs() < 1e-12);
    }

    #[test]
    fn missing_figures_are_unknown_not_assumed() {
        let inp = SelectInput {
            candidates: vec![],
            requirements: Requirements {
                cold_start: Some(cold()),
                vibration: Some(VibrationReq {
                    carrier_hz: 1575.42e6,
                    random: vec![(20.0, 0.01), (2000.0, 0.01)],
                    sine: vec![],
                    pll: PllConfig {
                        order: 3,
                        bandwidth_hz: 15.0,
                        coherent_s: 1e-3,
                        los_dynamics: 0.0,
                    },
                    min_cn0_dbhz: 30.0,
                }),
                power_max_w: Some(1.0),
                adev_max: vec![(1.0, 1e-10)],
                holdover: Some(HoldoverReq {
                    duration_s: 86_400.0,
                    max_time_error_s: 1.5e-6,
                    k_sigma: None,
                    temperature: None,
                }),
            },
        };
        let r = run(&inp).unwrap();
        assert_eq!(r.candidates.len(), PRESETS.len());
        for c in &r.candidates {
            // No preset states an acceleration sensitivity.
            let v = c.checks.iter().find(|k| k.check == "vibration").unwrap();
            assert_eq!(v.status, "unknown");
            let cs = c
                .checks
                .iter()
                .find(|k| k.check == "cold_start_search")
                .unwrap();
            let p = c.checks.iter().find(|k| k.check == "power").unwrap();
            if c.id == "csac" {
                assert_ne!(cs.status, "unknown");
                assert_eq!(p.status, "pass");
                // 3e-10 at 1 s is above a 1e-10 limit.
                let a = c.checks.iter().find(|k| k.check == "adev").unwrap();
                assert_eq!(a.status, "fail");
            } else {
                assert_eq!(cs.status, "unknown");
                assert_eq!(p.status, "unknown");
            }
        }
        // A caesium standard holds 1.5 µs for a day under the preset model; a CSAC does too or not,
        // but the check is decided either way.
        let cs = &r
            .candidates
            .iter()
            .find(|c| c.id == "caesium")
            .unwrap()
            .checks[0];
        assert_eq!(cs.status, "pass");
    }

    #[test]
    fn a_stated_g_sensitivity_is_checked() {
        let mut spec = OscSpec::from_preset("ocxo").unwrap();
        spec.g_sensitivity_per_g = Some(2e-9);
        let mut low = spec.clone();
        low.id = "low".into();
        low.g_sensitivity_per_g = Some(9e-12);
        let inp = SelectInput {
            candidates: vec![ClockRef::Spec(spec), ClockRef::Spec(low)],
            requirements: Requirements {
                vibration: Some(VibrationReq {
                    carrier_hz: 1575.42e6,
                    random: vec![(20.0, 0.5), (2000.0, 0.5)],
                    sine: vec![],
                    pll: PllConfig {
                        order: 3,
                        bandwidth_hz: 15.0,
                        coherent_s: 1e-3,
                        los_dynamics: 0.0,
                    },
                    min_cn0_dbhz: 30.0,
                }),
                ..Requirements::default()
            },
        };
        let r = run(&inp).unwrap();
        assert_eq!(r.candidates[0].checks[0].status, "fail");
        assert_eq!(r.candidates[1].checks[0].status, "pass");
    }
}

mod raim_aid {
    use kshana::oscillator::raim_aid::*;
    use kshana::oscillator::ClockRef;
    use kshana::raim::snapshot_raim;

    fn sky() -> Vec<(f64, f64)> {
        vec![
            (0.0, 80.0),
            (40.0, 30.0),
            (120.0, 45.0),
            (200.0, 20.0),
            (280.0, 35.0),
            (330.0, 60.0),
        ]
    }

    #[test]
    fn unaided_levels_equal_snapshot_raim() {
        // Put the user on the equator at longitude 0 so ENU is (y, z, x) of ECEF, and place each
        // satellite along its line of sight.
        let user = [6_378_137.0, 0.0, 0.0];
        let mut sats = Vec::new();
        for &(az, el) in &sky() {
            let (a, e): (f64, f64) = (az.to_radians(), el.to_radians());
            let (east, north, up) = (e.cos() * a.sin(), e.cos() * a.cos(), e.sin());
            let r = 2.0e7;
            sats.push([user[0] + r * up, user[1] + r * east, user[2] + r * north]);
        }
        let zero = vec![0.0; sats.len()];
        let want = snapshot_raim(user, &sats, &zero, 3.0, 1e-5, 1e-3).unwrap();
        let rows: Vec<_> = sky().iter().map(|&(a, e)| (enu_row(a, e), 3.0)).collect();
        let got = weighted_levels(&rows, 1e-5, 1e-3, true).unwrap();
        assert_eq!(got.dof, want.dof);
        assert!(
            (got.hpl_m - want.hpl_m).abs() < 1e-3 * want.hpl_m,
            "{got:?} {want:?}"
        );
        assert!(
            (got.vpl_m - want.vpl_m).abs() < 1e-3 * want.vpl_m,
            "{got:?} {want:?}"
        );
    }

    #[test]
    fn a_fresh_clock_helps_and_the_help_fades() {
        let inp = RaimAidInput {
            clock: ClockRef::Preset("rubidium".into()),
            satellites: sky(),
            sigma_m: 3.0,
            p_fa: 1e-5,
            p_md: 1e-3,
            calibration_sigma_s: 1e-9,
            coast_s: vec![0.0, 600.0, 86_400.0 * 30.0],
        };
        let r = run(&inp).unwrap();
        let un = r.unaided.clone().unwrap();
        let first = r.coast[0].aided.clone().unwrap();
        let last = r.coast[2].aided.clone().unwrap();
        assert_eq!(first.dof, un.dof + 1);
        assert!(first.vpl_m < un.vpl_m);
        assert!(last.vpl_m >= first.vpl_m);
        // Assumed fault-free, the clock helps most when fresh and the help fades monotonically.
        let ff: Vec<f64> = r
            .coast
            .iter()
            .map(|c| c.aided_clock_fault_free.clone().unwrap().vpl_m)
            .collect();
        assert!(ff[0] < un.vpl_m && ff[0] <= ff[1] && ff[1] <= ff[2]);
        // With four satellites RAIM needs the clock.
        let four = RaimAidInput {
            satellites: sky()[..4].to_vec(),
            ..inp
        };
        let r = run(&four).unwrap();
        assert!(r.unaided.is_none());
        assert!(r.coast[0].aided.is_some());
    }
}

mod datasheet {
    use kshana::oscillator::datasheet::*;
    use kshana::oscillator::ClockRef;
    use kshana::telecom_timing::NoiseFit;
    use kshana::telecom_timing::PRESETS;
    use rand::SeedableRng;
    use rand_distr::{Distribution, Normal};

    #[test]
    fn every_preset_is_enveloped_and_has_a_tdev() {
        for p in PRESETS {
            let r = run(&DatasheetInput {
                clock: ClockRef::Preset(p.id.into()),
                tdev_points: vec![],
                taus: vec![],
            })
            .unwrap();
            for c in &r.adev_check {
                assert!(c.ratio >= 1.0 - 1e-9, "{} {c:?}", p.id);
            }
            for c in &r.curve {
                assert!(c.mdev <= c.adev && c.tdev_s > 0.0);
            }
        }
    }

    #[test]
    fn white_fm_tdev_matches_the_estimator_on_a_synthetic_series() {
        // White FM of Allan variance w/τ: frequency samples of variance w at τ0 = 1 s, phase their sum.
        let w: f64 = 1e-22;
        let mut rng = rand_chacha::ChaCha8Rng::seed_from_u64(7);
        let nd = Normal::new(0.0, w.sqrt()).unwrap();
        let mut x = vec![0.0];
        for _ in 0..200_000 {
            let last = *x.last().unwrap();
            x.push(last + nd.sample(&mut rng));
        }
        let n = NoiseFit {
            white: w,
            flicker: 0.0,
            random_walk: 0.0,
            envelope_scale: 1.0,
        };
        for m in [4usize, 16, 64] {
            let est = kshana::allan::time_deviation(&x, 1.0, m);
            let model = model_tdev(&n, m as f64);
            assert!((est / model - 1.0).abs() < 0.05, "m {m}: {est} vs {model}");
        }
    }

    #[test]
    fn stated_tdev_points_are_compared() {
        let r = run(&DatasheetInput {
            clock: ClockRef::Preset("ocxo".into()),
            tdev_points: vec![(10.0, 1e-11)],
            taus: vec![10.0],
        })
        .unwrap();
        assert_eq!(r.tdev_check.len(), 1);
        assert!((r.tdev_check[0].model - r.curve[0].tdev_s).abs() < 1e-30);
    }
}

mod refs {
    use kshana::oscillator::refs::*;

    #[test]
    fn keys_are_unique_and_values_positive() {
        let mut keys: Vec<_> = GSENS_REFS.iter().map(|r| r.key).collect();
        keys.sort_unstable();
        keys.dedup();
        assert_eq!(keys.len(), GSENS_REFS.len());
        assert!(GSENS_REFS.iter().all(|r| r.g_sensitivity_per_g > 0.0));
    }
}

mod examples {
    /// Every example input in examples/oscillator runs.
    #[test]
    fn every_example_runs() {
        let dir = std::path::Path::new(env!("CARGO_MANIFEST_DIR")).join("examples/oscillator");
        let mut n = 0;
        for e in std::fs::read_dir(&dir).unwrap() {
            let p = e.unwrap().path();
            let name = p.file_stem().unwrap().to_string_lossy().to_string();
            let part = ["vibration", "holdover", "select", "raim-aid", "datasheet"]
                .into_iter()
                .find(|k| name.starts_with(k))
                .unwrap_or_else(|| panic!("{name}: no part"));
            let text = std::fs::read_to_string(&p).unwrap();
            let out =
                kshana::oscillator::run_json(part, &text).unwrap_or_else(|e| panic!("{name}: {e}"));
            let v: serde_json::Value = serde_json::from_str(&out).unwrap();
            assert_eq!(v["label"], "MODELLED", "{name}");
            n += 1;
        }
        assert_eq!(n, 6);
    }
}
