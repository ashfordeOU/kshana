# docs--kind-leo-navmsg: translations (nb)

seg-debc2f07db78 = true

seg-cb91473bfdda = Temaside: <a1>LEO-PNT.md</a1>

seg-1d65b71c5de0 = { "5" } medfølgende scenarioer bruker denne typen; de andre ligger i <a1><c1/></a1>.

seg-648c27220789 = Kilde: <c1/>

seg-087287602b47 = <c1/> (scenariotype)

seg-49964654d5f4 = Scenariotype i motoren v{ $version }, familie <a1>Navigasjon i lav jordbane</a1>. Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en safety-of-life-tjeneste. Hver etikett her kommer fra motoren eller verifikasjonsmatrisen; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett oppnås: avsnittet Evidence i README).

seg-867f3e41b5ab = LEO-navigasjonsmelding: den kringkastede efemeriden og klokken til en satellitt for posisjonering, navigasjon og tidssynkronisering i lav jordbane (LEO), for enhver bane, bærebølge og modell, med valgfrie navngitte forhåndsinnstillinger (Xona Pulsar, Iridium, Starlink, CentiSpace, et representativt C-bånd-system, ATOMIC-modellen uten klokke, Celeste IOD). INNHOLD: hjelpedata (SVID, datautgave, bånd, signalhelse), synkronisering (uke, ukesekund, et andregrads klokkepolynom af0-af2 om toc), efemeride i en av fire modeller -- Galileo OS SIS ICD-settet med 16 keplerske parametere; det settet pluss korreksjonspolynomer langs banen, på tvers og radialt; modellen med 22 parametere fra Liu et al. { "2025" }; et ECEF-polynom uten klokkeledd (ATOMIC uten klokke) -- og andre tjenester (et Klobuchar-sett i kringkastingen, NeQuick-G ai0-ai2 med effektivt ioniseringsnivå, og parametere fra systemtid til UTC med ICD-logikken for skuddsekund). TILPASNING: en sannhetsbane integrert med sonal J2-J6- eller EGM2008-gravitasjon til valgt grad og drag, og en seedet fri eller styrt klokke; Levenberg-Marquardt-tilpasning av det keplerske settet på ikke-singulære elementer, deretter lineære minstekvadraters korreksjonspolynomer; klokken tilpasset netto av det relativistiske leddet brukeren legger til. ANALYSER: fit-interval-trade (signal-in-space range error, SISRE, med globalt gjennomsnittlige vekter for banehøyden, mot tilpasningsintervall og oppdateringsperiode, kun bane og med klokke), model-comparison (fire modeller, antall parametere, kodede biter og Kshanas tilpasning ved Liu et al.-høydene ved siden av de publiserte tallene), midpass-update (den høyeste passeringen over en bruker, hver meldingsbyttes hopp i posisjon, klokke og brukeravstand, hopp ved verste geometri, PASS/FAIL mot en kontinuitetsterskel), encode-decode (Kshanas egen dokumenterte binære ramme med CRC-24Q, et kvantiseringsbudsjett på et halvt trinn per felt, en kontroll av ødelagt ramme, en eksport og import av poster i RINEX-4-stil merket som en Kshana-utvidelse, og en CSV-tabell). VALIDATED: SISRE-vektene mot den publiserte MEO/GEO-tabellen (Montenbruck et al. { "2018" }); Galileo-brukeralgoritmen mot RTKLIB på virkelige Galileo-kringkastede efemerider; CRC-24Q mot sin katalogkontrollverdi og eksempelrammen RTCM { "1005" }. MODELLED: hver tilpasnings- og SISRE-verdi er representasjonsfeil mot en sannhet integrert av Kshana (ingen banebestemmelses- eller prediksjonsfeil); sammenligningen med Liu et al. bruker andre baner; kodings- og tekstformatene er Kshanas egne.

