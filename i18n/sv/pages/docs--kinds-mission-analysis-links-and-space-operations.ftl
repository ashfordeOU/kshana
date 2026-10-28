# docs--kinds-mission-analysis-links-and-space-operations: translations (sv)

seg-6e0cb6acc073 = VALIDATED

seg-b03d56f501c3 = Typ

seg-cb9447893c7f = En satellit över en station: varje överflygnings lutande avstånd, elevation och Es/N0 längs överflygningen, den DVB-S2 MODCOD som väljs vid varje steg (ETSI EN { "302" } 307-1 tabell { "13" }, trösklar plus en implementeringsmarginal) och den datavolym som ACM för över jämfört med baslinjen med konstant kodning som sluter vid masken. MODELLED.

seg-046f69293874 = Diagrammet som motorn skriver för scenarios/acm-link.toml, typ acm-link

seg-7eff466eb018 = Rymdfarkosters attitydstyrning: en tröghetspekande vridning av en stel hubb med tre eller fler balanserade reaktionshjul under MRP-återkoppling (L = -K sigma - P omega), minimumnorm-vridmoment för hjulen begränsade till varje motors gräns, RK4 med nollte ordningens hållning; eventuellt sluten med ett multiplikativt EKF från ett simulerat gyro (vinkel- och hastighetsslumpvandring) och en stjärnkamera. Redovisar insvängningstid, slutligt och maximalt pekfel, maximalt hjulvarvtal och vridmoment, den mättade andelen, drift i rörelsemängdsmoment och, med estimatorn, dess attitydfel och NEES. Slingan för det sanna tillståndet är VALIDATED mot Basilisk { "2.9.1" }; estimatorn är MODELLED.

seg-08c624d5324d = Diagrammet som motorn skriver för scenarios/aocs-slew.toml, typ aocs

seg-0cef33b41040 = Aperturens arbetscykel: den tidsfördelning mellan navigering och kommunikation som en kontaktplan innebär för en pool av styrbara aperturer. Tar en kontaktplan (en lista med <c1/> aos_s/los_s-fönster, vart och ett med begäran om navigering eller kommunikation — samma aos_s/los_s-vokabulär som prediktorn <c2/> ger), ett antal aperturer och en ARBITRERINGSPOLICY (navigeringsprioritet som standard, eller kommunikationsprioritet, eller icke-förträngande först till kvarn), och redovisar navigeringsandelen, kommunikationsandelen, andelen overksam tid och avbrottet per session — den kontakttid som en session begärde och ingen apertur betjänade. En exakt intervallsvepning över fönstergränserna, så att fönster som tangerar varandra aldrig konkurrerar och ingen aperturssekund räknas dubbelt; navigerings-, kommunikations- och overksamma aperturssekunder ackumuleras oberoende av varandra och sluter mot apertures*horizon_s. Rapporten anger den tillämpade policyn, dess fullständiga definition samt definitionerna av andel och avbrott, eftersom en andel som anges utan sin arbitreringspolicy inte går att reproducera. MODELLED schemaläggningsaritmetik: ingen vridnings-, omställnings- eller växlingstid debiteras när en apertur byter tjänst eller session, ingen datavolym, buffertstatus, energibudget eller länkslutning påverkar beslutet, och kontaktfönstren är indata — deras geometri är vad som än gav upphov till dem. Ingen produkt för schemaläggning av marksegment.

seg-a8b38ed8e029 = Diagrammet som motorn skriver för scenarios/aperture-duty-cycle.toml, typ aperture-duty-cycle

seg-34d041d6bd9f = Plan gravitationssväng-uppstigning för ett flerstegsfordon över en icke-roterande sfärisk jord genom US Standard Atmosphere { "1976" } (vertikal stigning, pitchsparkning, dragkraft längs hastigheten), med integrering av gravitations-, luftmotstånds-, styrnings- och mottrycksförlusterna och kontroll av ideellt dv minus förluster mot brinntidens slutfart; max-Q, maximal acceleration och slutläge vid brinntidens slut. MODELLED.

