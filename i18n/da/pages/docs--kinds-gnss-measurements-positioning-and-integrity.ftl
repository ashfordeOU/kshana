# docs--kinds-gnss-measurements-positioning-and-integrity: translations (da)

seg-6e0cb6acc073 = VALIDATED

seg-b03d56f501c3 = Type

seg-06197409c717 = Publicerede ARAIM-certificeringsreferencevektorer: motorens horisontale og vertikale ARAIM-beskyttelsesniveauer kørt mod ARAIM Technical Subgroups under WG-C EGNE gennemregnede taleksempler, ved den tolerance (TOL_PL = { "5e-2" } m), som disse dokumenter selv angiver. To vektorer er indlagt som fixtures, hver med sin hentnings-URL, hentningsdato, SHA-256 for kildefilen og side: Reference Airborne Algorithm Description Document v3.1 ({ "2019" }) Appendix D — selvkonsistent, og accept-vektoren — og Milestone { "3" } Report ({ "2016" }) Annex A section A.IX, den fremstilling, som forskningsbibliografierne citerer. Hvert publiceret input (geometrimatrixen med 10 satellitter og 2 konstellationer, diagonalerne for C_int- og C_acc-varianserne, b_nom, P_sat, P_const og LPV-200-konstantsættet) og hvert publiceret output (VPL, HPL, EMT, sigma_v_acc, K_fa_3 og de to konstellationsfejltilstandes sigma_3, sigma_ss_3 og b_3) rapporteres ved siden af motorens eget tal og deres absolutte forskel. Beskyttelsesniveauligningen løses IKKE påny her: referencens tilstandsliste overdrages til motorens eksisterende raim::araim_protection_level / araim_integrity_risk, så bisektionen og den gaussiske haleagebra, der afprøves, er motorens egne; kun geometrien, delløsningerne, detektionstærsklerne og den publicerede budgetfordeling er bygget til den. EKSTERNT KONTROLLERET mod { "2019" }-vektoren: VPL { "18.2926" } m mod { "18.3" } m publiceret, HPL { "13.4063" } m mod { "13.45" } m, EMT { "7.2997" } m mod { "7.2998" } m, sigma_v_acc { "1.3694" } m mod { "1.3694" } m, og alle seks publicerede mellemresultater inden for en halv enhed i deres sidste trykte decimal. { "2016" }-vektoren har to interne fejl, som rapporten angiver i stedet for at skjule — en fortegnsfejl i række { "3" } af G og et K_fa_3 evalueret ved { "57" } fejltilstande, mens dokumentet angiver N_fault_max = { "1" } ({ "12" } tilstande) — så dens geometriske mellemresultater gengives præcist, mens dens beskyttelsesniveauer rapporteres som målte afvigelser og holdes uden for accepttallet; tolerancen udvides aldrig for at rumme dem. Hvert udsendt numerisk felt har en enhed og en proveniensklasse, og et overført tal mærkes <c1/>, så det aldrig kan forveksles med et beregnet. AFGRÆNSNING: kun N_fault_max = { "1" } (fejltilstande for enkeltsatellit og enkeltkonstellation) er implementeret, og et tilfælde, hvis priors kræver samtidige fejldelmængder med flere hændelser, bliver REFUSED i stedet for at blive afkortet i stilhed; fejldetektion, udelukkelse, chi-i-anden-konsistenskontrollen og omfordelingstrinnet mod dobbelttælling i referencealgoritmen er uden for omfanget. Dette gengiver et publiceret referencealgoritme-eksempel — det er ikke en certificering, en luftdygtighedsartefakt eller en godkendelse.

seg-693c823c85d1 = Diagrammet, som motoren skriver for scenarios/araim-reference-check.toml, type araim-reference-check

seg-2ffccc9c1eff = Pseudoafstandssimulering i måledomænet (Klobuchar-iono, Saastamoinen/Niell-tropo) + RAIM.

