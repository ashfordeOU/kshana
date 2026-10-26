# docs--glossary: translations (nl)

seg-daf25c6479c1 = Standaarden

seg-c851aa23ea42 = kommagescheiden waarden

seg-366c59b03b4f = CSV

seg-cb273d6705c6 = SVG

seg-49a994d77d2f = temperatuurgecompenseerde kristaloscillator

seg-1bac97ee312a = atomaire frequentiestandaard met rubidium

seg-b09ffb8a9095 = Monte Carlo

seg-9939da5da283 = JSON

seg-5907283b71da = Afkorting

seg-900c7c7e99cd = GMAT

seg-c730f9c69d6e = ISB

seg-ef9ba270513c = bias tussen systemen

seg-7dabf60fd17e = QPN

seg-dae80c23262e = quantumprojectieruis

seg-430b3c681347 = RTKLIB

seg-051a168f774c = TCXO

seg-ba5d469b1c66 = VLBI

seg-e464509f3abb = draaggolf-ruisdichtheidsverhouding

seg-68ff97cfdc03 = DOI

seg-fa299d3dcaad = digital object identifier

seg-d41af8f18aed = GLONASS

seg-1df73b95ae4d = IAU

seg-e78cf68c3f5e = ICRF

seg-f094d5944111 = International Celestial Reference Frame

seg-70fd83c6e862 = ISS

seg-cc73228e1f0e = Internationaal Ruimtestation

seg-865e7d1794b6 = Secure Hash Algorithm, 256 bits

seg-8104773e1484 = STK

seg-ad20a7bebf23 = STL

seg-e2dbcb4bc5f5 = Satellite Time and Location

seg-71aee5eb55c5 = UHF

seg-65e797f8bb42 = ultrahoge frequentie

seg-6ce4c2164aee = Bron: <c1/>

seg-bee5d056ef03 = Begrijpelijke definities van de termen die in { -brand } worden gebruikt. Elk item begint met een eenregelige uitleg "in gewone woorden" en voegt daarna de exacte betekenis toe waar dat helpt. Afkortingen die niet in een sectie zijn gedefinieerd, staan in de A-tot-Z-tabel bijna aan het einde, <a1>Elke andere afkorting, van A tot Z</a1>.

seg-f8c5433d1026 = Navigatie en tijdsynchronisatie

seg-2a42d84608ea = <b>PNT — Positioning, Navigation, and Timing (positiebepaling, navigatie en tijdsynchronisatie).</b> Precies weten <em>waar</em> u bent, <em>welke kant</em> u op gaat en <em>hoe laat het is</em>. Moderne PNT komt meestal van satellietsignalen (GNSS, de hierna gedefinieerde globale navigatiesatellietsystemen); { -brand } onderzoekt wat er met <em>tijd</em> en <em>positie</em> gebeurt wanneer die signalen verloren gaan.

seg-6227db2c94e1 = <b>GNSS — Global Navigation Satellite System.</b> De satellietconstellaties die PNT leveren: GPS (het Global Positioning System, VS (Verenigde Staten)), Galileo (EU), GLONASS (het Global Navigation Satellite System van Rusland), BeiDou (China). Een ontvanger die ≥ { "4" } satellieten kan zien, kan een volledige 3D-positie en tijd bepalen.

seg-f8eda357e640 = <b>GNSS-uitval / geweigerd / gedegradeerd / gejamd.</b> Wanneer de satellietsignalen niet beschikbaar zijn (geblokkeerd, gejamd of buiten zicht). Tijdens een uitval moet het systeem op zijn eigen sensoren aan boord "coasten". Het hele doel van { -brand } is meten hoe goed dat coasten gaat.

seg-a3ade199f465 = <b>Holdover.</b> In gewone woorden: <em>hoe lang de klok op eigen kracht de juiste tijd kan houden nadat ze GNSS kwijt is.</em> Een betere klok houdt het langer vol voordat haar fout de toegestane grens overschrijdt.

seg-83b33c15312f = <b>Koppelnavigatie.</b> In gewone woorden: <em>schatten waar u bent door uw gemeten beweging op te tellen, zonder externe referentie.</em> Fouten stapelen zich op, dus een betere inertiële sensor driftt langzamer.

seg-da9bcc994b9c = <b>Specificatie / drempel.</b> De maximale fout die u mag hebben voordat de oplossing als "buiten specificatie" telt — bijvoorbeeld "de tijdsynchronisatie moet binnen { "20" } ns blijven" of "de positie binnen { "100" } m".

