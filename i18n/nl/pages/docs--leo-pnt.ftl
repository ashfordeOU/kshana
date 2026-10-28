# docs--leo-pnt: translations (nl)

seg-46c7e6f003dd = Systeem

seg-cae10fb9bff8 = Scenario

seg-f1f903f1b9ff = Veerkracht

seg-1759a8cce7d6 = Soorten

seg-71aee5eb55c5 = UHF

seg-f63dd3d7aad4 = Bron

seg-587beeccaa11 = Voorinstelling

seg-e305279d5b11 = Inhoud

seg-b03d56f501c3 = Type

seg-6752521002b2 = Onderdeel

seg-cf6ae60eea4f = Hulpgegevens

seg-0bdbdd2c923b = Synchronisatie

seg-b09dc4b322d3 = Efemeride

seg-3a835a49b43f = Overige diensten

seg-a17f4b4f7fb5 = { "1191.795" } MHz

seg-c5ce76c91ff7 = Label

seg-c1020ac47091 = Wat één run berekent

seg-f708914fed48 = Banden

seg-486f17197d4d = REPRESENTATIVE, voor C-bandsystemen waarvan de parameters niet openbaar zijn (bijvoorbeeld TrustPoint)

seg-03d5ae448705 = <c1/> (optioneel)

seg-fde146239f5d = Resultaat van één run

seg-a3f63252bd1b = Wat het bevat

seg-7d2c6fbf95b7 = Bron: <c1/>

seg-6f1f29597f4b = LEO-PNT in Kshana

seg-2a3a1f19005a = LEO-PNT is positiebepaling, navigatie en tijdsynchronisatie (PNT) vanaf satellieten in een lage baan om de aarde (LEO), naast of in plaats van de GNSS-systemen (global navigation satellite systems) in een middelhoge baan om de aarde (MEO) zoals het Global Positioning System (GPS) en Galileo. Deze pagina verbindt elk LEO-PNT-soort en -scenario van de engine: wat elk berekent, de banden en signaalvoorinstellingen en waar hun getallen vandaan komen, wat het navigatiebericht bevat, wat VALIDATED is en wat MODELLED, en hoe elk scenario wordt uitgevoerd. De pagina's per soort gaan dieper:

seg-8e3556046e63 = Pagina

seg-cdb06a47be0a = <c1/> (signaalontwerpen) en de meerbands-<c2/>-panelen

seg-09894e033033 = <c1/> (passgeometrie en linkbudget per band, positiebepalingen met laag energieverbruik, ionosfeerbepaling, spoofingmonitors)

seg-f19c0bfe2996 = <c1/> (het broadcastbericht: fitter, gebruikersalgoritme, binaire en tekstformaten)

seg-0fe4979f8309 = <c1/>, <c2/>, <c3/> (gecombineerde positiebepaling, precise point positioning, positiebepaling met een niet-terrestrisch 5G-netwerk (NTN), tijdsynchronisatie, poolbedekking)

seg-29013ad5656c = <c1/> (jamming-waterfalls en de jammer-to-signal-verhouding (J/S) per band)

seg-d291250b5d01 = <c1/> (ketens, sweeps, Monte Carlo en samenstellingen van willekeurige soorten)

seg-8d2de8f77619 = Eerst systeemonafhankelijk

seg-f3750a8f2863 = De engine is een generieke LEO-PNT-simulator. Elke constellatie (een Walker-patroon, expliciete baanelementen, een two-line element set (TLE) via de Simplified General Perturbations { "4" }-propagator (SGP4), of een ontworpen enkele pass), elk signaalontwerp (elke band, elke mix van binary phase-shift keying (BPSK)-, binary offset carrier (BOC)- en frequency-division multiple access (FDMA)-componenten), elk navigatieberichtmodel. Benoemde systemen zijn optionele voorinstellingen: gegevensbestanden, elk met zijn bron, die alleen invullen wat een scenario openlaat. Elke mogelijkheid, test, onafhankelijke referentie en elk meegeleverd scenario draait zonder dat er Celeste-gegevens aanwezig zijn.

seg-4d3bd0301e59 = De voorinstelling Celeste IOD (in-orbit demonstration) is er één van, en is optioneel. De signaalparameters ervan zijn gepresenteerd op de LEO-PNT-workshop van het ESA NAVISP (Navigation Innovation and Support Programme van het Europees Ruimteagentschap), { "2026" }, en hebben nog geen openbare bron. Elk van de workshop afgeleid getal van de engine staat in één bestand, <a1><c1/></a1>, dat <c2/> alleen meecompileert als het bestaat, en in de scenario's <c3/> die alleen in de repository staan. Door dat bestand en die scenario's te verwijderen wordt de voorinstelling achtergehouden zonder bronwijziging; elke andere test, onafhankelijke referentie en elk ander scenario draait zonder haar (<c4/> bewaakt welke bestanden haar mogen noemen). Deze pagina geeft geen van haar getallen.

