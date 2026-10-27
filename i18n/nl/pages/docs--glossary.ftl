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

seg-8363a15f3c5a = <b>LEO-PNT: positiebepaling, navigatie en tijdsynchronisatie vanuit een lage baan om de aarde.</b> Navigatiesignalen die worden uitgezonden door satellieten op een hoogte van enkele honderden tot ongeveer { "1200" } km: sterker en sneller bewegend dan GNSS vanuit een middelhoge baan om de aarde.

seg-523469643156 = <b>RNSS, RDSS, MSS, EESS: Radio Navigation Satellite Service, Radio Determination Satellite Service, Mobile Satellite Service, Earth Exploration-Satellite Service.</b> Dienstentoewijzingen van de ITU (International Telecommunication Union) waarin een band kan vallen.

seg-d1e494623341 = <b>Pilot-, data- en acquisitiecomponenten.</b> De delen van één signaal: een datavrije pilot voor afstandsmeting, een datacomponent die het navigatiebericht draagt, en een korte acquisitiecomponent met lage datasnelheid die gemakkelijk te vinden is.

seg-cce232b7cd6a = <b>FDMA: frequency-division multiple access (frequentieverdelingsmultitoegang).</b> Componenten of satellieten die worden gescheiden op basis van draaggolffrequentie in plaats van op basis van code.

seg-9d9476ee62b1 = <b>Gabor-bandbreedte (RMS).</b> β = √(∫ f² G df / ∫ G df) over de ontvangerband: de spreiding van het vermogen van een signaal in de frequentie, die bepaalt hoe nauwkeurig het afstanden kan meten.

seg-6febe9c2e506 = <b>DLL: delay lock loop (vertragingsvergrendelingslus).</b> De codevolglus; de early-late-correlatorafstand en de ruisbandbreedte bepalen de thermische-ruisjitter van de afstandsmeting.

seg-5a55da97daf9 = <b>EFQPSK: enhanced Feher quadrature phase-shift keying.</b> Een modulatie met constante omhullende (Xona Pulsar); hier benaderd door een spectrum van rechthoekige chips.

seg-6dcbf1de9904 = <b>OFDM: orthogonal frequency-division multiplexing.</b> Een multicarriergolfvorm (de downlink van Starlink); hier getekend als een vlakke band.

seg-548b285c7c8e = <b>TEC: total electron content (totale elektronendichtheid langs het pad).</b> Elektronen per vierkante meter langs het pad; { "1" } TECU = 10¹⁶ el/m². De ionosferische vertraging van de eerste orde is { "40.3" }·TEC/f² meter.

seg-dd7e0743f364 = <b>EIRP: effective isotropic radiated power (equivalent isotroop uitgestraald vermogen).</b> Zendvermogen maal antennewinst in de richting van de ontvanger.

seg-aba3b3eaba85 = Integriteit en augmentatie

seg-eab1b2c6728e = Integriteit is de vraag naar <em>vertrouwen</em>: niet "hoe groot is mijn fout?" maar "kan ik haar begrenzen, en word ik gewaarschuwd wanneer de grens wordt overschreden?" Dit zijn de termen uit de luchtvaart daarvoor.

seg-696a73449c49 = <b>RAIM: Receiver Autonomous Integrity Monitoring.</b> In gewone woorden: <em>de ontvanger controleert de satellieten onderling.</em> Bij meer satellieten dan de vier die een positiebepaling nodig heeft, moeten de overblijvende restwaarden (de residuen) klein zijn; een groot residu betekent dat één satelliet liegt, en de ontvanger kan dat zonder hulp van de grond vaststellen. Geïmplementeerd in <a1><c1/></a1>.

seg-89237433f01a = <b>ARAIM: Advanced Receiver Autonomous Integrity Monitoring.</b> De moderne vorm van RAIM voor meerdere frequenties en meerdere constellaties. Hij krijgt een integriteitsondersteuningsbericht met de aangenomen fout en foutkans van elke satelliet en geeft beschermingsniveaus terug in plaats van een geslaagd/mislukt-vlag. De volledige behandeling, met elke aanname, staat in <a1><c1/></a1>.

seg-4cc13de05193 = <b>SISRE: Signal-in-Space Range Error.</b> In gewone woorden: <em>hoe ver de uitgezonden baan en klok van een satelliet de afstand die een gemiddelde gebruiker meet ernaast doen zitten.</em> De baanfout wordt opgesplitst in radiale, along-track- en cross-trackcomponenten, gewogen naar hoezeer elk daarvan doorwerkt langs een gemiddelde zichtlijn, en vervolgens gecombineerd met de klokfout (Montenbruck et al. { "2018" }). Voor een satelliet in een lage baan om de aarde wegen de along- en cross-trackcomponenten veel zwaarder dan voor GPS, omdat gebruikers de satelliet onder een grote hoek ten opzichte van het nadir zien. Gebruikt door de soort <c1/>.

seg-847e40a033e1 = <b>RAC: Radial, Along-track, Cross-track.</b> De drie richtingen waarin een baanfout wordt ontbonden: van het middelpunt van de aarde af, langs de vliegrichting en loodrecht op het baanvlak. Het <c2/>-model van de soort <c1/> voegt in elk daarvan een correctiepolynoom toe.

seg-b725d23c839e = <b>SVID: Space-Vehicle Identifier.</b> Het nummer waarmee een navigatiebericht de satelliet aanduidt die het heeft verzonden.

seg-b0f850eb04b1 = <b>IOD: Issue of Data.</b> Een teller die verandert wanneer de inhoud van het navigatiebericht van een satelliet verandert, zodat een ontvanger een nieuw bericht van een herhaling kan onderscheiden. (Niet te verwarren met een in-orbit demonstratie, ook afgekort tot IOD, zoals bij Celeste IOD van ESA.)

seg-985a5e9c9ce9 = <b>TOW: Time of Week.</b> Seconden sinds het begin van de huidige GNSS-week (zondag { "00" }:{ "00" }).

seg-1fc62dca46d6 = <b>CRC-24Q: 24-bit cyclic redundancy check (Qualcomm-polynoom).</b> De foutdetectiecontrole die RTCM { "10403" }- en Galileo-berichten dragen: een rest van 24 bit van de berichtbits gedeeld door de polynoom <c1/>. Een ontvanger berekent haar opnieuw en verwerpt een bericht dat niet overeenkomt.

seg-abb4679dab23 = <b>URE: User Range Error.</b> In gewone woorden: <em>hoe onjuist de eigen uitgezonden baan en klok van een satelliet elke afstand tot die satelliet maken.</em> Ook wel de signal-in-space-fout (SISE) genoemd; het is het foutbudget per satelliet dat aan ARAIM en RAIM wordt gevoerd (<c1/> in <a1><c2/></a1>).

seg-158c210fd3fe = <b>MHSS: Multiple Hypothesis Solution Separation.</b> De methode die ARAIM gebruikt. Voor elke manier waarop de constellatie kan zijn gestoord vormt hij een oplossing die de verdachte satellieten uitsluit, en begrenst hij hoever die deeloplossing van de oplossing met alle satellieten in zicht kan afliggen.

seg-671711003a6f = <b>HPL / VPL: Horizontal / Vertical Protection Level.</b> In gewone woorden: <em>de straal waarbinnen het systeem belooft dat de ware fout ligt, bij een vermeld integriteitsrisico.</em> Het is een grens die het algoritme berekent, geen gemeten fout. Een run is beschikbaar wanneer het beschermingsniveau onder de alarmgrens blijft die de operatie toestaat (VAL, de verticale alarmgrens; HAL, de horizontale).

seg-5bbd2d664862 = <b>SBAS: Satellite-Based Augmentation System.</b> Een grondnetwerk dat GNSS bewaakt, correcties en integriteitsgrenzen berekent en deze uitzendt vanaf geostationaire satellieten. <b>WAAS: Wide Area Augmentation System</b> is het Amerikaanse systeem; EGNOS (de European Geostationary Navigation Overlay Service) is het Europese equivalent. { -brand } berekent beschermingsniveaus in de DO-229E-vorm met gewogen kleinste kwadraten (DO-229E is de minimale operationele prestatienorm van RTCA voor SBAS-ontvangers; RTCA was voorheen de Radio Technical Commission for Aeronautics) (<a1><c1/></a1>).

seg-ba8b448582af = Schatting en geometrie

seg-2eb6e72496b8 = <b>Schatter.</b> Het algoritme dat tijdens een onderbreking de ware positie of tijd voorspelt op basis van het sensormodel. { -brand } heeft een analytische holdover-voorspeller en een <b>Kalman-filter</b>.

seg-9b4aa612c5a9 = <b>Kalman-filter.</b> In gewone woorden: <em>een algoritme dat een grootheid volgt en ook bijhoudt hoe onzeker die is.</em> { -brand } gebruikt de onzekerheidsgrens ervan om integriteit te berekenen.

seg-8fda81dfccc9 = <b>EKF: Extended Kalman Filter.</b> Een Kalman-filter voor een niet-lineair probleem: het linealiseert het model bij elke stap rond de huidige schatting. De standaardkeuze voor het koppelen van GNSS aan een INS.

seg-9bc2c6f74b29 = <b>UKF: Unscented Kalman Filter.</b> Dezelfde taak zonder te linealiseren: het stuurt een kleine set deterministisch gekozen steekpunten door het werkelijke niet-lineaire model en bouwt het gemiddelde en de covariantie opnieuw op uit de plaats waar ze terechtkomen. Gedraagt zich beter wanneer de niet-lineariteit sterk is, en daarom gebruikt de baanbepaling het.

seg-a1e52820e3a0 = <b>DOP: Dilution Of Precision.</b> In gewone woorden: <em>hoezeer de geometrie van de satellieten de afstandsmeetfout versterkt tot een positie- of tijdfout.</em> Positiefout ≈ PDOP × afstandsmeetfout, dus een laag getal betekent een goede geometrie. De familie: <b>GDOP</b> (geometrisch: positie en tijd samen), <b>PDOP</b> (positie), <b>HDOP</b> (horizontaal), <b>VDOP</b> (verticaal), <b>TDOP</b> (tijd).

seg-e769a91a3e4b = <b>Walker-constellatie.</b> Een standaardmanier om een satellietconstellatie te beschrijven aan de hand van het aantal baanvlakken en satellieten per vlak (GPS is grofweg een Walker-schil van 24/6).

seg-b557933a4e4d = <b>Elevatiemasker.</b> De minimale hoek boven de lokale horizon waarbij een satelliet als bruikbaar wordt beschouwd; signalen die te laag staan worden uitgesloten.

seg-3ac8e11c3e33 = <b>Occultatie.</b> Wanneer de aarde de zichtlijn naar een satelliet fysiek blokkeert.

seg-249bf472cb00 = <b>Skyline (skylinemasker).</b> In gewone woorden: <em>de omtrek van gebouwen, hijskranen of heuvels tegen de lucht, als een elevatie voor elk azimut.</em> Een satelliet telt alleen als in zicht boven <c1/> op zijn azimut, en een satelliet boven het masker maar achter de skyline is "afgeschermd door de skyline". { -brand } bouwt er een op uit een tabel, een straatcanyon, sectoren en terrein (hun puntsgewijze maximum) of een REPRESENTATIVE-voorinstelling; alleen zichtlijn, geen reflectie of diffractie (<a1><c2/></a1>).

