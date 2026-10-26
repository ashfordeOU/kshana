# docs--kind-lunar-jamming: translations (da)

seg-37d16b499bc5 = dB

seg-59afd80736c5 = <b>PARTNER</b> Ikke leveret — Kshana modellerer signalydelse, ikke nyttelast- eller antennehardware. Uafhængig reference (NoneKind): ingen: en disciplin, som partneren ejer, uden modul og uden test, af design

seg-1f17ef6a853e = Scenarietype i motoren v{ $version }, familie <a1>Måne og cislunart rum</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: README'ens afsnit Evidence).

seg-1c1eeb2dcaa0 = Familieside: <a1>Måne og cislunart rum</a1>

seg-a3697ad561db = Hz

seg-9521a296d617 = dBi

seg-f85a85f0c7e4 = MHz

seg-7154243aabbe = broadband

seg-cec5c06d38af = <b>MODELLED</b> Månenativt jammer-til-signal-forhold, effektiv C/N₀ og tab af lås for en selenografisk overfladebruger under en jammer på månens overflade (eller hævet) over den illustrative Moonlight/LCNS-klasse-konstellation fra offentlige kilder.

seg-edcd55ccc993 = <b>MODELLED</b> Rapporten <c1/> hviler ikke længere sin nægtelseskontur på ét enkelt skalartal.

seg-bcb02ffed4d0 = Kilde: <c1/>

seg-612388918e36 = <c1/> (scenarietype)

seg-a91a9ad5d8d1 = Lunar-nativ RF-jamming: jammer-til-signal-forhold pr. satellit, effektiv C/N₀ og tab af lock for en selenografisk bruger på overfladen under en jammer på månens overflade (eller hævet), over den illustrative konstellation af Moonlight/LCNS-klassen i lunar bane fra offentlige kilder. Sammensætter den eksisterende åbne jamming-fysik (jamming::j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor) med den eksisterende lunare himmelgeometri (lunar_service::LunarConstellation + topocentric, lunar::selenographic_to_mcmf); ingen geometri eller radiometri udledes igen. I modsætning til typen <c1/> for Jorden er signalleddet IKKE en fast modtaget effekt: hver satellits isotrope modtagne effekt er dens eget linkbudget EIRP − FSPL(skråafstand), så J/S varierer fra satellit til satellit med lunar afstand og elevation. Rapporterer ÉN RÆKKE PR. SYNLIGT (epoke, satellit)-LINK — azimut, elevation, skråafstand, begge modtagne effekter, som J/S er forskellen mellem, J/S, den nominelle og den effektive C/N₀ og lock-status — plus samlede kvalitetsmål ved siden af (aldrig i stedet for) den tabel og den samme tabel som CSV-artefakt. Hvert udsendt numerisk felt bærer en enhed og en proveniensklasse. VALIDATED delresultater bærer deres kildemoduls uafhængige reference (anti-jam-ligningen og J/S-linket hos Kaplan & Hegarty §{ "9.4" }, ekstern reference i tests/gnss_denied_jamming_resilience_reference.rs; den lunare geometri i lunar_service). Selve sammensætningen er krydskontrolleret mod en uafhængig vej med to linkbudgetter (linkbudget::received_signal_power_dbw, et andet udtryk for fripladstab) til { "1e-9" } dB. MODELLED: den illustrative konstellation, de repræsentative værdier for EIRP / jammereffekt / antennegevinster / støjtemperatur og fraværet af terrænskygge, flervejsudbredelse, AGC-dynamik og adaptiv nulstilling. Ikke et certificeret produkt mod denial-of-service. Når en jammer er konfigureret, indeholder rapporten også en NEKTELSESKONTUR MED ET USIKKERHEDSBÅND i stedet for en kontur aflæst ud fra ét skalartal: hele den målte fordeling af C/N₀ for det ønskede signal over tabellen pr. satellit (n, min, p05, p25, median, p75, p95, max, middel, stikprøvens standardafvigelse og stikprøvens egen asymmetri) og konturen evalueret ved hver af disse ordensstatistikker under BEGGE nektelseskriterier, som motoren kender — det eksisterende effektforholdskriterium (J/S = { "30" } dB, som i attack-surface og tracking-loop) og kriteriet om tab af lock (effektiv C/N₀ falder til tracking_threshold_dbhz, det kriterium, som rapportens egen statuskolonne bruger) — på begge akser af nektelsesplanet (krævet jammer-EIRP ved scenariets afstand, nektelsesafstand ved scenariets EIRP). Båndets kanter ER contour(p05) og contour(p95), den samme lukkede afbildning anvendt på stikprøvens egne kvantiler: ikke et sigma tilpasset stikprøven og ikke median ± k·stdev, hvor stdev udsendes af hensyn til kontinuitet og ikke bruges af noget. En kvantil, der allerede ligger på eller under sporingstærsklen, har ingen endelig J/S, der nægter, og dens kolonner for tab af lock er null med en optalt årsag, aldrig en afkortet radius.

