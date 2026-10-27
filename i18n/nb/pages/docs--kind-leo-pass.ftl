# docs--kind-leo-pass: translations (nb)

seg-ad20a7bebf23 = STL

seg-37d16b499bc5 = dB

seg-cb91473bfdda = Temaside: <a1>LEO-PNT.md</a1>

seg-49964654d5f4 = Scenariotype i motoren v{ $version }, familie <a1>Navigasjon i lav jordbane</a1>. Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en safety-of-life-tjeneste. Hver etikett her kommer fra motoren eller verifikasjonsmatrisen; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett oppnås: avsnittet Evidence i README).

seg-c5478f572d21 = Familieside: <a1>Navigasjon i lav jordbane</a1>

seg-fad0b45fd9c2 = Kilde: <c1/>

seg-f0433f09f033 = <c1/> (scenariotype)

seg-c3861f7d717c = LEO-passering og linkbudsjett, bånd for bånd, for LEO-PNT (posisjonering, navigasjon og tidssynkronisering fra lav jordbane), systemagnostisk: en bruker (bakke, maritim, luft eller innendørs, statisk eller i bevegelse) og én eller flere LEO-satellitter fra en KONSTRUERT PASS (en sirkulær bane plassert slik at brukeren ser én passering med en valgt maksimal elevasjon på et valgt tidspunkt, solsynkron hvis det bes om), eksplisitte ELEMENTER, en TLE (to-linjers elementsett) gjennom motorens SGP4, eller en WALKER-konstellasjon bygd av konstellasjonsdesignkoden (de høyeste passeringene rapporteres). Bånd kommer fra en navngitt forhåndsinnstilling (generisk flerbånds UHF/L/S/C, generisk C-bånd, Xona Pulsar X1/X5, Iridium STL, Starlink som et signal for Doppler-only av anledning, CentiSpace, og en valgfri Celeste IOD-forhåndsinnstilling merket WORKSHOP) eller skrives inn i scenarioet; hver forhåndsinnstilling oppgir om tallene er PUBLIC (med URL), REPRESENTATIVE eller WORKSHOP. Per satellitt, bånd og epoke: elevasjon, azimut, avstand, avstandsrate og avstandsakselerasjon; frirom-banetap; EIRP og satellittmønsterets forsterkning (isoflux, gaussisk stråle eller flat); brukerantennens forsterkning mot elevasjon (patch, halvkuleformet eller isotrop); gassformig demping (ITU-R P.676-10 vedlegg { "2" }), regndemping (ITU-R P.838-3-koeffisienter og P.618-14-prosedyren, ut fra en regnrate og regnhøyde), troposfærisk scintillasjon (ITU-R P.618-14 avsnitt { "2.4.1" }), tap ved inntrengning i bygning for en innendørsbruker (ITU-R P.2109-2), polarisasjonsfeil, systemets støytemperatur og C/N0 (bærebølge-til-støy-tetthet); Doppler og Doppler-rate i lukket form fra avstandsraten og avstandsakselerasjonen, hver kontrollert mot sentrale differanser; den førsteordens ionosfæriske forsinkelsen { "40.3" } STEC/f^{ "2" } fra en Klobuchar- eller vertikal-TEC skrå TEC skalert til delen av ionosfæren under satellitten. Båndpar får ionosfærefrie koeffisienter, støyforsterkning og kodestøy ved passeringens topp. MEO GNSS-satellitter (Galileo- eller GPS-forhåndsinnstillinger) evalueres med den samme antenne- og støymodellen fra mottatte effekter i grensesnittdokumentene, slik at den klokkeformede LEO-passeringen og de flate GNSS-bærebølgene deler ett plott. En valgfri [iot]-seksjon gir tid til første posisjonsbestemmelse, energi per posisjonsbestemmelse og batterilevetid mot driftssyklus for et oppgitt effektbudsjett for mottakeren (MODELLED). Hvert båndpar gir også den skrå TEC-en som dets geometrifrie kombinasjon gjenvinner ved toppen og dette estimatets kodestøy-sigma (ionosfæresondering). En valgfri [spoofer]-seksjon etterligner signalene fra en påstått posisjon som hopper eller skyves bort fra den sanne etter en start, og kjører to monitorer med oppgitte sannsynligheter for falsk alarm og tapt deteksjon: konsistens mellom Doppler og passeringsgeometri (målte avstandsrater mot de som er predikert fra banene og en uavhengig forhåndsposisjon og -hastighet, en generalisert minstekvadraters kjikvadrattest over et vindu, på GNSS-, LEO- og alle kanaler) og konsistens på tvers av bånd (steget fra epoke til epoke i hvert LEO-båndpars modellkorrigerte geometrifrie kombinasjon), som rapporterer statistikk per epoke og når hver monitor oppdager (MODELLED). VALIDATED komponenter: frirom-tap, P.838-3-koeffisientene mot tabell { "5" }, prosedyrene P.618-14 for regn og scintillasjon og P.2109-tapet ved inntrengning i bygning mot valideringseksemplene i ITU-R Study Group { "3" }, gruppeforsinkelsesforholdet L1/L2 i IS-GPS-200, og den maksimale Dopplerverdien for en statisk bruker i en sirkulær bane mot arXiv { "2509.19551" } tabell { "1" }. MODELLED: EIRP-ene, mønstrene, Chapman-andelen av TEC under satellitten og hele passeringen.