seg-ccf2185b0b5e = Diagrammet som motorn skriver för scenarios/ascent-losses.toml, typ ascent-losses

seg-62c0dda9fc56 = Attityd- och pekfelsbudget i 3 frihetsgrader: det värsta fallets gravitationsgradientstörande vridmoment ((3/2)(μ/R³)ΔI) och en pekfelsbudget som kvadratisk summa över namngivna 1σ-bidrag (sensorbrus, reaktionshjulsjitter, termiskt, uppriktning) med den dominerande termen, för en banhöjd + spridning i kroppens tröghet. MODELLED skalär AOCS-budget — ett komplement före hårdvaran till Basilisk/42, inte en simulering av reglerslinga, 6 frihetsgrader eller flexibla moder.

seg-ad0e72e3b688 = Diagrammet som motorn skriver för scenarios/attitude-budget.toml, typ attitude-budget

seg-be4e928a5865 = Planering av markkontakter för flera satelliter över flera stationer: skenbara åtkomstfönster (SGP4, jordfast system enligt IAU 2006/2000A, refraktion enligt ITU-R P.834, ljustid), DVB-S2 ACM-datavolymen för varje passage (ETSI EN { "302" } 307-1, trösklarna i Table { "13" }) och en konfliktfri tidsplan (en satellit per antenn med omställningstid, en station per satellit, prioritetsviktad leverans begränsad till varje eftersläpning) med en girig metod med marginalvärde, en först-till-kvarn-baslinje och en exakt branch and bound på små mängder, med den giriga metodens optimalitetsgap. MODELLED.

seg-e26b549579e2 = Diagrammet som motorn skriver för scenarios/contact-schedule.toml, kind contact-schedule

seg-b843e2e0a4ee = Atmosfärsinträde med tre frihetsgrader (3-DoF) och punktmassa över en roterande sfärisk jord eller Mars (ballistiskt eller bärande med konstant roll), RK4, genom US76, en exponentiell atmosfär eller Mars-atmosfären, med konvektiv uppvärmning i stagnationspunkten enligt Sutton-Graves (NASA TR R-376): maximal retardation, värmeflöde och dynamiskt tryck, värmelast, räckvidd, en energikontroll i roterande system och den slutna formen enligt Allen-Eggers bredvid. Maximal retardation kontrolleras mot det publicerade nominella Stardust-värdet; uppvärmningen är MODELLED.

seg-dbb618cd6357 = Diagrammet som motorn skriver för scenarios/entry-heating-stardust.toml, kind entry-heating

seg-47b4aea6ed01 = Fotavtryck och täckningsgeometri för en jordobservationsnyttolast (SMAD-rymdtriangeln): jordens vinkelradie, svepbredd, markupplösning i nadir (GSD), maximal åtkomst utanför nadir, cirkulär omloppstid, J2-nodperiod och markspårsavstånd vid ekvatorn med en flagga för sammanhängande täckning, för en omloppshöjd, inklination (solsynkron som standard) och sensorns FOV/IFOV. MODELLED geometri för en sfärisk jord (ingen radiometri/MTF/atmosfär/jitter/solglitter); nodavstånd R_e·(ω − Ω̇)·T_nodal med sekulära J2-hastigheter av första ordningen.

seg-c2a8332f2ee2 = Diagrammet som motorn skriver för scenarios/eo-coverage.toml, kind eo-coverage

seg-816bd5a5808a = Radiometri och bildkvalitet för en nadirkamera: radians vid aperturen för en lambertsk scen, kameraekvationen, signal samt skott-/mörker-/avläsnings-/kvantiseringsbrus och SNR; systemets MTF vid Nyquist (diffraktion x detektor x smetning x jitter), det relativa kantsvaret utifrån den, Q = lambda F/p och GIQE version { "4" } NIIRS utan MTF-kompensation. MODELLED.

