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
