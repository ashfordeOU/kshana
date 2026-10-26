# docs--kinds-mission-analysis-links-and-space-operations: translations (nb)

seg-6e0cb6acc073 = VALIDATED

seg-b03d56f501c3 = Type

seg-cb9447893c7f = Én satellitt over én stasjon: hvert passs skråavstand, elevasjon og Es/N0 langs passet, DVB-S2-MODCOD-en som velges i hvert steg (terskler fra ETSI EN { "302" } 307-1 Table { "13" } pluss en implementeringsmargin) og datavolumet ACM flytter mot grunnlinjen med konstant koding som lukker ved masken. MODELLED.

seg-046f69293874 = Diagrammet motoren skriver for scenarios/acm-link.toml, typen acm-link

seg-7eff466eb018 = Holdningskontroll for romfartøy: en treghetspekende sving av en stiv hub med tre eller flere balanserte reaksjonshjul under MRP-tilbakekobling (L = -K sigma - P omega), minimumsnorm hjulmomenter begrenset til hver motors grense, RK4 med null-ordens holdning; eventuelt sluttet i en multiplikativ EKF fra en simulert gyro (vinkel- og hastighetsrandomvandring) og stjernesensor. Rapporterer innsvingningstid, endelig og maksimal pekefeil, maksimal hjulhastighet og maksimalt moment, den mettede andelen, drift i dreieimpuls og, med estimatoren, dens holdningsfeil og NEES. Sløyfen for sann tilstand er VALIDATED mot Basilisk { "2.9.1" }; estimatoren er MODELLED.

seg-08c624d5324d = Diagrammet motoren skriver for scenarios/aocs-slew.toml, typen aocs

seg-0cef33b41040 = Apertur-driftssyklus: tidsfordelingen mellom navigasjon og kommunikasjon som en kontaktplan innebærer for en pool av styrbare aperturer. Tar en kontaktplan (en liste med <c1/> aos_s/los_s-vinduer, der hvert ber om navigasjon eller kommunikasjon — det samme aos_s/los_s-vokabularet som <c2/>-prediktoren sender ut), et antall aperturer og en ARBITRERINGSPOLICY (navigasjonsprioritet som standard, eller kommunikasjonsprioritet, eller ikke-forkjøpende først-til-mølla), og rapporterer navigasjonsandelen, kommunikasjonsandelen, ledig andel og avbruddet per økt — kontakttiden en økt ba om og ingen apertur betjente. En nøyaktig intervallsveiping over vindusgrensene, slik at vinduer som tangerer hverandre aldri konkurrerer og ingen apertursekund telles to ganger; apertursekunder for navigasjon, kommunikasjon og ledighet akkumuleres uavhengig og lukkes mot apertures*horizon_s. Rapporten oppgir den løste policyen, dens fulle definisjon og definisjonene av andel og avbrudd, fordi en andel oppgitt uten sin arbitreringspolicy ikke er reproduserbar. MODELLED planleggingsaritmetikk: ingen sving-, omstillings- eller byttetid belastes når en apertur bytter tjeneste eller økt, og ingen datavolum, bufferstatus, energibudsjett eller linklukking inngår i avgjørelsen, og kontaktvinduene er inndata — geometrien deres er det som frembrakte dem. Ikke et planleggingsprodukt for bakkesegmentet.

seg-a8b38ed8e029 = Diagrammet motoren skriver for scenarios/aperture-duty-cycle.toml, typen aperture-duty-cycle

seg-34d041d6bd9f = Plan gravitasjonssving-oppskyting av et flertrinns fartøy over en ikke-roterende, sfærisk jord gjennom US Standard Atmosphere { "1976" } (vertikal stigning, pitch-spark, skyv langs hastigheten), som integrerer tapene fra gravitasjon, luftmotstand, styring og mottrykk og kontrollerer ideell dv minus tap mot sluttbrenthastigheten; max-Q, maksimal akselerasjon og sluttbrenttilstand. MODELLED.

seg-ccf2185b0b5e = Diagrammet motoren skriver for scenarios/ascent-losses.toml, typen ascent-losses

seg-62c0dda9fc56 = 3-DOF-budsjett for holdnings- og pekefeil: det verst tenkelige forstyrrelsesmomentet fra gravitasjonsgradienten ((3/2)(μ/R³)ΔI) og et rot-sum-kvadrat-budsjett for pekefeil over navngitte 1σ-bidrag (sensorstøy, reaksjonshjulsjitter, termisk, justering) med det dominerende leddet, for en banehøyde og en spredning i kroppens treghet. MODELLED skalart AOCS-budsjett — et supplement før maskinvare til Basilisk/42, ikke en simulering av reguleringssløyfe, 6-DoF eller fleksible moduser.