seg-bf7b52f7a01e = Diagrammet som motorn skriver för scenarios/eo-radiometry.toml, kind eo-radiometry

seg-7a4e6215a488 = Tvåkropps-geometri för uppskjutning och uppstigning: uppskjutningsazimut(er) (sin Az = cos i / cos lat), lägsta nåbara inklination, cirkulär hastighet, jordrotationens östliga bonus, Δv för planbyte med dogleg när målinklinationen är lägre än platsens latitud, och antalet dagliga uppskjutningstillfällen. MODELLED geometri för en sfärisk jord (ingen korrektion för hastighetstriangeln med roterande jord, ingen modell för uppstignings-/dragförluster).

seg-9696283a95ae = Diagrammet som motorn skriver för scenarios/launch-window.toml, kind launch-window

seg-953188c11165 = Enkelriktad länkbudget enligt länkekvationen i CCSDS { "401" } / DSN 810-005: fri rymdförlust, C/N₀, Eb/N₀, marginal och slutning för en sändar-EIRP, mottagar-G/T, avstånd, datatakt och band (s|x|ka) mot ett erforderligt Eb/N₀. En deterministisk teknisk beräkning utifrån de angivna indata (inte ett kalibrerat datablad för en terminal).

seg-bd375631bc7e = Diagrammet som motorn skriver för scenarios/link-budget.toml, typ link-budget

seg-dbffff25b57f = Interoperabilitetsbrygga för CCSDS OEM: importera ett Orbit Ephemeris Message som skapats av ett externt flygdynamikverktyg (GMAT/Orekit/STK ger alla OEM) och redovisa dess segment/objekt/referenssystem/epokspann samt en hastighetskonsistenskontroll; utan indata går den en rundtur med en genererad referensbana och redovisar import↔export-trohet. MODELLED strukturell/fysikalisk importkontroll, INTE en validering av banans noggrannhet för källan.

seg-5db5a7c812ca = Diagrammet som motorn skriver för scenarios/oem-interop.toml, typ oem-interop

seg-039f77066d97 = Ballistisk återinträdeskorridor enligt Allen-Eggers: toppavbromsning (oberoende av ballistisk koefficient, V_e^{ "2" } sin|γ|/(2eH)), hastighet och höjd vid toppavbromsningen samt hastigheten vid toppuppvärmning, för en ingångshastighet/banvinkel/ballistisk koefficient genom en exponentiell atmosfär, plus en plan punktmassintegrering av samma ballistiska inträde med gravitation, jordkrökning och US Standard Atmosphere { "1976" } (toppavbromsning, hastighet, höjd och tid vid toppen). MODELLED ballistiskt inträde (utan lyft); uppvärmningsutdata är HASTIGHETEN vid toppuppvärmning, inte ett värmeflöde (ingen aerotermisk/TPS-modell).

seg-b0109481e8ff = Diagrammet som motorn skriver för scenarios/reentry.toml, typ reentry

seg-de2448d74c2b = Ramning enligt CCSDS 133.0-B Space Packet Protocol: koda en syntetisk TM/TC-paketström (6-oktetts primärhuvud + datafält) och redovisa avkodning av huvudet per paket, totalt antal oktetter och en exakt rundtur kodning↔avkodning. Deterministisk ramning med exakt bitlayout — interoperabilitetslagret för myndigheters paketformat; INTE en certifiering av överensstämmelse (ingen logik för sekundärhuvud/CRC/segmentering utöver flaggorna).

seg-af1cf9aa9938 = Diagrammet som motorn skriver för scenarios/space-packet.toml, typ space-packet

seg-4e31c8daf798 = Register

seg-436e412d99fd = MODELLED { "1" } · VALIDATED { "1" }

seg-69ee217ed8e0 = Källa: <c1/>

seg-f5091cbeecbf = Uppdragsanalys, länkar och rymdoperationer (familj av scenariotyper)

