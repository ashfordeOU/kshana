# docs--leo-pnt: translations (da)

seg-46c7e6f003dd = System

seg-cae10fb9bff8 = Scenarie

seg-f1f903f1b9ff = Robusthed

seg-1759a8cce7d6 = Typer

seg-71aee5eb55c5 = UHF

seg-f63dd3d7aad4 = Kilde

seg-587beeccaa11 = Forudindstilling

seg-e305279d5b11 = Indhold

seg-b03d56f501c3 = Type

seg-6752521002b2 = Del

seg-cf6ae60eea4f = Hjælpedata

seg-0bdbdd2c923b = Synkronisering

seg-b09dc4b322d3 = Efemeride

seg-3a835a49b43f = Andre tjenester

seg-a17f4b4f7fb5 = { "1191.795" } MHz

seg-c5ce76c91ff7 = Mærkat

seg-c1020ac47091 = Hvad én kørsel beregner

seg-f708914fed48 = Bånd

seg-486f17197d4d = REPRESENTATIVE, til C-båndssystemer, hvis parametre ikke er offentlige (for eksempel TrustPoint)

seg-03d5ae448705 = <c1/> (valgfri)

seg-fde146239f5d = Resultat af én kørsel

seg-a3f63252bd1b = Hvad det bærer

seg-7d2c6fbf95b7 = Kilde: <c1/>

seg-6f1f29597f4b = LEO-PNT i Kshana

seg-2a3a1f19005a = LEO-PNT er positionering, navigation og tidssynkronisering (PNT) fra satellitter i lav jordbane (LEO), ved siden af eller i stedet for de globale satellitnavigationssystemer (GNSS) i middelhøj jordbane (MEO), såsom Global Positioning System (GPS) og Galileo. Denne side binder alle motorens LEO-PNT-typer og -scenarier sammen: hvad hver beregner, båndene og signalforudindstillingerne og hvor deres tal kommer fra, hvad navigationsmeddelelsen bærer, hvad der er VALIDATED, og hvad der er MODELLED, og hvordan hvert scenarie køres. Typesiderne går dybere:

seg-8e3556046e63 = Side

seg-cdb06a47be0a = <c1/> (signaludformninger) og panelerne i flerbåndsspektret <c2/>

seg-09894e033033 = <c1/> (passagegeometri og linkbudget pr. bånd, positionsbestemmelser med lavt energiforbrug, ionosfærelodning, spoofing-overvågning)

seg-f19c0bfe2996 = <c1/> (den udsendte meddelelse: tilpasning, brugeralgoritme, binære formater og tekstformater)

seg-0fe4979f8309 = <c1/>, <c2/>, <c3/> (fusioneret positionsbestemmelse, præcis punktpositionering, positionsbestemmelse med 5G non-terrestrial network (NTN), tidssynkronisering, polær dækning)

seg-29013ad5656c = <c1/> (jamming-vandfald og forholdet mellem jammer og signal (J/S) pr. bånd)

seg-d291250b5d01 = <c1/> (kæder, sweeps, Monte Carlo og sammensætninger af enhver art)

seg-8d2de8f77619 = Først og fremmest systemuafhængig

seg-f3750a8f2863 = Motoren er en generisk LEO-PNT-simulator. Enhver konstellation (et Walker-mønster, eksplicitte banelementer, et two-line element set (TLE) gennem propagatoren Simplified General Perturbations { "4" } (SGP4) eller et designet enkeltpas), enhver signaludformning (ethvert bånd, enhver blanding af komponenter med binary phase-shift keying (BPSK), binary offset carrier (BOC) og frequency-division multiple access (FDMA)), enhver navigationsbeskedmodel. Navngivne systemer er valgfrie forudindstillinger: datafiler, hver med sin kilde, som kun udfylder det, et scenarie udelader. Enhver funktion, test, uafhængig reference og medfølgende scenarie kører uden Celeste-data.

seg-4d3bd0301e59 = Celeste IOD-forudindstillingen (in-orbit demonstration) er én valgfri forudindstilling blandt dem. Dens signalparametre blev præsenteret på ESA NAVISP-workshoppen (European Space Agency Navigation Innovation and Support Programme) om LEO-PNT, { "2026" }, og har endnu ingen offentlig kilde. Hvert tal i motoren, der stammer fra workshoppen, findes i én fil, <a1><c1/></a1>, som <c2/> kun kompilerer med, når den findes, og i de scenarier, der kun findes i repositoriet, <c3/>. Hvis du sletter den fil og de scenarier, er forudindstillingen holdt tilbage uden nogen kodeændring; alle andre tests, uafhængige referencer og scenarier kører uden den (<c4/> vogter, hvilke filer der må nævne den). Denne side angiver ingen af dens tal.

