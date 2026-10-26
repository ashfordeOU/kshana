# docs--leo-navmsg: translations (da)

seg-cc651d9cef3b = Kode

seg-cbf0f9bcd2d8 = Uafhængig reference

seg-6e0cb6acc073 = VALIDATED

seg-35f8f623ea28 = { "30" } s

seg-f63dd3d7aad4 = Kilde

seg-e305279d5b11 = Indhold

seg-4d208b6c0eb8 = day

seg-a7d59ba6e225 = rad

seg-02dc0d42fb21 = sfu

seg-289e8da49cc8 = Skift

seg-e80d12ee2259 = Elevation

seg-b16789d14338 = Positionsspring

seg-b3c252609532 = Urspring

seg-8239a390ec71 = Spring i brugerafstand

seg-4153faf7969d = Spring ved dårligste geometri

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

seg-69b35182807c = Største spring i brugerafstand { "0.35" } mm mod en tærskel på { "5" } cm: <b>PASS</b>.

seg-96dcb456600d = Kodning og afkodning

seg-1b3674a0e041 = <c1/> koder den første af tre meddelelser, afkoder den, kontrollerer CRC'en og afviser en beskadiget kopi, udskriver kvantiseringsbudgettet og skriver og indlæser igen RINEX-lignende blok og CSV-tabel:

seg-480eb9ffc333 = ramme: { "171" } bytes ({ "1310" } nyttelastbits, heraf { "1045" } efemeride og ur), 24-bit cyklisk redundanskontrol (CRC-24Q) <c1/>;

seg-0e2a64a063fd = største halvtrinseffekt for et enkelt felt: <c1/>, { "0.545" } mm;

seg-a1875f7088b0 = hele meddelelsen efter kvantisering: position inden for { "1.126" } mm og ur inden for { "0.185" } mm af den nøjagtige meddelelse; SISRE { "0.113" } cm nøjagtig, { "0.129" } cm afkodet;

seg-6e818708b695 = en ramme med én vendt bit afvises: sandt;

seg-31fe0f6b133d = RINEX-lignende rundtur inden for { "5.0e-06" } m, CSV-rundtur inden for { "0.0e+00" } m.

seg-405cf34090cc = Platformsuafhængighed

seg-7f2193f6ff06 = En ramme er transmitterede heltal, så den skal være de samme heltal, uanset hvor og hvordan scenariet køres: den native binære fil på ethvert operativsystem, et debug- eller et release-build og WebAssembly-buildet (WASM) i en browser. Tre ting stod i vejen. Sinus, cosinus, arcustangens og eksponentialfunktion i en værts matematikbibliotek skal ikke være korrekt afrundede og afviger mellem værter i sidste decimal. Et optimeret build på macOS henter sinus og cosinus af ét argument fra systemets kombinerede rutine, som ikke altid returnerer samme værdi som den enkelte sinus, så et debug- og et release-build afveg også fra hinanden. Og den sædvanlige normalfordelingssampler kalder værtens eksponential- og logaritmefunktion i sine sjældne grene. Tilpasningen gør en så lille forskel til forskellige kvantiserede felter. Hele typen (sand bane og sandt ur, tilpasning, brugeralgoritme, signal-i-rummet-afstandsfejl (SISRE), kodek) beregner derfor alle sådanne funktioner med den rene Rust-kasse <c1/> via <c2/>, heltalspotenser som eksplicitte produkter og normalfordelte afvigelser med polarmetoden på generatorens rå output. <c3/> fastlåser rammen på 171 bytes fra scenariet med kodning og afkodning nedenfor og én kontrolværdi pr. efemeridemodel; et debug-build, et release-build og WASM-buildet giver byte-identiske resultatdokumenter for alle fem medfølgende <c4/>-scenarier.

seg-1ef00467df17 = Binært format

seg-af2dae9e9e7c = <b>Dette er Kshanas egen dokumenterede kodning.</b> Den bærer de komponenter, som de offentliggjorte beskrivelser af LEO-navigationsmeddelelser nævner, modelleret efter Galileo ICD's feltsæt. Den er <b>ikke</b> bitlayoutet for Celeste eller noget andet system: ingen er offentlige.

seg-6a730c01ad1c = Ramme: præambel <c1/> ({ "8" } bits), version { "1" } ({ "4" }), model ({ "4" }: { "1" } <c2/>, { "2" } <c3/>, { "3" } <c4/>, { "4" } <c5/>), nyttelastlængde i bytes ({ "12" }), nyttelast udfyldt med nuller til en hel byte, CRC-24Q (en 24-bit cyklisk redundanskontrol, { "24" } bits) over alle foregående bytes. CRC-24Q er kontrollen i standarden RTCM { "10403" } fra Radio Technical Commission for Maritime Services og i Galileo ICD (polynomium <c6/>, startværdi { "0" }); koden gengiver katalogets kontrolværdi <c7/> for <c8/> og kontrolbytes i eksempelrammen af RTCM { "10403" } meddelelsestype { "1005" } (<b>VALIDATED</b>).

