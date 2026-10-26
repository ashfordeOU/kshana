# docs--leo-navmsg: translations (nb)

seg-cc651d9cef3b = Kode

seg-cbf0f9bcd2d8 = Uavhengig referanse

seg-6e0cb6acc073 = VALIDATED

seg-35f8f623ea28 = { "30" } s

seg-f63dd3d7aad4 = Kilde

seg-e305279d5b11 = Innhold

seg-4d208b6c0eb8 = dag

seg-a7d59ba6e225 = rad

seg-289e8da49cc8 = Bytte

seg-e80d12ee2259 = Elevasjon

seg-b16789d14338 = Posisjonshopp

seg-b3c252609532 = Klokkehopp

seg-8239a390ec71 = Hopp i brukeravstand

seg-4153faf7969d = Hopp ved dårligste geometri

seg-14402c7fb332 = IOD { "270" } → { "271" }

seg-7862a97ac55f = { "0.07" } mm

seg-4cfe934c881f = { "0.19" } mm

seg-9e9752920165 = -0.17 mm

seg-4267557786be = { "0.27" } mm

seg-46872e8925b2 = IOD { "271" } → { "272" }

seg-4c803fd2ccc9 = { "0.14" } mm

seg-cc9a8388f6bc = -0.24 mm

seg-0549f7fd0633 = IOD { "272" } → { "273" }

seg-ad1afcf9a466 = -0.22 mm

seg-c1b30171b4f0 = { "0.35" } mm

seg-f93647402fa9 = { "0.48" } mm

seg-69b35182807c = Største hopp i brukeravstand { "0.35" } mm mot en terskel på { "5" } cm: <b>PASS</b>.

seg-96dcb456600d = Koding og dekoding

seg-1b3674a0e041 = <c1/> koder den første av tre meldinger, dekoder den, kontrollerer CRC-en og avviser en ødelagt kopi, skriver ut kvantiseringsbudsjettet, og skriver og leser tilbake RINEX-lignende blokken og CSV-tabellen:

seg-480eb9ffc333 = ramme: { "171" } bytes ({ "1310" } nyttelastbiter, hvorav { "1045" } er efemeride og klokke), 24-bits syklisk redundanskontroll (CRC-24Q) <c1/>;

seg-0e2a64a063fd = største halvtrinnseffekt av et enkelt felt: <c1/>, { "0.545" } mm;

seg-a1875f7088b0 = hele meldingen etter kvantisering: posisjon innenfor { "1.126" } mm og klokke innenfor { "0.185" } mm av den eksakte meldingen; SISRE { "0.113" } cm eksakt, { "0.129" } cm dekodet;

seg-6e818708b695 = en ramme med én snudd bit avvises: true;

seg-31fe0f6b133d = RINEX-lignende rundtur innenfor { "5.0e-06" } m, CSV-rundtur innenfor { "0.0e+00" } m.

seg-405cf34090cc = Plattformuavhengighet

seg-7f2193f6ff06 = En ramme er sendte heltall, så det må være de samme heltallene uansett hvor og hvordan scenarioet kjøres: den native binærfilen på et hvilket som helst operativsystem, et debug- eller et release-bygg, og WebAssembly-bygget (WASM) i en nettleser. Tre ting sto i veien. Sinus, cosinus, arcustangens og eksponentialfunksjon i en verts matematikkbibliotek er ikke pålagt å være korrekt avrundet, og de er forskjellige mellom verter i siste siffer. Et optimalisert bygg på macOS henter sinus og cosinus av ett argument fra systemets kombinerte rutine, som ikke alltid gir samme verdi som sinus alene, så et debug- og et release-bygg avvek også fra hverandre. Og den vanlige normalfordelingssampleren kaller vertens eksponential- og logaritmefunksjon i sine sjeldne grener. Tilpasningen gjør en så liten forskjell om til andre kvantiserte felt. Hele scenariotypen (referansebane og -klokke, tilpasning, brukeralgoritme, avstandsfeil i signal i rommet (SISRE), kodek) beregner derfor hver slik funksjon med den rene Rust-biblioteket <c1/> via <c2/>, heltallspotenser som eksplisitte produkter, og normalfordelte avvik med polarmetoden på generatorens rå utdata. <c3/> låser den 171 byte lange rammen i kode-og-dekode-scenarioet nedenfor og én kontrollverdi per efemeridemodell; et debug-bygg, et release-bygg og WASM-bygget gir byte-identiske resultatdokumenter for alle fem medfølgende <c4/>-scenarioer.