seg-5b348102cb63 = De soorten en hoe ze samenhangen

seg-120b9be05fc3 = de bandbegrensde spectrale vermogensdichtheid (PSD) van een signaalontwerp, vermogen in de band, root-mean-square-bandbreedte (Gabor), codevolgjitter tegenover draaggolf-ruisdichtheid (C/N0), acquisitiezoektocht en spectrale scheidingscoëfficiënten (SSC) tegenover GNSS-signalen; een bandafweging (ultra high frequency (UHF), L, S, C)

seg-d9febf3c74c8 = gesloten vormen VALIDATED, ontwerpen en afweging MODELLED

seg-d0d8d1edd9ee = <c1/> (meerbandspanelen)

seg-dc3ceb315e9a = waterfalls per band met jammers per band (continuous wave (CW), chirp, smalband, breedband, matched), de J/S en effectieve C/N0 van elk signaal over een tijdlijn

seg-126a14392994 = spectra VALIDATED, jammers MODELLED

seg-e63f73ab5bca = passgeometrie, Doppler en Dopplersnelheid, vrije-ruimteverlies, satelliet- en gebruikersantennes, gasdemping, regen, scintillatie en gebouwpenetratieverlies volgens ITU-R (International Telecommunication Union, Radiocommunication Sector), C/N0 per band en epoch naast de MEO-GNSS-draaggolven; ionosfeer per band en de ionosfeervrije paren; positiebepalingen met laag energieverbruik; ionosfeerbepaling; spoofingmonitors

seg-a9fd4162604f = componenten VALIDATED, pass MODELLED

seg-91304e663174 = het broadcastbericht met efemeride en klok: fitter, signal-in-space range error (SISRE) tegenover fitinterval en updateperiode, updatecontinuïteit halverwege de pass, gebruikersalgoritme, binair frame met een 24-bits cyclische redundantiecontrole (CRC-24Q), exports in de stijl van RINEX { "4" } (Receiver Independent Exchange Format) en als door komma's gescheiden waarden (CSV)

seg-cf93a9ba065c = gebruikersalgoritme, gewichten en CRC VALIDATED, fits MODELLED

seg-3084696ad387 = Doppler-positiebepaling, gecombineerde GNSS- en LEO-pseudoafstandspositiebepalingen met inter-systeembiassen, polaire en arctische geometrie, tijdoverdracht naar Coordinated Universal Time (UTC), met een optioneel tijdfoutspoor per epoch

seg-79117194e50b = maximale Doppler VALIDATED, de rest MODELLED

seg-1de31fd3cf86 = convergentie van precise point positioning (PPP) met alleen GNSS en met LEO-lagen

seg-525733c10d9b = nauwkeurigheid van 5G-NTN-positiebepaling uit de downlinkbandbreedte (Cramér-Rao-grens)

seg-cb8eee06e664 = één systeem van begin tot eind: signaalontwerp, pass, bericht, gecombineerde positiebepaling en PPP, elke overdracht vermeld

seg-d28e18170f82 = elk van het bovenstaande geketend op één tijdlijn, gesweept, uitgevoerd als Monte Carlo-ensemble of samengesteld onder gedeelde omstandigheden

seg-5479654fabfd = De keten geeft waarden door in code (zie <a1>LEO-PNT-keten van begin tot eind</a1> hieronder): het signaalontwerp bepaalt de verdeling van de EIRP (equivalent isotropically radiated power) van de passband en de gevolgde chipsnelheid; de pass levert de gevolgde C/N0 en codejitter; de SISRE van het navigatiebericht en de C/N0 van de pass wegen de LEO-metingen van de gecombineerde positiebepaling.

seg-a0331a21413c = De generieke ontwerpen gebruiken openbare bandcentra; elk is REPRESENTATIVE, niet het signaal van enig systeem (<c1/>, <c2/>).

seg-a86ce24d81de = Band

seg-daf61ebdca17 = Toewijzing

seg-ba6fbebc2a98 = Generiek ontwerp

seg-3332ae549a90 = Centrum

seg-c7be6f6797a8 = Zendbandbreedte

seg-74f4e80c65cb = Componenten

seg-e95de3591152 = Ionosferische vertraging van de eerste orde ten opzichte van L

seg-e769f0411e64 = Door de uitgever ingetrokken; geen gearchiveerde kopie

seg-8b04e51a023e = geen radionavigatietoewijzing (representatief); draaggolf uit het openbare <s1>openRECEIVER-onderzoek</s1> (pagina inmiddels ingetrokken; zie <a1>LEO-SIGNAL.md</a1>)

seg-ea152d84aabc = { "465" } MHz

seg-8a3026904912 = { "10" } MHz

