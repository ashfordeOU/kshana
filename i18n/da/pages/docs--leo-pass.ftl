# docs--leo-pass: translations (da)

seg-cae10fb9bff8 = Scenarie

seg-cbf0f9bcd2d8 = Uafhængig reference

seg-6e0cb6acc073 = VALIDATED

seg-f63dd3d7aad4 = Kilde

seg-587beeccaa11 = Forudindstilling

seg-1ff32b87e030 = Satellitter

seg-a6c63abeb7e6 = Medfølgende scenarier

seg-2b0d77219437 = Forudindstillinger

seg-5566e1d71a4f = Bane

seg-c2a2761f73b1 = { "550" } km, { "53" }°

seg-c5ce76c91ff7 = Mærkat

seg-813d372bda81 = Kilde: <c1/>

seg-0bd4af67ffdb = LEO-passage og linkbudget (<c1/>)

seg-30417c63c48e = LEO-PNT er positionering, navigation og tidssynkronisering (PNT) fra satellitter i lav jordbane (LEO). Typen <c1/> simulerer én eller flere LEO-satellitpassager over en bruger og udregner linkbudgettet bånd for bånd ved siden af GNSS-satellitterne (globale satellitnavigationssystemer) i middelhøj jordbane (MEO), som er i sigte. Motoren er <b>systemuafhængig</b>: enhver konstellation, ethvert signaludformning og ethvert bånd, skrevet direkte i et scenarie. Navngivne systemer er valgfrie forudindstillinger, hver i sin egen fil med sin kilde.

seg-242c84daecb0 = Kode: <a1><c1/></a1> (typen) og <a2><c2/></a2> (offentlige byggeklodser, som andre moduler kan kalde).

seg-0e6b09e372f5 = Scenarier: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/> og det valgfri <c8/> (resultater i <a1>Medfølgende scenarier</a1>). Typen er også medlem af kampagnerne <c9/>, <c10/>, <c11/> og af hvert <c12/>-scenarie og er passagetrinnet i typen <c13/>.

seg-59cebed2f589 = Oversigt over alle LEO-PNT-typer og -scenarier: <a1>LEO-PNT.md</a1>.

seg-9646ce17cddf = Uafhængige referencer: <a1><c1/></a1>, fixtures i <c2/> med deres kilde-URL'er.

seg-c1020ac47091 = Hvad én kørsel beregner

seg-10dedc607eac = For hver LEO-satellit, hvert bånd og hver epoke:

seg-35bf9a48e566 = Led

seg-b0f12ee05fe9 = Elevation, azimut, afstand

seg-24ad909c4fb8 = bruger i WGS-84 (World Geodetic System { "1984" }), satellit i et inertialsystem, der ved epoken er på linje med det jordfaste system

seg-c9f61c3348ef = beregnet

seg-ebd800ec3d47 = Afstandsrate <c1/>, afstandsacceleration <c2/>

seg-232b42b71f03 = lukket form; hver kørsel kontrollerer begge mod centrale differenser af den propagerede afstand og rapporterer den største forskel

seg-b3a55e868346 = lukket form

seg-3f1f90a57c2f = Doppler <c1/>, Doppler-rate <c2/>

seg-852b6c351ce4 = første orden, pr. bånd

seg-4eb4b779679b = Fri-rum-udbredelsestab

seg-31f67bcd2d50 = Friis, <c1/>

seg-fb5f06a91de1 = Satellittens EIRP (equivalent isotropically radiated power) og stråleform

seg-883702244778 = isoflux til en kantelevation, gaussisk hovedlobe <c1/> dB eller flad

seg-b6e91c5252d3 = Brugerantenne

seg-ed92a0abf62f = patch <c1/> dBic, halvkugleformet eller isotrop

seg-0ac54d232e0a = Dæmpning fra luftarter