seg-1ef00467df17 = Binærformat

seg-af2dae9e9e7c = <b>Dette er Kshanas egen dokumenterte koding.</b> Den bærer komponentene som de publiserte beskrivelsene av LEO-navigasjonsmeldinger nevner, modellert etter Galileo ICD-feltsettet. Den er <b>ikke</b> bitoppsettet til Celeste eller noe annet system: ingen av dem er offentlige.

seg-6a730c01ad1c = Ramme: preamble <c1/> ({ "8" } biter), versjon { "1" } ({ "4" }), modell ({ "4" }: { "1" } <c2/>, { "2" } <c3/>, { "3" } <c4/>, { "4" } <c5/>), nyttelastlengde i bytes ({ "12" }), nyttelast nullutfylt til en byte, CRC-24Q (en 24-bits syklisk redundanskontroll, { "24" } biter) over hver foregående byte. CRC-24Q er kontrollen i standarden RTCM { "10403" } fra Radio Technical Commission for Maritime Services og i Galileo ICD (polynom <c6/>, startverdi { "0" }); koden gjengir katalogens kontrollverdi <c7/> for <c8/> og kontrollbytene i RTCM { "10403" }-eksempelrammen for meldingstype { "1005" } (<b>VALIDATED</b>).

seg-a31d899eb435 = Galileo ICD-trinnene ble valgt for middels høy jordbane og er for grove for en LEO-melding på centimeternivå: <c1/> i trinn på { "2" }⁻⁵ m ({ "3.1" } cm), <c2/> { "2" }⁻²⁹ rad ({ "1.3" } cm ved LEO-radius), vinklene { "2" }⁻³¹ semisirkler ({ "1.0" } cm) og <c3/> { "2" }⁻³⁴ s ({ "1.7" } cm). Kshana beholder ICD-enhetene og semisirkelkonvensjonen, forfiner trinnene slik at halvtrinnsfeilen i hvert felt holder seg under { "1" } mm i posisjon eller avstand over et 15-minutters vindu, og utvider feltene for å dekke områdene en LEO-tilpasning trenger:

seg-caddc6f5b9a7 = Blokk

seg-b548b723c201 = Biter

seg-d00b65801e9b = Trinn

seg-2085d172bec3 = hjelpe- og synkroniseringsdata

seg-7e9018f82811 = uke

seg-45cbfedb6f0e = klokke (flaggbit { "0" })

seg-05d274f5ce99 = s/s^{ "2" }

seg-9d6d5136e12a = Kepler (modell 1-3)

seg-3fb59c8238cb = semisirkel

seg-d173e8d7026c = m^{ "0.5" }

seg-48c8bfb6e914 = korreksjoner langs/på tvers/radielt (modell { "2" })

seg-131652f53721 = tilleggsledd fra Liu et al. { "2025" } (modell { "3" })

seg-fccf37a24fc4 = semisirkel/s^{ "2" }

seg-ebde561c17ab = ECEF-polynom (modell { "4" })

seg-822c7482547c = Klobuchar (flaggbit { "1" })

seg-7dd6e8bcaf43 = s/semisirkel^{ "2" }

seg-09408b08c481 = s/semisirkel^{ "3" }

seg-734162101b2d = NeQuick-G (flaggbit { "2" })

seg-ddbb363f4593 = sfu/deg^{ "2" }