seg-6f37a60a30c7 = De sensoren die { -brand } vergelijkt

seg-308b59d89586 = <b>Klok (atoomklok).</b> Een apparaat dat de tijd bijhoudt door de natuurlijke oscillatie van een atoom te tellen. Twee voorbeelden hier:

seg-3389d08be6bc = <b>CSAC — Chip-Scale Atomic Clock.</b> Een kleine, ingezette, commerciële klok (de "klassieke" referentie). Goed, maar driftt merkbaar bij een lange uitval.

seg-3e121d8e6400 = <b>Optische roosterklok (bijvoorbeeld strontium).</b> Een veel stabielere "kwantum"klok; de stand van de techniek in laboratoria, nog niet in de ruimte gevlogen.

seg-4daa6cdf8ae2 = <b>Versnellingsmeter.</b> Meet versnelling (verandering van beweging). Twee keer geïntegreerd levert hij positie op — dus elke fout groeit snel. <b>Koudeatoomversnellingsmeter</b> is de kwantumversie met veel betere stabiliteit op lange termijn; <b>navigatiekwaliteit</b> is de klassieke.

seg-91793676c57c = <b>Gyroscoop.</b> Meet rotatie. Een kleine rotatiefout kantelt het platform, waardoor zwaartekracht in de horizontale richting lekt en de positieschatting wordt verstoord.

seg-2d36110effc3 = <b>IMU — Inertial Measurement Unit.</b> Het pakket van versnellingsmeter en gyroscoop zelf: van elk drie assen, die specifieke kracht en hoeksnelheid melden. Het meet beweging; op zichzelf weet het niet waar het is.

seg-e3b6b40e0cd0 = <b>INS — Inertial Navigation System.</b> Een IMU plus de "mechanisatie" die zijn uitvoer integreert tot oriëntatie, snelheid en positie. De INS is wat tijdens een GNSS-uitval aan koppelnavigatie doet, en zijn nauwkeurigheid wordt bepaald door de foutprocessen van de IMU die hieronder staan.

seg-a618ff7ee429 = <b>Tijdoverdracht.</b> Een nauwkeurig tijdsignaal tussen twee plaatsen sturen (bijvoorbeeld van satelliet naar satelliet). <b>Optische</b> verbindingen zijn veel nauwkeuriger dan <b>RF</b>-verbindingen (radiofrequentie).

seg-847fbbeecfae = Hoe fouten worden gemodelleerd (klokruis)

seg-5cf197bdbbad = De klokfout wordt opgebouwd uit standaard "ruissoorten", elk met een bekende signatuur:

seg-3806d1b1cb50 = <b>Witte FM (witte frequentiemodulatie).</b> In gewone woorden: <em>snelle, willekeurige jitter in de gang van de klok.</em> Uitmiddelen verbetert het met de tijd. Parameter <c1/>.

seg-0793fdd3abab = <b>Random-walk-FM.</b> In gewone woorden: <em>de gang van de klok dwaalt langzaam weg.</em> Dit domineert lange uitvallen. Parameter <c1/>.

seg-42b74c8b88ff = <b>Flicker-FM (1/f-ruis).</b> In gewone woorden: <em>een hardnekkige ruisondergrens waar de klok nooit onder kan uitmiddelen.</em> Ze is vlak over alle middelingstijden. Parameter <c1/>.

seg-b3bd841a5a2d = <b>Veroudering / drift.</b> Een langzame, <em>voorspelbare</em> verandering van de gang in de tijd; omdat ze voorspelbaar is, verwijdert de schatter van { -brand } haar. Parameter <c1/>.

seg-d929960492e4 = <b>VRW — Velocity Random Walk.</b> Het equivalent van witte ruis voor de versnellingsmeter: willekeurige stoten in de snelheid die zich opstapelen tot positiefout. Parameter <c1/>.

seg-4a97f8d14174 = <b>ARW — Angular Random Walk.</b> Het equivalent voor de gyroscoop: willekeurige stoten in de oriëntatie. Parameter <c1/>.

seg-dcd03b326110 = Hoe stabiliteit wordt gemeten