seg-30fb5b0a0bc7 = ITU-R (International Telecommunication Union, Radiocommunication Sector) P.676-10 bilag { "2" } forenklede udtryk (afløst af P.676-13, hvis tabellerede koefficienter motoren ikke bærer)

seg-58d58478e9eb = Regndæmpning

seg-4c1e413d5fc3 = ITU-R P.838-3-koefficienter og proceduren i P.618-14 § { "2.2.1.1" }, ud fra en regnintensitet R0.01 og en reghøjde

seg-dab78c0552b6 = Troposfærisk scintillation

seg-8e5ca14cbf08 = ITU-R P.618-14 § { "2.4.1" }; under { "4" } GHz en ekstrapolation, markeret i rapporten

seg-788516420351 = VALIDATED ({ "4" }–{ "55" } GHz)

seg-32dddfdba584 = Tab ved indtrængen i bygning (bruger indendørs)

seg-ef9025622e81 = ITU-R P.2109-2, traditionel eller termisk effektiv, ved elevationen af stien ved facaden

seg-c7d1bccd4d51 = Polarisationsmismatch

seg-f4aaea269382 = polarisationstabsfaktor ud fra aksialforhold og omdrejningsretninger, middelværdi over ellipsens orientering

seg-96601850a9d5 = Systemets støjtemperatur

seg-82735c7f3ea5 = antennegulv + himmelemission fra den absorberende sti ({ "275" } K) + kosmisk { "2.7" } K + modtager <c1/>

seg-53ce973b0ee7 = C/N0 (bærebølge-til-støjtæthed)

seg-fa01d060cf1a = Ionosfærisk gruppeforsinkelse

seg-33f2113dea70 = <c1/>, STEC (skrå totalt elektronindhold) fra Klobuchar-modellen eller et lodret totalt elektronindhold (TEC), skaleret med den andel af et Chapman-lag, der ligger under satellitten

seg-431dfeb5edba = skalering VALIDATED, TEC MODELLED

seg-56df31449434 = Pr. båndpar: de ionosfærefrie koefficienter, støjforstærkningen <c1/> og den termiske kodestøj for hvert bånd og for kombinationen ved passagens top. Sammenligningen med MEO-GNSS bruger samme brugerantenne og modtager, med hvert signals mindste modtagne effekt fra grænsefladedokumentet (Galileo Open Service Signal-in-Space Interface Control Document, OS SIS ICD, udgave { "2.1" } tabel { "12" }; GPS fra IS-GPS-200 og IS-GPS-705), plus et angivet overskud, skaleret med afstanden. Den valgfri sektion <c2/> (Internet of Things) giver tid til første positionsbestemmelse, energi pr. positionsbestemmelse og batterilevetid mod driftscyklus for et angivet effektbudget for modtageren (MODELLED, alle antagelser er inddata og er opført i rapporten).

seg-7132ede02109 = <c1/> (standard): en cirkulær bane placeret, så brugeren ser én passage med en valgt maksimal elevation på et valgt tidspunkt, stigende eller faldende, øst eller vest for brugeren; banehældningen kan være solsynkron.

seg-688307acbf0d = <c1/>: eksplicitte Kepler-elementer.

seg-e9085739bcb8 = <c1/>: et tolinjers elementsæt (TLE) gennem motorens propagator Simplified General Perturbations { "4" } (SGP4).

seg-7dcc5fdbc249 = <c1/>: en Walker-konstellation opbygget af koden <c2/> (dens <c3/> eller forudindstillingens skaller); de højeste passager i vinduet rapporteres.

seg-ec7e163dd073 = Bånd og signaludformninger

seg-4d49743b3544 = Bånd: <c1/> med en valgfri delmængde <c2/> og <c3/>-poster, der tilføjer et bånd eller tilsidesætter ethvert felt i et forudindstillet bånd. <c4/> med kun <c5/>-poster bruger slet ingen forudindstilling.

