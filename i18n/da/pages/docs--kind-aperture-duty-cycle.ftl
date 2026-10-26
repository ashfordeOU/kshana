# docs--kind-aperture-duty-cycle: translations (da)

seg-99ef7c1d552c = Scenarietype i motoren v{ $version }, familien <a1>Missionsanalyse, forbindelser og rumoperationer</a1>. Vejledende: analyseoutput fra et forsknings- og udviklingsværktøj, ikke typegodkendt navigationsudstyr og ikke en tjeneste til beskyttelse af menneskeliv. Hver etiket her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en etiket optjenes: afsnittet Evidence i README'en).

seg-8f1e7d3f5a07 = Familieside: <a1>Missionsanalyse, links og rumoperationer</a1>

seg-4b695c0dfc9f = Kilde: <c1/>

seg-632c0a545845 = <c1/> (scenarietype)

seg-0cef33b41040 = Aperturens driftscyklus: den tidsfordeling mellem navigation og kommunikation, som en kontaktplan medfører for en pulje af styrbare aperturer. Tager en kontaktplan (en liste af aos_s/los_s-vinduer i <c1/>, der hver beder om navigation eller kommunikation — det samme aos_s/los_s-ordforråd, som prædiktoren <c2/> udsender), et antal aperturer og en ARBITRERINGSPOLITIK (navigationsprioritet som standard, eller kommunikationsprioritet, eller ikke-præemptiv først til mølle), og rapporterer navigationsdriften, kommunikationsdriften, tomgangsdriften og udfaldet pr. session — den kontakttid, en session bad om, og som ingen apertur dækkede. Et præcist intervalsweep over vinduesgrænserne, så vinduer, der blot berører hinanden, aldrig konkurrerer, og ingen aperturssekunder tælles dobbelt; navigations-, kommunikations- og tomgangsaperturssekunder akkumuleres uafhængigt og lukker mod apertures*horizon_s. Rapporten angiver den opløste politik, dens fulde definition samt definitionerne af drift og udfald, fordi et driftstal, der angives uden sin arbiteringspolitik, ikke kan reproduceres. MODELLED planlægningsaritmetik: der regnes ingen tid for slew / omstilling / skift, når en apertur skifter tjeneste eller session, intet datavolumen, ingen bufferstatus, intet energibudget og ingen linklukning indgår i beslutningen, og kontaktvinduerne er input — deres geometri er det, der frembragte dem. Ikke et planlægningsprodukt til jordsegmentet.

seg-a8d79b8a96bc = Én kørsel af <c1/> opsummeres som: aperture-duty-cycle: { "6" } session(er) på { "2" } apertur(er) under navigationsprioritet -> navigationsdrift { "0.1167" }, kommunikationsdrift { "0.2667" }, tomgang { "0.6167" }; { "0" } s af { "6900" } s anmodet tabt til konkurrence (MODELLED)

seg-67c665d5c8c0 = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

seg-60f25ccdab6e = Eksemplet <c1/> angiver blandt andet:

seg-bf51947657c0 = navigation

seg-b4ff1d640bdf = kommunikation

seg-2e78730d0737 = aperture*s

seg-330cbcd04718 = brøkdel (dimensionsløs)

seg-0ef5875db338 = Resultatmærkat (motorens egen): MODELLED — aperturplanlægningsaritmetik over en leveret kontaktplan: et præcist intervalsweep af tidsfordelingen mellem navigation og kommunikation og af konkurrencetabet pr. session under en navngiven arbiteringspolitik. Der regnes ingen tid for slew / omstilling / skift, når en apertur skifter tjeneste eller session,

seg-a8b38ed8e029 = Diagrammet, som motoren skriver for scenarios/aperture-duty-cycle.toml, type aperture-duty-cycle

seg-4636d450ef60 = <b>MODELLED</b> Én kørsel tager en kontaktplan (en liste af aos_s/los_s-vinduer, der hver beder aperturen om navigation eller kommunikation — det samme vinduesordforråd, som <c1/> udsender, konverteret af <c2/>), en apert

seg-7a5aa78533d3 = <b>MODELLED</b> Én kørsel tager en kontaktplan (en liste af aos_s/los_s-vinduer, der hver beder aperturen om navigation eller kommunikation — det samme vinduesordforråd som `passes::pre. Uafhængig reference (InternalConsistency): Intern konsistens, ud fra tre størrelser beregnet med forskellige udtryk i det samme sweep og derefter krævet at lukke. Navigationsaperturssekunder, kommunikationsaperturssekunder og tomgangsaperturssekunder akkumuleres hver for sig — tomgang ud fra (apertures − |served|) pr. elementært interval, aldrig som en rest — og deres sum kontrolleres mod apertures × horizon_s, hvilket en forkert afgrænset grænse, en dobbelt-c

seg-a388c24fec99 = MODELLED — aperturplanlægningsaritmetik over en leveret kontaktplan: et præcist intervalsweep af tidsfordelingen mellem navigation og kommunikation og af konkurrencetabet pr. session under en navngiven arbiteringspolitik. Der regnes ingen tid for slew / omstilling / skift, når en apertur skifter tjeneste eller session, intet datavolumen, ingen bufferstatus, intet energibudget og ingen linklukning indgår i beslutningen, og kontaktvinduerne er input — th (resultat <c1/>)

seg-e689f30b268a = MODELLED planlægningsaritmetik: der regnes ingen tid for slew / omstilling / skift, når en apertur skifter tjeneste eller session, intet datavolumen, ingen bufferstatus, intet energibudget og ingen linklukning indgår i beslutningen, og kontaktvinduerne er input — deres geometri er det, der frembragte dem. (typekatalog (<c1/>))

seg-4aa40af30bd2 = ÆRLIG AFGRÆNSNING: MODELLED planlægningsaritmetik over de leverede vinduer. Der regnes ingen tid for slew / omstilling / skift, når en apertur skifter tjeneste eller session; intet datavolumen, ingen bufferstatus, intet energibudget og ingen linklukning indgår i beslutningen; og kontaktvinduerne er input -- deres geometri er det, der frembragte dem (scenariet <c1/> udsender det samme aos_s / los_s-ordforråd). Ikke en planlægning af jordsegmentet (kommentar i scenariefilen, linje { "18" } til { "24" })

seg-0b7f8d86e5d5 = Aperturens driftscyklus mellem navigation og kommunikation er MODELLED, ikke valideret: kontrolleret mod sin egen lukkede/analytiske identitet — fanger transskriptions- og koefficientfejl, men er ikke en ekstern uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-dbbefaba93dc = <s1>Forrige</s1>aocs

seg-5b4fd889fdff = <s1>Næste</s1>araim-reference-check
