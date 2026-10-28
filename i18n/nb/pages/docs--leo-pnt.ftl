# docs--leo-pnt: translations (nb)

seg-46c7e6f003dd = System

seg-cae10fb9bff8 = Scenario

seg-f1f903f1b9ff = Robusthet

seg-1759a8cce7d6 = Typer

seg-71aee5eb55c5 = UHF

seg-f63dd3d7aad4 = Kilde

seg-587beeccaa11 = Forhåndsinnstilling

seg-e305279d5b11 = Innhold

seg-b03d56f501c3 = Type

seg-6752521002b2 = Del

seg-cf6ae60eea4f = Hjelpedata

seg-0bdbdd2c923b = Synkronisering

seg-b09dc4b322d3 = Efemeride

seg-3a835a49b43f = Andre tjenester

seg-a17f4b4f7fb5 = { "1191.795" } MHz

seg-c5ce76c91ff7 = Merkelapp

seg-c1020ac47091 = Hva én kjøring beregner

seg-f708914fed48 = Bånd

seg-486f17197d4d = REPRESENTATIVE, for C-båndssystemer der parametrene ikke er offentlige (for eksempel TrustPoint)

seg-03d5ae448705 = <c1/> (valgfri)

seg-fde146239f5d = Resultat av én kjøring

seg-a3f63252bd1b = Hva det omfatter

seg-7d2c6fbf95b7 = Kilde: <c1/>

seg-6f1f29597f4b = LEO-PNT i Kshana

seg-2a3a1f19005a = LEO-PNT er posisjonering, navigasjon og tidssynkronisering (PNT) fra satellitter i lav jordbane (LEO), ved siden av eller i stedet for de globale satellittnavigasjonssystemene (GNSS) i middels høy jordbane (MEO), slik som Global Positioning System (GPS) og Galileo. Denne siden binder sammen hver LEO-PNT-type og hvert LEO-PNT-scenario i motoren: hva hver beregner, båndene og signalforhåndsinnstillingene og hvor tallene deres kommer fra, hva navigasjonsmeldingen bærer, hva som er VALIDATED og hva som er MODELLED, og hvordan hvert scenario kjøres. Typesidene går dypere:

seg-8e3556046e63 = Side

seg-cdb06a47be0a = <c1/> (signalutforminger) og flerbåndspanelene i <c2/>

seg-09894e033033 = <c1/> (passeringsgeometri og linkbudsjett per bånd, posisjonsbestemmelser med lavt energibruk, ionosfæresondering, spoofing-monitorer)

seg-f19c0bfe2996 = <c1/> (den kringkastede meldingen: tilpasning, brukeralgoritme, binære formater og tekstformater)

seg-0fe4979f8309 = <c1/>, <c2/>, <c3/> (fusjonert posisjonering, presis punktposisjonering, posisjonering i 5G ikke-terrestrisk nettverk (NTN), tidssynkronisering, polar dekning)

seg-29013ad5656c = <c1/> (jamming-fossefall og forholdet mellom jammer og signal (J/S) per bånd)

seg-d291250b5d01 = <c1/> (kjeder, sveip, Monte Carlo og sammensetninger av hvilke som helst typer)

seg-8d2de8f77619 = Systemuavhengig først

seg-f3750a8f2863 = Motoren er en generisk LEO-PNT-simulator. Enhver konstellasjon (et Walker-mønster, eksplisitte baneelementer, et tolinjers elementsett (TLE) gjennom SGP4-propagatoren (Simplified General Perturbations { "4" }), eller en utformet enkeltpassering), enhver signalutforming (ethvert bånd, enhver blanding av komponenter med binær faseskiftmodulasjon (BPSK), binær offsetbærebølge (BOC) og frekvensdelt multippelaksess (FDMA)), enhver modell for navigasjonsmeldinger. Navngitte systemer er valgfrie forhåndsinnstillinger: datafiler, hver med sin kilde, som bare fyller ut det et scenario utelater. Hver funksjon, test, uavhengig referanse og medfølgende scenario kjører uten Celeste-data.

seg-4d3bd0301e59 = Forhåndsinnstillingen for Celeste IOD (demonstrasjon i bane) er én valgfri forhåndsinnstilling blant dem. Signalparametrene ble presentert på ESA NAVISP (European Space Agency Navigation Innovation and Support Programme) LEO-PNT-workshopen, { "2026" }, og har ennå ingen offentlig kilde. Hvert tall som stammer fra workshopen i motoren ligger i én fil, <a1><c1/></a1>, som <c2/> bare kompilerer inn når den finnes, og i scenarioene <c3/> som bare finnes i repositoriet. Når den filen og de scenarioene slettes, holdes forhåndsinnstillingen tilbake uten kildeendring; alle andre tester, uavhengige referanser og scenarioer kjører uten den (<c4/> vokter hvilke filer som kan nevne den). Denne siden oppgir ingen av tallene.