seg-47ee40d4eb73 = Diagrammet, som motoren skriver for scenarios/gnss-sim-raim.toml, scenarietype gnss-sim

seg-eb7e0c2feb2b = Snapshot-/løsningsseparations-/ARAIM-RAIM med HPL/VPL og et Stanford-diagram.

seg-ce7f6130ddee = Diagrammet, som motoren skriver for scenarios/integrity-raim.toml, scenarietype integrity

seg-b7b67e03f125 = Positionsbestemmelse med ét punkt ud fra reelle observationer: bestem en modtagers position ud fra en RINEX { "3" }-observationsfil og en fil med broadcast-navigation (kodepseudoafstande, broadcast-efemeride, Klobuchar-ionosfære, Saastamoinen/Niell-troposfære), eventuelt valideret mod en opmålt koordinat.

seg-d76d59644d84 = Diagrammet, som motoren skriver for scenarios/pvt-abmf.toml, type pvt

seg-edfcb546d9de = Budget for forudsigelse af månens referencesystem og jordens orientering i realtid: P4 Tabel { "1" } (kontrollen af konsistens for referencesystemets fejl — efterbehandlet ~{ "0.27" } m ↔ ~{ "0.010" } ms og realtid ~{ "15" } m ↔ ~{ "0.5" } ms, hver position i referencesystemet udtrykt som dens tilsvarende UT1-fejl via momentarmen L19 Δr = D_EM·ω⊕·ΔUT1) og Tabel { "2" } (målt UT1-forudsigelsesfejl mod horisont — kurven L18 aflæst direkte fra den reelle IERS finals2000A-serie: det endelige gulv Bulletin A − Bulletin B og fejlen for prædiktoren med persistens over flere dage, hver afbildet på en position i månens referencesystem ved L19), plus det kvadratisk summerede (root-sum-square) fejlbudget L21 for referencesystemet i realtid (EOP + efemeride + gulv for realisering). VALIDATED lukket form (momentarmen L19, ω⊕ krydskontrolleret mod CIO-jordrotationsvinklen) og VALIDATED reelle data (kurven L18 aflæst fra de reelle rækker i finals2000A); MODELLED er størrelserne på kovariansen for banebestemmelse (OD) af månerelæet og gulvet for realisering af referencesystemet (repræsentative tildelinger) og prædiktoren med persistens (ikke IERS' operationelle algoritme for Bulletin A). Ikke et certificeret produkt til referencesystem i realtid.

seg-2721ed7727bb = Diagrammet, som motoren skriver for scenarios/realtime-frame-eop.toml, type realtime-frame-eop

seg-5f25c5b71f0c = Model af rumvejrsmiljøet: indekser for solaktivitet (F10.7/F10.7a) og geomagnetisk aktivitet (Kp, med den definitoriske tabel Kp↔ap), den eksosfæriske temperatur efter Jacchia-1971, som de driver (valideret mod offentliggjort solminimum/middel/solmaksimum), og den termosfæriske neutrale tæthed efter Jacchia-1971 ved den eksosfæriske middeltemperatur over døgnet mod den aktivitetsfrie statiske profil ved et sæt højder — den afhængighed af solcyklussen i tætheden, som den statiske atmosfære udelader. MODELLED: tætheden stemmer med accelerometerafledte tætheder (TOLEOS CHAMP og GRACE) inden for en faktor { "2" } ved solmaksimum, men er omkring 1.7x for høj i solminimum { "2008" }.

seg-c1c6f2f73fb5 = Diagrammet, som motoren skriver for scenarios/space-weather.toml, type space-weather

seg-4e31c8daf798 = Register

seg-d1c67e3dd12e = MODELLED { "1" } · VALIDATED { "2" }

seg-c9cf40c5e609 = Kilde: <c1/>

seg-569fac649b5d = GNSS-målinger, positionering og integritet (scenarietypefamilie)

seg-63c3a7483268 = { "6" } scenarietyper i motoren v{ $version }. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en safety-of-life-tjeneste. Hver betegnelse her er motorens eller verifikationsmatricens; en type er MODELLED, medmindre matricen angiver andet (hvordan en betegnelse opnås: afsnittet Evidens i README).

seg-33a602147cc2 = Emnesider: <a1>INTEGRITY</a1>, <a2>POSITIONING</a2>, <a3>ARAIM_REFERENCE</a3>, <a4>OSNMA</a4>. Kør én: <c1/>. Alle familier: <a5>KINDS.md</a5>.

seg-9c60c8803b6b = Kontaktark med de diagrammer, som motoren skriver for typerne i familien GNSS-målinger, positionering og integritet

seg-045ecd7c036f = MODELLED { "6" } · VALIDATED { "4" }

seg-6698e12e148b = Enkeltpunktspositionering ud fra reelle observationer: løs en modtagers position ud fra en RINEX { "3" }-observationsfil og en broadcast-navigationsfil (kodepseudoafstande, broadcast-efemeride, Klobuchar-iono, Saastamo

seg-da89c260b1a3 = Offentliggjorte ARAIM-referencevektorer til certificering: motorens ARAIM-beskyttelsesniveauer, horisontalt og vertikalt, kørt mod ARAIM Technical Subgroups under WG-C EGNE gennemregnede numeriske eksempler, ved tolerancen

seg-7a750a89c9c4 = Rumvejrsmiljømodel: sol- (F10.7/F10.7a) og geomagnetiske (Kp, med den definitoriske Kp↔ap-tabel) aktivitetsindeks, den eksosfæriske Jacchia-1971-temperatur, de driver (valideret mod publiceret

seg-d79d4d58275b = Budget for realtidsprædiktion af månens referencesystem/jordorientering: P4 Table { "1" } (konsistenskontrollen af systemfejl — efterbehandlet ~{ "0.27" } m ↔ ~{ "0.010" } ms og realtid ~{ "15" } m ↔ ~{ "0.5" } ms, hver systemposition udtrykt

seg-dc783268156c = Obligatoriske felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>. Valgfrie: <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>.

seg-7b110aacdb27 = <b>Register:</b> MODELLED { "6" } · VALIDATED { "4" }. Fuld side med input, resultater, evidens og begrænsninger: <a1>integrity</a1>.

seg-d444fb35cae9 = Obligatoriske felter: <c1/>, <c2/>, <c3/>, <c4/>. Valgfrie: <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>.

seg-b651ec58bcba = <b>Register:</b> VALIDATED. Fuld side med input, resultater, evidens og begrænsninger: <a1>gnss-sim</a1>.

seg-b9a21187317d = Obligatoriske felter: <c1/>, <c2/>. Valgfrie: <c3/>, <c4/>, <c5/>, <c6/>.

seg-143dc4fd1d44 = <b>Register:</b> MODELLED. Fuld side med input, resultater, evidens og begrænsninger: <a1>pvt</a1>.

seg-9ca1f6783e8e = Obligatoriske felter: ingen. Valgfrie: <c1/>.

seg-415f1fa78518 = <b>Register:</b> VALIDATED. Fuld side med input, resultater, evidens og begrænsninger: <a1>araim-reference-check</a1>.

seg-6c4655b35c65 = Obligatoriske felter: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>.

seg-1e5052c0bce7 = <b>Register:</b> MODELLED. Fuld side med input, resultater, evidens og begrænsninger: <a1>space-weather</a1>.

seg-64c512530ee6 = Obligatoriske felter: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>.

seg-1c244958d3c4 = <b>Register:</b> MODELLED { "1" } · VALIDATED { "2" }. Fuld side med input, resultater, evidens og begrænsninger: <a1>realtime-frame-eop</a1>.

seg-d4adf4283480 = <s1>Forrige</s1>Konstellationer dækning og geometri

seg-2cdfd7f8bfb3 = <s1>Næste</s1>GPS-nægtet alternativ PNT
