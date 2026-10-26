# docs--leo-pnt-fusion: translations (nb)

seg-cae10fb9bff8 = Scenario

seg-f63dd3d7aad4 = Kilde

seg-587beeccaa11 = Forhåndsinnstilling

seg-a6c63abeb7e6 = Medfølgende scenarioer

seg-354b42e3a5d0 = RNTF

seg-c5ce76c91ff7 = Merkelapp

seg-9673ca8c2705 = Kilde: <c1/>

seg-989faf40651b = Fusjonert MEO- og LEO-posisjonering, navigasjon og tidssynkronisering

seg-c14c586a29e7 = Tre scenariotyper gir posisjonering, navigasjon og tidssynkronisering (PNT) med satellitter i lav jordbane (LEO) alene eller fusjonert med de globale satellittnavigasjonssystemene (GNSS) i middels høy jordbane (MEO): <c1/> (posisjon, hastighet og tid), <c2/> (presis punktposisjonering) og <c3/> (et 5G ikke-terrestrisk nettverk). Kilde: <c4/>.

seg-351652fa0e42 = Motoren er <b>systemuavhengig</b>. Hver konstellasjon er Walker-skall, eksplisitte baneelementer eller en GNSS-forhåndsinnstilling i typen <c1/>; hvert signal er en bærebølge, en brikketakt og en omhyllingskurve for bærebølge-til-støy-tetthet (C/N0); hvert feilbudsjett er et eksplisitt énsigma. Navngitte systemer er valgfrie <b>forhåndsinnstillinger</b>, én fil hver, og hver funksjon, test og medfølgende scenario kjører uten noen bestemt av dem.

seg-3e7c6608d5c4 = Systemer og forhåndsinnstillinger

seg-1031746214ab = Et scenario lister systemene sine som <c1/>-tabeller. Dette fullstendige scenarioet slår sammen GPS-grunnlinjekonstellasjonen med et generisk LEO-lag og kjører slik det står (<c2/>; motor { $version } gir en median posisjonsfortynning av presisjon på { "2.43" } for bare GPS og { "1.17" } fusjonert, og en rotmiddelkvadrat 3D-feil på { "2.06" } m og { "0.47" } m):

seg-6168fdca9b54 = <c1/> (Global Positioning System, GPS; eller <c2/>, <c3/>, <c4/>) tar en publisert GNSS-konstellasjon; <c5/> fyller ut det tabellen utelater fra en LEO-forhåndsinnstilling. C/N0 løper lineært i sinus til elevasjonen fra masken til senit (et modelleringsvalg: en virkelig passeringsomhyllingskurve avhenger av sendeantennens mønster). Pseudoavstandens énsigma er motorens termiske støy i delay-lock-loop (DLL) (<c6/>) ved den C/N0-en kombinert med avstandsfeilen i signal i rommet (SISRE), med mindre <c7/> fastsetter den; avstandsratens énsigma er bølgelengden ganger <c8/>. Fordi sigma er en inndata, kan en egen signalmodell mate den uten at posisjoneringskoden vet hvor den kom fra.

seg-a3f63252bd1b = Hva det omfatter

seg-9872e31ebd72 = Kilder

seg-e20c823f36f3 = X1 ved { "1593.3225" } MHz, { "1.023" } Mchip/s, mottatt effekt −{ "148.2" } til −{ "139.1" } dBW; X5 ved { "1190.51625" } MHz, { "10.23" } Mchip/s, −{ "144.9" } til −{ "136.2" } dBW; { "258" } satellitter i { "18" } baneplan på { "1080" } km, { "53" } og { "97" } grader

seg-57b56c874c9b = PUBLIC: <a1>arXiv:{ "2509.19551" }</a1>. Representativt: fordelingen mellom de to banehellingene, faseforskyvningen, avstandsfeilen

