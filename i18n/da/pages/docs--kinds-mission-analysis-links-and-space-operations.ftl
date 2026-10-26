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