seg-5b348102cb63 = Typerne og hvordan de hænger sammen

seg-120b9be05fc3 = en signaludformnings båndbegrænsede effektspektraltæthed (PSD), effekt i båndet, effektiv (Gabor-)båndbredde, kodesporingsjitter som funktion af bærebølge-til-støjtæthed (C/N0), erhvervelsessøgning og spektrale separationskoefficienter (SSC) i forhold til GNSS-signaler; en bandafvejning (ultra high frequency (UHF), L, S, C)

seg-d9febf3c74c8 = lukkede former VALIDATED, udformninger og afvejning MODELLED

seg-d0d8d1edd9ee = <c1/> (multibåndspaneler)

seg-dc3ceb315e9a = vandfald pr. bånd med jammere pr. bånd (continuous wave (CW), chirp, smalbånd, bredbånd, matchet), hvert signals J/S og effektive C/N0 over en tidslinje

seg-126a14392994 = spektre VALIDATED, jammere MODELLED

seg-e63f73ab5bca = passets geometri, Doppler og Doppler-rate, frirumstab, satellit- og brugerantenner, ITU-R-tab (International Telecommunication Union, Radiocommunication Sector) fra gasser, regn, scintillation og indtrængning i bygninger, C/N0 pr. bånd og epoke ved siden af MEO GNSS-bærebølgerne; ionosfære pr. bånd og de ionosfærefrie par; positionsbestemmelser med lavt energiforbrug; ionosfæresondering; spoofing-monitorer

seg-a9fd4162604f = komponenter VALIDATED, pas MODELLED

seg-91304e663174 = den udsendte efemeride- og urbesked: tilpasning, signal-in-space range error (SISRE) som funktion af tilpasningsinterval og opdateringsperiode, kontinuitet ved opdatering midt i passet, brugeralgoritme, binær ramme med et 24-bit cyclic redundancy check (CRC-24Q), eksport i stil med RINEX { "4" } (Receiver Independent Exchange Format) og som kommaseparerede værdier (CSV)

seg-cf93a9ba065c = brugeralgoritme, vægte og CRC VALIDATED, tilpasninger MODELLED

seg-3084696ad387 = Doppler-positionsbestemmelse, fælles GNSS + LEO pseudorange-positionsbestemmelser med intersystem-bias, polær og arktisk geometri, tidsoverførsel til Coordinated Universal Time (UTC), med et valgfrit tidsfejlspor pr. epoke

seg-79117194e50b = maksimal Doppler VALIDATED, resten MODELLED

seg-1de31fd3cf86 = konvergens af præcis punktpositionering (PPP) med kun GNSS og med LEO-lag

seg-525733c10d9b = nøjagtighed af 5G NTN-positionsbestemmelse ud fra downlink-båndbredden (Cramér-Rao-grænse)

seg-cb8eee06e664 = ét system fra ende til anden: signaludformning, pas, besked, fusioneret positionsbestemmelse og PPP, hver overdragelse opført

seg-d28e18170f82 = ethvert af ovenstående kædet på én tidslinje, sweepet, kørt som et Monte Carlo-ensemble eller sammensat under fælles betingelser

seg-5479654fabfd = Kæden overdrager værdier i koden (se <a1>LEO-PNT-kæde fra ende til anden</a1> nedenfor): signaludformningen fastlægger fordelingen af passbåndets EIRP (equivalent isotropically radiated power) og den sporede chiprate; passet giver den sporede C/N0 og kodejitteren; beskedens SISRE og passets C/N0 vægter LEO-målingerne i den fusionerede positionsbestemmelse.

seg-a0331a21413c = De generiske udformninger bruger offentlige bånds centre; hver af dem er REPRESENTATIVE og ikke et bestemt systems signal (<c1/>, <c2/>).

seg-a86ce24d81de = Bånd

seg-daf61ebdca17 = Allokering

seg-ba6fbebc2a98 = Generisk udformning

seg-3332ae549a90 = Center

seg-c7be6f6797a8 = Sendebåndbredde

seg-74f4e80c65cb = Komponenter

seg-e95de3591152 = Førsteordens ionosfæreforsinkelse i forhold til L

seg-e769f0411e64 = Trukket tilbage af udgiveren; ingen arkiveret kopi

seg-8b04e51a023e = ikke en radionavigationsallokering (repræsentativ); bærebølge fra den offentlige <s1>openRECEIVER-undersøgelse</s1> (siden er siden trukket tilbage; se <a1>LEO-SIGNAL.md</a1>)

seg-ea152d84aabc = { "465" } MHz

seg-8a3026904912 = { "10" } MHz