seg-b0c5e502c21b = Iridium Satellite Time and Location (STL): { "66" } satellitter, seks nesten polare baneplan på { "780" } km og { "86.4" } grader; bursts ved { "1616" } til { "1626" } MHz, kvadraturfaseskiftmodulasjon (QPSK) ved { "25 000" } symboler/s; mottatt effekt { "300" } til { "2400" } ganger GPS-minimum

seg-d65ae64607c1 = PUBLIC: <a1>Resilient Navigation and Timing Foundation (RNTF)</a1>, <a2>National Institute of Standards and Technology (NIST)</a2>, <a3>konstellasjon</a3>. AVLEDET: effekten i dBW. Representativt: bærebølge i båndets senter, avstandsfeil

seg-36771f73c21f = Bare Doppler: { "11.325" } GHz, { "240" } MHz fyr med ortogonal frekvensdelt multipleksing (OFDM), C/N0 opptil { "57.07" } dB-Hz, Doppler-feil { "30" } Hz; første skall på { "1584" } satellitter på { "550" } km og { "53" } grader

seg-44d4dd41848a = PUBLIC: <a1>Kozhaya, Saroufim og Kassas { "2025" }</a1>, <a2>Federal Communications Commission (FCC) 21-48</a2>. Representativt: faseforskyvning, C/N0 ved horisonten

seg-2e13de07f9e9 = Binær faseskiftmodulasjon (BPSK) ved { "2.046" } Mchip/s nær L1 og L5; banebestemmelse på centimeternivå

seg-dd94a3839cb3 = PUBLIC: <a1>innledende vurdering</a1>, <a2>GPS Solutions</a2>. Representativt: bærebølger, effekt, hele den operative konstellasjonen

seg-a34d6a186a36 = Et C-båndssystem i tildelingen { "5010" } til { "5030" } MHz for radionavigasjonssatellitttjenesten (RNSS), for systemer der parametrene ikke er offentlige

seg-7712896ff69a = PUBLIC: tildelingen i <a1>International Telecommunication Union (ITU) Radio Regulations</a1>. Alt annet er <b>representativt</b>

seg-89ebc32469d9 = En efemeride-og-klokke-modell: efemeride med polynom av sjette orden, { "30" } s oppdatering, klokke styrt mot GNSS-tid; SISRE { "0.26" } m

seg-ddbefb8a6723 = PUBLIC: <a1>InsideGNSS</a1>. AVLEDET: SISRE. Kombiner med en hvilken som helst konstellasjon gjennom <c1/>

seg-6389c92e07d4 = Celeste-demonstrasjonen i bane (IOD) fra Den europeiske romorganisasjonen (ESA), én konfigurasjon av en parametrisert signalutforming

seg-b8bd6e76aeb2 = PUBLIC bane (<a1>ESA</a1>, <a2>Institute of Navigation (ION) abstract { "16907" }</a2>); WORKSHOP signalparametere, presentert på ESA Navigation Innovation and Support Programme (NAVISP) LEO-PNT-workshopen, { "2026" }

seg-bd7fb6eb444a = Hvert tall som stammer fra workshopen ligger i modulen <c1/> i <c2/>, brukt av <c3/> (<c4/> håndhever hvor de kan forekomme). Slik holdes forhåndsinnstillingen tilbake: hvert tall fra workshopen i motoren ligger i én fil, <c5/>, som <c6/> bare kompilerer inn når den finnes, og i scenarioene <c7/> som bare finnes i repositoriet. Når den filen og de scenarioene slettes, holdes forhåndsinnstillingen tilbake uten kildeendring; alle andre tester, uavhengige referanser og scenarioer kjører uten den, og antallet scenariofiler i README teller fortsatt de tilbakeholdte filene.

seg-12cdcc633ae0 = Én type, fire moduser (<c1/>).