seg-e5a4f0290e9e = Én kjøring av <c1/> oppsummeres slik: LEO navigation message — { "510" } km, { "97.4" } deg, gravity degree { "20" }, model kepler-rac SISRE weights: w_R { "0.459" }, w_AC^{ "2" } 1/2.53 (mask { "0" } deg) encode-decode: kepler-rac model, frame { "152" } bytes ({ "1156" } payload bits, { "891" } ephemeris+clock bits), CRC-24Q 0x58ADF2 quantisation: largest position change { "0.52" } mm, clock { "0.09" } mm; SISRE exact { "0.0013" } m, quantised { "0.0013" } m corrupted frame rejected: true; RINEX round trip { "4.43e-6" } m; CSV round trip { "0.00e0" } m fit-interval trade over { "1800" } s (usage period = fit interval): kepler16 { "60" } s SISRE orbit RMS { "0.0003" } m max { "0.0015" } m with clock RMS { "0.0006" } m kepler16 { "120" } s SISRE orbit RMS { "0.0003" } m max { "0.0015" } m with clock RMS { "0.0007" } m kepler16 { "300" } s SISRE orbit RMS { "0.0036" } m max { "0.0141" } m with clock RMS { "0.0037" } m kepler16 { "600" } s SISRE orbit RMS { "0.0293" } m max { "0.1023" } m with clock RMS { "0.0293" } m kepler16 { "900" } s SISRE orbit RMS { "0.1073" } m max { "0.3812" } m with clock RMS { "0.1075" } m kepler-rac { "60" } s SISRE orbit RMS { "0.0000" } m max { "0.0000" } m with clock RMS { "0.0005" } m kepler-rac { "120" } s SISRE orbit RMS { "0.0001" } m max { "0.0002" } m with clock RMS { "0.0007" } m kepler-rac { "300" } s SISRE orbit RMS { "0.0005" } m max { "0.0021" } m with clock RMS { "0.0012" } m kepler-rac { "600" } s SISRE orbit RMS { "0.0097" } m max { "0.0395" } m with clock RMS { "0.0096" } m kepler-rac { "900" } s SISRE orbit RMS { "0.0388" } m max { "0.1143" } m with clock RMS { "0.0390" } m Det keplerske settet med 16 parametere forverres fra { "0.0003" } m ved { "60" } s til { "0.1073" } m ved { "900" } s: ett keplersk sett med harmoniske to ganger per omløp kan ikke følge de høyfrekvente gravitasjonsleddene og draget fra en LEO-bue i mer enn noen få minutter, og minstekvadraters residualen svinger over vinduet. Polynomene langs/på tvers/radialt, av høyere grad enn det keplerske settet spenner over, absorberer det som er igjen, og gir { "0.0388" } m ved { "900" } s.

seg-3f299f6b20c8 = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>

seg-3adfcd7e275c = Eksemplet <c1/> setter blant annet:

seg-8243db187e2f = [encode-decode, fit-interval-trade]

seg-e866d042aab8 = Celeste IOD-melding (forhåndsinnstilling workshop)

seg-c42f5a1ed964 = [kepler16, kepler-rac]

seg-549a6103e711 = bit

seg-fb689f03361c = byte

seg-c60901596100 = Resultatetikett (motorens): MIXED — VALIDATED byggeklosser, MODELLED resultater. SISRE-vektene gjengir den publiserte MEO/GEO-tabellen (Montenbruck et al. { "2018" }), Galileo ICD-brukeralgoritmen gjengir RTKLIB på virkelige Galileo-kringkastede efemerider, og CRC-24Q gjengir sin katalogkontrollverdi og eksempelrammen RTCM { "1005" }

seg-35e92abc6a23 = Diagrammet motoren skriver for scenarios/leo-navmsg-celeste-iod.toml, typen leo-navmsg

seg-43c1d9c81ccf = MODELLED { "5" } · VALIDATED { "6" }: radene i <a1>verifikasjonsmatrisen</a1> som nevner denne typen.

