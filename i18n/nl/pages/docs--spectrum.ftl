# docs--spectrum: translations (nl)

seg-6cb7a787ac67 = Referenties

seg-cbf0f9bcd2d8 = Onafhankelijke referentie

seg-6e0cb6acc073 = VALIDATED

seg-33f4c7af9c53 = Draaggolf

seg-c5ce76c91ff7 = Label

seg-a86ce24d81de = Band

seg-ea152d84aabc = { "465" } MHz

seg-278d0b375f6f = { "20.46" } MHz

seg-39e207bee75b = { "2492.028" } MHz

seg-48fabff33863 = { "5020" } MHz

seg-72f051e2d7e1 = Signaal

seg-47408d30d095 = Nominale C/N₀

seg-995748f9c74c = { "49.41" } dB-Hz

seg-5393b075ff7f = { "43.48" } dB-Hz

seg-4321ccaeeca5 = { "46.73" } dB-Hz

seg-59fd1427d61b = { "54.51" } dB-Hz

seg-0f47178201ca = { "49.23" } dB-Hz

seg-f8e6beeceedd = { "47.41" } dB-Hz

seg-53a7343c076e = Bewering

seg-430edd66bda0 = Niet gemodelleerd

seg-64509c048541 = Wat wordt gemodelleerd

seg-f07519ff8071 = Bron: <c1/>

seg-901c3e032de7 = Spectrummodel en waterfall

seg-eac92092dd34 = De scenariosoort <c1/> bouwt de L-band van het Global Navigation Satellite System (GNSS), en elke andere band die een ontworpen signaal bezet (ultra-high frequency (UHF), S-band, C-band), op als één vermogensspectrale dichtheid (PSD), laat die veranderen over een gescripte jammertijdlijn en reduceert haar tot wat een trackinglus belangrijk vindt: de jammer-tot-signaalverhouding (J/S) en de effectieve draaggolf-ruisdichtheidsverhouding (C/N₀) van elke band. Hij tekent het resultaat als een waterfall (frequentie horizontaal, tijd verticaal, kleur voor vermogen) naast C/N₀-balken per band, en hij leest en schrijft Signal Metadata Format (SigMF)-opnamen, zodat een echte opname kan worden geschat en naast het model kan worden geplot.

seg-0007b6ba97ca = Schrijf het meegeleverde voorbeeld naar een bestand en voer het uit:

seg-5e205b189b26 = In een checkout voert <c1/> hetzelfde bestand uit.

seg-261deb22b4fa = Code: <c1/> (het model, de soort, de Welch-schatter), <c2/> (de opnamecodec), <c3/> (de signaalspectra met eenheidsoppervlak en de spectrale scheidingscoëfficiënt) en <c4/> (de voorinstellingen voor signaalontwerp die een band kan noemen).

seg-bb1153873209 = Modulatie

seg-9758b36b554c = Standaard ontvangen vermogen

seg-a1a68286b809 = Standaard ontvangerbandbreedte

seg-27a2cdc8183f = { "1575.42" } MHz

seg-66a103496266 = binary phase-shift keying, BPSK({ "1" })

seg-f386c2e2e352 = −{ "158.5" } dBW (IS-GPS-200)

seg-50112ba8867d = { "2.046" } MHz

seg-b7755cb9a384 = multiplexed binary offset carrier, MBOC(6,1,1/11), of binary offset carrier BOC({ "1,1" })

seg-6043a4ef45ca = −{ "157.25" } dBW (Galileo OS SIS ICD Issue { "2.1" }, Table { "12" })

seg-6dc5e3668a78 = { "14.322" } MHz

seg-f03380403a2a = { "1227.60" } MHz

seg-06c245582533 = BPSK({ "1" }) (CM- en CL-codes in tijdmultiplex)

seg-fa56c0085dbc = −{ "160.0" } dBW (IS-GPS-200)

seg-1982a811e1ef = { "1176.45" } MHz