seg-e1500e8695b9 = BPSK({ "5" }) pilot en data

seg-ac33d89291ca = radionavigatiesatellietdienst (RNSS), het centrum van Galileo E5

seg-278d0b375f6f = { "20.46" } MHz

seg-54e10c07ace3 = BPSK({ "10" }) pilot en data

seg-5e28b8377751 = radiobepalingssatellietdienst (RDSS), de S-draaggolf van NavIC (Navigation with Indian Constellation)

seg-39e207bee75b = { "2492.028" } MHz

seg-a573432714b8 = { "16.5" } MHz

seg-6fe14d537f33 = RNSS, centrum van de toewijzing van { "5010" }–{ "5030" } MHz

seg-48fabff33863 = { "5020" } MHz

seg-0b50907d3165 = { "20" } MHz

seg-c43105d1c770 = C uitgebreid

seg-c05714081a0e = buiten de RNSS-toewijzing (representatief)

seg-638ab0837b29 = { "5100" } MHz

seg-4d3857271629 = { "120" } MHz

seg-18bc5451fc46 = BPSK({ "50" }) pilot en data

seg-3714e1c00ab8 = S (mobiele satellietdienst, MSS)

seg-cc26934bac14 = MSS-downlink, band n256 van 3GPP (Third Generation Partnership Project)

seg-12ca7304ece7 = gebruikt door <c1/>

seg-896b6ee57728 = { "2172.5" } MHz

seg-e6e1d955489a = { "0.18" } tot { "20" } MHz

seg-50e44c7042c9 = 5G New Radio-positioneringssignalen

seg-e75e48eeeca1 = BPSK(n) is binary phase-shift keying met n × { "1.023" } Mchip/s. De vertragingsverhouding is <c1/> met <c2/> = { "1191.795" } MHz. Het vrije-ruimteverlies neemt bij dezelfde afstand toe met <c3/> (−{ "8.2" } dB bij UHF, +{ "6.4" } dB bij S, +{ "12.5" } dB bij C).

seg-02f71b44edf5 = Signaal- en systeemvoorinstellingen

seg-c60ce9c32b57 = REPRESENTATIVE, bandcentra uit het Radioreglement van de ITU

seg-58fae66f7c12 = <c1/> (signaalontwerpen): de bandtabel hierboven; <c2/> (de standaard van <c3/>): UHF op { "450" } MHz, L, S en C op de centra hierboven, { "0" } dBW EIRP per band, een zonsynchrone Walker 240/12/1-laag op { "550" } km

seg-5d918965c00c = BPSK({ "10" }) op { "5020" } MHz, isoflux-bundel

seg-dddb031a7e2e = PUBLIC: Leclère, Marathe en Reid, Institute of Navigation (ION) GNSS+ { "2025" }, <a1>arXiv { "2509.19551" }</a1>

seg-67fc4039084d = X1 op { "1593.3225" } MHz ({ "1.023" } Mchip/s) en X5 op { "1190.51625" } MHz ({ "10.23" } Mchip/s), de gepubliceerde minimale en maximale ontvangstvermogens, { "258" } satellieten op ongeveer { "1080" } km (shells van { "53" } en { "97" } graden)

seg-f17f98d1ae0b = PUBLIC: <a1>briefing van de Resilient Navigation and Timing Foundation (RNTF)</a1>

seg-c6694cdbb02b = bursts in { "1616" }–{ "1626" } MHz, Doppler tot ±{ "36" } kHz, { "66" } satellieten op { "780" } km ({ "781" } km in de voorinstelling <c1/>), ontvangstvermogen "{ "300" } tot { "2400" } maal GPS"

seg-704ec002a889 = <c1/> / <c2/> / <c3/> (signaal-, pass- en positioneringssoorten)

seg-a4a3a7c7bc22 = PUBLIC-signaalcijfers: Kozhaya, Saroufim en Kassas, <a1>NAVIGATION { "72" }({ "1" })</a1>; REPRESENTATIVE baan

seg-49985bf11216 = een Ku-baken van { "240" } MHz dat alleen voor Doppler wordt gebruikt, C/N0 ongeveer { "57" } dB-Hz

seg-84cb50b019e0 = PUBLIC-signaalstructuur: <a1>PMC10301026</a1>; REPRESENTATIVE baan en vermogen

seg-1c50faed9f1e = BPSK met { "2.046" } Mchip/s nabij L1 en L5

seg-c72e9b87f116 = <c1/> (<c2/> in het berichtensoort)

seg-3dd4136094c0 = PUBLIC: <a1>InsideGNSS, ATOMIC-payload (Autonomous Time and Orbit Determination for Microsatellite Constellations)</a1>

seg-4f0cff24b4fd = een efemeride met een polynoom van de 6e graad zonder kloktermen (de klok wordt naar GNSS-tijd gestuurd)