seg-72b5d8cc82ea = <b>Doppler.</b> En mottaker som måler Doppler <c1/> ved bølgelengde <c2/> observerer avstandsraten <c3/>, med <c4/> siktlinjen og <c5/> mottakerklokkens drift. En batch-tilpasning med Gauss-Newton løser posisjonen, driften og eventuelt en konstant hastighet, med analytiske partiellderiverte <c6/>: bare satellitthastigheten på tvers av siktlinjen bærer posisjonsinformasjon, så geometrien er hvordan siktlinjene dreier seg i løpet av vinduet. Rapporten gir feilen mot vindulengde, omhyllingskurven for Doppler, Doppler-rate og rykk for hvert system, og en tabell for én passering. Én passering lokaliserer brukeren langs sporet (tidspunktet for null Doppler) og på tvers av det (hvor bratt Doppler-kurven er); feilen på tvers av sporet vokser uten grense når passeringen går rett over, og speilbildet på tvers av bakkesporet passer nesten like godt (bare jordens rotasjon skiller dem). Et system med bare Doppler (<c7/>, forhåndsinnstillingen <c8/>) kjører i denne modusen.

seg-007d143c7fb4 = <b>Felles.</b> For hver epoke, vektet minste kvadraters metode over pseudoavstandene til bare GNSS-systemene, bare LEO-systemene og alle sammen, én mottakerklokke per system (forskyvningen mellom systemer, ISB, estimeres) eller en kjent kringkastet forskyvning på referansetidsskalaen. Den rapporterer den geometriske, posisjons-, horisontale, vertikale og tidsmessige fortynningen av presisjon (GDOP, PDOP, HDOP, VDOP, TDOP), feilene, de estimerte forskyvningene, og DOP mot antallet LEO-satellitter lagt til GNSS-geometrien.

seg-22f136a0c96f = <b>Polar.</b> Satellitter i sikte, median DOP og tilgjengelighet mot breddegrad for MEO GNSS, LEO og begge.

seg-1034557258d1 = <b>Tidssynkronisering.</b> På en kjent posisjon er hver LEO-pseudoavstand en klokkemåling. Mottakeren kjører et Kalman-filter med to tilstander (fase, frekvens) der prosesstøyen er oscillatorklassens hvite og tilfeldig-gange-frekvensstøy (<c1/> og klokkemodellene), holder tiden mellom passeringer, og omregner systemtid til koordinert universaltid (UTC) med IS-GPS-200-uttrykket <c2/>; usikkerheten i den kringkastede forskyvningen er en skjevhet per kjøring.

seg-0d76fcc05e7d = Et float-EKF (utvidet Kalman-filter) for presis punktposisjonering (PPP) på ionosfærefri kode og fase: statiske koordinater, en hvit mottakerklokke, én forskyvning mellom systemer per ekstra system, en zenitvåt forsinkelse som følger tilfeldig gange, og en float-flertydighet per satellittbue. Feilen i den presise banen og klokken er felles for en satellitts kode og fase, så hver satellitt er én korrelert oppdatering med to rader, i en Joseph-stabilisert form som holder kovariansen positiv definitt over tusenvis av faseoppdateringer på millimeternivå. Målingene simuleres fra samme modell, så den normaliserte estimeringsfeilen i kvadrat (NEES) for posisjonen må følge en khikvadratfordeling med tre frihetsgrader; testen kontrollerer det over Monte Carlo-seed. Konvergens er første epoke etter hvilken de horisontale og vertikale feilene holder seg under terskelverdiene ({ "10" } cm) til kjøringen er slutt.

seg-630384148ec7 = En LEO-satellitt krysser himmelen på omtrent ti minutter, en MEO-satellitt flytter seg noen få grader, så LEO-buer skiller flertydighetene fra posisjonen mye raskere.

seg-17f9cf9cc24d = En 5G-nedlenke i et ikke-terrestrisk nettverk (NTN) i S-båndet for mobil satellitttjeneste (MSS), 3rd Generation Partnership Project (3GPP)-bånd n256 ({ "2170" } til { "2200" } MHz). Cramér-Rao-grensen (CRB) for ankomsttid er <c1/>, med <c2/> rotmiddelkvadrat-båndbredden (Gabor) (<c3/> for et flatt OFDM-spekter), og for frekvensen til en tone <c4/>. Typen sammenligner kanaler (som standard en New Radio-kanal på { "5" } MHz og en smalbåndskanal på { "200" } kHz) gjennom posisjonsbestemmelser fra nedlenkens ankomsttid med en ukjent mottakerklokke og en Doppler-posisjonsbestemmelse med én satellitt over en passering.