seg-04509d8245b7 = Én kjøring av <c1/> oppsummeres slik: LEO pass link budget, air user at { "50.00" }, -30.00; { "1" } LEO satellite(s), { "900" } s window Iridium-pass [iridium-stl PUBLIC]: { "781" } km, max elevation { "65.0" } deg at { "444" } s, { "750" } s above the mask STL { "1621.000" } MHz: C/N0 peak { "80.5" } dB-Hz median { "71.3" } dB-Hz; |Doppler| max { "35.4" } kHz; iono { "7.53" } m GNSS gps-baseline L1: { "8" } in view, C/N0 { "38.2" } dB-Hz to { "51.1" } dB-Hz (median { "46.2" } dB-Hz) LEO STL peak { "80.5" } dB-Hz is { "34.3" } dB above the GNSS median; above the strongest GNSS carrier for { "750" } s

seg-e6f4e5c502d7 = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>

seg-e12426a79a2f = Eksemplet <c1/> setter blant annet:

seg-274c7555b9d6 = 2026-09-28T14:{ "00" }:{ "00" }

seg-7cd17bf1ac74 = Iridium STL fra et fly

seg-f4d857403ae0 = descending

seg-08bc462d676c = { "8" } medfølgende scenarioer bruker denne typen; de andre ligger i <a1><c1/></a1>.

seg-ee6d9e6d9556 = Resultatetikett (motorens): MODELLED: geometri for LEO-passering og linkbudsjett per bånd fra oppgitte EIRP-er og idealiserte antennemønstre med ITU-R-propagasjonsledd; komponentmodellene bærer sine egne etiketter i verifikasjonsmatrisen. Ikke en måling av noen satellitt.

seg-02ae51cfada6 = Diagrammet motoren skriver for scenarios/leo-pass-iridium.toml, typen leo-pass

seg-65c8e3e5b1bc = MODELLED { "7" } · VALIDATED { "5" }: radene i <a1>verifikasjonsmatrisen</a1> som nevner denne typen.

seg-69ed19957592 = <b>VALIDATED</b> ITU-R (International Telecommunication Union, Radiocommunication Sector) P.838-3 ligningene ({ "1" }) til ({ "5" }): k_H, alpha_H, k_V, alpha_V fra kurvetilpasningene i tabellene { "1" } til { "4" }, de bane- og polarisasjonsavhengige (k, alpha) og den spesifikke dempingen. Tester: <a1>leo_link_reference.rs</a1>.

seg-56948e163406 = <b>VALIDATED</b> ITU-R P.618-14 avsnitt { "2.2.1.1" } trinn { "2" } til { "10" } (skrå og horisontal bane under regnhøyden, faktorer for horisontal reduksjon og vertikal justering, A0.01 og dens skalering til { "0.001" } % til { "5" } % av et gjennomsnittsår), med regnhøyden (P.839) a Tester: <a1>leo_link_reference.rs</a1>.

seg-c4720302b980 = <b>VALIDATED</b> ITU-R P.618-14 avsnitt { "2.4.1" } trinn { "3" } til { "9" } (referansesigma fra N_wet, effektiv banelengde, antenne-midlingsfaktor, fadingdybde for { "0.01" } % til { "50" } % av tiden), med N_wet enten en inndata eller beregnet fra temperatur, fuktighet og trykk ved t Tester: <a1>leo_link_reference.rs</a1>.

seg-7e52290d354c = <b>VALIDATED</b> ITU-R P.2109-2 vedlegg { "1" } ligningene ({ "1" }) til ({ "10" }) med tabell { "1" }: tapet som ikke overskrides med sannsynlighet P for tradisjonelle og termisk effektive bygninger ved elevasjonen til banen ved fasaden, { "80" } MHz til { "100" } GHz; brukt per bånd og epoke. Tester: <a1>leo_link_reference.rs</a1>.

seg-ac1927b760d5 = og { "8" } til i matrisen.