seg-9d1e7aebcd84 = WORKSHOP: gepresenteerd op de ESA NAVISP LEO-PNT-workshop, { "2026" }

seg-28c2e7ae6065 = signaalconfiguratie #1 en berichtindeling van de in-orbit demonstration, in het ene bestand dat kan worden achtergehouden

seg-9f0d16f43993 = Elke voorinstelling markeert haar getallen als PUBLIC (met een URL), REPRESENTATIVE (een gedocumenteerde ontwerpkeuze, nooit een bewering over een echt systeem) of WORKSHOP, en het resultaat van elke run die er een gebruikt, vermeldt welke.

seg-556fe9c6c3b1 = Het navigatiebericht

seg-a220662ed8de = Een LEO-navigatiebericht (<a1>LEO-NAVMSG.md</a1>) bevat vier delen, de structuur die het Galileo Open Service Signal-in-Space Interface Control Document (OS SIS ICD) en de gepubliceerde LEO-voorstellen delen:

seg-5bda276f6e82 = de Kepler-set met 16 parameters van de Galileo ICD (wortel van de halve lange as, excentriciteit, inclinatie en haar verandering, rechte klimming van de knoop en haar verandering, argument van het perigeum, gemiddelde anomalie, correctie van de gemiddelde beweging, zes harmonische correcties, referentietijd), plus correctiepolynomen langs, dwars en radiaal; of het model met 22 parameters van Liu et al. { "2025" } (<a1>doi 10.3390/rs17162894</a1>); of het ATOMIC-nulklokpolynoom

seg-8a7dabfece01 = weeknummer en tijd van de week (TOW), en een klokpolynoom van de tweede orde (af0, af1, af2 rond toc)

seg-24eaf4ae7eb3 = satellietidentificatie (SVID), gegevensuitgave (IOD), signaalgezondheid

seg-e7d819b7a724 = ionosferische correcties voor eenfrequentiegebruikers (een set in Klobuchar-stijl en NeQuick-G ai0–ai2) en de offset van systeemtijd naar UTC (A0, A1, schrikkelseconden en hun schema)

seg-200e59d9279c = Het binaire frame is de eigen, gedocumenteerde codering van Kshana, gemodelleerd naar deze onderdelen, niet de bitindeling van enig systeem. RINEX { "4.02" } definieert geen LEO-navigatierecords, dus de RINEX-achtige export is een gedocumenteerde Kshana-extensie (eerder werk: <a1>arXiv { "2401.17767" }</a1>).

seg-aa18ab84599b = <c1/>-sweep van <c2/>

seg-70dc120ea19e = een barrage van { "50" } MHz op { "1185" } MHz, gesweept van −{ "140" } tot −{ "80" } dBW: GPS L5 gaat verloren bij −{ "105" } dBW, Galileo E5a en het LEO-L-bandsignaal bij −{ "100" } dBW; de LEO-signalen in UHF, S en C houden { "49.4" }, { "49.2" } en { "47.4" } dB-Hz bij elk vermogen

seg-61f05d7e3a18 = een barrage van { "40" } MHz op { "1185" } MHz die vanaf −{ "125" } dBW elke { "10" } s { "5" } dB omhoog stapt: GPS L5 verloren bij −{ "105" } dBW, Galileo E5a bij −{ "100" } dBW, Xona X5 (op zijn gepubliceerde minimum, −{ "144.9" } dBW) bij −{ "95" } dBW; een generiek LEO-signaal van −{ "135" } dBW volgt bij −{ "90" } dBW nog steeds ({ "28.9" } dB-Hz). Ontvangstvermogen koopt J/S-marge, dB voor dB

seg-6a3a46be60a5 = een positiesprong van { "30" } m op een opgemeten locatie: de Dopplertest met alleen GNSS detecteert dit nooit; de test op alle kanalen wel, { "105" } s na de start (zie <a1>LEO-PASS.md</a1>)

seg-d0c4683d7c93 = <c1/>-samenstelling van <c2/>

seg-bf0ec52f63ea = vier spoofers, beide monitors: een spoofer alleen in de L-band en een spoofer in alle banden zonder ionosfeer worden door de monitor tussen banden gevangen bij de start ({ "300" } s) en door de Dopplermonitor op { "420" } s en { "395" } s; een ionosfeerbewuste spoofer in alle banden alleen door de Dopplermonitor ({ "395" } s); een duw van { "30" } m met alleen GNSS door geen van beide

seg-17bcc4ead2ee = <c1/>-keten (<c2/>, <c3/>)

