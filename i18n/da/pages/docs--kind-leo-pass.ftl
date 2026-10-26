# docs--kind-leo-pass: translations (da)

seg-ad20a7bebf23 = STL

seg-37d16b499bc5 = dB

seg-cb91473bfdda = Emneside: <a1>LEO-PNT.md</a1>

seg-49964654d5f4 = Scenarietype i motoren v{ $version }, familie <a1>Navigation i lav jordbane</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: afsnittet Evidens i README).

seg-c5478f572d21 = Familieside: <a1>Navigation i lav jordbane</a1>

seg-fad0b45fd9c2 = Kilde: <c1/>

seg-f0433f09f033 = <c1/> (scenarietype)

seg-c3861f7d717c = LEO-passage og linkbudget, bånd for bånd, til LEO-PNT (positionering, navigation og tidssynkronisering fra lav jordbane), systemagnostisk: en bruger (på jorden, til søs, i luften eller indendørs, statisk eller i bevægelse) og én eller flere LEO-satellitter ud fra en DESIGNET PASS (en cirkulær bane placeret, så brugeren ser én passage med en valgt maksimal elevation på et valgt tidspunkt, solsynkron hvis ønsket), eksplicitte ELEMENTER, en TLE (two-line element set) gennem motorens SGP4 eller en WALKER-konstellation bygget af konstellationsudformningskoden (de højeste passager rapporteres). Bånd kommer fra en navngivet forudindstilling (generisk multibånd UHF/L/S/C, generisk C-bånd, Xona Pulsar X1/X5, Iridium STL, Starlink som et signal af opportunitet kun med Doppler, CentiSpace og en valgfri Celeste IOD-forudindstilling mærket WORKSHOP) eller skrives ind i scenariet; hver forudindstilling angiver, om dens tal er PUBLIC (med URL), REPRESENTATIVE eller WORKSHOP. Pr. satellit, bånd og epoke: elevation, azimut, afstand, afstandsrate og afstandsacceleration; frirumstab; EIRP og satellitmønstrets forstærkning (isoflux, gaussisk stråle eller flad); brugerantennens forstærkning mod elevation (patch, halvkugleformet eller isotrop); gasdæmpning (ITU-R P.676-10 bilag { "2" }), regndæmpning (ITU-R P.838-3-koefficienter og P.618-14-proceduren, ud fra en regnrate og en reghøjde), troposfærisk scintillation (ITU-R P.618-14 afsnit { "2.4.1" }), indtrængningstab i bygninger for en indendørs bruger (ITU-R P.2109-2), polarisationsmismatch, systemets støjtemperatur og C/N0 (bærebølge-til-støj-tæthed); Doppler og Doppler-rate i lukket form ud fra afstandsraten og afstandsaccelerationen, hver kontrolleret mod centrale differenser; den første ordens ionosfæriske forsinkelse { "40.3" } STEC/f^{ "2" } ud fra en Klobuchar- eller vertikal-TEC-skrå TEC skaleret til den del af ionosfæren, der ligger under satellitten. Båndpar får ionosfærefri koefficienter, støjforstærkning og kodestøj ved passagens top. MEO GNSS-satellitter (Galileo- eller GPS-forudindstillinger) evalueres med den samme antenne- og støjmodel ud fra deres modtagne effekter i grænsefladedokumentet, så den klokkeformede LEO-passage og de flade GNSS-bærebølger deler ét plot. En valgfri [iot]-sektion giver tid til første positionsbestemmelse, energi pr. positionsbestemmelse og batterilevetid mod duty cycle for et angivet effektbudget for modtageren (MODELLED). Hvert båndpar giver også den skrå TEC, som dets geometrifri kombination genfinder ved toppen, og det estimats kodestøj-sigma (ionosfæresondering). En valgfri [spoofer]-sektion forfalsker signalerne fra en påstået position, der springer eller skubbes væk fra den sande efter et indsættelsestidspunkt, og kører to monitorer med angivne sandsynligheder for falsk alarm og overset detektion: Doppler- og passagegeometri-konsistens (målte afstandsrater mod dem, der forudsiges ud fra banerne og en uafhængig forudgående position og hastighed, en generaliseret mindste kvadraters chi-i-anden-test over et vindue, på GNSS-, LEO- og alle kanaler) og tværbåndskonsistens (trinnet fra epoke til epoke for hvert LEO-båndpars modelkorrigerede geometrifri kombination), der rapporterer statistikker pr. epoke og hvornår hver monitor detekterer (MODELLED). VALIDATED komponenter: frirumstab, P.838-3-koefficienterne mod dens tabel { "5" }, procedurerne for regn og scintillation i P.618-14 og indtrængningstabet i bygninger i P.2109 mod ITU-R Study Group { "3" }-valideringseksemplerne, gruppeforsinkelsesforholdet mellem IS-GPS-200 L1/L2 og den maksimale Doppler for en statisk bruger på en cirkulær bane mod arXiv { "2509.19551" } tabel { "1" }. MODELLED: EIRP'er, mønstre, Chapman-andelen af TEC under satellitten og hele passagen.