seg-5b348102cb63 = Typene og hvordan de henger sammen

seg-120b9be05fc3 = en signalutformings båndbegrensede effekttetthetsspekter (PSD), effekt i båndet, rotmiddelkvadrat-båndbredde (Gabor), kodesporingsjitter mot bærebølge-til-støy-tetthet (C/N0), akkvisisjonssøk og spektrale separasjonskoeffisienter (SSC) mot GNSS-signaler; en båndavveining (ultrahøy frekvens (UHF), L, S, C)

seg-d9febf3c74c8 = lukkede former VALIDATED, utforminger og avveining MODELLED

seg-d0d8d1edd9ee = <c1/> (flerbåndspaneler)

seg-dc3ceb315e9a = fossefall per bånd med jammere per bånd (kontinuerlig bølge (CW), chirp, smalbånd, bredbånd, tilpasset), hvert signals J/S og effektive C/N0 over en tidslinje

seg-126a14392994 = spektre VALIDATED, jammere MODELLED

seg-e63f73ab5bca = passeringsgeometri, Doppler og Doppler-rate, fririmstap, satellitt- og brukerantenner, gass-, regn-, scintillasjons- og bygningsinntrengingstap etter ITU-R (International Telecommunication Union, Radiocommunication Sector), C/N0 per bånd og epoke ved siden av MEO GNSS-bærebølgene; ionosfære per bånd og de ionosfærefrie parene; posisjonsbestemmelser med lavt energibruk; ionosfæresondering; spoofing-monitorer

seg-a9fd4162604f = komponenter VALIDATED, passering MODELLED

seg-91304e663174 = den kringkastede efemeride- og klokkemeldingen: tilpasning, avstandsfeil i signal i rommet (SISRE) mot tilpasningsintervall og oppdateringsperiode, kontinuitet ved oppdatering midt i passeringen, brukeralgoritme, binær ramme med 24-bits syklisk redundanskontroll (CRC-24Q), eksport i stil med RINEX { "4" } (Receiver Independent Exchange Format) og som kommaseparerte verdier (CSV)

seg-cf93a9ba065c = brukeralgoritme, vekter og CRC VALIDATED, tilpasninger MODELLED

seg-3084696ad387 = Doppler-posisjonering, felles GNSS + LEO-pseudoavstandsbestemmelser med forskyvninger mellom systemer, polar og arktisk geometri, tidsoverføring til koordinert universaltid (UTC), med et valgfritt tidsfeilforløp per epoke

seg-79117194e50b = maksimal Doppler VALIDATED, resten MODELLED

seg-1de31fd3cf86 = konvergens for presis punktposisjonering (PPP) med bare GNSS og med LEO-lag

seg-525733c10d9b = nøyaktighet for 5G NTN-posisjonering ut fra nedlenkens båndbredde (Cramér-Rao-grensen)

seg-cb8eee06e664 = ett system fra ende til ende: signalutforming, passering, melding, fusjonert posisjonsbestemmelse og PPP, hver overlevering oppført

seg-d28e18170f82 = hvilket som helst av det ovenstående lenket på én tidslinje, sveipet, kjørt som et Monte Carlo-ensemble eller sammensatt under felles betingelser

seg-5479654fabfd = Kjeden overleverer verdier i kode (se <a1>LEO-PNT-kjeden fra ende til ende</a1> nedenfor): signalutformingen bestemmer fordelingen av EIRP (ekvivalent isotropisk utstrålt effekt) i passeringsbåndet og den sporede brikketakten; passeringen gir den sporede C/N0 og kodejitteren; navigasjonsmeldingens SISRE og passeringens C/N0 vekter LEO-målingene i den fusjonerte posisjonsbestemmelsen.

seg-a0331a21413c = De generiske utformingene bruker offentlige båndsentre; hver er REPRESENTATIVE, ikke noe systems signal (<c1/>, <c2/>).

seg-a86ce24d81de = Bånd

seg-daf61ebdca17 = Tildeling

seg-ba6fbebc2a98 = Generisk utforming

seg-3332ae549a90 = Senter

seg-c7be6f6797a8 = Sendebåndbredde

seg-74f4e80c65cb = Komponenter

seg-e95de3591152 = Førsteordens ionosfærisk forsinkelse i forhold til L

seg-e769f0411e64 = Trukket tilbake av utgiveren; ingen arkivert kopi

seg-8b04e51a023e = ikke en radionavigasjonstildeling (representativ); bærebølge fra den offentlige <s1>openRECEIVER-undersøkelsen</s1> (siden er senere trukket tilbake; se <a1>LEO-SIGNAL.md</a1>)