seg-d9b6e6fe6807 = GNSS { "15" } minuten gejamd (GPS L1 coarse/acquisition (C/A)-code tot ongeveer { "10" } dB-Hz, E5a tot { "17.4" } dB-Hz tegenover een ondergrens van { "25" } dB-Hz) terwijl de LEO-signalen in S en C { "49.2" } en { "47.4" } dB-Hz houden; receiver autonomous integrity monitoring (RAIM) op de LEO-laag alleen vormt op elke epoch een beschermingsniveau, onder de verticale alarmgrens van { "50" } m op { "28" } van { "30" } rastertijden, waarbij op de andere twee het alarm wordt gegeven; nominale en herstelfasen { "5.4" } tot { "15.6" } m

seg-42efdd12fc54 = De spoofingmonitors, hun statistieken en hun beperkingen staan op <a1>LEO-PASS.md</a1>. De meerbands-waterfall met een andere jammer per band is <c1/> (<a2>LEO-SIGNAL.md</a2>).

seg-d9e58c4aa8d5 = Eén scenario per experimenteergebied

seg-1ab626f27e9d = De acht experimenteergebieden van de Celeste IOD-oproep voor experimenten door derden (ESA Open Space Innovation Platform, OSIP) zijn generieke LEO-PNT-vragen; elk heeft een systeemonafhankelijk scenario:

seg-afc60ca3c9da = Aandachtsgebied

seg-8a8f40ce3e40 = Positiebepaling met hoge nauwkeurigheid (PPP)

seg-b5eb3448dbb1 = <c1/>-sweep van <c2/>

seg-5692301bc7cf = een laag van 192 satellieten op { "500" }, { "1000" } en { "1500" } km verkort de convergentie van multi-GNSS-float-PPP bij München van { "13.0" } min tot { "3.25" }, { "3.25" } en { "3.5" } min (zes realisaties, epochs van { "30" } s)

seg-3992215bc8c9 = PNT-veerkracht (L, S, C)

seg-a2cc270b415c = zie Veerkracht

seg-8a6381ff15ac = 5G/6G NTN-compatibiliteit

seg-ae21ac79775f = <c1/>-sweep van <c2/>

seg-cb52e7eb3c36 = bandbreedte van het positioneringsreferentiesignaal { "180" } kHz tot { "20" } MHz: zenitafstandssigma { "6.5" } m tot { "5.8" } cm, 3D-fout uit aankomsttijd { "30.1" } m tot { "2.1" } m, begrensd door de netwerksynchronisatiefout van { "1" } m

seg-45985b521980 = PNT met laag energieverbruik voor het Internet of Things (IoT) en mobiel

seg-9afaaed509ef = <c1/>-sweep van <c2/> <c3/>

seg-3bb8cc776a28 = UHF-EIRP −{ "35" } tot +{ "5" } dBW: onder een mediane C/N0 van ongeveer { "35" } dB-Hz loopt de energie per warme start van { "18" } mJ op tot { "55" } J; erboven is de batterijduur bij één positiebepaling per uur { "8334" } dagen, bepaald door de slaapstroom

seg-4b0890bd9215 = LEO-PNT-wetenschap

seg-a1ddeda103fa = schuine total electron content (TEC) uit elk bandpaar van een pass met vier banden boven Tromsø: { "18.85" } TEC-eenheden teruggevonden door elk paar, 1-sigma { "0.017" } (UHF met L) tot { "2.9" } TEC-eenheden (S met C)

seg-fc31db33e6fe = Aanvullende PNT-gegevensdiensten

seg-91db4e7b4d9c = <c1/>-samenstelling van <c2/>

seg-aee8bb27a2fb = het berichtframe van Kshana groeit van { "146" } bytes (efemeride en klok, { "1045" } bits) naar { "154" } met de Klobuchar-set, { "159" } met NeQuick-G en { "171" } met de UTC-parameters

seg-bd6c76037986 = Navigatie binnenshuis (UHF)

seg-0a274a3aeb86 = piek-C/N0 binnenshuis in een traditioneel gebouw: UHF { "34.1" }, L { "24.2" }, S { "16.5" }, C { "9.0" } dB-Hz; in een thermisch efficiënt gebouw UHF { "15.3" } dB-Hz en elke andere band lager

seg-101de8218f35 = Gecombineerde MEO + LEO PNT

seg-b4daa58a2fe7 = <c1/>-sweep van <c2/>

seg-903d8dcb96cc = Xona X5 gecombineerd met GPS en Galileo boven Madrid: 3D-fout met alleen GNSS { "1.06" } m root mean square (RMS); gecombineerd { "0.08" } m bij een LEO-SISRE van { "5" } cm, { "0.57" } m bij { "0.5" } m en { "1.01" } m bij { "5" } m

seg-ebe7a27275cb = Eén scenario per toepassingssector

seg-7c21d067769a = Elke sector is een keten <c1/> op één tijdlijn, dus ze is te animeren, en elke heeft een lid <c2/>, dus ze exporteert geometrie (zie <a1>Uitvoeren</a1>).