seg-ad0e72e3b688 = Diagrammet motoren skriver for scenarios/attitude-budget.toml, typen attitude-budget

seg-be4e928a5865 = Planlegging av bakkekontakt for flere satellitter over flere stasjoner: tilsynelatende tilgangsvinduer (SGP4, IAU 2006/2000A jordfast ramme, ITU-R P.834-refraksjon, lystid), DVB-S2 ACM-datavolumet for hver passering (ETSI EN { "302" } 307-1 tabell { "13" } terskler) og en konfliktfri plan (én satellitt per antenne med en omstillingstid, én stasjon per satellitt, prioritetsvektet levering begrenset av hver etterslep) ved en grådig metode med marginalverdi, en først-til-mølla-grunnlinje og en eksakt branch and bound på små mengder, med den grådige metodens optimalitetsgap. MODELLED.

seg-e26b549579e2 = Diagrammet motoren skriver for scenarios/contact-schedule.toml, typen contact-schedule

seg-b843e2e0a4ee = 3-DoF atmosfærisk innflyging med punktmasse over en roterende, sfærisk jord eller Mars (ballistisk eller løftende ved konstant krengning), RK4, gjennom US76, en eksponentiell atmosfære eller Mars-atmosfæren, med konvektiv oppvarming i stagnasjonspunktet etter Sutton-Graves (NASA TR R-376): maksimal retardasjon, varmefluks og dynamisk trykk, varmelast, nedoverrekkevidde, en energikontroll i roterende ramme og den lukkede formen til Allen-Eggers ved siden av. Maksimal retardasjon er kontrollert mot den publiserte nominelle Stardust-verdien; oppvarmingen er MODELLED.

seg-dbb618cd6357 = Diagrammet motoren skriver for scenarios/entry-heating-stardust.toml, typen entry-heating

seg-47b4aea6ed01 = Fotavtrykk og dekningsgeometri for nyttelast til jordobservasjon (SMAD-romtriangel): jordens vinkelradius, svathbredde, bakkeoppløsning i nadir, maksimal tilgang utenfor nadir, sirkulær periode, J2-nodeperiode og avstand mellom bakkespor ved ekvator med et flagg for sammenhengende dekning, for en banehøyde, inklinasjon (solsynkron som standard) og sensorens FOV/IFOV. MODELLED geometri for sfærisk jord (ingen radiometri/MTF/atmosfære/jitter/glint); nodeavstand R_e·(ω − Ω̇)·T_nodal med førsteordens sekulære J2-rater.

seg-c2a8332f2ee2 = Diagrammet motoren skriver for scenarios/eo-coverage.toml, typen eo-coverage

seg-816bd5a5808a = Radiometri og bildekvalitet for nadirkamera: radians ved aperturen for en lambertsk scene, kamerelikningen, signal og skudd-/mørk-/lese-/kvantiseringsstøy og SNR; system-MTF ved Nyquist (diffraksjon x detektor x utsmøring x jitter), den relative kantresponsen fra den, Q = lambda F/p og GIQE versjon { "4" } NIIRS uten MTF-kompensasjon. MODELLED.

seg-bf7b52f7a01e = Diagrammet motoren skriver for scenarios/eo-radiometry.toml, typen eo-radiometry

seg-953188c11165 = Énveis linkbudsjett etter CCSDS { "401" } / DSN 810-005-linkligningen: frirommstap, C/N₀, Eb/N₀, margin og lukking for en sender-EIRP, mottaker-G/T, avstand, datarate og bånd (s|x|ka) mot en påkrevd Eb/N₀. En deterministisk ingeniørberegning fra de oppgitte inngangsverdiene (ikke et kalibrert terminaldatablad).

seg-bd375631bc7e = Diagrammet motoren skriver for scenarios/link-budget.toml, type link-budget

seg-dbffff25b57f = CCSDS OEM-interoperabilitetsbro: importer en Orbit Ephemeris Message laget av et eksternt verktøy for flydynamikk (GMAT, Orekit og STK sender alle ut OEM) og rapporter segmentene, objektene, referansesystemene og epokespennet, samt en kontroll av hastighetskonsistens; uten inndata kjører den en rundtur med en generert referansebane og rapporterer samsvaret mellom import og eksport. MODELLED strukturell og fysisk innlesingskontroll, IKKE en validering av banenøyaktigheten til kilden.

seg-5db5a7c812ca = Diagrammet motoren skriver for scenarios/oem-interop.toml, type oem-interop