seg-e1500e8695b9 = BPSK({ "5" }) pilot og data

seg-ac33d89291ca = radionavigation-satellite service (RNSS), centeret af Galileo E5

seg-278d0b375f6f = { "20.46" } MHz

seg-54e10c07ace3 = BPSK({ "10" }) pilot og data

seg-5e28b8377751 = radiodetermination-satellite service (RDSS), S-bærebølgen i NavIC (Navigation with Indian Constellation)

seg-39e207bee75b = { "2492.028" } MHz

seg-a573432714b8 = { "16.5" } MHz

seg-6fe14d537f33 = RNSS, centeret af allokeringen { "5010" }–{ "5030" } MHz

seg-48fabff33863 = { "5020" } MHz

seg-0b50907d3165 = { "20" } MHz

seg-c43105d1c770 = C udvidet

seg-c05714081a0e = uden for RNSS-allokeringen (repræsentativ)

seg-638ab0837b29 = { "5100" } MHz

seg-4d3857271629 = { "120" } MHz

seg-18bc5451fc46 = BPSK({ "50" }) pilot og data

seg-3714e1c00ab8 = S (mobile-satellite service, MSS)

seg-cc26934bac14 = MSS-downlink, 3GPP-bånd (Third Generation Partnership Project) n256

seg-12ca7304ece7 = bruges af <c1/>

seg-896b6ee57728 = { "2172.5" } MHz

seg-e6e1d955489a = { "0.18" } til { "20" } MHz

seg-50e44c7042c9 = 5G New Radio-positioneringssignaler

seg-e75e48eeeca1 = BPSK(n) er binary phase-shift keying ved n × { "1.023" } Mchip/s. Forsinkelsesforholdet er <c1/> med <c2/> = { "1191.795" } MHz. Fririumstabet vokser med <c3/> ved samme afstand (−{ "8.2" } dB ved UHF, +{ "6.4" } dB ved S, +{ "12.5" } dB ved C).

seg-02f71b44edf5 = Forudindstillinger for signaler og systemer

seg-c60ce9c32b57 = REPRESENTATIVE, bånds centre fra ITU's Radio Regulations

seg-58fae66f7c12 = <c1/> (signaludformninger): båndtabellen ovenfor; <c2/> (standarden for <c3/>): UHF ved { "450" } MHz, L, S og C ved centrene ovenfor, { "0" } dBW EIRP pr. bånd, et solsynkront Walker 240/12/1-lag i { "550" } km

seg-5d918965c00c = BPSK({ "10" }) ved { "5020" } MHz, isoflux-stråle

seg-dddb031a7e2e = PUBLIC: Leclère, Marathe og Reid, Institute of Navigation (ION) GNSS+ { "2025" }, <a1>arXiv { "2509.19551" }</a1>

seg-67fc4039084d = X1 ved { "1593.3225" } MHz ({ "1.023" } Mchip/s) og X5 ved { "1190.51625" } MHz ({ "10.23" } Mchip/s), de offentliggjorte mindste og største modtagne effekter, { "258" } satellitter i omkring { "1080" } km ({ "53" } og { "97" } graders skaller)

seg-f17f98d1ae0b = PUBLIC: <a1>orientering fra Resilient Navigation and Timing Foundation (RNTF)</a1>

seg-c6694cdbb02b = bursts i { "1616" }–{ "1626" } MHz, Doppler op til ±{ "36" } kHz, { "66" } satellitter i { "780" } km ({ "781" } km i forudindstillingen <c1/>), modtaget effekt "{ "300" } til { "2400" } gange GPS"

seg-704ec002a889 = <c1/> / <c2/> / <c3/> (signal-, pas- og positioneringstyper)

seg-a4a3a7c7bc22 = PUBLIC signaltal: Kozhaya, Saroufim og Kassas, <a1>NAVIGATION { "72" }({ "1" })</a1>; REPRESENTATIVE bane

seg-49985bf11216 = et Ku-båndsbeacon på { "240" } MHz, der kun bruges til Doppler, C/N0 omkring { "57" } dB-Hz

seg-84cb50b019e0 = PUBLIC signalstruktur: <a1>PMC10301026</a1>; REPRESENTATIVE bane og effekt

seg-1c50faed9f1e = BPSK ved { "2.046" } Mchip/s nær L1 og L5

seg-c72e9b87f116 = <c1/> (<c2/> i beskedtypen)

seg-3dd4136094c0 = PUBLIC: <a1>InsideGNSS, ATOMIC-nyttelast (Autonomous Time and Orbit Determination for Microsatellite Constellations)</a1>

seg-4f0cff24b4fd = en efemeride som polynomium af 6. orden uden urled (uret styres efter GNSS-tid)