seg-1d1135625500 = Sector

seg-f1a7e54ea7d0 = Autonome voertuigen

seg-3610a5f7c352 = een auto in München: open weg, gecombineerde fout gemiddeld { "0.30" } m; in een stadscanyon van { "35" } graden houden GPS en Galileo { "8" } satellieten en een gemiddelde fout van { "5.8" } m, de generieke LEO-laag voegt er { "4" } tot { "5" } toe en brengt de fout op { "2.1" } m, nog steeds boven de drempel van { "1.5" } m voor rijstrookniveau bij ongeveer de helft van de epochs in de canyon

seg-6622d9c7366d = Spoor en scheepvaart

seg-73ba745cb492 = het meegeleverde schip <c1/> verliest elke GNSS-satelliet ({ "12.1" } dB-Hz) terwijl zijn LEO-pass in S en C { "44.2" } en { "38.1" } dB-Hz bereikt; de meegeleverde trein <c2/> bereikt { "2" } m traagheidsfout { "35.8" } s na het begin van de tunnel; in het open veld geeft zijn LEO-pass { "35" } tot { "50" } dB-Hz in L

seg-c87973b9139a = Kritieke infrastructuur

seg-c16a4c99e132 = een oscillator van de TCXO-klasse (temperature-compensated crystal) van een tijdserver in een onderstation die een dag zonder GNSS vrij loopt, bereikt { "29" } µs en overschrijdt de beveiligingsmarge van { "1" } µs tussen { "75" } en { "80" } minuten na het verlies (op het raster van 5 minuten); dezelfde klasse, gestuurd naar Iridium, blijft binnen −{ "40" } tot +{ "11" } ns

seg-1be8e11b2530 = Polaire en arctische gebruikers

seg-660e450cb4ab = GPS + Galileo gemiddelde positie-dilution of precision (PDOP) { "1.38" }, { "1.57" } en { "1.62" } in Tromsø, op Spitsbergen en op de Noordpool; met Iridium { "1.29" }, { "1.34" } en { "1.26" }, uit { "3.0" }, { "5.5" } en { "6.8" } Iridium-satellieten in zicht

seg-22d99734acf1 = Draadloze netwerken 5G/6G

seg-abcc6337206f = de oven-gestuurde kristaloscillator (OCXO) van een basisstation in holdover overschrijdt de netwerkgrens van { "1.1" } µs na { "8863" } s en de eindtoepassingsgrens van { "1.5" } µs na { "10006" } s (de analyse van het soort <c1/>); gestuurd naar Xona X5 blijft zijn tijdfout de hele dag tussen −{ "0.7" } en +{ "0.3" } ns, met een voorspelde 1-sigma van { "5" } ns, de vermelde onzekerheid van de broadcast-UTC-offset

seg-532d6814ab2d = Assettracking en IoT

seg-b4d6d822e1d0 = een warme UHF-positiebepaling van een containertag kost { "18" } mJ op de kade en op zee ({ "8334" } dagen batterij bij één positiebepaling per uur) en { "34" } mJ in een magazijn ({ "5770" } dagen), waar de L-band daalt tot { "20" } à { "24" } dB-Hz

seg-e54b0342fa79 = VALIDATED en MODELLED

seg-dd808d1741f3 = Een rij is alleen VALIDATED wanneer een test een gepubliceerde opzet reproduceert en het gepubliceerde cijfer binnen een vermelde tolerantie vastlegt; al het andere is MODELLED, met de motivering (<a1>VERIFICATION-MATRIX.md</a1>, <a2>MODELLED-RATIONALE.md</a2>).

seg-592a6cf625c5 = VALIDATED-rijen voor LEO-PNT:

seg-344712930047 = bandbegrensd signaalvermogen in gesloten vorm en early-late-codevolgjitter op gepubliceerde werkpunten (Betz en Kolodziejski { "2009" }), met de Gabor-bandbreedte en SSC als kruiscontrole;

seg-e93d5b5d3dda = de maximale Doppler van een LEO-navigatiesatelliet (Xona Pulsar X1 { "32" }–{ "34" } kHz, Iridium ±{ "36" } kHz), en de Doppler-omhullende voor een stilstaande gebruiker tegenover arXiv { "2509.19551" } tabel { "1" };

seg-b02c1b42e509 = de regencoëfficiënten van ITU-R P.838-3, de regendemping en troposferische scintillatie van P.618-14 en het gebouwpenetratieverlies van P.2109-2 tegenover de validatiegegevens van ITU-R Study Group { "3" };

seg-fc668542b66d = de schaling van de ionosferische vertraging van de eerste orde en het vrije-ruimteverlies (IS-GPS-200 groepsvertragingsverhouding, de Friis-vorm);

