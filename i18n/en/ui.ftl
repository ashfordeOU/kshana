# Interface text (English source): site chrome, notices, language switcher, Studio shell.
# Written by hand. Ids: site-*, notice-*, studio-*. Document text of the pages is in pages/*.ftl (generated).
#
# Translators: copy to i18n/<lang>/ui.ftl, translate the values, keep every id and every { $variable }.
# Terms ({ -brand }, { -tier-modelled }) come from glossary.ftl. Add a plural selector for every count message
# in the categories your language needs (Intl.PluralRules(<lang>).resolvedOptions().pluralCategories).
# Markup in a value is limited to the numbered tags shown in the English text (<a1>...</a1>, <b>...</b>).
#
# The Studio's remaining interface strings (app.js, advanced.js) move to studio-* ids page by page; this file
# lists the static shell first.

## Site chrome
site-skip-link = Skip to content
site-nav-primary = Primary
site-nav-missions = Missions
site-nav-capabilities = Capabilities
site-nav-evidence = Evidence
site-nav-research = Research
site-nav-developers = Developers
site-nav-docs = Docs
site-nav-editions = Editions
site-nav-search = Search
site-nav-launch = Launch
site-nav-studio = { -brand } Studio
site-nav-home = { -brand } home
site-nav-theme = Switch between light and dark
site-version = v{ $version }

site-footer-tagline = Open-source PNT (positioning, navigation and timing) resilience simulator. It drives no radio hardware and transmits nothing: its signal-level output is baseband IQ sample files, and its software GNSS receiver is an analysis tool. Not a flight product.
site-footer-product = Product
site-footer-company = Company
site-footer-benchmark = Benchmark
site-footer-install = Install
site-footer-mcp = MCP server
site-footer-github = GitHub
site-footer-kshana-pro = { -brand } Pro
site-footer-licence = { -brand } v{ $version } · by Ashforde® OÜ · AGPL-3.0, with a commercial licence option
site-footer-provenance = Every chart is drawn from a recorded run of engine v{ $version } and names its scenario, seed and route to reproduce it.

## Language switcher
site-lang-label = Language
site-lang-switch-aria = Choose the language of this page
site-lang-auto = Browser language
site-lang-remembered = Your choice is remembered on this device.

## Notices (shown at the top of a page's content)
notice-machine-translation = { -mt-notice }
notice-fallback =
    { $n ->
        [one] { $n } part of this page has changed since it was translated and is shown in English.
       *[other] { $n } parts of this page have changed since they were translated and are shown in English.
    }
notice-not-started = This page has not been translated yet. It is shown in English.
notice-detected = Showing { $language }. <a1>Switch to English</a1>
notice-dismiss = Dismiss
notice-recorded-in-english = Recorded in English
notice-advisory = { -advisory }

## Studio shell
studio-title = { -brand } Studio
studio-home = { -brand } home
studio-search-label = Find a scenario, an area, a setting or a command
studio-search-placeholder = Search by name, question or setting, for example elevation mask
studio-search-scenarios = Search scenarios, areas or settings
studio-search-commands = Search scenarios and commands
studio-search-all = Find a scenario, area, setting, view or command
studio-search = Search
studio-theme = Switch between light and dark
studio-starting-questions = Questions to start with
studio-where-you-are = Where you are
studio-engine-status = Where the engine is running
studio-views = Views: Geometry, Receiver trust, Interference map, Training debrief, Tools
studio-more-views = More views
studio-advanced-full = The full dashboard: every panel, field and tab
studio-advanced-switch = Switch to the Advanced view
studio-view-geometry = Geometry: skyplot, skyline and DOP
studio-view-training = Training debrief: open an instructor log
studio-view-interference = Interference map: open map files
studio-view-receiver-trust = Receiver trust: open a vessel run
studio-view-tools = Tools: evidence, bench, compliance, OSNMA
studio-result = Result
studio-result-meaning = What the result means
studio-key-figures = Key figures
studio-result-views = Views of this result
studio-figures-of-merit = Figures of merit
studio-find-result-field = Find a result field
studio-capability-view = Capability view
studio-time-series = Time series
studio-chart-source = Chart source
studio-signal-band = Signal and band
studio-signal-field = Signal field
studio-clock-holdover = Clock holdover
studio-telecom-masks = Telecom timing masks
studio-clock-stability = Clock stability
studio-orbit-3d = 3-D orbit
studio-ground-track = Ground track
studio-parameter-sweep = Parameter sweep
studio-compare-runs = Compare runs
studio-animation = Animation
studio-engine-report = Engine report
studio-exports = Exports and report
studio-full-result = Full result document
studio-settings = Settings and details
studio-find-setting = Find a setting, for example mask
studio-find-scenario-setting = Find a setting of this scenario
studio-engine-summary = The engine's own summary
studio-restore-scenario = Restore the bundled scenario
studio-copy-scenario = Copy the scenario text
studio-scenario-source = Scenario source (TOML)
studio-install-engine = Install the engine
studio-run-history = Run history
studio-scenarios-count =
    { $n ->
        [one] Scenario it runs ({ $n })
       *[other] Scenarios it runs ({ $n })
    }
studio-ledger-rows =
    { $n ->
        [one] { $n } ledger row
       *[other] { $n } ledger rows
    }
studio-recorded-in-english = Recorded in English
studio-lang-engine-fallback = The engine text for this language could not be loaded; English is shown.