seg-04509d8245b7 = Én kørsel af <c1/> opsummeres sådan: LEO pass link budget, air user at { "50.00" }, -30.00; { "1" } LEO satellite(s), { "900" } s window Iridium-pass [iridium-stl PUBLIC]: { "781" } km, max elevation { "65.0" } deg at { "444" } s, { "750" } s above the mask STL { "1621.000" } MHz: C/N0 peak { "80.5" } dB-Hz median { "71.3" } dB-Hz; |Doppler| max { "35.4" } kHz; iono { "7.53" } m GNSS gps-baseline L1: { "8" } in view, C/N0 { "38.2" } dB-Hz to { "51.1" } dB-Hz (median { "46.2" } dB-Hz) LEO STL peak { "80.5" } dB-Hz is { "34.3" } dB above the GNSS median; above the strongest GNSS carrier for { "750" } s

seg-e6f4e5c502d7 = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>

seg-e12426a79a2f = Eksemplet <c1/> angiver blandt andet:

seg-274c7555b9d6 = 2026-09-28T14:{ "00" }:{ "00" }

seg-7cd17bf1ac74 = Iridium STL fra et fly

seg-f4d857403ae0 = descending

seg-08bc462d676c = { "8" } medfølgende scenarier bruger denne type; de øvrige findes i <a1><c1/></a1>.

seg-ee6d9e6d9556 = Resultatmærkat (motorens): MODELLED: geometri for LEO-passage og linkbudget pr. bånd ud fra angivne EIRP'er og idealiserede antennemønstre med ITU-R-udbredelsesled; komponentmodeller bærer deres egne mærkater i verifikationsmatrixen. Ikke en måling af nogen satellit.

seg-02ae51cfada6 = Diagrammet, som motoren skriver for scenarios/leo-pass-iridium.toml, scenarietype leo-pass

seg-65c8e3e5b1bc = MODELLED { "7" } · VALIDATED { "5" }: rækkerne i <a1>verifikationsmatrixen</a1>, der nævner denne type.

seg-69ed19957592 = <b>VALIDATED</b> ITU-R (International Telecommunication Union, Radiocommunication Sector) P.838-3 ligninger ({ "1" }) til ({ "5" }): k_H, alpha_H, k_V, alpha_V fra kurvetilpasningerne i tabel { "1" } til { "4" }, de sti- og polarisationsafhængige (k, alpha) og den specifikke dæmpning Tests: <a1>leo_link_reference.rs</a1>.

seg-56948e163406 = <b>VALIDATED</b> ITU-R P.618-14 afsnit { "2.2.1.1" } trin { "2" } til { "10" } (skrå og horisontal sti under reghøjden, faktorer for horisontal reduktion og vertikal justering, A0.01 og dens skalering til { "0.001" } % til { "5" } % af et gennemsnitligt år), med reghøjden (P.839) a Tests: <a1>leo_link_reference.rs</a1>.

seg-c4720302b980 = <b>VALIDATED</b> ITU-R P.618-14 afsnit { "2.4.1" } trin { "3" } til { "9" } (reference-sigma ud fra N_wet, effektiv stilængde, antennemiddelfaktor, fadedybde for { "0.01" } % til { "50" } % af tiden), med N_wet som input eller beregnet ud fra temperatur, fugtighed og tryk ved t Tests: <a1>leo_link_reference.rs</a1>.

seg-7e52290d354c = <b>VALIDATED</b> ITU-R P.2109-2 bilag { "1" } ligninger ({ "1" }) til ({ "10" }) med tabel { "1" }: det tab, der ikke overskrides med sandsynlighed P, for traditionelle og termisk effektive bygninger ved stiens elevation ved facaden, { "80" } MHz til { "100" } GHz; anvendt pr. bånd og epoke Tests: <a1>leo_link_reference.rs</a1>.

seg-ac1927b760d5 = og { "8" } flere i matrixen.