seg-e2744b31e5d3 = UTC (flaggbit { "3" })

seg-545755e7b26f = En verdi utenfor feltets område avvises, den bretter seg ikke rundt. Områdene ble kontrollert ved å kode tilpasninger på { "300" } til { "2000" } km, banehellinger fra { "0" }° til { "140" }° og tilpasningsintervaller på opptil { "20" } minutter: <c1/> og <c2/> er brede fordi knutepunktet er dårlig definert i en bane nær ekvator og tilpasningen fordeler J2-driften i breddeargumentet mellom dem, og <c3/> og <c4/> fordi 22-parametertilpasningen over { "20" } minutter tar opp en del av den korte perioden i svingningen av store halvakse. Siden { "0.30" } er 22-parametertilpasningen artikkelens rene minste kvadraters metode uten forhåndsinformasjon, og en ekvatorial tilpasning på { "800" } km trenger da <c5/> på omtrent { "6.3e-10" } semisirkel/s^{ "2" }, så skalaen gikk fra { "2" }^-60 til { "2" }^-58. De langsgående korreksjonene av grad 7 i <c6/> passer inn i 22-biters koeffisientområdet opptil { "15" } minutter; en lengre tilpasning kan overskride det og avvises da. <c7/> rapporterer, for hvert efemeride- og klokkefelt, den største endringen i posisjon og avstand som en halvtrinnsendring gir over bruksperioden, og endringen i hele meldingen etter kvantisering.

seg-1ad17f3d3643 = Teksteksport

seg-81fb376aa1e1 = <b>RINEX { "4.02" } definerer ingen LEO-navigasjonsposter</b> (systembokstavene er G, R, E, J, C, I og S; <a1>International Global Navigation Satellite System (GNSS) Service (IGS) RINEX { "4.02" }</a1>). Blokken som <c1/> skriver låner RINEX { "4" }-formen — en <c2/>-posthode, en linje med satellitt og epoke med tre klokkeledd, linjer med kringkastet bane på fire <c3/>-felt — og er en <b>dokumentert Kshana-utvidelse</b>: systembokstav <c4/>, posttypene <c5/>, <c6/>, <c7/>, <c8/>, og tre hodekommentarer som sier det. Tidligere arbeid om LEO-baner i navigasjonsposter i RINEX-4-stil: <a2>arXiv { "2401.17767" }</a2>.

seg-9a3016441bce = CSV-tabellen bærer meldingene <c1/> og <c2/>, én per rad. Standardkolonnene bruker Galileo ICD-navnene (<c3/>); <c4/> velger i stedet stavemåten til en forhåndsinnstilling. Begge formatene kan leses tilbake.

seg-4a26902d2771 = Ionosfære og UTC

seg-c4d4dd2bac45 = <b>Klobuchar</b>: motorens L1-modell (<c1/>, kontrollert mot RTKLIB) skalert til bærebølgen med førsteordens-loven <c2/>.

seg-0d3973f04ee5 = <b>NeQuick-G</b>: koeffisientene følger med i meldingen, og <c1/> returnerer <c2/> for en modifisert dip-breddegrad <c3/>, med algoritmens regler (koeffisienter som alle er null gir { "63.7" } solfluksenheter, sfu; resultatet begrenses til [{ "0" }, { "400" }] sfu). NeQuick-elektrontetthetsmodellen og dens integrasjon langs siktlinjen, som gjør <c4/> om til en forsinkelse, er <b>ikke</b> implementert.

seg-66dbd447dfeb = En satellitt på noen hundre kilometers høyde flyr inne i ionosfæren. Ingen av de to kringkastede modellene tar hensyn til elektroninnholdet over satellitten, og det anvendes ingen korreksjon for det.

seg-7befd59b2ac6 = <b>UTC</b>: <c1/> anvender de tre tilfellene i Galileo ICD §{ "5.1.7" } (før, innen seks timer av og etter en skuddsekundhendelse); et innsatt sekund leses som { "86400" }.

