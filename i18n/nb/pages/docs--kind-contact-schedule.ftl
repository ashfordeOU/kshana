# docs--kind-contact-schedule: translations (nb)

seg-99ef7c1d552c = Scenariotype i motoren v{ $version }, familien <a1>Oppdragsanalyse, linker og romoperasjoner</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en tjeneste der liv og sikkerhet står på spill. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett oppnås: avsnittet Evidence i README).

seg-debc2f07db78 = true

seg-8784979d6569 = dBW

seg-dfe78b9d0811 = GHz

seg-37d16b499bc5 = dB

seg-0f4c2ab525ac = <b>MODELLED</b> Es/N0 i nedlinken langs hvert pass av én satellitt over én stasjon (EIRP, frirom-tap, atmosfærisk tap etter kosekantloven, andre tap, G/T, Boltzmanns konstant, symbolrate), den mest effektive DVB-S2-MODCOD-en som klarer ETSI EN { "302" } 307-

seg-c246881f6fd4 = <b>VALIDATED</b> Synlighetspasseringer (AOS, TCA, LOS, maksimal tilsynelatende elevasjon, varighet) for et SGP4-elementsett over en WGS-84-stasjon på den validerte jordbanestien (IAU { "2006" }. Uavhengig referanse (ExternalDataset): Orekit { "13.1.8" } (CS GROUP, Apache-2.0) med Hipparchus { "4.0.3" }: TLEPropagator på de samme elementsettene i en TEME som Orekit bygger etter den oppgitte definisjonen (dens IERS { "2010" } TOD rotert med GAST - GMST), ElevationDetector og ElevationExtremumDetector med og uten ITURP834AtmosphericRefraction, og AngularAzEl med AngularRadioRefractionModifier for tilfellet med lystid, krysninger og maksimum løst av Hipparchus; { "60" } tilfeller (f

seg-35588ca8e9bb = <b>MODELLED</b> Nedlinjens Es/N0 langs hver passering for én satellitt over én stasjon (EIRP, frirom-tap, atmosfærisk tap etter cosecant-loven, andre tap, G/T, Boltzmanns konstant,. Uavhengig referanse (InternalConsistency): Intern konsistens: den spektrale effektiviteten beregnet i lukket form fra tabell 5a K_bch og rammelengdene stemmer med effektivitetene som tabell { "13" } oppgir (en transkripsjonskontroll av terskeltabellen); delene av linkbudsjettet stemmer med sine lukkede former; valget er monotont i Es/N0 og respekterer marginen; ACM flytter minst like mye data som konstant koding. Passeringsgeometrien kommer fra den separat VALIDATED a

seg-cd04f5662884 = MODELLED. (typekatalog (<c1/>))

seg-7f8667e8d8fe = DVB-S2 adaptiv koding og modulasjon langs en LEO-nedlinjepassering er MODELLED, ikke validert: kontrollert mot sin egen lukkede/analytiske identitet – fanger opp transkripsjons- og koeffisientfeil, men er ikke en uavhengig ekstern referanse. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-8f1e7d3f5a07 = Familieside: <a1>Oppdragsanalyse, linker og romoperasjoner</a1>

seg-72fd0321e4af = Temaside: <a1>CONTACT-SCHEDULING.md</a1>

seg-b79fcddea1d6 = Kilde: <c1/>

seg-040d160b3fdd = <c1/> (scenariotype)

seg-be4e928a5865 = Planlegging av bakkekontakt for flere satellitter over flere stasjoner: tilsynelatende tilgangsvinduer (SGP4, IAU 2006/2000A jordfast ramme, ITU-R P.834-refraksjon, lystid), DVB-S2 ACM-datavolumet for hver passering (ETSI EN { "302" } 307-1 tabell { "13" } terskler) og en konfliktfri plan (én satellitt per antenne med en omstillingstid, én stasjon per satellitt, prioritetsvektet levering begrenset av hver etterslep) ved en grådig metode med marginalverdi, en først-til-mølla-grunnlinje og en eksakt branch and bound på små mengder, med den grådige metodens optimalitetsgap. MODELLED.

seg-7a3fad06a9fc = Én kjøring av <c1/> oppsummeres som: contact-schedule: { "3" } satellites x { "3" } stations over { "12" } h -> { "31" } candidate contacts, { "22" } scheduled; { "797266" } of { "860000" } Mbit delivered (MODELLED)

seg-a03d83f5866a = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-5ba0968796ac = Eksempelet <c1/> setter blant annet:

seg-cade59b5a371 = Resultatetikett (motorens): MODELLED — multi-satellite, multi-station contact plan: apparent access windows (SGP4, IAU 2006/2000A, ITU-R P.834 refraction, light time), DVB-S2 ACM data volume per pass from a clear-sky link budget (ETSI EN { "302" } 307-1 Table { "13" } thresholds), and conflict resolution (one satellite per antenna with tu

seg-e26b549579e2 = Diagrammet motoren skriver for scenarios/contact-schedule.toml, typen contact-schedule

seg-036b708ed2b9 = <b>MODELLED</b> Kandidatkontakter fra hver passering mellom satellitt og stasjon med dens ACM-datavolum; konflikter der én antenne ville betjene to satellitter innenfor omstillingstiden eller én satellitt ville sende ned til to stasjoner samtidig; en prioritetsvektet levering

seg-60431931082a = <b>MODELLED</b> Kandidatkontakter fra hver passering mellom satellitt og stasjon med dens ACM-datavolum; konflikter der én antenne ville betjene to satellitter innenfor omstillingstiden eller en. Uavhengig referanse (InternalConsistency): Intern konsistens: den eksakte branch and bound stemmer med uttømmende opptelling på små tilfeldige mengder, hver plan kontrolleres som gjennomførbar mot konfliktreglene, og den grådige metoden slår aldri det eksakte optimum. HVA SOM IKKE ER: ingen ekstern planlegger eller operativ plan er sammenlignet; kontakter tas hele (ingen deling), etterslepet er fast ved vinduets start, svingetid utover den faste omstillingstiden og onboard s

seg-9941b9f6d4a8 = MODELLED — multi-satellite, multi-station contact plan: apparent access windows (SGP4, IAU 2006/2000A, ITU-R P.834 refraction, light time), DVB-S2 ACM data volume per pass from a clear-sky link budget (ETSI EN { "302" } 307-1 Table { "13" } thresholds), and conflict resolution (one satellite per antenna with turnaround, one station per satellite) by a marginal-value greedy checked against an exact branch and bound; no rain fade, (resultat <c1/>)

seg-f8ef88bc82b5 = Alle tall nedenfor er ILLUSTRATIVE: ingen operatørs baner, stasjoner eller linkbudsjett. MODELLED: planleggeren er kontrollert mot sin egen eksakte løser, ikke et eksternt verktøy. (kommentar i scenariofilen, linje { "11" } til { "12" })

seg-fe2b4799b397 = Bakkekontaktplanlegging med flere satellitter og flere stasjoner og konfliktløsning er MODELLED, ikke validert: kontrollert mot sin egen lukkede/analytiske identitet – fanger opp transkripsjons- og koeffisientfeil, men er ikke en uavhengig ekstern referanse. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-be14d99cb86d = <s1>Forrige</s1>constellation-design

seg-3784be57d6df = <s1>Neste</s1>earth-gnss-lunar
