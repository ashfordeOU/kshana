# docs--kinds-mission-analysis-links-and-space-operations: translations (da)

seg-6e0cb6acc073 = VALIDATED

seg-b03d56f501c3 = Type

seg-cb9447893c7f = Én satellit over én station: hver passages skrå afstand, elevation og Es/N0 langs passagen, den DVB-S2 MODCOD, der vælges i hvert trin (tærskler fra ETSI EN { "302" } 307-1 Table { "13" } plus en implementeringsmargin), og den datamængde, ACM flytter, mod baseline med konstant kodning, der lukker ved masken. MODELLED.

seg-046f69293874 = Diagrammet, som motoren skriver for scenarios/acm-link.toml, typen acm-link

seg-7eff466eb018 = Rumfartøjets attitudestyring: en slew-manøvre med inertial pegning af en stiv krop med tre eller flere afbalancerede reaktionshjul under MRP-tilbagekobling (L = -K sigma - P omega), minimumsnorm-hjulmomenter begrænset til hver motors grænse, RK4 med zero-order hold; eventuelt lukket på et multiplikativt EKF ud fra en simuleret gyro (vinkel- og rate-random-walk) og en stjernesensor. Rapporterer indsvingningstid, endelig og maksimal pegefejl, maksimal hjulhastighed og maksimalt hjulmoment, den mættede andel, drift i impulsmoment og, med estimatoren, dens attitudefejl og NEES. Sløjfen for den sande tilstand er VALIDATED mod Basilisk { "2.9.1" }; estimatoren er MODELLED.

seg-08c624d5324d = Diagrammet, som motoren skriver for scenarios/aocs-slew.toml, type aocs

seg-0cef33b41040 = Aperturens driftscyklus: den tidsfordeling mellem navigation og kommunikation, som en kontaktplan medfører for en pulje af styrbare aperturer. Tager en kontaktplan (en liste af aos_s/los_s-vinduer i <c1/>, der hver beder om navigation eller kommunikation — det samme aos_s/los_s-ordforråd, som prædiktoren <c2/> udsender), et antal aperturer og en ARBITRERINGSPOLITIK (navigationsprioritet som standard, eller kommunikationsprioritet, eller ikke-præemptiv først til mølle), og rapporterer navigationsdriften, kommunikationsdriften, tomgangsdriften og udfaldet pr. session — den kontakttid, en session bad om, og som ingen apertur dækkede. Et præcist intervalsweep over vinduesgrænserne, så vinduer, der blot berører hinanden, aldrig konkurrerer, og ingen aperturssekunder tælles dobbelt; navigations-, kommunikations- og tomgangsaperturssekunder akkumuleres uafhængigt og lukker mod apertures*horizon_s. Rapporten angiver den opløste politik, dens fulde definition samt definitionerne af drift og udfald, fordi et driftstal, der angives uden sin arbiteringspolitik, ikke kan reproduceres. MODELLED planlægningsaritmetik: der regnes ingen tid for slew / omstilling / skift, når en apertur skifter tjeneste eller session, intet datavolumen, ingen bufferstatus, intet energibudget og ingen linklukning indgår i beslutningen, og kontaktvinduerne er input — deres geometri er det, der frembragte dem. Ikke et planlægningsprodukt til jordsegmentet.

seg-a8b38ed8e029 = Diagrammet, som motoren skriver for scenarios/aperture-duty-cycle.toml, type aperture-duty-cycle

seg-34d041d6bd9f = Plan opstigning med tyngdekraftsdrejning for et flertrinskøretøj over en ikke-roterende kugleformet Jord gennem US Standard Atmosphere { "1976" } (lodret stigning, pitch-kick, thrust langs hastigheden), hvor tab fra tyngdekraft, modstand, styring og modtryk integreres, og ideelt dv minus tab kontrolleres mod brændudhastigheden; max-Q, maksimal acceleration og brændudtilstand. MODELLED.

seg-ccf2185b0b5e = Diagrammet, som motoren skriver for scenarios/ascent-losses.toml, type ascent-losses