seg-2b0d77219437 = Forhåndsinnstillinger

seg-d2908020db08 = Forhåndsinnstillinger er data, én fil hver under <c1/>, med kildene sine. Motoren og alle medfølgende scenarioer unntatt Celeste-scenarioet kjører uten dem.

seg-c353e7bec219 = Nøkkel

seg-5566e1d71a4f = Bane

seg-33f4c7af9c53 = Bærebølge

seg-f4510e898031 = Meldingsmodell

seg-125aac68d94f = PUBLIC, <a1>arXiv { "2509.19551" }</a1>

seg-890aa92157e4 = { "1080" } km, { "53" }°

seg-1eca13ba2309 = X1 { "1593.3225" } MHz

seg-ee9947222a30 = ikke publisert

seg-77af616c1f6e = PUBLIC, arXiv { "2509.19551" }

seg-f016786d7755 = { "520" } km, { "97" }°

seg-780e931bf88d = PUBLIC, <a1>RNTF-rapport</a1>, beskrivelse av konstellasjonen

seg-d5df094a5f89 = { "781" } km, { "86.4" }°

seg-94bc78cee128 = { "1621" } MHz ({ "1616" }–{ "1626" } MHz-bånd)

seg-3f5de7f74502 = ingen kringkasting

seg-4944294c230f = PUBLIC, <a1>NAVIGATION { "72" }({ "1" })</a1>, beskrivelse av konstellasjonen

seg-c2a2761f73b1 = { "550" } km, { "53" }°

seg-2ef501f97eff = Ku-bånd, verdi midt i båndet (representativ)

seg-567fab40bd24 = ingen (mulighetssignaler)

seg-a76527ba66b6 = PUBLIC, <a1>Sensors { "2023" }</a1>, <a2>Satellite Navigation { "2026" }</a2>

seg-f5dd5086eedd = { "700" } km, { "55" }°

seg-5fa6b60f66b4 = nær B1 (maskert i kilden; L1 som stedfortreder)

seg-5ebbf0042d7c = REPRESENTATIVE

seg-4f3e5a683682 = { "600" } km, { "97.8" }°

seg-c06f62ca5173 = { "5020" } MHz (RNSS C-bånd, senter)

seg-884c81e55e79 = PUBLIC, <a1>InsideGNSS</a1>

seg-3b1fd041f9ba = { "500" } km (representativ)

seg-522c85402d84 = L1 (representativ)

seg-064b03765e4d = <c1/>, grad { "6" }, { "60" } s, oppdatert hvert { "30" } s, null klokke, { "0.24" } m styringsrest

seg-5619bc61b958 = WORKSHOP and PUBLIC

seg-20572d7e348d = { "510" } km, { "97.4" }°

seg-a17f4b4f7fb5 = { "1191.795" } MHz

seg-fad0950a2d67 = <c1/>, grader og postavstand i forhåndsinnstillingsfilen

seg-e881ffc4e14b = RNSS er radionavigasjonssatellitttjenesten; RNTF er Resilient Navigation and Timing Foundation.

seg-e9524c71636d = <b>Celeste IOD.</b> Forhåndsinnstillingen for Celeste-demonstrasjonen i bane (IOD) fra Den europeiske romorganisasjonen (ESA) er den eneste som bruker materiale presentert på ESA Navigation Innovation and Support Programme (NAVISP) LEO-PNT-workshopen, { "2026" }: meldingsstrukturen (Galileos Kepler-sett pluss korreksjonspolynomer langs/på tvers/radielt, klokkepolynom, SVID, helse, IOD, ionosfære- og UTC-parametere), postavstanden og CSV-kolonnenavnene. Banen ({ "510" } km, nesten polar solsynkron) og bærebølgen kommer fra offentlige kilder som er oppgitt i filen. Celestes bitoppsett er ikke offentlig og gjengis ikke; senere Celeste-faser og EUs LEO-PNT-system kan avvike. Hver verdi som stammer fra workshopen ligger i modulen <c1/> i <c2/>, brukt av <c3/>. Slik holdes forhåndsinnstillingen tilbake: hvert tall fra workshopen i motoren ligger i én fil, <c4/>, som <c5/> bare kompilerer inn når den finnes, og i scenarioene <c6/> som bare finnes i repositoriet. Når den filen og de scenarioene slettes, holdes forhåndsinnstillingen tilbake uten kildeendring; alle andre tester, uavhengige referanser og scenarioer kjører uten den, og antallet scenariofiler i README teller fortsatt de tilbakeholdte filene.