seg-620a88820a2d = <b>Hemelgeometrie.</b> Welke satellieten een locatie onder een skyline ziet en wat dat met de oplossing doet: de DOP-factoren, de oost-noord-omhoog-covariantie van de positiebepaling met kleinste kwadraten en de bijbehorende <b>foutellips</b>, het horizontale gebied dat het vermelde aandeel van de positiebepalingen bevat ({ "95" } % standaard) bij onafhankelijke, gelijke Gaussische afstandsfouten. MODELLED geometrie onder een vermeld foutmodel, niet de werkelijke fout van een ontvanger (<a1><c1/></a1>).

seg-f0e610122425 = <b>CTI: Composed Timing Integrity.</b> Beschermingsniveaus voor <em>tijd</em> in plaats van positie, berekend over een overdracht tussen verschillende tijdbronnen, bijvoorbeeld van een door satellieten gecontroleerde klok (met RAIM beschikbaar) naar een vrijlopende klok in holdover, zodat de grens geldig blijft tijdens de overgang (<a1><c1/></a1>).

seg-56642f614c3f = <b>TIB: Timing Integrity Benchmark.</b> Een maatstaf voor de tijdsynchronisatiemonitors van <em>anderen</em>: hij injecteert een menu van fouten en controleert of het vermelde beschermingsniveau van de monitor zijn fout werkelijk heeft begrensd. Hij doet zelf geen nauwkeurigheidsclaim en kan er dus ook geen overdrijven (<a1><c1/></a1>).

seg-8b89f8b913b9 = Banen en cislunair

seg-ba6b669eb8ba = <b>CR3BP: Circular Restricted Three-Body Problem.</b> Het aarde-maansysteem behandeld als twee lichamen op cirkelvormige banen om hun gemeenschappelijke zwaartepunt, plus een ruimtevaartuig dat te licht is om terug te trekken. Dicht bij de maan is een tweelichamen-Kepler-ellips eenvoudigweg de verkeerde vorm; het CR3BP is de goedkoopste dynamica die wel klopt (<a1><c1/></a1>).

seg-2726a22bf14c = <b>NRHO: Near-Rectilinear Halo Orbit.</b> Een periodieke CR3BP-baan die dicht langs de ene maanpool zwaait en ver langs de andere, zodat hij van de kant gezien bijna een rechte lijn is, vandaar "near-rectilinear". Het is de baan die voor het maanstation Gateway is gekozen, en hij behoudt bijna continu zichtlijn naar de aarde.

seg-2b2e6d04376c = <b>DRO: Distant Retrograde Orbit.</b> Een andere CR3BP-familie: een grote, stabiele baan die in het roterende stelsel gezien achterwaarts om de maan cirkelt.

seg-6bb9229aee5c = <b>EOP: Earth Orientation Parameters.</b> De gemeten, enigszins onregelmatige wobbel en draaiing van de aarde (poolbeweging, UT1 (Universal Time { "1" }, aardrotatietijd)−UTC, oftewel aardrotatietijd min gecoördineerde wereldtijd, en daglengte) die nodig is om een aardvaste positie op beter dan meters nauwkeurig in een inertiale positie om te zetten. De IERS (International Earth Rotation and Reference Systems Service) publiceert ze; { -brand } leest het bestand <c1/> ervan via <c2/>.

seg-7f1e7e523e5b = Normen, formaten en organisaties

seg-5d8d6144c13a = De afkortingen die de README en de pakketpagina's gebruiken voor normen, bestandsformaten, tijdschalen, referentiestelsels en de organisaties erachter. Elke afkorting wordt ook uitgeschreven bij het eerste gebruik op die pagina's.

seg-800d42de0777 = Banen, referentiestelsels en tijd

seg-320a1594dcf1 = <b>SGP4 / SDP4: Simplified General Perturbations { "4" } / Simplified Deep-space Perturbations { "4" }.</b> De standaard analytische propagators voor gepubliceerde satellietbanen.

seg-87a098568846 = <b>TLE: two-line element set (tweeregelige elementenset).</b> Het openbare baanformaat dat SGP4 leest.

seg-ad15cf5aa9a5 = <b>LEO / MEO / GTO / IGSO: lage baan om de aarde / middelhoge baan om de aarde / geostationaire transferbaan / hellende geosynchrone baan.</b> Baanregimes; de meeste GNSS-satellieten vliegen in een MEO.

seg-1ec323dbd7a6 = LMO: lage baan om Mars.

seg-d0be640282af = <b>ECI / ECEF: Earth-centred inertial / Earth-centred, Earth-fixed (geocentrisch inertiaal / geocentrisch aardvast).</b> Een stelsel dat niet met de aarde meedraait, en een stelsel dat dat wel doet.

seg-09a937adc1db = <b>TEME: true equator, mean equinox.</b> Het stelsel waarin SGP4 zijn uitvoer geeft.

seg-eb2a80922118 = <b>GCRS / ITRS / ITRF: Geocentric Celestial Reference System / International Terrestrial Reference System / de realisatie ervan, het International Terrestrial Reference Frame.</b> De moderne inertiale en aardvaste stelsels.

seg-56b24c3734be = <b>CIO: Celestial Intermediate Origin.</b> Het referentiepunt van de moderne aardrotatieketen zonder equinox.

seg-a23b05c85a63 = <b>LVLH: local vertical, local horizontal.</b> Een stelsel dat met het ruimtevaartuig meebeweegt.

seg-ac37217cda0d = <b>WGS-84: World Geodetic System { "1984" }.</b> De aardellipsoïde die GPS gebruikt.

seg-81bc73d1fde8 = UTC / TAI / TT / UT1 / TDB: gecoördineerde wereldtijd / internationale atoomtijd / terrestrische tijd / Universal Time { "1" } (aardrotatietijd) / barycentrische dynamische tijd.

seg-ea7eb1f34cae = <b>LTC / TCL: Lunar Coordinate Time (Temps-Coordonnée Lunaire).</b> De voorgestelde tijdschaal voor de maan.

seg-c6e5976d9dff = <b>OD: baanbepaling.</b> Het herleiden van een baan uit volgmetingen.

seg-dcb9e011c868 = <b>CR3BP</b>, <b>NRHO</b> en <b>DRO</b> worden hierboven gedefinieerd onder "Banen en cislunair".

seg-2e6ba9069396 = Bestandsformaten en berichten

seg-ed5ea0a21e3f = <b>SP3: Standard Product { "3" }.</b> Het bestandsformaat voor nauwkeurige banen van de International GNSS Service (IGS), in de versies c en d.

seg-1bfa0d083935 = <b>RINEX: Receiver Independent Exchange Format.</b> Het standaardbestandsformaat voor GNSS-waarnemingen en uitgezonden efemeriden.

seg-39ce08a9ae66 = IONEX: IONosphere map EXchange format.

seg-c23ea3515008 = <b>OEM / OMM / TDM: Orbit Ephemeris Message / Orbit Mean-elements Message / Tracking Data Message.</b> Standaardberichten voor banen en volggegevens van het Consultative Committee for Space Data Systems (CCSDS).

seg-b267b32f3087 = <b>TOML: Tom's Obvious, Minimal Language.</b> Het platte-tekstformaat van { -brand }-scenario's.

seg-2795dff8d607 = <b>KIF: Kshana Interchange Format.</b> Het van versies voorziene, zelfbeschrijvende resultaatomhulsel van { -brand }.

seg-cd048e90fa3f = <b>DO-229E / DO-316.</b> Minimale operationele prestatienormen van RTCA voor SBAS-ontvangers en voor GPS-boordapparatuur met augmentatie aan boord van het luchtvaartuig.

seg-68604f314fa1 = <b>IS-GPS-200 / IS-GPS-705.</b> De GPS-interfacespecificaties (de tweede behandelt het L5-signaal).

seg-2230000aa30b = <b>NIST SP { "1065" }.</b> Het <em>Handbook of Frequency Stability Analysis</em> van het National Institute of Standards and Technology.

seg-8b89719c1859 = <b>TRL: technology readiness level.</b> Een schaal van 1 tot 9 voor de rijpheid van hardware.

seg-16c972f4ea0a = Organisaties

seg-9b4692fbc8a1 = <b>ESA / ESOC / ESTRACK</b>: de Europese ruimtevaartorganisatie, haar European Space Operations Centre en haar European Space Tracking network.

seg-7a1746489724 = <b>NASA / JPL / NAIF / DSN</b>: de Amerikaanse National Aeronautics and Space Administration, haar Jet Propulsion Laboratory, haar Navigation and Ancillary Information Facility (die de toolkit SPICE publiceert: Spacecraft, Planet, Instrument, C-matrix, Events) en haar Deep Space Network.

seg-eaa5a2a51169 = <b>IGS</b>: de International GNSS Service. <b>IERS</b>: de International Earth Rotation and Reference Systems Service. <b>IAU</b>: de International Astronomical Union (wier SOFA-bibliotheek, Standards of Fundamental Astronomy, en de open port ERFA, Essential Routines for Fundamental Astronomy, de referenties van { -brand } voor stelsels zijn).

seg-81af4c0f4c48 = <b>CCSDS</b>: het Consultative Committee for Space Data Systems. <b>AIAA</b>: het American Institute of Aeronautics and Astronautics. <b>RTCA</b>: voorheen de Radio Technical Commission for Aeronautics.

seg-aa0b395df17f = Software en toeleveringsketen

seg-b42188d3a6f4 = CLI: opdrachtregelinterface.

seg-198c591514ab = <b>MCP: Model Context Protocol</b>, het protocol dat de agentserver van { -brand } spreekt. <b>IDE: geïntegreerde ontwikkelomgeving.</b>

seg-287bf61a1a16 = SBOM: software bill of materials (softwarestuklijst).

seg-80d9d4404221 = <b>SLSA: Supply-chain Levels for Software Artifacts</b>, het raamwerk voor bouwherkomst waaronder de releases van { -brand } worden geattesteerd.

seg-7487c6f9ed18 = Elke andere afkorting, van A tot Z