seg-771484572fa7 = <b>VALIDATED</b> ITU-R P.618-14 afsnit { "2.4.1" } trin { "3" } til { "9" } (reference-sigma ud fra N_wet, effektiv stilængde, antennemiddelfaktor, fadedybde for { "0.01" } % til { "50" } % af tiden. Uafhængig reference (ExternalDataset): ITU-R Study Group { "3" }-valideringseksempler (CG-3M3J-13-ValEx-Rev8.3.0) for P.618-14-scintillation, med hvert steds P.453-14 N_wet fra de samme eksempler; committet i tests/fixtures/leo_link/p618_14_scintillation.csv med URL'erne og hentedatoen. Udtrykket for våd refraktivitet ud fra temperatur og fugtighed er ikke dækket af denne række

seg-ab58ab4e7dc6 = <b>VALIDATED</b> Gruppeforsinkelse { "40.3" } STEC/f^{ "2" } pr. bånd; de ionosfærefri koefficienter f1^2/(f1^{ "2" } - f2^{ "2" }) og -f2^2/(f1^{ "2" } - f2^{ "2" }) og støjforstærkningen sqrt(a1^{ "2" } s1^{ "2" } + a2^. Uafhængig reference (ExternalDataset): IS-GPS-200 afsnit { "20.3.3.3.3.2" }, der angiver gruppeforsinkelsesforholdet L1/L2 gamma = (77/60)^{ "2" }, som følger af skalering med første ordens 1/f^{ "2" }, og Friis' transmissionsformel (Proc. IRE, { "1946" }). Validerer skaleringslovene, ikke en skrå TEC

seg-67fdbce3503c = <b>VALIDATED</b> leo_link::geometry::max_static_user_range_rate: en søgning over hver banepositionen og hver bruger på satellittens horisont for en cirkulær bane, med Jorden. Uafhængig reference (ExternalDataset): Leclere, Marathe og Reid, Insights into Xona Pulsar LEO PNT: Constellation, Signals, and Receiver Design, ION GNSS+ { "2025" }, arXiv { "2509.19551" }, tabel { "1" } (statisk modtager på en kugle på { "6371" } km, Jordens rotation den eneste anden effekt): { "37751.7" } / { "33628.5" } / { "31813.4" } / { "4018.4" } Hz på L1. Dækker cirkulære baner med tolegemeproblem

seg-b952b2928bbe = <b>MODELLED</b> Typen <c1/>: satellitter fra en designet passage, elementer, en TLE gennem SGP4 eller en Walker-konstellation fra constellation-design; pr. bånd og epoke l. Uafhængig reference (InternalConsistency): Lukkede former og selvkonsistens: identiteterne for afstandsrate og afstandsacceleration mod numeriske afledte, isoflux-forstærkningen, der ophæver væksten i afstand, lærebogsgrænserne for polarisationstab, den kvalitative observation af LEO mod GNSS (en klokkeformet passage på nogle minutter, der topper flere dB over flade GNSS-bærebølger på 44-51 dB-Hz). EIRP'erne og mønstrene er offentliggjorte modtagne effekter omregnet til en EIRP eller repræsentat

seg-65a0444ca451 = MODELLED: geometri for LEO-passage og linkbudget pr. bånd ud fra angivne EIRP'er og idealiserede antennemønstre med ITU-R-udbredelsesled; komponentmodeller bærer deres egne mærkater i verifikationsmatrixen. Ikke en måling af nogen satellit. (resultat <c1/>)

seg-8b3ffb30c23c = En valgfri [iot]-sektion giver tid til første positionsbestemmelse, energi pr. positionsbestemmelse og batterilevetid mod duty cycle for et angivet effektbudget for modtageren (MODELLED). (typekatalog (<c1/>))

seg-597be3a6eb96 = En valgfri [spoofer]-sektion forfalsker signalerne fra en påstået position, der springer eller skubbes væk fra den sande efter et indsættelsestidspunkt, og kører to monitorer med angivne sandsynligheder for falsk alarm og overset detektion: Doppler- og passagegeometri-konsistens (målte afstandsrater mod dem, der forudsiges ud fra banerne og en uafhængig forudgående position og hastighed, en generaliseret mindste kvadraters chi-i-anden-test over et vindue (typekatalog (<c1/>))

seg-dbcc7b9c9b9b = MODELLED: EIRP'er, mønstre, Chapman-andelen af TEC under satellitten og hele passagen. (typekatalog (<c1/>))

seg-e675c999f303 = MODELLED. Spotstrålerne, burst-skemaet og STL-bølgeformen er ikke modelleret. (kommentar i scenariefilen, linje { "14" })

seg-c3665ac09bf6 = En LEO-PNT-passage og dens linkbudget pr. bånd mod de MEO GNSS-satellitter, der er i sigte, er MODELLED, ikke valideret: kontrolleret mod sin egen lukkede/analytiske identitet; fanger transskriptions- og koefficientfejl, men er ikke en ekstern uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-ab0fc0d88556 = Navngivne LEO-PNT-systemforudindstillinger med angivne kilder og en systemagnostisk motor er MODELLED, ikke valideret: kontrolleret mod sin egen lukkede/analytiske identitet; fanger transskriptions- og koefficientfejl, men er ikke en ekstern uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-ae15d15bf151 = Emneside: <a1>LEO-PASS.md</a1>

seg-3ddcc0ea097f = <s1>Forrige</s1>leo-navmsg

seg-7c0d4c0f536d = <s1>Næste</s1>leo-pnt-chain