seg-9d1e7aebcd84 = WORKSHOP: præsenteret på ESA NAVISP LEO-PNT-workshoppen, { "2026" }

seg-28c2e7ae6065 = signalkonfiguration #1 og beskedlayout for in-orbit demonstration i den ene fil, der kan holdes tilbage

seg-9f0d16f43993 = Hver forudindstilling mærker sine tal PUBLIC (med en URL), REPRESENTATIVE (et dokumenteret designvalg, aldrig en påstand om et virkeligt system) eller WORKSHOP, og resultatet af hver kørsel, der bruger en, angiver hvilken.

seg-556fe9c6c3b1 = Navigationsbeskeden

seg-a220662ed8de = En LEO-navigationsbesked (<a1>LEO-NAVMSG.md</a1>) har fire dele, den struktur som Galileo Open Service Signal-in-Space Interface Control Document (OS SIS ICD) og de offentliggjorte LEO-forslag har til fælles:

seg-5bda276f6e82 = Galileo ICD's Kepler-sæt med 16 parametre (kvadratroden af den halve storakse, excentricitet, inklination og dens ændringshastighed, rektascension af knuden og dens ændringshastighed, perigæumargument, middelanomali, korrektion af middelbevægelse, seks harmoniske korrektioner, referencetid) samt korrektionspolynomier langs banen, på tværs af banen og radialt; eller Liu et al.-modellen fra { "2025" } med 22 parametre (<a1>doi 10.3390/rs17162894</a1>); eller ATOMIC-polynomiet uden ur

seg-8a7dabfece01 = ugenummer og tid i ugen (TOW) samt et urpolynomium af anden orden (af0, af1, af2 omkring toc)

seg-24eaf4ae7eb3 = rumfartøjsidentifikator (SVID), dataudgave (IOD), signalets tilstand

seg-e7d819b7a724 = ionosfærekorrektioner til brugere med én frekvens (et sæt i Klobuchar-stil og NeQuick-G ai0–ai2) og forskellen mellem systemtid og UTC (A0, A1, skudsekunder og deres plan)

seg-200e59d9279c = Den binære ramme er Kshanas egen dokumenterede kodning, modelleret efter disse komponenter, og ikke noget systems bitlayout. RINEX { "4.02" } definerer ingen LEO-navigationsposter, så eksporten i RINEX-stil er en dokumenteret Kshana-udvidelse (tidligere arbejde: <a1>arXiv { "2401.17767" }</a1>).

seg-aa18ab84599b = <c1/>-sweep af <c2/>

seg-70dc120ea19e = en barrage på { "50" } MHz ved { "1185" } MHz sweepet fra −{ "140" } til −{ "80" } dBW: GPS L5 går tabt ved −{ "105" } dBW, Galileo E5a og LEO L-båndssignalet ved −{ "100" } dBW; LEO-signalerne i UHF-, S- og C-båndet beholder { "49.4" }, { "49.2" } og { "47.4" } dB-Hz ved hver effekt

seg-61f05d7e3a18 = en barrage på { "40" } MHz ved { "1185" } MHz, der stiger { "5" } dB for hver { "10" } s fra −{ "125" } dBW: GPS L5 går tabt ved −{ "105" } dBW, Galileo E5a ved −{ "100" } dBW, Xona X5 (ved sin offentliggjorte mindsteeffekt, −{ "144.9" } dBW) ved −{ "95" } dBW; et generisk LEO-signal ved −{ "135" } dBW sporer stadig ved −{ "90" } dBW ({ "28.9" } dB-Hz). Modtaget effekt køber J/S-margin dB for dB

seg-6a3a46be60a5 = et positionsspring på { "30" } m på et opmålt sted: den Doppler-test, der kun bruger GNSS, opdager det aldrig; testen på hver kanal gør, { "105" } s efter starten (se <a1>LEO-PASS.md</a1>)

seg-d0c4683d7c93 = <c1/>-sammensætning af <c2/>

seg-bf0ec52f63ea = fire spoofere, begge monitorer: en spoofer kun i L-båndet og en spoofer i alle bånd uden ionosfære opdages af krydsbåndsmonitoren ved starten ({ "300" } s) og af Doppler-monitoren ved { "420" } s og { "395" } s; en spoofer i alle bånd, der tager højde for ionosfæren, kun af Doppler-monitoren ({ "395" } s); et skub på { "30" } m, der kun rammer GNSS, af ingen af dem

seg-17bcc4ead2ee = <c1/>-kæde (<c2/>, <c3/>)

