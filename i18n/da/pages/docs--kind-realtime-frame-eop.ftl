# docs--kind-realtime-frame-eop: translations (da)

seg-8e845ce908ee = Scenarietype i motoren v{ $version }, familie <a1>GNSS-målinger, positionsbestemmelse og integritet</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: README'ens afsnit Evidence).

seg-f6b7ca020692 = Familieside: <a1>GNSS-målinger, positionsbestemmelse og integritet</a1>

seg-a2889fb2b42a = Emneside: <a1>integrations.md</a1>

seg-1ad013ffb9d1 = Kilde: <c1/>

seg-54620502f0dd = <c1/> (scenarietype)

seg-edfcb546d9de = Budget for forudsigelse af månens referencesystem og jordens orientering i realtid: P4 Tabel { "1" } (kontrollen af konsistens for referencesystemets fejl — efterbehandlet ~{ "0.27" } m ↔ ~{ "0.010" } ms og realtid ~{ "15" } m ↔ ~{ "0.5" } ms, hver position i referencesystemet udtrykt som dens tilsvarende UT1-fejl via momentarmen L19 Δr = D_EM·ω⊕·ΔUT1) og Tabel { "2" } (målt UT1-forudsigelsesfejl mod horisont — kurven L18 aflæst direkte fra den reelle IERS finals2000A-serie: det endelige gulv Bulletin A − Bulletin B og fejlen for prædiktoren med persistens over flere dage, hver afbildet på en position i månens referencesystem ved L19), plus det kvadratisk summerede (root-sum-square) fejlbudget L21 for referencesystemet i realtid (EOP + efemeride + gulv for realisering). VALIDATED lukket form (momentarmen L19, ω⊕ krydskontrolleret mod CIO-jordrotationsvinklen) og VALIDATED reelle data (kurven L18 aflæst fra de reelle rækker i finals2000A); MODELLED er størrelserne på kovariansen for banebestemmelse (OD) af månerelæet og gulvet for realisering af referencesystemet (repræsentative tildelinger) og prædiktoren med persistens (ikke IERS' operationelle algoritme for Bulletin A). Ikke et certificeret produkt til referencesystem i realtid.

seg-488039e4240f = Én kørsel af <c1/> opsummeres som: realtime-frame-eop | Tabel { "1" }: efterbehandlet { "0.27" } m ({ "0.0096" } ms UT1) ↔ realtid { "14.4" } m ({ "0.514" } ms UT1) | Tabel { "2" }: endeligt gulv { "0.0171" } ms → 3 dage { "1.6644" } ms | samlet budget { "20.1" } m ({ "67.0" } ns) | momentarm L19 + reelle data L18 (valideret), OD-kovarians (modelleret)

seg-66264ec78a4c = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>

seg-45a4ed476311 = Eksemplet <c1/> angiver blandt andet:

seg-c39a26aa1f1e = medfølgende fixture finals2000A_20260930

seg-9ef8a2b4c144 = Resultatetiket (motorens egen): Budget for forudsigelse af månens referencesystem og jordens orientering i realtid. VALIDATED lukket form: momentarmen L19 ({ "1" } ms ↔ { "28.03" } m ↔ { "93.5" } ns), ω⊕ krydskontrolleret mod CIO-jordrotationsvinklen. VALIDATED reelle data: kurverne L18 for forudsigelsesfejl i UT1 og polbevægelse aflæst direkte fra den reelle IERS finals200

seg-2721ed7727bb = Diagrammet, som motoren skriver for scenarios/realtime-frame-eop.toml, type realtime-frame-eop

seg-72a1fc2f5c90 = <b>VALIDATED</b> Én tabel rapporterer UT1-forudsigelsesfejlen, polfejlen ved polbevægelsen og deres kvadratiske kombination ved månen over et IDENTISK epokesæt pr. horisont og udsender de epoker, hver komponent blev målt ved. Tests: <a1>embedded_eop_vintage_astropy_preregistered.rs</a1>.

seg-b1d90bf98ac3 = <b>VALIDATED</b> Standarden for <c1/> i køretiden er bibliotekets egen indlejrede kopi af et ordret udtræk fra IERS finals2000A (tools/finals2000A_20260930.txt: { "174" } på hinanden følgende daglige rækker, MJD 61224-61397, skåret ud af finals2000A.all fra 2026-09-30) bærer Tests: <a1>operational_eop_predictor_reference.rs</a1>.

seg-0298bd40d72f = <b>MODELLED</b> En tilpasning med mindste kvadrater af bias plus rate over et bagudgående vindue plus de vigtigste periodiske led — årlig, halvårlig og de to vigtigste zonale tidevand for UT1; Chandler, årlig og halvårlig for polen — ekstrapoleret med den sidste i vindue Tests: <a1>operational_eop_predictor_reference.rs</a1>.

seg-12efcd20ca62 = <b>VALIDATED</b> Én tabel rapporterer UT1-forudsigelsesfejlen, polfejlen ved polbevægelsen og deres kvadratiske kombination ved månen over et IDENTISK epokesæt pr. horisont, udsend. Uafhængig reference (ExternalDataset): astropy { "8.0.1" } utils.iers (BSD-3) læser IERS-produktet finals2000A med sin egen regel Bulletin B ellers A, og pyerfa { "2.0.1.5" } (SOFA) fulde rotationer fra himmelsk til terrestrisk (c2i06a, sp00, pom00, c2tcio; jordrotationsvinklen efter IERS { "2010" } ligning { "5.15" } i eksakt aritmetik), kørt som separate programmer på ordrette rækker fra den frosne finals2000A.all fra 2026-09-30; præregistreret (455b8fb5) med ændringerne A1 og A2, der kun fastlægger

seg-020e5919c8fd = <b>VALIDATED</b> Standarden for <c1/> i køretiden er bibliotekets egen indlejrede kopi af et ordret udtræk fra IERS finals2000A (tools/finals2000A_20260930.txt: { "174" } på hinanden følgende. Uafhængig reference (ExternalDataset): astropy { "8.0.1" } astropy.utils.iers.IERS_A (BSD-3-Clause), der læser de samme bytes med sin egen læser, og tabellen i IERS Bulletin A Vol. XXXIX nr. { "039" }, kopieret tal for tal; præregistreret (6fdae01b) med seks eksakte kriterier, før astropy blev kørt. Alle seks gælder: { "30" } endelige, { "54" } hurtige og { "90" } forudsagte rækker med lige MJD-lister, hver forudsagt række med flag P, optællingen af standardkørslen ens, og forudsigelserne ens med Bullet

seg-530c87bbff78 = <b>MODELLED</b> En tilpasning med mindste kvadrater af bias plus rate over et bagudgående vindue plus de vigtigste periodiske led — årlig, halvårlig og de to vigtigste zonale tidevand for UT1; Cha. Uafhængig reference (ReferenceImpl): tre uafhængige veje, ingen af dem et offentliggjort tal for forudsigelsesnøjagtighed. ({ "1" }) Et analytisk signal med kendte koefficienter — den eneste måde at afprøve det periodiske maskineri på, da ingen indsendt serie er lang nok til at tillade et årligt led. ({ "2" }) Lærebogens løsning med mindste kvadrater i lukket form, anden algebra end den matrixløsning, der afprøves, på reelle rækker. ({ "3" }) De ægte arkiverede forudsigelsesrækker fra Bulletin A, som

seg-a233df86be95 = Budget for forudsigelse af månens referencesystem og jordens orientering i realtid. VALIDATED lukket form: momentarmen L19 ({ "1" } ms ↔ { "28.03" } m ↔ { "93.5" } ns), ω⊕ krydskontrolleret mod CIO-jordrotationsvinklen. VALIDATED reelle data: kurverne L18 for forudsigelsesfejl i UT1 og polbevægelse aflæst direkte fra den reelle IERS finals2000A-serie (Bulletin A hurtig mod Bulletin B endelig og persistens over flere dage på de reelle daglige rækker). AFLEDT: referencesystemet (resultat <c1/>)

seg-60e7ee7e6e3e = VALIDATED lukket form (momentarmen L19, ω⊕ krydskontrolleret mod CIO-jordrotationsvinklen) og VALIDATED reelle data (kurven L18 aflæst fra de reelle rækker i finals2000A); MODELLED er størrelserne på kovariansen for banebestemmelse (OD) af månerelæet og gulvet for realisering af referencesystemet (repræsentative tildelinger) og prædiktoren med persistens (ikke IERS' operationelle algoritme for Bulletin A). (typekatalog (<c1/>))

seg-ddf4702f78e5 = Ærlighed: VALIDATED lukket form (momentarmen L19, omega_earth krydskontrolleret mod CIO-jordrotationsvinklen) og VALIDATED reelle data (kurverne L18 for UT1 og polbevægelse aflæst fra de reelle rækker i finals2000A). AFLEDT gulv for realisering af referencesystemet (Helmert-residualet efter tilpasning). MODELLED er størrelserne på kovariansen for banebestemmelse (OD) af månerelæet ({ "0.27" } m efterbehandlet, ~{ "14.4" } m i realtid ved én times latens — en rund, ikke tilbageregnet, tildeling (kommentar i scenariefilen, linje { "27" } til { "32" })

seg-bc51b666d070 = Fejl i operationel forudsigelse af jordens orientering, målt forudsagt mod endelig, er MODELLED, ikke valideret: kontrolleret mod en separat implementering i den samme kodebase — uafhængig af den enhed, der afprøves, men ikke eksternt autoritativ. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-653fad5e0afe = <s1>Forrige</s1>quantum-trade

seg-5abe534d4ef1 = <s1>Næste</s1>reentry