seg-2181832c6253 = <b>Allan-deviatie (<c1/>).</b> In gewone woorden: <em>de standaardmanier om te vermelden hoe stabiel een klok is over een gegeven middelingstijd <c2/>.</em> Een gegevensblad van een klok noemt bijvoorbeeld <c3/>. { -brand } toetst zijn klokmodel door de Allan-deviatie van zijn eigen uitvoer te berekenen en na te gaan of die overeenkomt met het gepubliceerde getal. (Referentie: Riley, NIST SP { "1065" } — National Institute of Standards and Technology Special Publication { "1065" }.)

seg-11cbe561e633 = <b>PSD — Power Spectral Density.</b> Hoe het vermogen van ruis over frequenties is verdeeld; de formele manier om witte, random-walk- en flickerruis te specificeren.

seg-0737d620eb5f = De kwaliteitsmaten (hoe een run wordt gescoord)

seg-20b66e0d4809 = De zes operationele PNT-kwaliteitsmaten die { -brand } meldt (zie de tabel "Output" in de README):

seg-b17d08246e49 = <b>FoM — Figure of Merit.</b> Eén getal dat één aspect van een run scoort, gemeld met zijn eenheid en met de vermelding of het is getoetst aan een externe referentie of berekend uit een model. De zes hieronder zijn de operationele FoM's van { -brand }.

seg-b229a69fb4ac = <b>Positie- / tijdsynchronisatieprestaties</b> — de grootte van de fout, als RMS (root mean square, het kwadratisch gemiddelde) en als 95e percentiel.

seg-ba3ed5a28518 = <b>Autonomie</b> — de holdoverduur (hoe lang het zonder GNSS binnen de specificatie blijft).

seg-13ecdd037098 = <b>Veerkracht</b> — hoe snel de fout groeit zodra GNSS verloren is.

seg-be0168f24d6e = <b>Beschikbaarheid</b> — het deel van de run met een oplossing binnen de specificatie.

seg-44ef500b371d = <b>Integriteit</b> — <em>kunt u de eigen schatting van het systeem van zijn fout vertrouwen?</em> { -brand } meldt het deel van de samples tijdens de uitval waarvan de ware fout binnen de beschermende grens van het filter blijft.

seg-d1cc3819cde9 = <b>Beveiliging</b> — robuustheid tegen spoofing: een score voor de detecteerbaarheid van spoofing op basis van klokstabiliteit (sinds { "v0.3.0" }), die alleen zinvol is wanneer een spoofingaanvalsscenario is geconfigureerd. Het is <em>niet</em> integriteit op luchtvaartniveau: het berekent geen horizontaal of verticaal beschermingsniveau (HPL/VPL) en draait geen receiver autonomous integrity monitoring (RAIM), geavanceerd of anderszins. Die komen uit de afzonderlijke scenariosoorten voor integriteit en ARAIM (advanced RAIM) en zijn gedefinieerd onder "Integriteit en augmentatie" hieronder. Exportgevoelig.

seg-5cae59204d9e = Termen die naast de kwaliteitsmaten worden gebruikt:

seg-7adc0e49a981 = <b>Spoofing.</b> In gewone woorden: <em>een vals satellietsignaal dat liegt over positie of tijd.</em> Een spoofer voert de ontvanger een aannemelijk maar fout antwoord, wat erger is dan jamming omdat de ontvanger het misschien niet merkt.

seg-2d2e6cbeade6 = <b>1-DOF — één vrijheidsgraad.</b> Eén enkele as. De positiefout in het scenariopakket van { -brand } is eenassig; een volledig 3D-antwoord vraagt het model met drie assen.

seg-14a32d281c4b = <b>Monte Carlo-ensemble.</b> Hetzelfde scenario vele malen draaien met verschillende willekeurige seeds en de spreiding van de resultaten melden in plaats van één run.

seg-fcbea49a3592 = <b>CI — betrouwbaarheidsinterval.</b> Het bereik waarin een statistiek naar verwachting valt met een vermelde waarschijnlijkheid (bijvoorbeeld { "95" } %). In de tabellen en badges van de README betekent "CI" vaker <b>continuous integration</b> — de geautomatiseerde build-en-testrun bij elke wijziging; de context zegt welke bedoeld is.

seg-310abfd6a64c = <b>k-sigmagrens.</b> Een grens op <em>k</em> standaarddeviaties van de eigen onzekerheid van het filter; de kwaliteitsmaat Integriteit telt hoe vaak de ware fout erbinnen blijft.

