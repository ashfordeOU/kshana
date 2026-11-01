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

## Studio pages: static text (generated list, append only)
# geometry
studio-geometry-kshana-home = Kshana home
# geometry
studio-geometry-back-to-the-studio = Back to the Studio
# geometry
studio-geometry-step-the-time = Step the time
# geometry
studio-geometry-draw-the-skyline = Draw the skyline
# geometry
studio-geometry-skip-to-the-view = Skip to the view
# geometry
studio-geometry-which-satellites-can-you-see = Which satellites can you see, and how good is their geometry?
# geometry
studio-geometry-what-this-shows = What this shows
# geometry
studio-geometry-starting-the-engine = Starting the engine…
# geometry
studio-geometry-every-setting-is-in-the = Every setting is in the page address, so a copied link opens the same sky.
# geometry
studio-geometry-offset-from-the-constellations-reference = Offset from the constellations' reference epoch
# geometry
studio-geometry-10-min = −10 min
# geometry
studio-geometry-10-min-2 = +10 min
# geometry
studio-geometry-your-own-orbital-elements-tle = Your own orbital elements (TLE)
# geometry
studio-geometry-use-these-elements = Use these elements
# geometry
studio-geometry-back-to-the-presets = Back to the presets
# geometry
studio-geometry-clear-the-skyline = Clear the skyline
# geometry
studio-geometry-drag-on-the-skyplot-to = Drag on the skyplot to draw the skyline (1° azimuth, 0.5° elevation steps). With the skyplot focused: Left and Right move round the horizon (Shift for 10°), Up and Down raise or lower the skyline there (Shift for 5°), Delete clears it.
# geometry
studio-geometry-copy-a-link-to-this = Copy a link to this sky
# geometry
studio-geometry-download-the-skyplot-svg = Download the skyplot (SVG)
# geometry
studio-geometry-zenith-in-the-centre-the = Zenith in the centre, the horizon on the rim, north up. Filled marks are satellites in the solution; hollow marks are hidden by the mask or the skyline, or not used.
# geometry
studio-geometry-dilution-of-precision = Dilution of precision
# geometry
studio-geometry-how-much-the-geometry-multiplies = How much the geometry multiplies the range error. Lower is better; about 1 is excellent, above 6 is poor.
# geometry
studio-geometry-horizontal-position-error = Horizontal position error
# geometry
studio-geometry-satellites-as-a-table = Satellites, as a table
# geometry
studio-geometry-the-same-satellites-as-the = The same satellites as the skyplot.
# geometry
studio-geometry-azimuth = Azimuth, °
# geometry
studio-geometry-elevation = Elevation, °
# geometry
studio-geometry-in-the-solution = In the solution
# geometry
studio-geometry-the-engine-runs-here-as = The engine runs here as WebAssembly. Nothing is fetched from another site and nothing you set is sent anywhere.
# holdover
studio-holdover-holdover-test-scenarios = Holdover-test scenarios
# holdover
studio-holdover-holdover-test = Holdover test
# holdover
studio-holdover-how-far-does-the-time = How far does the time error go when GNSS is gone?
# holdover
studio-holdover-opening-the-scenarios = Opening the scenarios…
# holdover
studio-holdover-verdict-step-by-step = Verdict, step by step
# holdover
studio-holdover-time-error-over-the-record = Time error over the record
# holdover
studio-holdover-the-three-phases-are-shaded = The three phases are shaded; the dashed vertical lines are the two times the operator stated. Dashed horizontal lines are the masks' limits on the maximum absolute time error, each drawn over the step its mask names, and the recovery band; a triangle marks when a budget or the ePRTC-A holdover envelope is first exceeded.
# holdover
studio-holdover-of-the-baseline-and-the = Of the baseline and the holdover; a cross is a mask limit at the time its check was worst.
# holdover
studio-holdover-the-same-two-steps-against = The same two steps against the TDEV limits.
# holdover
studio-holdover-the-numbers = The numbers
# holdover
studio-holdover-everything-below-is-the-engine = Everything below is the engine's, in the units it states.
# holdover
studio-holdover-mask-checks = Mask checks
# holdover
studio-holdover-each-mask-is-measured-on = Each mask is measured on the step its condition names. A mask that needs a longer record than the step gave is INCOMPLETE, never extrapolated; every entry a Recommendation leaves for further study is absent.
# holdover
studio-holdover-what-this-does-not-cover = What this does not cover
# interference
studio-interference-cell-size-in-degrees-empty = Cell size in degrees (empty for 0.5)
# interference
studio-interference-https = https://…
# interference
studio-interference-about-this-page = About this page
# interference
studio-interference-interference-map = Interference map
# interference
studio-interference-where-did-position-reports-look = Where did position reports look degraded?
# interference
studio-interference-open-map-files = Open map files
# interference
studio-interference-or-drop-them-here = or drop them here
# interference
studio-interference-open-the-synthetic-demo = Open the synthetic demo
# interference
studio-interference-close-all-maps = Close all maps
# interference
studio-interference-nothing-open-yet = Nothing open yet.
# interference
studio-interference-build-a-map-here = Build a map here
# interference
studio-interference-build-from-the-synthetic-sample = Build from the synthetic sample
# interference
studio-interference-route-exposure-here = Route exposure here
# interference
studio-interference-use-the-synthetic-route = Use the synthetic route
# interference
studio-interference-reading-these-maps = Reading these maps
# interference
studio-interference-maps-inherit-the-coverage-of = Maps inherit the coverage of their source: volunteer ADS-B receivers leave open sea sparse, and open AIS data omits some vessel classes. Read the coverage notes in each file.
# interference
studio-interference-no-coastline-or-basemap-is = No coastline or basemap is drawn and nothing is fetched from any server; the grid is latitude and longitude only.
# interference
studio-interference-no-identifier-of-any-aircraft = No identifier of any aircraft or vessel is in these files; cells with too few distinct aircraft or vessels are not published at all, and an AIS count of one or two is withheld.
# lunar-infra
studio-lunar-infra-lunar-infrastructure-scenarios = Lunar infrastructure scenarios
# lunar-infra
studio-lunar-infra-lunar-infrastructure = Lunar infrastructure
# lunar-infra
studio-lunar-infra-what-can-the-moon-s = What can the Moon's orbit and surface do as navigation and geodetic infrastructure, and where does it fall short?
# lunar-infra
studio-lunar-infra-five-studies-of-what-lunar = Five studies of what lunar orbiters and a lunar surface station could do together as navigation and geodetic infrastructure: orbit determination from Earth-GNSS signals against ground tracking, carrier-phase fixing between a surface station and an orbiter, co-estimating the lunar frame, tying GNSS, VLBI and laser ranging on one spacecraft, and how sensitive laser ranging and tracking are to the Moon's tides and libration. The inputs are illustrative and the model is restricted; where a study missed the bar it was pre-registered against, this page says so. Every number is copied from a result the engine recorded; the page scales it and draws it, and computes nothing else.
# lunar-infra
studio-lunar-infra-what-the-result-holds = What the result holds
# lunar-infra
studio-lunar-infra-findings-disclosures-and-what-was = Findings, disclosures and what was not verified
# lunar
studio-lunar-what-these-figures-are = What these figures are
# lunar
studio-lunar-map-key = Map key
# lunar
studio-lunar-lunar-station = Lunar station
# lunar
studio-lunar-what-accuracy-could-a-reference = What accuracy could a reference station near the lunar south pole give, and where?
# lunar
studio-lunar-the-constellation-its-signal-in = The constellation, its signal-in-space error, the station's survey error, the correction latency and the link quantization are inputs stated in the scenario file, each with its source or marked illustrative. No figure here has been checked against a real station or flight data.
# lunar
studio-lunar-the-source-and-every-input = The source and every input you change are in the page address, so a copied link opens the same study.
# lunar
studio-lunar-a-result-file-is-the = A result file is the JSON the engine writes for this kind (the command line's JSON output, or a run saved from here). It is read in this page; nothing is sent.
# lunar
studio-lunar-each-field-shows-the-scenario = Each field shows the scenario file's value until you change it. A day of epochs over the whole grid takes a while: fewer trials or a longer time step run faster.
# lunar
studio-lunar-run-it-here = Run it here
# lunar
studio-lunar-back-to-the-file-s = Back to the file's values
# lunar
studio-lunar-copy-a-link = Copy a link
# lunar
studio-lunar-save-this-result-json = Save this result (JSON)
# lunar
studio-lunar-corrected-error-over-the-south = Corrected error over the south-polar region
# lunar
studio-lunar-south-polar-stereographic-the-pole = South-polar stereographic: the pole in the centre, the grid's edge on the rim, 0° longitude up, 90° east to the right. Each cell is one grid point; the heavy line is where the corrected error crosses the threshold, and the dashed line is the coverage radius per azimuth.
# lunar
studio-lunar-region-figures = Region figures
# lunar
studio-lunar-over-the-whole-grid-means = Over the whole grid: means weighted by area, and the worst point.
# lunar
studio-lunar-coverage-radius-per-azimuth = Coverage radius per azimuth
# lunar
studio-lunar-along-each-bearing-from-the = Along each bearing from the station, the distance at which coverage first drops below 95 %.
# lunar
studio-lunar-as-a-table = As a table
# lunar
studio-lunar-radius-km = Radius, km
# lunar
studio-lunar-at-the-grid-edge = At the grid edge
# lunar
studio-lunar-points-along-it = Points along it
# lunar
studio-lunar-an-epoch-is-unavailable-at = An epoch is unavailable at a point when the user sees fewer than four satellites, or the station does not see every satellite the user uses; no error is computed for it.
# lunar
studio-lunar-grid-points-as-a-table = Grid points, as a table
# lunar
studio-lunar-the-same-points-as-the = The same points as the map, nearest the station first.
# lunar
studio-lunar-latitude = Latitude, °
# lunar
studio-lunar-longitude = Longitude, °
# lunar
studio-lunar-from-the-station-km = From the station, km
# lunar
studio-lunar-corrected-error = Corrected error
# lunar
studio-lunar-uncorrected-error = Uncorrected error
# lunar
studio-lunar-hpl-median = HPL median
# lunar
studio-lunar-the-engine-s-statement-inputs = The engine's statement, inputs and link budget
# lunar
studio-lunar-inputs-as-the-engine-read = Inputs, as the engine read them
# lunar
studio-lunar-error-model = Error model
# lunar
studio-lunar-correction-link-budget-at-the = Correction-link budget at the station and at the worst point
# observatory
studio-observatory-previous-day = Previous day
# observatory
studio-observatory-day-opened = Day opened
# observatory
studio-observatory-next-day = Next day
# observatory
studio-observatory-interference-observatory = Interference observatory
# observatory
studio-observatory-what-did-one-day-s = What did one day's position reports look like?
# observatory
studio-observatory-the-observatory-writes-a-few = The observatory writes a few files for each UTC day and region: the grid cells with one of three states, an incident list and a manifest. Open the files you have produced here and read them. The page computes nothing and shows only what the files say. It ships no observatory data, fetches nothing, and uploads nothing.
# observatory
studio-observatory-open-a-day = Open a day
# observatory
studio-observatory-larr = ←
# observatory
studio-observatory-rarr = →
# observatory
studio-observatory-the-three-states = The three states
# observatory
studio-observatory-the-picture-the-observatory-wrote = The picture the observatory wrote
# observatory
studio-observatory-the-png-you-opened-as = The PNG you opened, as it is. Cells that are not drawn were not observed.
# observatory
studio-observatory-cells-drawn-from-the-file = Cells, drawn from the file
# observatory
studio-observatory-plate-carr-eacute-e-no = Plate carrée, no base map. Hover a cell, or use the table, for its state and counts. A place with no cell was not observed.
# observatory
studio-observatory-hover-or-focus-a-cell = Hover or focus a cell for its state.
# observatory
studio-observatory-every-cell-in-the-file = Every cell in the file
# observatory
studio-observatory-a-count-the-file-withholds = A count the file withholds (fewer than 5 aircraft) reads “withheld”, never 0.
# observatory
studio-observatory-files-and-their-hashes = Files and their hashes
# observatory
studio-observatory-dataset-licence-and-notice = Dataset, licence and notice
# observatory
studio-observatory-what-this-page-does-and = What this page does and does not show
# observatory
studio-observatory-products-are-released-at-least = Products are released at least 24 hours after the end of the UTC day, on cells of 0.5 degrees or coarser. This is never a live view and it never says “now”.
# observatory
studio-observatory-it-shows-no-cause-no = It shows no cause, no country, no force and no source of interference, no alert, no comparison between places or days, and no AIS. ADS-B and AIS are never combined.
# observatory
studio-observatory-the-page-ships-none-of = The page ships none of the observatory's products. Publishing them is the owner's decision.
# optical
studio-optical-optical-atmosphere-scenarios = Optical-atmosphere scenarios
# optical
studio-optical-optical-pnt = Optical PNT
# optical
studio-optical-can-an-optical-link-get = Can an optical link get through the weather?
# optical
studio-optical-the-link = The link
# optical
studio-optical-sites-as-the-engine-states = Sites, as the engine states them
# optical
studio-optical-inputs-are-marked-everything-else = Inputs are marked; everything else is the engine's output for them.
# optical
studio-optical-it-draws-only-what-the = It draws only what the engine recorded for each scenario, including its seeded time series. The page computes nothing: it scales the engine's numbers to the chart.
# optical
studio-optical-the-sites-their-cloud-climates = The sites, their cloud climates, the clock classes and the techniques are inputs chosen to illustrate, and are labelled so. No measured availability record has been compared.
# replay
studio-replay-replay-controls = Replay controls
# replay
studio-replay-previous-moment-page-up = Previous moment (Page Up)
# replay
studio-replay-step-back = Step back
# replay
studio-replay-step-back-left-arrow = Step back (Left arrow)
# replay
studio-replay-play-or-pause-space = Play or pause (Space)
# replay
studio-replay-step-forward = Step forward
# replay
studio-replay-step-forward-right-arrow = Step forward (Right arrow)
# replay
studio-replay-next-moment-page-down = Next moment (Page Down)
# replay
studio-replay-replay-speed-mission-seconds-per = Replay speed, mission seconds per second
# replay
studio-replay-mission-clock-seconds-from-the = Mission clock, seconds from the start of each run
# replay
studio-replay-bridge-replay = Bridge replay
# replay
studio-replay-two-runs-one-clock-when = Two runs, one clock: when did the bridge know?
# replay
studio-replay-put-two-synthetic-runs-side = Put two synthetic runs side by side and play them on one mission clock. Each panel shows where the vessel really was against where the receiver said it was, the engine's trust score and band over time, the satellites the log itself lists (the sky blanks where the log hears none), and a verdict when the run ends. Everything drawn comes from a log or from the engine's result for it; nothing is read from the network.
# replay
studio-replay-save-animated-svg = Save animated SVG
# replay
studio-replay-save-frames-zip = Save frames (ZIP)
# replay
studio-replay-opening-the-two-demo-runs = Opening the two demo runs…
# replay
studio-replay-the-skyplot-is-the-log = The skyplot is the log's own GSV: a filled marker is a satellite with a signal strength, a hollow one is listed with none, and a shaded sector is an azimuth range where the log lists satellites and hears none of them. A blocked sky and a jammed signal look the same here. It is not a skyline, and the constellation is nominal, not an ephemeris for the log's date.
# replay
studio-replay-position-error-is-the-logged = "Position error" is the logged distance between the true and the reported position; the ring around the vessel is that distance drawn to scale. The time from an event's onset to the first score below nominal is a subtraction of two logged times, not a detection-performance figure.
# replay
studio-replay-the-vessel-glyph-points-along = The vessel glyph points along the gyro heading (HDT), which no event touches; the dashed outline is where the receiver puts the vessel, along the course it reports. A gap between the two is a debrief cue.
# replay
studio-replay-the-coast-is-natural-earth = The coast is Natural Earth public-domain land at 1:10 million, bundled with this page (nothing is fetched). The demos' positions are invented, so the coast shows where those invented coordinates fall. Illustration only, never for navigation.
# ssv
studio-ssv-space-user-gnss-scenarios = Space-user GNSS scenarios
# ssv
studio-ssv-space-user-gnss = Space-user GNSS
# ssv
studio-ssv-which-navigation-signals-can-a = Which navigation signals can a spacecraft far above the GNSS satellites still use?
# ssv
studio-ssv-the-satellites-of-a-navigation = The satellites of a navigation system point at the Earth, so a spacecraft above them hears only what spills past the limb or leaks through sidelobes. This page shows what the engine finds for five cases: availability on a shell at geostationary height, a highly elliptical orbit, a lunar transfer with a weak-signal receiver, an onboard filter and a two-spacecraft formation. Every number is copied from a result the engine recorded; the page scales it and draws it, and computes nothing else.
# ssv
studio-ssv-against-the-icg-booklet = Against the ICG booklet
# tools
studio-tools-leave-empty-to-check-integrity = leave empty to check integrity only
# tools
studio-tools-synthetic-osnma-example = Synthetic OSNMA example
# tools
studio-tools-trust-and-evidence-tools = Trust and evidence tools
# tools
studio-tools-trust-evidence-and-test-tools = Trust, evidence and test tools
# tools
studio-tools-the-0-35-features-that = The 0.35 features that run in your browser, and where to find the ones that cannot. Files you open here are read in this page and never uploaded; the engine runs on your computer as WebAssembly.
# tools
studio-tools-maritime-trust = Maritime trust
# tools
studio-tools-training-debrief = Training debrief
# tools
studio-tools-the-engine-starts-when-you = The engine starts when you use a tool.
# tools
studio-tools-every-0-35-feature-and = Every 0.35 feature, and where it is
# tools
studio-tools-in-this-browser-where-it = In this browser where it can run. The rest are command-line or server features, and the reason is stated.
# tools
studio-tools-in-the-studio = In the Studio
# tools
studio-tools-verify-an-evidence-pack = Verify an evidence pack
# tools
studio-tools-open-the-synthetic-example-pack = Open the synthetic example pack
# tools
studio-tools-open-it-with-one-byte = Open it with one byte changed
# tools
studio-tools-no-pack-files-chosen = No pack files chosen.
# tools
studio-tools-verify-the-pack = Verify the pack
# tools
studio-tools-attach-a-timestamp-token = Attach a timestamp token
# tools
studio-tools-attach-to-the-chosen-pack = Attach to the chosen pack
# tools
studio-tools-export-a-scenario-for-a = Export a scenario for a laboratory simulator
# tools
studio-tools-which-public-framework-rows-do = Which public-framework rows do your runs support evidence for?
# tools
studio-tools-use-the-synthetic-example-runs = Use the synthetic example runs
# tools
studio-tools-show-the-mapping-tables = Show the mapping tables
# tools
studio-tools-show-the-sources-they-cite = Show the sources they cite
# tools
studio-tools-no-result-files-chosen = No result files chosen.
# tools
studio-tools-build-the-report = Build the report
# tools
studio-tools-galileo-osnma-is-the-navigation = Galileo OSNMA: is the navigation data authenticated?
# tools
studio-tools-load-it = Load it
# tools
studio-tools-show-the-recorded-result = Show the recorded result
# tools
studio-tools-imu-fit-sensor-parameters-for = IMU fit: sensor parameters for the hybrid and fusion scenarios
# tools
studio-tools-fit-the-parameters = Fit the parameters
# tools
studio-tools-jammertest-score-a-receiver-log = Jammertest: score a receiver log against the published test plan
# tools
studio-tools-import-the-schedule = Import the schedule
# tools
studio-tools-score-the-log = Score the log
# training
studio-training-synthetic-library-scenarios = Synthetic library scenarios
# training
studio-training-library-scenario-to-generate = Library scenario to generate
# training
studio-training-random-seed-optional = Random seed (optional)
# training
studio-training-from-the-scenario = from the scenario
# training
studio-training-time-cursor = Time cursor
# training
studio-training-replay-speed = Replay speed
# training
studio-training-time-cursor-in-log-rows = Time cursor, in log rows
# training
studio-training-debrief-timeline-time-cursor = Debrief timeline: time cursor
# training
studio-training-what-did-the-crew-see = What did the crew see, and what was really happening?
# training
studio-training-open-a-log = Open a log
# training
studio-training-choose-an-instructor-log-or = Choose an instructor log, or open one of the five synthetic library scenarios written by the CLI.
# training
studio-training-or-drop-it-here-or = or drop it here, or open a library scenario:
# training
studio-training-generate-a-stream-here = Generate a stream here
# training
studio-training-run-the-engine-s-nmea = Run the engine's NMEA training generator in this browser. You get the synthetic NMEA 0183 stream for the exercise and the instructor log, and can debrief it straight away. Nothing is uploaded; streaming to a bridge simulator over TCP or UDP is a command-line feature (see the Tools page).
# training
studio-training-previous-moment = Previous moment
# training
studio-training-next-moment = Next moment
# training
studio-training-true-track-against-reported = True track against reported
# training
studio-training-north-up-one-scale-on = North up, one scale on both axes. The thin grey line is where the vessel really was. The coloured line is what the receiver reported, coloured by how far it was from the truth. Where the receiver reported no fix, nothing is drawn for it.
# training
studio-training-events-and-what-the-receiver = Events and what the receiver said
# training
studio-training-one-shared-time-axis-drag = One shared time axis. Drag or click to move the cursor; the arrow keys step it. Event bars show the strength of each injected event over time.
# training
studio-training-sky-at-the-cursor = Sky at the cursor
# training
studio-training-the-satellites-the-stream-s = The satellites the stream's own GSV lists. A filled marker has a signal strength; a hollow one is listed with none; a shaded sector is where the stream lists satellites and none is heard. Nominal constellation, not an ephemeris for the stream's date.
# training
studio-training-at-the-cursor = At the cursor
# training
studio-training-events-injected = Events injected
# training
studio-training-as-the-instructor-log-states = As the instructor log states them, with every parameter.
# training
studio-training-debrief-timeline = Debrief timeline
# training
studio-training-choose-a-moment-to-move = Choose a moment to move the cursor to it.
# training
studio-training-the-satellite-sky-is-a = The satellite sky is a nominal constellation, not an ephemeris for the stream's date.
# training
studio-training-nothing-here-is-a-measure = Nothing here is a measure of how any receiver or system performs against interference.
# trust
studio-trust-session-settings-in-toml = Session settings in TOML
# trust
studio-trust-receiver-trust-session-settings-in = Receiver-trust session settings in TOML
# trust
studio-trust-time-cursor-and-filters = Time cursor and filters
# trust
studio-trust-time-cursor-in-epochs = Time cursor, in epochs
# trust
studio-trust-score-timeline-time-cursor = Score timeline: time cursor
# trust
studio-trust-each-monitor-s-alarm-ratio = Each monitor's alarm ratio over time
# trust
studio-trust-about-this-view = About this view
# trust
studio-trust-can-the-bridge-trust-this = Can the bridge trust this fix?
# trust
studio-trust-open-a-run = Open a run
# trust
studio-trust-open-the-masked-sky-demo = Open the masked-sky demo (geometry, 0.36)
# trust
studio-trust-score-an-nmea-log-here = Score an NMEA log here
# trust
studio-trust-run-the-engine-in-this = Run the engine in this browser on a vessel's NMEA 0183 log and see the result in the view below. The log is read in this page and never uploaded. It must be an excerpt of at most 2 MiB (about 20,000 epochs) and must hold the five-minute calibration window. The settings are the vessel's limits and the score's weights, as in a session file.
# trust
studio-trust-score-the-synthetic-demo-log = Score the synthetic demo log
# trust
studio-trust-session-settings-toml = Session settings (TOML)
# trust
studio-trust-starts-from-the-demo-s = Starts from the demo's settings: edit the vessel's speed, acceleration and turn-rate limits to match yours. A settings file for your own vessel can be pasted here.
# trust
studio-trust-jammertest-scorecard = Jammertest scorecard
# trust
studio-trust-no-scorecard-open = No scorecard open.
# trust
studio-trust-generic-receiver-trust-run-not = Generic receiver-trust run (not a vessel)
# trust
studio-trust-run-the-illustrative-jamming-example = Run the illustrative jamming example
# trust
studio-trust-assess-the-chosen-file = Assess the chosen file
# trust
studio-trust-the-format-is-guessed-from = The format is guessed from the file name; change it here when it is wrong, then assess again. NovAtel OEM7, RTCM 3 and Septentrio SBF are binary formats; they are sent to the engine as they are, in this browser.
# trust
studio-trust-imu-file-optional-a-second = IMU file (optional): a second sensor for the heading
# trust
studio-trust-an-imu-log-on-the = An IMU log on the receiver log's clock fills the heading the heading-versus-course monitor reads wherever the receiver log carries none. Only a vessel session uses it.
# trust
studio-trust-remove-the-imu-file = Remove the IMU file
# trust
studio-trust-no-imu-file = No IMU file.
# trust
studio-trust-session-settings-toml-the-log = Session settings (TOML, the log is supplied inline)
# trust
studio-trust-first-deduction = First deduction
# trust
studio-trust-first-untrusted = First untrusted
# trust
studio-trust-receiver-reported-track = Receiver-reported track
# trust
studio-trust-the-satellites-the-log-s = The satellites the log's own GSV lists. A filled marker has a signal strength; a hollow one is listed with none; a shaded sector is where the log lists satellites and hears none of them (a blocked sky and a jammed signal look the same here). Nominal constellation, not an ephemeris for the log's date.
# trust
studio-trust-score-over-time = Score over time
# trust
studio-trust-score-0-to-100-dashed = Score 0 to 100. Dashed lines are the band edges; the strips underneath are the band and the gate. Drag or click to move the time cursor; the arrow keys step it.
# trust
studio-trust-reasons-at-the-cursor = Reasons at the cursor
# trust
studio-trust-points-each-check-took-off = Points each check took off this epoch, largest first. Click a check to mark where it was above its onset.
# trust
studio-trust-geometry-at-the-cursor = Geometry at the cursor
# trust
studio-trust-the-satellite-geometry-always-shown = The satellite geometry, always shown: its label (good, fair or poor) and the DOPs. A masked sky (a hull, a quay, a fjord wall) is natural degradation, told apart from attack-like inconsistency. The score takes points for geometry only when it is poor, at most 15, and never below the degraded band.
# trust
studio-trust-the-receiver-s-own-flag = The receiver's own flag
# trust
studio-trust-what-the-receiver-itself-says = What the receiver itself says about spoofing and jamming (u-blox UBX-NAV-STATUS and UBX-SEC-SIG), set beside Kshana's monitors. The codes are the receiver's; neither detector is ground truth, and agreement is not validation. The flag changes no score.
# trust
studio-trust-over-the-run = Over the run
# trust
studio-trust-what-the-score-used = What the score used
# trust
studio-trust-read-from-the-run-read = Read from the run, read-only.
# trust
studio-trust-what-this-view-does-and = What this view does and does not show
# trust
studio-trust-nmea-only-checks-cannot-see = NMEA-only checks cannot see a spoofer that reproduces the whole constellation with a self-consistent position, velocity, heading, power and clock, nor a replay of recorded real signals. A fix with no alarm is not thereby a good fix.
# trust
studio-trust-nothing-on-this-page-is = Nothing on this page is a measure of how the checks perform on real interference. The score mapping and every weight are fixed before a log is scored, with no learning and nothing fitted to events.

## Studio pages: static text (generated list, append only)
# main
studio-main-which-satellites-can-you-see = Which satellites can you see from a place, and how good is their geometry? Skyplot, skyline and DOP from the engine in your browser
# main
studio-main-trainer-debrief-for-kshana-nmea = Trainer debrief for kshana nmea-scenario instructor logs (training only; files stay in your browser)
# main
studio-main-where-did-aircraft-and-ships = Where did aircraft and ships report degraded navigation data on a past day? Open per-day map files (they stay in your browser)
# main
studio-main-can-the-bridge-trust-this = Can the bridge trust this fix? Open a vessel receiver-trust run (files stay in your browser)
# main
studio-main-evidence-packs-test-bench-export = Evidence packs, test-bench export, compliance mapping, OSNMA, command-line tools and the AI assistant (files stay in your browser)
# main
studio-main-map-of-satellites-in-view = Map of satellites in view over the Earth, from the recorded run
# main
studio-main-interactive-3-d-view-of = Interactive 3-D view of the propagated track
# main
studio-main-close-history = Close history
# main
studio-main-skip-to-the-content = Skip to the content
# main
studio-main-receiver-trust = Receiver trust
# main
studio-main-advanced-view = Advanced view
# main
studio-main-what-would-you-like-to = What would you like to find out?
# main
studio-main-pick-a-question-or-start = Pick a question, or start from the result below.
# main
studio-main-showing-below = Showing below
# main
studio-main-integrity-over-12-hours = Integrity over 12 hours
# main
studio-main-a-radio-waterfall = A radio waterfall
# main
studio-main-recorded-result = Recorded result
# main
studio-main-how-many-navigation-satellites-can = How many navigation satellites can you see from anywhere on Earth?
# main
studio-main-loading-the-recorded-result = Loading the recorded result…
# main
studio-main-everything-kshana-can-do = Everything Kshana can do
# main
studio-main-each-area-shows-a-real = Each area shows a real recorded result and the mix of evidence behind it.
# main
studio-main-open-your-own-files = Open your own files
# main
studio-main-pages-that-run-the-engine = Pages that run the engine on your own settings and files. Each one works in this browser; nothing is uploaded.
# main
studio-main-which-satellites-can-you-see-2 = Which satellites can you see from a place, and how good is their geometry? Draw the skyline.
# main
studio-main-what-accuracy-could-a-reference = What accuracy could a reference station near the lunar south pole give, and where? MODELLED.
# main
studio-main-can-the-bridge-trust-this-2 = Can the bridge trust this fix? Score a vessel's NMEA log.
# main
studio-main-where-aircraft-and-ships-reported = Where aircraft and ships reported degraded navigation data, and a route's exposure.
# main
studio-main-generate-a-drift-or-jamming = Generate a drift or jamming exercise stream and debrief the instructor log.
# main
studio-main-two-synthetic-runs-on-one = Two synthetic runs on one clock: track, trust score, live skyplot and the verdict.
# main
studio-main-the-two-optical-atmosphere-scenarios = The two optical-atmosphere scenarios: availability against the cloud ceiling, outages and site diversity.
# main
studio-main-which-navigation-signals-a-spacecraft = Which navigation signals a spacecraft far above the satellites can still use, and how well an onboard filter and a formation do with them.
# main
studio-main-what-lunar-orbiters-and-a = What lunar orbiters and a surface station can do as navigation and geodetic infrastructure, with the misses stated.
# main
studio-main-open-a-day-s-observatory = Open a day's observatory files and read them: three states, no cause, nothing uploaded.
# main
studio-main-pull-the-antenna-score-the = Pull the antenna, score the holdover: a time-error record measured against the ITU-T masks.
# main
studio-main-check-a-signed-pack-or = Check a signed pack, or attach a time stamp.
# main
studio-main-motion-and-event-files-for = Motion and event files for a laboratory simulator.
# main
studio-main-what-your-runs-evidence-against = What your runs evidence against published frameworks.
# main
studio-main-whether-recorded-galileo-data-is = Whether recorded Galileo data is authenticated, tag by tag.
# main
studio-main-use-kshana-from-your-assistant = Use Kshana from your assistant through the MCP server.
# main
studio-main-all-scenarios = All scenarios
# main
studio-main-pick-one-it-opens-on = Pick one: it opens on its result straight away.
# main
studio-main-all-questions = All questions
# main
studio-main-every-published-figure = Every published figure
# main
studio-main-read-from-the-result-document = Read from the result document with the unit, note and provenance the engine records for each one.
# main
studio-main-kalman-self-consistency = Kalman self-consistency
# main
studio-main-a-consistent-filter-s-reported = A consistent filter's reported uncertainty matches its actual errors. NIS (normalised innovation squared) should sit near 1 and NEES (normalised estimation error squared) near 2, each inside its 95% χ² band.
# main
studio-main-engine-chart = Engine chart
# main
studio-main-each-series-this-run-publishes = Each series this run publishes, against time. Hover or drag across the chart to read the values.
# main
studio-main-carrier-to-noise-density-db = carrier-to-noise density, dB-Hz
# main
studio-main-with-the-jammer = With the jammer
# main
studio-main-without-it = Without it
# main
studio-main-each-cell-is-one-satellite = Each cell is one satellite at one epoch from this run. Hatched cells are below the receiver's tracking threshold: that satellite is lost.
# main
studio-main-interference-outcome = Interference outcome
# main
studio-main-error-since-gnss-was-lost = error since GNSS was lost
# main
studio-main-scenario-budget = Scenario budget
# main
studio-main-move-the-budget-and-the = Move the budget and the time-to-breach is read off this run's own error record. The engine's holdover figure, computed at the scenario's budget, is shown alongside and is the authoritative number. Change the clock or the outage in the parameters to re-run the physics.
# main
studio-main-maximum-time-interval-error = maximum time interval error
# main
studio-main-time-deviation = time deviation
# main
studio-main-mask-checks-and-holdover-budgets = Mask checks and holdover budgets
# main
studio-main-each-check-s-limit-is = Each check's limit is plotted as a ring at the averaging time where the margin was worst. Masks are transcribed from the ITU-T (International Telecommunication Union Telecommunication Standardization Sector) Recommendations named in each row.
# main
studio-main-lower-is-better-fractional-frequency = Lower is better. Fractional-frequency stability against averaging time τ, on log axes.
# main
studio-main-earth-centred-inertial-frame = Earth-centred inertial frame
# main
studio-main-drag-to-rotate-scroll-to = Drag to rotate, scroll to zoom.
# main
studio-main-run-the-engine-once-per = Run the engine once per value and plot one figure of merit. Add a second parameter for a heat map. Every point is a real engine run, up to 60.
# main
studio-main-pinned-runs-side-by-side = pinned runs side by side
# main
studio-main-clear-pins = Clear pins
# main
studio-main-key-figures-run-against-run = Key figures, run against run
# main
studio-main-the-headline-readouts-of-each = The headline readouts of each pinned run; the change is against run A.
# main
studio-main-the-engine-s-own-export = the engine's own export
# main
studio-main-written-by-the-engine = written by the engine
# main
studio-main-czml-kml-geojson-stk-ephemeris = CZML, KML, GeoJSON, STK ephemeris, SigMF
# main
studio-main-try-other-settings = Try other settings
# main
studio-main-change-a-value-then-run = Change a value, then run again. The answer and the chart update in place.
# main
studio-main-run-again = Run again
# main
studio-main-cancel-the-run = Cancel the run
# main
studio-main-runs-in-your-browser-nothing = Runs in your browser. Nothing is uploaded.
# main
studio-main-advanced-settings = Advanced settings
# main
studio-main-every-setting-comes-from-the = Every setting comes from the scenario file. Edit the whole file under “For researchers”.
# main
studio-main-how-this-is-computed = How this is computed
# main
studio-main-level-of-evidence = Level of evidence
# main
studio-main-the-engine-s-own-one = The engine's own one-line summary
# main
studio-main-every-figure-is-labelled-with = Every figure is labelled with its evidence tier. Validated means checked against an independent external oracle; modelled means first-principles physics with tests, not yet oracle-checked.
# main
studio-main-for-researchers = For researchers
# main
studio-main-code-data-citation = code, data, citation
# main
studio-main-run-it-on-your-computer = Run it on your computer
# main
studio-main-run-it-from-python = Run it from Python
# main
studio-main-exported-figures-carry-this-doi = Exported figures carry this DOI (digital object identifier) in their caption. The same scenario, seed and engine version give the same numbers.
# main
studio-main-toml-tom-s-obvious-minimal = TOML (Tom's Obvious, Minimal Language)
# main
studio-main-in-the-editor-tab-indents = In the editor, Tab indents by two spaces. Press Escape, then Tab, to move on. Run again to use your edit.
# main
studio-main-every-panel-and-field = Every panel and field
# main
studio-main-the-advanced-view-is-the = The Advanced view is the full dashboard: every panel of this run side by side, every field of the scenario, sweeps, comparisons and the engine's own report. It opens on this scenario, with your settings.
# main
studio-main-kshana-pro = Kshana Pro
# main
studio-main-kshana-studio = Kshana Studio
# main
studio-main-request-an-evaluation = Request an evaluation
# main
studio-main-talk-to-us-about-a = Talk to us about a commercial licence
# main
studio-main-request-a-study = Request a study
# main
studio-main-imagery-nasa-visible-earth-blue = Imagery: NASA Visible Earth (Blue Marble). Coastlines: Natural Earth. Every chart here is drawn from an engine run; a run, report, animation or export made by the native command-line engine is labelled as recorded.
# main
studio-main-this-session = this session
# main
studio-main-runs-you-make-appear-here = Runs you make appear here. Select one to bring back its scenario and result, or pin it to compare.
# advanced
studio-advanced-find-a-scenario-a-domain = Find a scenario, a domain, a field or a command
# advanced
studio-advanced-the-runs-you-made-in = The runs you made in this session
# advanced
studio-advanced-a-short-tour-of-the = A short tour of the Studio
# advanced
studio-advanced-toggle-colour-theme = Toggle colour theme
# advanced
studio-advanced-switch-to-the-simple-view = Switch to the Simple view
# advanced
studio-advanced-the-simple-view-the-answer = The simple view: the answer first, five settings, details on demand
# advanced
studio-advanced-scenario-library = Scenario library
# advanced
studio-advanced-close-the-library = Close the library
# advanced
studio-advanced-find-a-scenario-a-domain-2 = Find a scenario, a domain or a field
# advanced
studio-advanced-scenario-domain-or-field = Scenario, domain or field
# advanced
studio-advanced-filter-by-domain = Filter by domain
# advanced
studio-advanced-scenarios-by-mission-domain = Scenarios by mission domain
# advanced
studio-advanced-how-the-studio-works = How the Studio works
# advanced
studio-advanced-search-scenarios-domains-or-fields = Search scenarios, domains or fields
# advanced
studio-advanced-search-scenarios-domains-or-fields-2 = Search scenarios, domains or fields, for example elevation mask
# advanced
studio-advanced-the-engine-kind-this-scenario = The engine kind this scenario runs
# advanced
studio-advanced-open-the-scenario-library = Open the scenario library
# advanced
studio-advanced-show-the-parameters-and-the = Show the parameters and the scenario source
# advanced
studio-advanced-keep-this-run-to-compare = Keep this run to compare with another (up to 4)
# advanced
studio-advanced-compare-the-pinned-runs = Compare the pinned runs
# advanced
studio-advanced-share-this-run-or-download = Share this run, or download it
# advanced
studio-advanced-result-panels = Result panels
# advanced
studio-advanced-run-summary = Run summary
# advanced
studio-advanced-parameters-and-scenario-source = Parameters and scenario source
# advanced
studio-advanced-close-the-parameters-and-show = Close the parameters and show the results
# advanced
studio-advanced-find-a-field-of-this = Find a field of this scenario
# advanced
studio-advanced-find-a-field-for-example = Find a field, for example mask
# advanced
studio-advanced-parameter-view = Parameter view
# advanced
studio-advanced-find-a-scenario-domain-field = Find a scenario, domain, field, panel or command
# advanced
studio-advanced-skip-to-results = Skip to results
# advanced
studio-advanced-find-anything = Find anything
# advanced
studio-advanced-lunar-station-coverage-of-a = Lunar station: coverage of a reference station (MODELLED)
# advanced
studio-advanced-simple-view = Simple view
# advanced
studio-advanced-choose-a-scenario = Choose a scenario
# advanced
studio-advanced-what-do-you-want-to = What do you want to do?
# advanced
studio-advanced-pick-a-domain-and-a = Pick a domain and a scenario, set it up, run the engine in your browser, then read, compare and export the results. Nothing is uploaded.
# advanced
studio-advanced-share-or-export = Share or export
# advanced
studio-advanced-good-first-runs = Good first runs
# advanced
studio-advanced-pin-run = Pin run
# advanced
studio-advanced-report-json-scenario-tables-and = report, JSON, scenario, tables and exports
# advanced
studio-advanced-the-exact-scenario-in-the = the exact scenario, in the link
# advanced
studio-advanced-an-iframe-for-a-course = an iframe for a course page or wiki
# advanced
studio-advanced-opens-in-a-new-tab = opens in a new tab
# advanced
studio-advanced-loading-the-engine-the-recorded = Loading the engine. The recorded result of this scenario shows first.
# advanced
studio-advanced-got-it = Got it
# advanced
studio-advanced-headline-numbers-from-the-engine = Headline numbers from the engine's result, with the change since your previous run of this scenario, and a pass or fail where the run states a threshold.
# advanced
studio-advanced-set-parameters = Set parameters
# advanced
studio-advanced-every-change-re-runs-the = Every change re-runs the engine and updates the key figures and panels.
# advanced
studio-advanced-drag-a-slider-and-the = Drag a slider and the scenario re-runs. Every control writes straight into the scenario text below.
# advanced
studio-advanced-in-the-editor-tab-indents = In the editor, Tab indents by two spaces. Press Escape, then Tab, to move on.

## Studio pages: static text (generated list, append only)
# mission-thread
studio-mission-thread-time-axis = Time axis
# mission-thread
studio-mission-thread-mission-thread = Mission thread
# mission-thread
studio-mission-thread-where-does-a-mission-s = Where does a mission's navigation and timing error budget run out?
# mission-thread
studio-mission-thread-a-mission-is-a-chain = A mission is a chain of phases: launch, rendezvous, transfer to the Moon, landing, return. Each phase has its own sensors and its own error budget, and each hands its uncertainty to the next. This page shows the budget of the whole chain, phase by phase, and names the weakest link.
# mission-thread
studio-mission-thread-open-the-artemis-class-example = Open the Artemis-class example
# mission-thread
studio-mission-thread-open-a-result-file = Open a result file…
# mission-thread
studio-mission-thread-the-thread = The thread
# mission-thread
studio-mission-thread-error-against-mission-elapsed-time = Error against mission elapsed time
# mission-thread
studio-mission-thread-the-phases = The phases
# mission-thread
studio-mission-thread-the-budget-of-one-phase = The budget of one phase