seg-dd074e33242e = BPSK({ "10" })

seg-f30f2e48a3bf = −{ "157.9" } dBW (IS-GPS-705)

seg-898ae19a946b = −{ "155.25" } dBW (Galileo OS SIS ICD Issue { "2.1" }, Table { "12" })

seg-3216d5cd918d = GPS (Global Positioning System) L1 C/A is de coarse/acquisition-code; L2C is het civiele L2-signaal; IS-GPS-200 en IS-GPS-705 zijn de GPS-interfacespecificaties; Galileo OS SIS ICD is het Galileo Open Service Signal-in-Space Interface Control Document. De ontvangen vermogens zijn de minimumwaarden uit de specificatie; de bandbreedtes zijn modelleringskeuzes. Beide kunnen per band worden overschreven. Zonder tabel <c1/> gebruikt de run deze vijf. GLONASS G1/G2, BeiDou B1/B2 en Galileo E6 horen <b>niet</b> bij de benoemde banden.

seg-79cc2ed8195b = Een item <c1/> heeft een van drie vormen:

seg-67d0591c69d8 = een naam uit de tabel hierboven, met optioneel <c1/>, <c2/> en, voor <c3/>, <c4/>;

seg-8596194c81f2 = <c1/>: een signaalontwerp voor een lage baan om de aarde (LEO) of een representatief ontwerp uit de voorinstellingenbibliotheek van de soort <c2/> (<a1>LEO-SIGNAL.md</a1>), in een willekeurige band, getekend met elke component (acquisitie, data, pilot, subdraaggolven met frequentieverdeling) en bandbegrensd tot zijn zendbandbreedte; C/N₀ en J/S verwijzen naar de gevolgde component, en <c3/> labelt haar alleen. De voorinstellingen zijn <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/> en <c15/>;

seg-2ca46a7f2949 = een aangepaste band: elke <c1/> met <c2/>, <c3/> (<c4/>, <c5/> of <c6/>) en <c7/>.

seg-fcb0f9fcffbf = Jammers (<c1/>) nemen een <c2/> aan:

seg-457e5e95c677 = <c1/>: een continugolftoon (CW) bij <c2/>;

seg-3120ac4f6710 = <c1/>: vlakke ruis over <c2/>;

seg-7d975838a2e6 = <c1/>: vlakke ruis over een brede <c2/> (een barragejammer): dezelfde dichtheid als <c3/>, apart benoemd omdat de soort <c4/> haar als breedband beoordeelt;

seg-d13b177946d2 = <c1/>: een lineaire zaagtandsweep van <c2/> elke <c3/>;

seg-675fb74a89e4 = <c1/>: breedbandruis waarvan het spectrum de eigen modulatie van de band <c2/> is.

seg-64d7a14a198e = Elk geeft ofwel <c1/>, ofwel een effectief isotroop uitgestraald vermogen <c2/> met een <c3/> (en optioneel <c4/>), dat door het padverlies in vrije ruimte van de soort <c5/> gaat. <c6/> en <c7/> scripten de tijdlijn.

seg-8e718c09f7d8 = De ontvanger (<c1/>) bepaalt de ruisondergrens, <c2/> met <c3/> voor antennetemperatuur <c4/> en ruisgetal <c5/>, en de trackingdrempel.

seg-9b8078bd0df3 = De hoofd-waterfall beslaat <c1/> (standaard { "1160" } tot { "1590" } MHz in { "430" } bins). Elk item <c2/> (<c3/>, <c4/>, <c5/>, <c6/>, standaard { "200" } bins) voegt een extra waterfall toe over zijn eigen frequentiebereik op dezelfde tijdlijn, voor een spectrum dat meerdere banden overspant.

seg-a550e89c2907 = De interferentieketen

seg-12a2c08191c0 = Voor een signaal met eenheidsoppervlakspectrum <c1/> en een jammer met eenheidsvermogensspectrum <c2/> is de spectrale scheidingscoëfficiënt (SSC) over de ontvangerband <c3/> gelijk aan <c4/>, en de effectieve draaggolf-ruisdichtheid met meerdere jammers is