seg-bd1e114aaea6 = Et bånd kan også angive en <c1/>-udformning (<c2/>, enhver udformning under <c3/> eller en, som typen <c4/> leverer; se <a1>LEO-SIGNAL.md</a1>). Båndet overtager så udformningens centerfrekvens (medmindre <c5/> er angivet), transmissionsbåndbredde og chiprate for den sporede komponent, fordeler sin EIRP på udformningens komponenter efter deres effektandele og rapporterer ved hver epoke den sporede komponents C/N0 og dens båndbegrænsede early-late-kodesporingsjitter (Betz og Kolodziejski { "2009" }, formlen i typen <c6/>) som afstandsmålingsfejl.

seg-1d96501bb12d = Hver forudindstilling mærker sine tal PUBLIC (med URL), REPRESENTATIVE (et dokumenteret udformningsvalg, aldrig en påstand om et virkeligt system) eller WORKSHOP.

seg-f708914fed48 = Bånd

seg-6459abcaeebe = <c1/> (standard)

seg-a0dab2ebeb1b = REPRESENTATIVE; L-, S- og C-bærebølger fra offentlige dokumenter

seg-cd0075385395 = UHF { "450" } MHz (repræsentativ), L { "1191.795" } MHz (Galileo E5-centrum), S { "2492.028" } MHz (NavIC S, S-båndsbærebølgen i Navigation with Indian Constellation), C { "5020" } MHz (midten af RNSS-tildelingen (radionavigationssatellittjenesten) på { "5010" }–{ "5030" } MHz), hver { "0" } dBW

seg-3f0de4312fcb = { "550" } km solsynkron, Walker 240/12/1

seg-486f17197d4d = REPRESENTATIVE, til C-båndssystemer, hvis parametre ikke er offentlige (for eksempel TrustPoint)

seg-f6696b70591c = C { "5020" } MHz, BPSK({ "10" }) (binær faseskiftmodulation ved { "10" } × { "1.023" } Mchip/s), isoflux

seg-4ae6741795f9 = PUBLIC, <a1>arXiv { "2509.19551" }</a1> tabel { "1" }–{ "2" }

seg-a1be637cda63 = X1 { "1593.3225" } MHz, X5 { "1190.51625" } MHz; EIRP ud fra den offentliggjorte mindste modtagne effekt ved { "10" }°

seg-cb74283148d7 = { "1080" } km, { "53" }° ({ "192" }) og { "97" }° ({ "66" })

seg-5ae1331b91f8 = PUBLIC, <a1>Resilient Navigation and Timing Foundation (RNTF)</a1> og den offentliggjorte bane

seg-c995dade5aa6 = Satellite Time and Location (STL) ved { "1621" } MHz (midten af { "1616" }–{ "1626" } MHz); EIRP ud fra "{ "300" } gange GPS"

seg-dd6322466888 = { "781" } km, { "86.4" }°, { "66" } i { "6" } baneplaner

seg-ad0ba129439b = PUBLIC signaltal (<a1>NAVIGATION { "72" }({ "1" })</a1>), REPRESENTATIVE bane og EIRP

seg-1931203a036c = Ku { "240" } MHz-beacon, kun Doppler

seg-0533710bbbe1 = PUBLIC signalstruktur (<a1>PMC10301026</a1>), REPRESENTATIVE bane og EIRP

seg-cee286338f01 = BPSK { "2.046" } Mchip/s nær L1 og L5

seg-fe3cdce92b31 = { "1000" } km, { "55" }°

seg-03d5ae448705 = <c1/> (valgfri)

seg-800f173f2b20 = WORKSHOP signalparametre, PUBLIC bane

seg-e8626249e708 = syv bånd i konfiguration #1

seg-cb29553176c7 = { "510" } km solsynkron