seg-62c0dda9fc56 = 3-DOF-budget for attitude og pegefejl: det værst tænkelige gravitationsgradient-forstyrrelsesmoment ((3/2)(μ/R³)ΔI) og et root-sum-square-budget for pegefejl over navngivne 1σ-bidragydere (sensorstøj, reaktionshjulsjitter, termisk, justering) med det dominerende led, for en banehøjde + en spredning i legemets inerti. MODELLED skalært AOCS-budget — et supplement før hardware til Basilisk/42, ikke en simulering af styresløjfe, 6-DoF eller fleksible tilstande.

seg-ad0e72e3b688 = Diagrammet, som motoren skriver for scenarios/attitude-budget.toml, type attitude-budget

seg-be4e928a5865 = Planlægning af jordkontakter for flere satellitter over flere stationer: tilsyneladende adgangsvinduer (SGP4, IAU 2006/2000A jordfast system, ITU-R P.834-refraktion, lystid), DVB-S2-ACM-datavolumen for hver overflyvning (tærskler i ETSI EN { "302" } 307-1 Table { "13" }) og en konfliktfri plan (én satellit pr. antenne med en omstillingstid, én station pr. satellit, prioritetsvægtet levering begrænset til hvert efterslæb) ved en grådig metode med marginalværdi, en først-til-mølle-baseline og en eksakt branch and bound på små mængder, med den grådige metodes optimalitetsgab. MODELLED.

seg-e26b549579e2 = Diagrammet, som motoren skriver for scenarios/contact-schedule.toml, type contact-schedule

seg-b843e2e0a4ee = 3-DoF-punktmasseindflyvning i atmosfæren over en roterende kugleformet Jord eller Mars (ballistisk eller løftende ved konstant krængning), RK4, gennem US76, en eksponentiel eller Mars-atmosfæren, med konvektiv opvarmning i stagnationspunktet efter Sutton-Graves (NASA TR R-376): maksimal deceleration, varmeflux og dynamisk tryk, varmebelastning, downrange, en energikontrol i roterende system og Allen-Eggers' lukkede form ved siden af. Maksimal deceleration er kontrolleret mod det publicerede nominelle Stardust-forløb; opvarmningen er MODELLED.

seg-dbb618cd6357 = Diagrammet, som motoren skriver for scenarios/entry-heating-stardust.toml, type entry-heating

seg-47b4aea6ed01 = Footprint og dækningsgeometri for jordobservationsnyttelast (SMAD-rumtrekant): Jordens vinkelradius, swathbredde, GSD i nadir, maksimal off-nadir-adgang, cirkulær periode, J2-knudeperiode og afstand mellem jordspor ved ækvator med et flag for sammenhængende dækning, for en banehøjde, hældning (solsynkron som standard) og sensor-FOV/IFOV. MODELLED geometri med kugleformet Jord (ingen radiometri/MTF/atmosfære/jitter/glint); knudeafstand R_e·(ω − Ω̇)·T_nodal med første-ordens sekulære J2-rater.

seg-c2a8332f2ee2 = Diagrammet, som motoren skriver for scenarios/eo-coverage.toml, type eo-coverage

seg-816bd5a5808a = Radiometri og billedkvalitet for en nadirbilledtager: radians ved aperturen for en lambertsk scene, kameraligningen, signal og skud-/mørkestrøms-/udlæsnings-/kvantiseringsstøj og SNR; systemets MTF ved Nyquist (diffraktion x detektor x udtværing x jitter), den relative kantrespons ud fra den, Q = lambda F/p og GIQE version { "4" } NIIRS uden MTF-kompensation. MODELLED.

seg-bf7b52f7a01e = Diagrammet, som motoren skriver for scenarios/eo-radiometry.toml, type eo-radiometry

