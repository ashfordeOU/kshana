# docs--leo-pnt-fusion: translations (da)

seg-cae10fb9bff8 = Scenarie

seg-f63dd3d7aad4 = Kilde

seg-587beeccaa11 = Forudindstilling

seg-a6c63abeb7e6 = Medfølgende scenarier

seg-354b42e3a5d0 = RNTF

seg-c5ce76c91ff7 = Mærkat

seg-9673ca8c2705 = Kilde: <c1/>

seg-989faf40651b = Fusioneret MEO- og LEO-positionering, -navigation og -tidssynkronisering

seg-c14c586a29e7 = Tre scenarietyper leverer positionering, navigation og tidssynkronisering (PNT) med satellitter i lav jordbane (LEO) alene eller fusioneret med de globale satellitnavigationssystemer (GNSS) i middelhøj jordbane (MEO): <c1/> (position, hastighed og tid), <c2/> (præcis punktpositionering) og <c3/> (et ikke-terrestrisk 5G-net). Kilde: <c4/>.

seg-351652fa0e42 = Motoren er <b>systemuafhængig</b>. Hver konstellation er Walker-skaller, eksplicitte baneelementer eller en GNSS-forudindstilling af typen <c1/>; hvert signal er en bærebølge, en chiprate og en omhyldningskurve for bærebølge-til-støjtæthed (C/N0); hvert fejlbudget er et eksplicit ét-sigma. Navngivne systemer er valgfrie <b>forudindstillinger</b>, én fil hver, og hver funktion, test og medfølgende scenarie kører uden nogen bestemt af dem.

seg-3e7c6608d5c4 = Systemer og forudindstillinger

seg-1031746214ab = Et scenarie angiver sine systemer som <c1/>-tabeller. Dette komplette scenarie forener GPS' baseline-konstellation med et generisk LEO-lag og kører som skrevet (<c2/>; motor { $version } giver en median for positionens præcisionsfortynding på { "2.43" } for GPS alene og { "1.17" } fusioneret samt en kvadratisk middelfejl i 3D på { "2.06" } m og { "0.47" } m):

seg-6168fdca9b54 = <c1/> (Global Positioning System, GPS; eller <c2/>, <c3/>, <c4/>) tager en offentliggjort GNSS-konstellation; <c5/> udfylder det, tabellen lader stå åbent, fra en LEO-forudindstilling. C/N0 løber lineært i sinus til elevationen fra masken til zenit (et modelvalg: en virkelig passagekurve afhænger af sendeantennens stråleform). Pseudoafstandens ét-sigma er motorens termiske støj i delay-lock-loop (DLL) (<c6/>) ved dette C/N0 kombineret med signal-i-rummet-afstandsfejlen (SISRE), medmindre <c7/> fastsætter det; afstandsratens ét-sigma er bølgelængden gange <c8/>. Fordi sigma er et inddata, kan en separat signalmodel levere det, uden at positioneringskoden ved, hvor det kom fra.

seg-a3f63252bd1b = Hvad det bærer

seg-9872e31ebd72 = Kilder

seg-e20c823f36f3 = X1 ved { "1593.3225" } MHz, { "1.023" } Mchip/s, modtaget effekt −{ "148.2" } til −{ "139.1" } dBW; X5 ved { "1190.51625" } MHz, { "10.23" } Mchip/s, −{ "144.9" } til −{ "136.2" } dBW; { "258" } satellitter i { "18" } baneplaner ved { "1080" } km, { "53" } og { "97" } deg

seg-57b56c874c9b = PUBLIC: <a1>arXiv:{ "2509.19551" }</a1>. Repræsentativt: fordelingen mellem de to banehældninger, faseringen, afstandsfejlen

seg-b0c5e502c21b = Iridium Satellite Time and Location (STL): { "66" } satellitter, seks næsten polære baneplaner ved { "780" } km og { "86.4" } deg; udsendelser ved { "1616" } til { "1626" } MHz, kvadratur-faseskiftmodulation (QPSK) ved { "25 000" } symbol/s; modtaget effekt { "300" } til { "2400" } gange GPS' minimum