seg-516afd013d38 = Type, modus

seg-529a5aeea10a = Hva den viser (med seed, deterministisk)

seg-6cd0b721006a = <c1/>, doppler

seg-c3c51264f12a = Xona Pulsar X1-laget ({ "258" } satellitter), { "1" } Hz Doppler-støy: 3D-feil { "7.5" } m etter ti minutter ({ "26" } satellitter); på én enkelt passering er énsigma på tvers av sporet { "303" } m når passeringen går nesten rett over ({ "25" } km fra sporet) mot { "43" } m ved { "250" } km fra sporet

seg-da85037a6691 = Mulighetssignaler med bare Doppler, { "30" } Hz Doppler-feil ved { "10" } Hz: formelt horisontalt énsigma omtrent { "10" } m etter { "20" } s med { "12" } satellitter og { "6" } m etter { "60" } s

seg-4dbb00da5310 = <c1/>, joint

seg-553e8f4df276 = GPS og Galileo median PDOP { "1.47" } og rotmiddelkvadrat (RMS) 3D-feil { "1.06" } m; Xona X5 alene { "1.73" } og { "0.49" } m; fusjonert { "1.06" } og { "0.41" } m; LEO-skjevheten på { "40" } ns ({ "11.99" } m) estimert som { "12.06" } m

seg-83378a120e0d = Konvergens { "7.4" } min (bare MEO GNSS), { "4.8" }, { "3.2" }, { "2.7" } og { "2.3" } min med { "60" }, { "96" }, { "192" } og { "288" } LEO-satellitter

seg-4aadc3b41822 = Avstandsgrense { "0.26" } til { "1.03" } m for { "4.5" } MHz og { "6.5" } til { "26" } m for { "180" } kHz; posisjonsbestemmelser nær { "2" } m mot { "26" } m

seg-5b1019210ca7 = <c1/>, polar

seg-108488f6cc6c = GPS og Galileo VDOP { "1.20" } ved ekvator, { "1.51" } ved { "89.9" } grader; med Iridium { "1.14" } ved polen

seg-bcdbe0796127 = <c1/>, timing

seg-94ab83c05f50 = Iridium-tidsoverføring over { "6" } timer ved Boulder: { "9.9" } til { "11.4" } ns RMS ved nominell C/N0 på tvers av fire oscillatorklasser, { "15.1" } til { "25.0" } ns { "30" } dB lavere

seg-3007f5930dfd = <c1/> (valgfri)

seg-f6ff187a00aa = GNSS sammen med de to IOD-satellittene på referansetidsskalaen (bare i repositoriet, tilbakeholdt sammen med forhåndsinnstillingen)

seg-98710204278b = Typene kjører også inne i andre scenarioer: <c1/> er medlem av sveipet <c2/> og av kampanjene <c3/>, <c4/>, <c5/> og <c6/>; <c7/> av sveipet <c8/>; <c9/> av sveipet <c10/>; og <c11/> og <c12/> er trinnene for fusjonert posisjonsbestemmelse og PPP i typen <c13/>. Resultatene deres står på <a1>LEO-PNT.md</a1>.

seg-2f3086178d0b = Publiserte tall og merkelapper

seg-8980b5ae869b = Tall

seg-0be9b5747c00 = Kshana

seg-3d2d01038419 = Iridium-Doppler opptil ±{ "36" } kHz

seg-a88258961299 = { "35.9" } kHz, maksimum over et døgn med passeringer, innenfor { "5" }%

seg-5bc3150b53f6 = VALIDATED (<c1/>)