seg-59847c667c8b = de wereldgemiddelde SISRE-gewichten (Montenbruck et al. { "2018" }), het gebruikersalgoritme van de Galileo ICD tegenover RTKLIB op echte broadcastefemeriden, en CRC-24Q tegenover zijn cataloguscontrolewaarde.

seg-922761c46f8a = MODELLED-rijen voor LEO-PNT: elk signaalontwerp en elke bandafweging, de meerbands-waterfall, elke pass en elk linkbudget als geheel, de voorinstellingen, positiebepalingen met laag energieverbruik, de berichtfitter en -formaten, Doppler- en gecombineerde positiebepaling, PPP-convergentie, NTN-positiebepaling, tijdoverdracht, poolbedekking, de keten van begin tot eind, de spoofingmonitors en ionosfeerbepaling, en elke campagne (een campagne stelt soorten samen en voegt geen fysica toe; haar samenstellingsidentiteiten worden getest, <a1>CAMPAIGNS.md</a1>). Geen enkele LEO-C/N0, afstandsmeetfout of positiebepalingscijfer wordt vergeleken met een meting van enige satelliet.

seg-3cc1d3f1c0f8 = Een scenario uitvoeren

seg-00d5b60c0ebb = Elk scenario hierboven is meegeleverd: <c1/> drukt het af, en

seg-e01ebe977e65 = schrijft naast het bestand het resultaat (<c1/>), de grafiek (<c2/>), het geavanceerde rapport (<c3/> en <c4/>, met een sectie die de geanimeerde run insluit en de exports vermeldt), de interactieve speler (<c5/>) en de exports. Wat van toepassing is, hangt af van het soort:

seg-8a96eda978b4 = een run met een tijdas animeert: epochs van <c1/>, de <c2/> van een spoofingrun, tijdlijnen van <c3/>, gezamenlijke epochs en tijdsporen van <c4/>, foutcurves van <c5/> en elke campagneketen. Een sweep of een samenstelling heeft geen tijdas: <c6/> weigert haar met exitstatus { "1" } en dan schrijft het commando helemaal niets, dus voer de acht sweeps en samenstellingen hierboven (<c7/>, <c8/> en elk scenario <c9/> behalve <c10/>) uit zonder <c11/>;

seg-8d26148aeeff = <c1/> en <c2/> exporteren CZML (de Cesium Language), KML (Keyhole Markup Language), GeoJSON en STK (Systems Tool Kit) efemeriden van de passgeometrie; een campagne exporteert elk lid met geometrie als een eigen bestandenset, met het label van het lid in de bestandsnaam (<c3/>), zodat elke sector zijn LEO-passes exporteert; de andere LEO-soorten vermelden waarom een formaat niet van toepassing is (<a1>INTEROP.md</a1>).

seg-6f3ad057f914 = De overige LEO-scenario's, per soort (details op de pagina van elk soort):

seg-73365a12bf64 = <c1/>, <c2/>, optioneel <c3/>

seg-f34e2d4b3374 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, optioneel <c6/>

seg-559eaf4bafa1 = <c1/>, <c2/>, <c3/>, <c4/>, optioneel <c5/>

seg-731d447261fc = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, optioneel <c6/>

seg-e3017b224dfc = <c1/>, <c2/>, optioneel <c3/>

seg-1ada84b384ee = De optionele scenario's staan alleen in de repository en worden achtergehouden samen met het Celeste-voorinstellingsbestand.

seg-6305e46ec778 = Twee ervan zitten in andere soorten. <c1/> (<c2/>) dimensioneert een LEO-PNT-constellatie van 5000 satellieten in vier illustratieve Walker-shells: beschikbaarheid { "99.22" } % bij een PDOP van { "3" } of minder boven een masker van { "20" }°, mediane PDOP { "1.11" } en gemiddeld { "39.4" } satellieten in zicht over { "648" } rasterpunten en { "12" } epochs. <c3/> (<c4/>) vraagt hoe lang de OCXO volgens het datablad van een LEO-smallsat binnen een slotbeveiliging van { "100" } ns blijft bij k = { "3" } na zijn laatste GNSS-positiebepaling: de beveiliging breekt { "650.8" } s na een positiebepaling, dus er is minstens elke { "645.8" } s een positiebepaling nodig ({ "133.8" } per dag), waarbij random-walk-frequentieruis de dominante term is.

seg-ee9f20a4485b = LEO-PNT-keten van begin tot eind

seg-a6167db680ba = Het soort <c1/> (<a1><c2/></a1>) volgt één LEO-PNT-systeem van zijn signaalontwerp tot de positie van de gebruiker. Elke fase is een eigen soort van de engine, uitgevoerd op zijn eigen tabel van het ketenscenario, en de keten geeft in code waarden van de ene fase aan de volgende door:

seg-38ce4c90dd78 = Van