seg-a31d899eb435 = Galileo ICD's trin blev valgt til middelhøj jordbane og er for grove til en LEO-meddelelse på centimeterniveau: <c1/> i trin på { "2" }⁻⁵ m ({ "3.1" } cm), <c2/> { "2" }⁻²⁹ rad ({ "1.3" } cm ved LEO-radius), vinklerne { "2" }⁻³¹ halvcirkler ({ "1.0" } cm) og <c3/> { "2" }⁻³⁴ s ({ "1.7" } cm). Kshana beholder ICD-enhederne og halvcirkelkonventionen, forfiner trinnene, så hvert felts halvtrinsfejl holdes under { "1" } mm i position eller afstand over et 15-minutters vindue, og udvider felterne, så de dækker de intervaller, en LEO-tilpasning har brug for:

seg-caddc6f5b9a7 = Blok

seg-b548b723c201 = Bits

seg-d00b65801e9b = Trin

seg-2085d172bec3 = hjælpe- og synkroniseringsdata

seg-7e9018f82811 = uge

seg-45cbfedb6f0e = ur (flagbit { "0" })

seg-05d274f5ce99 = s/s^{ "2" }

seg-9d6d5136e12a = Kepler (modeller 1-3)

seg-3fb59c8238cb = halvcirkel

seg-d173e8d7026c = m^{ "0.5" }

seg-48c8bfb6e914 = langs-/tværs-/radiale korrektioner (model { "2" })

seg-131652f53721 = Liu et al. { "2025" } ekstra led (model { "3" })

seg-fccf37a24fc4 = halvcirkel/s^{ "2" }

seg-ebde561c17ab = ECEF-polynomium (model { "4" })

seg-822c7482547c = Klobuchar (flagbit { "1" })

seg-7dd6e8bcaf43 = s/halvcirkel^{ "2" }

seg-09408b08c481 = s/halvcirkel^{ "3" }

seg-734162101b2d = NeQuick-G (flagbit { "2" })

seg-ddbb363f4593 = sfu/deg^{ "2" }

seg-e2744b31e5d3 = UTC (flagbit { "3" })

seg-545755e7b26f = En værdi uden for sit felts interval afvises og ombrydes ikke. Intervallerne blev kontrolleret ved at kode tilpasninger ved { "300" } til { "2000" } km, banehældninger fra { "0" }° til { "140" }° og tilpasningsintervaller op til { "20" } minutter: <c1/> og <c2/> er brede, fordi knuden er dårligt defineret på en næsten ækvatorial bane, og tilpasningen fordeler argumentets J2-drift for breddevinklen mellem dem, og <c3/> og <c4/> er det, fordi 22-parametertilpasningen over { "20" } minutter optager en del af den kortperiodiske svingning i den halve storakse. Siden { "0.30" } er 22-parametertilpasningen artiklens almindelige mindste kvadraters metode uden apriori-værdier, og en ækvatorial tilpasning ved { "800" } km har da brug for <c5/> på omkring { "6.3e-10" } halvcirkel/s^{ "2" }, så dens skala gik fra { "2" }^-60 til { "2" }^-58. De langsgående korrektioner af grad 7 for <c6/> passer i koefficientintervallet på 22 bit op til { "15" } minutter; en længere tilpasning kan overskride det og afvises da. <c7/> rapporterer for hvert efemeride- og urfelt den største ændring i position og afstand, som en ændring på et halvt trin giver over brugsperioden, samt ændringen i hele meddelelsen efter kvantisering.

seg-1ad17f3d3643 = Teksteksport

seg-81fb376aa1e1 = <b>RINEX { "4.02" } definerer ingen LEO-navigationsposter</b> (dets systembogstaver er G, R, E, J, C, I og S; <a1>International Global Navigation Satellite System (GNSS) Service (IGS) RINEX { "4.02" }</a1>). Blokken, som <c1/> skriver, låner formen fra RINEX { "4" } — en postoverskrift <c2/>, en linje med satellit og epoke med tre urled, broadcast-banelinjer med fire <c3/>-felter — og er en <b>dokumenteret Kshana-udvidelse</b>: systembogstav <c4/>, posttyper <c5/>, <c6/>, <c7/>, <c8/> og tre overskriftskommentarer, der siger det. Tidligere arbejde om LEO-baner i navigationsposter i RINEX-4-stil: <a2>arXiv { "2401.17767" }</a2>.