seg-ad26afbaa7b4 = <b>CEP / 2DRMS — circular error probable / tweemaal de wortel uit het gemiddelde kwadraat van de afstand.</b> Twee standaardmanieren om 2D-horizontale nauwkeurigheid te vermelden: CEP is de straal die { "50" } % van de positiebepalingen bevat; 2DRMS is tweemaal de kwadratisch gemiddelde horizontale fout. De bibliotheek kan beide berekenen uit een positiecovariantie (<c1/>), maar geen enkele scenariosoort meldt ze al.

seg-fd93c1effba8 = Een resultaat lezen: de termen in de uitvoer

seg-3432498093cf = Dit zijn de namen die u tegenkomt in een resultaatbestand of in de samenvatting van de playground, eerst in gewone woorden.

seg-099bf2eb4602 = <b>Holdover (<c1/>).</b> In gewone woorden: <em>hoeveel seconden het systeem binnen zijn foutgrens bleef nadat GNSS verloren was.</em> { -brand } meldt de kortste zulke coast over alle uitvallen in de run, gemeten op het tijdraster van de run, dus het is een ondergrens bij de resolutie van de tijdstap. Een holdover gelijk aan de duur van de uitval betekent dat de grens nooit is overschreden.

seg-e68708a219f1 = <b>p95 (<c1/>).</b> In gewone woorden: <em>in { "95" } % van de tijd was de tijdfout zo klein of kleiner.</em> Het is het 95e percentiel van de fout tijdens de uitval. Een zeer kleine waarde kan in een korte samenvatting als <c2/> worden getoond; het JSON-resultaatbestand (JavaScript Object Notation) bevat het getal met volledige precisie.

seg-4dfaee63262d = <b>Integriteit (<c1/>).</b> In gewone woorden: <em>hoe vaak de eigen foutschatting van het systeem eerlijk was.</em> Het is het deel van de samples tijdens de uitval waarvan de ware fout binnen de k-sigmagrens van het filter bleef (hieronder gedefinieerd). Een waarde dicht bij { "1" } betekent dat de schatter zijn fout niet te laag inschatte. Het is geen beschermingsniveau voor de luchtvaart; zie "Integriteit en augmentatie" hieronder en <a1><c2/></a1>.

seg-5af09f5129e0 = <b>Beveiligingsscore (<c1/>).</b> In gewone woorden: <em>hoe waarschijnlijk het is dat een spoofingaanval wordt opgemerkt.</em> Het is de kans dat de geconfigureerde aanval wordt gedetecteerd — één min de kans op gemiste detectie <c2/> — afgeleid uit de stabiliteit van de klok. Het betekent alleen iets wanneer het scenario een spoofingaanval configureert. Zonder geconfigureerde aanval drukt de eenregelige samenvatting <c3/> af en markeert het resultaat het cijfer als <c4/> in zijn blok <c5/>; de waarde blijft in het document staan en betekent "niet van toepassing", niet "geen beveiliging".

seg-70113d509997 = <b>PDOP — positie-dilution of precision (sleutels zoals <c1/>).</b> In gewone woorden: <em>hoezeer de satellietgeometrie afstandsmetingsfouten vergroot tot positiefouten.</em> De positiefout is ruwweg PDOP maal de afstandsmetingsfout, dus lager is beter. Zie <b>DOP</b> onder "Schatting en geometrie".

seg-a445bf9a3c5f = <b>sigma_y (<c1/>, de Allan-deviatie).</b> In gewone woorden: <em>hoezeer de gang van een klok schommelt wanneer ze over een tijd <c2/> wordt gemiddeld.</em> Een regel in een gegevensblad zoals <c3/> betekent dat de gang, gemiddeld over één seconde, ongeveer { "3" } delen op 10¹⁰ varieert. Kleiner is een stabielere klok. Zie "Hoe stabiliteit wordt gemeten" hierboven.

seg-03b4bb05148d = <b>q_wf — intensiteit van witte frequentieruis.</b> In gewone woorden: <em>de sterkte van de snelle, willekeurige jitter in de gang van een klok.</em> Het is de coëfficiënt in <c1/> voor witte frequentieruis, dus een scenario stelt <c2/> in uit de Allan-deviatie bij één seconde in het gegevensblad. De metgezellen zijn <c3/> (random-walk-frequentieruis) en <c4/> (veroudering); zie "Hoe fouten worden gemodelleerd" hierboven.

seg-074a1337ed99 = Termen voor telecomtijdsynchronisatie

