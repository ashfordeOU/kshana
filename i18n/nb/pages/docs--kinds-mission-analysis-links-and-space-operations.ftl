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

seg-7a4e6215a488 = Todelegeme-geometri for oppskyting og stigning: oppskytingsazimut (sin Az = cos i / cos lat), minste nåbare inklinasjon, sirkulær hastighet, den østvendte bonusen fra jordrotasjonen, dogleg-Δv for planbytte når målinklinasjonen er under stedets breddegrad, og antall daglige oppskytingsmuligheter. MODELLED geometri for sfærisk jord (ingen korreksjon for hastighetstrekant med roterende jord, ingen modell for stignings-/dragtap).

seg-9696283a95ae = Diagrammet motoren skriver for scenarios/launch-window.toml, typen launch-window

seg-953188c11165 = Énveis linkbudsjett etter CCSDS { "401" } / DSN 810-005-linkligningen: frirommstap, C/N₀, Eb/N₀, margin og lukking for en sender-EIRP, mottaker-G/T, avstand, datarate og bånd (s|x|ka) mot en påkrevd Eb/N₀. En deterministisk ingeniørberegning fra de oppgitte inngangsverdiene (ikke et kalibrert terminaldatablad).

seg-bd375631bc7e = Diagrammet motoren skriver for scenarios/link-budget.toml, type link-budget

seg-dbffff25b57f = CCSDS OEM-interoperabilitetsbro: importer en Orbit Ephemeris Message laget av et eksternt verktøy for flydynamikk (GMAT, Orekit og STK sender alle ut OEM) og rapporter segmentene, objektene, referansesystemene og epokespennet, samt en kontroll av hastighetskonsistens; uten inndata kjører den en rundtur med en generert referansebane og rapporterer samsvaret mellom import og eksport. MODELLED strukturell og fysisk innlesingskontroll, IKKE en validering av banenøyaktigheten til kilden.

seg-5db5a7c812ca = Diagrammet motoren skriver for scenarios/oem-interop.toml, type oem-interop

seg-039f77066d97 = Ballistisk gjeninntrengingskorridor etter Allen-Eggers: maksimal retardasjon (uavhengig av ballistisk koeffisient, V_e^{ "2" } sin|γ|/(2eH)), hastigheten og høyden ved maksimal g, og hastigheten ved maksimal oppvarming, for en inntrengingshastighet, banevinkel og ballistisk koeffisient gjennom en eksponentiell atmosfære, pluss en plan punktmasseintegrasjon av den samme ballistiske inntrengingen med tyngdekraft, jordkrumning og US Standard Atmosphere { "1976" } (maksimal retardasjon, fart, høyde og tid ved maksimum). MODELLED ballistisk inntrenging (uten løft); oppvarmingsutdataene er HASTIGHETEN ved maksimal oppvarming, ikke en varmefluks (ingen aerotermisk modell eller TPS-modell).

seg-b0109481e8ff = Diagrammet motoren skriver for scenarios/reentry.toml, type reentry

seg-de2448d74c2b = CCSDS 133.0-B Space Packet Protocol-rammer: kode en syntetisk TM/TC-pakkestrøm (6-oktetters primærhode + datafelt) og rapporter dekodingen av hodet per pakke, totalt antall oktetter og en eksakt rundtur mellom koding og dekoding. Deterministisk, eksakt bitoppsett i rammene, interoperabilitetslaget for byråenes pakkeformat; IKKE en sertifisering av overensstemmelse (ingen logikk for sekundærhode, CRC eller segmentering utover flaggene).

seg-af1cf9aa9938 = Diagrammet motoren skriver for scenarios/space-packet.toml, type space-packet

seg-4e31c8daf798 = Register

seg-436e412d99fd = MODELLED { "1" } · VALIDATED { "1" }

seg-69ee217ed8e0 = Kilde: <c1/>

seg-f5091cbeecbf = Oppdragsanalyse, lenker og romoperasjoner (scenariotypefamilie)

seg-d0eea6d9d1ad = { "14" } scenariotyper i motoren v{ $version }. Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en safety-of-life-tjeneste. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett oppnås: README-ens Evidence-avsnitt).

seg-6481dabc9458 = Temasider: <a1>ENTRY-EO-ASCENT</a1>, <a2>CONTACT-SCHEDULING</a2>, <a3>AOCS</a3>. Kjør én: <c1/>. Alle familier: <a4>KINDS.md</a4>.

seg-d6c5a581ffaf = Kontaktark over diagrammene motoren skriver for typene i familien Oppdragsanalyse, lenker og romoperasjoner

seg-8d65a4a1948d = Geometri for oppskyting og stigning i tolegemeproblemet: oppskytingsazimut (sin Az = cos i / cos lat), minste oppnåelige inklinasjon, sirkulær hastighet, jordrotasjonens østlige bonus, dogleg-planendrings-Δv når mål

seg-dd47e755d262 = Plan gravity-turn-stigning for et flertrinnsfarkost over en ikke-roterende kuleformet jord gjennom US Standard Atmosphere { "1976" } (vertikal stigning, pitch-spark, skyv langs hastigheten), med integrasjon av grav