seg-9a3016441bce = CSV-tabellen bærer <c1/>- og <c2/>-meddelelser, én pr. række. Standardkolonnerne bruger Galileo ICD's navne (<c3/>); <c4/> vælger i stedet en forudindstillings stavemåde. Begge formater kan læses tilbage.

seg-4a26902d2771 = Ionosfære og UTC

seg-c4d4dd2bac45 = <b>Klobuchar</b>: motorens L1-model (<c1/>, kontrolleret mod RTKLIB) skaleret til bærebølgen med førsteordens-loven <c2/>.

seg-0d3973f04ee5 = <b>NeQuick-G</b>: koefficienterne følger med i meddelelsen, og <c1/> returnerer <c2/> for en modificeret dip-breddegrad <c3/> efter algoritmens regler (koefficienter, der alle er nul, giver { "63.7" } solar flux units, sfu; resultatet begrænses til [{ "0" }, { "400" }] sfu). NeQuick-elektrontæthedsmodellen og dens integration langs skråvejen, som omsætter <c4/> til en forsinkelse, er <b>ikke</b> implementeret.

seg-66dbd447dfeb = En satellit i nogle hundrede kilometers højde flyver inde i ionosfæren. Ingen af de to broadcast-modeller tager højde for elektronindholdet over satellitten, og der anvendes ingen korrektion for det.

seg-7befd59b2ac6 = <b>UTC</b>: <c1/> anvender de tre tilfælde i Galileo ICD §{ "5.1.7" } (før, inden for seks timer af og efter en skudsekundshændelse); et indskudt sekund læses som { "86400" }.

seg-2b0d77219437 = Forudindstillinger

seg-d2908020db08 = Forudindstillinger er data, én fil hver under <c1/>, med deres kilder. Motoren og alle medfølgende scenarier undtagen Celeste-scenariet kører uden dem.

seg-c353e7bec219 = Nøgle

seg-5566e1d71a4f = Bane

seg-33f4c7af9c53 = Bærebølge

seg-f4510e898031 = Meddelelsesmodel

seg-125aac68d94f = PUBLIC, <a1>arXiv { "2509.19551" }</a1>

seg-890aa92157e4 = { "1080" } km, { "53" }°

seg-1eca13ba2309 = X1 { "1593.3225" } MHz

seg-ee9947222a30 = ikke offentliggjort

seg-77af616c1f6e = PUBLIC, arXiv { "2509.19551" }

seg-f016786d7755 = { "520" } km, { "97" }°

seg-780e931bf88d = PUBLIC, <a1>RNTF-rapport</a1>, beskrivelse af konstellationen

seg-d5df094a5f89 = { "781" } km, { "86.4" }°

seg-94bc78cee128 = { "1621" } MHz ({ "1616" }–{ "1626" } MHz-bånd)

seg-3f5de7f74502 = ingen udsendes

seg-4944294c230f = PUBLIC, <a1>NAVIGATION { "72" }({ "1" })</a1>, beskrivelse af konstellationen

seg-c2a2761f73b1 = { "550" } km, { "53" }°

seg-2ef501f97eff = Ku-bånd, værdi midt i båndet (repræsentativ)

seg-567fab40bd24 = ingen (opportunistiske signaler)

seg-a76527ba66b6 = PUBLIC, <a1>Sensors { "2023" }</a1>, <a2>Satellite Navigation { "2026" }</a2>

seg-f5dd5086eedd = { "700" } km, { "55" }°

seg-5fa6b60f66b4 = nær B1 (skjult i kilden; L1 som stedfortræder)

seg-5ebbf0042d7c = REPRESENTATIVE

seg-4f3e5a683682 = { "600" } km, { "97.8" }°

seg-c06f62ca5173 = { "5020" } MHz (RNSS C-bånds centrum)

seg-884c81e55e79 = PUBLIC, <a1>InsideGNSS</a1>

seg-3b1fd041f9ba = { "500" } km (repræsentativ)

seg-522c85402d84 = L1 (repræsentativ)

seg-064b03765e4d = <c1/>, grad { "6" }, { "60" } s, opdateret hvert { "30" } s, intet ur, { "0.24" } m styringsresidual

seg-5619bc61b958 = WORKSHOP og PUBLIC

seg-20572d7e348d = { "510" } km, { "97.4" }°

seg-a17f4b4f7fb5 = { "1191.795" } MHz

seg-fad0950a2d67 = <c1/>, grader og postafstand i forudindstillingsfilen

seg-e881ffc4e14b = RNSS er radionavigationssatellittjenesten; RNTF er Resilient Navigation and Timing Foundation.