seg-35a3ec8ee073 = Xona Pulsar X1 maksimal Doppler { "32" } til { "34" } kHz

seg-499acd31a8f8 = arXiv:{ "2509.19551" }

seg-e8c9c880a3eb = { "33.6" } kHz fra én satellitt i hvert publiserte skall ({ "1080" } km, { "53" } og { "97" } grader), innenfor intervallet uten utvidelse; skallet på { "53" } grader alene har topp på { "31.8" } kHz, siden jordens rotasjon bremser en prograd bane i forhold til bakken

seg-e12713d5019f = VALIDATED (samme test)

seg-370ca62e7fc7 = Xona Pulsar X1 rykk ±{ "1.26" } Hz/s²

seg-4de9b0895288 = omtrent { "1.0" } Hz/s² på en passering rett over

seg-5019322f4669 = rapportert, ikke validert

seg-7fcb83027ff4 = PPP-konvergens { "9.6" } → { "7.0" }, { "3.2" }, { "2.1" }, { "1.3" } min med 60/96/192/288 LEO

seg-856e73fb2fb5 = Li et al., <em>Journal of Geodesy</em> { "93" }:{ "749" } ({ "2019" }), <a1>doi 10.1007/s00190-018-1195-2</a1>

seg-a03bc7c3b8a6 = { "7.4" } → { "4.8" }, { "3.2" }, { "2.7" }, { "2.3" } min, monoton

seg-0a1133c16dce = MODELLED konsistens i trenden (konstellasjoner, støy og stasjoner er ikke gjengitt)

seg-7c5292729f36 = Starlink omtrent { "2" } m på { "20" } s med tre satellitter

seg-6a54a7c58ade = Kozhaya, Saroufim og Kassas { "2025" }

seg-13fc5fc4f69f = formelt horisontalt énsigma omtrent { "10" } m etter { "20" } s med { "12" } satellitter, med en perfekt efemeride og all feil samlet i et Doppler-sigma på { "30" } Hz ved { "10" } Hz

seg-4fc80a02ed6c = MODELLED sammenligning (mottaker og målerate er ikke gjengitt)

seg-5d0ae24eb74c = Iridium-tidssynkronisering under { "40" } ns fra UTC(NIST)

seg-fa4467605bc4 = NIST

seg-b910bf5135dd = omtrent { "10" } ns RMS modellert

seg-9025f3c376c5 = MODELLED sammenligning

seg-4434b0ff1caa = Alt annet er MODELLED med begrunnelsen i verifikasjonsmatrisen (<c1/>): DOP kontrolleres mot et håndutledet tilfelle med fire satellitter, posisjonsbestemmelsene mot kovariansen sin, Doppler-modellen mot identiteten for avstandsakselerasjon, PPP-filteret mot khikvadrat-NEES-båndet, og grensene mot kvadratur.

seg-aa5482ac34ff = Begrensninger, oppgitt uten omsvøp

seg-0b4564367dcd = Totrekkslegemebaner med den sekulære driften fra J2, jordens andre sonale harmoniske; ingen tilpasningsfeil i kringkastet efemeride utover SISRE-énsigma, ingen satellittantennemønster.

seg-b51ccfee4ab8 = Ingen ionosfærisk eller troposfærisk forsinkelse i <c1/> (PPP-filteret har en tilstand for våt forsinkelse; dets ionosfærefrie kombinasjon fjerner førsteordens ionosfære), ingen scintillasjon, flerveis, syklusglipp eller løsning av heltallsflertydighet.

seg-a719ccac19c0 = NTN-nøyaktigheten er en grense, ikke et oppnådd resultat.

seg-19ba6cc0ca75 = Forhåndsinnstillingsverdier merket representative er illustrerende og beskriver ingen operatørs utforming.

seg-f9f335d67ff8 = <s1>Forrige</s1>LEO-navigasjonsmelding

seg-062138bbb73c = <s1>Neste</s1>Konstellasjonsutforming