seg-ea152d84aabc = { "465" } MHz

seg-8a3026904912 = { "10" } MHz

seg-e1500e8695b9 = BPSK({ "5" }) pilot og data

seg-ac33d89291ca = radionavigasjonssatellitttjenesten (RNSS), Galileo E5-senteret

seg-278d0b375f6f = { "20.46" } MHz

seg-54e10c07ace3 = BPSK({ "10" }) pilot og data

seg-5e28b8377751 = radiobestemmelsessatellitttjenesten (RDSS), S-bærebølgen til NavIC (Navigation with Indian Constellation)

seg-39e207bee75b = { "2492.028" } MHz

seg-a573432714b8 = { "16.5" } MHz

seg-6fe14d537f33 = RNSS, senter av tildelingen { "5010" }–{ "5030" } MHz

seg-48fabff33863 = { "5020" } MHz

seg-0b50907d3165 = { "20" } MHz

seg-c43105d1c770 = C utvidet

seg-c05714081a0e = utenfor RNSS-tildelingen (representativ)

seg-638ab0837b29 = { "5100" } MHz

seg-4d3857271629 = { "120" } MHz

seg-18bc5451fc46 = BPSK({ "50" }) pilot og data

seg-3714e1c00ab8 = S (mobil satellitttjeneste, MSS)

seg-cc26934bac14 = MSS-nedlenke, 3GPP-bånd (Third Generation Partnership Project) n256

seg-12ca7304ece7 = brukt av <c1/>

seg-896b6ee57728 = { "2172.5" } MHz

seg-e6e1d955489a = { "0.18" } til { "20" } MHz

seg-50e44c7042c9 = 5G New Radio-posisjoneringssignaler

seg-e75e48eeeca1 = BPSK(n) er binær faseskiftmodulasjon ved n × { "1.023" } Mchip/s. Forsinkelsesforholdet er <c1/> med <c2/> = { "1191.795" } MHz. Fririmstapet vokser med <c3/> ved samme avstand (−{ "8.2" } dB ved UHF, +{ "6.4" } dB ved S, +{ "12.5" } dB ved C).

seg-02f71b44edf5 = Forhåndsinnstillinger for signaler og systemer

seg-c60ce9c32b57 = REPRESENTATIVE, båndsentre fra ITU Radio Regulations

seg-58fae66f7c12 = <c1/> (signalutforminger): båndtabellen ovenfor; <c2/> (standard for <c3/>): UHF ved { "450" } MHz, L, S og C ved sentrene ovenfor, { "0" } dBW EIRP per bånd, et solsynkront Walker 240/12/1-lag på { "550" } km

seg-5d918965c00c = BPSK({ "10" }) ved { "5020" } MHz, isoflux-stråle

seg-dddb031a7e2e = PUBLIC: Leclère, Marathe og Reid, Institute of Navigation (ION) GNSS+ { "2025" }, <a1>arXiv { "2509.19551" }</a1>

seg-67fc4039084d = X1 ved { "1593.3225" } MHz ({ "1.023" } Mchip/s) og X5 ved { "1190.51625" } MHz ({ "10.23" } Mchip/s), de publiserte minste og største mottatte effektene, { "258" } satellitter på omtrent { "1080" } km (skall på { "53" } og { "97" } grader)

seg-f17f98d1ae0b = PUBLIC: <a1>orientering fra Resilient Navigation and Timing Foundation (RNTF)</a1>

seg-c6694cdbb02b = bursts i { "1616" }–{ "1626" } MHz, Doppler opptil ±{ "36" } kHz, { "66" } satellitter på { "780" } km ({ "781" } km i forhåndsinnstillingen <c1/>), mottatt effekt «{ "300" } til { "2400" } ganger GPS»

seg-704ec002a889 = <c1/> / <c2/> / <c3/> (signal-, passerings- og posisjoneringstyper)

seg-a4a3a7c7bc22 = PUBLIC signaltall: Kozhaya, Saroufim og Kassas, <a1>NAVIGATION { "72" }({ "1" })</a1>; REPRESENTATIVE bane

seg-49985bf11216 = et Ku-båndsfyr på { "240" } MHz brukt bare til Doppler, C/N0 omtrent { "57" } dB-Hz

seg-84cb50b019e0 = PUBLIC signalstruktur: <a1>PMC10301026</a1>; REPRESENTATIVE bane og effekt

seg-1c50faed9f1e = BPSK ved { "2.046" } Mchip/s nær L1 og L5

seg-c72e9b87f116 = <c1/> (<c2/> i meldingstypen)

seg-3dd4136094c0 = PUBLIC: <a1>InsideGNSS, ATOMIC (Autonomous Time and Orbit Determination for Microsatellite Constellations)-nyttelasten</a1>