seg-e9524c71636d = <b>Celeste IOD.</b> Forudindstillingen for Den Europæiske Rumorganisations (ESA's) Celeste-demonstration i kredsløb (IOD) er den eneste, der bruger materiale fremlagt på ESA Navigation Innovation and Support Programme (NAVISP) LEO-PNT-workshoppen, { "2026" }: meddelelsesstrukturen (Galileos Kepler-sæt plus korrektionspolynomier langs/på tværs/radialt, urpolynomium, SVID, helbred, IOD, ionosfære- og UTC-parametre), postafstanden og CSV-kolonnenavnene. Banen ({ "510" } km, næsten polær solsynkron) og bærebølgen stammer fra offentlige kilder, der er nævnt i filen. Celestes bitlayout er ikke offentligt og gengives ikke; senere Celeste-faser og Den Europæiske Unions (EU's) LEO-PNT-system kan afvige. Hver værdi afledt af workshoppen findes i modulet <c1/> i <c2/>, som bruges af <c3/>. Sådan holdes forudindstillingen tilbage: hvert tal i motoren, der stammer fra workshoppen, ligger i én fil, <c4/>, som <c5/> kun kompilerer med, når den findes, og i de scenarier, der kun findes i repositoriet, <c6/>. Sletter man den fil og de scenarier, holdes forudindstillingen tilbage uden nogen ændring af kildekoden; alle andre tests, uafhængige referencer og scenarier kører uden den, og READMEs antal scenariefiler tæller stadig de tilbageholdte filer med.

seg-906da2752f76 = Verifikation

seg-7338b6210228 = Række

seg-c5ce76c91ff7 = Mærkat

seg-cfe0d596296e = SISRE-vægte

seg-3e0059048a0d = Montenbruck et al. { "2018" } tabel (GPS, GLONASS, Galileo, BeiDou, geostationær)

seg-0f5e73171fe0 = Galileo ICD's brugeralgoritme

seg-29ad977ef423 = RTKLIB <c1/> på fire virkelige Galileo-broadcast-efemerider, { "1" } mm pr. akse (<c2/>)

seg-ecec254e8219 = katalogets kontrolværdi <c1/>; eksempelramme RTCM { "10403" } { "1005" }

seg-388633e4e785 = Tilpasning og SISRE-afvejning

seg-8b85c3277e66 = totlegemesreference genfundet til { "1" } mm; korrigeret J2–J6-tilpasning til { "1" } mm; monoton vækst med intervallet

seg-4de7f2b173c5 = Kontinuitet midt i passagen

seg-bdbd2771c7f5 = springidentitet; lukket kegleformel som grænse mod stikprøvetagning

seg-468a92a2caf7 = Binært format og budget

seg-ba26f5f63172 = rundture; hvert felts halve trin under { "1" } mm

seg-9be43cbef131 = RINEX-lignende og CSV

seg-a7748156fd6e = rundture

seg-88b5cda10923 = Liu et al. { "2025" } 22-parametermodel og tilpasning

seg-7272ebdc1fec = Præcise TU Graz ITSG-baner for fire satellitter mod artiklens tabeller { "4" }, { "5" }, { "6" } og { "8" }: forhold for langs, på tværs, radialt og SISRE fra { "0.755" } til { "1.138" } på artiklens dage og fra { "0.683" } til { "1.186" } på otte tilbageholdte dage, inden for 1,5x (<c1/>)

seg-94066142a642 = ATOMIC-polynomium uden ur og tabellen med fem højder

seg-205cdc6a3696 = ATOMIC-fakta fra InsideGNSS; den offentliggjorte Liu-tabel trykt ved siden af Kshanas tilpasning til integreret bane, ikke fastlåst

seg-8c00ed11609c = ICD's lukkede formler; den mod RTKLIB kontrollerede Klobuchar-model

seg-d5653e0958b5 = SISRE er kun repræsentationsfejl: ingen fejl fra banebestemmelse eller prædiktion.

seg-4968d9fcbc19 = Referencen er en Kshana-integration (uden tredjelegeme, solstrålingstryk eller tidevand), ikke en virkelig satellits præcise bane.

seg-6a4a1bf21b50 = Det binære format og den RINEX-lignende blok er Kshanas egne.

seg-26c0a2693081 = NeQuick-G bæres med, men integreres ikke til en forsinkelse; ingen korrektion for en satellit inde i ionosfæren.

seg-2a0c8190c38e = Sammenligningen med Liu et al. afviger i baner, parameterlæsning og vægte.

seg-4abe216f987a = <s1>Forrige</s1>LEO-passage og linkbudget

seg-59d9bf4735d8 = <s1>Næste</s1>Fusioneret MEO- og LEO-positionering