seg-5c556163af62 = (Betz { "2001" }; Kaplan & Hegarty, <em>Understanding GPS/GNSS</em>, 3e druk, §{ "9.4" }). Voor één jammer is dit exact de anti-jamvergelijking van de soort <c1/> met <c2/>; het blok <c3/> van het rapport voert de eigen functies van de soort <c4/> uit op dezelfde linkinvoer en toont het verschil, dat nul is op afronding na.

seg-c11d0cb8e670 = Het rapport toont ook de C/N₀ die de soort <c1/> geeft met zijn Q-tabel. De tabel bevat de leerboekwaarden, in de tests vastgepind op de gesloten vormen:

seg-5c21df11e35b = <b>CW en smalband: <c1/>.</b> Een CW-toon op de C/A-draaggolf heeft <c2/>, dus <c3/>, en de tabel en de spectra komen overeen. In het meegeleverde voorbeeld geeft de toon bij beide { "17.98" } dB-Hz (de tabel gaf { "19.74" } toen hij { "1.5" } bevatte).

seg-647e209b1efc = <b>Breedband en gesweept: <c1/>, sinds { "0.36" }.</b> Dat is witte ruis over de hoofdlob met het signaalvermogen in de band genormaliseerd op één, <c2/>. De tabel bevatte { "1" } tot { "0.36" }, ongeveer { "3" } dB te pessimistisch (<c3/>).

seg-cd03b9c900e1 = Het spectrummodel leidt zijn eigen waarden af uit de spectra:

seg-b1327e66260b = <c1/> voor ruis die bij C/A past (<c2/>);

seg-45b2cf032a11 = <c1/> voor vlakke ruis van nul tot nul zonder de normalisatie (<c2/>).

seg-6c2187f0e32b = Dus voor die jammers verschillen de twee getoonde C/N₀-waarden nog steeds, met opzet.

seg-73dfbeabcac2 = Elke waterfallcel is de PSD gemiddeld over zijn frequentiebin en zijn rij. Een chirp wordt exact over de rij gemiddeld, hele sweeps plus de gedeeltelijke; een jammer die midden in een rij aan- of uitgaat, wordt gewogen naar zijn inschakelduur. De C/N₀-tijdlijn gebruikt dezelfde gemiddelden, zodat beeld en cijfers overeenstemmen. Per band meldt de tijdlijn de J/S in de band (jammervermogen binnen de ontvangerbandbreedte gedeeld door het signaalvermogen). Per jammer en band geeft het rapport de SSC, <c1/>, totale J/S, J/S in de band en de stationaire C/N₀.

seg-2c214a0a30be = Het meegeleverde voorbeeld

seg-4adc00a3ca10 = <c1/>: een tijdlijn van { "60" } s, één rij per seconde, een antenne van { "290" } K en een ruisgetal van { "2" } dB (ondergrens −{ "201.98" } dBW/Hz).

seg-94d1cebc134d = { "10" } s tot { "40" } s: een chirp van { "16" } MHz rond L1, sweeps van { "9" } µs, { "50" } mW op { "100" } m.

seg-b85319af4f85 = Vanaf { "30" } s: een CW-toon op de L1-draaggolf, { "10" } mW op { "1" } km.

seg-21e2b4e76832 = Vanaf { "45" } s: vlakke ruis van { "2" } MHz op L2, ontvangen met −{ "135" } dBW.

seg-45dd378c692c = Wat de run berekent:

seg-eecd7d7530bf = Minimale C/N₀

seg-1ead35e1aad5 = Eerste verlies

seg-bfb55a322ece = Rijen met tracking

seg-863ea3f1fbe9 = { "3.23" } dB-Hz

seg-9aa0239a3a0c = { "10" } s

seg-9979940d2359 = { "44.73" } dB-Hz