seg-4f0cff24b4fd = en polynomefemeride av 6. orden uten klokkeledd (klokken er styrt mot GNSS-tid)

seg-9d1e7aebcd84 = WORKSHOP: presentert på ESA NAVISP LEO-PNT-workshopen, { "2026" }

seg-28c2e7ae6065 = demonstrasjonen i banes signalkonfigurasjon #1 og meldingsoppsett, i den ene filen som kan holdes tilbake

seg-9f0d16f43993 = Hver forhåndsinnstilling merker tallene sine PUBLIC (med en URL), REPRESENTATIVE (et dokumentert utformingsvalg, aldri en påstand om et virkelig system) eller WORKSHOP, og resultatet av hver kjøring som bruker en, oppgir hvilken.

seg-556fe9c6c3b1 = Navigasjonsmeldingen

seg-a220662ed8de = En LEO-navigasjonsmelding (<a1>LEO-NAVMSG.md</a1>) bærer fire deler, strukturen som Galileo Open Service Signal-in-Space Interface Control Document (OS SIS ICD) og de publiserte LEO-forslagene har felles:

seg-5bda276f6e82 = Galileo ICD-ens Kepler-sett med 16 parametere (kvadratroten av store halvakse, eksentrisitet, helling og dens rate, rektascensjon til knutepunktet og dens rate, perigeumargument, midlere anomali, korreksjon av middelbevegelse, seks harmoniske korreksjoner, referansetid), pluss korreksjonspolynomer langs banen, på tvers av banen og radielt; eller modellen med 22 parametere fra Liu et al. { "2025" } (<a1>doi 10.3390/rs17162894</a1>); eller ATOMIC-polynomet med null klokke

seg-8a7dabfece01 = ukenummer og tid i uken (TOW), og et klokkepolynom av andre orden (af0, af1, af2 om toc)

seg-24eaf4ae7eb3 = romfartøyidentifikator (SVID), datautgave (IOD), signalhelse

seg-e7d819b7a724 = ionosfærekorreksjoner for brukere med én frekvens (et sett i Klobuchar-stil og NeQuick-G ai0–ai2) og forskyvningen fra systemtid til UTC (A0, A1, skuddsekunder og tidsplanen for dem)

seg-200e59d9279c = Binærrammen er Kshanas egen dokumenterte koding, modellert etter disse komponentene, ikke noe systems bitoppsett. RINEX { "4.02" } definerer ingen LEO-navigasjonsposter, så den RINEX-lignende eksporten er en dokumentert Kshana-utvidelse (tidligere arbeid: <a1>arXiv { "2401.17767" }</a1>).

seg-aa18ab84599b = <c1/>-sveip av <c2/>

seg-70dc120ea19e = en barrage på { "50" } MHz ved { "1185" } MHz sveipet fra −{ "140" } til −{ "80" } dBW: GPS L5 går tapt ved −{ "105" } dBW, Galileo E5a og LEO L-båndssignalet ved −{ "100" } dBW; LEO-signalene i UHF-, S- og C-bånd beholder { "49.4" }, { "49.2" } og { "47.4" } dB-Hz ved hver effekt

seg-61f05d7e3a18 = en barrage på { "40" } MHz ved { "1185" } MHz som trappes opp { "5" } dB hvert { "10" } s fra −{ "125" } dBW: GPS L5 går tapt ved −{ "105" } dBW, Galileo E5a ved −{ "100" } dBW, Xona X5 (ved sin publiserte minsteeffekt, −{ "144.9" } dBW) ved −{ "95" } dBW; et generisk LEO-signal ved −{ "135" } dBW sporer fortsatt ved −{ "90" } dBW ({ "28.9" } dB-Hz). Mottatt effekt gir J/S-margin dB for dB

seg-6a3a46be60a5 = et posisjonshopp på { "30" } m på et oppmålt sted: Doppler-testen med bare GNSS oppdager det aldri; testen på alle kanaler gjør det, { "105" } s etter starten (se <a1>LEO-PASS.md</a1>)

seg-d0c4683d7c93 = <c1/>-sammensetning av <c2/>

seg-bf0ec52f63ea = fire spoofere, begge monitorer: en spoofer bare i L-bånd og en spoofer i alle bånd uten ionosfære fanges av monitoren mellom bånd ved starten ({ "300" } s) og av Doppler-monitoren ved { "420" } s og { "395" } s; en spoofer i alle bånd som tar hensyn til ionosfæren fanges bare av Doppler-monitoren ({ "395" } s); et skyv på { "30" } m med bare GNSS fanges av ingen av dem

seg-17bcc4ead2ee = <c1/>-kjede (<c2/>, <c3/>)

