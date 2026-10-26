# docs--kind-acm-link: translations (da)

seg-a686bcdc6cc9 = Kilde: <c1/>

seg-a53e57719a74 = <c1/> (scenarietype)

seg-99ef7c1d552c = Scenarietype i motoren v{ $version }, familien <a1>Missionsanalyse, forbindelser og rumoperationer</a1>. Vejledende: analyseoutput fra et forsknings- og udviklingsværktøj, ikke typegodkendt navigationsudstyr og ikke en tjeneste til beskyttelse af menneskeliv. Hver etiket her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en etiket optjenes: afsnittet Evidence i README'en).

seg-cb9447893c7f = Én satellit over én station: hver passages skrå afstand, elevation og Es/N0 langs passagen, den DVB-S2 MODCOD, der vælges i hvert trin (tærskler fra ETSI EN { "302" } 307-1 Table { "13" } plus en implementeringsmargin), og den datamængde, ACM flytter, mod baseline med konstant kodning, der lukker ved masken. MODELLED.

seg-1ab30ff9616a = Én kørsel af <c1/> opsummeres som: acm-link: { "3" } pass(es); ACM { "92866" } Mbit vs CCM 8PSK 3/4 { "58495" } Mbit -> gain x1.59 (MODELLED)

seg-54e2159e532d = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-c7d1b4b1f247 = Eksemplet <c1/> sætter blandt andet:

seg-debc2f07db78 = true

seg-8784979d6569 = dBW

seg-dfe78b9d0811 = GHz

seg-37d16b499bc5 = dB

seg-b77b8420b4f5 = Mbit

seg-37d29d8303fe = km

seg-eeaa777e4301 = 8PSK 3/4

seg-d62795b9fdc0 = Resultatetiket (motorens): MODELLED — DVB-S2 adaptiv kodning og modulation over passagerne af én satellit ved én station: Es/N0 ved klar himmel langs hver tilsyneladende passage, den mest effektive MODCOD, der klarer sin tærskel i ETSI EN { "302" } 307-1 Table { "13" } plus en margin, mod den MODCOD med konstant kodning, der lukker ved masken; ingen regn f

seg-046f69293874 = Diagrammet, som motoren skriver for scenarios/acm-link.toml, typen acm-link

seg-0f4c2ab525ac = <b>MODELLED</b> Downlink Es/N0 langs hver passage af én satellit over én station (EIRP, tab i frit rum, atmosfærisk tab efter cosecant-loven, andre tab, G/T, Boltzmanns konstant, symbolrate), den mest effektive DVB-S2 MODCOD, der klarer sin ETSI EN { "302" } 307-

seg-c246881f6fd4 = <b>VALIDATED</b> Synlighedsoverflyvninger (AOS, TCA, LOS, maksimal tilsyneladende elevation, varighed) af et SGP4-elementsæt over en WGS-84-station på den validerede jordbanesti (IAU { "2006" }. Uafhængig reference (ExternalDataset): Orekit { "13.1.8" } (CS GROUP, Apache-2.0) med Hipparchus { "4.0.3" }: TLEPropagator på de samme elementsæt i en TEME, som Orekit bygger efter den angivne definition (dens IERS { "2010" } TOD roteret med GAST - GMST), ElevationDetector og ElevationExtremumDetector med og uden ITURP834AtmosphericRefraction, og AngularAzEl med AngularRadioRefractionModifier for tilfældet med lystid, hvor skæringer og maksimum løses af Hipparchus; { "60" } tilfælde (f

seg-35588ca8e9bb = <b>MODELLED</b> Downlink-Es/N0 langs hver overflyvning af én satellit over én station (EIRP, frirumstab, atmosfærisk tab efter cosecant-loven, øvrige tab, G/T, Boltzmanns konstant,. Uafhængig reference (InternalConsistency): Intern konsistens: den spektrale effektivitet, beregnet på lukket form ud fra Table 5a K_bch og rammelængderne, stemmer med de effektiviteter, som Table { "13" } angiver (en transskriptionskontrol af tærskeltabellen); linkbudgettets dele stemmer med deres lukkede former; valget er monotont i Es/N0 og overholder marginen; ACM flytter mindst konstantkodningens volumen. Overflyvningsgeometrien kommer fra den separat VALIDATED a

seg-02e9f2e87410 = MODELLED — DVB-S2 adaptiv kodning og modulation over én satellits overflyvninger ved én station: Es/N0 ved klar himmel langs hver tilsyneladende overflyvning, den mest effektive MODCOD, der overstiger tærsklen i ETSI EN { "302" } 307-1 Table { "13" } plus en margin, sammenholdt med den MODCOD med konstant kodning, der lukker ved masken; intet regnfald og intet pegetab langs overflyvningen (resultat <c1/>)

seg-cd04f5662884 = MODELLED. (typekatalog (<c1/>))

seg-a2cdc7dff1e3 = Hvert tal nedenfor er ILLUSTRATIVE: ingen operatørs bane, station eller linkbudget. MODELLED. (kommentar i scenariefilen, linje { "8" })

seg-7f8667e8d8fe = DVB-S2 adaptiv kodning og modulation langs en LEO-downlink-overflyvning er MODELLED, ikke valideret: kontrolleret mod sin egen lukkede/analytiske identitet — fanger transskriptions- og koefficientfejl, men er ikke en ekstern uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-8f1e7d3f5a07 = Familieside: <a1>Missionsanalyse, links og rumoperationer</a1>

seg-72fd0321e4af = Emneside: <a1>CONTACT-SCHEDULING.md</a1>

seg-1f67ae89028b = <s1>Næste</s1>aocs