seg-2cbf005ed5cc = Naar

seg-5d84d64174b6 = Wat wordt doorgegeven

seg-15372352ab42 = het vermogensaandeel van de gevolgde component, de fractie in de band en de gevolgde chipsnelheid (de verdeling van de EIRP van de band en haar C/N0-offset)

seg-0be525c6b695 = de hoogte en inclinatie van de ketensatelliet (de referentiebaan van het bericht), tenzij <c1/> ze vermeldt

seg-d2306e118be7 = de gevolgde C/N0 op het positioneringsmasker en in het zenit, uit een kleinste-kwadratenlijn in sin(elevatie) gefit aan de pass

seg-ee40b8cd109b = de signal-in-space range error (SISRE): de representatiefout van het bericht (root mean square, baan en klok) met de baanbepalingsterm <c1/> van het scenario in wortel-van-de-som-van-kwadraten

seg-b4b3dff58f3b = de draaggolffrequentie en de gevolgde chipsnelheid

seg-4def115dba1b = Een waarde wordt alleen doorgegeven waar de stroomafwaartse tabel haar open laat, en elke overdracht staat in de array <c1/> van het resultaat met haar waarde, eenheid en doel. Een band van <c2/> moet het ontwerp noemen (<c3/>); zo draagt een band van <c4/> ook zelfstandig elk ontwerp <c5/>: ze neemt de middenfrequentie, de zendbandbreedte en de gevolgde chipsnelheid van het ontwerp over, verdeelt haar EIRP over de componenten, en rapporteert op elke epoch de C/N0 van de gevolgde component en de bandbegrensde coherente early-late-codevolgjitter (Betz en Kolodziejski { "2009" }; halve-chipafstand, lus van { "1" } Hz, { "20" } ms).

seg-2a2b15256cf4 = generic: het representatieve ontwerp <c1/>, een pass van { "53" }° op { "1080" } km boven Madrid, een Walker-laag van 240 satellieten

seg-bb05e8e505e3 = gevolgde C/N0-piek { "58.2" } dB-Hz, mediane codejitter { "0.050" } m; SISRE { "0.250" } m doorgegeven; root-mean-square-(RMS)-3D-fout met alleen GNSS { "1.60" } m, GNSS + LEO { "0.43" } m; convergentie van precise point positioning (PPP) { "11.5" } min met alleen GNSS, { "7.5" } min met de LEO-laag

seg-4d1299ee4725 = Xona Pulsar X5 (arXiv { "2509.19551" }), de hellende shell voor positiebepaling en beide shells voor PPP

seg-a8fe501bf419 = gevolgde C/N0-piek { "66.3" } dB-Hz, mediane codejitter { "0.018" } m; RMS 3D-fout met alleen GNSS { "1.49" } m, GNSS + LEO { "0.68" } m; PPP-convergentie { "20.6" } min met alleen GNSS, { "5.9" } min met Pulsar

seg-002e4c918dda = <c1/> (optioneel)

seg-a608af78a360 = Celeste IOD E5-configuratie #1 met de berichtvoorinstelling van Celeste (achtergehouden met de voorinstelling)

seg-be428c21bd27 = de pass reproduceert de totale C/N0-piek waarop de voorinstelling is gekalibreerd (de waarde staat in het voorinstellingsbestand); twee satellieten verbeteren een gecombineerde positiebepaling over 95 minuten nauwelijks ({ "1.50" } m naar { "1.48" } m RMS 3D)

seg-bf44ba47e48b = schrijft het resultaat, de grafiek, het geavanceerde rapport (dat de geanimeerde pass insluit en de exports koppelt), de interactieve speler, en CZML (de Cesium Language), KML (Keyhole Markup Language), GeoJSON en STK (Systems Tool Kit) efemeridebestanden van de passgeometrie.

seg-a08e67a32d60 = De keten is MODELLED: ze voegt geen fysica toe en elke fase behoudt haar eigen labels. Het C/N0-model van de positioneringsfase is een rechte lijn in sin(elevatie), zodat een passspecifieke vorm tot twee getallen wordt teruggebracht; de berichtfase modelleert geen baanbepaling, en daarom is <c1/> een vermelde invoer ({ "0.25" } m in de meegeleverde scenario's, representatief voor de baanbepaling aan boord op decimeterniveau en de gestuurde klok op chipschaal die de ATOMIC-payload rapporteert: <a1>https://insidegnss.com/first-steps-toward-a-fully-operational-leo-pnt-payload/</a1>).

seg-ee3c5b58e6fa = <s1>Vorige</s1>Maanbaan en maanoppervlak als infrastructuur

seg-6b951d6413c8 = <s1>Volgende</s1>LEO-signaalontwerpen

seg-9bfe27f7ebc5 = <s1>Vorige</s1>Missieketen: het maansegment