seg-7a4e6215a488 = Opsendelses- og opstigningsgeometri med tolegemeproblem: opsendelsesazimut(er) (sin Az = cos i / cos lat), mindste opnåelige inklination, cirkulær hastighed, Jordens rotationsbonus mod øst, Δv for dogleg-planændring, når målinklinationen er under stedets breddegrad, og antallet af daglige opsendelsesmuligheder. MODELLED geometri for kugleformet Jord (ingen hastighedstrekantskorrektion for roterende Jord, ingen model for opstignings-/modstandstab).

seg-9696283a95ae = Diagrammet, som motoren skriver for scenarios/launch-window.toml, scenarietype launch-window

seg-953188c11165 = Enkeltvejs linkbudget efter CCSDS { "401" } / DSN 810-005-linkligningen: fripladstab, C/N₀, Eb/N₀, margin og lukning for en sende-EIRP, modtage-G/T, afstand, datahastighed og bånd (s|x|ka) mod et krævet Eb/N₀. En deterministisk ingeniørberegning ud fra de leverede input (ikke et kalibreret terminaldatablad).

seg-bd375631bc7e = Diagrammet, som motoren skriver for scenarios/link-budget.toml, type link-budget

seg-dbffff25b57f = Interoperabilitetsbro til CCSDS OEM: importér en Orbit Ephemeris Message fra et eksternt flyvedynamikværktøj (GMAT, Orekit og STK udsender alle OEM) og rapportér dens segmenter, objekter, referencesystemer og epokespænd samt en kontrol af hastighedskonsistens; uden input kører den en rundtur med en genereret referencebane og rapporterer troværdigheden mellem import og eksport. MODELLED strukturel og fysisk indlæsningskontrol, IKKE en validering af kildens banenøjagtighed.

seg-5db5a7c812ca = Diagrammet, som motoren skriver for scenarios/oem-interop.toml, type oem-interop

seg-039f77066d97 = Korridor for ballistisk generindtræden efter Allen-Eggers: maksimal deceleration (uafhængig af ballistisk koefficient, V_e^{ "2" } sin|γ|/(2eH)), hastighed og højde ved maksimal g og hastigheden ved maksimal opvarmning, for en indtrædenshastighed, banevinkel og ballistisk koefficient gennem en eksponentiel atmosfære, plus en plan integration af et punktmassesystem af den samme ballistiske indtræden med tyngdekraft, jordens krumning og US Standard Atmosphere { "1976" } (maksimal deceleration, hastighed, højde og tid ved maksimum). MODELLED ballistisk indtræden (uden løft); opvarmningen er HASTIGHEDEN ved maksimal opvarmning, ikke en varmeflux (ingen model for aerotermi eller varmeskjold).

seg-b0109481e8ff = Diagrammet, som motoren skriver for scenarios/reentry.toml, type reentry

seg-de2448d74c2b = Indramning efter CCSDS 133.0-B Space Packet Protocol: kodér en syntetisk TM/TC-pakkestrøm (primær header på 6 oktetter + datafelt) og rapportér afkodningen af headeren for hver pakke, samlet antal oktetter og en nøjagtig rundtur mellem kodning og afkodning. Deterministisk indramning med nøjagtigt bitlayout — organisationernes lag for interoperabilitet mellem pakkeformater; IKKE en certificering af overensstemmelse (ingen logik for sekundær header, CRC eller segmentering ud over flagene).

seg-af1cf9aa9938 = Diagrammet, som motoren skriver for scenarios/space-packet.toml, type space-packet

seg-4e31c8daf798 = Register

seg-436e412d99fd = MODELLED { "1" } · VALIDATED { "1" }

seg-69ee217ed8e0 = Kilde: <c1/>

seg-f5091cbeecbf = Missionsanalyse, forbindelser og rumoperationer (scenarietypefamilie)

seg-d0eea6d9d1ad = { "14" } scenarietyper i motoren v{ $version }. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en safety-of-life-tjeneste. Hver betegnelse her er motorens eller verifikationsmatricens; en type er MODELLED, medmindre matricen angiver andet (hvordan en betegnelse opnås: afsnittet Evidens i README).