seg-6693c3ebcb07 = Én kørsel af <c1/> opsummeres som: lunar-jamming | { "4" } sats, { "12" } epochs, { "38" } links from (-89.67, { "129.78" }) | J/S { "33.651" }..36.668 dB (mean { "35.622" }) | { "0" } LOST | availability { "0.167" } of { "0.167" } nominal

seg-6e01b6354e40 = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>

seg-c61fb6515ed9 = Eksemplet <c1/> sætter blandt andet:

seg-6fe8b3c6c584 = Diagrammet, som motoren skriver for scenarios/lunar-jamming.toml, type lunar-jamming

seg-d4ae2f589112 = <b>MODELLED</b> Lunar-nativt jammer-til-signal-forhold, effektiv C/N₀ og tab af lock for en selenografisk bruger på overfladen under en jammer på månens overflade (eller hævet), over den illustr. Uafhængig reference (ReferenceImpl): Krydskontrol af sammensætningen mod en uafhængig kodevej i selve repositoriet: hvert J/S pr. link udledes igen som forskellen mellem to linkbudgetter beregnet med linkbudget::received_signal_power_dbw, hvis fripladstab er det enkelte udtryk { "20" }·log10(4πRf/c) frem for den treleddede sum, som jamming::free_space_path_loss_db bruger — de to stemmer til < { "1e-9" } dB på hver række (målt værste tilfælde { "7.11e-14" } dB, dvs. flydende-komma-afrunding)

seg-dbe54e7cc800 = <b>MODELLED</b> Rapporten <c1/> bygger ikke længere sin nektelseskontur på ét skalartal. Den udsender hele den målte fordeling af C/N₀ for det ønskede signal over t. Uafhængig reference (InternalConsistency): Intern konsistens mod motorens egne fremadfunktioner, hvilket er alt, hvad denne funktion ærligt kan gøre krav på. Hvert konturpunkt er en inversion i lukket form, og hver inversion kontrolleres ved at sende dens svar tilbage gennem den FREMADFUNKTION, som rapportens egne rækker blev bedømt med: J/S-kolonnen gennem jamming::effective_cn0_dbhz (som skal returnere tracking_threshold_dbhz til < { "1e-9" } dB-Hz), afstandskolonnen

seg-d48926e62856 = MODELLED: den illustrative konstellation, de repræsentative værdier for EIRP / jammereffekt / antennegevinster / støjtemperatur og fraværet af terrænskygge, flervejsudbredelse, AGC-dynamik og adaptiv nulstilling. (kategori-katalog (<c1/>))

seg-c455dbcb9f8c = MODELLED. Konstellationen er den illustrative geometri af Moonlight/LCNS-klassen fra offentlige kilder (ikke den virkelige efemeride; ingen tilknytning eller støtte antydes), og interferensmodellen er et linkbudget: ingen terrænskygge for jammeren (en førsteordens effekt i terræn ved sydpolen), ingen flervejsudbredelse, ingen AGC-dynamik for nær/fjern, ingen adaptiv nulstilling, ingen hysterese mellem akkvisition og sporing. (kommentar i scenariefilen, linje { "26" } til { "30" })

seg-da57cc7f1aa4 = Lunar RF-jamming ved navigation på overfladen (J/S pr. satellit) er MODELLED, ikke valideret: kontrolleret mod en separat implementering i selve denne kodebase — uafhængig af enheden under test, men ikke eksternt autoritativ. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-dba1589d3c1e = Lunar nektelseskontur med et usikkerhedsbånd ud fra den målte spredning af C/N₀ er MODELLED, ikke valideret: kontrolleret mod sin egen lukkede/analytiske identitet — fanger afskrivnings- og koefficientfejl, men er ikke en ekstern uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-a2889fb2b42a = Emneside: <a1>integrations.md</a1>

seg-03b50b21e5a8 = <s1>Forrige</s1>lunar-interop-export

seg-02568469f628 = <s1>Næste</s1>lunar-joint-od-clock