seg-d9b6e6fe6807 = GNSS jammet i { "15" } minutter (GPS L1 coarse/acquisition (C/A)-kode til omtrent { "10" } dB-Hz, E5a til { "17.4" } dB-Hz mot en terskel på { "25" } dB-Hz) mens LEO-signalene i S- og C-bånd holder { "49.2" } og { "47.4" } dB-Hz; RAIM (receiver autonomous integrity monitoring) på bare LEO-laget danner et beskyttelsesnivå ved hver epoke, under varselgrensen på { "50" } m vertikalt ved { "28" } av { "30" } rastertidspunkter, med alarmen utløst ved de to andre; nominelle faser og gjenopprettingsfaser { "5.4" } til { "15.6" } m

seg-42efdd12fc54 = Spoofing-monitorene, statistikken deres og begrensningene deres står på <a1>LEO-PASS.md</a1>. Flerbånds-fossefallet med en ulik jammer per bånd er <c1/> (<a2>LEO-SIGNAL.md</a2>).

seg-d9e58c4aa8d5 = Ett scenario per eksperimentfokusområde

seg-1ab626f27e9d = De åtte eksperimentfokusområdene i utlysningen om Celeste IOD for eksperimentering fra tredjeparter (ESA Open Space Innovation Platform, OSIP) er generiske LEO-PNT-spørsmål; hvert har et systemuavhengig scenario:

seg-afc60ca3c9da = Fokusområde

seg-8a8f40ce3e40 = Høypresisjonsposisjonering (PPP)

seg-b5eb3448dbb1 = <c1/>-sveip av <c2/>

seg-5692301bc7cf = et lag med 192 satellitter på { "500" }, { "1000" } og { "1500" } km kutter konvergensen for multi-GNSS float-PPP i München fra { "13.0" } min til { "3.25" }, { "3.25" } og { "3.5" } min (seks realiseringer, epoker på { "30" } s)

seg-3992215bc8c9 = PNT-robusthet (L, S, C)

seg-a2cc270b415c = se Robusthet

seg-8a6381ff15ac = 5G/6G NTN-kompatibilitet

seg-ae21ac79775f = <c1/>-sveip av <c2/>

seg-cb52e7eb3c36 = båndbredde for posisjoneringsreferanse { "180" } kHz til { "20" } MHz: sigma for avstand i senit { "6.5" } m til { "5.8" } cm, 3D-feil for ankomsttid { "30.1" } m til { "2.1" } m, med bunn satt av nettverkets synkroniseringsfeil på { "1" } m

seg-45985b521980 = PNT med lavt energibruk for tingenes internett (IoT) og mobil

seg-9afaaed509ef = <c1/>-sveip av <c2/> <c3/>

seg-3bb8cc776a28 = UHF EIRP −{ "35" } til +{ "5" } dBW: under en median C/N0 på omtrent { "35" } dB-Hz stiger energien per varm start-posisjonsbestemmelse fra { "18" } mJ til { "55" } J; over den er batterilevetiden ved én posisjonsbestemmelse i timen { "8334" } dager, bestemt av hvilestrømmen

seg-4b0890bd9215 = LEO-PNT-vitenskap

seg-a1ddeda103fa = skrått totalt elektroninnhold (TEC) fra hvert båndpar i en passering med fire bånd over Tromsø: { "18.85" } TEC-enheter gjenvunnet av hvert par, 1-sigma { "0.017" } (UHF med L) til { "2.9" } TEC-enheter (S med C)

seg-fc31db33e6fe = Ytterligere PNT-datatjenester

seg-91db4e7b4d9c = <c1/>-sammensetning av <c2/>

seg-aee8bb27a2fb = Kshana-meldingsrammen vokser fra { "146" } bytes (efemeride og klokke, { "1045" } biter) til { "154" } med Klobuchar-settet, { "159" } med NeQuick-G og { "171" } med UTC-parametrene

seg-bd6c76037986 = Innendørsnavigasjon (UHF)

seg-0a274a3aeb86 = innendørs C/N0 på topp i en tradisjonell bygning: UHF { "34.1" }, L { "24.2" }, S { "16.5" }, C { "9.0" } dB-Hz; i en termisk effektiv bygning UHF { "15.3" } dB-Hz og alle andre bånd lavere

seg-101de8218f35 = Fusjonert MEO + LEO PNT

seg-b4daa58a2fe7 = <c1/>-sveip av <c2/>

seg-903d8dcb96cc = Xona X5 fusjonert med GPS og Galileo over Madrid: 3D-feil med bare GNSS { "1.06" } m rotmiddelkvadrat (RMS); fusjonert { "0.08" } m ved en LEO-SISRE på { "5" } cm, { "0.57" } m ved { "0.5" } m og { "1.01" } m ved { "5" } m

seg-ebe7a27275cb = Ett scenario per sluttbrukerbransje