seg-d65ae64607c1 = PUBLIC: <a1>Resilient Navigation and Timing Foundation (RNTF)</a1>, <a2>National Institute of Standards and Technology (NIST)</a2>, <a3>konstellation</a3>. AFLEDT: effekten i dBW. Repræsentativt: bærebølge i båndets midte, afstandsfejl

seg-36771f73c21f = Kun Doppler: { "11.325" } GHz, { "240" } MHz orthogonal frequency-division multiplexing (OFDM)-beacon, C/N0 op til { "57.07" } dB-Hz, Doppler-fejl { "30" } Hz; første skal på { "1584" } satellitter ved { "550" } km og { "53" } deg

seg-44d4dd41848a = PUBLIC: <a1>Kozhaya, Saroufim og Kassas { "2025" }</a1>, <a2>Federal Communications Commission (FCC) 21-48</a2>. Repræsentativt: fasering, C/N0 ved horisonten

seg-2e13de07f9e9 = Binær faseskiftmodulation (BPSK) ved { "2.046" } Mchip/s nær L1 og L5; banebestemmelse på centimeterniveau

seg-dd94a3839cb3 = PUBLIC: <a1>indledende vurdering</a1>, <a2>GPS Solutions</a2>. Repræsentativt: bærebølger, effekt, hele den operationelle konstellation

seg-a34d6a186a36 = Et C-båndssystem i tildelingen { "5010" } til { "5030" } MHz for radionavigationssatellittjenesten (RNSS), til systemer, hvis parametre ikke er offentlige

seg-7712896ff69a = PUBLIC: tildelingen i <a1>International Telecommunication Union (ITU) Radio Regulations</a1>. Alt andet er <b>repræsentativt</b>

seg-89ebc32469d9 = En efemeride-og-ur-model: efemeride som polynomium af sjette orden, opdatering hvert { "30" } s, ur styret til GNSS-tid; SISRE { "0.26" } m

seg-ddbefb8a6723 = PUBLIC: <a1>InsideGNSS</a1>. AFLEDT: SISRE. Kombinér med enhver konstellation gennem <c1/>