seg-10f79909a5bc = <b>Forudindstillingen Celeste IOD (demonstration i kredsløb) er valgfri.</b> Dens signalparametre blev fremlagt på workshoppen om LEO-PNT i Den Europæiske Rumorganisations (ESA's) Navigation Innovation and Support Programme (NAVISP), { "2026" }, og har endnu ingen offentlig kilde; de findes i modulet <c1/> i <c2/>, som bruges af <c3/>. Sådan holdes forudindstillingen tilbage: hvert tal i motoren, der stammer fra workshoppen, ligger i én fil, <c4/>, som <c5/> kun kompilerer med, når den findes, og i de scenarier, der kun findes i repositoriet, <c6/>. Sletter man den fil og de scenarier, holdes forudindstillingen tilbage uden nogen ændring af kildekoden; alle andre tests, uafhængige referencer og scenarier kører uden den, og READMEs antal scenariefiler tæller stadig de tilbageholdte filer med. Dens EIRP og stråle er kalibreret til et C/N0-forløb vist på workshoppen, så scenariet gengiver forløbet pr. konstruktion.

seg-9f9ff4fe18f8 = ATOMIC-modellen med "nulur"-polynomium for broadcast-efemeriden er en forudindstilling for navigationsmeddelelser og er ikke en del af denne type.

seg-dc496b16046b = Iagttagelsen af LEO i forhold til GNSS

seg-6be559b1ac29 = <c1/> gengiver kvalitativt, hvad LEO-PNT-demonstrationer viser: LEO's C/N0 stiger og falder i en klokkeform, der forbliver over masken i { "590" } s og topper ved { "56.8" } dB-Hz, { "8.9" } dB over medianen for de flade MEO-GNSS-bærebølger (Galileo E1, { "40.5" } til { "52.0" } dB-Hz, median { "47.8" } dB-Hz). Marginen kommer fra afstanden og ikke fra en stærkere sender: ved passagens top er satellitten { "569" } km væk, omkring { "40" } gange tættere end en Galileo-satellit i zenit ({ "23 222" } km), hvilket er { "32" } dB mindre fri-rum-tab; den generiske forudindstilling udstråler { "0" } dBW ({ "1" } W).

seg-08debab7c94a = Hver række er én kørsel af <c1/> (motor { $version }):

seg-9a60f0bf803e = Opsætning

seg-fde146239f5d = Resultat af én kørsel

seg-41455a3f15b6 = <c1/> L-bånd, { "550" } km, { "80" }° passage over München

seg-9d5c154eceb1 = L-top { "56.8" } dB-Hz, median { "42.2" } dB-Hz; Galileo E1-median { "47.8" } dB-Hz

seg-9423b1184fb0 = <c1/>, en udformet passage på { "70" }° og fire satellitter i skråtstillede skaller, maritim bruger

seg-63bf0b8f7f3a = X1-top { "65.6" } dB-Hz og X5 { "68.9" } dB-Hz på den udformede passage; største X1-Doppler { "31.4" } kHz

seg-8a3383072765 = <c1/>, passage på { "65" }°, bruger i luften

seg-d2fea8542638 = STL-top { "80.5" } dB-Hz, { "34.3" } dB over GPS L1-medianen; største Doppler { "35.4" } kHz

seg-d837a8a7648b = <c1/>, bruger indendørs i Rom (traditionel bygning)

seg-4fbead0588d2 = top UHF { "34.1" }, L { "24.2" }, S { "16.5" }, C { "8.5" } dB-Hz; Galileo E1-median { "22.4" } dB-Hz

seg-954e16842d59 = <c1/> UHF og L med sektionen <c2/>

seg-9aa81f6f4929 = varmstart { "0.90" } s og { "18.0" } mJ på alle signaler; koldstart UHF { "19.0" } s ({ "381" } mJ), L { "47.0" } s ({ "939" } mJ), GPS L1 { "38.1" } s ({ "762" } mJ)

seg-97476f9d4212 = <c1/>, fire bånd, passage på { "70" }° over Tromsø

seg-fd1463da9965 = se <a1>Ionosfærelodning</a1>

seg-1ad5bde12b4f = { "16" } satellitter i et generisk lag på { "1080" } km, L og C, et spring på { "30" } m

seg-25cf36cf0de3 = se <a1>Spoofing-overvågning</a1>

seg-6cdf9830433e = <c1/> skriver også den interaktive afspiller (<c2/>, passageepokerne) og efemeridefilerne CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON og STK (Systems Tool Kit) for passagens geometri (<a1>ANIMATION.md</a1>, <a2>INTEROP.md</a2>).

seg-d3a0fc36329a = Ionosfærelodning

seg-8f59acefb2b3 = Spoofing-overvågning (<c1/>)

seg-91941393400a = Den valgfri sektion <c1/> forfalsker de signaler, som en modtager ville se på en angiven position. Fra <c2/> springer den angivne position med <c3/> og bevæger sig derefter vandret med <c4/> mod <c5/>; den forfalskede afstand og afstandsrate er nøjagtig dem for den angivne position, på de LEO-bånd, der er nævnt i <c6/> (standard alle), og på MEO-GNSS-signalet, medmindre <c7/>. <c8/> angiver, om de forfalskede pseudoafstande bærer den ionosfæriske forsinkelse (en jordsender har den ikke).

seg-845f6840d92d = Modtageren kører to monitorer (<a1><c1/></a1>), hver ved en angiven sandsynlighed for falsk alarm pr. epoke (<c2/>, standard { "1e-5" }), og erklærer detektion ved den første epoke, hvor dens detektionssandsynlighed når <c3/> (standard { "0.999" }). Detektionssandsynlighederne er nøjagtige for den angivne gaussiske støj, beregnet på det støjfrie middelresidual; der trækkes ingen støj.

seg-cc38b40eb7a5 = Monitor

seg-8b34ac584c3d = Statistik

seg-7b158594c4d9 = Hvad den ser

seg-89756d80bc29 = Doppler- og passagegeometriens konsistens

seg-2174c7725e48 = målte afstandsrater mod dem, der forudsiges ud fra banerne og en uafhængig a priori-position og -hastighed (<c1/>, <c2/>); et generaliseret mindste kvadraters chi-i-anden over et vindue på <c3/> (standard ét trin), hvor urdriften er en generende parameter (eller er givet ved <c4/>); støj i frekvenslåsesløjfen ud fra C/N0 (Kaplan & Hegarty { "2006" }, § { "5.6.2" }), på GNSS-kanalerne, LEO-kanalerne og alle kanaler

seg-14eab06a47d5 = en positionsfejl <c1/> flytter en afstandsrate med <c2/>, <c3/>: en LEO-satellits tværhastighed i forhold til dens afstand er omkring { "25" } gange en MEO-satellits, så den samme fejl er omkring { "25" } gange større i LEO-Doppler

seg-390ac49b3c09 = Konsistens på tværs af bånd

seg-986d501c2b01 = trinnet fra epoke til epoke i hvert LEO-båndpars geometrifrie pseudoafstandskombination, med modtagerens ionosfæremodel fjernet, mod <c1/> kodestøj og en tolereret ikke-modelleret ionosfærisk rate (<c2/>)

seg-389187df55d7 = en spoofer, der forfalsker nogle bånd og ikke andre, eller alle bånd uden ionosfæren, ved sit indsæt; ikke en, der forfalsker alle bånd og simulerer ionosfæren

seg-4dd44d7fa566 = <c1/>: et spring på { "30" } m på et opmålt sted i Frankfurt ændrer GNSS-afstandsraterne med omkring { "4" } mm/s og LEO-raterne med omkring { "10" } cm/s (mediangradienter { "1.4e-4" } og { "3.5e-3" } pr. sekund). Testen med kun GNSS opdager det aldrig (største ikke-centralitet { "0.06" }); testen på alle kanaler opdager det { "105" } s efter indsættet. <c2/> kører fire spoofere mod begge monitorer.

seg-1b64098e01f3 = Begrænsninger, angivet i hvert resultat: spooferen er et idealiseret, selvkonsistent positionspush, der kompenserer for sin egen sti (ingen signatur i effekt, indfaldsvinkel eller korrelationstop); a priori-værdien er uafhængig af de spoofede positionsbestemmelser; modtagerens ionosfæremodel er motorens, så det autentiske residual på tværs af bånd er nul i middel. MODELLED (to rækker i <a1>VERIFICATION-MATRIX.md</a1>).

seg-edb7b16b6c0e = Validering

seg-051b8cd1849d = Test

seg-609c537a9dfd = ITU-R P.838-3 tabel { "5" }, { "115" } frekvenser

seg-5bf24bec38f2 = hver koefficient inden for { "0.6" } af sit sidst trykte ciffer (værst observerede { "0.51" })

seg-13180d4097d1 = { "56" } tilfælde inden for { "1e-4" } dB (observeret { "5e-6" } dB)

seg-84161e5f97f8 = Samme eksempler, P.618-14 scintillation

seg-0a4305c867ff = { "42" } tilfælde inden for { "1e-5" } dB

seg-054f8dbe2792 = ITU-R Study Group { "3" } regneark for Clutter og BEL, P.2109

seg-8ae2eeed4be4 = { "568" } værdier inden for { "0.001" } dB

seg-6df2eded9f19 = IS-GPS-200 gruppeforsinkelsesforhold <c1/>

seg-d0b293230f91 = til { "1e-12" }; L1/L2- og L1/L5-forstærkning { "2.978" } og { "2.588" }

seg-f9a0e24c00a7 = Friis-formen kilometer–megahertz

seg-4e94a67f40f6 = til { "1e-4" } dB

seg-ee59b4c520eb = arXiv { "2509.19551" } tabel { "1" } (Pulsar in-orbit validation (IOV), full operational capability (FOC) polær, FOC skråtstillet, GPS)

seg-345998ca457c = { "20" } hastigheder og Doppler-maksima inden for { "0.05" } %

seg-30e34076f4a7 = Regn- og scintillationsreferencerne tager reghøjden og den våde refraktivitet, som valideringseksemplerne angiver dem: motoren bærer hverken ITU-R P.839- eller P.453-kortet.

seg-d2d1075a0b67 = EIRP og stråleformer er offentliggjorte modtagne effekter omregnet til en EIRP eller repræsentative valg; ingen satellits målte stråleform bruges, og ingen LEO-C/N0 sammenlignes med en måling.

seg-915a9564608d = Gasleddet er den afløste forenklede metode i P.676-10; under { "1" } GHz er det værdien ved { "1" } GHz skaleret med f², og regn sættes til nul der.

seg-cdd9faf5b61d = Andelen af TEC under en LEO-satellit kommer fra ét enkelt Chapman-lag (ingen plasmasfære) og kan tilsidesættes af en angivet andel.

seg-4b72218497e7 = Banerne for den udformede passage og Walker-banerne er totlegemebaner med et valgfrit sekulært J2 (Jordens andet zonale harmoniske led); TLE-stien bruger SGP4. Brugerens egen acceleration er udeladt af den lukkede formel for Doppler-raten (den numeriske kontrol rapporterer, hvad det koster for en bevægelig bruger).

seg-9fc2cd6d38e9 = RINEX (Receiver Independent Exchange Format) { "4.02" } har ingen LEO-navigationsposter; enhver RINEX-lignende LEO-eksport hører til koden for navigationsmeddelelser og er en dokumenteret Kshana-udvidelse (tidligere arbejde: arXiv { "2401.17767" }).

seg-593081243d8c = <s1>Forrige</s1>LEO-signaludformninger

seg-468e70f9a669 = <s1>Næste</s1>LEO-navigationsmeddelelse

seg-072d0d8f618c = Spoofing-overvågning ([spoofer])