seg-9f61398628e4 = Telecomnetwerken verspreiden tijd over pakketnetwerken (Precision Time Protocol) vanaf een door GNSS gevoede referentieklok, en de International Telecommunication Union Telecommunication Standardization Sector (ITU-T) stelt grenzen aan de tijdfout die elke klok mag toevoegen. Deze termen komen voor in de soort <c1/>; zie <a1><c2/></a1>.

seg-f48712300b30 = <b>TE — time error (tijdfout).</b> In gewone woorden: <em>hoever de tijd van een klok op één moment van de referentietijd afligt.</em> Positief of negatief, meestal in nanoseconden.

seg-ceda70656c6a = <b>max|TE| — maximale absolute tijdfout.</b> In gewone woorden: <em>de grootste tijdfout die tijdens de meting is gezien, zonder rekening te houden met het teken.</em> Het is de hoofdgrens die de meeste maskers stellen.

seg-38d2922cd91d = <b>cTE — constante tijdfout.</b> In gewone woorden: <em>het vaste offsetdeel van de tijdfout</em> — de gemiddelde fout die tijdens de meting niet verandert.

seg-a4a61df332cd = <b>dTE — dynamische tijdfout.</b> In gewone woorden: <em>het schommelende deel van de tijdfout</em> — wat overblijft nadat de constante offset is verwijderd. Ze wordt beoordeeld met MTIE en TDEV.

seg-31c0a85788b1 = <b>MTIE — maximum time interval error.</b> In gewone woorden: <em>de grootste uitslag van de tijdfout binnen een venster van een gegeven lengte.</em> Voor elke vensterlengte schuift het een venster langs de registratie en neemt de grootste piek-tot-piekverandering; een masker geeft de grootste toegestane waarde per vensterlengte.

seg-53fa12cab0c6 = <b>TDEV — time deviation.</b> In gewone woorden: <em>de typische (kwadratisch gemiddelde) zwerving van de tijdfout bij een gegeven middelingstijd,</em> nadat kortetermijnjitter is uitgemiddeld. Het is een verwant van de Allan-deviatie in het tijdsdomein en wordt, net als MTIE, getoetst aan een masker.

seg-62b5eea14f6c = <b>PRTC — primary reference time clock.</b> De klok bovenaan een telecomketen voor tijdsynchronisatie, normaal gestuurd door GNSS. De prestatiegrenzen ervan staan in ITU-T Recommendation G.8272.

seg-8d6d4538981b = <b>ePRTC — enhanced primary reference time clock.</b> Een PRTC met een strengere tijdfoutgrens, ondersteund door een zeer stabiele lokale atoomklok zodat hij de tijd kan vasthouden tijdens een lang GNSS-verlies. ITU-T Recommendation G.8272.1.

seg-93fa4ac7c6fa = <b>T-BC — telecom boundary clock.</b> Een netwerkklok die tijd van stroomopwaarts ontvangt en stroomafwaarts doorgeeft, waarbij hij zelf een kleine tijdfout toevoegt. ITU-T Recommendation G.8273.2.

seg-52d32a5db6b8 = <b>T-TSC — telecom time slave clock.</b> De klok aan het einde van de keten die tijd ontvangt en aanbiedt aan de apparatuur die haar nodig heeft (bijvoorbeeld een radiobasisstation). Ook gedekt door ITU-T Recommendation G.8273.2.

seg-04d8ed12ca88 = <b>OCXO — oven-controlled crystal oscillator.</b> Een kwartsoscillator die in een kleine oven op constante temperatuur wordt gehouden, waardoor hij veel stabieler is dan een gewone kwartsoscillator. Een veelgebruikte holdoverklok in netwerkapparatuur; hij veroudert (driftt) merkbaar over dagen.

seg-6742f7ba35ac = <b>CSAC — chip-scale atomic clock.</b> Een zeer kleine atoomklok (zie "De sensoren die { -brand } vergelijkt" hierboven). Stabieler dan een OCXO bij lange holdovers, tegen hogere kosten en een hoger vermogen.

seg-c0e0c18bd867 = Bewijsniveaus: VALIDATED, MODELLED, PARTNER

seg-61c0aa107fd9 = Elke mogelijkheid in de machinaal gecontroleerde verificatiematrix (<a1><c1/></a1>) heeft een van drie niveaus.

