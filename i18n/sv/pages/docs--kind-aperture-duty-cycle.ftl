# docs--kind-aperture-duty-cycle: translations (sv)

seg-99ef7c1d552c = Scenariotyp i motor v{ $version }, familj <a1>Uppdragsanalys, länkar och rymdoperationer</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-8f1e7d3f5a07 = Familjesida: <a1>Uppdragsanalys, länkar och rymdoperationer</a1>

seg-4b695c0dfc9f = Källa: <c1/>

seg-632c0a545845 = <c1/> (scenariotyp)

seg-0cef33b41040 = Aperturens arbetscykel: den tidsfördelning mellan navigering och kommunikation som en kontaktplan innebär för en pool av styrbara aperturer. Tar en kontaktplan (en lista med <c1/> aos_s/los_s-fönster, vart och ett med begäran om navigering eller kommunikation — samma aos_s/los_s-vokabulär som prediktorn <c2/> ger), ett antal aperturer och en ARBITRERINGSPOLICY (navigeringsprioritet som standard, eller kommunikationsprioritet, eller icke-förträngande först till kvarn), och redovisar navigeringsandelen, kommunikationsandelen, andelen overksam tid och avbrottet per session — den kontakttid som en session begärde och ingen apertur betjänade. En exakt intervallsvepning över fönstergränserna, så att fönster som tangerar varandra aldrig konkurrerar och ingen aperturssekund räknas dubbelt; navigerings-, kommunikations- och overksamma aperturssekunder ackumuleras oberoende av varandra och sluter mot apertures*horizon_s. Rapporten anger den tillämpade policyn, dess fullständiga definition samt definitionerna av andel och avbrott, eftersom en andel som anges utan sin arbitreringspolicy inte går att reproducera. MODELLED schemaläggningsaritmetik: ingen vridnings-, omställnings- eller växlingstid debiteras när en apertur byter tjänst eller session, ingen datavolym, buffertstatus, energibudget eller länkslutning påverkar beslutet, och kontaktfönstren är indata — deras geometri är vad som än gav upphov till dem. Ingen produkt för schemaläggning av marksegment.

seg-a8d79b8a96bc = En körning av <c1/> sammanfattas som: aperture-duty-cycle: { "6" } session(er) på { "2" } apertur(er) under navigeringsprioritet -> navigeringsandel { "0.1167" }, kommunikationsandel { "0.2667" }, overksam { "0.6167" }; { "0" } s av { "6900" } s begärd tid förlorad till konkurrens (MODELLED)

seg-67c665d5c8c0 = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

seg-60f25ccdab6e = Exemplet <c1/> anger bland annat:

seg-bf51947657c0 = navigering

seg-b4ff1d640bdf = kommunikation

seg-2e78730d0737 = apertur*s

seg-330cbcd04718 = andel (dimensionslös)

seg-0ef5875db338 = Resultatetikett (motorns): MODELLED — aperturschemaläggningsaritmetik över en given kontaktplan: en exakt intervallsvepning av tidsfördelningen mellan navigering och kommunikation och förlusten per session på grund av konkurrens under en namngiven arbitreringspolicy. Ingen vridnings-, omställnings- eller växlingstid debiteras när en apertur byter tjänst eller session,

seg-a8b38ed8e029 = Diagrammet som motorn skriver för scenarios/aperture-duty-cycle.toml, typ aperture-duty-cycle

seg-4636d450ef60 = <b>MODELLED</b> En körning tar en kontaktplan (en lista med aos_s/los_s-fönster, vart och ett med begäran till aperturen om navigering eller kommunikation — samma fönstervokabulär som <c1/> ger, omvandlad av <c2/>), ett antal aperturer

seg-7a5aa78533d3 = <b>MODELLED</b> En körning tar en kontaktplan (en lista med aos_s/los_s-fönster, vart och ett med begäran till aperturen om navigering eller kommunikation — samma fönstervokabulär som `passes::pre. Oberoende referens (InternalConsistency): Inre samstämmighet, utifrån tre storheter som beräknas med olika uttryck i samma svepning och sedan måste sluta. Navigerings-, kommunikations- och overksamma aperturssekunder ackumuleras separat — overksamma från (apertures − |served|) per elementärt intervall, aldrig som en rest — och deras summa kontrolleras mot apertures × horizon_s, vilket en felaktigt avgränsad gräns, en dubbel

seg-a388c24fec99 = MODELLED — aperturschemaläggningsaritmetik över en given kontaktplan: en exakt intervallsvepning av tidsfördelningen mellan navigering och kommunikation och förlusten per session på grund av konkurrens under en namngiven arbitreringspolicy. Ingen vridnings-, omställnings- eller växlingstid debiteras när en apertur byter tjänst eller session, ingen datavolym, buffertstatus, energibudget eller länkslutning påverkar beslutet, och kontaktfönstren är indata — th (resultat <c1/>)

seg-e689f30b268a = MODELLED schemaläggningsaritmetik: ingen vridnings-, omställnings- eller växlingstid debiteras när en apertur byter tjänst eller session, ingen datavolym, buffertstatus, energibudget eller länkslutning påverkar beslutet, och kontaktfönstren är indata — deras geometri är vad som än gav upphov till dem. (typkatalog (<c1/>))

seg-4aa40af30bd2 = ÄRLIG AVGRÄNSNING: MODELLED schemaläggningsaritmetik över de givna fönstren. Ingen vridnings-, omställnings- eller växlingstid debiteras när en apertur byter tjänst eller session; ingen datavolym, buffertstatus, energibudget eller länkslutning påverkar beslutet; och kontaktfönstren är indata -- deras geometri är vad som än gav upphov till dem (scenariot <c1/> ger samma aos_s / los_s-vokabulär). Ingen schemaläggning av markseg (kommentar i scenariofilen, rad { "18" } till { "24" })

seg-0b7f8d86e5d5 = Aperturens arbetscykel mellan navigering och kommunikation är MODELLED, inte validerad: kontrollerad mot sin egen slutna / analytiska identitet — fångar transkriptions- och koefficientfel, men är ingen extern oberoende referens. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-dbbefaba93dc = <s1>Föregående</s1>aocs

seg-5b4fd889fdff = <s1>Nästa</s1>araim-reference-check