seg-6481dabc9458 = Emnesider: <a1>ENTRY-EO-ASCENT</a1>, <a2>CONTACT-SCHEDULING</a2>, <a3>AOCS</a3>. Kør én: <c1/>. Alle familier: <a4>KINDS.md</a4>.

seg-d6c5a581ffaf = Kontaktark med de diagrammer, som motoren skriver for typerne i familien Missionsanalyse, forbindelser og rumoperationer

seg-8d65a4a1948d = Tolegemeopsendelse og opstigningsgeometri: opsendelsesazimut(er) (sin Az = cos i / cos lat), mindste nåbare inklinering, cirkulær hastighed, jordrotationens østlige bonus, dogleg-Δv til planskift, når mål

seg-dd47e755d262 = Plan opstigning med gravity turn for et flertrinsfartøj over en ikke-roterende sfærisk Jord gennem US Standard Atmosphere { "1976" } (lodret stigning, pitch kick, thrust langs hastigheden), der integrerer gravi

seg-cc88f37328a3 = Allen-Eggers ballistisk genindtrædelseskorridor: maksimal deceleration (uafhængig af den ballistiske koefficient, V_e^{ "2" } sin/γ//(2eH)), hastigheden og højden ved peak-g og hastigheden ved maksimal opvarmning, for en indtrædelseshastighed

seg-8ad7c34d8c25 = 3-DoF-punktmasse-atmosfæreindtræden over en roterende sfærisk Jord eller Mars (ballistisk eller løftende ved konstant krængning), RK4, gennem US76, en eksponentiel eller Mars-atmosfæren, med Sutton-Graves-stagnation

seg-efe896d3f43b = Fodaftryk og dækningsgeometri for en jordobservationsnyttelast (SMAD-rumtrekant): Jordens vinkelradius, svathbredde, nadir jordprøveafstand, maksimal off-nadir-adgang, cirkulær periode, J2-knudeperiode

seg-d3d9652fd8a0 = Radiometri og billedkvalitet for en nadir-billeddanner: radians ved aperturen for en lambertsk scene, kameraligningen, signal og shot-/mørk-/udlæsnings-/kvantiseringsstøj og SNR; systemets MTF ved Nyquist (diffraktion

seg-1940d5c75a98 = 3-DOF-attitude- og pegefejlbudget: det værste tilfælde af forstyrrende gravitationsgradientmoment ((3/2)(μ/R³)ΔI) og et rod-sum-kvadrat-pegefejlbudget over navngivne 1σ-bidragydere (sensorstøj, reaktions

seg-e00d18fbb52b = Rumfartøjets attitudestyring: en inertial pegedrejning af et stift hub med tre eller flere afbalancerede reaktionshjul under MRP-feedback (L = -K sigma - P omega), hjulmomenter med mindste norm, begrænset til hvert

seg-496fa280de7b = Envejs forbindelsesbudget efter CCSDS { "401" } / DSN 810-005-forbindelsesligningen: fri-rums-dæmpning, C/N₀, Eb/N₀, margin og lukning for en sende-EIRP, modtage-G/T, afstand, datarate og bånd (s/x/ka) mod en

seg-f0aca7ea1ffa = Én satellit over én station: hver passages skrå afstand, elevation og Es/N0 langs passagen, den DVB-S2 MODCOD, der vælges i hvert trin (ETSI EN { "302" } 307-1 Table { "13" } tærskler plus en implementeringsmargin)

seg-44c4890ba07e = Planlægning af jordkontakter for flere satellitter over flere stationer: tilsyneladende adgangsvinduer (SGP4, IAU 2006/2000A jordfast ramme, ITU-R P.834-refraktion, lystid), DVB-S2 ACM-datavolumen o

seg-19ab136e9f9b = Aperturdriftscyklus: den tidsdeling mellem navigation og kommunikation, en kontaktplan medfører for en pulje af styrbare apertures.

seg-ee0c649ca8b2 = CCSDS 133.0-B Space Packet Protocol-framing: kod en syntetisk TM/TC-pakkestrøm (6-oktet primær header + datafelt) og rapportér dekodning af header pr. pakke, samlet antal oktetter og en eksakt encode↔deco

seg-e561f3a749db = CCSDS OEM-interoperabilitetsbro: importér en Orbit Ephemeris Message produceret af et eksternt flight-dynamics-værktøj (GMAT/Orekit/STK udsender alle OEM) og rapportér dens segmenter/objekter/rammer/epokespænd plus

seg-1f074d7beccc = Obligatoriske felter: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

seg-8f65824c39c5 = <b>Register:</b> MODELLED. Fuld side med input, resultater, evidens og begrænsninger: <a1>launch-window</a1>.

seg-2926bde689d3 = Obligatoriske felter: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

seg-66f6489411d0 = <b>Register:</b> MODELLED. Fuld side med input, resultater, evidens og begrænsninger: <a1>ascent-losses</a1>.

seg-481ce1d98bc7 = Obligatoriske felter: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

seg-fff98550eb48 = <b>Register:</b> MODELLED. Fuld side med input, resultater, evidens og begrænsninger: <a1>reentry</a1>.

seg-9cf8d4b6064f = Obligatoriske felter: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>.

seg-84e1bddcbc95 = <b>Register:</b> MODELLED { "1" } · VALIDATED { "1" }. Fuld side med input, resultater, evidens og begrænsninger: <a1>entry-heating</a1>.

seg-eab43348803e = Obligatoriske felter: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

seg-9c6ce756a89a = <b>Register:</b> VALIDATED. Fuld side med input, resultater, evidens og begrænsninger: <a1>eo-coverage</a1>.

seg-cd84a7bdbe57 = Obligatoriske felter: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>.

seg-320d724ac797 = <b>Register:</b> MODELLED. Fuld side med input, resultater, evidens og begrænsninger: <a1>eo-radiometry</a1>.

seg-905487bf50f1 = Obligatoriske felter: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>.

seg-14511e367361 = <b>Register:</b> VALIDATED. Fuld side med input, resultater, evidens og begrænsninger: <a1>attitude-budget</a1>.

seg-540fa1932dad = Obligatoriske felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>. Valgfrie: <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>.

seg-6d2e9b9ce87f = <b>Register:</b> MODELLED { "1" } · VALIDATED { "1" }. Fuld side med input, resultater, evidens og begrænsninger: <a1>aocs</a1>.

seg-3345731b5729 = Obligatoriske felter: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

seg-f8b896b81014 = <b>Register:</b> MODELLED { "1" } · VALIDATED { "1" }. Fuld side med input, resultater, evidens og begrænsninger: <a1>link-budget</a1>.

seg-e38e356f4b71 = Obligatoriske felter: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

seg-eed876ed5aab = <b>Register:</b> MODELLED. Fuld side med input, resultater, evidens og begrænsninger: <a1>acm-link</a1>.

seg-5fddd2460fb0 = Obligatoriske felter: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

seg-58d00faa1eda = <b>Register:</b> MODELLED. Fuld side med input, resultater, evidens og begrænsninger: <a1>contact-schedule</a1>.

seg-5d4f6861f301 = Obligatoriske felter: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

seg-1e06e06d4325 = <b>Register:</b> MODELLED. Fuld side med input, resultater, evidens og begrænsninger: <a1>aperture-duty-cycle</a1>.

seg-9bb424e01c84 = Obligatoriske felter: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>.

seg-688071019c9e = <b>Register:</b> VALIDATED. Fuld side med input, resultater, evidens og begrænsninger: <a1>space-packet</a1>.

seg-03c06f9fdc85 = Obligatoriske felter: ingen. Valgfrie: <c1/>.

seg-568c484ce9a0 = <b>Register:</b> VALIDATED. Fuld side med input, resultater, evidens og begrænsninger: <a1>oem-interop</a1>.

seg-41996765fcf1 = <s1>Forrige</s1>Måne og cislunart rum

seg-1951c46fe429 = <s1>Næste</s1>Optisk PNT
