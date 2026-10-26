# docs--kind-contact-schedule: translations (da)

seg-99ef7c1d552c = Scenarietype i motoren v{ $version }, familien <a1>Missionsanalyse, forbindelser og rumoperationer</a1>. Vejledende: analyseoutput fra et forsknings- og udviklingsværktøj, ikke typegodkendt navigationsudstyr og ikke en tjeneste til beskyttelse af menneskeliv. Hver etiket her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en etiket optjenes: afsnittet Evidence i README'en).

seg-debc2f07db78 = true

seg-8784979d6569 = dBW

seg-dfe78b9d0811 = GHz

seg-37d16b499bc5 = dB

seg-0f4c2ab525ac = <b>MODELLED</b> Downlink Es/N0 langs hver passage af én satellit over én station (EIRP, tab i frit rum, atmosfærisk tab efter cosecant-loven, andre tab, G/T, Boltzmanns konstant, symbolrate), den mest effektive DVB-S2 MODCOD, der klarer sin ETSI EN { "302" } 307-

seg-c246881f6fd4 = <b>VALIDATED</b> Synlighedsoverflyvninger (AOS, TCA, LOS, maksimal tilsyneladende elevation, varighed) af et SGP4-elementsæt over en WGS-84-station på den validerede jordbanesti (IAU { "2006" }. Uafhængig reference (ExternalDataset): Orekit { "13.1.8" } (CS GROUP, Apache-2.0) med Hipparchus { "4.0.3" }: TLEPropagator på de samme elementsæt i en TEME, som Orekit bygger efter den angivne definition (dens IERS { "2010" } TOD roteret med GAST - GMST), ElevationDetector og ElevationExtremumDetector med og uden ITURP834AtmosphericRefraction, og AngularAzEl med AngularRadioRefractionModifier for tilfældet med lystid, hvor skæringer og maksimum løses af Hipparchus; { "60" } tilfælde (f

seg-35588ca8e9bb = <b>MODELLED</b> Downlink-Es/N0 langs hver overflyvning af én satellit over én station (EIRP, frirumstab, atmosfærisk tab efter cosecant-loven, øvrige tab, G/T, Boltzmanns konstant,. Uafhængig reference (InternalConsistency): Intern konsistens: den spektrale effektivitet, beregnet på lukket form ud fra Table 5a K_bch og rammelængderne, stemmer med de effektiviteter, som Table { "13" } angiver (en transskriptionskontrol af tærskeltabellen); linkbudgettets dele stemmer med deres lukkede former; valget er monotont i Es/N0 og overholder marginen; ACM flytter mindst konstantkodningens volumen. Overflyvningsgeometrien kommer fra den separat VALIDATED a

seg-cd04f5662884 = MODELLED. (typekatalog (<c1/>))

seg-7f8667e8d8fe = DVB-S2 adaptiv kodning og modulation langs en LEO-downlink-overflyvning er MODELLED, ikke valideret: kontrolleret mod sin egen lukkede/analytiske identitet — fanger transskriptions- og koefficientfejl, men er ikke en ekstern uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-8f1e7d3f5a07 = Familieside: <a1>Missionsanalyse, links og rumoperationer</a1>

seg-72fd0321e4af = Emneside: <a1>CONTACT-SCHEDULING.md</a1>

seg-b79fcddea1d6 = Kilde: <c1/>

seg-040d160b3fdd = <c1/> (scenarietype)

seg-be4e928a5865 = Planlægning af jordkontakter for flere satellitter over flere stationer: tilsyneladende adgangsvinduer (SGP4, IAU 2006/2000A jordfast system, ITU-R P.834-refraktion, lystid), DVB-S2-ACM-datavolumen for hver overflyvning (tærskler i ETSI EN { "302" } 307-1 Table { "13" }) og en konfliktfri plan (én satellit pr. antenne med en omstillingstid, én station pr. satellit, prioritetsvægtet levering begrænset til hvert efterslæb) ved en grådig metode med marginalværdi, en først-til-mølle-baseline og en eksakt branch and bound på små mængder, med den grådige metodes optimalitetsgab. MODELLED.

seg-7a3fad06a9fc = Én kørsel af <c1/> opsummeres som: contact-schedule: { "3" } satellitter x { "3" } stationer over { "12" } h -> { "31" } kandidatkontakter, { "22" } planlagt; { "797266" } af { "860000" } Mbit leveret (MODELLED)

seg-a03d83f5866a = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-5ba0968796ac = Eksemplet <c1/> angiver blandt andet:

seg-cade59b5a371 = Resultatmærkat (motorens egen): MODELLED — kontaktplan for flere satellitter og flere stationer: tilsyneladende adgangsvinduer (SGP4, IAU 2006/2000A, ITU-R P.834-refraktion, lystid), DVB-S2-ACM-datavolumen pr. overflyvning ud fra et linkbudget ved klar himmel (tærskler i ETSI EN { "302" } 307-1 Table { "13" }) og konfliktløsning (én satellit pr. antenne med tu

seg-e26b549579e2 = Diagrammet, som motoren skriver for scenarios/contact-schedule.toml, type contact-schedule

seg-036b708ed2b9 = <b>MODELLED</b> Kandidatkontakter fra hver overflyvning mellem satellit og station med dens ACM-datavolumen; konflikter, hvor én antenne ville betjene to satellitter inden for sin omstillingstid, eller hvor én satellit ville downlinke til to stationer samtidig; en prioritetsvægtet leveri

seg-60431931082a = <b>MODELLED</b> Kandidatkontakter fra hver overflyvning mellem satellit og station med dens ACM-datavolumen; konflikter, hvor én antenne ville betjene to satellitter inden for sin omstillingstid, eller hvor én o. Uafhængig reference (InternalConsistency): Intern konsistens: den eksakte branch and bound stemmer med brute-force-optælling på små tilfældige mængder, hver plan kontrolleres at være mulig mod konfliktreglerne, og den grådige metode slår aldrig det eksakte optimum. HVAD DER IKKE ER: ingen ekstern planlægger eller operativ plan er sammenlignet; kontakter tages hele (ingen opdeling), efterslæbet er fast ved vinduets start, slewtid ud over den faste omstillingstid og onboard s

seg-9941b9f6d4a8 = MODELLED — kontaktplan for flere satellitter og flere stationer: tilsyneladende adgangsvinduer (SGP4, IAU 2006/2000A, ITU-R P.834-refraktion, lystid), DVB-S2-ACM-datavolumen pr. overflyvning ud fra et linkbudget ved klar himmel (tærskler i ETSI EN { "302" } 307-1 Table { "13" }) og konfliktløsning (én satellit pr. antenne med omstillingstid, én station pr. satellit) ved en grådig metode med marginalværdi kontrolleret mod en eksakt branch and bound; intet regnfald, (resultat <c1/>)

seg-f8ef88bc82b5 = Hvert tal nedenfor er ILLUSTRATIVE: ingen operatørs baner, stationer eller linkbudget. MODELLED: planlæggeren kontrolleres mod sin egen eksakte løser, ikke et eksternt værktøj. (kommentar i scenariefilen, linje { "11" } til { "12" })

seg-fe2b4799b397 = Planlægning af jordkontakter for flere satellitter og flere stationer med konfliktløsning er MODELLED, ikke valideret: kontrolleret mod sin egen lukkede/analytiske identitet — fanger transskriptions- og koefficientfejl, men er ikke en ekstern uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-be14d99cb86d = <s1>Forrige</s1>constellation-design

seg-3784be57d6df = <s1>Næste</s1>earth-gnss-lunar