seg-25364ef39455 = { "4.44" } dB-Hz

seg-c8d0bc71cccd = { "41.98" } dB-Hz

seg-c945914c444c = { "36.86" } dB-Hz

seg-9ff066fb53a6 = nooit

seg-63d4f00f622d = { "44.08" } dB-Hz

seg-58b097691919 = De CW-toon is de reden dat de twee L1-signalen bij { "40" } s uiteen gaan lopen. Hij valt op de piek van het C/A-spectrum en houdt C/A op { "17.98" } dB-Hz, onder de drempel van { "25" } dB-Hz. Hij valt in de nul van het MBOC-spectrum, dus Galileo E1 keert terug naar zijn nominale C/N₀ wanneer de chirp stopt.

seg-064579d5fbac = De signalen zelf liggen ongeveer { "20" } dB onder de ruisondergrens, dus de waterfall toont de ondergrens en de jammers; de C/N₀-balken tonen wat despreading terugwint.

seg-023a7f163106 = Dezelfde jammers sturen een geschakelde missie in <c1/> aan (zie <a1>CAMPAIGNS.md</a1>): de klok houdt stand (holdover) zolang de chirp aan staat, en de ontvanger valt onder de CW-toon terug op Galileo E1.

seg-6b0edbfca134 = Voorbij de L-band

seg-63d1fd8043ed = <c1/> plaatst LEO-signalen voor positiebepaling, navigatie en tijdsynchronisatie (PNT) in vier banden naast GPS L1 C/A en Galileo E5a, elke band met zijn eigen jammer, op een tijdlijn van { "60" } s. De waterfall <c2/> is de L-band; drie <c3/> voegen UHF ({ "455" } tot { "475" } MHz), S ({ "2482" } tot { "2502" } MHz) en C ({ "5005" } tot { "5035" } MHz) toe.

seg-6818247b5863 = { "10" } s: een CW-toon op de UHF-draaggolf, −{ "120" } dBW ontvangen.

seg-02de8390de31 = { "20" } s: de chirp van het L-bandvoorbeeld ({ "16" } MHz rond L1, sweeps van { "9" } µs, { "50" } mW op { "100" } m).

seg-47e55dfd4e0d = { "30" } s: breedbandruis, { "40" } MHz rond { "1185" } MHz, −{ "118" } dBW.

seg-dfa416032770 = { "40" } s: smalbandruis, { "2" } MHz op de S-draaggolf, −{ "128" } dBW.

seg-1d119727a749 = { "50" } s: ruis die past bij het eigen spectrum van het C-bandsignaal, −{ "124" } dBW.

seg-abacb60b16a3 = Wat de run berekent (de C/N₀ van de ontworpen signalen is die van de gevolgde component, dus de nominale waarde ligt onder het totale ontvangen vermogen met het aandeel van het gevolgde deel):

seg-1c921b6299e4 = representatief, BPSK({ "5" }), −{ "150" } dBW

seg-5331cde832fb = { "34.38" } dB-Hz

seg-35588b19fd72 = specificatieminimum

seg-7d3639369444 = { "3.38" } dB-Hz

seg-9eef1ec7858f = { "38.51" } dB-Hz

seg-c6743d980e6b = gepubliceerd ontwerp, −{ "144.9" } dBW

seg-245bf7d080b3 = { "1190.51625" } MHz

seg-f2aed7e062bf = { "46.29" } dB-Hz

seg-c6a19eb8e0b9 = { "41.69" } dB-Hz

seg-a6f2bb955ca2 = representatief, BPSK({ "10" }), −{ "152" } dBW

seg-b9312cc881d2 = { "40.35" } dB-Hz

seg-03bb124d45d2 = Alleen de chirp neemt een signaal weg (GPS L1 C/A, vanaf { "20" } s). Elke andere jammer verslechtert alleen de band die zijn spectrum bereikt: de aangepaste ruis van de C-band heeft bijvoorbeeld een SSC van −{ "71.87" } dB/Hz met het C-bandsignaal en onder −{ "133" } dB/Hz met elke andere band.