seg-7c21d067769a = Hver bransje er en <c1/>-kjede på én tidslinje, så den animeres, og hver har et <c2/>-medlem, så den eksporterer geometri (se <a1>Kjøring</a1>).

seg-1d1135625500 = Bransje

seg-f1a7e54ea7d0 = Autonome kjøretøy

seg-3610a5f7c352 = en bil i München: åpen vei, fusjonert feil { "0.30" } m i middel; i en bykløft på { "35" } grader beholder GPS og Galileo { "8" } satellitter og en middelfeil på { "5.8" } m, det generiske LEO-laget legger til { "4" } til { "5" } og bringer den til { "2.1" } m, fortsatt over terskelen på { "1.5" } m for kjørefeltnivå ved omtrent halvparten av epokene i kløften

seg-6622d9c7366d = Jernbane og sjøfart

seg-73ba745cb492 = det medfølgende <c1/>-skipet mister hver GNSS-satellitt ({ "12.1" } dB-Hz) mens LEO-passeringen i S- og C-bånd når { "44.2" } og { "38.1" } dB-Hz; det medfølgende <c2/>-toget når { "2" } m treghetsfeil { "35.8" } s inn i tunnelen; i det fri gir LEO-passeringen { "35" } til { "50" } dB-Hz i L

seg-c87973b9139a = Kritisk infrastruktur

seg-c16a4c99e132 = oscillatoren av TCXO-klasse (temperaturkompensert krystall) i en transformatorstasjons tidsserver som går fritt gjennom et døgn uten GNSS når { "29" } µs, forbi vernegrensen på { "1" } µs mellom { "75" } og { "80" } minutter etter tapet (på rasteret på 5 minutter); den samme klassen styrt mot Iridium holder seg innenfor −{ "40" } til +{ "11" } ns

seg-1be8e11b2530 = Polare og arktiske brukere

seg-660e450cb4ab = GPS + Galileo middel posisjonsfortynning av presisjon (PDOP) { "1.38" }, { "1.57" } og { "1.62" } ved Tromsø, Svalbard og Nordpolen; med Iridium { "1.29" }, { "1.34" } og { "1.26" }, fra { "3.0" }, { "5.5" } og { "6.8" } Iridium-satellitter i sikte

seg-22d99734acf1 = Trådløse nettverk 5G/6G

seg-abcc6337206f = en basestasjons ovnsstyrte krystalloscillator (OCXO) i holdover krysser nettverksgrensen på { "1.1" } µs etter { "8863" } s og sluttapplikasjonsgrensen på { "1.5" } µs etter { "10006" } s (analysen til typen <c1/>); styrt mot Xona X5 holder tidsfeilen seg mellom −{ "0.7" } og +{ "0.3" } ns hele døgnet, med et predikert 1-sigma på { "5" } ns, den oppgitte usikkerheten i den kringkastede UTC-forskyvningen

seg-532d6814ab2d = Sporing av eiendeler og IoT

seg-b4d6d822e1d0 = en containermerkelapps varme UHF-posisjonsbestemmelse koster { "18" } mJ på kaia og til sjøs ({ "8334" } dagers batteritid ved én posisjonsbestemmelse i timen) og { "34" } mJ i et lager ({ "5770" } dager), der L-bånd faller til { "20" } til { "24" } dB-Hz

seg-e54b0342fa79 = VALIDATED og MODELLED

seg-dd808d1741f3 = En rad er VALIDATED bare når en test gjengir et publisert oppsett og låser det publiserte tallet innenfor en oppgitt toleranse; alt annet er MODELLED med begrunnelsen oppgitt (<a1>VERIFICATION-MATRIX.md</a1>, <a2>MODELLED-RATIONALE.md</a2>).

seg-592a6cf625c5 = VALIDATED LEO-PNT-rader:

seg-344712930047 = lukket form for båndbegrenset signaleffekt og early-late-kodesporingsjitter ved publiserte driftspunkter (Betz og Kolodziejski { "2009" }), med Gabor-båndbredden og SSC kontrollert på tvers;

seg-e93d5b5d3dda = maksimal Doppler for en LEO-navigasjonssatellitt (Xona Pulsar X1 { "32" }–{ "34" } kHz, Iridium ±{ "36" } kHz), og Doppler-omhyllingskurven for en stasjonær bruker mot arXiv { "2509.19551" } tabell { "1" };

seg-b02c1b42e509 = ITU-R P.838-3-regnkoeffisienter, P.618-14-regndemping og troposfærisk scintillasjon, og P.2109-2 tap ved inntrenging i bygning mot valideringsdataene til ITU-R Study Group { "3" };

seg-fc668542b66d = skaleringen av førsteordens ionosfærisk forsinkelse og fririmstapet (IS-GPS-200 gruppeforsinkelsesforhold, Friis-formen);