seg-efbe11be7ca1 = <b>VALIDATED</b> leo_navmsg::sisre::sisre_weights: den radiale vekten w_R og den kvadrerte tverrvekten w_AC^{ "2" } som gjennomsnitt av cos^{ "2" } og halvparten av sin^{ "2" } av siktlinjens nadirvinkel over brukere jevnt fordelt på den synlige jordkalotten over en elevasjon

seg-b27c5fe8e179 = <b>VALIDATED</b> leo_navmsg::elements::kepler_point: Galileo OS SIS ICD-evalueringen av keplerske elementer (Keplers ligning, andreharmoniske korreksjoner, jordfast node) skrevet separat fra motorens RINEX-evaluator, som returnerer posisjonen med argumentet Tester: <a1>leo_navmsg_reference.rs</a1>.

seg-3a53131dc9a4 = <b>VALIDATED</b> leo_navmsg::codec::crc24q: generatorpolynom 0x1864CFB, startverdi { "0" }, ingen refleksjon, ingen sluttlig XOR, kontrollen Kshana LEO-rammen bærer over hver foregående byte

seg-2b24c2669c23 = <b>VALIDATED</b> Tilpasningen og avveiningen for typen <c1/>: en sannhetsbane integrert med sonal J2-J6- eller EGM2008-gravitasjon til valgt grad og drag, og en seedet fri eller styrt klokke; en Levenberg-Marquardt-tilpasning av det keplerske Galileo-settet på ikke-singulære

seg-ddb27b07b9af = og { "7" } til i matrisen.

seg-053dae66c1be = <b>VALIDATED</b> leo_navmsg::sisre::sisre_weights: den radiale vekten w_R og den kvadrerte tverrvekten w_AC^{ "2" } som gjennomsnitt av cos^{ "2" } og halvparten av sin^{ "2" } av siktlinjens nadir. Uavhengig referanse (ExternalDataset): Den publiserte tabellen med SISRE-vektingsfaktorer fra Montenbruck, Steigenberger og Hauschild ({ "2018" }), Multi-GNSS signal-in-space range error assessment - Methodology and results, Advances in Space Research { "61" }({ "12" }):3020-3038, doi 10.1016/j.asr.2018.03.041: GPS { "0.98" } og 1/49, GLONASS { "0.98" } og 1/45, Galileo { "0.98" } og 1/61, BeiDou MEO { "0.98" } og 1/54, BeiDou IGSO/GEO { "0.99" } og 1/126. Det samme gjennomsnittet evaluert ved LEO-radier gir

seg-5b43ffde4634 = <b>VALIDATED</b> leo_navmsg::elements::kepler_point: Galileo OS SIS ICD-evalueringen av keplerske elementer (Keplers ligning, andreharmoniske korreksjoner, jordfast node) skrevet separ. Uavhengig referanse (ExternalDataset): RTKLIB 2.4.2-p13 eph2pos ECEF-posisjoner (en uavhengig implementasjon av den samme ICD-algoritmen) for virkelige BKG/IGS-kringkastingsposter fra 2024-09-10, begge innsjekket med opphav i tests/fixtures/rinex_sp3_interop (NOTICE, rinex_ecef_reference.txt, brdc_multignss_slice.rnx). Dette validerer den keplerske brukeralgoritmen; korreksjonene langs/på tvers/radialt som er lagt oppå dekkes av egne rader, og Liu-leddene b

seg-5b4f1e63795f = <b>VALIDATED</b> leo_navmsg::codec::crc24q: generatorpolynom 0x1864CFB, startverdi { "0" }, ingen refleksjon, ingen sluttlig XOR, kontrollen Kshana LEO-rammen bærer over hver foregående. Uavhengig referanse (ExternalDataset): CRC-katalogens kontrollverdi for disse parameterne (reveng.sourceforge.io CRC catalogue, CRC-24/LTE-A: bredde { "24" }, poly 0x864CFB, init { "0" }, kontroll 0xCDE703), som er CRC-24Q-parameterne til RTCM { "10403" } og Galileo OS SIS ICD, og eksempelrammen for meldingstype { "1005" } trykt i RTCM { "10403" }