seg-13fb20435df3 = <b>VALIDATED.</b> In gewone woorden: <em>getoetst aan het antwoord van iemand anders.</em> De uitvoer van de mogelijkheid is vergeleken met een onafhankelijke externe referentie — echte gemeten gegevens, een onafhankelijke bibliotheek van iemand anders of gepubliceerde referentiewaarden — en kwam binnen een vermelde tolerantie overeen. Een continuous-integration-controle weigert een VALIDATED-rij die geen externe referentie noemt.

seg-a5dfb48e4dcb = <b>MODELLED.</b> In gewone woorden: <em>gebouwd op degelijke fysica en gecontroleerd op interne consistentie, maar nog niet vergeleken met een extern antwoord.</em> De cijfers zijn zinvol voor vergelijking en ontwerpafwegingen; ze zijn geen bewijs dat een echt apparaat zo zal presteren. <a1><c1/></a1> legt uit waarom elke zo'n rij berekend is uit een model.

seg-0512b2d2145a = <b>PARTNER.</b> In gewone woorden: <em>dit onderdeel is van een hardware- of productzekerheidspartner, en { -brand } beweert er niets over.</em> De rij bestaat zodat de leemte zichtbaar is in plaats van onzichtbaar.

seg-278dee6d3d4c = Termen voor spectrum en interferentie

seg-285a240c9958 = Deze termen komen voor in de soort <c1/>; zie <a1><c2/></a1>.

seg-db4fdef1c562 = <b>BPSK(n) — binary phase-shift keying bij n × { "1.023" } Mchip/s.</b> De rechthoekige chipmodulatie van GPS L1 coarse/acquisition (C/A) en L2 civil (L2C) (n = { "1" }) en GPS L5 en Galileo E5a (n = { "10" }). Het spectrum is een sinc² met nullen om de n × { "1.023" } MHz.

seg-cdd0f4194f42 = <b>BOC(m, n) — binary offset carrier.</b> Een spreidingscode bij n × { "1.023" } Mchip/s vermenigvuldigd met een blokgolfsubdraaggolf bij m × { "1.023" } MHz, wat het spectrum splitst in twee lobben aan weerszijden van de draaggolf.

seg-35ae5134f2c5 = <b>MBOC(6,1,1/11) — multiplexed binary offset carrier.</b> De spectrale vermogensdichtheid 10/11 × BOC({ "1,1" }) + 1/11 × BOC({ "6,1" }), overeengekomen voor Galileo E1 open service en GPS L1C; Galileo zendt haar uit als composite BOC (CBOC).

seg-7423f94e3018 = <b>CW — continuous wave.</b> Een ongemoduleerde draaggolf: één enkele toon.

seg-55d03dd4af03 = <b>J/S — jammer-to-signal ratio.</b> Ontvangen jammervermogen ten opzichte van ontvangen signaalvermogen, in decibel.

seg-b0f2974647d4 = <b>SSC — spectral separation coefficient.</b> κ = ∫ G_s(f) G_j(f) df over de ontvangerband: hoeveel van het spectrum van een storer met eenheidsvermogen terechtkomt waar dat van het signaal ligt. De effectieve draaggolf-ruisdichtheid is [1/(C/N₀) + (J/S)·κ]⁻¹.

seg-c5affeee5269 = <b>Ruisgetal.</b> Hoeveel een ontvanger aan de thermische ruis toevoegt, als verhouding F in decibel; de systeemruistemperatuur is T_ant + { "290" } K × (F − { "1" }).

seg-5307c38d3036 = <b>Waterfall.</b> Een tijd-frequentiebeeld van een spectrum: frequentie dwars, tijd naar beneden, kleur voor vermogen.

seg-3b1ac094fdc5 = <b>Welch-schatting.</b> Een spectrale vermogensdichtheid geschat door gevensterde, overlappende periodogrammen uit te middelen (Welch { "1967" }).

seg-9901d64fb895 = <b>SigMF — Signal Metadata Format.</b> Een open opnameformaat: een JSON-bestand <c1/> dat een ruw bestand <c2/> met samples beschrijft (hier complex <c3/>, <c4/> of <c5/>).

seg-83041671f422 = <b>IQ — in-phase and quadrature.</b> De twee componenten van een complexe basisbandsample.

seg-39e6ea8506b3 = Signaaltermen voor LEO-PNT

seg-36452ee3f5cc = Deze termen komen voor in de soort <c1/> en in de multibandscenario's <c2/>; zie <a1><c3/></a1>.