seg-cc88f37328a3 = Allen-Eggers ballistisk gjeninntrengningskorridor: maksimal retardasjon (uavhengig av ballistisk koeffisient, V_e^{ "2" } sin/γ//(2eH)), hastighet og høyde ved topp-g, og hastigheten ved maksimal oppvarming, for en innfartshas

seg-8ad7c34d8c25 = Atmosfærisk innfart med 3 frihetsgrader og punktmasse over en roterende kuleformet jord eller Mars (ballistisk eller løftende ved konstant krengning), RK4, gjennom US76, en eksponentiell atmosfære eller Mars-atmosfæren, med Sutton-Graves stagnas

seg-efe896d3f43b = Fotavtrykk og dekningsgeometri for jordobservasjonsnyttelast (SMADs romtrekant): jordens vinkelradius, sporbredde, bakkeoppløsning i nadir, maksimal tilgang utenfor nadir, sirkulær periode, J2-nodeperi

seg-d3d9652fd8a0 = Radiometri og bildekvalitet for nadirkamera: radians ved aperturen for en lambertsk scene, kameraligningen, signal og skudd-/mørkestrøm-/lese-/kvantiseringsstøy og SNR; systemets MTF ved Nyquist (diffraksjon

seg-1940d5c75a98 = Feilbudsjett for holdning og pekning med 3 frihetsgrader: det verst tenkelige forstyrrelsesmomentet fra gravitasjonsgradienten ((3/2)(μ/R³)ΔI) og et kvadratsumsbudsjett for pekefeil over navngitte 1σ-bidrag (sensorstøy, reaksjon

seg-e00d18fbb52b = Holdningsregulering av romfartøy: en treghetspekende dreining av en stiv hub med tre eller flere balanserte reaksjonshjul under MRP-tilbakekobling (L = -K sigma - P omega), minimumsnorm hjulmomenter klippet til hve

seg-496fa280de7b = Enveis lenkebudsjett etter lenkeligningen i CCSDS { "401" } / DSN 810-005: tap i fritt rom, C/N₀, Eb/N₀, margin og lenkeslutning for en sende-EIRP, mottaks-G/T, avstand, datarate og bånd (s/x/ka) mot en

seg-f0aca7ea1ffa = Én satellitt over én stasjon: hver overflygings skråavstand, elevasjon og Es/N0 langs overflygingen, DVB-S2 MODCOD valgt ved hvert steg (ETSI EN { "302" } 307-1 Tabell { "13" } terskler pluss en implementeringsmargin)

seg-44c4890ba07e = Planlegging av bakkekontakt for flere satellitter over flere stasjoner: tilsynelatende tilgangsvinduer (SGP4, IAU 2006/2000A jordfast referansesystem, ITU-R P.834-refraksjon, lystid), DVB-S2 ACM-datavolumet o

seg-19ab136e9f9b = Driftssyklus for aperturer: tidsfordelingen mellom navigasjon og kommunikasjon som en kontaktplan innebærer for en pool av styrbare aperturer.

seg-ee0c649ca8b2 = Innramming med CCSDS 133.0-B Space Packet Protocol: kod en syntetisk TM/TC-pakkestrøm (primærhode på 6 oktetter + datafelt) og rapporter dekoding av hodet per pakke, totalt antall oktetter og en eksakt koding↔deko

seg-e561f3a749db = CCSDS OEM-bro for interoperabilitet: importer en Orbit Ephemeris Message laget av et eksternt flydynamikkverktøy (GMAT/Orekit/STK gir alle ut OEM) og rapporter segmenter/objekter/referansesystemer/epokespenn pluss

seg-1f074d7beccc = Obligatoriske felt: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

seg-8f65824c39c5 = <b>Register:</b> MODELLED. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>launch-window</a1>.

seg-2926bde689d3 = Obligatoriske felt: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

seg-66f6489411d0 = <b>Register:</b> MODELLED. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>ascent-losses</a1>.

seg-481ce1d98bc7 = Obligatoriske felt: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

seg-fff98550eb48 = <b>Register:</b> MODELLED. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>reentry</a1>.

seg-9cf8d4b6064f = Obligatoriske felt: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>.

seg-84e1bddcbc95 = <b>Register:</b> MODELLED { "1" } · VALIDATED { "1" }. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>entry-heating</a1>.

seg-eab43348803e = Obligatoriske felt: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

seg-9c6ce756a89a = <b>Register:</b> VALIDATED. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>eo-coverage</a1>.

seg-cd84a7bdbe57 = Obligatoriske felt: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>.

seg-320d724ac797 = <b>Register:</b> MODELLED. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>eo-radiometry</a1>.

seg-905487bf50f1 = Obligatoriske felt: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>.

seg-14511e367361 = <b>Register:</b> VALIDATED. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>attitude-budget</a1>.

seg-540fa1932dad = Obligatoriske felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>. Valgfrie: <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>.

seg-6d2e9b9ce87f = <b>Register:</b> MODELLED { "1" } · VALIDATED { "1" }. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>aocs</a1>.

seg-3345731b5729 = Obligatoriske felt: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

seg-f8b896b81014 = <b>Register:</b> MODELLED { "1" } · VALIDATED { "1" }. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>link-budget</a1>.

seg-e38e356f4b71 = Obligatoriske felt: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

seg-eed876ed5aab = <b>Register:</b> MODELLED. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>acm-link</a1>.

seg-5fddd2460fb0 = Obligatoriske felt: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

seg-58d00faa1eda = <b>Register:</b> MODELLED. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>contact-schedule</a1>.

seg-5d4f6861f301 = Obligatoriske felt: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

seg-1e06e06d4325 = <b>Register:</b> MODELLED. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>aperture-duty-cycle</a1>.

seg-9bb424e01c84 = Obligatoriske felt: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>.

seg-688071019c9e = <b>Register:</b> VALIDATED. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>space-packet</a1>.

seg-03c06f9fdc85 = Obligatoriske felt: ingen. Valgfrie: <c1/>.

seg-568c484ce9a0 = <b>Register:</b> VALIDATED. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>oem-interop</a1>.

seg-41996765fcf1 = <s1>Forrige</s1>Måne og cislunart

seg-1951c46fe429 = <s1>Neste</s1>Optisk PNT