seg-6e2719a28884 = <b>VALIDATED</b> Tilpasningen og avveiningen for typen <c1/>: en sannhetsbane integrert med sonal J2-J6- eller EGM2008-gravitasjon til valgt grad og drag, og en seedet fri eller styrt. Uavhengig referanse (ExternalDataset): Virkelige presise vitenskapsbaner som sannhet (TU Graz IfG/ITSG operasjonelle redusert-dynamiske baner, frie til all bruk med kildeangivelse; SHA-256-verdier i fixture-NOTICE) tilpasset med settet på 16 parametere over buer på { "20" } og { "30" } min, mot statistikken Liu et al. { "2025" } (Remote Sensing { "17" }({ "16" }):{ "2894" }, CC BY { "4.0" }) publiserer for de samme satellittene og dagene: RMS langs, på tvers og radialt hver innenfor 1.5x (målt { "0.804" } til { "1.087" }), SISR

seg-0c26ec09bf16 = SISRE er meldingens representasjonsfeil mot sannheten den ble tilpasset til; feil i banebestemmelse og banepredikering er ikke modellert. (resultat <c1/>)

seg-3762de39de07 = Sannhetsbanen er en numerisk integrasjon i Kshana (sonal eller EGM2008-gravitasjon, statisk eksponentielt drag), ikke den presise banen til en virkelig satellitt; ingen tredjelegemer, solstrålingstrykk eller tidevann. (resultat <c1/>)

seg-4486dd350b57 = Det binære formatet er Kshanas egen dokumenterte koding modellert etter de publiserte meldingskomponentene; det er ikke bitoppsettet til Celeste eller noe annet system (ingen er offentlige). (resultat <c1/>)

seg-2a5c1bce8320 = RINEX-lignende blokken er en dokumentert Kshana-utvidelse; RINEX { "4.02" } definerer ingen LEO-navigasjonsposter. (resultat <c1/>)

seg-642d8f4d60e7 = NeQuick-G-koeffisienter bæres og det effektive ioniseringsnivået beregnes, men NeQuick-integrasjonen av elektrontettheten som gjør det om til en forsinkelse er ikke implementert; Klobuchar-forsinkelsen er det, skalert til bærebølgen med 1/f^{ "2" } uten korreksjon for en satellitt som flyr inne i ionosfæren. (resultat <c1/>)

seg-8ba04a3147bd = Leddene med 22 parametere fra Liu et al. { "2025" } følger artikkelens brukeralgoritme (ligning 1-7) og tilpasningsstrategi (avsnitt { "2.3" }); dens SISRE-mot-høyde-tall brukte virkelige presise baner, så denne sammenligningen på en bane integrert av Kshana er MODELLED, ikke VALIDATED (sammenligningen med virkelig bane er tests/leo_navmsg_fit_real_orbit_oracle.rs). (resultat <c1/>)

seg-b3585c7feb4e = MIXED — VALIDATED byggeklosser, MODELLED resultater. SISRE-vektene gjengir den publiserte MEO/GEO-tabellen (Montenbruck et al. { "2018" }), Galileo ICD-brukeralgoritmen gjengir RTKLIB på virkelige Galileo-kringkastede efemerider, og CRC-24Q gjengir sin katalogkontrollverdi og eksempelrammen RTCM { "1005" }. Hver tilpasnings-, SISRE-, kontinuitets- og kvantiseringsverdi er MODELLED: representasjonsfeilen til en melding mot en (resultat <c1/>)

seg-d6e412aab1b4 = MODELLED: hver tilpasnings- og SISRE-verdi er representasjonsfeil mot en sannhet integrert av Kshana (ingen banebestemmelses- eller prediksjonsfeil); Liu et al. (typekatalog (<c1/>))

seg-c5478f572d21 = Familieside: <a1>Navigasjon i lav jordbane</a1>

seg-d9257241d523 = Temaside: <a1>LEO-NAVMSG.md</a1>

seg-b0dcad22aed6 = <s1>Forrige</s1>launch-window

seg-2984c4c69850 = <s1>Neste</s1>leo-pass