seg-a8bea652a85d = Hetzelfde mechanisme stuurt de scenario's voor LEO-PNT-veerkracht aan (<a1>LEO-PNT.md</a1>):

seg-cf7bc2f52cad = <c1/> verhoogt een barragejammer van { "40" } MHz bij { "1185" } MHz elke { "10" } s met { "5" } dB vanaf −{ "125" } dBW. GPS L5 gaat verloren bij de stap van −{ "105" } dBW, Galileo E5a bij −{ "100" } dBW en Xona X5 bij −{ "95" } dBW, terwijl een representatief LEO-L-bandsignaal dat met −{ "135" } dBW wordt ontvangen nog steeds trackt bij −{ "90" } dBW: ontvangen vermogen koopt J/S-marge dB voor dB.

seg-94b65c0e6087 = <c1/> is een campagnesweep van een run <c2/> over het vermogen van een barrage in de L5-band (<a1>CAMPAIGNS.md</a1>).

seg-67279a0780e4 = <c1/> is een geschakelde campagne waarvan de fasen de GNSS- en LEO-C/N₀ uit runs <c2/> lezen, met panelen voor S- en C-band.

seg-42b00ae14ffe = IQ, SigMF en Welch

seg-3418c31c4318 = <c1/> tekent het model op één tijdstip als complexe in-phase- en quadratuur-samples (IQ), schrijft ze als een SigMF-opname (<c2/> of <c3/>), leest de opname terug en schat haar PSD met de methode van Welch (Hann-venster, { "50" } % overlap, gemiddelde periodogrammen, dichtheidsgeschaald). Thermische ruis, signalen en ruisachtige jammers worden bin voor bin getekend uit de eigen dichtheid van het model; een toon en een chirp worden als echte golfvormen getekend. Met alleen ruisachtige jammers ligt de Welch-schatting binnen { "0.1" } dB van het model (mediaan). Een periodieke chirp is een lijnenspectrum op zijn sweepsnelheid, met rimpel en staarten voorbij zijn bandranden die het gladde model weglaat: in het meegeleverde voorbeeld komt het totale vermogen binnen { "0.02" } % overeen en verschilt de mediane bin { "0.5" } dB. De snapshot is een bestand dat voor analyse wordt geschreven; er wordt niets uitgezonden en er wordt geen radiohardware aangestuurd.

seg-a3b0a61b5efe = <c1/> (alleen native builds) leest een echte SigMF-opname uit <c2/> (het gegevensbestand heeft standaard dezelfde stam met <c3/>), schat haar PSD en toont die naast het model op de frequenties van de opname. Een SigMF-bestand heeft geen absolute vermogenskalibratie, dus het rapport geeft de mediane offset en de vorm, geen niveau.

seg-04b08e06811d = In de WebAssembly-build zijn de bestandsleesacties niet beschikbaar; <c1/> en <c2/> werken op bytes die de pagina aanlevert.

seg-69b384afe05d = Signaal-PSD's en SSC's

seg-a65b87c51f05 = BPSK(n)-hoofdlob 2n × { "1.023" } MHz van nul tot nul; BOC({ "1,1" })-lobben gecentreerd op ±{ "1.023" } MHz (Betz { "2001" }); SSC's −{ "61.86" } / −{ "64.87" } / −{ "67.88" } dB/Hz voor C/A×C/A, BOC({ "1,1" })×BOC({ "1,1" }), C/A×BOC({ "1,1" }) uit hun gesloten Parseval-vormen, de waarden achter de gepubliceerde −{ "61.8" } / −{ "64.8" } / −{ "67.8" } dB/Hz; Q = { "1" } (CW) en { "1.5" } (aangepast) (Kaplan & Hegarty §{ "9.4" }); de tabelitems van de soort <c1/> zijn gelijk aan de gesloten vormen: CW en smalband Q = { "1" }, breedband en gesweept Q = { "2" } (witte ruis over de hoofdlob, vermogen in de band genormaliseerd; { "1" } tot { "0.36" })