seg-d0eea6d9d1ad = { "14" } scenariotyper i motorn v{ $version }. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en safety-of-life-tjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen anger något annat (hur en etikett förtjänas: avsnittet Evidence i README).

seg-6481dabc9458 = Ämnessidor: <a1>ENTRY-EO-ASCENT</a1>, <a2>CONTACT-SCHEDULING</a2>, <a3>AOCS</a3>. Kör en: <c1/>. Alla familjer: <a4>KINDS.md</a4>.

seg-d6c5a581ffaf = Kontaktark med diagrammen som motorn skriver för typerna i familjen Uppdragsanalys, länkar och rymdoperationer

seg-8d65a4a1948d = Tvåkroppsgeometri för uppskjutning och uppstigning: uppskjutningsazimut (sin Az = cos i / cos lat), lägsta nåbara inklination, cirkulär hastighet, bonusen från jordrotationen österut, Δv för planbyte med dogleg när målet

seg-dd47e755d262 = Plan uppstigning med gravitationssväng för ett fordon med flera steg över en icke-roterande sfärisk jord genom US Standard Atmosphere { "1976" } (vertikal stigning, pitch-kick, dragkraft längs hastigheten), med integrering av gravitations

seg-cc88f37328a3 = Allen-Eggers ballistisk återinträdeskorridor: maximal retardation (oberoende av ballistisk koefficient, V_e^{ "2" } sin/γ//(2eH)), hastigheten och höjden vid maximalt g, samt hastigheten vid maximal uppvärmning, för en ingångshastighet

seg-8ad7c34d8c25 = 3-DoF-punktmassa vid atmosfärsinträde över en roterande sfärisk jord eller Mars (ballistisk eller bärande vid konstant bankning), RK4, genom US76, en exponentiell eller Mars atmosfär, med Sutton-Graves stagnations

seg-efe896d3f43b = Fotavtryck och täckningsgeometri för jordobservationsnyttolast (SMAD:s rymdtriangel): jordens vinkelradie, svepbredd, markupplösning i nadir, maximal åtkomst utanför nadir, cirkulär omloppstid, J2-nodal peri

seg-d3d9652fd8a0 = Radiometri och bildkvalitet för nadirbildtagare: radians vid aperturen för en lambertsk scen, kameraekvationen, signal och skott-/mörker-/avläsnings-/kvantiseringsbrus och SNR; systemets MTF vid Nyquist (diffraktion

seg-1940d5c75a98 = Felbudget för 3-DOF-attityd och pekning: det värsta fallets störmoment från gravitationsgradienten ((3/2)(μ/R³)ΔI) och en kvadratsummerad budget för pekfel över namngivna 1σ-bidrag (sensorbrus, reaktions

seg-e00d18fbb52b = Attitydstyrning av rymdfarkost: en tröghetspekande vridning av en stel hubb med tre eller fler balanserade reaktionshjul under MRP-återkoppling (L = -K sigma - P omega), minimumnorm-hjulmoment begränsade till varje

seg-496fa280de7b = Enkelriktad länkbudget enligt länkekvationen i CCSDS { "401" } / DSN 810-005: fritt-rymd-vägförlust, C/N₀, Eb/N₀, marginal och slutning för en sänd EIRP, mottagen G/T, avstånd, datahastighet och band (s/x/ka) mot en

seg-f0aca7ea1ffa = En satellit över en station: varje pass snedavstånd, elevation och Es/N0 längs passet, den DVB-S2-MODCOD som väljs i varje steg (ETSI EN { "302" } 307-1 Tabell { "13" } trösklar plus en implementationsmarginal)

seg-44c4890ba07e = Planering av markkontakter för flera satelliter över flera stationer: skenbara åtkomstfönster (SGP4, IAU 2006/2000A jordfast ram, refraktion enligt ITU-R P.834, ljustid), DVB-S2 ACM-datavolymen o

seg-19ab136e9f9b = Driftcykel för aperturer: den tidsdelning mellan navigering och kommunikation som en kontaktplan innebär för en pool av styrbara aperturer.

seg-ee0c649ca8b2 = Inramning enligt CCSDS 133.0-B Space Packet Protocol: koda en syntetisk TM/TC-paketström (primärhuvud på 6 oktetter + datafält) och redovisa avkodningen av huvudet per paket, totalt antal oktetter och ett exakt kodnings↔avkodnings

seg-e561f3a749db = Interoperabilitetsbrygga för CCSDS OEM: importera ett Orbit Ephemeris Message som producerats av ett externt flygdynamikverktyg (GMAT/Orekit/STK ger alla OEM) och redovisa dess segment/objekt/ramar/epokspann plus

seg-1f074d7beccc = Obligatoriska fält: inga. Valfria: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

seg-8f65824c39c5 = <b>Register:</b> MODELLED. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>launch-window</a1>.

seg-2926bde689d3 = Obligatoriska fält: inga. Valfria: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

seg-66f6489411d0 = <b>Register:</b> MODELLED. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>ascent-losses</a1>.

seg-481ce1d98bc7 = Obligatoriska fält: inga. Valfria: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

seg-fff98550eb48 = <b>Register:</b> MODELLED. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>reentry</a1>.

seg-9cf8d4b6064f = Obligatoriska fält: inga. Valfria: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>.

seg-84e1bddcbc95 = <b>Register:</b> MODELLED { "1" } · VALIDATED { "1" }. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>entry-heating</a1>.

seg-eab43348803e = Obligatoriska fält: inga. Valfria: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

seg-9c6ce756a89a = <b>Register:</b> VALIDATED. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>eo-coverage</a1>.

seg-cd84a7bdbe57 = Obligatoriska fält: inga. Valfria: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>.

seg-320d724ac797 = <b>Register:</b> MODELLED. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>eo-radiometry</a1>.

seg-905487bf50f1 = Obligatoriska fält: inga. Valfria: <c1/>, <c2/>, <c3/>, <c4/>.

seg-14511e367361 = <b>Register:</b> VALIDATED. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>attitude-budget</a1>.

seg-540fa1932dad = Obligatoriska fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>. Valfria: <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>.

seg-6d2e9b9ce87f = <b>Register:</b> MODELLED { "1" } · VALIDATED { "1" }. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>aocs</a1>.

seg-3345731b5729 = Obligatoriska fält: inga. Valfria: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

seg-f8b896b81014 = <b>Register:</b> MODELLED { "1" } · VALIDATED { "1" }. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>link-budget</a1>.

seg-e38e356f4b71 = Obligatoriska fält: inga. Valfria: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

seg-eed876ed5aab = <b>Register:</b> MODELLED. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>acm-link</a1>.

seg-5fddd2460fb0 = Obligatoriska fält: inga. Valfria: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

seg-58d00faa1eda = <b>Register:</b> MODELLED. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>contact-schedule</a1>.

seg-5d4f6861f301 = Obligatoriska fält: inga. Valfria: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

seg-1e06e06d4325 = <b>Register:</b> MODELLED. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>aperture-duty-cycle</a1>.

seg-9bb424e01c84 = Obligatoriska fält: inga. Valfria: <c1/>, <c2/>, <c3/>, <c4/>.

seg-688071019c9e = <b>Register:</b> VALIDATED. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>space-packet</a1>.

seg-03c06f9fdc85 = Obligatoriska fält: inga. Valfria: <c1/>.

seg-568c484ce9a0 = <b>Register:</b> VALIDATED. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>oem-interop</a1>.

seg-41996765fcf1 = <s1>Föregående</s1>Måne och cislunart

seg-1951c46fe429 = <s1>Nästa</s1>Optisk PNT

seg-e77c46e23e67 = <s1>Nästa</s1>Uppdragsflöden