seg-d9b6e6fe6807 = GNSS jammet i { "15" } minutter (GPS L1 coarse/acquisition (C/A)-kode til omkring { "10" } dB-Hz, E5a til { "17.4" } dB-Hz mod et gulv på { "25" } dB-Hz), mens LEO-signalerne i S- og C-båndet holder { "49.2" } og { "47.4" } dB-Hz; receiver autonomous integrity monitoring (RAIM) alene på LEO-laget danner et beskyttelsesniveau i hver epoke, under den lodrette alarmgrænse på { "50" } m ved { "28" } af { "30" } gittertidspunkter, hvor alarmen udløses ved de to øvrige; nominelle faser og genopretningsfaser { "5.4" } til { "15.6" } m

seg-42efdd12fc54 = Spoofing-monitorerne, deres statistikker og deres begrænsninger findes på <a1>LEO-PASS.md</a1>. Multibåndsvandfaldet med en forskellig jammer pr. bånd er <c1/> (<a2>LEO-SIGNAL.md</a2>).

seg-d9e58c4aa8d5 = Ét scenarie pr. eksperimentfokusområde

seg-1ab626f27e9d = De otte eksperimentfokusområder i Celeste IOD's udbud til tredjepartseksperimenter (ESA Open Space Innovation Platform, OSIP) er generiske LEO-PNT-spørgsmål; hvert har et systemuafhængigt scenarie:

seg-afc60ca3c9da = Fokusområde

seg-8a8f40ce3e40 = Positionsbestemmelse med høj nøjagtighed (PPP)

seg-b5eb3448dbb1 = <c1/>-sweep af <c2/>

seg-5692301bc7cf = et lag på 192 satellitter i { "500" }, { "1000" } og { "1500" } km skærer konvergensen af multi-GNSS float-PPP i München ned fra { "13.0" } min til { "3.25" }, { "3.25" } og { "3.5" } min (seks realisationer, epoker på { "30" } s)

seg-3992215bc8c9 = PNT-robusthed (L, S, C)

seg-a2cc270b415c = se Robusthed

seg-8a6381ff15ac = 5G/6G NTN-kompatibilitet

seg-ae21ac79775f = <c1/>-sweep af <c2/>

seg-cb52e7eb3c36 = positioneringsreferencens båndbredde fra { "180" } kHz til { "20" } MHz: afstandssigma i zenit fra { "6.5" } m til { "5.8" } cm, 3D-fejl med ankomsttid fra { "30.1" } m til { "2.1" } m, begrænset nedad af netværkets synkroniseringsfejl på { "1" } m

seg-45985b521980 = PNT med lavt energiforbrug til tingenes internet (IoT) og mobile enheder

seg-9afaaed509ef = <c1/>-sweep af <c2/> <c3/>

seg-3bb8cc776a28 = UHF EIRP −{ "35" } til +{ "5" } dBW: under en median-C/N0 på omkring { "35" } dB-Hz stiger energien pr. varmstartet positionsbestemmelse fra { "18" } mJ til { "55" } J; over den er batteriets levetid ved én positionsbestemmelse i timen { "8334" } dage, bestemt af hvilestrømmen

seg-4b0890bd9215 = LEO-PNT-videnskab

seg-a1ddeda103fa = skrå total electron content (TEC) fra hvert båndpar i et pas med fire bånd over Tromsø: { "18.85" } TEC-enheder genfundet af hvert par, 1-sigma fra { "0.017" } (UHF med L) til { "2.9" } TEC-enheder (S med C)

seg-fc31db33e6fe = Yderligere PNT-datatjenester

seg-91db4e7b4d9c = <c1/>-sammensætning af <c2/>

seg-aee8bb27a2fb = Kshanas beskedramme vokser fra { "146" } bytes (efemeride og ur, { "1045" } bit) til { "154" } med Klobuchar-sættet, { "159" } med NeQuick-G og { "171" } med UTC-parametrene

seg-bd6c76037986 = Indendørs navigation (UHF)

seg-0a274a3aeb86 = højeste indendørs C/N0 i en traditionel bygning: UHF { "34.1" }, L { "24.2" }, S { "16.5" }, C { "9.0" } dB-Hz; i en energieffektiv bygning UHF { "15.3" } dB-Hz og alle andre bånd lavere

seg-101de8218f35 = Fusioneret MEO + LEO PNT

seg-b4daa58a2fe7 = <c1/>-sweep af <c2/>

seg-903d8dcb96cc = Xona X5 fusioneret med GPS og Galileo over Madrid: 3D-fejl med kun GNSS { "1.06" } m root mean square (RMS); fusioneret { "0.08" } m ved en LEO-SISRE på { "5" } cm, { "0.57" } m ved { "0.5" } m og { "1.01" } m ved { "5" } m

seg-ebe7a27275cb = Ét scenarie pr. slutbrugerbranche