seg-d2afc6e05969 = Waterfall, J/S en C/N₀-tijdlijn

seg-c44413d5a060 = Valt exact terug op de keten van de soort <c1/>; de jammervermogens, de tijdlijn en de bandbreedtes zijn invoer

seg-304f4aeaf4cb = SigMF-codec en Welch-schatting

seg-7a642dd02e5c = Heen-en-terugreizen, een directe discrete Fouriertransformatie, identiteiten voor witte ruis en van Parseval; er zit geen opname van derden in de repository

seg-1138c9e62a21 = Multiband-waterfall met ontworpen signalen en jammers per band

seg-ac38681004e9 = Valt terug op de keten van de L-band (een band met één component geeft dezelfde getallen als vóór de uitbreiding) en op de aan een externe referentie getoetste signaalspectra; de ontworpen signalen, jammers en bandbreedtes zijn invoer

seg-0c0c625a8ff5 = Eén correctie op een gangbare vereenvoudiging: de lobben van het BOC({ "1,1" })-spectrum zijn <em>gecentreerd</em> op ±{ "1.023" } MHz (tussen de draaggolfnul en de nul bij { "2.046" } MHz), maar het maximum van de PSD ligt op ±{ "0.759" } MHz, waar <c1/> met <c2/>. De tests leggen beide vast.

seg-6ab6e241f7e5 = Lijnstructuur van de spreidingscode (de lijnen van { "1" } kHz van C/A): een toon wordt beoordeeld tegen de gladde omhullende, niet tegen de dichtstbijzijnde codelijn.

seg-4be08100a707 = Automatische versterkingsregeling, kwantisatie, pulsonderdrukking en notchfiltering.

seg-0f195ea4126e = Het ontvangstantennepatroon in de richting van de jammer, voorbij één versterkingscijfer.

seg-d3d03da9c962 = Interferentie door meervoudige toegang tussen satellieten van één band.

seg-db5c7566f49e = De emissies van een ontworpen signaal buiten zijn zendbandbreedte: zijn spectrum wordt daar afgekapt, dus er bereikt geen emissie buiten de band een naburige band.

seg-9cbea7151036 = Het effect van een chirp op de lus bij sweepsnelheden die vergelijkbaar zijn met de lusbandbreedte: zijn C/N₀ gebruikt het over de rij gemiddelde spectrum.

seg-d19ed16f451c = J. W. Betz, "Binary Offset Carrier Modulations for Radionavigation," <em>NAVIGATION</em> { "48" }({ "4" }), { "2001" }.

seg-e2225151c10b = E. D. Kaplan en C. J. Hegarty (red.), <em>Understanding GPS/GNSS: Principles and Applications</em>, 3e druk, Artech House, { "2017" }, §{ "9.4" }.

seg-85b2d251a221 = G. W. Hein et al., "MBOC: The New Optimized Spreading Modulation Recommended for Galileo L1 OS and GPS L1C," <em>Inside GNSS</em>, mei/juni { "2006" }.

seg-b091f7c36ab9 = P. D. Welch, "The Use of Fast Fourier Transform for the Estimation of Power Spectra," <em>IEEE Transactions on Audio and Electroacoustics</em> { "15" }({ "2" }), { "1967" }.

seg-b65142371229 = IS-GPS-200, IS-GPS-705; Galileo OS SIS ICD.

seg-d28b74d8c755 = SigMF-specificatie, <a1>https://sigmf.org/</a1> (bron: <a2>https://github.com/sigmf/SigMF</a2>).

seg-a9b968473b2a = <s1>Vorige</s1>Integriteit en beveiliging

seg-d5264da8bf65 = <s1>Volgende</s1>ARAIM-referentie