seg-59847c667c8b = de globale gjennomsnittlige SISRE-vektene (Montenbruck et al. { "2018" }), Galileo ICD-brukeralgoritmen mot RTKLIB på virkelige kringkastede efemerider, og CRC-24Q mot katalogens kontrollverdi.

seg-922761c46f8a = MODELLED LEO-PNT-rader: hver signalutforming og båndavveining, flerbånds-fossefallet, hver passering og hvert linkbudsjett som helhet, forhåndsinnstillingene, posisjonsbestemmelser med lavt energibruk, meldingstilpasningen og formatene, Doppler og felles posisjonering, PPP-konvergens, NTN-posisjonering, tidsoverføring, polar dekning, kjeden fra ende til ende, spoofing-monitorene og ionosfæresonderingen, og hver kampanje (en kampanje setter sammen typer og legger ikke til noen fysikk; sammensetningsidentitetene testes, <a1>CAMPAIGNS.md</a1>). Ingen LEO-C/N0, avstandsfeil eller posisjoneringstall er sammenlignet med en måling av noen satellitt.

seg-3cc1d3f1c0f8 = Kjøre et scenario

seg-00d5b60c0ebb = Hvert scenario ovenfor følger med: <c1/> skriver det ut, og

seg-e01ebe977e65 = skriver, ved siden av filen, resultatet (<c1/>), diagrammet (<c2/>), den avanserte rapporten (<c3/> og <c4/>, med en del som bygger inn den animerte kjøringen og lister eksportene), den interaktive spilleren (<c5/>) og eksportene. Hva som gjelder avhenger av typen:

seg-8a96eda978b4 = en kjøring med tidsakse animeres: epokene i <c1/>, <c2/> i en spoofing-kjøring, tidslinjene i <c3/>, felles epoker og tidssynkroniseringsforløp i <c4/>, feilkurvene i <c5/> og hver kampanjekjede. Et sveip eller en sammensetning har ingen tidsakse: <c6/> avviser det med utgangsstatus { "1" }, og da skriver kommandoen ingenting i det hele tatt, så kjør de åtte sveipene og sammensetningene ovenfor (<c7/>, <c8/> og hvert <c9/>-scenario unntatt <c10/>) uten <c11/>;

seg-8d26148aeeff = <c1/> og <c2/> eksporterer efemerider i CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON og STK (Systems Tool Kit) for passeringens geometri; en kampanje eksporterer hvert medlem som har geometri som sitt eget filsett, med medlemsetiketten i filnavnet (<c3/>), så hver bransje eksporterer LEO-passeringene sine; de andre LEO-typene sier hvorfor et format ikke gjelder (<a1>INTEROP.md</a1>).

seg-6f3ad057f914 = De gjenværende LEO-scenarioene, etter type (detaljer på hver types side):

seg-73365a12bf64 = <c1/>, <c2/>, valgfri <c3/>

seg-f34e2d4b3374 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, valgfri <c6/>

seg-559eaf4bafa1 = <c1/>, <c2/>, <c3/>, <c4/>, valgfri <c5/>

seg-731d447261fc = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, valgfri <c6/>

seg-e3017b224dfc = <c1/>, <c2/>, valgfri <c3/>

seg-1ada84b384ee = De valgfrie scenarioene finnes bare i repositoriet og holdes tilbake sammen med Celeste-forhåndsinnstillingsfilen.

seg-6305e46ec778 = To av dem ligger i andre typer. <c1/> (<c2/>) dimensjonerer en LEO-PNT-konstellasjon på 5000 satellitter i fire illustrative Walker-skall: tilgjengelighet { "99.22" } % ved en PDOP på { "3" } eller lavere over en maske på { "20" }°, median PDOP { "1.11" } og { "39.4" } satellitter i sikte i gjennomsnitt over { "648" } rasterpunkter og { "12" } epoker. <c3/> (<c4/>) spør hvor lenge databladets OCXO i en LEO-smallsat holder seg innenfor en slottvernegrense på { "100" } ns ved k = { "3" } etter siste GNSS-posisjonsbestemmelse: vernegrensen brytes { "650.8" } s etter en posisjonsbestemmelse, så den trenger en posisjonsbestemmelse minst hvert { "645.8" } s ({ "133.8" } i døgnet), med frekvensstøy som følger tilfeldig gange som det dominerende leddet.

seg-ee9f20a4485b = LEO-PNT-kjeden fra ende til ende

seg-a6167db680ba = Typen <c1/> (<a1><c2/></a1>) følger ett LEO-PNT-system fra signalutformingen til brukerens posisjon. Hvert trinn er motorens egen type, kjørt på sin egen tabell i kjedescenarioet, og kjeden overleverer verdier fra ett trinn til det neste i kode:

seg-38ce4c90dd78 = Fra

seg-2cbf005ed5cc = Til

seg-5d84d64174b6 = Hva som overleveres

seg-15372352ab42 = den sporede komponentens effektandel, andelen i båndet og den sporede brikketakten (båndets EIRP-fordeling og dets C/N0-forskyvning)

seg-0be525c6b695 = kjedesatellittens høyde og helling (meldingens referansebane), med mindre <c1/> oppgir dem

seg-d2306e118be7 = den sporede C/N0 ved posisjoneringsmasken og i senit, fra en minste kvadraters linje i sin(elevasjon) tilpasset passeringen

seg-ee40b8cd109b = avstandsfeilen i signal i rommet (SISRE): meldingens representasjonsfeil (rotmiddelkvadrat, bane og klokke) med scenarioets banebestemmelsesledd <c1/> i kvadratsum

seg-b4b3dff58f3b = bærebølgefrekvensen og den sporede brikketakten

seg-4def115dba1b = En verdi overleveres bare der den nedstrøms tabellen lar den stå uoppgitt, og hver overlevering står i resultatets <c1/>-matrise med verdi, enhet og mål. Et bånd i <c2/> må navngi utformingen (<c3/>); slik bærer et <c4/>-bånd også hvilken som helst <c5/>-utforming på egen hånd: det overtar utformingens senterfrekvens, sendebåndbredde og sporede brikketakt, fordeler EIRP-en på komponentene, og rapporterer C/N0 for den sporede komponenten og den båndbegrensede koherente early-late-kodesporingsjitteren (Betz og Kolodziejski { "2009" }; halvbrikkeavstand, sløyfe på { "1" } Hz, { "20" } ms) ved hver epoke.

seg-2a2b15256cf4 = generic: den representative <c1/>-utformingen, en { "1080" } km, { "53" }°-passering over Madrid, et Walker-lag med 240 satellitter

seg-bb05e8e505e3 = sporet C/N0-topp { "58.2" } dB-Hz, median kodejitter { "0.050" } m; SISRE { "0.250" } m overlevert; 3D-feil med bare GNSS (rotmiddelkvadrat, RMS) { "1.60" } m, GNSS + LEO { "0.43" } m; konvergens for presis punktposisjonering (PPP) { "11.5" } min med bare GNSS, { "7.5" } min med LEO-laget

seg-4d1299ee4725 = Xona Pulsar X5 (arXiv { "2509.19551" }), skallet med helling for posisjonering og begge skall for PPP

seg-a8fe501bf419 = sporet C/N0-topp { "66.3" } dB-Hz, median kodejitter { "0.018" } m; RMS 3D-feil med bare GNSS { "1.49" } m, GNSS + LEO { "0.68" } m; PPP-konvergens { "20.6" } min med bare GNSS, { "5.9" } min med Pulsar

seg-002e4c918dda = <c1/> (valgfri)

seg-a608af78a360 = Celeste IOD E5-konfigurasjon #1 med Celeste-meldingens forhåndsinnstilling (tilbakeholdt sammen med forhåndsinnstillingen)

seg-be428c21bd27 = passeringen gjengir den høyeste totale C/N0 som forhåndsinnstillingen er kalibrert mot (verdien ligger i forhåndsinnstillingsfilen); to satellitter endrer knapt en fusjonert posisjonsbestemmelse på 95 minutter ({ "1.50" } m til { "1.48" } m RMS 3D)

seg-bf44ba47e48b = skriver resultatet, diagrammet, den avanserte rapporten (som bygger inn den animerte passeringen og lenker til eksportene), den interaktive spilleren, og efemeridefiler i CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON og STK (Systems Tool Kit) for passeringens geometri.

seg-a08e67a32d60 = Kjeden er MODELLED: den legger ikke til noen fysikk, og hvert trinn beholder sine egne merkelapper. C/N0-modellen i posisjoneringstrinnet er en rett linje i sin(elevasjon), så en passeringsspesifikk form er redusert til to tall; meldingstrinnet modellerer ingen banebestemmelse, og derfor er <c1/> en oppgitt inndata ({ "0.25" } m i de medfølgende scenarioene, representativt for banebestemmelsen om bord på desimeternivå og den styrte klokken på brikkeskala som ATOMIC-nyttelasten rapporterer: <a1>https://insidegnss.com/first-steps-toward-a-fully-operational-leo-pnt-payload/</a1>).

seg-ee3c5b58e6fa = <s1>Forrige</s1>Månebane og måneoverflate som infrastruktur

seg-6b951d6413c8 = <s1>Neste</s1>LEO-signalutforminger

seg-9bfe27f7ebc5 = <s1>Forrige</s1>Oppdragstråd: månesegmentet