seg-7c21d067769a = Hver branche er en <c1/>-kæde på én tidslinje, så den kan animeres, og hver har et <c2/>-medlem, så den eksporterer geometri (se <a1>Kørsel</a1>).

seg-1d1135625500 = Branche

seg-f1a7e54ea7d0 = Autonome køretøjer

seg-3610a5f7c352 = en bil i München: åben vej, fusioneret fejl { "0.30" } m i gennemsnit; i en bykløft på { "35" } grader beholder GPS og Galileo { "8" } satellitter og en gennemsnitsfejl på { "5.8" } m, det generiske LEO-lag tilføjer { "4" } til { "5" } og bringer den ned på { "2.1" } m, stadig over tærsklen på { "1.5" } m for vognbaneniveau i omkring halvdelen af kløftens epoker

seg-6622d9c7366d = Jernbane og søfart

seg-73ba745cb492 = det medfølgende skib <c1/> mister hver GNSS-satellit ({ "12.1" } dB-Hz), mens dets LEO-pas i S- og C-båndet når { "44.2" } og { "38.1" } dB-Hz; det medfølgende tog <c2/> når { "2" } m inertifejl { "35.8" } s inde i tunnelen; i det fri giver dets LEO-pas { "35" } til { "50" } dB-Hz i L

seg-c87973b9139a = Kritisk infrastruktur

seg-c16a4c99e132 = en TCXO-klasses oscillator (temperaturkompenseret krystal) i en transformerstations tidsserver, der kører frit gennem et døgn uden GNSS, når { "29" } µs og passerer vagtgrænsen på { "1" } µs mellem { "75" } og { "80" } minutter efter tabet (på 5-minuttersgitteret); samme klasse disciplineret efter Iridium holder sig inden for −{ "40" } til +{ "11" } ns

seg-1be8e11b2530 = Polare og arktiske brugere

seg-660e450cb4ab = GPS + Galileo gennemsnitlig position dilution of precision (PDOP) { "1.38" }, { "1.57" } og { "1.62" } ved Tromsø, Svalbard og Nordpolen; med Iridium { "1.29" }, { "1.34" } og { "1.26" }, ud fra { "3.0" }, { "5.5" } og { "6.8" } Iridium-satellitter i sigte

seg-22d99734acf1 = Trådløse 5G/6G-netværk

seg-abcc6337206f = en basestations ovnstyrede krystaloscillator (OCXO) i holdover krydser netværksgrænsen på { "1.1" } µs efter { "8863" } s og slutapplikationsgrænsen på { "1.5" } µs efter { "10006" } s (analysen af typen <c1/>); disciplineret efter Xona X5 holder dens tidsfejl sig hele dagen mellem −{ "0.7" } og +{ "0.3" } ns, med en forudsagt 1-sigma på { "5" } ns, den angivne usikkerhed i den udsendte UTC-forskydning

seg-532d6814ab2d = Aktivsporing og IoT

seg-b4d6d822e1d0 = en containertags varme UHF-positionsbestemmelse koster { "18" } mJ på kajen og til søs ({ "8334" } dages batteri ved én positionsbestemmelse i timen) og { "34" } mJ i et lager ({ "5770" } dage), hvor L-båndet falder til { "20" } til { "24" } dB-Hz

seg-e54b0342fa79 = VALIDATED og MODELLED

seg-dd808d1741f3 = En række er kun VALIDATED, når en test gengiver en offentliggjort opstilling og fastholder det offentliggjorte tal inden for en angivet tolerance; alt andet er MODELLED med sin begrundelse (<a1>VERIFICATION-MATRIX.md</a1>, <a2>MODELLED-RATIONALE.md</a2>).

seg-592a6cf625c5 = VALIDATED LEO-PNT-rækker:

seg-344712930047 = lukket form for båndbegrænset signaleffekt og early-late-kodesporingsjitter ved offentliggjorte driftspunkter (Betz og Kolodziejski { "2009" }), med krydskontrol af Gabor-båndbredden og SSC;

seg-e93d5b5d3dda = den maksimale Doppler for en LEO-navigationssatellit (Xona Pulsar X1 { "32" }–{ "34" } kHz, Iridium ±{ "36" } kHz) og Doppler-indhylningskurven for en statisk bruger mod arXiv { "2509.19551" } tabel { "1" };

seg-b02c1b42e509 = ITU-R P.838-3-regnkoefficienter, P.618-14-regndæmpning og troposfærisk scintillation samt P.2109-2-indtrængningstab i bygninger mod valideringsdata fra ITU-R Study Group { "3" };