seg-6389c92e07d4 = Den Europæiske Rumorganisations (ESA's) Celeste-demonstration i kredsløb (IOD), én konfiguration af en parametriseret signaludformning

seg-b8bd6e76aeb2 = PUBLIC bane (<a1>ESA</a1>, <a2>Institute of Navigation (ION) abstract { "16907" }</a2>); WORKSHOP signalparametre, fremlagt på workshoppen om LEO-PNT i ESA Navigation Innovation and Support Programme (NAVISP), { "2026" }

seg-bd7fb6eb444a = Hvert tal afledt af workshoppen findes i modulet <c1/> i <c2/>, som bruges af <c3/> (<c4/> håndhæver, hvor de må forekomme). Sådan holdes forudindstillingen tilbage: hvert tal i motoren, der stammer fra workshoppen, ligger i én fil, <c5/>, som <c6/> kun kompilerer med, når den findes, og i de scenarier, der kun findes i repositoriet, <c7/>. Sletter man den fil og de scenarier, holdes forudindstillingen tilbage uden nogen ændring af kildekoden; alle andre tests, uafhængige referencer og scenarier kører uden den, og READMEs antal scenariefiler tæller stadig de tilbageholdte filer med.

seg-12cdcc633ae0 = Én type, fire tilstande (<c1/>).

seg-72b5d8cc82ea = <b>Doppler.</b> En modtager, der måler Doppler <c1/> ved bølgelængden <c2/>, observerer afstandsraten <c3/>, hvor <c4/> er sigtelinjen og <c5/> modtagerurets drift. En batch-tilpasning med Gauss-Newton løser positionen, driften og eventuelt en konstant hastighed med analytiske partielle afledede <c6/>: kun satellithastigheden på tværs af sigtelinjen bærer positionsinformation, så geometrien er, hvordan sigtelinjerne drejer i løbet af vinduet. Rapporten giver fejlen mod vinduets længde, hvert systems Doppler-, Doppler-rate- og jerk-omhyldningskurve og en tabel for en enkelt passage. Én passage placerer brugeren langs sporet (tidspunktet for nul Doppler) og på tværs af det (Doppler-kurvens stejlhed); fejlen på tværs af sporet vokser uden grænse, når passagen går over hovedet, og spejlbilledet på den anden side af jordsporet passer næsten lige så godt (kun Jordens rotation adskiller dem). Et system med kun Doppler (<c7/>, forudindstillingen <c8/>) kører i denne tilstand.

seg-007d143c7fb4 = <b>Joint.</b> For hver epoke, vægtet mindste kvadraters metode over pseudoafstandene for kun GNSS-systemerne, kun LEO-systemerne og dem alle, ét modtagerur pr. system (inter-system-bias, ISB, estimeres) eller en kendt broadcast-forskydning på referencetidsskalaen. Den rapporterer den geometriske, positions-, vandrette, lodrette og tidsmæssige præcisionsfortynding (GDOP, PDOP, HDOP, VDOP, TDOP), fejlene, de estimerede bias og DOP mod antallet af LEO-satellitter, der føjes til GNSS-geometrien.

seg-22f136a0c96f = <b>Polar.</b> Satellitter i sigte, median-DOP og tilgængelighed mod breddegrad for MEO-GNSS, LEO og begge.

seg-1034557258d1 = <b>Timing.</b> På en kendt position er hver LEO-pseudoafstand en urmåling. Modtageren kører et Kalman-filter med to tilstande (fase, frekvens), hvis processtøj er oscillatorklassens hvide støj og random-walk-støj i frekvens (typen <c1/> og urmodellerne), holder tiden mellem passager og omregner systemtid til Coordinated Universal Time (UTC) med IS-GPS-200-udtrykket <c2/>; usikkerheden på broadcast-forskydningen er en bias pr. kørsel.

seg-0d76fcc05e7d = Et udvidet Kalman-filter (EKF) til float-præcis punktpositionering (PPP) på ionosfærefri kode og fase: statiske koordinater, et hvidt modtagerur, én inter-system-bias pr. ekstra system, en zenit-våd-forsinkelse som random walk og en float-heltalsmultiplicitet pr. satellitbue. Fejlen i den præcise bane og det præcise ur er fælles for en satellits kode og fase, så hver satellit er en korreleret opdatering med to rækker, i en Joseph-stabiliseret form, der holder kovariansen positivt definit gennem tusinder af fase-opdateringer på millimeterniveau. Målingerne simuleres ud fra samme model, så den normaliserede estimeringsfejl i anden potens (NEES) for positionen skal følge en chi-i-anden-fordeling med tre frihedsgrader; testen kontrollerer det over Monte Carlo-seeds. Konvergens er den første epoke, hvorefter de vandrette og lodrette fejl bliver under tærsklerne ({ "10" } cm) til kørslens slutning.

seg-630384148ec7 = En LEO-satellit krydser himlen på omkring ti minutter, en MEO-satellit flytter sig nogle få grader, så LEO-buer adskiller heltalsmultipliciteterne fra positionen langt hurtigere.

seg-17f9cf9cc24d = En ikke-terrestrisk 5G-net-nedlink (NTN) i mobilsatellittjenestens (MSS) S-bånd, 3rd Generation Partnership Project (3GPP) bånd n256 ({ "2170" } til { "2200" } MHz). Cramér-Rao-grænsen (CRB) for ankomsttid er <c1/>, hvor <c2/> er den kvadratiske middelbåndbredde (Gabor) (<c3/> for et fladt OFDM-spektrum), og for frekvensen af en tone <c4/>. Typen sammenligner kanaler (som standard en New Radio-kanal på { "5" } MHz og en smalbåndskanal på { "200" } kHz) gennem positionsbestemmelser fra nedlinkens ankomsttider med et ukendt modtagerur og en positionsbestemmelse med Doppler fra én satellit over en passage.

seg-516afd013d38 = Type, tilstand

seg-529a5aeea10a = Hvad det viser (med seed, deterministisk)

seg-6cd0b721006a = <c1/>, doppler

seg-c3c51264f12a = Xona Pulsar X1-lag ({ "258" } satellitter), { "1" } Hz Doppler-støj: 3D-fejl { "7.5" } m efter ti minutter ({ "26" } satellitter); på en enkelt passage er ét-sigma på tværs af sporet { "303" } m, når passagen går næsten over hovedet ({ "25" } km fra sporet) mod { "43" } m ved { "250" } km fra sporet

seg-da85037a6691 = Opportunistiske signaler med kun Doppler, { "30" } Hz Doppler-fejl ved { "10" } Hz: formelt vandret ét-sigma omkring { "10" } m efter { "20" } s med { "12" } satellitter og { "6" } m efter { "60" } s

seg-4dbb00da5310 = <c1/>, joint

seg-553e8f4df276 = GPS og Galileo median-PDOP { "1.47" } og kvadratisk middelfejl (RMS) i 3D { "1.06" } m; Xona X5 alene { "1.73" } og { "0.49" } m; fusioneret { "1.06" } og { "0.41" } m; LEO-biasen på { "40" } ns ({ "11.99" } m) estimeret til { "12.06" } m

seg-83378a120e0d = Konvergens { "7.4" } min (kun MEO-GNSS), { "4.8" }, { "3.2" }, { "2.7" } og { "2.3" } min med { "60" }, { "96" }, { "192" } og { "288" } LEO-satellitter

seg-4aadc3b41822 = Afstandsgrænse { "0.26" } til { "1.03" } m for { "4.5" } MHz og { "6.5" } til { "26" } m for { "180" } kHz; positionsbestemmelser nær { "2" } m mod { "26" } m

seg-5b1019210ca7 = <c1/>, polar

seg-108488f6cc6c = GPS og Galileo VDOP { "1.20" } ved ækvator, { "1.51" } ved { "89.9" } deg; med Iridium { "1.14" } ved polen

seg-bcdbe0796127 = <c1/>, timing

seg-94ab83c05f50 = Iridium-tidsoverførsel over { "6" } timer ved Boulder: { "9.9" } til { "11.4" } ns RMS ved nominelt C/N0 på tværs af fire oscillatorklasser, { "15.1" } til { "25.0" } ns ved { "30" } dB lavere

seg-3007f5930dfd = <c1/> (valgfri)

seg-f6ff187a00aa = GNSS suppleret med de to IOD-satellitter på referencetidsskalaen (kun i repositoriet, tilbageholdt sammen med forudindstillingen)

seg-98710204278b = Typerne kører også inde i andre scenarier: <c1/> er medlem af fejningen <c2/> og af kampagnerne <c3/>, <c4/>, <c5/> og <c6/>; <c7/> af fejningen <c8/>; <c9/> af fejningen <c10/>; og <c11/> og <c12/> er trinnene med fusioneret positionsbestemmelse og PPP i typen <c13/>. Deres resultater står på <a1>LEO-PNT.md</a1>.

seg-2f3086178d0b = Offentliggjorte tal og mærkater

seg-8980b5ae869b = Tal

seg-0be9b5747c00 = Kshana

seg-3d2d01038419 = Iridium-Doppler op til ±{ "36" } kHz

seg-a88258961299 = { "35.9" } kHz, maksimum over et døgns passager, inden for { "5" }%

seg-5bc3150b53f6 = VALIDATED (<c1/>)

seg-35a3ec8ee073 = Xona Pulsar X1 maksimal Doppler { "32" } til { "34" } kHz

seg-499acd31a8f8 = arXiv:{ "2509.19551" }

seg-e8c9c880a3eb = { "33.6" } kHz fra én satellit i hver offentliggjort skal ({ "1080" } km, { "53" } og { "97" } deg), inden for intervallet uden udvidelse; skallen på { "53" } deg alene topper ved { "31.8" } kHz, fordi Jordens rotation bremser en prograd bane i forhold til jorden

seg-e12713d5019f = VALIDATED (samme test)

seg-370ca62e7fc7 = Xona Pulsar X1 jerk ±{ "1.26" } Hz/s²

seg-4de9b0895288 = omkring { "1.0" } Hz/s² på en passage over hovedet

seg-5019322f4669 = rapporteret, ikke valideret

seg-7fcb83027ff4 = PPP-konvergens { "9.6" } → { "7.0" }, { "3.2" }, { "2.1" }, { "1.3" } min med 60/96/192/288 LEO

seg-856e73fb2fb5 = Li et al., <em>Journal of Geodesy</em> { "93" }:{ "749" } ({ "2019" }), <a1>doi 10.1007/s00190-018-1195-2</a1>

seg-a03bc7c3b8a6 = { "7.4" } → { "4.8" }, { "3.2" }, { "2.7" }, { "2.3" } min, monoton

seg-0a1133c16dce = MODELLED konsistens i tendensen (konstellationer, støj og stationer er ikke gengivet)

seg-7c5292729f36 = Starlink omkring { "2" } m på { "20" } s med tre satellitter

seg-6a54a7c58ade = Kozhaya, Saroufim og Kassas { "2025" }

seg-13fc5fc4f69f = formelt vandret ét-sigma omkring { "10" } m efter { "20" } s med { "12" } satellitter, med en perfekt efemeride og al fejl samlet i et Doppler-sigma på { "30" } Hz ved { "10" } Hz

seg-4fc80a02ed6c = MODELLED sammenligning (modtager og målehyppighed er ikke gengivet)

seg-5d0ae24eb74c = Iridium-tidssynkronisering under { "40" } ns fra UTC(NIST)

seg-fa4467605bc4 = NIST

seg-b910bf5135dd = omkring { "10" } ns RMS modelleret

seg-9025f3c376c5 = MODELLED sammenligning

seg-4434b0ff1caa = Alt andet er MODELLED med sin begrundelse i verifikationsmatrixen (<c1/>): DOP kontrolleres mod et håndafledt tilfælde med fire satellitter, positionsbestemmelserne mod deres kovarians, Doppler-modellen mod identiteten for afstandsacceleration, PPP-filteret mod chi-i-anden-båndet for NEES og grænserne mod kvadratur.

seg-aa5482ac34ff = Begrænsninger, åbent angivet

seg-0b4564367dcd = Totlegemebaner med den sekulære drift fra J2, Jordens andet zonale harmoniske led; ingen fejl i broadcast-efemeridens tilpasning ud over SISRE-ét-sigma, ingen satellitantennes stråleform.

seg-b51ccfee4ab8 = Ingen ionosfærisk eller troposfærisk forsinkelse i <c1/> (PPP-filteret bærer en tilstand for våd forsinkelse; dets ionosfærefri kombination fjerner førsteordens ionosfæren), ingen scintillation, multipath, cycle slips eller løsning af heltalsmultiplicitet.

seg-a719ccac19c0 = NTN-nøjagtigheden er en grænse og ikke et opnået resultat.

seg-19ba6cc0ca75 = Forudindstillingsværdier mærket repræsentative er illustrative og beskriver ingen operatørs udformning.

seg-f9f335d67ff8 = <s1>Forrige</s1>LEO-navigationsmeddelelse

seg-062138bbb73c = <s1>Næste</s1>Konstellationsudformning