seg-771484572fa7 = <b>VALIDATED</b> ITU-R P.618-14 avsnitt { "2.4.1" } trinn { "3" } til { "9" } (referansesigma fra N_wet, effektiv banelengde, antenne-midlingsfaktor, fadingdybde for { "0.01" } % til { "50" } % av tiden. Uavhengig referanse (ExternalDataset): Valideringseksemplene til ITU-R Study Group { "3" } (CG-3M3J-13-ValEx-Rev8.3.0) for P.618-14-scintillasjon, med hvert steds P.453-14 N_wet fra de samme eksemplene; innsjekket i tests/fixtures/leo_link/p618_14_scintillation.csv med URL-ene og hentedato. Uttrykket for våt refraktivitet fra temperatur og fuktighet dekkes ikke av denne raden

seg-ab58ab4e7dc6 = <b>VALIDATED</b> Gruppeforsinkelse { "40.3" } STEC/f^{ "2" } per bånd; de ionosfærefrie koeffisientene f1^2/(f1^{ "2" } - f2^{ "2" }) og -f2^2/(f1^{ "2" } - f2^{ "2" }) og støyforsterkningen sqrt(a1^{ "2" } s1^{ "2" } + a2^. Uavhengig referanse (ExternalDataset): IS-GPS-200 avsnitt { "20.3.3.3.3.2" }, som oppgir L1/L2-gruppeforsinkelsesforholdet gamma = (77/60)^{ "2" } som følger av førsteordens 1/f^{ "2" }-skalering, og Friis' overføringsformel (Proc. IRE, { "1946" }). Validerer skaleringslovene, ikke en skrå TEC

seg-67fdbce3503c = <b>VALIDATED</b> leo_link::geometry::max_static_user_range_rate: et søk over hver baneposisjon og hver bruker på satellittens horisont i en sirkulær bane, med jorden. Uavhengig referanse (ExternalDataset): Leclere, Marathe og Reid, Insights into Xona Pulsar LEO PNT: Constellation, Signals, and Receiver Design, ION GNSS+ { "2025" }, arXiv { "2509.19551" }, tabell { "1" } (statisk mottaker på en sfære på { "6371" } km, jordrotasjon den eneste andre effekten): { "37751.7" } / { "33628.5" } / { "31813.4" } / { "4018.4" } Hz på L1. Dekker sirkulære todelegemebaner

seg-b952b2928bbe = <b>MODELLED</b> Typen <c1/>: satellitter fra en konstruert passering, elementer, en TLE gjennom SGP4 eller en Walker-konstellasjon fra constellation-design; per bånd og epoke l. Uavhengig referanse (InternalConsistency): Lukkede former og selvkonsistens: identitetene for avstandsrate og avstandsakselerasjon mot numeriske deriverte, isoflux-forsterkningen som opphever veksten i avstand, lærebokgrensene for polarisasjonstap, den kvalitative observasjonen LEO mot GNSS (en klokkeformet passering på minutter som topper flere dB over flate GNSS-bærebølger på 44-51 dB-Hz). EIRP-ene og mønstrene er publiserte mottatte effekter omgjort til en EIRP eller representat

seg-65a0444ca451 = MODELLED: geometri for LEO-passering og linkbudsjett per bånd fra oppgitte EIRP-er og idealiserte antennemønstre med ITU-R-propagasjonsledd; komponentmodellene bærer sine egne etiketter i verifikasjonsmatrisen. Ikke en måling av noen satellitt. (resultat <c1/>)

seg-8b3ffb30c23c = En valgfri [iot]-seksjon gir tid til første posisjonsbestemmelse, energi per posisjonsbestemmelse og batterilevetid mot driftssyklus for et oppgitt effektbudsjett for mottakeren (MODELLED). (typekatalog (<c1/>))

seg-597be3a6eb96 = En valgfri [spoofer]-seksjon etterligner signalene fra en påstått posisjon som hopper eller skyves bort fra den sanne etter en start, og kjører to monitorer med oppgitte sannsynligheter for falsk alarm og tapt deteksjon: konsistens mellom Doppler og passeringsgeometri (målte avstandsrater mot de som er predikert fra banene og en uavhengig forhåndsposisjon og -hastighet, en generalisert minstekvadraters kjikvadrattest over et vind (typekatalog (<c1/>))

seg-dbcc7b9c9b9b = MODELLED: EIRP-ene, mønstrene, Chapman-andelen av TEC under satellitten og hele passeringen. (typekatalog (<c1/>))

seg-e675c999f303 = MODELLED. Punktstrålene, burst-planen og STL-bølgeformen er ikke modellert. (kommentar i scenariofilen, linje { "14" })

seg-c3665ac09bf6 = En LEO-PNT-passering og dens linkbudsjett per bånd mot MEO GNSS-satellittene i sikte er MODELLED, ikke validert: kontrollert mot sin egen lukkede/analytiske identitet, noe som fanger opp transkripsjons- og koeffisientfeil, men ikke er en ekstern uavhengig referanse. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-ab0fc0d88556 = Navngitte forhåndsinnstillinger for LEO-PNT-systemer med oppgitte kilder, og en systemagnostisk motor, er MODELLED, ikke validert: kontrollert mot sin egen lukkede/analytiske identitet, noe som fanger opp transkripsjons- og koeffisientfeil, men ikke er en ekstern uavhengig referanse. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-ae15d15bf151 = Temaside: <a1>LEO-PASS.md</a1>

seg-3ddcc0ea097f = <s1>Forrige</s1>leo-navmsg

seg-7c0d4c0f536d = <s1>Neste</s1>leo-pnt-chain