seg-fc668542b66d = skaleringen af førsteordens ionosfæreforsinkelse og frirumstab (IS-GPS-200's gruppeforsinkelsesforhold, Friis-formen);

seg-59847c667c8b = de globale gennemsnitlige SISRE-vægte (Montenbruck et al. { "2018" }), Galileo ICD's brugeralgoritme mod RTKLIB på virkelige udsendte efemerider og CRC-24Q mod dens katalogkontrolværdi.

seg-922761c46f8a = MODELLED LEO-PNT-rækker: hver signaludformning og bandafvejning, multibåndsvandfaldet, hvert pas og hvert linkbudget som helhed, forudindstillingerne, positionsbestemmelser med lavt energiforbrug, beskedtilpasningen og formaterne, Doppler og fælles positionsbestemmelse, PPP-konvergens, NTN-positionsbestemmelse, tidsoverførsel, polær dækning, kæden fra ende til anden, spoofing-monitorerne og ionosfæresonderingen samt hver kampagne (en kampagne sammensætter typer og tilføjer ingen fysik; dens sammensætningsidentiteter er testet, <a1>CAMPAIGNS.md</a1>). Intet LEO C/N0-, afstandsfejls- eller positioneringstal er sammenlignet med en måling af nogen satellit.

seg-3cc1d3f1c0f8 = Kørsel af et scenarie

seg-00d5b60c0ebb = Hvert scenarie ovenfor medfølger: <c1/> udskriver det, og

seg-e01ebe977e65 = skriver ved siden af filen resultatet (<c1/>), diagrammet (<c2/>), den avancerede rapport (<c3/> og <c4/>, med et afsnit, der indlejrer den animerede kørsel og opregner eksporterne), den interaktive afspiller (<c5/>) og eksporterne. Hvad der gælder, afhænger af typen:

seg-8a96eda978b4 = en kørsel med en tidsakse animeres: <c1/>-epoker, <c2/> i en spoofing-kørsel, <c3/>-tidslinjer, <c4/> fælles epoker og tidsspor, <c5/> fejlkurver og hver kampagnekæde. Et sweep eller en sammensætning har ingen tidsakse: <c6/> afviser det med afslutningsstatus { "1" }, og så skriver kommandoen slet intet, så kør de otte sweeps og sammensætninger ovenfor (<c7/>, <c8/> og hvert <c9/>-scenarie undtagen <c10/>) uden <c11/>;

seg-8d26148aeeff = <c1/> og <c2/> eksporterer CZML (the Cesium Language), KML (Keyhole Markup Language), GeoJSON og STK-efemerider (Systems Tool Kit) for passets geometri; en kampagne eksporterer hvert medlem, der har geometri, som sit eget filsæt, med medlemmets mærke i filnavnet (<c3/>), så hver branche eksporterer sine LEO-pas; de øvrige LEO-typer angiver, hvorfor et format ikke gælder (<a1>INTEROP.md</a1>).

seg-6f3ad057f914 = De resterende LEO-scenarier efter type (detaljer på hver types side):

seg-73365a12bf64 = <c1/>, <c2/>, valgfri <c3/>

seg-f34e2d4b3374 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, valgfri <c6/>

seg-559eaf4bafa1 = <c1/>, <c2/>, <c3/>, <c4/>, valgfri <c5/>

seg-731d447261fc = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, valgfri <c6/>

seg-e3017b224dfc = <c1/>, <c2/>, valgfri <c3/>

seg-1ada84b384ee = De valgfrie scenarier findes kun i repositoriet og holdes tilbage sammen med Celeste-forudindstillingsfilen.

seg-6305e46ec778 = To af dem hører til andre typer. <c1/> (<c2/>) dimensionerer en LEO-PNT-konstellation på 5000 satellitter i fire illustrative Walker-skaller: tilgængelighed { "99.22" } % ved en PDOP på { "3" } eller derunder over en maske på { "20" }°, median-PDOP { "1.11" } og i gennemsnit { "39.4" } satellitter i sigte over { "648" } gitterpunkter og { "12" } epoker. <c3/> (<c4/>) spørger, hvor længe databladets OCXO i en LEO-smallsat holder sig inden for en slotvagt på { "100" } ns ved k = { "3" } efter sin sidste GNSS-positionsbestemmelse: vagten brydes { "650.8" } s efter en positionsbestemmelse, så den kræver en positionsbestemmelse mindst hver { "645.8" } s ({ "133.8" } i døgnet), hvor tilfældig-gang-frekvensstøj er det dominerende led.

seg-ee9f20a4485b = LEO-PNT-kæde fra ende til anden

seg-a6167db680ba = Typen <c1/> (<a1><c2/></a1>) følger ét LEO-PNT-system fra dets signaludformning til brugerens position. Hvert trin er motorens egen type, kørt på sin egen tabel i kædescenariet, og kæden overdrager værdier fra ét trin til det næste i koden:

seg-38ce4c90dd78 = Fra

seg-2cbf005ed5cc = Til

seg-5d84d64174b6 = Hvad der overdrages

seg-15372352ab42 = den sporede komponents effektandel, andelen i båndet og den sporede chiprate (båndets EIRP-fordeling og dets C/N0-forskydning)

seg-0be525c6b695 = kædesatellittens højde og inklination (beskedens sande bane), medmindre <c1/> angiver dem

seg-d2306e118be7 = den sporede C/N0 ved positioneringsmasken og i zenit, fra en mindste kvadraters linje i sin(elevation) tilpasset passet

seg-ee40b8cd109b = signal-in-space range error (SISRE): beskedens repræsentationsfejl (root mean square, bane og ur) med scenariets banebestemmelsesled <c1/> i kvadratsum

seg-b4b3dff58f3b = bærebølgefrekvensen og den sporede chiprate

seg-4def115dba1b = En værdi overdrages kun, hvor den efterfølgende tabel lader den være uangivet, og hver overdragelse er opført i resultatets array <c1/> med sin værdi, enhed og mål. Et bånd i <c2/> skal angive udformningen (<c3/>); det er sådan, et <c4/>-bånd også på egen hånd kan bære enhver <c5/>-udformning: det tager udformningens centerfrekvens, sendebåndbredde og sporede chiprate, fordeler sin EIRP på komponenterne og rapporterer den sporede komponents C/N0 og den båndbegrænsede kohærente early-late-kodesporingsjitter (Betz og Kolodziejski { "2009" }; halv chips afstand, sløjfe på { "1" } Hz, { "20" } ms) i hver epoke.

seg-2a2b15256cf4 = generisk: den repræsentative <c1/>-udformning, et pas på { "1080" } km og { "53" }° over Madrid, et Walker-lag med 240 satellitter

seg-bb05e8e505e3 = sporet C/N0-maksimum { "58.2" } dB-Hz, median-kodejitter { "0.050" } m; SISRE { "0.250" } m overdraget; 3D-fejl (root-mean-square, RMS) med kun GNSS { "1.60" } m, GNSS + LEO { "0.43" } m; konvergens af præcis punktpositionering (PPP) { "11.5" } min med kun GNSS, { "7.5" } min med LEO-laget

seg-4d1299ee4725 = Xona Pulsar X5 (arXiv { "2509.19551" }), den skrå skal til positionsbestemmelse og begge skaller til PPP

seg-a8fe501bf419 = sporet C/N0-maksimum { "66.3" } dB-Hz, median-kodejitter { "0.018" } m; RMS 3D-fejl med kun GNSS { "1.49" } m, GNSS + LEO { "0.68" } m; PPP-konvergens { "20.6" } min med kun GNSS, { "5.9" } min med Pulsar

seg-002e4c918dda = <c1/> (valgfri)

seg-a608af78a360 = Celeste IOD E5-konfiguration #1 med Celeste-beskedforudindstillingen (holdt tilbage sammen med forudindstillingen)

seg-be428c21bd27 = passet gengiver den højeste samlede C/N0, forudindstillingen er kalibreret til (værdien findes i forudindstillingsfilen); to satellitter flytter næppe en fusioneret positionsbestemmelse over 95 minutter ({ "1.50" } m til { "1.48" } m RMS 3D)

seg-bf44ba47e48b = skriver resultatet, diagrammet, den avancerede rapport (som indlejrer det animerede pas og linker til eksporterne), den interaktive afspiller samt efemeridefiler i CZML (the Cesium Language), KML (Keyhole Markup Language), GeoJSON og STK (Systems Tool Kit) for passets geometri.

seg-a08e67a32d60 = Kæden er MODELLED: den tilføjer ingen fysik, og hvert trin beholder sine egne mærker. Positioneringstrinnets C/N0-model er en ret linje i sin(elevation), så en passpecifik form reduceres til to tal; beskedtrinnet modellerer ingen banebestemmelse, hvorfor <c1/> er et angivet input ({ "0.25" } m i de medfølgende scenarier, repræsentativt for den banebestemmelse på decimeterniveau om bord og det styrede ur på chipskala, som ATOMIC-nyttelasten rapporterer: <a1>https://insidegnss.com/first-steps-toward-a-fully-operational-leo-pnt-payload/</a1>).

seg-ee3c5b58e6fa = <s1>Forrige</s1>Månens bane og overflade som infrastruktur

seg-6b951d6413c8 = <s1>Næste</s1>LEO-signaludformninger

seg-9bfe27f7ebc5 = <s1>Forrige</s1>Missionstråd: månesegmentet