seg-56f6039bb38a = Elke afkorting die in de documentatie van de repository (<c1/> en de vier README's) wordt gebruikt en die geen enkele sectie hierboven definieert, plus enkele die er wel een definieert, herhaald om op te zoeken. Elke pagina schrijft haar afkortingen ook uit bij het eerste gebruik; deze tabel is de ene plek om ze allemaal op te zoeken. Enkele items zijn identificatiecodes of namen in plaats van afkortingen en zeggen dat ook.

seg-c0dfa446e523 = Staat voor

seg-f272d28225ae = Waar het voorkomt

seg-ffb0596f134b = Third Generation Partnership Project

seg-77c1b4478387 = de instantie die de 5G-normen schrijft, inclusief niet-terrestrische netwerken

seg-eaf19768b977 = mobiel netwerk van de vijfde generatie

seg-692ddc163c55 = inclusief de positiebepaling via niet-terrestrische netwerken (NTN)

seg-9524be916f07 = ABI

seg-0e8332db764b = application binary interface

seg-762ea76708dc = Python-wheeltags

seg-d419d06ed622 = ABMF

seg-b294c714487d = het IGS-station in Le Moule, Guadeloupe

seg-586a8ea87638 = een stationsidentificatiecode van vier tekens

seg-4cc9a09495e6 = AC

seg-620e2dc5e4ca = wisselstroom

seg-9cfb5dc4b4bc = zoals in het AC-Stark-effect (lichtverschuiving)

seg-90308009c536 = ADD

seg-49d97c65662d = Algorithm Description Document

seg-493b5ceaa0fb = het WG-C-referentiealgoritme voor ARAIM aan boord van luchtvaartuigen

seg-3fe5d7f41dcd = ADEV / OADEV

seg-089ac7d5ac94 = Allan-deviatie / overlappende Allan-deviatie

seg-23c38ecbc543 = zie Allan-deviatie hierboven

seg-25b9fee76c9e = ADIS16460 / ADIS16465 / ADIS16488, STIM300, 3DM-GX3 (GX3)

seg-4b642742f2d4 = typenummers van inertiële sensoren (Analog Devices; Safran Sensonor; MicroStrain)

seg-c4c0a93477a8 = identificatiecodes, geen afkortingen

seg-36743c7fe98e = AEM

seg-142ca108a070 = Attitude Ephemeris Message

seg-c34185a83d8e = een CCSDS-bericht

seg-dd89e1deb663 = AESS

seg-898b29aaef84 = Aerospace and Electronic Systems Society

seg-78692bf5addf = van de IEEE

seg-f429be16014e = AF

seg-afa04bc28b42 = middelingsfactor

seg-b3db60632b92 = het gehele veelvoud van het steekproefinterval in een schatter van het Allan-type

seg-6097c4709542 = AFS

seg-7043ab3fe32b = Augmented Forward Signal

seg-20380d29d286 = het LunaNet-navigatiesignaal voor de maan

seg-b33d60fa5832 = AGC

seg-98c9c2809bd6 = automatische versterkingsregeling

seg-750b8717220b = een jamming-indicator in de front-end van een ontvanger

seg-31b864b910d5 = AHP

seg-f956cbe86552 = Analytic Hierarchy Process

seg-c2b63847e2dc = een weegmethode met meerdere criteria (Saaty)

seg-0e00edd7e222 = AI / ML

seg-6d804a116a08 = kunstmatige intelligentie / machinaal leren

seg-079020f86d22 = AL / HAL / VAL

seg-1981b764715b = alarmgrens / horizontale alarmgrens / verticale alarmgrens

seg-1e52f04eb047 = de fout die een integriteitsmonitor moet begrenzen

seg-c7ce4d3299b8 = AltBOC

seg-f630bcd1d523 = alternative binary offset carrier

seg-e3acb231cf4d = de Galileo-E5-modulatie

seg-79b130764f97 = (ongelijkheid van het) rekenkundig en harmonisch gemiddelde

seg-190b782b70ce = AOCS

seg-6459d9bce282 = standregel- en baanregelsysteem

seg-14ec3e19c990 = AOS / TCA / LOS

seg-7cdb4a7e6df4 = acquisitie van signaal / tijdstip van dichtste nadering / verlies van signaal

seg-8b73e2c51498 = de gebeurtenissen van een passage boven een grondstation (LOS betekent ook zichtlijn; de context geeft aan welke betekenis geldt)

seg-27ceb7163571 = API

seg-7903f5ff4027 = application programming interface

seg-d6bea5dea0dc = APID

seg-d468b4555dbf = application process identifier

seg-55730824c8cf = het kopveld van het CCSDS Space Packet

seg-611cd7a0d378 = APS

seg-55842a648c47 = American Physical Society

seg-07dcfba8a3c9 = APV

seg-1a7fbb0deef2 = approach with vertical guidance

seg-69a6cc8a532a = APV-I: horizontale alarmgrens van { "40" } m, verticale van { "50" } m

seg-f357a0a03c60 = ARL

seg-b4ce3803afa6 = gemiddelde looplengte

seg-08a5d53f813c = de gemiddelde tijd die een veranderingsdetector nodig heeft om alarm te slaan

seg-519e65f68c85 = ARM / ARM64

seg-1db3bdee5f76 = de Arm-processorarchitectuur / de 64-bitsvorm ervan

seg-33f6dff869b2 = ASD

seg-dd98c69872e0 = amplitudespectrale dichtheid

seg-9fb629e35a25 = de wortel van een vermogensspectrale dichtheid

seg-a020de5e94e5 = AU

seg-2342680bc7a6 = astronomische eenheid

seg-894bf4353ce3 = { "149 597 870.7" } km

seg-611aec9d1dce = AUC / ROC

seg-a11aa1d8f433 = oppervlakte onder de curve / receiver operating characteristic

seg-4d65dbf47a5c = beoordeling van detectoren

seg-25dc893d746a = AWS

seg-20979dc817ba = Amazon Web Services

seg-569160c6e52d = host een open mirror van de SRTM-hoogtetegels

seg-298c6a00085d = BEL

seg-c7ce8fa2c544 = building entry loss (verlies bij binnendringen in gebouwen)

seg-b714453f9b2c = ITU-R P.2109

seg-b9aec1857aa9 = BI

seg-40ea7b7e321e = biasinstabiliteit

seg-ff2ba8692cbc = het vlakke minimum van de Allan-deviatie van een inertiële sensor

seg-e7c1cfecd45e = BIPM

seg-dc138478d882 = Bureau International des Poids et Mesures (Internationaal Bureau voor Maten en Gewichten)

seg-6ec98084ac58 = publiceert Circular T

seg-4ff08facda60 = BKG

seg-d29da95f483c = Bundesamt für Kartographie und Geodäsie (Duits federaal agentschap voor cartografie en geodesie)

seg-ac4765a77015 = beheert een IGS-gegevensmirror

seg-a85954d9176e = BSD

seg-eb42c5807e5a = Berkeley Software Distribution

seg-a332a259125a = zoals in de BSD-licenties

seg-97764c651815 = BSP

seg-8f85848ee08a = binaire SPK

seg-6e01dca47581 = een binair SPICE-efemeridekernelbestand

seg-0157bbd7a064 = BSTAR

seg-23772d56a24c = de weerstandsterm van een tweeregelige elementenset

seg-628e6c686508 = CAI

seg-a2418a88886c = koudeatoominterferometer

seg-273a3b8d5385 = zie QUANTUM.md

seg-c34db5304197 = Cold Atom Rubidium Interferometer in Orbit for Quantum Accelerometry – Pathfinder Mission Preparation

seg-fa257dda6d45 = CC / CC BY

seg-97b3d1136762 = Creative Commons / Creative Commons Attribution

seg-a1f55ee72524 = een licentie voor gegevens of tekst

seg-1b8df20680a0 = CDDIS

seg-0a158229f571 = Crustal Dynamics Data Information System

seg-5b3f50bed1f6 = het archief voor ruimtegeodesie van NASA

seg-ee2ac06a3023 = CDF

seg-0a54599e470d = cumulatieve verdelingsfunctie

seg-6100157bdc02 = CFAR

seg-43ef1f6cd71d = constante valsalarmfrequentie

seg-b38b56b63da6 = een drempelregel voor een acquisitiedetector

seg-46835ce9641a = China Geodetic Coordinate System { "2000" }

seg-4dab086e5c3d = het BeiDou-datum

seg-8f7751d39781 = CIP

seg-e34a194da574 = Celestial Intermediate Pole

seg-c9b37d94f70b = CIRS

seg-29e69d7f32aa = Celestial Intermediate Reference System

seg-a543c4d02ace = CISA

seg-c34a7f26944d = Cybersecurity and Infrastructure Security Agency

seg-59c481cb5741 = van het Amerikaanse DHS

seg-4f7ba1fd1f4c = CM / CL

seg-4fb8507eb747 = civiel gemiddeld / civiel lang

seg-cc0c8f1524f8 = de twee in tijd gemultiplexte GPS-L2C-codes

seg-2ea49f6a1ae9 = CMPL

seg-68b147628ea1 = common-mode protection level

seg-d469cd44d9d4 = de grens aan fouten die een residutest niet kan zien

seg-4e25d07b13c9 = CN

seg-e775ec496f2b = converged Newtonian

seg-5d679a981a34 = de SPICE-aberratiecorrectie voor lichttijd

seg-3da9a2841b6c = C/N0 (C/N₀)

seg-cf60da0631b4 = in dB-Hz

seg-f4488db8194d = COPRAS

seg-6379891c1750 = COmplex PRoportional ASsessment

seg-b99fe66bd09c = een rangschikkingsmethode met meerdere criteria

seg-a562dbafa35f = COSPAR

seg-c09ea7bc49b0 = Committee on Space Research

seg-235850ad0d1f = geeft internationale satellietaanduidingen uit

seg-dbc3e7c90fe0 = CPR

seg-1fd5b461cc3d = cyclus per omwenteling

seg-a1d4080ce019 = een empirische baanversnelling met de baanfrequentie

seg-96cd47b07b44 = CPU / GPU / NPU

seg-10ad2f10bec0 = centrale / grafische / neurale verwerkingseenheid

seg-93621c1a1e37 = CRB / CRLB

seg-70b6a0b19705 = Cramér-Rao-grens / Cramér-Rao-ondergrens

seg-6eb684e34f56 = de kleinste variantie die een zuivere schatter kan bereiken

seg-93c4fe0f2990 = CRD

seg-6efd9a1fdbcc = Consolidated laser Ranging Data format

seg-eb95135f849c = ILRS-normaalpuntbestanden

seg-f23ff835b9b0 = CRPA

seg-b5c26297e11b = controlled-reception-pattern antenna

seg-7111b9c4d382 = een antenne-array tegen jamming

seg-404133a74afc = CR / RI

seg-d35896b2bb24 = consistentieratio / willekeurigheidsindex

seg-cfa91dc02138 = de consistentiecontrole van AHP (accepteer CR < { "0.10" })

seg-8572a3faf46a = CS GROUP

seg-5e00428ed929 = het Franse bedrijf dat Orekit onderhoudt

seg-58d5f143ff3b = een bedrijfsnaam, geen afkorting om uit te schrijven

seg-be388831a3e1 = CSK

seg-9cf6cad11f64 = code shift keying

seg-a3bd162146d6 = CSS

seg-75ddcc97f9e2 = Cascading Style Sheets

seg-0d5c127b2ee5 = CUSUM

seg-d40da5f47035 = cumulatieve som

seg-66f752e15abc = een sequentiële veranderingsdetector

seg-92ac0357d01e = CV

seg-28f75c073917 = (common view bij tijdoverdracht; de context geeft aan welke betekenis geldt)

seg-507b8c235614 = CZML

seg-0b76641dee1a = Cesium Language

seg-fd0a7af2ebeb = het JSON-scèneformaat van CesiumJS

seg-1aefbc0b799d = dB / dBW / dB-Hz

seg-8a0d954bd13b = decibel / decibel-watt / decibel-hertz

seg-c485de5bcd85 = vermogensverhouding, absoluut vermogen en een eenheid voor C/N0

seg-6c0cbce59df5 = DC

seg-ddd7d412fce7 = gelijkstroom

seg-0ea7fccee332 = de limiet bij frequentie nul

seg-521e2abbe12d = DCM

seg-3db4487dc2a4 = richtingscosinusmatrix

seg-9d3d9ca79a9d = een rotatiematrix

seg-364a2fcec10b = DCO

seg-110b1eb4f532 = Developer Certificate of Origin

seg-1545bd59f5ef = DCT

seg-8b6866288bea = design control table

seg-80d95f099e9a = een linkbudgettabel (het Galileo-X-bandvoorbeeld uit JPL DESCANSO)

seg-7f9734bd79bc = DE / DE421 / DE430 / DE440 / DE441

seg-ed8d5c361e79 = JPL Development Ephemeris (versies { "421" }, { "430" }, { "440" }, { "441" })

seg-748af19e3f0b = planeet- en maanefemeriden; "DE-grade" betekent nauwkeurigheid van die klasse

seg-6f880928ce0c = DEM

seg-eed6ad669d4c = digitaal hoogtemodel

seg-920f5ff86fa2 = DESCANSO

seg-6d1f2ffa8184 = Deep Space Communications and Navigation Systems Center of Excellence

seg-2e11a1976171 = JPL-monografieënreeks

seg-10dc0c578b92 = Deutsches Geodätisches Forschungsinstitut der Technischen Universität München (Duits geodetisch onderzoeksinstituut aan de Technische Universiteit van München)

seg-e7cedd55549e = host het EUROLAS Data Center

seg-4389ecd5c81a = DGNSS

seg-fb8c5992354b = differentiële GNSS

seg-3fed847ae9ec = DHS

seg-2845322fad33 = Department of Homeland Security

seg-6b487421c547 = VS

seg-9e06c8655623 = DoD

seg-7a7ea4a3f0d5 = Department of Defense

seg-1f6c4757bee5 = DOF / DoF

seg-e1daefad0696 = vrijheidsgraad

seg-bf5bc69cb873 = zie 1-DOF hierboven

seg-3b5c7c9b324d = DOR / Δ-DOR

seg-3e0b6392f4d9 = differential one-way ranging / delta differential one-way ranging

seg-6ba2d3b5b724 = hoekvolging in de diepe ruimte

seg-58c55b8ab7fe = DP5 / RK4 / RK5 / DOP853

seg-ea9b38a5d810 = Dormand–Prince { "5" }({ "4" }) / Runge–Kutta { "4" } / Runge–Kutta { "5" } / Dormand–Prince { "8" }({ "5,3" })

seg-00ecc6de9912 = numerieke integratoren

seg-16c4bf2faef3 = DRMS

seg-8128cc0c1482 = distance root mean square

seg-a8ed04890ded = zie 2DRMS

seg-c9ab798458cb = DS00002980D / DS00002985D / DS00003047A

seg-371644e70b75 = documentnummers van Microchip-datasheets

seg-f25e5c4de1e5 = DSAC

seg-aa0d8d4b3a3b = Deep Space Atomic Clock

seg-e80350ed521f = de kwikion-klok van NASA met opgesloten ionen

seg-52e838301c0b = UT1 min UTC

seg-fbce3b3b7b80 = de correctie voor de aardrotatie

seg-8aa996f34920 = energie per bit ten opzichte van de ruisdichtheid

seg-463b21c0b791 = het inertiale stelsel dat aan het begin van een run is uitgelijnd met het aardvaste stelsel

seg-4dc987bd9dbf = gebruikt door de interop-exports van leo-pass

seg-61f975df5e21 = ECMAScript / ES

seg-c66e728cd2fa = de standaard achter JavaScript / een ES-module

seg-e1a4fd0a6a76 = Empirical CODE Orbit Model { "2" }

seg-2967e958f353 = een GNSS-model voor zonnedruk (CODE: Center for Orbit Determination in Europe)

seg-244af4062ccc = ECSS

seg-b74029376aba = European Cooperation for Space Standardization

seg-d452e23d503a = ECSS-E-ST-10-02 is de verificatienorm ervan

seg-becb6685ff13 = ED

seg-b6448e14a567 = EUROCAE-document

seg-ee4ada9c4c6e = zoals in ED-259A

seg-8a57ce8403b1 = EDL

seg-0f065f2290f3 = binnenkomst, afdaling en landing

seg-69f37001de44 = EEE

seg-18a1b66286ee = elektrische, elektronische en elektromechanische (onderdelen)

seg-f814c1301059 = productborging voor de ruimtevaart

seg-08e455b17435 = EGM / EGM2008

seg-1ed72a253035 = Earth Gravitational Model (de uitgave van { "2008" })

seg-074e3ceb394e = NGA

seg-69ba7307ea4c = EIGEN

seg-4272020c0ebd = European Improved Gravity model of the Earth by New techniques

seg-a49ce7809382 = ELECTRE

seg-647519f3df17 = ELimination Et Choix Traduisant la REalité (eliminatie en keuze die de werkelijkheid uitdrukken)

seg-efb2f919955a = een multicriteriamethode op basis van overklassering

seg-88a2f1813af8 = Éphéméride Lunaire Parisienne, de MPP02-versie (Chapront)

seg-b1d699d70339 = een analytische maantheorie

seg-aee5eeb23064 = gemiddelde aardequator en equinox van J2000

seg-16d9b8eac95d = een inertiaal stelsel

seg-e676d5eec6e3 = EML

seg-f4bba0abbda7 = een codediscriminator

seg-0e4110d33849 = EMT

seg-103c6de62575 = effective monitor threshold

seg-4b2101113387 = een uitvoer van ARAIM

seg-0e2817aec74a = ENU / NED

seg-56d5cf1544d9 = oost-noord-omhoog / noord-oost-omlaag

seg-aae7610833a7 = lokale horizontale stelsels

seg-c7d5c5d5c5b2 = EO

seg-24907930c730 = aardobservatie

seg-38f9c209c4ac = EPM / EPM2021

seg-d15e1559b7f7 = Ephemerides of Planets and the Moon (de uitgave van { "2021" })

seg-bd2a27a17f6d = efemeride van IAA RAS

seg-01a8e43fb6c7 = ERA

seg-eb78ffaf7e1d = aardrotatiehoek

seg-966ed500f705 = ESKF

seg-e79112a3132a = Kalman-filter op foutentoestand

seg-25c6b6b19d75 = ESS

seg-fe2b7be913f0 = effectieve steekproefgrootte

seg-57ce1c1b617b = van een deeltjesfilter

seg-f529300f944b = ESSR

seg-869be8388d26 = European Space Software Repository

seg-536d66d208e4 = ESA

seg-27be9c1d7090 = ET

seg-7cc2ef5b0748 = efemeridetijd

seg-e0c49639649e = de naam van SPICE voor TDB

seg-80de6914a5ec = EUROCAE

seg-76897dd8c3be = European Organisation for Civil Aviation Equipment

seg-b4f12b7813dd = EUROLAS

seg-857527c69d6e = European Laser Network

seg-fa7025d88c88 = satelliet- en maanlaserafstandsmeting

seg-13fc009b947c = FAQ

seg-f5581b33ae89 = veelgestelde vragen

seg-67d10fd4a4e0 = FCC

seg-0a558c281968 = Federal Communications Commission

seg-f6ade8c24d27 = FCNN

seg-6098513947b8 = volledig verbonden neuraal netwerk

seg-1de7b4410369 = FD

seg-4e73ff36d37f = eindig verschil

seg-e43312a5fbbe = FDE

seg-d6c9fb239b59 = foutdetectie en foutuitsluiting

seg-8f9d11564223 = FES / FES2004

seg-1a1cf1501056 = Finite Element Solution (de uitgave van { "2004" })

seg-878b4a645ae9 = een oceaangetijdenmodel

seg-55c14f474a10 = FIM

seg-b68c86e68570 = Fisher-informatiematrix

seg-d39671724dfc = Fowler–Noll–Vo-hash, variant 1a

seg-3354ad42f7dd = gebruikt om golden outputs vast te zetten

seg-efca4decfec0 = FOC / IOV

seg-793d96ab9856 = volledige operationele capaciteit / validatie in een baan om de aarde

seg-ce13cca7f222 = satellietgeneraties (Galileo, Xona Pulsar)

seg-58df7305e218 = FOV / IFOV

seg-cafe1f8733ec = gezichtsveld / ogenblikkelijk gezichtsveld

seg-4f7168e895d2 = FPGA / MCU / RTOS

seg-abde801ec70b = field-programmable gate array / microcontrollereenheid / realtimebesturingssysteem

seg-a082e4570309 = FSL / FSPL

seg-3a8ee2932a46 = vrije-ruimteverlies / padverlies in de vrije ruimte

seg-4535dadf79df = ITU-R P.525

seg-c0209066dc76 = GB / KB / MB

seg-184bb3d8b345 = gigabyte / kilobyte / megabyte

seg-8094e61fdd76 = GCRF

seg-6c6337c7a855 = Geocentric Celestial Reference Frame

seg-f050f2b8dee1 = GDAL

seg-98b12fcceb01 = Geospatial Data Abstraction Library

seg-1cef8718c772 = GEO

seg-6131e4ea7858 = geostationaire baan

seg-bf09433a7342 = GeoJSON

seg-f8654e88af67 = Geographic JavaScript Object Notation

seg-70dc52cd5059 = IETF RFC { "7946" }

seg-bb8fbd2ebc28 = GG

seg-b93ed4ab2b79 = zwaartekrachtgradiënt

seg-d8ef4d361e86 = zoals in het zwaartekrachtgradiëntkoppel

seg-12fd4eb15c4d = GHz / kHz

seg-0769cc8be024 = gigahertz / kilohertz

seg-3946b69535e4 = GIM

seg-ef5fc608b0e5 = wereldwijde ionosfeerkaart

seg-8cbbff1bc1d1 = GINS / KF-GINS

seg-fbe37a571772 = GNSS/INS-integratie / de dataset en code van de Wuhan University voor het Kalman-filter van GNSS/INS

seg-deca3cbe41ac = GIS

seg-36275ece527d = geografisch informatiesysteem

seg-ebe8194d12b3 = GIVE

seg-6a99c12984b5 = grid ionospheric vertical error

seg-20a40777d78a = een term uit SBAS-berichten

seg-6fbfc5108833 = gLAB

seg-1be22ebbedc3 = GNSS-Lab Tool

seg-93b2c5b68af0 = een door ESA verspreide softwaresuite voor GNSS-gegevensverwerking

seg-2aa0f3147ad5 = GLIBC

seg-096e00cb9d9b = de GNU C-bibliotheek

seg-2630ae5f0bc5 = het Russische Global Navigation Satellite System (Globalnaya Navigatsionnaya Sputnikovaya Sistema)

seg-361f1f18d454 = GLS

seg-397d58b727ee = gegeneraliseerde kleinste kwadraten

seg-9bb2492e5d5d = GM

seg-6bd8e46e9131 = gravitatieparameter

seg-e3a296392ac0 = de gravitatieconstante maal de massa van een lichaam

seg-45a8f50bce06 = General Mission Analysis Tool

seg-60d33e61b446 = NASA

seg-1edd65c52f46 = Goddard Mars Model { "3" }

seg-45abee95253b = een zwaartekrachtveld van Mars

seg-558ea1e07042 = GMST

seg-d3c4914f0d13 = Greenwichse gemiddelde sterrentijd

seg-d853b1084a52 = GNC

seg-34a9ddce3d5f = geleiding, navigatie en besturing

seg-d33e343f6635 = GPOD

seg-2ef6bb5a52fc = Grid Processing On Demand

seg-14782f821cde = GR

seg-762f364a05f3 = algemene relativiteitstheorie

seg-3e3f45ad1178 = GRGM / GRGM660PRIM

seg-948167f5f1c3 = de GRAIL-zwaartekrachtmodellen van de maan van NASA Goddard (GRAIL: Gravity Recovery and Interior Laboratory)

seg-220fae5cfc61 = Geodetic Reference System { "1980" }

seg-bb3c2a337ae8 = GSD

seg-691791646eb3 = grondmonsterafstand

seg-448d7036fefe = GSE

seg-d05b88e7d5c5 = grondondersteuningsapparatuur

seg-95d29f8138f9 = GSFC

seg-2e1460089fed = Goddard Space Flight Center

seg-7680e0663a5b = HDEV / OHDEV

seg-1fd1e3322c86 = Hadamard-deviatie / overlappende Hadamard-deviatie

seg-bb846135ceb4 = een driftongevoelige stabiliteitsmaat

seg-0edc4eed2775 = HIL

seg-956a26e1ff6d = hardware in de lus

seg-48523cdbbbf5 = HMI / MI

seg-d77e079194df = hazardously misleading information / misleading information

seg-1cbf9d6f135d = gebieden van het Stanford-diagram

seg-b320746fafa5 = HP

seg-465a952272f3 = HTML

seg-45a46390d3ba = HyperText Markup Language

seg-25206f1161f0 = IAA RAS

seg-1a4f063e3583 = Institute of Applied Astronomy of the Russian Academy of Sciences

seg-9f434fdc21f2 = IAG

seg-08fb84d2e01a = International Association of Geodesy

seg-e4d6251ec64d = IAGA / V-MOD (VMOD)

seg-01880debd7e0 = International Association of Geomagnetism and Aeronomy / haar werkgroep V-MOD (modellering van het aardmagnetisch veld)

seg-28805f15bae8 = onderhoudt de IGRF

seg-d4ce72152bf2 = IC

seg-fa95c4e7fdc2 = beginvoorwaarde

seg-e4c4373d0c76 = ICAO

seg-2fccffbaf4dc = International Civil Aviation Organization

seg-c2d2d459177d = ICD

seg-a018300615e2 = interface control document

seg-433b45040abd = zoals in de Galileo OS SIS ICD

seg-5e1e49c5000e = ICGEM

seg-c17be0db9e83 = International Centre for Global Earth Models

seg-e9650a618b38 = ID

seg-e40875ab1090 = identificatiecode (of identificatie, zoals in ID van het ruistype)

seg-c643488ba1ea = IEEE

seg-e4b50d4d890f = Institute of Electrical and Electronics Engineers

seg-91966e2931d4 = IETF / RFC

seg-0804111ad44d = Internet Engineering Task Force / Request for Comments

seg-ce9375732735 = IF

seg-746eae5ce367 = tussenfrequentie

seg-ed568f55aa8f = samples van de ontvanger

seg-cb4aaa2581bb = de IGS-realisatie van ITRF2014

seg-bfa8e6d5d0d1 = IGRF / IGRF14

seg-55fed0afea05 = International Geomagnetic Reference Field

seg-669611e731d0 = IGRF-14 (bestand IGRF14.shc) is de 14e generatie

seg-f7cf8ff44256 = IGSO

seg-4833bd1e9c03 = hellende geosynchrone baan

seg-2080ff6f98fd = IIF

seg-cf7a31e569cd = GPS Block II Follow-on

seg-8a19be8033a9 = een GPS-satellietgeneratie

seg-68cc1c937ce9 = ILRS

seg-53cc8d1f6824 = International Laser Ranging Service

seg-fb5255ba4bc1 = ILS

seg-b8af4d02e031 = geheeltallige kleinste kwadraten

seg-a214c483b8a8 = oplossing van ambiguïteiten

seg-4740fb9ef0b9 = IMCCE

seg-e77c8324583a = Institut de mécanique céleste et de calcul des éphémérides

seg-22048a770612 = Observatoire de Paris; publiceert INPOP

seg-9717f14527d3 = Intégration Numérique Planétaire de l'Observatoire de Paris, versie 21a

seg-577acd29f11b = een planeetefemeride

seg-cdb9ea77f5a6 = IOAG

seg-87f308314cd4 = Interagency Operations Advisory Group

seg-690414990ad8 = ION / ITM

seg-b2fbe0c3507a = Institute of Navigation / haar International Technical Meeting

seg-53abad80634c = IoT

seg-9b766d557bd1 = Internet of Things

seg-1b41d114662e = IR

seg-ff2d89b32d07 = integriteitsrisico

seg-2dc9fcadccd6 = de kans op hazardously misleading information

seg-02aeac5e2435 = IRE

seg-9c9c0011de8c = Institute of Radio Engineers

seg-3fbae7e11fca = een voorloper van de IEEE

seg-9e3d84279d56 = het klokverschil tussen twee GNSS

seg-2ffee4396fbd = ISL

seg-505dee046f7a = inter-satellietverbinding

seg-010ea5a76e2e = ISM

seg-330b25f923db = integriteitsondersteuningsbericht

seg-1f5a14efd417 = ARAIM

seg-0ee7fcdaf5a9 = ISO

seg-8c1341375f17 = International Organization for Standardization

seg-8291ac1ccba6 = ISO { "8601" } is het datum-tijdformaat ervan

seg-5b4dee02dccc = ITRF93 / ITRF2020

seg-93458bf3ba01 = International Terrestrial Reference Frame { "1993" } / { "2020" }

seg-14dc2a58e2c3 = International Telecommunication Union Radiocommunication Sector

seg-0e8094e4d45c = de aanbevelingen van de P-serie modelleren de voortplanting

seg-3e325d97365e = IVS

seg-6f8a6ec848a6 = International VLBI Service for Geodesy and Astrometry

seg-2dd00d470e14 = JD / MJD

seg-107e6683f70d = juliaanse datum / gemodificeerde juliaanse datum

seg-996d4952554f = JMLR

seg-a1ef35b98931 = Journal of Machine Learning Research

seg-d370f89393c7 = JOSA

seg-12c154fcd073 = Journal of the Optical Society of America

seg-58fb16c8a046 = JRC / JRC122785

seg-82f85268028f = Joint Research Centre van de Europese Commissie / een van de rapportnummers ervan

seg-23f5be8ff49e = JS

seg-516ee91e60c5 = JavaScript

seg-02d421e784cd = JavaScript Object Notation

seg-4da0210abab0 = JSTSP

seg-9d88dcfe6818 = IEEE Journal of Selected Topics in Signal Processing

seg-919a951f3d02 = KF

seg-436a208697f1 = Kalman-filter

seg-9c92e0bc42aa = KML

seg-caf09d501881 = Keyhole Markup Language

seg-ffe25881cef6 = een OGC-standaard die Google Earth leest

seg-6e9501f1d4ff = KP16 / KRAC / LU22 / APOL

seg-e1552da90a21 = labels voor recordtypen van het eigen tekstformaat van { -brand } voor LEO-navigatieberichten

seg-3269a4e6b3e3 = een extensie van { -brand }, geen standaard

seg-b7f0168b6037 = KPI

seg-a5ff89f0923d = key performance indicator

seg-1c4a7ccef434 = KSC

seg-73a4bf4da46f = Kennedy Space Center

seg-e401e5d923f0 = KVN

seg-09f93b4d4d0b = Keyword = Value Notation

seg-7379ade4ee0e = de tekstvorm van CCSDS-berichten

seg-a24cf86216d0 = LANS

seg-2ee81a2bc69b = Lunar Augmented Navigation Service

seg-849e3161b64b = LAPACK

seg-3b4f3c08a5ba = Linear Algebra PACKage

seg-69cd99d2f937 = LCG

seg-bcddea3df96d = lineaire congruentiegenerator

seg-8927ca404e64 = de generator van de testreeks van NIST SP { "1065" }

seg-0b9b908055cf = LCNS

seg-f9200a1b7246 = Lunar Communications and Navigation Services

seg-5253cae4b05b = de Moonlight-dienst van ESA

seg-2361aef1e2e3 = LCRNS

seg-470ea343b5ac = Lunar Communications Relay and Navigation Systems

seg-8fc87d3026e5 = LFSR

seg-bfecf2f88f17 = schuifregister met lineaire terugkoppeling

seg-5b09c8e3f127 = het genereren van spreidingscodes

seg-944b45f65820 = LGPL

seg-1e1bf7d7dc79 = GNU Lesser General Public License

seg-0d4d5316b1d8 = LIL

seg-6d040101c6fa = wet van de herhaalde logaritme

seg-e48d4b1feeaf = LLI / SSI

seg-81ace10136b6 = indicator voor verlies van vergrendeling / indicator voor signaalsterkte

seg-7d95179a5a1f = waarnemingsvlaggen van RINEX

seg-2ac0ebb389e7 = LLR

seg-29bcbb78931b = maanlaserafstandsmeting

seg-20deda97c876 = LLVM

seg-5a84a3219546 = de LLVM-compilerinfrastructuur (oorspronkelijk Low Level Virtual Machine)

seg-277ed5c4cbcc = LNAV

seg-d2fa9c420999 = legacy-navigatiebericht

seg-7f5ad6ab8c23 = GPS

seg-6379745571a9 = LNCSS

seg-b8c48f2bfaf0 = lunar navigation and communication satellite system

seg-4ce3c0ea7a31 = de casestudies over constellaties in NAVIGATION { "70" }({ "4" }), navi.613

seg-b13c5776e35b = LNIS

seg-7c67c5753d20 = LunaNet Interoperability Specification

seg-881578d31056 = LNSS

seg-25d4f3a4d3f6 = Lunar Navigation Satellite System

seg-97ff1706b4bd = een voorgestelde constellatie rond de maan

seg-ec733de1adc5 = LPV / LPV-200

seg-40d72ae4bc9a = localiser performance with vertical guidance / de categorie met beslissingshoogte van { "200" } ft

seg-090ba62634a8 = naderingsprocedure in de luchtvaart

seg-b4921e83ddc9 = LRO

seg-2d1b9f5efdb1 = Lunar Reconnaissance Orbiter

seg-8f782bde5659 = LS

seg-c5bc49526464 = schrikkelseconden

seg-54ea05b82cb4 = zoals in Δt_LS

seg-15111a93c6d7 = LT

seg-35231d8b9b39 = lichttijd

seg-4729314afd46 = LTE

seg-1a7e158f020f = Long-Term Evolution

seg-3c1b3acc46d9 = de 4G-mobielenetwerkstandaard

seg-3530cdaca137 = LU

seg-58ad64b9d450 = lower–upper (decompositie)

seg-ef1a45eba6aa = LuGRE

seg-72ec36312101 = Lunar GNSS Receiver Experiment

seg-84874825a5d1 = vloog in { "2025" } naar de maan

seg-e6719690faa2 = LuPNT

seg-be19fb902b36 = de maan-PNT-bibliotheek van Stanford

seg-893ba320da76 = een naam

seg-fc68b2fb9529 = MAAST

seg-e98d356a165f = MATLAB Algorithm Availability Simulation Tool

seg-a24b3840d248 = Stanford

seg-71063143c8be = MAIT

seg-2d7aa60c26ba = vervaardiging, assemblage, integratie en test

seg-0397322eae11 = MAR099 / JUP365 / SAT441

seg-bd57191f860b = JPL-oplossingen voor satellietefemeriden van de manen van Mars, Jupiter en Saturnus

seg-9b0688bfc31e = identificatiecodes

seg-a8748c38de15 = MASPS

seg-e25a3738b952 = minimum aviation system performance standards

seg-16a3c8f74c1c = MATLAB

seg-bebc110fded7 = MATrix LABoratory

seg-e722ea781fdf = een product voor numeriek rekenen

seg-7c03fb6e56f6 = MAUT

seg-e409f72ac9ab = multiattribuutnutstheorie

seg-4a29ddd9b24e = MC

seg-19a7ad528cf3 = MCD

seg-202b82bfefcf = Mars Climate Database

seg-371da1e857e8 = MCDA

seg-17d89019fd4a = multicriteria-beslissingsanalyse

seg-b522fc3d6c82 = MCI / MCMF

seg-f5544acf642a = maangecentreerd inertiaal / maangecentreerd, maanvast

seg-f7b59f61da60 = MDB

seg-0c674a59d087 = minimale detecteerbare bias

seg-c769430226c3 = MDEV

seg-33a4628c6e67 = gemodificeerde Allan-deviatie

seg-bde3f0e5dfa7 = MEMS

seg-8b08f307de8a = micro-elektromechanische systemen

seg-c960c0e048b7 = MeO / MLRO

seg-48623f76be86 = MéO (Métrologie Optique), het laserstation in Grasse / Matera Laser Ranging Observatory

seg-a8fcbefbbf4c = laserafstandsmetingsstations voor de maan

seg-8b597c678c3f = ME / PA

seg-cb56efe2fb70 = gemiddelde aarde / hoofdassen

seg-f30f1a2778cf = de twee maanvaste stelsels (MOON_ME, MOON_PA)

seg-308d4c93a8a3 = MGEX

seg-b2b632cd52d2 = Multi-GNSS Experiment

seg-86fd2d84ed21 = IGS

seg-79f8412f30f2 = MIT

seg-70012b81c998 = Massachusetts Institute of Technology

seg-e9d7062835a9 = zoals in de MIT-licentie

seg-a0b70e8c4c38 = MLP

seg-77abd5634603 = meerlaagse perceptron

seg-6975432180f6 = een klein neuraal netwerk

seg-a4be7b1d83e3 = MOD / TOD

seg-421b9611e897 = mean of date / true of date

seg-1af66f9b771d = stelsels met equator en equinox

seg-b5db821f8008 = MOORA

seg-7f763036e34d = Multi-Objective Optimisation on the basis of Ratio Analysis

seg-d26a24b5d9f0 = MOPS

seg-e8707522cf5f = minimale operationele prestatienormen

seg-cd0720a78dbb = MPL

seg-bcdaf8567381 = Mozilla Public License

seg-0f45b55420be = MRO110 / MRO110B2

seg-61415a003e40 = de zwaartekrachtmodellen { "110" } en 110B2 van de Mars Reconnaissance Orbiter

seg-8404f70361e7 = MSRV

seg-26a6a79755f9 = minimaal ondersteunde Rust-versie

seg-959fe8ad53df = MTF

seg-70d61ab4eb42 = modulatieoverdrachtsfunctie

seg-7f60d1ac40ad = optische beeldvorming

seg-8598e499c145 = MVDR

seg-c767dc9ae21a = minimum-variance distortionless response

seg-83f57219e5b7 = adaptieve bundelvorming

seg-e1ee50b3ea0a = MWL

seg-12d9510328d2 = microgolfverbinding

seg-639266912f59 = de ACES-verbinding voor tijdoverdracht

seg-5ac07401e4f8 = NaN

seg-722d679807ee = geen getal

seg-0e4abc653325 = NavIC

seg-355821380384 = Navigation with Indian Constellation

seg-fc13b86a8365 = NAVISP

seg-2eb6cc573946 = Navigation Innovation and Support Programme

seg-b518d44847fa = NAV / OBS

seg-c6965d4d7202 = navigatie(bericht) / waarneming

seg-1729ddf0eafa = de twee bestandstypen van RINEX; het Stanford NAV Lab is het Navigation and Autonomous Vehicles Laboratory

seg-f239334e4928 = NBS / NBS14

seg-c8e5edff04d7 = het voormalige Amerikaanse National Bureau of Standards / de referentiedataset NBS14 voor frequentiestabiliteit

seg-3d1ac5146fea = gebruikt om Allan-schatters te controleren

seg-37879f5ad9e0 = NEES / NIS

seg-9610f0449fb2 = genormaliseerde gekwadrateerde schattingsfout / genormaliseerde gekwadrateerde innovatie

seg-af167a77a1dc = consistentietests voor filters

seg-beb7a86721ec = National Geospatial-Intelligence Agency

seg-7aa223cbfe13 = NGS / NOAA

seg-3845b0011dcb = National Geodetic Survey / National Oceanic and Atmospheric Administration

seg-4a1040c5f2fa = NIMA / TR8350

seg-4cf62b739fc6 = National Imagery and Mapping Agency / haar technisch rapport TR8350.2 (de definitie van WGS { "84" })

seg-ffa6025b5a70 = NIMA is de voormalige naam van de NGA

seg-af4be907e56c = NLOS

seg-22ab7d58324b = een uitsluitend gereflecteerd signaal

seg-9887902c13a1 = NNLS

seg-b4cb6d6bfce4 = niet-negatieve kleinste kwadraten

seg-af8ca8550600 = NORAD

seg-07428e7224cf = North American Aerospace Defense Command

seg-4edb033e3432 = beheert de openbare satellietcatalogus

seg-dd984e16dbcd = NP

seg-f92816d7c936 = Neyman–Pearson

seg-fc214695fa83 = detectietheorie

seg-3ef8006482bb = NPA

seg-81a072ee0520 = non-precision approach

seg-b9fd2cf6a2b9 = luchtvaart

seg-e6cb557ee6d1 = NPB

seg-18510a95b308 = nutatie–precessie–bias

seg-b4562efbafdf = de IAU-matrix 2006/2000A

seg-c5d8932f6956 = NRL / NRLMSISE-00

seg-9c9f5eac83b2 = Naval Research Laboratory / het atmosfeermodel Mass Spectrometer and Incoherent Scatter Radar Extended, { "2000" }

seg-bf373b9cd0c6 = NTN

seg-0ae939342934 = niet-terrestrisch netwerk

seg-1ae0305d8455 = 5G vanaf satellieten

seg-20b98c32226f = NTRS

seg-1470d2af037a = NASA Technical Reports Server

seg-243d375db224 = OC-0 … OC-13

seg-d36b43dd505c = identificatiecodes van overclaims

seg-47ba87f3730b = rijen van CLAIMS-VS-REALITY.md

seg-e0689f1fc932 = OCI

seg-1a3377171d89 = Open Container Initiative

seg-b5bf07ed6c8c = formaat voor containerimages

seg-7b56c21cca93 = ODE / SDE

seg-722bdf2ca73a = gewone / stochastische differentiaalvergelijking

seg-a4da10cb1150 = ODM

seg-b1c25bfe0612 = baangegevensberichten

seg-35fe6a2f3de3 = de CCSDS-familie waartoe OEM en OMM behoren

seg-c06d6aa8ba3a = OGC

seg-eb1feb23de1c = Open Geospatial Consortium

seg-9737495b035c = OLS / WLS

seg-63bf35c31a6a = gewone / gewogen kleinste kwadraten

seg-487fb3dcfd01 = OPS-SAT / OPSSAT-AD

seg-4be3f4155fc8 = de satelliet van ESA als softwarelaboratorium in een baan om de aarde / de dataset ervan voor anomaliedetectie

seg-14b642ea59e1 = OSIP

seg-4871060090a0 = Open Space Innovation Platform

seg-251b3ff3eb9b = OSNMA / TESLA

seg-aa0d98a5c95a = Open Service Navigation Message Authentication / Timed Efficient Stream Loss-tolerant Authentication

seg-95b6b14facf1 = authenticatie van Galileo-signalen

seg-501a89e8b32b = OS / OSes

seg-5a526cda4166 = Open Service (Galileo, BeiDou), of besturingssysteem(en)

seg-6db10af375e3 = de context geeft aan welke betekenis geldt

seg-584a7e7d4f5e = OU

seg-937187abcdf6 = Ornstein–Uhlenbeck

seg-9be9042ec983 = een naar het gemiddelde terugkerend ruisproces

seg-08c583f40405 = PA

seg-9a24d9f45aa4 = productborging (ook precision approach, zoals in K_H,PA)

seg-65ad442b3faa = PCK

seg-c788fe80678e = kernel met planetaire constanten

seg-46a00fdc9d5b = SPICE

seg-417a52c9c154 = PDF

seg-c462c83b47df = Portable Document Format

seg-98aa544ec4de = Pd / Pfa

seg-0c89f304435e = detectiekans / kans op vals alarm

seg-5bde4fd55ead = PEF

seg-eb11dcb816ff = het stelsel tussen TEME en ITRF

seg-4682fd9daa70 = PG01 / PRN120 / GSAT0101

seg-47cc346307a6 = satellietidentificatiecodes: een SP3-label voor een GPS-satelliet, een pseudoruisnummer van SBAS, een naam van een Galileo-satelliet

seg-6ad2383f8545 = PHARAO

seg-0d9ce504e8c7 = Projet d'Horloge Atomique par Refroidissement d'Atomes en Orbite

seg-302c8cb738ac = de cesiumklok van ACES

seg-2e823cd9d9a6 = PL

seg-099bd07ef3cf = beschermingsniveau

seg-7d7eaa5eb223 = PLL

seg-9272ad22c094 = fasevergrendelde lus

seg-80e051b734dd = PMC / PMC10301026

seg-1f2a21c5e09f = PubMed Central / een van de artikelidentificatiecodes ervan

seg-3e4617444a63 = PM / FM

seg-c79b1246fb61 = fasemodulatie / frequentiemodulatie

seg-279251adb2eb = ruis op de fase of op de frequentie van een klok

seg-685fc49957e2 = PN

seg-209dacf76ff3 = zoals in PN-afstandsmeting

seg-f9cfe4e70f9a = PNG

seg-bde68df8ee7e = Portable Network Graphics

seg-06998de7b6be = POD

seg-178f55858efb = nauwkeurige baanbepaling

seg-b7919977bf20 = PPN

seg-ed81960f1282 = geparametriseerd post-Newtoniaans

seg-9683f98bec2d = PPP / RTK / SPP

seg-73d777100ecd = nauwkeurige puntpositiebepaling / real-time kinematic / positiebepaling met één punt

seg-edb97cd7ef8b = PPS

seg-197b06571b4d = puls per seconde

seg-2619e854281a = PR

seg-66c53cdfc3d9 = pull request

seg-e4dd8a3101cb = PRN

seg-6fb1378e889a = pseudoruis (codenummer)

seg-6f384580af80 = hoe GNSS-satellieten in signalen worden aangeduid

seg-e8ca48eb958b = PROMETHEE

seg-e4e92d708223 = Preference Ranking Organization METHod for Enrichment of Evaluations

seg-d92234e26d53 = PRX

seg-c5774fede0a9 = Physical Review X

seg-8687e6badb6b = een tijdschrift

seg-78a947083d45 = PSD

seg-6eb799bd1582 = vermogensspectrale dichtheid

seg-ab1af8b3d968 = zie hierboven

seg-f7c4f1cff2a4 = PS / SPS

seg-e90e463df4b8 = Performance Standard / Standard Positioning Service

seg-2800b3a8cd2e = de GPS SPS PS

seg-c8aa5ca0a4ea = PTB

seg-cf2a7714694f = Physikalisch-Technische Bundesanstalt

seg-611e7e4a34f4 = het nationale metrologisch instituut van Duitsland

seg-2d4bc9f59158 = PTP

seg-6291d09d3a93 = Precision Time Protocol

seg-44a14eeae3dd = IEEE { "1588" }

seg-bc4ad791804e = PVT

seg-1939c4e19702 = positie, snelheid en tijd

seg-a9aedd1f9806 = PyO3 / PyPA / PyPI

seg-95cead42b0d0 = de Rust-Python-bindingbibliotheek / Python Packaging Authority / Python Package Index

seg-96b2c707a6b8 = Parametry Zemli { "1990" }

seg-3d5012a62544 = het geodetische datum van GLONASS

seg-9d14fb150c09 = QA

seg-582cb8ea13ac = kwaliteitsborging

seg-7025be647972 = QEMU

seg-d2209c7eea42 = Quick Emulator

seg-d23b9bd48594 = QPSK

seg-45db179e8e49 = quadrature phase-shift keying

seg-b6d487bd53ed = QZSS

seg-c0484340bc52 = Quasi-Zenith Satellite System

seg-531943b17837 = Japan

seg-697c55525b36 = RAAN

seg-85cd6997e07e = rechte klimming van de klimmende knoop

seg-79e641db1aae = RAFS

seg-9fa6a6b0e193 = RDRR

seg-19b00c5b9270 = Resist–Detect–Respond–Recover

seg-76da7c5bf39a = het veerkrachtmodel van RethinkPNT/Firesmith

seg-7bb5ed20c788 = RF

seg-35b036272c8e = radiofrequentie

seg-404104795160 = RHEL

seg-dd1bb2300eb5 = Red Hat Enterprise Linux

seg-34b1e77b1ff0 = RHS

seg-0b4bdbcd1476 = rechterlid

seg-f801cff658be = RMS / RSS

seg-6b758beecbfc = kwadratisch gemiddelde / wortel uit de som van kwadraten

seg-8b2bd83256f1 = RNG

seg-b90957003307 = generator voor willekeurige getallen

seg-354b42e3a5d0 = RNTF

seg-0ce1e8f8bd4a = Resilient Navigation and Timing Foundation

seg-43d17f884c69 = ROI

seg-597432415e53 = rendement op investering

seg-7abb945359d0 = RPCF

seg-8c71df162ddd = Resilient PNT Conformance Framework

seg-2f030c1d70c1 = DHS van de VS

seg-82b81c1e28d6 = RTCM

seg-7b855a1075d4 = Radio Technical Commission for Maritime Services

seg-4a7703f1b605 = de berichtstandaard ervan draagt CRC-24Q

seg-520c91fa0ef0 = een opensource GNSS-positiebepalingsbibliotheek (real-time kinematic-bibliotheek)

seg-a8b2e577e381 = RTN

seg-6ddf35119d08 = radiaal, transversaal, normaal

seg-b1b635ff08e4 = een baanvast stelsel

seg-04f4b26e9283 = RW

seg-b8b1a31739aa = random walk

seg-8b593d7d5dbd = zoals in bias random walk

seg-6f954dc5a005 = RWFM / WFM / FFM / WPM / FPM

seg-928fe3abcd5b = random-walk-, witte en flickerfrequentiemodulatie / witte en flickerfasemodulatie

seg-7fced178bcc5 = de machtswetruistypen van klokken

seg-e39ddb9e8ec1 = SA.45s / SA65, OX-208

seg-0c397d845610 = productnamen van Microchip (twee atoomklokken op chipschaal, een oscillator met kristal in een oven)

seg-8a1ae00c4a52 = namen, geen afkortingen

seg-a58426a850fd = SD

seg-d46cb77d53f6 = standaarddeviatie

seg-e29dd726165f = SDD

seg-0ebb68e4b6fd = Service Definition Document

seg-9415da7a79ab = zoals in de Galileo OS SDD

seg-1022626b788c = SDK

seg-2076da4dd4dd = software development kit

seg-9fb492bced01 = SDR

seg-1a1082059103 = software-defined radio

seg-0a647acd4355 = SDS

seg-d0f6ae60b687 = Space Defense Squadron

seg-c3f6fc1456ed = de 18th SDS houdt de Amerikaanse satellietcatalogus bij

seg-cf28e3e14401 = SEP

seg-a67fb04e0911 = zon–aarde–sondehoek (ook sferische waarschijnlijke fout)

seg-0c7631f367e8 = SGD

seg-d58ce1e25c08 = stochastische gradiëntafdaling

seg-2f25205204e4 = SHM

seg-f2e2253a31b3 = eenvoudige harmonische beweging

seg-b0973ab206ed = SI

seg-35624e5e4630 = Internationaal Stelsel van Eenheden

seg-02aa435dc884 = SIB

seg-262a811c8b69 = Safety Information Bulletin

seg-b9ee445609f5 = EASA; EASA is het Agentschap van de Europese Unie voor de veiligheid van de luchtvaart

seg-8d6d4fe3d155 = SINEX

seg-e5c071685532 = Solution INdependent EXchange format

seg-3466519e4c62 = geodetische oplossingen

seg-b21a3d7fb59d = SIR

seg-303809c700e2 = sampling importance resampling

seg-7a2e0e9cac08 = een deeltjesfilter

seg-6da637028ef8 = SIS / SISA

seg-9779a20e50d2 = signal in space / signal-in-space accuracy

seg-c0e9f44b333d = SITAN

seg-3eec2c14b564 = Sandia Inertial Terrain-Aided Navigation

seg-ceee87dd4b5e = SLR

seg-c8e722f1609c = satellietlaserafstandsmeting

seg-76d80b0d2deb = SMAD

seg-7fbda47e3858 = Space Mission Analysis and Design

seg-dfc105c0178b = het studieboek

seg-5278559437c5 = SNR

seg-b97c29ce3b37 = signaal-ruisverhouding

seg-ff2faf259a15 = SOS / SSE

seg-5a2e327af384 = som van kwadraten / som van gekwadrateerde residuen

seg-453c4506fd59 = SOTA

seg-7eaa0caa6916 = stand van de techniek

seg-127e73a3610b = NIST Special Publication { "1065" }

seg-bedc9a3d8d9f = hetzelfde document als NIST SP { "1065" }

seg-cf2491c1a488 = SPD / PD

seg-eade81634bf5 = symmetrisch positief definiet / positief definiet

seg-5fedf0f7b5c0 = SPDX

seg-3aba3c5a5c19 = Software Package Data Exchange

seg-c10b1f20f37e = de licentie-identificatiecodes in bestandskoppen

seg-b377a91a047f = SPK

seg-5603642c612d = SPICE-kernel voor efemeriden van ruimtevaartuigen en planeten

seg-cf18ba9c86d8 = SPOF

seg-cfab8d8a2cdf = single point of failure

seg-c06f64211c40 = SQM

seg-7e58d6a4a92c = bewaking van de signaalkwaliteit

seg-a4e75468e6f9 = spoofingcontroles op de vorm van de correlator

seg-0bb7a4875914 = SRIF

seg-82da1a1f1be4 = wortelinformatiefilter

seg-970edb8ec42f = SRP

seg-ae097fbdabf9 = zonnestralingsdruk

seg-edc814ba451b = SRTM / SRTMHGT

seg-b756bc93d2ea = Shuttle Radar Topography Mission / het hoogtebestandsformaat ervan

seg-4692354a98de = tegels worden genoemd naar hun zuidwestelijke hoek, bijvoorbeeld N36W117

seg-00f36f1678d6 = SSD

seg-532285d8e6ce = Solar System Dynamics

seg-1d8167212f57 = de groep van JPL

seg-d21315ea8c52 = STEC

seg-84689b829867 = totale elektronendichtheid langs het schuine pad

seg-eabee4bfb30e = Systems Tool Kit

seg-a7ff60ab0bd9 = een product voor missieanalyse

seg-17d792c12885 = de dienst van Iridium voor positiebepaling en tijdsynchronisatie

seg-3efaadad9c96 = STM

seg-da395fa674ec = toestandsovergangsmatrix

seg-d116578b987b = SV

seg-caa37a1e7d12 = ruimtevaartuig (een satelliet)

seg-845e6f3a37ec = SVD

seg-e775c436db4b = singulierewaardenontbinding

seg-3e5561868a7f = Scalable Vector Graphics

seg-4c48f567e37c = TAES

seg-db881ca72cd5 = IEEE Transactions on Aerospace and Electronic Systems

seg-39b93d9b401a = TC / TM

seg-b0df03cff98a = telecommando / telemetrie

seg-fafb84a9796a = TDD

seg-ec3b92ad43c3 = testgedreven ontwikkeling

seg-40defa915d0d = TDOA / FDOA

seg-e7db8768b023 = verschil in aankomsttijd / aankomstfrequentie

seg-aecac9c9d2d0 = passieve lokalisatie van zenders

seg-01861b3d63bf = TERCOM

seg-9ef3f9cbbe77 = vergelijking van terreincontouren

seg-5da9ae904ae0 = TEXBAT

seg-e90183a6fc69 = Texas Spoofing Test Battery

seg-941eccec7400 = opgenomen GNSS-spoofinggegevens (OAKBAT is een dataset van dezelfde klasse)

seg-e71c15afe44e = TIE

seg-19bfea0d5c88 = tijdsintervalfout

seg-eb12660210bd = TIES

seg-9335f08b6381 = Telecommunication Information Exchange Service

seg-12f4af2b48c1 = accounts van ITU-leden

seg-c05ba396ac1e = ToA

seg-78a41e672189 = aankomsttijd

seg-7d821e75fdf7 = TOL

seg-4c7600f40479 = tolerantie

seg-1f8b3be77dcc = TOPSIS

seg-00812e7bff63 = Technique for Order of Preference by Similarity to Ideal Solution

seg-c9a6058c9715 = TOTDEV / TOTVAR

seg-53a19d838c2d = totale deviatie / totale variantie

seg-7350da5c5c30 = stabiliteitsschatters met uitgebreid bereik

seg-91d2f49dc7c0 = TPAMI

seg-e9b41a993d86 = IEEE Transactions on Pattern Analysis and Machine Intelligence

seg-85692b01a12d = TPL

seg-123ed92776a3 = beschermingsniveau voor tijdsynchronisatie

seg-10c9563602b7 = zie SLOT-TIMING.md

seg-d1e3f93bc0aa = TPS

seg-579b1467ca5f = thermisch beschermingssysteem

seg-3b7fe44cc552 = TRN

seg-5239a432b919 = navigatie met terreinreferentie

seg-1df3bcf7eb97 = TR / TN

seg-ef0ff09dc412 = technisch rapport / technische notitie

seg-643fa447bcee = TU Delft

seg-5c5492ecd86f = Technische Universiteit Delft

seg-f3f22590bc57 = TWSTFT / TWTFT

seg-28c80c27a136 = tweewegs tijd- en frequentieoverdracht via satelliet / tweewegs tijd- en frequentieoverdracht

seg-e1a149ff6c43 = UBX

seg-fa0e9838530e = het binaire ontvangerprotocol van u-blox

seg-9555546fed38 = UDRE

seg-5fd7aec5beda = differentiële afstandsfout voor de gebruiker

seg-a3f5dda611b0 = SBAS

seg-b6f0baa6e478 = UERE

seg-4d1cb1c3ade9 = gebruikersequivalente afstandsfout

seg-7d87e82154ed = UFFC

seg-02457dbb660b = Ultrasonics, Ferroelectrics, and Frequency Control

seg-f4da31f92a79 = een IEEE Transactions

seg-573db7b5995b = { "300" } MHz tot { "3" } GHz

seg-3688c8d84cdc = UI / UX

seg-42162760360f = gebruikersinterface / gebruikerservaring

seg-7a56f7e38c5a = ULA

seg-4f4d9da7855c = uniforme lineaire array

seg-db65f4a7586d = ULP

seg-ae7458813685 = eenheid op de laatste plaats

seg-d7f4df5a9d13 = precisie van drijvende komma

seg-81dc0f4f1b2c = URA / URE

seg-c92cbc3e3954 = user range accuracy / user range error

seg-17e8fb142c6c = URA begrenst voor integriteit, URE is de RMS van de nauwkeurigheid

seg-1e02dfc0a52b = URL

seg-f726bcd9d4ad = uniform resource locator

seg-088e05d67af1 = USGS

seg-ffed8eca324d = United States Geological Survey

seg-1ded2eb40061 = USNO

seg-2b5f7bbe22e9 = United States Naval Observatory

seg-39ed84639c60 = USO

seg-f9f684640e53 = ultrastabiele oscillator

seg-b3a829cb7d84 = US Standard Atmosphere { "1976" }

seg-ba97a4005ee8 = VIKOR

seg-dfb9c6638023 = VIseKriterijumska Optimizacija I Kompromisno Resenje (multicriteria-optimalisatie en compromisoplossing)

seg-7fe170288e4e = interferometrie met zeer lange basislijn

seg-2e95d53160df = WAAS / EGNOS

seg-8a3ae96dd95a = Wide Area Augmentation System / European Geostationary Navigation Overlay Service

seg-1746693259e0 = SBAS; zie hierboven

seg-98f4f946a7ac = WASM

seg-257c477dc510 = WebAssembly

seg-eaf260aa0e21 = WASPAS

seg-4da2350f07f2 = Weighted Aggregated Sum Product ASSessment

seg-c9710476b8b5 = Working Group C van de samenwerking tussen de Europese Unie en de Verenigde Staten op het gebied van satellietnavigatie

seg-79f0e87410bf = publiceert de ARAIM-referentiedocumenten

seg-199e55106e0f = WGCCRE

seg-9e2d0f828a0a = Working Group on Cartographic Coordinates and Rotational Elements

seg-d1939d914701 = WGN

seg-6bbc3adc6a53 = wit Gaussische ruis

seg-1e422c9001d4 = WGS72 / WGS84

seg-dab1ec7739ae = World Geodetic System { "1972" } / { "1984" }

seg-5964aa61f847 = SGP4 gebruikt de constanten van WGS72

seg-f4ea25131d04 = WHU

seg-7d30c759d92f = Wuhan University

seg-5d028f5e2120 = WSM / WPM

seg-ce407535733f = gewogensommodel / gewogenproductmodel

seg-cc68c85bb2b9 = multicriteria-aggregatie (WPM betekent ook witte fasemodulatie; de context geeft aan welke betekenis geldt)

seg-9041c866d202 = XML

seg-0e55c3adc568 = Extensible Markup Language

seg-93e0e8702167 = XOR

seg-cfa3197f8c1d = exclusieve of

seg-7fba187cb552 = X / Y / Z / F (XYZF), D / I

seg-195082605699 = de componenten van het aardmagnetisch veld: noord, oost, omlaag, totale intensiteit; declinatie, inclinatie

seg-94835748fcbb = YAGNI

seg-76430d755d74 = you aren't gonna need it

seg-e4e177088376 = een ontwerpprincipe

seg-565c1908393c = ZHD

seg-77a0948bc15d = zenit-hydrostatische vertraging

seg-749be52554c5 = Reproduceerbaarheid en licenties

seg-d78d9bbb905c = <b>Reproduceerbaar (deterministisch).</b> Dezelfde invoer geeft altijd bit-voor-bit identieke uitvoer: <c1/>. Geen verborgen willekeur.

seg-1412347e2298 = <b>Seed.</b> Het getal waarmee de (deterministische) willekeurige generator wordt geïnitialiseerd, zodat runs herhaalbaar zijn.

seg-3a35740e04a8 = <b>Open core.</b> Het bedrijfsmodel: de engine is gratis en open source (AGPL-3.0, de hieronder gedefinieerde GNU Affero General Public License; commercieel onder dubbele licentie); het bedrijf wordt gedragen door support, integratie, commerciële licenties en propriëtaire add-ons, niet door gebruikerskosten voor de open engine.

seg-8ea21ebded3c = <b>AGPL-3.0.</b> De GNU Affero General Public License v3: een sterke copyleft-opensourcelicentie die de OSI (Open Source Initiative) als open source aanmerkt. Net als de GPL (GNU General Public License), maar met een extra clausule (§{ "13" }) voor software die aan gebruikers wordt aangeboden <b>via een netwerk</b>: een aangepaste versie die via een netwerk bereikbaar is, moet die gebruikers de bijbehorende broncode aanbieden. De open licentie van { -brand }.

seg-f87860d8197d = <b>Dubbele licentiëring.</b> Dezelfde code onder twee licenties aanbieden, zodat gebruikers kiezen: hier de AGPL-3.0 (open, copyleft) <b>of</b> een commerciële licentie van Ashforde OÜ (een Estse besloten vennootschap; OÜ = osaühing) voor propriëtair/gesloten gebruik waarvoor de AGPL niet geschikt is. Zie <c1/>.

seg-dd5f4a1bbbf5 = Ook gebruikt op kshana.dev

seg-9d0c42560a90 = Afkortingen die de website gebruikt en die niet in de woordenlijst van de repository hierboven staan.

seg-67a54ce8c89e = Global Positioning System

seg-814b0d29bbb2 = draaggolf-ruisdichtheidsverhouding, in dB-Hz

seg-f22a269bc575 = de radioband van { "1" } tot { "2" } GHz die GNSS gebruikt

seg-1f4360a0405c = coarse/acquisition-code van GPS L1

seg-6f7910207534 = augmented forward signal (maan)

seg-74f02864ce32 = micro-elektromechanische systemen

seg-0f931242ecc0 = UAS

seg-dddfd223a3b1 = onbemand luchtvaartuigsysteem

seg-7091aabf8b6d = PL · AL

seg-12d88ab45197 = beschermingsniveau · alarmgrens

seg-78134bcc48da = approach with vertical guidance, niveau I

seg-27328b36b476 = LEO · GEO

seg-b1ae7014a663 = lage baan om de aarde · geostationaire baan

seg-c1d933dd3965 = OEM · OMM · TDM

seg-5d0ebe2bc51c = CCSDS-berichten voor baanefemeriden, gemiddelde baanelementen en volggegevens

seg-fa9240660ec4 = IGRF

seg-c19fd59fdca0 = DSN

seg-7979317c75d2 = Deep Space Network

seg-c194401c2039 = TCXO · OCXO

seg-5c9d0b4c561d = temperatuurgecompenseerde · in een oven geregelde kristaloscillator

seg-f3a7cc221b63 = PHM

seg-08d5cfc5b460 = passieve waterstofmaser

seg-5ed928b1c6d0 = USO · DSAC

seg-b77f2ea4a521 = ultrastabiele oscillator · atoomklok voor de diepe ruimte

seg-553814463110 = MTIE · TDEV

seg-2d9b8af50414 = maximale tijdsintervalfout · tijdsdeviatie

seg-5b155b60152f = PRTC · ePRTC

seg-93d590e6408d = primaire referentietijdklok · verbeterde PRTC

seg-8541a73eef89 = ADEV · σy(τ)

seg-a2ae4a40f486 = Allan-deviatie bij middelingstijd τ

seg-96fae3b4fb8e = International Telecommunication Union, Telecommunication Standardization Sector

seg-24cab92c0fd3 = NIS · NEES

seg-7e82e2927d59 = genormaliseerde gekwadrateerde innovatie · genormaliseerde gekwadrateerde schattingsfout

seg-7175ab55e707 = JSON · CSV · SVG

seg-a9a2906d15de = JavaScript Object Notation · door komma's gescheiden waarden · Scalable Vector Graphics

seg-d3a9009a35c0 = CLI · API · IDE

seg-c6418e1f785d = opdrachtregelinterface · application programming interface · geïntegreerde ontwikkelomgeving

seg-8df86177107a = SBOM · SLSA

seg-e54326c78ab0 = software bill of materials · Supply-chain Levels for Software Artifacts

seg-347b23148b8f = NDA

seg-969d2489de28 = geheimhoudingsovereenkomst

seg-564cfa0d3084 = Digital Object Identifier

seg-5cbd99859d90 = C/N₀-waterval

seg-ed4a9e041a83 = een grafiek van de draaggolf-ruisdichtheidsverhouding per satelliet in de tijd

seg-1cb49c7e6c7f = HPL · VPL

seg-ccdc7d672c8f = horizontaal · verticaal beschermingsniveau

seg-c7a40ebac7e1 = LROC

seg-529f02f85a76 = Lunar Reconnaissance Orbiter Camera

seg-c5da9d350518 = <s1>Vorige</s1>Inleiding op de concepten

seg-670504be0531 = <s1>Volgende</s1>Studiogids
