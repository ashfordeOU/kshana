# docs--kinds-clocks-timing-and-holdover: translations (nl)

seg-b03d56f501c3 = Type

seg-78cba87823f7 = Klok-holdover tegenover de specificatie; optioneel Monte-Carlo-ensemble (runs > { "1" }).

seg-cb0b7da83f5c = De grafiek die de engine schrijft voor scenarios/clock-ensemble.toml, kind clock

seg-c0924aa36e64 = MODELLED holdovertest van een tijdsynchronisatiesysteem, gescoord uit een tijdfoutregistratie die de OPERATOR aanlevert (een linuxptp-ptp4l-, phc2sys- of ts2phc-log, een chrony-tracking- of -statistiekenlog, een TICC-, TimeLab- of RINEX-klokgelog, of time_s,time_error_ns-paren). De test heeft vier stappen en Kshana voert er geen enkele uit: een vergrendelde BASELINE, GNSS VERWIJDERD door de operator (de antennekabel of de simulatoruitvoer; Kshana zendt niets uit en stuurt niets aan) op een vermeld tijdstip, HOLDOVER op de eigen oscillator van het systeem, en RECOVERY nadat de operator GNSS herstelt op een tweede vermeld tijdstip. De registratie wordt op die twee tijdstippen gesplitst. Baseline: tijdfoutstatistieken en de ITU-T-maskers die voor een vergrendelde klok zijn opgesteld. Holdover: statistieken, de fractionele frequentie-afwijking die het systeem hield (een kleinste-kwadratenlijn), de maskers die voor holdover of een autonome klok zijn opgesteld, de ePRTC-A-holdoverenvelop vanaf de vermelde vergrendelde duur, en de tijd tot elk tijdfoutbudget wordt overschreden. Recovery: of en wanneer |TE| binnen een vermelde band kwam en daar bleef, de piek en de grootste stap. Elke limiet is overgenomen uit een openbare ITU-T-tabel (de maskers voor telecomtijdsynchronisatie); de bewoording is 'gemeten tegen het masker', en de twee tijdstippen zijn de verklaring van de operator, niet geverifieerd. Een registratie die te kort is voor een masker is INCOMPLETE, nooit geëxtrapoleerd. Zie docs/TIMING-HIL.md.

seg-8ce93392747b = De grafiek die de engine schrijft voor scenarios/holdover-test-ptp4l.toml, soort holdover-test