seg-906da2752f76 = Verifikasjon

seg-7338b6210228 = Rad

seg-c5ce76c91ff7 = Merkelapp

seg-cfe0d596296e = SISRE-vekter

seg-3e0059048a0d = tabellen til Montenbruck et al. { "2018" } (GPS, GLONASS, Galileo, BeiDou, geostasjonær)

seg-0f5e73171fe0 = Galileo ICD-brukeralgoritmen

seg-29ad977ef423 = RTKLIB <c1/> på fire virkelige kringkastede Galileo-efemerider, { "1" } mm per akse (<c2/>)

seg-ecec254e8219 = katalogens kontrollverdi <c1/>; RTCM { "10403" } { "1005" }-eksempelramme

seg-388633e4e785 = Tilpasning og SISRE-avveining

seg-8b85c3277e66 = totrekkslegemets referanse gjenfunnet til { "1" } mm; korrigert J2–J6-tilpasning til { "1" } mm; monoton vekst med intervallet

seg-4de7f2b173c5 = Kontinuitet midt i passeringen

seg-bdbd2771c7f5 = hoppidentitet; lukket kjeglegrense mot sampling

seg-468a92a2caf7 = Binærformat og budsjett

seg-ba26f5f63172 = rundturer; halvtrinnet i hvert felt under { "1" } mm

seg-9be43cbef131 = RINEX-lignende og CSV

seg-a7748156fd6e = rundturer

seg-88b5cda10923 = 22-parametermodellen og tilpasningen til Liu et al. { "2025" }

seg-7272ebdc1fec = presise TU Graz ITSG-baner for fire satellitter mot tabellene { "4" }, { "5" }, { "6" } og { "8" } i artikkelen: forholdstall for langs, på tvers, radielt og SISRE { "0.755" } til { "1.138" } på artikkelens dager og { "0.683" } til { "1.186" } på åtte tilbakeholdte dager, innenfor 1.5x (<c1/>)

seg-94066142a642 = ATOMIC-polynomet med null klokke og tabellen for fem høyder

seg-205cdc6a3696 = ATOMIC-fakta fra InsideGNSS; den publiserte Liu-tabellen skrevet ut ved siden av Kshanas tilpasning til den integrerte banen, ikke låst

seg-8c00ed11609c = lukkede former fra ICD; den Klobuchar-modellen som er kontrollert mot RTKLIB

seg-d5653e0958b5 = SISRE er bare representasjonsfeil: ingen feil fra banebestemmelse eller prediksjon.

seg-4968d9fcbc19 = Referansen er en Kshana-integrasjon (uten tredjelegeme, solstrålingstrykk eller tidevann), ikke den presise banen til en virkelig satellitt.

seg-6a4a1bf21b50 = Binærformatet og den RINEX-lignende blokken er Kshanas egne.

seg-26c0a2693081 = NeQuick-G bæres med, men integreres ikke til en forsinkelse; ingen korreksjon for en satellitt inne i ionosfæren.

seg-2a0c8190c38e = Sammenligningen med Liu et al. avviker i baner, tolkning av parametere og vekter.

seg-4abe216f987a = <s1>Forrige</s1>LEO-passering og linkbudsjett

seg-59d9bf4735d8 = <s1>Neste</s1>Fusjonert MEO- og LEO-posisjonering
