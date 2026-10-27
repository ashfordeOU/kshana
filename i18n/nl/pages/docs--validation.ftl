# docs--validation: translations (nl)

seg-2db69c58f694 = Differentiële PNT op de maan

seg-2eb6d1b0483d = RAIM / ARAIM

seg-da3532b1444d = SBAS / DO-229E

seg-d3af26f389f5 = IONEX / Klobuchar

seg-70860389903a = Klok

seg-583dc9ff6178 = Bibliotheek

seg-d01db1c2710a = Naslag

seg-619f89bf160c = Realisatie van het lunaire referentiestelsel

seg-d6476863f862 = Mogelijkheid

seg-ad856ad710eb = Status

seg-4bcec6e2dd9f = Maannavigatieservicevolume

seg-c04a3591074c = Interoperabiliteitsexport voor de maan

seg-20fee61b3107 = Bibliotheek met foutmodellen van kwantumapparaten

seg-eaf341ff4522 = GNSS-vrije kwantumnavigatie

seg-d12d4565b01d = Geodetische VLBI op de Maan, kernelpad

seg-5ed34a5b402e = Gezamenlijke multitechniek-OD + klok voor de Maan

seg-75636f9419b2 = Bekende beperkingen

seg-9c0eb89a2fbe = Pakket

seg-f63dd3d7aad4 = Bron

seg-638b8d451550 = Sensor

seg-04f69a0edb2f = type

seg-b03d56f501c3 = Type

seg-35bf9a48e566 = Term

seg-f3526b0d95f8 = Gemeten

seg-7634c6f4b32c = Verbinding

seg-b966dd26caa6 = Dataset

seg-4fe4920a3fa1 = Standaard

seg-84430d202cd4 = Bron: <c1/>

seg-028f26d1374e = <b>Over toleranties.</b> “Getoetst” betekent hieronder dat een kalibratietest bevestigt dat de gesimuleerde statistiek binnen een <b>afgedwongen drempel</b> overeenkomt met de referentierelatie, momenteel <b>{ "20" }–{ "25" }% relatieve fout</b> (gemiddeld over seeds) voor de relaties van Allan en het ruisbudget. De mediaan van de waargenomen overeenstemming is vaak veel nauwer (enkele procenten), maar de <em>gegarandeerde</em> grens is de drempel, niet de mediaan. Waar een getal als "~{ "2" }%" voorkomt, is het een typische waarneming, niet de afgedwongen tolerantie. Zie <a1>Beweringen tegenover werkelijkheid</a1>.

seg-94a480ed9ccb = De promotieregel

seg-a550784412a6 = Een rij van de machinaal gecontroleerde verificatiematrix (<c1/>) is alleen VALIDATED wanneer een referentie die <b>onafhankelijk is van { -brand }</b> met de implementatie overeenkomt <b>binnen een tolerantie die is vastgelegd voordat de vergelijking wordt uitgevoerd</b>, in een test die in de gate draait. Deze sectie is de enige plaats waar de regel is opgeschreven; de matrix, de tekst per rij en de release notes verwijzen ernaar.

seg-5e14faed9f05 = De geaccepteerde soorten onafhankelijke referentie

seg-4297b6a1b385 = Wat meetelt

seg-a42c0c36b37f = Voorbeelden die al in de matrix staan

seg-e39aeb132e03 = Echte gemeten gegevens van de grootheid die de rij claimt: een waarneming van de fysieke wereld, geen modeluitvoer.

seg-e77977db9de1 = De achtergehouden twee derde van een echte cesiumklokregistratie; gearchiveerde normale punten van laserafstandsmeting op de maan; de reeks Circular T UTC(k) van het BIPM (International Bureau of Weights and Measures); de terreintegel van SRTM (Shuttle Radar Topography Mission).

seg-6325fe1fafaf = Een onafhankelijke bibliotheek of hulpmiddel van een derde partij die een <b>eenduidig gedefinieerde</b> grootheid op dezelfde invoer berekent, waarbij de bibliotheek de domeinberekening zelf implementeert. Overeenstemming tussen bibliotheken is alleen een echte controle omdat de grootheid één juist antwoord heeft.

seg-a9cd35495601 = allantools, Orekit, ANISE, RTKLIB, gnss_lib_py, lamberthub, pymcdm, scikit-learn, de statistische verdelingen van SciPy.

seg-056adffae706 = Gepubliceerde referentievectoren, tabellen of verificatievoorbeelden: getallen die een norm, een instantie of een naslagwerk afdrukt zodat implementaties eraan kunnen worden gecontroleerd.

seg-991fb822e99c = SOFA/ERFA-vectoren (Standards of Fundamental Astronomy), de SGP4-verificatievectoren van AIAA (American Institute of Aeronautics and Astronautics), de validatievoorbeelden van ITU-R (International Telecommunication Union, Radiocommunication Sector), het uitgewerkte ARAIM-voorbeeld van Working Group C, JPL (Jet Propulsion Laboratory) Horizons.

seg-2a774e48055a = Twee verdere maatstaven beslissen de grensgevallen. Beide zijn aangenomen voor release { "0.30" }.

seg-f5c6cf536ba1 = <b>P1, een gepubliceerde uitgewerkte waarde.</b> Een gepubliceerde uitgewerkte waarde, berekend uit dezelfde gesloten vorm die de rij implementeert, telt als een gepubliceerde referentievector wanneer de publicatie onafhankelijk is van { -brand } en de vergelijking een vermelde tolerantie vastlegt. De waarde moet als getal in de publicatie staan afgedrukt (een van een grafiek afgelezen waarde telt alleen als de leesonzekerheid binnen de vermelde tolerantie valt), en de test moet { -brand } haar laten berekenen uit de invoer van de publicatie; een constante vergelijken met het document waaruit ze is overgenomen is een transcriptiecontrole, niet P1.

seg-0b043b552e76 = <b>P2, een onafhankelijke numerieke bibliotheek.</b> Een onafhankelijke numerieke bibliotheek zoals numpy of LAPACK (het Linear Algebra PACKage) die een eenduidig gedefinieerde grootheid uit de lineaire algebra op vermelde invoer herberekent, telt als een onafhankelijke bibliotheek. De bibliotheek moet de decompositie-, inversie-, oplos- of kleinstekwadratenstap met haar eigen algoritme uitvoeren, op invoer die met de fixture is vastgelegd; de getoetste bewering is dan de lineaire algebra op die invoer, niet de fysieke grootheden van een representatief scenario. Een script dat een scalaire gesloten vorm opnieuw evalueert met numpy-rekenkunde is een tweede implementatie van onszelf, niet P2.

seg-b7911d589f7a = Voorwaarden die voor elke soort gelden: de onafhankelijke referentie is niet geschreven, uitgevoerd of gepubliceerd door dit project (de eigen reeks artikelen van deze repository is dus niet onafhankelijk ervan); de tolerantie staat in de test en is vastgesteld vóór de eerste vergelijking; een datagestuurde test die wordt overgeslagen wanneer haar openbare gegevens ontbreken, meldt dat bij het overslaan.

seg-7e6057a2cad7 = Wat niet meetelt

seg-80cfbb204767 = <b>Onze eigen tweede implementatie</b>: een tweede codepad in deze crate (<c1/>), of een script in deze repository dat dezelfde gesloten vorm opnieuw evalueert.

seg-d6efaf8399f9 = <b>Overeenstemming met onze eigen eerdere uitvoer</b>: goldens, regressiepins, snapshots of een tabel uit de eigen artikelen van dit project.

seg-4d0365b383e5 = <b>Een transcriptie van de constanten van een bron</b>: een coëfficiënt, voorinstelling, datasheetcijfer of parameterblad controleren aan het document waaruit het is overgenomen.

seg-3bf8025077fb = <b>Een ontwerpkeuze</b>: een toewijzing, weging, drempel, alarmlimiet of representatief scenario. Voor een keuze bestaat geen externe referentie.

seg-4f0aafd7166e = <b>Een interne identiteit</b>: een numerieke integraal tegenover zijn eigen analytische vorm, een round trip, een inversie, een eigenschaps- of monotoniciteitstest.

seg-4f4408e4ebab = <b>Een integratierun tegen een echte host</b> (<c1/>): een plugin laden in een echte Signal K-server of OpenCPN, of de uitvoer van een echte gate voeden aan een TCP-afnemer, en controleren dat de host de invoer accepteert en de verwachte status toont. Het toont aan dat de koppeling werkt. De host is geen onafhankelijke referentie voor enige waarde die de integratie meedraagt, dus er is niets externs om mee te vergelijken en zo'n rij (de rij maritieme integraties) is MODELLED, niet VALIDATED. <c2/> is een eigen soort referentie, alleen toegestaan op MODELLED rijen: <c3/> in <c4/> faalt als een VALIDATED rij die draagt, en <c5/> eist al dat elke VALIDATED rij <c6/> is.

seg-a39a87c56a16 = <b>Aannemelijkheid op echte invoer</b>: echte gegevens die alleen als invoer worden gebruikt, met beweringen over de ordegrootte in plaats van een vergelijking met een externe waarde.

seg-db6f5d98b4ef = Een tolerantie die is gekozen nadat de vergelijking was gezien.

seg-f4f18b7549df = Hoe de regel wordt afgedwongen

seg-19a62c7e0aee = Elke VALIDATED rij geeft in <c1/> in <c2/> aan op welke soort ze rust (Measured, Library, Reference, P1 of P2), de onafhankelijke bron (aangehaald uit de eigen referentietekst van de rij) en de ene test die de vergelijking draagt. De unittests naast de tabel falen wanneer een VALIDATED rij niet of tweemaal is aangegeven, wanneer een aangifte een rij noemt die niet VALIDATED is, wanneer de aangegeven bron niet die is die de referentietekst van de rij noemt of { -brand } zelf is, wanneer de aangegeven test niet een test is die de rij aanhaalt, of wanneer een P2-rij geen onafhankelijke numerieke bibliotheek noemt. <c3/> eist vervolgens dat de aangegeven test op schijf bestaat als een echte <c4/> die niet wordt genegeerd. Wat de machine niet kan controleren, is of de genoemde test vergelijkt met de aangegeven bron; dat blijft een menselijke lezing. Aantallen per soort worden hier niet getypt: de tabel is de bron.

seg-e8ae3e380f40 = Bestaande VALIDATED rijen opnieuw onderzocht onder de regel

seg-1dd44545a67a = De regel is toegepast op de bestaande rijen en op toekomstige promoties.

seg-38db7b6e7053 = <b>P1-rijen genoemd door het validatieonderzoek van { "0.30" }, elk ondersteund:</b> Linkbudget in één richting (de designcontroletabel van JPL Pub 82-76 voor Galileo X-band, opnieuw opgebouwd uit de regels tot op { "4.6e-3" } dB vrijeruimteverlies); Bandbegrensde gesloten vormen voor elk afstandsmetingssignaal ({ "90.3" } procent hoofdlobvermogen en de gepubliceerde coherente early-late-jitter); Maximale Doppler van een navigatiesatelliet in een lage baan om de aarde (de gepubliceerde cijfers van Xona Pulsar X1 en Iridium); Maximale Doppler die een stilstaande gebruiker ziet van een LEO- of MEO-baan (Table { "1" } van het Pulsar-artikel, { "20" } waarden); Doppler die een grondontvanger moet verwerken van een LEO-navigatiesatelliet (dezelfde gepubliceerde cijfers van een gevlogen baan). Elke publicatie is onafhankelijk van { -brand }, drukt haar getallen af, en de test vermeldt zijn tolerantie.

seg-8e38103d05d6 = <b>Verdere rijen die op P1 rusten, gevonden bij het heronderzoek, elk ondersteund:</b> Ontwerpafweging voor afstandsmetingscodes (de gepubliceerde −{ "23.9" } dB Gold-kruiscorrelatie); Maancoördinatentijd (Ashby en Patla { "2024" }, wiens controle van de maansnelheid tegen DE440 een bibliotheekcontrole is); Spectrale vermogensdichtheden van L-bandsignalen in gesloten vorm (Q-waarden van Kaplan en Hegarty); Eerste-orde ionosferische vertraging per band (de groepsvertragingsverhouding uit IS-GPS-200); Wereldgemiddelde gewichten van de signal-in-space-afstandsfout (de tabel van Montenbruck, Steigenberger en Hauschild { "2018" }).

seg-0014c53752ac = <b>P2-rijen genoemd door het onderzoek, elk ondersteund:</b> Fisher-informatie en Cramér–Rao-waarneembaarheid (numpy <c1/>/<c2/>); Identificeerbaarheid van de maandatum; Gekoppelde ijk van maanreferentiestelsel en tijdschaal; Autonome pijplijn voor foutwaarneembaarheid in een vrij netwerk (numpy/SciPy-SVD, singular value decomposition). Elk herberekent een eenduidig gedefinieerde grootheid uit de lineaire algebra op vastgelegde invoer met een ander algoritme dan de Jacobi-eigenwaardeoplosser van { -brand }.

seg-e9d01633d002 = <b>Verdere rijen die op P2 rusten, gevonden bij het heronderzoek, elk ondersteund:</b> Afleiding van prioriteiten met MCDA (multi-criteria decision analysis) (de eigenvector van AHP, analytic hierarchy process, door SciPy/LAPACK; de tabel Random Index die het ook reproduceert is een transcriptie en telt niet mee); Variantie van het doorlopen bij klok-holdover (SciPy <c1/> van de uitgebreide matrix van Van Loan); Realisatie van het maanreferentiestelsel (een Umeyama-oplossing met numpy-SVD); CRPA-bundelvorming (controlled reception pattern antenna) (complexe oplossing met LAPACK); Kernel voor het ARAIM-beschermingsniveau op de maan (de LU-inverse van RTKLIB met SciPy-kwantielen); Consistentie van maanframe en -dynamica tussen aanbieders (een numpy-SVD-kleinstekwadratenfit van drie gepubliceerde efemeriden).

seg-1fd94e94e89d = <b>Gemarkeerd in de eerste ronde, opnieuw onderbouwd in ronde { "2" } van de run van { "0.30" }.</b> Drie rijen werden gemarkeerd als niet ondersteund door de geschreven regel. Elke rust nu op een vergelijking die is vooraf vastgelegd voordat haar fixture werd opgehaald, zodat geen rij is gemarkeerd; een unittest naast <c1/> legt de (nu lege) lijst vast.

seg-3ef9479dea55 = <b>Integriteit (RAIM/ARAIM/SBAS).</b> De aangehaalde tests bevestigden vroeger alleen aannemelijkheid op echte geometrie van de IGS (International GNSS Service). De rij rust nu op drie bibliotheekreferenties: de ARAIM-solution-separation met meerdere hypothesen uit het Airborne Design Document v4.2 tegenover Stanford MAAST voor ARAIM { "2" } ({ "270" } echte gevallen, slechtste VPL-verschil { "2.2e-3" } m tegenover { "0.05" } m); snapshot-RAIM-detectie en -uitsluiting tegenover RTKLIB <c1/> ({ "2016" } van { "2016" } beslissingen identiek) met het beschermingsniveau voor de helling; en de SBAS DO-229E L1-beschermingsniveaus tegenover Stanford MAAST op echte WAAS-uitzendingen ({ "2868" } paren binnen { "1.6e-5" } m). De rij zegt duidelijk dat de functies met uniforme sigma <c2/> en <c3/> niet conform het ADD zijn en dat de SBAS-vergelijking met dubbele frequentie op L5 een bevinding is.

seg-16a4261c77ec = <b>Planeetposities door het zonnestelsel uit de Keplerelementen van JPL Standish.</b> De drempel achteraf van tweemaal de nominale fout is vervangen door een vooraf vastgelegde drempel: RMS hoogstens het cijfer uit Table { "8.10.1" } van de Explanatory Supplement per planeet en component, tegenover JPL Horizons DE441, met de splitsing van de aarde en de ICRF-rotatie gedekt.

seg-8d5b51a942e0 = <b>Lichttijd tussen hemellichamen in het zonnestelsel.</b> De lichttijdsolver wordt nu vergeleken met de lichttijden van Horizons binnen { "1e-6" } s op DE441-posities, een vooraf vastgelegde drempel die de positiedrempel niet overneemt.

seg-e96900bc322f = <b>MODELLED rijen die de twee beleidsregels bevorderbaar maken</b> (alleen via de rij-voor-rij-run van { "0.30" }, nooit door deze tekst): onder P1 de grens voor emitterlokalisatie met TDOA/FDOA (time and frequency difference of arrival), de koppeling van de relativistische klokgang aan het frame, de synchronisatiemaskers van ITU-T (Telecommunication Standardization Sector) (alleen voor maskerwaarden die de aanbevelingen als getallen afdrukken; de overgenomen knikpunten die aan zichzelf zijn gecontroleerd tellen niet mee) en de grens voor 5G-positiebepaling in niet-terrestrische netwerken (alleen als een gepubliceerd uitgewerkt cijfer wordt gevonden); onder P2 blindheid van integriteit voor gemeenschappelijke modus, het scalaire MHSS-beschermingsniveau voor tijdsynchronisatie (multiple-hypothesis solution separation) en de GLS-witmaking (generalised least squares). De twee benchmarkrijen voor timing-integriteit (de classificator voor het Stanford-integriteitsdiagram en de scorer voor integriteitsdekking) zijn regelgebaseerde classificatie, geen lineaire algebra, dus P2 bereikt ze niet; ze hebben een onafhankelijk hulpmiddel nodig, en het enige dat is gevonden (gLAB) heeft een niet-commerciële licentie.

seg-50a08fe5918b = <b>Consistentie met eerdere weigeringen.</b> De Vallado-controle van de rij voor lanceervensters zou nu onder P1 kwalificeren als haar test het afgedrukte uitgewerkte voorbeeld berekent; het plan van { "0.30" } bevordert haar in plaats daarvan via Orekit. De crossovertabel voor maantijd per klokklasse blijft MODELLED: de tabel die ze reproduceert komt uit het eigen artikel van dit project, dat niet onafhankelijk is.

seg-02423542480f = Ruisterm

seg-2bd49b92f14b = Pariteit van Allan-schatters (ADEV/MDEV/TDEV/OHDEV (ADEV: Allan-deviatie; MDEV: gemodificeerde Allan-deviatie; OHDEV: overlappende Hadamard-deviatie))

seg-c429a25d17ae = Twee controles aan primaire bronnen tegenover <b>NIST (National Institute of Standards and Technology) SP (Special Publication) { "1065" }</b> (Riley, <em>Handbook of Frequency Stability Analysis</em>, { "2008" }), beide met een relatieve tolerantie van <b>{ "1e-4" }</b>. ({ "1" }) <c1/>: de overlappende ADEV-, gemodificeerde ADEV-, tijdsdeviatie- en overlappende Hadamard-schatters reproduceren de deviaties voor de canonieke dataset van 10 punten <b>NBS14</b> (<b>SP { "1065" } Table 29/30, p. { "107" }</b>) bij tau = { "1" }, { "2" } — de overeenstemming is in werkelijkheid ~{ "1e-6" } (bijv. overlappende ADEV (OADEV) bij τ = { "2" }: { "85.952868" } tegenover { "85.95287" }). ({ "2" }) <c2/>: dezelfde vier schatters reproduceren de <b>dataset van 1000 punten uit SP { "1065" } §{ "12.4" }</b> (<b>Table { "31" }, p. { "108" }</b>) bij middelingsfactoren { "1" } / { "10" } / { "100" }, waarbij de dataset in code wordt geregenereerd uit de LCG van SP { "1065" } (Eq. { "73" }) — hermetisch, geen fixture. Dezelfde gegevens en getallen uit Table-31 zijn het regressiedoel in aewallin/allantools (<c3/>), hier gereproduceerd zonder code van derden. Dit legt de <em>schattersrekenkunde</em> vast tegenover de referentie, los van de rijen voor ruis-<em>kalibratie</em> hieronder.

seg-79e6f7d1e7f0 = Pariteit van Allan-schatters op <b>echte gemeten hardware</b>

seg-8c72a9df2547 = <c1/>: de overlappende Allan- en overlappende Hadamard-schatters reproduceren de referentiedeviaties van <b>Stable32</b> voor een <b>echte cesiumprimaire standaard 5071A, gemeten tegen een waterstofmaser</b> ({ "556 990" } fasesamples bij τ₀ = { "1" } s; { "1" } PPS (pulse per second) naar een teller 53230A, feb { "2014" }; verzameld door A. Wallin, verspreid met <c2/>). Gecontroleerd over de <b>hele decadeladder van τ ({ "16" } middelingsfactoren, τ = { "1" } s … { "4" }×10⁴ s)</b>: goed bemonsterde factoren tot op een relatieve drempel van <b>{ "1e-3" }</b> (de waargenomen overeenstemming is in werkelijkheid ≤ { "3e-5" }, bijv. OADEV({ "1" } s) { "3.317111e-10" } tegenover Stable32 { "3.3171e-10" }), schaarse factoren bij lange τ moeten binnen de afgedrukte betrouwbaarheidsband van { "1" }‑σ van Stable32 vallen. Dit vult de synthetische NBS14-pariteit hierboven aan met een controle op een gemeten klok. Het ruwe fasebestand zijn gegevens van een derde partij zonder licentie voor herverspreiding, dus het is door git genegeerd; <c3/> reproduceert het en de test drukt een overslaanmelding af (CI (continuous integration) blijft groen) wanneer het ontbreekt. Alleen de openbare referentiegetallen van Stable32 zijn vastgelegd (<c4/>); er wordt geen code van derden gebruikt.

seg-1a7f0e741913 = Pariteit van Allan-schatters op de <b>canonieke Stable32 PHASE.DAT</b>

seg-00e382874a00 = <c1/>: de overlappende Allan-, gemodificeerde Allan- en tijdsdeviatieschatters reproduceren de referentiedeviaties van <b>Stable32</b> voor <b>PHASE.DAT</b> — de reeks van 1001 punten die met Stable32 wordt verspreid en die onafhankelijke hulpmiddelen (bijv. <c2/>) als standaard regressiedoel gebruiken — over de <b>volledige ladder van middelingsfactoren ({ "139" } factoren)</b> tot op een relatieve drempel van <b>{ "1e-3" }</b> (waargenomen ≤ { "5e-5" }). Een tweede, onafhankelijke echte referentiereeks naast de controle met gemeten cesium hierboven. PHASE.DAT wordt meegeleverd met het commerciële hulpmiddel Stable32, dus de ruwe reeks is door git genegeerd; <c3/> reproduceert hem en de test wordt groen overgeslagen (CI blijft groen) wanneer hij ontbreekt. Alleen de openbare referentiegetallen van Stable32 zijn vastgelegd (<c4/>); er wordt geen code van derden gebruikt.

seg-9dde9e0c8055 = Stabiliteit van optische klokken op een <b>echte gemeten curve</b>

seg-ea908ba3a79f = <c1/>: de inversie van de klokruisparameters (<c2/>) reproduceert de <b>gepubliceerde σ_y(τ) van de ⁸⁸Sr optische roosterklok van Norcia et al., <em>Science</em> { "366" }:{ "93" } ({ "2019" })</b> (Zenodo 10.5281/zenodo.3382347, <b>CC-BY-4.0</b> (Creative Commons Attribution { "4.0" }), curve opgenomen in <c3/>): de teruggevonden coëfficiënt voor witte frequentie √q_wf ≈ { "4.33e-16" } komt overeen met de kortetermijnstabiliteit van ≈4.7e-16/√τ uit het artikel (~{ "10" }% RMS (root mean square) over de curve) en de fit detecteert een gemeten ondergrens ongelijk aan nul (q_rw > { "0" }). Dit legt de <b>inversie van gemeten ADEV naar ruisparameters tegen een echte optische klok</b> vast; het voordeel in holdover tot de drempel dat erop is gebouwd, blijft MODELLED.

seg-e1e930dcd0a1 = ROC (receiver operating characteristic) AUC (area under the curve) voor anomaliedetectie op <b>echte telemetrie van ESA (European Space Agency) OPS-SAT</b>

seg-2b637daa985c = <c1/> (reproduceert de labels)

seg-c667434b580d = <c1/>: op de dataset <b>OPSSAT-AD</b> (Ruszczak et al. { "2025" }, Zenodo 10.5281/zenodo.12588359, <b>CC BY { "4.0" }</b>) — echte housekeepingsegmenten van OPS-SAT met anomalielabels uit de grondwaarheid — reproduceert de Mann–Whitney-ROC-AUC van { -brand } (<c2/>) <b>scikit-learn <c3/></b> tot op <b>< { "1e-9" }</b> op de achtergehouden testsplitsing ({ "529" } segmenten, { "113" } anomalieën), voor twee deterministische scores: een transparante detector met één kenmerk (aantal pieken per segment, <b>AUC ≈ { "0.851" }</b>) en een score met diagonale Mahalanobis-afstand met 8 kenmerken, gefit op de normale trainingssegmenten (AUC ≈ { "0.556" }); <c4/> omkadert de puntschatting met een ondergrens die boven kans uitkomt. Dit toetst de <b>AUC-berekening op echte ESA-gegevens</b> en de <b>gelabelde scheiding</b> van een transparante detector — het reproduceert <b>niet</b> de beste gepubliceerde maat uit het OPSSAT-AD-artikel (een gesuperviseerd FCNN (fully connected neural network), F1 ≈ { "0.95" }), waarvoor hun getrainde model nodig is. Gegevens met CC-BY zijn opgenomen (<c5/>, hermetisch); de onafhankelijke referentie wordt opnieuw gegenereerd door <c6/>.

seg-5f2d41617fb2 = Synthese van functionalen van het zwaartekrachtveld (zwaartekrachtondersteunde / GNSS-vrije (GNSS: global navigation satellite system) navigatiekaart)

seg-4c1126137428 = <c1/>: de kernel voor sferisch-harmonische zwaartekrachtfunctionalen (<c2/> / <c3/>) — de "kaartlezer" waartegen een zwaartekrachtondersteunde navigator vergelijkt — is getoetst aan de <b>normaalzwaartekrachtnorm van GRS80 (Geodetic Reference System { "1980" })</b> (Moritz { "1980" }, aangenomen door de IAG (IAG: International Association of Geodesy)). Het GRS80-normaalveld opbouwen uit de gepubliceerde even zonale harmonischen J₂…J₈ en de zwaartekracht (gravitatie + middelpuntvliedend) op de ellipsoïde synthetiseren reproduceert de gesloten-vorm-normaalzwaartekracht van <b>Somigliana</b>, en de gepubliceerde waarden op de evenaar en bij de pool γ_e = { "9.7803267715" } / γ_p = { "9.8321863685" } m/s², tot op <b>{ "3.5e-12" }</b> relatief over alle breedtegraden (drempel { "1e-9" }). Dezelfde kernel laadt het toonaangevende <b>echte ICGEM-aardmodel (International Centre for Global Earth Models) EGM2008 (Earth Gravitational Model { "2008" })</b> (NGA (National Geospatial-Intelligence Agency), publiek domein via ICGEM; de lezer <c4/> wordt ook beproefd op het maanveld van GRAIL (Gravity Recovery and Interior Laboratory) in <c5/>) en levert een fysiek begrensde kaart van zwaartekrachtverstoringen (RMS ≈ { "26" } mGal, max ≈ { "89" } mGal bij d/o { "70" }). Toetst de <b>juistheid van de synthesecode</b>; de <em>nauwkeurigheid van zwaartekrachtondersteunde positiebepaling</em> blijft MODELLED (er is geen openbaar traject van een gravimeter op een platform met grondwaarheid).

seg-7dc3ff4c6eea = Ruissoortspecifieke edf (betrouwbaarheidsintervallen)

seg-7e8a93fb2eea = <c1/>: de χ²-betrouwbaarheidsband op elk punt van de overlappende ADEV gebruikt de ruissoortspecifieke effectieve vrijheidsgraden (de gesloten vormen uit NIST SP { "1065" } Table { "5" } voor witte en flicker-fasemodulatie, witte en flicker-frequentiemodulatie en random-walk-frequentiemodulatie (WPM/FPM/WFM/FFM/RWFM) — de eenvoudige set van Stable32), waarbij de machtswetsoort van de meetreeks wordt bepaald uit de log-loghelling van haar MDEV. Drie onafhankelijke controles: (a) de vijf formules reproduceren met de hand geëvalueerde waarden bij N={ "64" },m={ "4" } tot op { "1e-12" }; (b) een <b>Monte-Carlo-ensemble met witte FM (FM: frequentiemodulatie)</b> ({ "4 000" } meetreeksen) meet de werkelijke chikwadraat-edf van de schatter = { "2" }·gemiddelde²/Var(σ²) en komt binnen { "20" }% overeen met de formule (en verslaat de conservatieve niet-overlappende telling duidelijk); (c) <c2/> reproduceert de afgedrukte <b>SP { "1065" } Table { "32" } (p. { "109" })</b> edf = { "146.177" } voor de dataset van 1000 punten bij m={ "10" } (witte FM) tot op { "5e-3" }, en de { "95" }%-betrouwbaarheidsgrenzen van de tabel ({ "8.223942e-2" } / { "1.035201e-1" }) tot op <{ "0.2" }% (het kleine residu is de Wilson-Hilferty-benadering van χ² tegenover de exacte χ² van NIST). De geëxporteerde ADEV-curve draagt per τ de bepaalde ruissoort, edf en de { "95" }%-band.

seg-7048ac695b99 = Witte FM (korte termijn)

seg-b6982cb2ca25 = <c1/>: de gesimuleerde overlappende ADEV reproduceert de gepubliceerde sigma_y({ "1" } s) — doorgaans binnen enkele procenten, <b>afgedwongen drempel { "20" }%</b> (CSAC en het doel voor de optische roosterklok) — en de curve voor witte FM sigma_y(tau)=sigma_y(1s)/sqrt(tau) over tau = { "1" }, { "10" }, { "100" } s binnen een <b>drempel van { "25" }%</b> (komt overeen met de datasheet van de CSAC (chip-scale atomic clock) { "3e-10" } / { "1e-10" } / { "3e-11" }).

seg-11fc7c4b61ff = Random-walk-FM (lange termijn)

seg-1e211f342e79 = <c1/>: de gesimuleerde ADEV komt overeen met sigma_y^{ "2" }(tau)=q_rw*tau/3 (Riley NIST SP { "1065" }) tot op ~{ "20" }% (gemiddeld over seeds).

seg-dcfca4041429 = Veroudering / lineaire drift

seg-2d5c6a44cbdb = <c1/> + eruit gekalibreerd

seg-492f91ba2f79 = Deterministisch; de holdover-schatter verwijdert offset en veroudering met een kwadratische voorspeller, zodat het residu de stochastische grens is. Getest in <c1/> / <c2/>.

seg-2ea6a14cac1c = Kalman-schatter + integriteitsgrens

seg-8c8f8a5eba5a = <c1/>: een filter met twee toestanden (fase, frequentie) waarvan de exacte van-Loan-procesruis overeenkomt met het waarheidsmodel; doorlopen reproduceert de analytische holdovervariantie <c2/> tot op { "1e-9" }. De covariantie-update heeft de <b>gestabiliseerde vorm van Joseph</b> <c3/>, die positief-semidefiniet blijft (gecontroleerd met Cholesky) over { "500" } predict/update-stappen bij een extreme verhouding <c4/>, en overeenkomt met de naïeve vorm tot op { "1e-9" } waar die goed geconditioneerd is. De runlaag rapporteert Integrity als het deel van de uitvalsamples binnen de beschermingsgrens van 3 sigma (<c5/>).

seg-f332f06e80f9 = Zelfconsistentie van het filter (NIS (normalised innovation squared) / NEES (normalised estimation error squared))

seg-333e1701b6d0 = <c1/> (model)

seg-c1304de95180 = <c1/>: een Monte-Carlo-consistentiebeoordeling (Bar-Shalom §{ "5.4" }). De gepoolde <b>NIS → { "1" }</b> en <b>NEES → { "2" }</b> van het passende filter vallen binnen hun χ²-banden van { "95" }% (de NIS-band gebruikt het gepoolde aantal witte innovaties; de NEES-band gebruikt het aantal onafhankelijke runs, omdat schattingsfouten in de tijd gecorreleerd zijn). Een test met een <b>Q/R-mismatchsweep</b> verifieert dat de monitor <c2/> alleen meldt bij unit-afstemming en <c3/> bij een afstemming van ×0.1/×0.5/×2/×{ "10" }, waarbij NIS schaalt als ≈1/q_factor zoals afgeleid. Zichtbaar gemaakt als <c4/> in de JSON (JavaScript Object Notation) van het klokresultaat en in een kaart in de playground. De χ²-banden gebruiken het Wilson–Hilferty-kwantiel (<c5/>, gecontroleerd aan een tabel).

seg-078c4009b24f = Model voor tweewegs tijdoverdracht

seg-22f8cdeda335 = <c1/>: de reciproke gemeenschappelijke vertraging valt exact weg in de schatting <c2/> (met de hand afgeleid, exact) en twee eenwegsmetingen middelen tot <c3/> (gemiddeld over seeds); de niet-reciproke differentiële vertraging is een gekleurd proces van witte FM + random-walk-FM waarvan de Allan-deviatie <c4/> volgt (gemiddeld over seeds, ~{ "20" }%, via de eigen <c5/> van de verbinding). De <em>parameters</em> (per verbinding <c6/>, <c7/>) zijn representatieve TWSTFT/optische (TWSTFT: two-way satellite time and frequency transfer) cijfers, niet gefit aan een specifieke terminal.

seg-6ab219622143 = Beveiliging (score voor spoofdetectie)

seg-29dd10011ed1 = <c1/>: de 1-sigma-ondergrens van de monitor <c2/> en de daaruit volgende minimaal detecteerbare offset van <c3/> sigma en de score <c4/> zijn met de hand afgeleid en per unit getest. Het model (innovatie / klokondersteunde detectie in RAIM-stijl (RAIM: receiver autonomous integrity monitoring)) is deugdelijk; de <em>parameters</em> (bewakingsvenster <c5/>, detectiemultiplicator <c6/>, meetruis <c7/>) zijn representatief, niet gefit aan een specifieke ontvanger.

seg-ca51e4f1e19c = Detectie van spoofingaanvallen

seg-e991f5b2fdb2 = <c1/>: een oplopende valse-tijdspoof wordt gemarkeerd wanneer zijn offset de detectiegrens van de klok overschrijdt; de detectietijd komt tot op één rasterstap overeen met de met de hand afgeleide <c2/>, en een klok waarvan de grens de specificatie overschrijdt, laat de spoof de drempel ongemerkt bereiken. Dezelfde voorbehoud <c3/> als bij de score voor beveiliging.

seg-3d2f6d2b7722 = Flicker-FM (ondergrens)

seg-55697d598918 = <c1/> (standaard uit)

seg-55000870c060 = Gesynthetiseerd als een som van logaritmisch verdeelde Ornstein-Uhlenbeck-processen (OU) gekalibreerd op een instelbare vlakke ADEV-ondergrens; <c1/> toetst dat de ondergrens vlak is over de middelingstijd en op het ingestelde niveau ligt (gemiddeld over seeds). Per klok in te schakelen via <c2/>. De aangehaalde referentiescenario's laten het uit: de CSAC wordt over zijn datasheetbereik (1-1000 s) gedomineerd door witte FM en de systematische ondergrens van de optische klok (~{ "5e-17" }) wordt vertegenwoordigd door zijn nauwkeurigheidscijfer.

seg-e2e3de9a61a4 = Statistiek van het Monte-Carlo-ensemble

seg-9785d05ec5a7 = <c1/> (aggregatie)

seg-cc6c6bb5eb83 = <c1/>: percentielen volgens de dichtstbijzijnde rang en het gemiddelde over <c2/> reproduceerbare realisaties; één enkele run laat de spreiding instorten, de band per tijdstap is geordend <c3/>, en herhaalde runs zijn bitidentiek. Dit is statistische aggregatie over de al getoetste enkele run, geen nieuw fysisch model.

seg-72a9d5de61f5 = sigma_y({ "1" } s)

seg-ebbe708d9cbc = csac-sa45s (CSAC)

seg-c43fe67d4200 = Microchip SA65 / datasheet van de SA.45s

seg-e3bde4355d78 = optical-sr-lattice (Sr-rooster)

seg-87793f684233 = strontium optische roosterklok, doel gericht op de ruimte, arXiv:{ "1503.08457" }

seg-b03f5856d451 = Status: witte FM en random-walk-FM getoetst; veroudering gemodelleerd en eruit gekalibreerd; flicker-FM gemodelleerd en getoetst (standaard uit in de aangehaalde scenario's).

seg-c5ff448dcb88 = Maturiteit: de cijfers van de optische klok zijn het <em>doel gericht op de ruimte</em> op grondhardware -- er is nog nooit een optische strontiumklok gevlogen. Laboratorium-Sr-klokken halen { "4.8e-17" } (Oelker et al. { "2019" }, Nature Photonics). De cijfers van de CSAC komen van een commercieel onderdeel dat in gebruik is.

seg-b59a4b8e6d88 = Relaties: Riley, NIST SP { "1065" }, Eq. { "67" } -- witte FM sigma_y^{ "2" }(tau)=h0/({ "2" } tau); random-walk-FM sigma_y^{ "2" }(tau)=({ "2" } pi^2/3) h_-2 tau, gelijkwaardig aan q_rw*tau/3 voor een frequentie-Wienerproces met diffusie q_rw.

seg-dca7ee671d91 = Pack { "2" } — inertiële dead-reckoning (quantum inertiële meeteenheid)

seg-98452a081241 = Constante/resterende bias -> positie

seg-6aa386251acf = positiefout = { "0.5" }<em>b</em>T^{ "2" }-familie (Groves AESS (Aerospace and Electronic Systems Society) Tutorial); met de hand afgeleide discrete test in <c1/>.

seg-c60c0b54c485 = Velocity random walk (witte versnelling)

seg-7ce1f40566cf = <c1/>: de gesimuleerde standaarddeviatie (SD) van de positiefout komt overeen met sigma_x(T)=sqrt(S_a*T^3/3) (Groves vgl. 54) tot op ~{ "12" }% waargenomen (gemiddeld over seeds; afgedwongen drempel { "20" }%).

seg-8ac776795d40 = Natuurkunde van de koudeatoom-interferometer-versnellingsmeter (CAI) (vanuit eerste beginselen)

seg-4eafc81873ed = <c1/>: een koudeatoominterferometer van Mach-Zehnder met drie pulsen. Met de hand geverifieerd aan de geometrie uit het leerboek — Rb-87 <c2/>; <c3/> bij { "1" } g, <c4/>; projectieruis <c5/> bij <c6/>, <c7/>; per shot <c8/>; de schaalwetten <c9/> en <c10/>; exponentieel verval van het contrast. <c11/> <b>leidt</b> de PSD (power spectral density) van de witte versnelling af die de klassieke <c12/> verbruikt. Eerlijke reikwijdte: alleen de <b>ondergrens van quantumprojectieruis</b> (~{ "0.09" } ug/sqrtHz hier) — ver onder echte, door trillingen beperkte apparaten (1-50 ug/sqrtHz); de trillingstensor, Coriolis en systematische lichtverschuiving zijn nog niet gemodelleerd (zie <a1><c13/></a1>).

seg-ed78f40a8d80 = Gyrobias + angular random walk (ARW) -> kanteling -> koppeling met zwaartekracht

seg-a73e97ac4a0e = Een resterende gyrobias en ARW veroorzaken een standfout; de kanteling koppelt zwaartekracht (<c1/>) in de horizontale specifieke-krachtfout. <c2/> toetst de pure kubische positiegroei door bias exact en de groei van de standfout door ARW als een Wienerproces (gemiddeld over seeds). Per sensor in te schakelen via <c3/> en <c4/>; uit in de aangehaalde scenario's met alleen versnellingsmeters.

seg-5ad1e7d55d07 = <c1/>: een 1/f-flickerproces (dezelfde OU-synthese die voor de klok is getoetst) waarvan de vlakke ondergrens van de Allan-deviatie op de biasinstabiliteitscoëfficiënt ligt; nul is een no-op, een ondergrens ongelijk aan nul verandert het traject, beide reproduceerbaar. Per sensor in te schakelen via <c2/>.

seg-e68d093e952a = Biasinstabiliteit (1/f-flickerondergrens)

seg-b631c1bfce05 = Acceleration random walk (rate random walk)

seg-4a4a70363412 = <c1/>: de bias is een Wienerproces met <c2/>, gecontroleerd gemiddeld over seeds tot op ~{ "20" }%. Per sensor in te schakelen via <c3/>.

seg-49c4a2532dca = Kruisvalidatie met NaveGo (ruiscoëfficiënten van een IMU (inertiële meeteenheid))

seg-e558aa705560 = <c1/>: een externe kruiscontrole tegen <b>NaveGo</b> (R. Gonzalez, opensource-toolbox voor INS/GNSS (INS: inertial navigation system), <c2/>). Reproduceert de synthetische round trip van <c3/> van NaveGo op zijn <b>gepubliceerde referentieprofiel van de Microstrain 3DM-GX3-35</b>: onze overlappende ADEV-schatter (getoetst aan NBS14/Stable32) aansturen met witte sensorruis op de 1-σ-niveaus van NaveGo levert de coëfficiënten van velocity en angle random walk (VRW, ARW) (<c4/>) terug tot op <c5/> (werkelijk ~{ "0.4" }%), met de tak van witte ruis op de helling −1/2. Bevestigt dat onze Allan-keten en de definities van VRW/ARW van NaveGo overeenkomen. Het opgenomen STIM300-<c6/>-log van { "40" } MB wordt niet ingelezen (afhankelijk van het binaire formaat).

seg-171b215f0526 = Schaalfactor, fijnere kruisasstermen

seg-b690ed87f493 = <c1/> in dit pack met 1-DOF (één vrijheidsgraad)

seg-c1bd4e24c091 = Het oudere pack met één as heeft geen fout door schaalfactor of kruiskoppeling. De driassige strapdownbibliotheek en het pack <c1/> modelleren wel schaalfactor, misalignment, g-gevoeligheid, kwantisatie en rate ramp (<c2/>; zie de tabel met beweringen hieronder).

seg-ce2b3237acfe = biasstabiliteit

seg-129dc6af8f10 = ruis-wortel-PSD

seg-7109e60b8c9b = cold-atom-quat (quantum)

seg-5f5690d74918 = { "5.88e-7" } m/s^{ "2" } ({ "60" } ng, { "24" } h)

seg-8e83c799fb03 = { "22" } ug/sqrtHz = { "2.16e-4" } (m/s^{ "2" })/sqrtHz

seg-b52686064c43 = Templier et al. { "2022" }, Science Advances (arXiv:{ "2209.13209" })

seg-09b42bed82c9 = nav-grade-quartz (klassiek)

seg-fa9adbe58c2f = { "1.57e-3" } m/s^{ "2" } (~{ "160" } ug)

seg-63f64f576abc = ~{ "20" } ug/sqrtHz = { "1.96e-4" } (m/s^{ "2" })/sqrtHz

seg-8714c547449a = Honeywell QA-2000 / Groves AESS Tutorial

seg-79fc524162b5 = Eerlijke inkadering: het voordeel van koude atomen is <b>langetermijnbiasstabiliteit</b> (~2600x lager), die bij een lange GNSS-uitval domineert via { "0.5" }<em>b</em>T^{ "2" }. De kortetermijnruis is vergelijkbaar (quantum ~{ "22" } tegenover klassiek ~{ "20" } ug/sqrtHz) — de quantumsensor wint de marathon, niet de sprint. Maturiteit: versnellingsmeters met koude atomen zijn laboratorium-/vroeg, navigatiekwaliteit-kwarts is in gebruik (JRC122785).

seg-e02e93f4f30a = Pack { "3" } — tijdoverdracht (optisch tegenover radiofrequent (RF), optische verbinding tussen satellieten)

seg-2b87e5f0ba7e = Witte tijdjitter -> synchronisatienauwkeurigheid

seg-229295aa1f70 = <c1/>: de gesimuleerde synchronisatie-RMS reproduceert de verbindingsjitter sigma_j; het steekproefgemiddelde middelt als sigma/sqrt(N) tot op <{ "20" }% (gemiddeld over seeds).

seg-4325ec478bca = Tijdsynchronisatie -> eenwegs afstandsmeting

seg-aa7a1f463683 = afstand = c * dt, c={ "299792458" } m/s; { "1" } ps = { "0.299792458" } mm (exact, met de hand afgeleide test).

seg-7ad8bb95bf35 = Flicker/TDEV-ondergrens, residu van tweewegsreciprociteit

seg-5bf72778b6c2 = <c1/> (soort <c2/>): flickerfaseruis (Kasdin–Walter, vlakke TDEV), een dagelijkse niet-reciprociteit en een constant reciprociteitsresidu op de tweewegsreeks; het pack <c3/> met witte jitter is ongewijzigd.

seg-dae3fa0375fe = jitter van één sample

seg-4a141a45a8ff = bron

seg-ee136a1d0051 = { "1" } ps ({ "1e-12" } s)

seg-c78abd60ec97 = in een baan geloofwaardig doel

seg-9dfc1d4334a3 = optische verbinding tussen satellieten, synchronisatiedoel op picoseconde; laboratorium-O-TWTFT (TWTFT: two-way time and frequency transfer) ~{ "1" } fs (Giorgetta { "2013" } / Deschenes { "2016" })

seg-4f3d23d83190 = { "0.5" } ns ({ "5e-10" } s)

seg-0e730e8e2237 = gemeten, één sessie

seg-b9faad47d802 = TWSTFT van BIPM/PTB/NIST (BIPM: International Bureau of Weights and Measures; PTB: Physikalisch-Technische Bundesanstalt, het Duitse nationale metrologie-instituut)

seg-51e2e5782c96 = Eerlijke inkadering: het optische cijfer is een synchronisatiedoel op picosecondeniveau in een baan (niet gevlogen). De terrestrische optische laboratoriumondergrens is ~{ "1" } fs (veel beter); een goed ontworpen microgolfverbinding (de microgolfverbinding (MWL) van ACES (Atomic Clock Ensemble in Space), ~{ "0.3" } ps) kan met optisch wedijveren, dus de basislijn "RF = { "0.5" } ns" is specifiek gewone TWSTFT. De omzetting naar afstand is eenwegs (afstand = c<em>dt); tweewegs/heen-en-terug halveert dat (afstand = c</em>dt/2).

seg-5fa72f18f983 = Pack { "4" } — hybride fusie (sluitstuk)

seg-3de12b094504 = Voegt Pack { "1" } (klok), Pack { "2" } (inertie) en Pack { "3" } (tijdoverdracht) samen tot één PNT-suite (positiebepaling, navigatie en tijdsynchronisatie). De suite moet ZOWEL de tijdsynchronisatie (< specificatie voor tijdsynchronisatie) ALS de positie (< specificatie voor positie) binnen de grenzen houden; <c1/> is de tijd tot een van beide wordt overschreden. Optionele optische tijdoverdracht via een verbinding tussen satellieten (ISL) zet de klok tijdens de uitval opnieuw gelijk (alleen ondersteuning voor tijd — de positie wordt niet opnieuw gelijkgezet, want tijdoverdracht geeft tijd, geen positie).

seg-4f7cd8f86565 = Aspect

seg-19deb2a3537c = Gecombineerde PNT-scoring (tijdsynchronisatie EN positie)

seg-77a7595ffad7 = <c1/> met de hand afgeleide test van <c2/> (pnt_holdover = de eerste van tijdsynchronisatie/positie die de grens overschrijdt).

seg-d0e39bf123d8 = Integriteit + beveiliging voor het hybride pack

seg-3fb63eb2b6b8 = <c1/>: een Kalman-tijdsynchronisatieschatter die op de waarheid is gedisciplineerd (nominaal) en bij elke optische hersynchronisatie opnieuw wordt verankerd; Integrity is de insluiting binnen de beschermingsgrens (de grens omvat de jitterondergrens van de verbinding), Security de score voor spoofdetectie. Getest voor beide suites, inclusief het geval met ondersteuning door de verbinding.

seg-c3be96b7cb41 = Gezamenlijke fusieschatter

seg-e9d5448ea06c = <c1/>: één gezamenlijk Kalman-filter ([fase, frequentie] ⊕ [positie, snelheid]) is de navigator, gedisciplineerd door GNSS (dat de offsets leert uit een initiële covariantie ongelijk aan nul) en ondersteund door tijdoverdracht; de gezamenlijke covariantie geeft een gezamenlijke integriteit die als betrouwbaar is getest (≥{ "0.9" }) voor beide suites met ruisconsistente sensoren. Het pack neemt positie en tijd <b>afzonderlijk</b> waar, waarvoor het optimale filter blokdiagonaal is; schatting van een constante bias met uitgebreide toestand en dynamische kruisondersteuning zijn toekomstig werk.

seg-915ec766439f = Gekoppeld klok+positiefilter (kruisblokcovariantie)

seg-fd718a51859a = <c1/>: één gestapeld Kalman-filter <c2/> (updates in de vorm van Joseph) waarvan de <b>pseudorange</b>-meting <c3/> de positie- en klokblokken koppelt. Tests: een gedeelde pseudorange maakt <c4/> ongelijk aan nul (ontkoppelde filters houden die exact op { "0" }); twee verschillende geometrieën lossen samen geïnjecteerde positie- en klokoffsets op die één afstand niet kan scheiden; een positiebepaling met <b>alleen klok</b> scherpt de <b>positie</b> aan via de kruiscovariantie (de winst die koppeling geeft en ontkoppelde filters niet kunnen); en een Monte-Carlo-<b>NEES is χ²({ "4" })-consistent</b> (Bar-Shalom §{ "5.4" }, op runs gebaseerde band). 1-DOF (de dimensionaliteit van het pack); nog niet aangesloten op het uitvoerbare pack, en de 3-D-uitbreiding met 8 toestanden is toekomstig werk.

seg-31ecf062b941 = Samenstelling van getoetste submodellen

seg-9b849cb4fe8d = erft

seg-4e1c8b6791f3 = de termen voor klok/inertie/tijdoverdracht zijn in hun eigen packs getoetst.

seg-b672e5499976 = Losjes gekoppeld GNSS/INS (pack <c1/>)

seg-277425f2cbcf = <c1/>: een EKF met foutstatus en 15 toestanden (δp, δv, ψ, versnellings-/gyrobias; Groves §{ "14" }) stuurt de driassige strapdownnavigator aan met terugkoppeling. Tests: een geïnjecteerde positiefout wordt tot nul gebracht bij ondersteuning met perfecte waarheid; de ondersteunde oplossing blijft op meters begrensd terwijl een vrij lopende INS voorbij { "100" } m divergeert; en de gefuseerde positie-RMS over een uitval van { "60" } s verslaat onondersteunde dead-reckoning met de grens van de ensembletest (~{ "4" }× gemeten vóór { "0.27.3" }; de marge is groter na de onderstaande correctie). De gyrobiaskoppeling wordt gecontroleerd aan de strapdown zelf: een bekende resterende gyrobias moet de standfout produceren die het filter voorspelt (<c2/>), en een brede prior moet een gyrobias van de klasse van een vluchtcontroller leren terwijl hij begrensd blijft; beide falen met het teken van vóór 0.27.3. <b>Herzien in { "0.27.3" }:</b> die koppeling had het verkeerde teken, zodat schattingen van de gyrobias de verkeerde kant op duwden en alleen een strakke prior het pack stabiel hield; de gepubliceerde uitvalcijfers zijn gewijzigd (CHANGELOG, Fixed). Eerlijke grens: bij losse koppeling zijn versnellingsbias en kanteling slecht te scheiden, dus kalibratie per bias wordt niet geclaimd.

seg-1c9a9f76a432 = Strak gekoppeld GNSS/INS (pseudorange)

seg-b4ccc12229c4 = <c1/> + <c2/> <c3/>: de innovatie wordt gevormd in het afstandsdomein (zichtlijn-Jacobiaan op δp). Tests: vier satellieten brengen een geïnjecteerde horizontale fout van { "8" } m/−{ "5" } m tot nul op < { "0.1" } m; <b>twee satellieten</b> (geen positie-, snelheids- en tijdbepaling (PVT) mogelijk) verkleinen de horizontale fout nog steeds met > { "5" }×; één satelliet recht boven waarneemt alleen de component langs de zichtlijn (verticaal) en laat de horizontale ongemoeid; ongeldige invoer wordt geweigerd. Alleen pseudorange — draaggolffase en een expliciete toestand voor de ontvangerklok staan op de roadmap.

seg-240b681b6021 = Getrouwheid van kruisondersteuning tussen sensoren (volledige Kalman-/factorgrafenfusie)

seg-efe7e288276b = <c1/> in het pack <c2/>

seg-e5371874c57d = Het hybride pack is een samenstelling op systeemniveau + ondersteuning met tijd, geen optimale schatter. Filters bestaan elders: de losjes en strak gekoppelde EKF (extended Kalman filter) van het pack <c1/> (rijen hierboven) en de UKF (unscented Kalman filter) met 17 toestanden van de soort <c2/>. Er wordt geen factorgrafensmoother gemodelleerd.

seg-189758709fd2 = Resultaat: de volledige quantumsuite houdt volledige PNT vol door een uitval van { "1.8" } h; de volledig klassieke suite is <b>positiebeperkt</b> (de IMU van navigatiekwaliteit overschrijdt als eerste). Optische ISL-tijdoverdracht houdt zelfs de klassieke KLOK vergrendeld, waardoor de inertiële sensor de zwakke schakel van de klassieke suite wordt — het kernargument voor quantum-inertie en optische tijdsynchronisatie samen.

seg-a4c5b45ea8a5 = Geometrie — GNSS-beschikbaarheid uit banen

seg-d347bb63c1fd = Cirkelvormige tweelichamenpropagatie

seg-60c369fbbd97 = <c1/>: periode <c2/> (mu = { "3.986004418e14" }), de positie keert na één periode terug, vlakheid van evenaars-/poolbanen — met de hand afgeleide tests.

seg-1260a2fef95f = Excentrische (Kepler-)propagatie

seg-49df9d526f9c = <c1/>: de vergelijking van Kepler <c2/> opgelost met Newton (residu < { "1e-12" }); stralen in perigeum/apogeum <c3/>; het cirkelvormige geval komt overeen met het gesloten-vorm-pad tot op { "1e-9" }.

seg-958f03424508 = Seculiere J2-drift van knoop en apsiden

seg-336b9581c47c = <c1/>: <c2/>, <c3/> (Vallado); de knoop regresseert (prograde) / schuift op (retrograde) / staat stil (polair), en de apsiden bevriezen bij de kritieke inclinatie { "63.4" } deg — met de hand afgeleide teken-/nultests. Alleen tweelichamen + seculier, niet osculerend.

seg-dcba8d368326 = Zichtlijnzichtbaarheid (aardocclusie + elevatiemasker)

seg-2eee9a8f894b = Antipodale satelliet geoccludeerd, radiaal naar buiten gerichte satelliet op { "90" } graden elevatie, tangentiële satelliet op de horizon: exacte, met de hand afgeleide tests.

seg-f251c75eb367 = Zichtbaarheid -> GNSS-toestand -> tijdlijn

seg-70fbb9f3cc2b = <c1/> zichtbaar = nominaal, 1-3 gedegradeerd, { "0" } ontzegd; Walker-delta-generator; een integratietest stuurt een klok-holdover-run aan vanuit de afgeleide tijdlijn.

seg-988d3fedb7f5 = Optimalisatie van constellatieontwerp + streets-of-coverage-geometrie

seg-2a636487a4e6 = <c1/>: <c2/> doorzoekt het <c3/>-raster en geeft de cel terug die het best aan een <c4/> voldoet (minimaal aantal satellieten voor een dekkingsdoel / maximale dekking / minimale slechtste PDOP (PDOP: positionele verdunning van precisie)). Een test controleert dat de keuze gelijk is aan een onafhankelijke brute-force-scan van dezelfde sweep, en een uitgewerkt voorbeeld bevestigt dat een GPS-Walker-24/6/1-ontwerp (GPS: Global Positioning System) minstens even goed dekt als een uitgedunde variant met 18 satellieten. De analytische gesloten vormen voor <b>streets-of-coverage</b> (<c5/> <c6/>; <c7/> <c8/>, Rider/Beste) zijn met de hand geverifieerd aan de geometrie uit leerboeken (GPS bij een masker van { "5" }°: λ ≈ { "71.16" }°, halve straatbreedte bij 4 satellieten ≈ { "62.83" }°) en detecteren het gat bij te geringe bezetting (<c9/>). De volledige Rider-oplosser voor het minimale aantal satellieten bij <em>wereldwijde</em> dekking (het naadgevoelige aantal vlakken) is nog niet geïmplementeerd.

seg-a1c1364cc45a = Verdunning van precisie (GDOP/PDOP/HDOP/VDOP/TDOP (GDOP: geometrische verdunning van precisie; HDOP: horizontale verdunning van precisie; VDOP: verticale verdunning van precisie; TDOP: verdunning van precisie in tijd)) -> positienauwkeurigheid

seg-a1706d47f895 = <c1/>: <c2/> uit de zichtlijn-ontwerpmatrix. <b>Externe onafhankelijke referentie</b> (<c3/>): de vijf DOP-factoren reproduceren die van <b>gnss_lib_py { "1.0.4" }</b> (Stanford NAV Lab, een onafhankelijke, collegiaal getoetste GNSS-bibliotheek, hier gebruikt zoals ERFA (Essential Routines for Fundamental Astronomy) voor de referentiestelsels) over <b>{ "8" } geometrieën</b> van goed geconditioneerd tot bijna singulier (DOP in de honderden), tot op <b>{ "1e-6" }</b> relatief; herkomst + regeneratie in <c4/>. Als aanvullende controle met een gesloten vorm reproduceert een regelmatige tetraëdergeometrie de analytische DOP-waarden (PDOP { "1.5" }, TDOP { "0.5" }, GDOP √{ "2.5" }, HDOP √{ "1.5" }, VDOP √{ "0.75" }) tot op { "1e-9" }. Positiesigma = PDOP × gebruikersequivalente afstandsfout.

seg-504d5aa92cbc = Positiefout = σ_UERE × DOP voor de eigen kleinste-kwadratenpositiebepaling van de engine

seg-fc3443210358 = <c1/>, <c2/>: een geseede Monte Carlo (N = { "20,000" } epochs per geometrie, σ = { "1.5" } m, ChaCha8-seed { "36" } + i) van <c3/> met eenheidsgewichten, opgelost vanuit de ware positie, op de <b>{ "8" } geometrieën van <c4/></b> (die waarvan de DOP is afgestemd op gnss_lib_py), tegenover σ²·Q, waarbij Q de covariantiefactor is van de <c5/>-kernel zelf (<c6/>, dezelfde rekenkunde). <b>Tolerantiegrenzen vooraf vastgelegd</b> (commit e50c88d2, vóór de eerste run, volgens de ontwerpnotitie over de { "0.36" }-geometrie, sectie { "5.2" }), elk uitgedrukt in een aantal standaardfouten: oost-, noord-, omhoog- en klokvarianties binnen { "5" } %; H/V/P-RMS binnen { "2.5" } %; oost-noordcorrelatie binnen { "0.035" }; gemiddelden binnen { "5" } standaardfouten; de fractie binnen de horizontale { "95" } %-ellips binnen { "0.95" } ± { "0.0077" }. Eerste run: alle { "104" } controles slagen (slechtste variantie { "3.2" } %, RMS { "1.6" } %, correlatie { "0.012" }, gemiddelde { "2.2" } standaardfouten, ellips { "0.0039" }). <b>Negatieve controles</b> falen zoals vereist: een verdubbelde PDOP faalt bij elke geometrie; fouten die groeien als 1/sin(elevatie) tegenover de ongewogen Q falen op een variantiecontrole bij elke geometrie waarvan de laagste satelliet onder { "20" }° staat. <b>Hoe dit aansluit op de rij hierboven:</b> die rij toetst de DOP van deze geometrieën aan gnss_lib_py; deze voegt de stap toe van die factoren naar meters via de solver van de engine. <b>Een eerste, afzonderlijke controle staat ernaast</b> (<c7/>, <c8/>, uitgevoerd vóór de preregistratie en ook zo gerapporteerd): vier met de hand gekozen luchten (open, gegroepeerd, canyon, halve hemel; σ { "1" } m) met chikwadraat-betrouwbaarheidsintervallen op { "1e-6" } in totaal over { "20" } controles; verhoudingen { "0.987" } tot { "1.009" }, en eigen negatieve controles (een DOP-fout van { "10" } %, 1/sin(elevatie)-fouten) falen zoals vereist. <b>Waarom MODELLED:</b> geen externe dataset; het toont niet aan dat de fout van een echte ontvanger het model volgt, en σ_UERE is een invoer.

seg-94bffbd8385b = Beschikbaarheid met meerdere constellaties

seg-a40eab03bbbe = <c1/>: extra <c2/> worden samengevoegd tot één satellietenset voor zichtbaarheid/DOP; een test met het gecombineerde aantal bevestigt de vereniging.

seg-0b905100d91c = Uitgezonden ionosfeer (Klobuchar, IS-GPS-200 (IS: Interface Specification)) → L1-schuine vertraging

seg-05e278f04770 = <c1/>: <c2/>, het uitgezonden eenfrequentiemodel met acht coëfficiënten. <b>Externe onafhankelijke referentie</b> (<c3/>): de schuine L1-vertraging reproduceert <b><c4/> van RTKLIB (een opensource-bibliotheek voor real-time kinematische positiebepaling)</b> (tomojitakasu/RTKLIB, <c5/>, de feitelijke open GNSS-referentie, uit de broncode gecompileerd en onafhankelijk uitgevoerd) over <b>{ "10" } gevallen</b> die elevatie, azimut, lokale tijd en twee coëfficiëntensets bestrijken (de standaardset van kshana + die van RTKLIB), tot op <b>< { "1e-4" } m</b>. De IONEX-lezer (IONosphere map EXchange format) voor TEC-kaarten (TEC: totale elektronendichtheid) in GIM-bestanden (global ionosphere map) bestaat nu (<c6/>, <c7/> met bilineaire ruimtelijke en temporele interpolatie en een schuine afbeelding, in de crate zelf unit-getest); een controle van die interpolatie tegen een echt GIM-product van CODE (Center for Orbit Determination in Europe) is nog een vervolgstap. Het uitgezonden model zelf is extern getoetst.

seg-39e235557ecc = RAIM/ARAIM-detectiekernel (ARAIM: advanced receiver autonomous integrity monitoring) (χ² / niet-centrale χ² / normaal) → drempels en vermenigvuldigers

seg-8906f922b9b9 = <c1/>: de detectiedrempel voor snapshot / oplossingsscheiding / ARAIM (<c2/>), de niet-centraliteit bij gemiste detectie <c3/> (<c4/>) en de K_fa/K_md/K_V-vermenigvuldigers (<c5/>) worden allemaal berekend uit een afhankelijkheidsvrije geregulariseerde onvolledige gammafunctie. <b>Externe onafhankelijke referentie</b> (<c6/>): <b>{ "171" } gevallen</b> reproduceren <b>SciPy { "1.17.0" }</b> (<c7/>/<c8/>/<c9/> + <c10/>, een onafhankelijke Cephes/Boost-implementatie, een ander algoritme) over de bedrijfsbereiken van P_fa / P_md / redundantie, tot op <b>≤ { "1e-6" } relatief</b>. De geometrie rond de kernel (de helling/covariantie uit <c11/>) is de aan gnss_lib_py getoetste DOP-kernel. <b>Reikwijdte:</b> deze rij legt de <em>statistische kernel</em> vast. De <em>waarde</em> van het beschermingsniveau van de ARAIM-MHSS-toewijzing (MHSS: multiple-hypothesis solution separation) is afzonderlijk vastgelegd tegenover het gepubliceerde uitgewerkte voorbeeld van de ARAIM Technical Subgroup van WG-C (Working Group C) (<c12/>, VPL (verticaal beschermingsniveau) { "18.2926" } m tegenover { "18.3" } m, HPL (horizontaal beschermingsniveau) { "13.4063" } m tegenover { "13.45" } m, binnen de eigen tolerantie van { "0.05" } m van de referentie; zie de standaardennotitie hieronder en <a1><c13/></a1>).

seg-b17f1501a267 = SBAS-beschermingsniveau (SBAS: satellite-based augmentation system) (DO-229E Appendix J) → horizontaal / verticaal beschermingsniveau (HPL / VPL)

seg-abe00b67e4cb = <c1/>: <c2/>, de gewogen kleinste-kwadraten- (LS: least squares) <c3/> → hoofdas van de horizontale foutellips + verticale σ, geschaald met de K-factoren van DO-229E. <b>Externe onafhankelijke referentie</b> (<c4/>): de HPL van kshana reproduceert de <b>RTKLIB SBAS-PL-fork</b> (<c5/> <c6/>, de implementatie van Siki & Takács { "2017" } van "DO-229D Appendix J"), uitgevoerd met <c7/> op <b>echte EGNOS-gegevens (European Geostationary Navigation Overlay Service)</b> (uitgezonden GEO-berichten (geostationaire baan) van PRN120 + echte BUTE/Boedapest-RINEX (Receiver Independent Exchange Format), 2017-02-19), over <b>{ "6" } epochs</b> tot op <b>< { "2e-3" } m</b>. De σ per satelliet is het volledige SBAS-budget van de referentie zelf (UDRE (user differential range error) + GIVE (grid ionospheric vertical error) ionosfeer + troposfeer + vliegtuigboord). ESA gLAB { "v6.0.0" } (<c8/>) is gecompileerd en bleek dezelfde conventie te gebruiken. <b>Opmerking over K_V:</b> beide referenties ronden de MOPS-waarde (minimum operational performance standards) K_V af op { "5.33" }; kshana gebruikt de exacte <c9/> (~{ "0.06" } % kleinere VPL), dus het verticale wordt getoetst als de K-factorvrije <c10/> (= VPL van de referentie / { "5.33" }). De HPL wordt rechtstreeks gematcht (K_H = { "6.0" } aan beide kanten).

seg-fd16d642cafd = Echte constellatiegeometrie uit TLE's (regel 2 / Kepler)

seg-1311ef1cb4bb = <c1/> (parsing)

seg-5117debbce89 = <c1/>: leest de gemiddelde Kepler-elementen van regel 2 in (halve lange as uit de gemiddelde beweging); een bekende elementenset van het ISS (International Space Station) wordt heen en terug omgezet naar de juiste elementen en omlooptijd. Voor een blok met alleen regel 2 is de propagatie de tweelichamenpropagatie van de engine (+ optioneel J2) van de <em>gemiddelde</em> elementen: deugdelijk voor een momentopname vanuit een gemeenschappelijke epoch, maar na verloop van tijd afwijkend van SGP4 (Simplified General Perturbations { "4" }).

seg-26d22e76e28d = SGP4 / SDP4-propagatie (Simplified Deep-space Perturbations { "4" }) (volledige TLE's)

seg-1099f1bffa01 = <c1/>: volledige SGP4 voor nabij de aarde + SDP4 voor de diepe ruimte (lunisolaire seculiere/periodieke termen + { "12" } h / { "24" } h geopotentiaalresonantie). Getoetst in <c2/> aan de officiële vectoren van AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 ("Revisiting Spacetrack Report #3"): alle { "666" } referentietoestanden (nabij de aarde, diepe ruimte, resonant, foutcodegevallen) komen overeen met een positiefout in het slechtste geval van ≈ { "4.1" } mm. Een volledige tweeregelige set (regel { "1" } + regel { "2" }) wordt met SGP4 gepropageerd; alleen regel 2 blijft Kepler; beide kunnen gemengd worden. Het frame is TEME (true equator, mean equinox), consequent gebruikt voor de gebruiker en de satellieten (geen TEME→ECEF-reductie (ECEF: Earth-centred, Earth-fixed), toereikend voor beschikbaarheids-/DOP-geometrie).

seg-c8fc6a49d249 = IAU-nutatie (International Astronomical Union) 2000A / 2000B + TEME→GCRS-reductie (GCRS: Geocentric Celestial Reference System)

seg-b31c49596100 = <c1/>: de <b>volledige IAU 2000A</b>-reeks ({ "678" } lunisolaire + { "687" } planetaire termen, <c2/>) en de 77-termen-afkapping 2000B (<c3/>) zijn elk <b>bit voor bit</b> getoetst aan de gepubliceerde SOFA/ERFA-referentievectoren (SOFA: Standards of Fundamental Astronomy) bij JD_TT { "2453736.5" }: <c4/> geeft Δψ = −{ "0.9630909107115518e-5" }, Δε = { "0.4063239174001679e-4" }; <c5/> geeft Δψ = −{ "0.9632552291148363e-5" }, Δε = { "0.4063197106621160e-4" }; beide tot op <b>{ "1e-13" } rad</b>. De 2000A-tabel is machinaal gegenereerd uit de ERFA-bron <c6/> met <c7/> (reproduceert de vastgelegde <c8/> bit voor bit). De nutatiematrix (<c9/>), de vergelijking van de equinoxen en de volledige keten TEME→TOD→MOD→GCRS (TOD: true of date; MOD: mean of date) (<c10/>, Vallado AIAA-2006-6980) zijn getest op eigenschappen van eigenlijke rotatie, heen-en-terugomzetting en precessie plus nutatie, de nutatiematrix tegenover ERFA <c11/> element voor element tot op { "1e-14" }, en de hele TEME→GCRS-keten tegenover het gepubliceerde TEME→GCRF-voorbeeld van Vallado (AIAA 2006-6753, 2004-04-06) tot op <b>{ "0.11" } m</b> (<c12/>); totdat die eind-tot-eindcontrole werd toegevoegd, had de nutatiematrix Δψ met het verkeerde teken, een draai van { "2" }·Δψ (ongeveer { "25" }″) die de eigenschapstests niet konden zien (zie CHANGELOG, Unreleased, Fixed); 2000A en 2000B komen overeen binnen < { "1" } mas, zoals vereist. De keten is gebaseerd op equinox/GMST (GMST: Greenwich mean sidereal time); de equinoxvrije CIO-reductie (X,Y,s) en de onafhankelijke numerieke ANISE/SPICE-controle ervan (ANISE: Attitude, Navigation, Instrument, Spacecraft, Ephemeris, een planetaire-geometrietoolkit in puur Rust; SPICE: Spacecraft, Planet, Instrument, C-matrix, Events) (≤ { "3.6" } m op GNSS-baanhoogte, ruim binnen het doel van < { "10" } m) staan in de CIO-rij hieronder.

seg-0be3c40cc81a = IGRF-14 (IGRF: International Geomagnetic Reference Field) geomagnetisch hoofdveldmodel

seg-9dbb3b1b18a1 = <c1/>: het Schmidt-genormaliseerde veld in bolfuncties van IAGA (International Association of Geomagnetism and Aeronomy) (graad/orde { "13" }, { "2025.0" } + seculiere variatie; coëfficiënten machinaal gegenereerd uit het officiële <c2/> met <c3/>, waarmee <c4/> bit voor bit wordt gereproduceerd). Getoetst op vijf onafhankelijke fronten: ({ "1" }) exacte steekproefcontroles van coëfficiënten tegenover het IAGA-bestand (g₁⁰=−{ "29350.0" }, g₁¹=−{ "1410.3" }, h₁¹={ "4545.5" } nT); ({ "2" }) de synthese van graad 1 reproduceert het <b>exacte, in gesloten vorm gegeven veld van de gekantelde dipool</b> <c5/> tot op { "1e-6" }; ({ "3" }) het <b>volledige analytische veld van graad 13 is gelijk aan −∇V</b> van de scalaire potentiaal (eindige differenties, tot op { "1e-4" }), waarmee de Legendre-afgeleiden en de 1/sinθ-term van begin tot eind worden beproefd; ({ "4" }) de dipoolas reproduceert de bekende <b>geomagnetische noordpool</b> (~{ "80.7" }°N, −{ "72.7" }°E) en de <b>dipoolsterkte</b> (~{ "29.7" } µT), en het wereldwijde veld ligt in de fysische band van { "22" }–{ "67" } µT met het juiste inclinatieteken per halfrond; en ({ "5" }) <b>externe onafhankelijke referentie</b>: de volledige synthese reproduceert de waarden van de officiële <b>IGRF-14-webservice van de British Geological Survey</b> bij { "2025.0" } (geodetisch, WGS-84-hoogte (WGS: World Geodetic System)) tot op <b>< { "2" } nT</b> voor X/Y/Z/F en <c6/> voor D/I op vier punten, waaronder { "400" } km hoogte (<c7/>).

seg-c1027d5ffc44 = Op CIO gebaseerde IAU 2006/2000A GCRS↔ITRS-reductie (ITRS: International Terrestrial Reference System)

seg-aad81285e8cf = <c1/>: de equinoxvrije keten van hemels naar terrestrisch. De CIP-coördinaten (Celestial Intermediate Pole) <c2/> en de 66-termen-reeks van de CIO-locator <c3/> zijn <b>bit voor bit</b> getoetst aan de gepubliceerde SOFA/ERFA-vector <c4/> bij JD_TT { "2453736.5" }: X={ "0.5791308482835292617e-3" } ({ "1e-14" }), Y={ "0.4020580099454020310e-4" } ({ "1e-15" }), s=-0.1220032294164579896e-7 ({ "1e-18" }); de GCRS→CIRS-matrix (CIRS: Celestial Intermediate Reference System) tegenover <c5/> (alle negen elementen tot op { "1e-12" }); de aardrotatiehoek (ERA) tegenover <c6/> = { "0.4022837240028158102" } ({ "1e-12" }). De <c7/>-tabel is machinaal gegenereerd uit de ERFA-referentie <c8/> met <c9/> (reproduceert <c10/> bit voor bit). De volledige <c11/> (CIO <c12/> = poolbeweging · ERA · GCRS→CIRS) is getest op eigenlijke rotatie + heen-en-terugomzetting, en blijkt consistent met de oudere TEME-reductie op basis van equinox/GMST-1982 binnen { "1" } m op een straal van { "7 000" } km (de conventies verschillen daar ongeveer { "5" } cm). <b>Onafhankelijke controle door een derde partij (<c13/>):</b> dezelfde <c14/> wordt vergeleken met <b>ANISE</b> (de herimplementatie van NAIF/SPICE in puur Rust (NAIF: Navigation and Ancillary Information Facility)) die GCRF→ITRF93 roteert (GCRF: Geocentric Celestial Reference Frame; ITRF93: International Terrestrial Reference Frame { "1993" }) uit <c15/> van JPL (Jet Propulsion Laboratory), waarbij <b>identieke aardoriëntatieparameters van IERS (International Earth Rotation and Reference Systems Service) <c16/> aan beide kanten worden ingevoerd</b>, over acht driemaandelijkse epochs van { "2020" }–{ "2023" }. De twee onafhankelijke realisaties van het frame komen overeen tot op een <b>maximale relatieve rotatie van { "0.028" }″, ≤ { "0.86" } m op de grond, ≤ { "0.93" } m in LEO (lage aardbaan), ≤ { "3.6" } m op GNSS-baanhoogte</b> (gemiddelde hoek { "0.023" }″). Dit is de ROADMAP-controle van het frame "< { "10" } m", <b>geleverd</b>; het residu is het verwachte modelverschil/datumverschil tussen ITRF93 en IERS-2010-CIO, geen defect (het bit-voor-bit-anker blijven de SOFA/ERFA-vectoren hierboven). ANISE is een crate onder MPL-2.0 (MPL: Mozilla Public License) / edition-2024, dus de controle zit in een zelfstandige subcrate die buiten de workspace valt en nooit de afhankelijkheidsgraaf van de gepubliceerde <c17/> of een standaard-CI-poort raakt.

seg-fa5889f379d2 = Heen-en-terugexport van SP3 (Standard Product { "3" }, het formaat voor nauwkeurige banen) (constellatie → SP3-c → opnieuw inlezen)

seg-cd53434eba3a = <c1/>: de echte momentopname <c2/> van Celestrak ({ "30" } GPS-satellieten) wordt met SGP4 gepropageerd, geëxporteerd naar SP3-c (<c3/> → <c4/>), opnieuw ingelezen (<c5/>), en de teruggewonnen ECEF-posities worden op elke epoch over { "24" } h vergeleken met de SGP4-referentie: slechtste residu <b>< { "0.5" } m</b> (de millimeterserialisatie van de schrijver; de tolerantie van { "10" } m op TLE-niveau (TLE: two-line element set) van de mijlpaal wordt met ruime marge gehaald). Ook het pad <c6/> van de CLI (command-line interface) is gedekt: het meegeleverde baanscenario exporteert een opnieuw inleesbare SP3 met 30 satellieten, en een scenario zonder baan wordt geweigerd.

seg-fa5ee52e59aa = Echte GPS-constellatiegeometrie uit TLE's (SGP4 → ECEF)

seg-1329a53ca94c = <c1/>: een echte <b>momentopname <c2/> van Celestrak</b> (2021-07-28, { "30" } operationele GPS-satellieten; herkomst in <c3/>) wordt ingelezen en elke satelliet wordt via de getoetste SGP4-kern naar een gemeenschappelijk tijdstip gepropageerd en van TEME naar ECEF geroteerd. Er wordt gecontroleerd dat de volledige constellatie binnen { "1" }% op de GPS-MEO-schil (medium Earth orbit) ligt en dat vanaf een locatie op middelste breedte met open hemel de echte situatie met alles in zicht (negen satellieten) een PDOP van { "1.64" } oplevert, waarbij de verticale verdunning groter is dan de horizontale (zoals voor een grondgebruiker moet). Dit beproeft SGP4 op een echte constellatie, naast de echte-gegevenspaden voor SP3 (nauwkeurig) en RINEX (uitgezonden).

seg-a1b7d74bbe02 = SGP4-Walker-generator met gemiddelde elementen

seg-01f1635b75e4 = <c1/>: een ontworpen Walker-delta-patroon wordt uitgegeven als gemiddelde SGP4-elementen (Kozai-gemiddelde beweging gekozen zodat de halve lange as van SGP4 op de doelschil uitkomt) en gepropageerd via de getoetste kern. Tests: een Walker met 24 satellieten, vergelijkbaar met GPS, ligt binnen { "1" }% op de MEO-schil, de vlakken liggen precies { "90" }° uit elkaar in RAAN (right ascension of the ascending node), teruggewonnen uit de baannormalen, en de gemiddelde beweging reproduceert de omlooptijd van de GPS-schil van ~{ "718" } min.

seg-6e8c472ec9fa = PDOP-sweep van de constellatie + kwaliteitsmaten voor dekking/revisit (FoM: figures of merit)

seg-dcdbf9c78ca5 = <c1/> (monotonie)

seg-5a70f090db45 = <c1/>: <c2/> zet dekking en mediane/slechtste PDOP in een tabel over een <c3/>-raster; <c4/> rapporteert de dekkingsfractie en de revisit-gaten op een grondpunt. Getoetst aan de fysieke monotonieën waaraan een ontwerpafweging moet voldoen: het toevoegen van satellieten verlaagt de dekking nooit en verlaagt de mediane PDOP strikt (een volledig ontwerp met 24 satellieten dekt continu bij een PDOP van ~{ "1.7" }), en het verdichten van een uitgedunde constellatie verkleint het slechtste revisit-gat strikt. Het gemiddelde revisit-gat is nooit groter dan het maximum. Dit zijn tabellen voor geometrische afwegingen, geen gecertificeerd link-/dekkingsbudget.

seg-9f0747d71ecc = Eerlijke kadrering: dit is een deterministische geometrielaag (cirkelvormige banen, bolvormige aarde met gemiddelde straal { "6371" } km, zuivere zichtlijn). Ze stelt de <em>beschikbaarheid</em> en de <em>geometrische</em> positienauwkeurigheid (verdunning van precisie × een representatief budget voor afstandsfouten) vast uit echte geometrie, geen navigatieoplossing met nauwkeurige efemeride. De referentie <c1/> plaatst een ruimtevaartuig binnen de GNSS-schil: het houdt slechts ~{ "59" }% van de dag een positiebepaling vast, de kwantumklok houdt door elk gat heen een tijdsynchronisatieoplossing van { "5" } ns aan (beschikbaarheid { "1.0" }), terwijl de chipschaalklok ~{ "0.73" } haalt.

seg-e2c433c35ba8 = Numerieke (Cowell-)propagator en krachtenmodel

seg-20ace4e0a710 = De numerieke propagator (<c1/>) integreert een hiërarchisch krachtenmodel (<c2/>) met de adaptieve integratoren (<c3/>). Elke term hieronder is getoetst aan analytische waarheid of aan een met de hand afgeleide gesloten vorm; de verstoringen staan <b>standaard uit</b>, zodat de vrijgegeven golden-bestanden onaangetast blijven. Het samengestelde model is ook gecontroleerd tegen een ander hulpmiddel: <c4/> voert { "11" } LEO- en GTO-gevallen (geostationaire transferbaan) uit, { "275" } uurlijkse epochs, tegenover de DormandPrince853-propagator van Orekit { "12.2" }, en de conservatieve lagen (tweelichamen → J2–J6 → zon/maan → kogelvormige SRP) komen overeen tot op ten hoogste { "0.08" } m over { "24" } h (VALIDATED in de matrix); de weerstandslaag is alleen gekarakteriseerd ({ "333" } m) en blijft MODELLED.

seg-ec74e57ff801 = Cowell-propagator tegenover analytische Kepler-waarheid

seg-8d773778ff0e = <c1/>: de ongestoorde (tweelichamen-)baan reproduceert de <b>exacte Kepler-oplossing met universele variabelen tot op submeterniveau over een LEO-baan van { "24" } h</b> (een strengere poort dan "tegenover een numerieke referentie < { "10" } m"); specifieke energie en impulsmoment blijven behouden tot ~{ "1e-9" } relatief; de nodale regressie door J2 reproduceert de gesloten vorm <c2/> tot op de eerste-ordetheorie (binnen { "2" } %, het residu van orde O(J2²)). <c3/> geeft <c4/> terug in plaats van een stilzwijgend onjuist antwoord wanneer Newton niet convergeert (nabij perigeum e = { "0.999" }). De robuuste <c5/> (starter van Markley { "1995" }, <c6/>) convergeert daar en over { "0" } ≤ e ≤ { "0.999999" }, binnen { "0.9" } ε·|E| van 50-cijferige mpmath-wortels (<c7/>).

seg-549d15780f79 = Adaptieve integratoren (RK4 (Runge–Kutta van de vierde orde) met stapverdubbeling + het ingebedde paar Dormand–Prince RK5({ "4" }), hieronder DP5({ "4" }))

seg-1fcc7553c627 = <c1/>: RK4 integreert <c2/> tot op < { "1e-9" }, toont de daling van de fout met ~{ "16" }× per gehalveerde stap (convergentie van de vierde orde) en behoudt de harmonische oscillator over een periode. De ingebedde foutschatting van DP5({ "4" }) is <b>O(h⁵)</b> (het halveren van de stap verkleint haar met ~{ "32" }×), integreert de oscillator over { "50" } perioden met behoud van energie tot op < { "1e-6" }, en bereikt hetzelfde eindpunt bij dezelfde tolerantie met <b>minder functie-evaluaties</b> dan stapverdubbeling; <c3/> haalt dezelfde Kepler-poort op submeterniveau en komt overeen met het RK4-pad tot op < { "1" } m op een J2..J6-baan. <b>DOP853</b> (<c4/>): het paar { "8" }({ "5,3" }) van Hairer met dichte uitvoer reproduceert de DOP853 van SciPy { "1.18.1" } stap voor stap (enkele stap binnen { "5.6e-15" }; identieke aantallen stappen bij de runs met e = { "0.7" } en Arenstorf, één wissel tussen accepteren en verwerpen in { "501" } stappen bij de LEO-run; eindtoestanden binnen { "1.6e-12" }) en komt even dicht bij de exacte Kepler-oplossing als SciPy (<c5/>).

seg-345ae1eb05ec = Zonaal harmonisch veld J2–J6

seg-a88e67186e69 = <c1/>: <c2/> wordt op drie manieren gecontroleerd: het <b>reduceert tot op machineprecisie tot de aan 666 vectoren getoetste <c3/></b> wanneer het wordt beperkt tot <c4/>; het <b>komt overeen met de numerieke gradiënt van zijn eigen zonale potentiaal</b> door het volledige J2..J6-veld (de gouden standaard voor conservatieve velden); en de oneven <c5/> tegenover de even <c6/>/<c7/>-termen tonen de kenmerkende noord–zuid-(anti)symmetrie onder <c8/>. Een gepropageerde J2..J6-baan behoudt de totale energie tot ~{ "1e-8" } over een dag.

seg-5536986d9c8f = Zwaartekracht van derde lichamen (zon en maan)

seg-04388d03e696 = <c1/> + <c2/>: <c3/> <b>komt overeen met de exacte gradiënt van zijn verstorende potentiaal</b>, verdwijnt in het geocentrum en haalt de leerboekgroottes voor LEO (~{ "5e-7" } m/s² zon, ~{ "1.1e-6" } m/s² maan). De zonne-efemeride van Montenbruck–Gill met lage precisie haalt met de hand afgeleide J2000-ankers (periheliumafstand ≈ { "1.471e11" } m, ~−{ "23" }° declinatie bij zonnewende, ~{ "1" }°/dag beweging); de maanefemeride blijft binnen haar perigeum-/apogeumomhulling, herstelt de gemiddelde afstand van ~{ "384 400" } km, overschrijdt de inclinatie van { "5.3" }° nooit en keert na één siderische maand terug tot binnen { "1" }°. De van de epoch afhankelijke bedrading van het rechterlid (RHS: right-hand side) is <b>bit-exact</b> (de RHS-term is gelijk aan <c4/> op de bemonsterde positie bij t = { "0" } en t = { "1" } dag), en een verschuiving van de epoch met een kwart jaar levert een ander traject op.

seg-9c8756f9d534 = Zonnestralingsdruk (SRP) + conische schaduw

seg-e6110e015204 = <c1/>: <c2/> (kogelmodel <c3/>) is <b>bit-identiek</b> aan de gesloten vorm in volle zon, legt de <b>stralingsdruk op 1 AU (AU: astronomische eenheid) vast op ≈ { "4.5398e-6" } N/m²</b>, ligt in de band van ~{ "1.36e-7" } m/s² voor LEO met een duw van de zon af, wordt een kwart wanneer de afstand tot de zon verdubbelt (omgekeerd kwadratisch) en is <b>exact nul</b> diep in de umbra. <c4/> geeft <c5/> in volle zon en <c6/> in totale umbra (exact), met een vloeiende monotone penumbra die van { "0" } → { "1" } stijgt over de band <c7/> die <b>zich uitstrekt voorbij de umbrale cilinder</b>.

seg-17b48db4038b = Atmosferische weerstand (eerste snelheidsafhankelijke term)

seg-4e6c2d0fff55 = <c1/>: <c2/> (Vallado Table 8-4, stuksgewijs exponentieel) <b>verankert op { "1.225" } kg/m³ op zeeniveau</b>, begrenst onder het oppervlak, neemt monotoon af door LEO, ligt in de band van ~{ "1e-12" } kg/m³ op { "400" } km met een fysisch teruggevonden schaalhoogte van ~{ "58" } km; <c3/> werkt de meeroterende relatieve snelheid tegen op de grootte van ~{ "2e-6" } m/s² voor LEO. De kenmerkende controle: een baan van { "300" } km verliest <b>monotoon</b> specifieke energie en haar halve lange as neemt met een begrensde ~km/dag af, terwijl de basislijn met vacuüm de energie behoudt tot < { "1e-9" }.

seg-133eed361425 = Post-Newtoniaanse (Schwarzschild-)relativistische correctie

seg-c8e26480f148 = <c1/>: <c2/> (IERS <c3/>-vorm <c4/>) valt bij een cirkelvormige baan samen tot de gesloten vorm <c5/> (radiaal, <b>naar buiten</b>, componenten buiten de as exact nul), toont de leerboekverhouding van <b><c6/> tot tweelichamen in LEO</b>, komt overeen met de met de hand vereenvoudigde vorm met radiale snelheid <c7/> tot < { "1e-12" }, en <b>verstoort in de propagator de baan terwijl de halve lange as binnen een meter/dag blijft</b>: het conservatieve tegenovergestelde van het verval door weerstand.

seg-d39e75019595 = Eerlijke reikwijdte: de vrijgegeven standaardwaarden van <c1/> integreren het zonale veld. Het <b>tesserale</b> EGM2008-veld van hoge graad (<c2/>, graad/orde { "70" }), de vaste-aarde-, oceaan- en atmosferische <b>getijden</b> (<c3/>) en de <b>Lense–Thirring</b>-term voor frame-dragging zijn nu geïmplementeerd en samengevoegd in het krachtenmodel voor het fitten van een nauwkeurige efemeride (<c4/>, zie hieronder). Het tesserale veld is ook een optionele term van het Cowell-<c5/> (<c6/>, standaard uit), getoetst aan Orekit { "12.2" } <c7/> tot graad/orde { "70" } ({ "6" } gevallen over { "24" } h, slechtste |Δr| { "0.036" } m; <c8/>). Er bestaan twee veldevaluatoren: de historische <c9/> (sferische partiële afgeleiden; geldig tot graad ~{ "180" } weg van de polen; uitvoer vastgelegd) en <c10/> (gemodificeerde voorwaartse kolom van Holmes–Featherstone { "2002" }, gradiënt zonder 1/cos φ; geldig tot graad { "2190" } op elke breedte). EGM2008 tot { "2190" } wordt tijdens de run geladen (<c11/>, <c12/>, niet meegeleverd). <c13/> komt overeen met Orekit { "12.2" } tot { "7.3e-17" } m/s² op acht punten tot en met graad { "2190" }; het blijft MODELLED omdat pyshtools de vooraf vastgelegde drempel nabij de pool miste (een mpmath-controle legt de fout bij pyshtools; <c14/>). Een baan van { "24" } h { "200" }×{ "200" } komt overeen met Orekit tot { "0.13" } m, maar de vooraf vastgelegde gevoeligheidscontrole voor graad 70 werd gemist ({ "0.73" } m < { "1" } m), zodat de graden { "71" }–{ "200" } in de baan slechts zijn gekarakteriseerd en niet getoetst (<c15/>). De thermosferische dichtheid van NRLMSISE-00 (NRLMSISE: Naval Research Laboratory Mass Spectrometer and Incoherent Scatter Radar Extended atmosphere model) is overgezet (<c16/>: bit-identiek aan de C-port in het publieke domein op { "720" } punten, binnen { "1.9e-6" } relatief van pymsis, de { "17" } gepubliceerde testgevallen gereproduceerd; <c17/>) en is een optionele laag voor weerstandsdichtheid (<c18/>, <c19/>; de standaard blijft het statische Vallado-model). Dit toetst de port, niet de nauwkeurigheid van het model tegenover gemeten dichtheid. De zon en maan van DE440 (DE: Development Ephemeris) vormen een optionele efemeridelaag (<c20/>). De schaduw van SRP bij een afgeplatte aarde volgens WGS-84 is optioneel (<c21/>) en komt overeen met de verlichtingsverhouding van Orekit { "12.2" } binnen { "7.4e-9" } over { "2400" } geometrieën (<c22/>); de variant met randverduistering heeft geen externe onafhankelijke referentie (MODELLED). De weerstandslaag van NRLMSISE-00 komt overeen met de eigen NRLMSISE-00-weerstand van Orekit { "12.2" } over { "24" } h tot { "0.03" } m bij een weerstandsverplaatsing tot { "142" } km (<c23/>, VALIDATED onder de gedeelde conventies). Een controle met GMAT (General Mission Analysis Tool) blijft een vervolgstap.

seg-46d06796e0e4 = Getijden op de geopotentiaal (<c1/>)

seg-81b18c4caad3 = Tijdsafhankelijke correcties ΔC̄_nm, ΔS̄_nm op de Stokes-coëfficiënten (IERS Conventions { "2010" }, Chapter { "6" }), getoetst aan de eigen gepubliceerde getallen van de conventies, niet aan een ander hulpmiddel.

seg-78dc5baf4d9d = Bijdrage

seg-7c6c910bbf89 = Getij van de vaste aarde (IERS Eq. { "6.6" } / 6.8b / { "6.14" })

seg-ac1dbcc895f0 = <c1/>: het permanente (nulfrequente) getij ΔC̄₂₀ ligt binnen { "1" } % van de door IERS gepubliceerde −{ "4.1736" }×{ "10" }⁻⁹ (anelastische Love-getallen); het <b>uitgewerkte voorbeeld Step-2 K1 wordt bit voor bit gereproduceerd</b> (sin/cos-amplituden { "470.9" } / −{ "30.2" } ×{ "10" }⁻¹² tot op { "0.1" }×{ "10" }⁻¹²); het genormaliseerde Legendre-pad is vastgelegd met in gesloten vorm met de hand berekende waarden, onafhankelijk van de recurrentie.

seg-f2e2c5334721 = Oceaangetij (IERS Eq. { "6.15" }, FES2004 (Finite Element Solution { "2004" }, getijdenatlas), { "8" } componenten)

seg-0369f153806f = De meegeleverde FES2004-subset (<c1/> → <c2/>, Doodson→multiplicator-parse) reproduceert de M2-coëfficiënten ({ "2,2" }) van de bron exact; de K1-Doodsonfase is gelijk aan θ_g + π; de sectoriële grootte van graad 2 is fysisch en een orde kleiner dan het getij van de vaste aarde.

seg-52a19a291a41 = Atmosferisch S2-luchtgetij (Ray { "2001" }, NASA (National Aeronautics and Space Administration) GSFC (Goddard Space Flight Center))

seg-86b3d3a39bc7 = De meegeleverde harmonischen van Ray worden via de oppervlaktebelastingrelatie (Eq. { "6.21" }) omgezet naar een piek ΔC̄₂₂ ≈ { "4" }×{ "10" }⁻¹¹ (~{ "10" } % van de oceaan-M2-term). Eerlijk voorbehoud: <b>er bestaat geen gepubliceerde onafhankelijke referentie voor geopotentiaalcoëfficiënten van het luchtgetij</b>, dus het is getoetst via integriteit van de bron + grootte, een zwakkere drempel dan bij de getijden van de vaste aarde en de oceaan.

seg-63ac45ba51dc = Manoeuvres en trajectontwerp (<c1/>)

seg-a2ff4b0619d4 = Impulsieve ΔV + propagatie van de covariantie

seg-12f469864d28 = Een snelheidsdiscontinuïteit met een covariantie van { "6" }×{ "6" } die wordt doorgedragen (deterministische burn ⇒ identieke STM (toestandsovergangsmatrix); de covariantie van de uitvoeringsfout wordt vanuit het burn-frame, ECI (Earth-centred inertial) of LVLH (local vertical, local horizontal), in het snelheidsblok geroteerd).

seg-f3f0e4a7ec05 = Integratie van eindige burns tegenover Tsiolkovsky

seg-f7b35b7acdba = Integratie met constante stuwkracht over een burn-boog (massa als toestand) waarvan de bereikte ΔV overeenkomt met de <b>Tsiolkovsky</b>-raketvergelijking in gesloten vorm tot <b>beter dan { "0.01" } %</b>.

seg-46ae334a0604 = Lambert-oplosser (Izzo { "2015" }) heen en terug

seg-3e2b483cd1b7 = De Lambert-uitvoer voor één omloop (<c1/>, <c2/>, vliegtijd ⇒ <c3/>, <c4/>) wordt <b>heen en terug gevoerd door de exacte Kepler-propagator met universele variabelen</b>: hij moet weer op <c5/> uitkomen.

seg-04d69337acb3 = Porkchop-sweep tegenover de Hohmann-ondergrens

seg-fb5298b7983c = Het minimum van het raster lancering × aankomst voor C3 / aankomst-V∞ wordt gecontroleerd tegen de <b>analytische Hohmann-overdracht-C3-ondergrens</b> voor twee coplanaire cirkelvormige banen.

seg-bf2eb36e3eb6 = Lambert-oplosser tegenover een onafhankelijke bibliotheek

seg-40511ea76e12 = <c1/>: { "13" } overdrachten met één omloop van LEO via GEO tot heliocentrisch, prograde en retrograde, tegenover lamberthub { "1.0.0" } <c2/>; slechtste verschil in randsnelheid { "7e-12" } m/s.

seg-164d7ea14d4e = Eerlijke reikwijdte: geen trajectoptimalisator, geen Lambert-takken met meerdere omlopen en een synthetisch coplanair-cirkelvormig heliocentrisch model (geen planetaire DE-efemeride, dus een GMAT-controle van de Aarde–Mars-C3 is niet uitgevoerd).

seg-9d2d78ad22c4 = Baanbepaling (OD) (<c1/>, <c2/>)

seg-95d5ac7f6c29 = Gauss–Newton-batchcorrector

seg-3fe29c4621b2 = De generieke <c1/>-oplosser bereikt de exacte gewogen kleinste-kwadratenoplossing bij een lineaire fit, herstelt de ware parameters bij een niet-lineaire <c2/>-fit en lost een 3D-afstandsmultilateratie op uit ruisvrije afstanden.

seg-b31d1ffa99b1 = Batchbaanbepaling uit afstanden

seg-0b37139dffa9 = <c1/> herstelt <c2/> uit afstandsvolging door grondstations (gepropageerd met het tweelichamen- + J2-krachtenmodel) tot <b>submeter / mm·s⁻¹ uit ruisvrije afstanden</b> en tot <b>~{ "2" } m met een post-fit-residu op de ruisvloer van { "5" } m</b>: het kenmerk van een consistente kleinste-kwadratenfit.

seg-fb29199bf8bd = Sequentiële OD (met unscented filter)

seg-3c1f33052d48 = <c1/> herstelt de toestand recursief tot binnen enkele tientallen meters op dezelfde dynamica en hetzelfde afstandsmodel.

seg-7a636cc9eef0 = Batch- en sequentiële OD tegenover een onafhankelijke schatter

seg-68bf6e73c582 = <c1/>: { "8" } scenario's ({ "6" } ruisvrij LEO/MEO/excentrisch met { "3" }–{ "4" } stations, { "2" } met σ = { "5" } m) tegenover de batch-kleinste-kwadraten- en Kalman-schatters van Orekit { "12.2" } op een gematcht krachtenmodel; slechtste batch { "1e-3" } m / { "1e-6" } m/s, sequentieel { "0.9" } m.

seg-55a86bc79831 = | Batch-OD met range-rate / az-el en een elevatiemasker | <c1/> (externe vergelijking, één vooraf vastgelegde drempel gemist) | <c2/>: { "8" } scenario's tegenover de batch-kleinste-kwadraten van Orekit { "12.2" } met aangepaste ogenblikkelijke geometrische metingen; zichtbare sets identiek, meetwaarden binnen { "5.8e-8" } m / { "6.3e-10" } m/s / { "1.4e-13" } rad, toestandsovergangsmatrix binnen { "1.2e-14" }, ruisbehepte toestanden binnen { "1.74" } cm en RMS per type binnen { "2.7e-4" }; de vooraf vastgelegde ruisvrije drempel van ≤ { "1" } cm voor de toestand wordt gemist bij { "2" } van { "4" } scenario's ({ "1.46" } en { "1.74" } cm; de eigen schatting van Orekit ligt zo ver van zijn gesimuleerde referentie, die van kshana binnen { "1e-8" } m). Zie <c3/>. |

seg-35a85fb744cd = Eerlijke reikwijdte: de didactische OD gebruikt vaste inertiale stations, een topocentrisch frame voor een bolvormige aarde en ogenblikkelijke geometrische metingen (geen lichttijd, aberratie, refractie of aardrotatie); de toestandsovergangsmatrix van het range-rate-/hoekpad is variationeel (met RK4 geïntegreerd met analytische tweelichamen- + J2-partiële afgeleiden), niet in gesloten vorm; er is geen sequentieel filter voor range-rate of hoeken. Het pad met alleen afstanden behoudt zijn Jacobiaan met eindige differenties. (De engine voor het fitten van een efemeride met alle krachten hieronder heeft een eigen variationele toestandsovergangsmatrix.)

seg-8f425e278f7c = Toetsing van het krachtenmodel door efemeridefitting (<c1/>)

seg-9207d7139b87 = Een nauwkeurige schatter met batch-kleinste-kwadraten op positiewaarnemingen met alle krachten: het tesserale EGM2008-geopotentiaal (geëvalueerd in het aardvaste frame via de CIO-reductie) samengesteld met de zon/maan als derde lichaam, SRP, weerstand, GR (algemene relativiteitstheorie) volgens Schwarzschild/Lense–Thirring en de getijden hierboven, gefit aan een reeks inertiale positiebepalingen met een Jacobiaan van de variationele toestandsovergangsmatrix. Getoetst op <b>synthetische</b> gegevens, waarbij de referentie de eigen integrator van Kshana is, zodat elk residu van de schatter komt en niet van de dynamica.

seg-fc676106563e = Samenstelling van het nauwkeurige krachtenmodel

seg-57726d970436 = <c1/>: het veld van graad 0 is op elke epoch de exacte puntmassa (de centrale term is rotatie-invariant); graad 8 voegt de afplatting van de J2-band toe; de zon als derde lichaam en de getijdenterm worden bit-getrouw aangesloten; een constante radiale empirische versnelling is in RTN (radiaal, transversaal, normaal) zuiver radiaal.

seg-98b036354077 = Variationele toestandsovergangsmatrix

seg-71787d9334db = Elke kolom van Φ over een halve LEO-baan (geopotentiaal van graad 8 + zon + maan) komt overeen met een onafhankelijke herpropagatie met <b>centrale eindige differenties (FD) over de hele boog</b> tot <b>< { "1" }×{ "10" }⁻⁶ relatief</b> in zowel de positie- als de snelheidsrespons: de gedocumenteerde kruiscontrole STM↔FD. Φ({ "0" }) = I; de uitgebreide en de gewone propagator komen overeen tot submillimeter.

seg-0b453776136b = Zelfherstel van batch-LS

seg-c651db308332 = Een Kshana-boog van 1 uur (graad 6 + zon + maan) die ruisvrij is waargenomen, wordt vanuit een afwijking van { "150" } m / { "0.1" } m·s⁻¹ hersteld tot de <b>epochtoestand binnen { "1" }×{ "10" }⁻² m</b> met een post-fit-RMS bijna nul; met witte ruis van { "5" } m komt de post-fit-3D-RMS uit op de <b>~σ-ruisvloer</b>, zonder bias. De SRP-<b>C_R wordt van { "1.0" } hersteld tot binnen { "1" } %</b> van de ware waarde { "1.4" }.

seg-06bd2857f832 = Uitschieterbewerking en RTN-rapportage

seg-8b9dea5c0727 = Een grove blunder van { "500" } m wordt door 5-σ-post-fit-bewerking verworpen (precies één waarneming), waardoor een schone fit op millimeterniveau overblijft; residuen worden gerapporteerd uitgesplitst in radiaal/transversaal/normaal en ook in 3D.

seg-e3969a15df96 = Empirische versnellingslaag (RTN constant + 1-CPR (CPR: cyclus per omloop))

seg-c46af7926511 = De negen a-priori-begrensde empirische parameters blijven onder { "1" }×{ "10" }⁻⁸ m·s⁻² bij een voor empirische termen vrije referentie, zonder de fit te verstoren; een in de referentie geïnjecteerde constante dwarsspoorversnelling van { "3" }×{ "10" }⁻⁸ m·s⁻² wordt hersteld tot binnen { "20" } %.

seg-fd79199b52d1 = Eerlijke reikwijdte: de synthetische golf gebruikt nominale aardoriëntatieparameters (EOP: UT1 (Universal Time { "1" }, tijd van de aardrotatie) ≈ TT (Terrestrial Time), geen poolbeweging): exact voor zelfherstel, omdat hetzelfde model de boog genereert en fit. De toetsingen met datasets van instanties leggen <b>echte</b> finals2000A-EOP en SP3/SPK-referentie (SPK: planetaire efemeridekernel) bovenop deze engine via de CIO-frameketen (<c1/>, <c2/>, <c3/>, <c4/>).

seg-934f0f8e4f5f = Echte nauwkeurige banen van instanties (<c1/>, <c2/>, <c3/>)

seg-721a27294813 = Galileo MEO: < { "5" } m GREEN

seg-14a2999d0739 = De engine van Kshana met alle krachten, gefit aan een ongewijzigd stuk van de <b>eigen definitieve baan van ESA/ESOC (ESOC: European Space Operations Centre)</b> (<c1/>, ITRF (International Terrestrial Reference Frame)) voor Galileo <b>E11</b> over { "8" } h, waarbij elke ITRF-positiebepaling met echte finals2000A-EOP naar GCRS is geroteerd: post-fit <b>3D-RMS { "0.133" } m</b> met zuiver krachten + <c2/> (RTN 0.105/0.067/0.047 m, <c3/> { "1.174" }), <b>{ "0.070" } m</b> met de empirische laag, vanuit een ruwe overlap van { "78.7" } km. De volledige boog van { "24" } h is <b>{ "0.611" } m</b>. Alles ruim binnen de drempel van { "5" } m. Veld zwaartekrachtgeconvergeerd bij d/o-8 (identiek bij d/o 8/10/12); de job <c4/> draait de volledige d/o-70. Herkomst + SHA-256 (SHA: Secure Hash Algorithm) in <c5/>; volledig verslag in <c6/>.

seg-d5ed0783432e = Swarm-A LEO: < { "5" } m GREEN

seg-403b15ec1b9b = Engine met alle krachten (+ atmosferische weerstand) gefit aan een ongewijzigd stuk van de <b>eigen gereduceerd-dynamische nauwkeurige baan van ESA voor Swarm-A</b> (<c1/>, L47, ITRF, ~{ "430" } km, ~{ "2" } cm) over { "3" } h bij d/o-70, echte finals2000A-EOP via de CIO-keten: laag <b>dynamisch</b> (alleen toestand, statische dichtheid, <c2/>={ "1" }) post-fit <b>3D-RMS { "2.687" } m</b> (RTN 0.925/<c3/>/0.045 m, residu ≈ zuivere weerstand in de baanrichting), laag <b>gereduceerd-dynamisch</b> (+ empirische CPR-versnellingen) <b>{ "0.098" } m</b> (RTN 0.026/0.092/0.025 m): ~{ "10" } cm tegenover de baan van ESA van ~{ "2" } cm. Herkomst + SHA-256 in <c4/>; volledig verslag in <c5/>.

seg-3be5a6bee187 = LRO (Lunar Reconnaissance Orbiter) maan: getoetst, boven { "5" } m (eerlijk)

seg-d2be90186a89 = <b>Maangecentreerde</b> fit van het krachtenmodel (<c1/>): het GRAIL-zwaartekrachtveld <b>GRGM660PRIM</b> (d/o { "100" }) in het maangebonden hoofdassenframe (<c2/>, IAU { "2015" } mean-Earth + de vaste DE421-offset (Development Ephemeris { "421" }) van mean-Earth naar hoofdassen (ME→PA), toegepast zoals SPICE hem definieert sinds { "0.36" }: tot dan werd hij in de verkeerde richting toegepast, ongeveer { "208" }″ ernaast) + aarde/zon als derde lichaam, gefit met dezelfde <em>generieke</em> Gauss–Newton-schatter als de aarddatasets aan de echte gereconstrueerde baan van <b>JPL Horizons LRO</b> (NAIF −{ "85" }), { "4" } h / { "241" } epochs, ~{ "98" } km. Eerlijke post-fit ({ "0.36" }): <b>dynamisch { "12.05" } m</b> (RTN 2.91/10.11/5.88), <b>gereduceerd-dynamisch { "6.67" } m</b> (RTN 3.41/4.58/3.44, { "1" }+2 empirisch per omloop), vanuit een ruwe overlap van { "39.9" } m (vóór de ME→PA-correctie: { "12.6" } m, { "6.65" } m, { "53.8" } m): <b>boven</b> de drempel van < { "5" } m, het ligt niet aan de schatter (identiek bij d/o 100/150 en <c3/> 1e-6/1e-9). Een <b>kruiscontrole van DE-kwaliteit</b> (<c4/>: lunaire PA-oriëntatie van DE440 (Development Ephemeris { "440" }) + DE440-efemeride via ANISE) <b>corrigeerde</b> de bewering over de beperkende factor: ze gaf { "12.0" } m dynamisch en { "6.67" } m gereduceerd-dynamisch, waarmee de gecorrigeerde analytische stack nu in beide lagen overeenkomt (het eerdere dynamische gat, { "12.6" } → { "12.0" } m, was de offsetfout ME→PA), dus de operationele ondergrens is <b>niet</b> de analytische oriëntatie/efemeride maar een door de empirische laag niet te reduceren residu (het best passend bij niet-gemodelleerde niet-gravitationele dynamica van LRO over de korte boog); de slanke analytische stack komt voor de gereduceerd-dynamische baan al overeen met DE-kwaliteit. Herkomst + SHA-256 in <c5/>; volledig verslag in <c6/>. <b>Getoetst aan echte referentie van instanties: { "3" } van { "3" }; haalt < { "5" } m: { "2" } van { "3" }.</b>

seg-3d3cbf5f043d = Zwaartekrachtkaart / alt-PNT-navigatie (<c1/>, <c2/>, <c3/>, <c4/>)

seg-89f2cbf55842 = Zwaartekrachtanomalieveld in bolfuncties

seg-76cae5c530f2 = <c1/>: een volledig genormaliseerd veld van lage graad, gecontroleerd tegen de Legendre-functies in gesloten vorm (<c2/>, <c3/>, <c4/>) en een met de hand afgeleide anomalie van één term van { "1.897" } mGal.

seg-f00f82b70e6e = Meetmodel van een koudeatoomgravimeter

seg-49090598c525 = De witteruisvloer wordt afgeleid uit de ASD van de CAI-versnellingsmeter (<c1/>) en geïnjecteerd als een deterministische geseede reeks (de matcher krijgt nooit ruisvrije referentie, maar de run is toch bit-reproduceerbaar).

seg-0556db62c45f = Deeltjesfilter met sequentiële importance-resampling

seg-3df4251aedbd = <c1/>: de deterministische kern is exact vastgelegd: ESS (effectieve steekproefgrootte) van { "1" }…N, systematische resampling die indices kiest naar rato van het gewicht, de convexe combinatie van het gewogen gemiddelde, een Gaussische aannemelijkheid die de schatting naar de meting trekt en determinisme van de geseede voorspelling.

seg-7dca80b16a00 = Aannemelijkheid van kaartmatching + herstel

seg-eb40ab2607ae = <c1/>: <c2/> piekt (= { "1" }) bij een perfecte match en daalt tot <c3/> bij één sigma; een deeltjesfilter over een kenmerkend synthetisch terreinstuk herstelt de ware positie tot binnen { "0.1" }.

seg-446d9f03a860 = Benchmark van 60 minuten zonder GPS

seg-ed29fb24d9d5 = <c1/> (<c2/>): een uitval van ~{ "700" } km / één uur waarbij de inertiale oplossing wegdrijft tot <b>≈ { "70" } km</b> wordt hersteld tot <b>≈ { "145" } m (< { "500" } m)</b> door een hiërarchische matcher van grof naar fijn: bit-reproduceerbaar, stabiel over ruisrealisaties en aantoonbaar beperkt door verfijning (een enkel grof raster stagneert bij ~{ "2" } km).

seg-81a2963c26cc = SRTM-lader (Shuttle Radar Topography Mission) voor <c1/>-DEM (digitaal hoogtemodel) + bilineaire bemonstering (ORACLE A)

seg-5e7bbf951faf = <c1/> / <c2/>: een met de hand opgebouwde <c3/>-buffer van { "2" }×{ "2" } met hoeken [{ "100,200" };{ "300,400" }] interpoleert bilineair naar <b>exact { "250.0" }</b> in het celmidden (referentie in gesloten vorm), de heen-en-terugomzetting van 16-bit-big-endian is exact en de rijomkering plaatst de noordelijkste bestandsrij op de hoogste opgeslagen breedte: alles tegen de <b>specificatie van het GDAL-stuurprogramma (Geospatial Data Abstraction Library) voor SRTMHGT (Shuttle Radar Topography Mission-hoogtebestandsformaat)</b> (16-bit met teken big-endian, rij-voor-rij, noordelijke rij eerst, leeg -32768, <a1>https://gdal.org/en/stable/drivers/raster/srtmhgt.html</a1>). Een vastgelegd testbestand van { "11" }×{ "11" } (<c4/>) oefent de parser in CI; en een <b>vastgelegde echte SRTM-v3-tegel van NASA/USGS (USGS: United States Geological Survey) uit het publieke domein</b> (N36W117, Death Valley, gedecimeerd tot 6 boogseconden, { "722" } KB, <c5/>) wordt in CI gelezen (niet genegeerd, <c6/>) en plaatst <b>Badwater Basin op ≈ −{ "78" } m binnen de gedocumenteerde band [−{ "95" },−{ "70" }] m</b> (meting van NGS/NOAA (NGS: National Geodetic Survey; NOAA: National Oceanic and Atmospheric Administration) ≈ −{ "86" } m) met het tegelmaximum op ≈ { "2161" } m: de waarheidsbron is de meting, het DEM wordt getest (niet-circulair). Grotere gepubliceerde spothoogten (Mount Whitney { "4421" } m) blijven in met <c7/> afgeschermde tests met volledige tegels.

seg-80f985ea3e11 = Convergentie van terreingebonden navigatie (TERCOM/SITAN (TERCOM: terrain contour matching; SITAN: Sandia Inertial Terrain-Aided Navigation)) (ORACLE B)

seg-9ad7bf3a8c3e = <c1/> (<c2/>): een <b>met de hand afgeleide</b> geïnjecteerde INS-drift ({ "0.5" }°N, −{ "0.4" }°E ≈ { "70" } km op ~{ "12" }° breedte, berekend als drift° × M_per_deg × cos breedte) wordt hersteld tot <b>< { "500" } m</b> (binnen de ondergrens van de rasterresolutie <c3/>), een vermindering met > { "100" }× ten opzichte van vrij-inertiaal: gecontroleerd tegen het <em>geïnjecteerde</em> getal, nooit tegen het DEM (niet-circulair), bit-reproduceerbaar en stabiel over ruisseeds.

seg-5b7c1dc72436 = Fusiewinst van gecombineerde zwaartekracht+magnetisme+terrein (ORACLE C)

seg-7e3818f2ee2b = <c1/> (<c2/>): drie scalaire kanalen (Δg · |B| korstanomalie · hoogte) die als productaannemelijkheid zijn gefuseerd, geven een <b>begrensd residu van < { "500" } m</b> over de uitval van 60 min dat, gemiddeld over seeds, <b>niet slechter is dan het beste afzonderlijke kanaal</b> (additiviteit van informatie / lagere CRLB (Cramér–Rao-ondergrens)). Het ligt in het gepubliceerde regime van "tientallen meters" CEP (circular error probable) voor TERCOM / terreingebonden navigatie (TRN) (<a1>https://en.wikipedia.org/wiki/TERCOM</a1>; PeerJ { "2024" } ESKF-TERCOM (ESKF: error-state Kalman filter), <a2>https://peerj.com/articles/cs-3118/</a2>).

seg-fe23ff839bce = Eerlijke reikwijdte: het zwaartekrachtveld is van lage graad + synthetische mascons, <b>niet</b> de volledige coëfficiëntenset van EGM2008/EIGEN (EIGEN: European Improved Gravity model of the Earth by New techniques); het magnetische kanaal rust op het gladde IGRF-hoofdveld plus <b>synthetische</b> mascons voor korstanomalieën (een echte hoogfrequente korstkaart is een vervolgstap); het CI-terreinveld voor de benchmarks van de <em>navigatiepositiebepaling</em> is het zelfstandige synthetische DEM, terwijl de <c1/>-lezer zelf nu in CI is getoetst aan een vastgelegde echte SRTM-v3-tegel (hierboven); de echte tegels met volledige resolutie blijven met <c2/> afgeschermd. Een Monte-Carlo van de representatiefout van de kaart blijft een vervolgstap. Alle drie de navigators zijn nu aangesloten op de scenario-engine met <c3/> (<c4/>, <c5/>, <c6/>).

seg-d9f7e199e5d0 = Foutmodel voor INS / IMU: toetsing aan datasheets (<c1/>)

seg-48266c2faaed = Het stochastische foutmodel van de IMU is getoetst aan <b>gepubliceerde specificaties van fabrikantdatasheets / datasets</b>, nooit aan een waarde die Kshana zelf heeft voortgebracht. De brug van een specificatie in veldeenheden naar het ruismodel in SI (International System of Units) is de standaardidentificatie met de Allan-deviatie (Riley, NIST SP { "1065" } §{ "5" }; IEEE (Institute of Electrical and Electronics Engineers) Std { "952" }): de random-walk-coëfficiënt <c1/> is de overlappende ADEV afgelezen bij τ = { "1" } s op de helling τ⁻¹ᐟ², en de coëfficiënt voor biasinstabiliteit is het vlakke Allan-plateau (<c2/>, hermetisch: geen download).

seg-702de63000d2 = Bewijs / onafhankelijke referentie

seg-c3fed48b98b1 = Laag voor eenheidsconversie (het grootste risico op circulariteit, nr. 1)

seg-6cdc88d36bfd = Met de hand gecontroleerd: { "0.15" } deg/√hr = { "4.3633e-5" } rad/√s; { "3.6" } µg = { "3.5304e-5" } m/s²; { "2.0" } deg/hr = { "9.6963e-6" } rad/s.

seg-75afa5abcd08 = Angle random walk van de gyro

seg-d5fd60857e4d = ADIS16465-ARW van { "0.15" } deg/√hr (datasheet van Analog Devices) hersteld uit ADEV({ "1" } s) tot < { "5" }%.

seg-c5e2d361b83f = Velocity random walk van de versnellingsmeter

seg-4413d3bb39b4 = ADIS16465-VRW van { "0.1" } m/s/√hr hersteld tot < { "5" }%.

seg-ebeb0bb0e0fb = Allan-helling van witte ruis

seg-f674ce82dc2c = ADIS16460, log-log-helling van de witte tak −{ "0.5" } ± { "0.05" }.

seg-40afd130f31d = Plateau van biasinstabiliteit tijdens de run

seg-94acb18a94cb = ADIS16465-gyrobiasinstabiliteit (BI) van { "2.0" } deg/hr hersteld als het vlakke Allan-minimum tot < { "15" }%.

seg-b359e0e92e20 = Tweede IMU-profiel

seg-1a304949bcf9 = NaveGo ADIS16488 (ARW { "0.3" } deg/√hr, VRW { "0.029" } m/s/√hr) beide hersteld tot < { "5" }%.

seg-fea9287d6533 = Eerlijke reikwijdte: dit toetst het <b>stochastische foutmodel</b> aan Allan-coëfficiënten uit datasheets. De voertuigdataset <b>KF-GINS</b> van i2Nav-WHU (WHU: Wuhan University) wordt gebruikt als afzonderlijke, door data afgeschermde controle: de losjes gekoppelde EKF met gesloten lus voor foutstaten en met het hefboomarmmodel voor GNSS is een VALIDATED rij van de <a1>verificatiematrix</a1> (<em>Losjes gekoppelde GNSS/INS-EKF met hefboomarm op de KF-GINS-dataset</em>), vergeleken met het C++-referentietraject van KF-GINS onder drempels die vóór de run zijn vastgelegd. Hij draait alleen waar de dataset wordt aangeleverd (<c1/>); zonder dataset draaien de synthetische lader en de hefboomarmtests. De strak gekoppelde varianten en de varianten met draaggolffase worden door die rij niet gedekt (de rij voor strak gekoppelde GNSS/INS met draaggolffase is MODELLED).

seg-f0ab98c1a79d = Deep-space- en Mars-PNT: D0-fundament (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>)

seg-bd222b27949c = De eerste mijlpaal van de navigatie-engine voor de diepe ruimte: de op de aarde gerichte kern wordt gegeneraliseerd naar een willekeurig centraal lichaam, met Mars-dynamica, een naad voor efemeridelevering, tijd op submicroseconde-niveau en de primitieven voor lichttijd en relativistische vertraging. <b>Elk bestaand aardscenario is byte-identiek</b>: de golden-bestanden voor reproduceerbaarheid tussen platforms (<c1/>, <c2/>) slagen ongewijzigd zonder regeneratie, afgedwongen per commit.

seg-e0cdbfcbb28a = Abstractie van het centrale lichaam (aarde byte-identiek)

seg-7d20649189fa = <c1/>: <c2/> met <c3/>. <c4/> stelt dat <c5/> en <c6/> gelijk zijn aan de oude aardefuncties met <b>exacte bitgelijkheid</b> (<c7/>), en een boog van de aarde met standaard-<c8/> is byte-identiek: de golden-bestanden voor reproduceerbaarheid zijn ongewijzigd (zelfde SHA, geen regeneratie).

seg-658acc8112e3 = Marszwaartekracht (GMM-3 (GMM: Goddard Mars Model), tesseraal, lichaamsgebonden)

seg-9b058665cf4b = <c1/>: zonalen C̄20/C̄30/C̄{ "40" } uit J2/J3/J4 van MRO110 (zwaartekrachtoplossing van de Mars Reconnaissance Orbiter) (<c2/>, J2 wordt heen en terug omgezet tot { "1.9604e-3" }) + sectoriale/tesserale MRO110B2 C̄22/S̄{ "22" }, C̄32/S̄{ "32" } (Konopliv et al. { "2011" }; in tabelvorm bij Liu, Baoyin & Ma { "2012" }), geëvalueerd in het lichaamsgebonden IAU-Marsframe. <c3/> controleert de heen-en-terugomzetting, de afwijking op J2-schaal van de puntmassa en dat het veld werkelijk lichaamsgebonden is (een heroriëntatie van een kwart Marsdag verandert de inertiale versnelling). Hogere graad/orde laadt uit een meegeleverde <c4/> via <c5/>.

seg-1dcbee768418 = Lichaamsgebonden Marsframe (IAU-pool)

seg-0708e5b37d69 = <c1/>: de IAU-3-1-3-rotatie <c2/> (conventie van WGCCRE/NAIF (WGCCRE: Working Group on Cartographic Coordinates and Rotational Elements), gelijk aan <c3/>). Tests: orthonormaal tot { "1e-12" } met det +{ "1" }, identiteit bij heen-en-terugomzetting, de nulmeridiaan schuift op met <c4/> per dag.

seg-5b6355a143c7 = Propagatie rond Mars / de zon als centrum

seg-4ab87f666765 = <c1/> (zelfconsistentie)

seg-12e3d173340b = <c1/>: een lage Marsbaan keert na één Kepler-periode terug naar haar begin (sluiting); de specifieke energie ε=v²/2−μ/r drijft over de boog < { "1e-9" } af; de seculiere nodale regressie door Mars-J2 komt overeen met de analytische snelheid van Vallado (onafhankelijk berekend ≈ −{ "5.15" } °/dag bij { "60" }° incl.) tot { "3" }%; een heliocentrische baan herstelt het Marsjaar van ~687 dagen (vis-viva + onafhankelijk herstel van de periode uit de boog). Geen externe gegevens.

seg-acff4c016089 = Kruiscontrole met DE440 (heliocentrisch Mars)

seg-ed164e298754 = <c1/> (UITGESLOTEN uit de workspace; MPL-2.0-ANISE beperkt tot een eigen Cargo.lock; spiegelt <c2/>): vergelijkt de propagatie van Kshana van Mars met de zon als centrum met JPL DE440 (via ANISE), met Horizons-referentie letterlijk geciteerd (herkomst + SHA-256). <b>Gereproduceerd resultaat</b> (seed-JD (Juliaanse datum) { "2459580.5" } TDB (Barycentric Dynamical Time), <c3/> SHA-256 <c4/>): positieresidu <b>{ "137" } m bij een boog van 1 dag</b> ({ "5.97" }×{ "10" }⁻¹⁰ van de heliocentrische afstand van { "2.299" }×10¹¹ m), oplopend tot { "3.3" } km bij { "5" } d, { "87.9" } km bij { "30" } d, { "1.71" } Mm bij { "90" } d: het residu <em>groeit</em> met de booglengte omdat een tweelichamenmodel met de zon als centrum bewust de planetaire verstoringen (vooral van Jupiter) en de interne beweging van het Marssysteem weglaat die de barycentrische DE440-efemeride wel bevat, dus de groei is het eerlijke kenmerk van de niet-gemodelleerde n-lichamendynamica en geen integratorfout; een korte boog die een kleine fractie van de heliocentrische afstand blijft, bevestigt dat de machinerie met de zon als centrum juist is. Draait alleen wanneer de DE440-kernel aanwezig is (<c5/>, of automatisch opgehaald ~{ "32" } MB): een handmatige / <c6/>-controle van DE-kwaliteit, <b>geen</b> standaardpoort in CI, zodat de gepubliceerde crate en elke standaardpoort byte voor byte onaangetast blijven.

seg-a7d79066a53b = Lichttijd + Shapiro-vertraging

seg-798148171dab = <c1/>: de iteratieve oplossing voor lichttijd met geretardeerde epoch (convergeert |Δτ|<{ "1e-12" } s, begrensd) en de Shapiro-vertraging Δt=(2μ/c³)·ln[(r1+r2+r12)/(r1+r2−r12)]. Tests: aarde–zon ≈ { "499" } s en aarde–maan ≈ { "1.28" } s via de ingebouwde efemeride; een synthetische zender met constante snelheid herstelt de analytische geretardeerde oplossing tot <{ "1e-9" } s (oplosser aantoonbaar onafhankelijk van elke echte efemeride); Shapiro komt exact overeen met een met de hand berekende waarde en geeft ~{ "100" }–{ "250" } µs voor een rakende straal bij superieure conjunctie aarde–Mars.

seg-1bc28f6bdc8f = Naad voor efemeridelevering

seg-34d6a07ad252 = <c1/>: <c2/> + kernelvrije <c3/> (Montenbruck–Gill zon/maan, geocentrisch); geeft <c4/> terug voor lichamen waarvoor hij geen reeks heeft (bijvoorbeeld Mars), waarvoor de ANISE-provider van DE-kwaliteit de route is: dezelfde splitsing tussen ingebouwd en ANISE als bij <c5/>/<c6/>.

seg-5e1fed7a98c0 = Tweedelige tijd + TT↔TDB

seg-5ebca9b5f2db = <c1/>: een <c2/> met Knuth-two-sum-accumulatie herstelt intervallen op submicroseconde-niveau die de JD met één f64 nabij J2000 verliest (>{ "1000" }× beter, getest); <c3/>/<c4/> gebruiken de dominante periodieke reeks van Fairhead–Bretagnon (|TDB−TT|≲{ "1.7" } ms, met de hand geverifieerd bij J2000). Additief: het bestaande tijdpad met één f64 is ongewijzigd.

seg-d2da2e1d1711 = Radiometrische waarneembare grootheden voor de diepe ruimte en CCSDS Tracking Data Message: D1 (<c1/>, <c2/>)

seg-b98f508f2375 = De tweede mijlpaal van de navigatie-engine voor de diepe ruimte: het <b>model van waarneembare grootheden</b> dat de D0-kernel voor lichttijd/relativistische vertraging omzet in de werkelijke grootheden die een volgpassage van het Deep Space Network (DSN) of ESTRACK (European Space Tracking network) rapporteert: afstand, Doppler met één, twee of drie wegen, coherente transponder-turn-around, regeneratieve/PN-afstandsmeting (PN: pseudoruis), Δ-DOR (DOR: differentiële enkelwegafstandsmeting) en de voortplantingsmedia, plus de <b>CCSDS-invoer en -uitvoer (Consultative Committee for Space Data Systems) 503.0-B Tracking Data Message (TDM)</b> die een standaard volgbestand van een ruimtevaartinstantie inleest en uitgeeft. <b>Eerlijke reikwijdte:</b> dit zijn <b>exacte geometrische modellen</b> volgens de conventies van Moyer / CCSDS; de meet<em>ruis</em> is de door de aanroeper aangeleverde <c1/> per waarneming en zit niet in het model ingebakken. Het reproduceren van een <em>specifieke echte volgpassage</em> vereist echte TDM-gegevens plus de oplosser voor baanbepaling in de diepe ruimte: dat is <b>D2</b>, niet D1. Alles hieronder is additief (de golden-bestanden voor reproduceerbaarheid zijn ongewijzigd; zelfde SHA, geen regeneratie).

seg-d1d2dc7906c8 = Afstand en Doppler met 1/2/3 wegen (tweebeensoplossing van Moyer)

seg-e2176b844df8 = <c1/>: <c2/>/<c3/> stellen de D0-oplossingen voor lichttijd samen, geretardeerd (neerwaartse leg) en vervroegd (opwaartse leg); de conventie voor de volledige heen-en-terugreis is <c4/> (m), gedocumenteerd en consistent. <c5/>/<c6/>/<c7/> vormen de draaggolfverschuiving <c8/> (Hz) uit de afstandssnelheid langs de zichtlijn, <b>tekenconventie: een naderend ruimtevaartuig geeft een positieve (blauwe) verschuiving</b>. Tests: afstand met twee wegen = som van de legs tot <{ "1" } mm (~{ "2" } AU heen-en-terugreis aarde–zon); afstand met één weg = <c9/> exact; Doppler met één weg komt overeen met de analytische <c10/> voor een radiale zender met constante snelheid tot ppt; drie wegen met stations op dezelfde plek valt byte voor byte samen met twee wegen.

seg-638697be5b5b = Coherente transponder-turn-around (exacte DSN-verhoudingen)

seg-781aa4041c58 = <c1/>: de exacte rationale DSN/CCSDS-turn-aroundgetallen <c2/> (Moyer §{ "13" }; DSN 810-005 module 201/214): S/S 240/221, S/X 880/221, X/S 240/749, X/X 880/749, X/Ka 3344/749, Ka/Ka 3360/3599. Getest op exacte gelijkheid; een ongedefinieerd bandpaar <b>geeft een panic</b> (faalt luid, verzint nooit een verhouding). <c3/> past de bandcarrier + verhouding van begin tot eind toe en is gelijk aan de expliciete <c4/> tot op machineprecisie.

seg-f24f9da1570c = Regeneratieve / PN-afstandsmeting (CCSDS { "414" }; ambiguïteit)

seg-1abd8c221e8d = <c1/>: <c2/> = <c3/> (de ondubbelzinnige afstand op de schaal van de resolutie per chip) en <c4/> = dat × de codelengte (de volledige ondubbelzinnige afstand van de PN-code <c5/>), volgens CCSDS 414.1-B. Getest: een afstandsklok van { "1" } MHz geeft ~{ "149.9" } m; de gewogen-stemmende PN-code van CCSDS-414.1 ({ "1 009 470" } chips) bij { "1" } Mchip/s geeft de ontwerp-ondubbelzinnige afstand van ~{ "151 000" } km; een verdubbeling van de chipsnelheid halveert de ambiguïteit per chip.

seg-16b9fdd916a7 = Δ-DOR (CCSDS { "506" }, vlak aan de hemel)

seg-93055e944306 = <c1/>: de differentiële vertraging in het hemelvlak <c2/> (s) voor een interferometerbasislijn <c3/> (CCSDS 506.1-B). Getest: komt overeen met de exacte analytische projectie <c4/> voor een bekende offset in lijn met de basislijn tot op { "1e-15" } s, de grootte voor kleine hoeken <c5/> en de <b>nul</b> (een ruimtevaartuig dat in lijn ligt met de quasar geeft exact nul differentiële vertraging).

seg-4e5258bb04d5 = Plasmakalibratie met twee frequenties volgens 1/f²

seg-e3b340103825 = <c1/>: <c2/> = <c3/> (de dispersieve groepsvertraging door geladen deeltjes met <c4/>, <c5/>); <c6/> de coronakolom van het type Cassini met <c7/> (analytisch surrogaat, geen gekalibreerde corona); <c8/> de dispersie-inversie <c9/> die de DSN gebruikt om plasma te verwijderen. Getest: de 1/f²-wet <c10/>; de corona neemt toe naar conjunctie; en een <b>geïnjecteerde TEC wordt hersteld tot <{ "1" } %</b> (in feite ≪ { "1e-9" } zonder ruis): <c11/>.

seg-e1e265ab499a = Troposfeer-/ionosfeermedia (hergebruik van GNSS-modellen)

seg-2d9aa52f318b = <c1/>/<c2/>: het grondstationsegment voor de diepe ruimte doorkruist dezelfde aardatmosfeer die het GNSS-pakket al modelleert, dus deze delegeren aan <c3/> (Saastamoinen-zenit + Niell-afbeelding, niet-dispersief) en <c4/> (uitgezonden ionosfeer). Getest op aansluiting en fysisch teken: troposfeer positief en groter bij lage elevatie dan in het zenit; ionosfeer een niet-negatieve schuine vertraging (numerieke getrouwheid is die van de eigen, aan datasheets gerefereerde tests van het GNSS-pakket).

seg-44ba6e0411fd = CCSDS-TDM { "503" }: inlezen / uitgeven + radiometrische brug

seg-18eafe936dcb = <c1/>: een KVN-lezer (keyword-value notation) <b>en</b> -schrijver voor CCSDS 503.0-B-2 (header + segmenten <c2/> / <c3/>; records <c4/>/<c5/>/<c6/>/<c7/>). Tests (<c8/> + <c9/>): het referentietestbestand wordt ingelezen tot de verwachte benoemde velden; <b>inlezen→uitgeven→inlezen is een gelijke structuur</b> (semantische heen-en-terugomzetting); de brug <c10/> zet de ondubbelzinnige records <c11/>/<c12/> om naar <c13/> (weg uit <c14/> <c15/>/<c16/>/<c17/>, band uit <c18/>, km→m); een bestand met meerdere segmenten reset de toestandsmachine. <b>Eerlijk overslaan in plaats van raden:</b> hoeken/frequenties, onbekende banden, epochs met dag van het jaar en niet herkende tijdsystemen worden <b>overgeslagen</b>, nooit verkeerd omgezet, en <c19/> blijft <c20/> zodat de aanroeper kan wegen.

seg-e8ca55dd29b1 = DSN/ESTRACK-benchmark (modelprecisie ≫ gepubliceerde ondergrens)

seg-247b9e7b2be8 = <c1/>: de waarneembare grootheden zijn exacte geometrische berekeningen, dus de eerlijke benchmark is dat de <b>eigen numerieke fout van het model ver onder de gepubliceerde DSN/ESTRACK-meetondergrens ligt</b>: het model is niet de knelpunt voor nauwkeurigheid, de door de aanroeper aangeleverde σ wel. Elke test berekent een waarneembare grootheid op twee onafhankelijke manieren (of herstelt een geïnjecteerde referentie) en stelt dat het residu onder de ondergrens ligt: <b>afstand</b> wordt heen en terug omgezet tot <{ "1" } mm ≪ de ondergrens van ~{ "1" } m voor PN-afstandsmeting (DSN 810-005 mod. { "214" } / CCSDS 414.1-B); <b>Doppler</b> komt overeen met de exacte afstandssnelheid met geretardeerde tijd in gesloten vorm <c2/> tot ~{ "10" }⁻⁶ m/s, meerdere × onder de X-band-ondergrens van ~{ "0.05" } mm/s (DSN 810-005 mod. { "203" } / Moyer): het residu is de ondergrens van f64-afstandsverschillen bij ~{ "1" } AU, een numeriek kenmerk en geen modelleringsfout; <b>Δ-DOR</b> reproduceert de projectie in gesloten vorm tot een equivalente hoek in het hemelvlak ≪ { "1" } nrad ≪ de ondergrens van ~{ "1" }–{ "10" } nrad (DSN 810-005 mod. { "210" } / CCSDS 506.1-B); <b>plasma</b> met twee frequenties herstelt de geïnjecteerde vertraging tot ≪ { "1" } %; en de <b>Shapiro</b>-vertraging ligt in de gepubliceerde band van ~{ "100" }–{ "250" } µs voor conjunctie aarde–Mars. De gepubliceerde cijfers worden vermeld en aangeduid als DSN-specificaties van <b>ordegrootte</b>, geen verzonnen exacte getallen, en de moduledocumentatie zegt uitdrukkelijk dat dit de MODELPRECISIE toetst en niet de reproductie van een echte passage (dat is D2 + echte TDM).

seg-2a25e6a8a5b1 = Gereduceerd-dynamische OD voor de diepe ruimte: D2 (<c1/>, <c2/>, <c3/>)

seg-0d7a1b75a0ea = De derde mijlpaal van de navigatie-engine voor de diepe ruimte: de <b>schatter</b> die de radiometrische waarneembare grootheden van D1 omzet in een herstelde baan: een numeriek robuust Square-Root Information Filter (SRIF) met gereduceerd-dynamische empirische versnellingen, een klok aan boord met drie toestanden, een weerstandsmodel voor Mars en de radiometrische meetpartiëlen die afstand/Doppler met de filtertoestand verbinden, van begin tot eind gesloten door een synthetisch herstel van baanbepaling in een lage Marsbaan (LMO). <b>Eerlijke reikwijdte:</b> het herstel is een <b>synthetische gesloten lus</b> (referentie en filter delen dezelfde Mars-propagator en de waarnemingen zijn hetzelfde geometrische model van waarneembare grootheden dat het filter inverteert, plus geïnjecteerde Gaussische ruis): het toetst de <b>schattermachinerie</b>, niet de absolute getrouwheid van het krachtenmodel van Mars; de externe kruiscontrole van DE-kwaliteit is de door een kernel afgeschermde crate <c1/> (D0.8b). Alles hieronder is additief (de golden-bestanden voor reproduceerbaarheid zijn ongewijzigd; zelfde SHA, geen regeneratie).

seg-51f203291066 = SRIF-kern (square-root information filter)

seg-9d5fd8c1d37d = <c1/>: een zelfgebouwd square-root information filter van Bierman: bovendriehoeks-<c2/> met <c3/>, informatievector <c4/>, Householder-meet-/tijdupdates, kale <c5/>-rekenkunde (geen nalgebra). Tests: het sequentiële SRIF komt overeen met de oplossing met batch-gewogen-kleinste-kwadraten (<c6/>) in <b>zowel toestand als covariantie tot { "1e-9" }</b> op een ontworpen lineair-Gaussisch probleem (<c7/>); de herstelde covariantie <c8/> is na een lange reeks meet-/tijdupdates <b>per constructie symmetrisch ({ "1e-12" }) en positief definiet</b> (<c9/>, Cholesky slaagt); en informatie hoopt zich op (het spoor van <c10/> neemt monotoon af naarmate metingen met identieke geometrie worden toegevoegd).

seg-f9ffa1ef4688 = Gereduceerd-dynamische empirische versnellingen (afstemming cruise↔LMO)

seg-b0612a7140c3 = <c1/>: het filter <c2/> met negen toestanden, met empirische RTN-versnellingen als Gauss–Markov-processtoestanden van de eerste orde, de reduced-dynamic-techniek van JPL/ESOC blootgesteld als één <c3/>-knop (bijna dynamisch ⇒ egaliseert ruis op een ballistische boog; bijna kinematisch ⇒ de empirische laag absorbeert een niet-gemodelleerde manoeuvre/weerstand). Tests: een bijna kinematisch filter volgt een <b>stapvormige (thruster-)manoeuvre</b> met <½ van het residu van het bijna dynamische, terwijl het bijna dynamische filter <b>een ruisachtige ballistische boog</b> beter egaliseert (<c4/>); het variëren van de strakheid verschuift het post-fit-residu <b>monotoon</b>, een continuüm en geen schakelaar (<c5/>).

seg-9d5db4d63990 = Klok aan boord met 3 toestanden (fase/frequentie/drift, van Loan Q, Allan)

seg-fe5beef74e24 = <c1/>: foutstaat voor fase + fractionele frequentie + frequentiedrift met de <b>exacte discrete procesruis van van Loan</b> en een Joseph-gestabiliseerde update. Tests: de gediscretiseerde <c2/> komt overeen met de met de hand afgeleide polynoom van van Loan <b>tot { "1e-12" }</b> en <b>reduceert exact tot de Q van de KalmanClock met twee toestanden wanneer drift = { "0" }</b> (een strikte superset); een coast met meerdere stappen laat de fasevariantie groeien volgens de analytische holdover-relatie van NIST SP { "1065" } via de random-run-term <c3/>; de driftstoestand <b>herstelt een ware verouderingshelling tot <{ "5" } %</b>; een <b>Allan-profiel van USO-klasse wordt hersteld</b> (overlappende ADEV bij τ={ "1" } s binnen de kalibratiepoort) en de schatter blijft NEES-consistent (>{ "95" } % binnen 3σ) en PSD door een run met zware <c4/>. <c5/> bevat de geciteerde CSAC/USO/DSAC-cijfers (USO: ultrastabiele oscillator; DSAC: Deep Space Atomic Clock) voor <c6/> en de Dopplerondergrens <c7/>.

seg-8666d18daa2b = Atmosferische weerstand op Mars (Mars-GRAM-lite (GRAM: Global Reference Atmospheric Model))

seg-6a64c2b9e553 = <c1/>: een stuksgewijs exponentieel profiel van de neutrale dichtheid van Mars (oppervlak ~{ "0.020" } kg/m³, schaalhoogte nabij het oppervlak ~{ "11" } km, het lage-stofgemiddelde van Mars-GRAM { "2010" } / MCD (Mars Climate Database)) en de kwadratische weerstandsversnelling ten opzichte van de <b>meeroterende</b> Marsatmosfeer, plus een variant <c2/> die het SRIF kan vermenigvuldigen. Tests: de dichtheid neemt monotoon en continu af over de banden, de teruggevonden schaalhoogte nabij het oppervlak is de fysische ~{ "11" } km, de weerstand is <b>strikt antiparallel aan de relatieve snelheid</b> (uitwendig product verdwijnt tot { "1e-12" }) met een redelijke grootte van ~{ "3e-4" } m/s² in LMO, en ze is lineair in de ballistische term. <b>Eerlijke reikwijdte:</b> een representatieve technische atmosfeer, geen in de vlucht getoetste Mars-GRAM/MCD met afhankelijkheid van stof/seizoen/lokale tijd.

seg-452f32dace80 = Radiometrische meetpartiëlen (afstand/Doppler) voor het SRIF

seg-6661d241cdaf = <c1/> / <c2/>: de partiëlen voor afstand langs de zichtlijn <c3/> (∂ρ/∂r = û, ∂ρ/∂v = { "0" }) en afstandssnelheid <c4/> (∂ρ̇/∂v = û, ∂ρ̇/∂r = (v_rel − ρ̇·û)/ρ) die de waarneembare grootheden van D1 met de filtertoestand verbinden, plus de frequentiepartiële van de klok voor Doppler met één weg <c5/>. Tests: beide partiëlen komen overeen met een <b>centraal eindig verschil van de waarneembare grootheid tot { "1e-6" }</b> (<c6/>, <c7/>); een enkele afstandsupdate <b>verkleint de covariantie in de waargenomen richting (zichtlijn, LOS) met ≫{ "1000" }×</b> en houdt haar positief definiet (PD), en een Dopplerupdate verkleint de variantie van de <b>snelheid</b> langs de LOS (<c8/>, <c9/>).

seg-9a2cb6292477 = Mars-LMO-OD van begin tot eind uit radiometrische gegevens

seg-6318968b683a = <c1/>: een referentieboog in een lage Marsbaan, gepropageerd onder <c2/>-zwaartekracht, genereert ruisachtige <b>afstand (σ={ "1" } m) + Doppler (σ={ "0.1" } mm/s)</b> met twee wegen tegenover twee volgstations; het gereduceerd-dynamische SRIF herstelt haar uit een beginstoestand die <b>~{ "2.7" } km is verstoord</b>. Bereikt: geconvergeerde positie-<b>RMS ≈ { "0.2" } m</b> (submeter, ruim binnen het criterium van meters tot tientallen meters) over een boog van 3 omlopen met een cadans van { "30" } s, met de <b>gefactoriseerde covariantie op elke epoch positief definiet</b> (de SRIF-garantie, overal gecontroleerd). Het <b>continuüm van afstemming van cruise naar LMO</b> wordt van begin tot eind beproefd: met een referentie met niet-gemodelleerde weerstand die het filtersjabloon mist, herstelt de gereduceerd-dynamische knop (strakheid { "1" }) tot ~{ "14" } m tegenover ~{ "677" } m voor de bijna dynamische run (strakheid { "0" }): een verbetering van { "48" }× doordat de empirische laag de weerstand absorbeert. <b>Eerlijke reikwijdte:</b> synthetische gesloten lus (referentie = dezelfde propagator die het filter gebruikt); de externe kruiscontrole van DE-kwaliteit is de door een kernel afgeschermde <c3/> (D0.8b), hier nooit uitgevoerd, geen netwerk.

seg-559176eb1a82 = Scenario voor PNT in de diepe ruimte en fusie van één weg + twee wegen: D3 (<c1/>, <c2/>)

seg-bdb5da496071 = De vierde mijlpaal van de navigatie-engine voor de diepe ruimte: een uitvoerbaar <b>Mars-PNT-productscenario</b> dat het Marslichaam / -frame van D0, de radiometrische waarneembare grootheden van D1 en de gereduceerd-dynamische OD van D2 bundelt in één scenariosoort <c1/>. Het modelleert een kleine <b>relayconstellatie in de stijl van MARCONI</b> die een signaal in de ruimte met één weg (aan de klok gekoppeld) uitzendt en een link met twee wegen (coherent, klokvrij) naar een station voor de diepe ruimte doorgeeft, en navigeert drie referentiegebruikers (Marsoverdracht, orbiter in een lage Marsbaan, vast oppervlaktepunt) met de <b>gezamenlijke fusieschatter van D3.1 voor één weg + twee wegen</b>: een SRIF met twaalf toestanden dat het gereduceerd-dynamische baan-/empirische blok van D2 uitbreidt met een klok aan boord met drie toestanden. <b>Eerlijke reikwijdte:</b> elke kwaliteitsmaat is de <b>formele covariantiegrens</b> van de schatter (1σ / 3σ positie per epoch) en de behaalde RMS tegenover een <b>synthetische gesloten-lusreferentie</b> (referentie en filter delen dezelfde Marsdynamica en hetzelfde geometrische model van waarneembare grootheden, plus geïnjecteerde Gaussische ruis): een gesimuleerde navigatiekwaliteitsmaat, <b>GEEN</b> beschermingsniveau voor de luchtvaart met certificering en <b>GEEN</b> beweringen over vluchten (geen gecertificeerd foutmodel, geen integriteitsbewaking, geen echte volggegevens). Alles hieronder is additief (de golden-bestanden voor reproduceerbaarheid zijn ongewijzigd; zelfde SHA, geen regeneratie).

seg-b81920d2df82 = Gezamenlijke radiometrische fusie van één weg + twee wegen (gefuseerd verslaat elk afzonderlijk)

seg-cd9d2a7dd08f = <c1/>: het gereduceerd-dynamische SRIF van D2.2, aangevuld met de drie klokstaten aan boord (<c2/>), dat een gemengde tijdreeks van afstand/Doppler met <b>twee wegen</b> (klokvrij, baanbepalend: nul klokkolommen in de partiële) en <b>één weg</b> (aan de klok gekoppeld: de frequentiepartiële <c3/>) opneemt via <c4/>. De structuur kalibreren-dan-coasten: passages met twee wegen leggen de baan vast, gegevens met één weg kalibreren daarna de klok en laten de baan tussen passages coasten met een fout die wordt begrensd door de Allan-stabiliteit van de klok. Getest in <c5/> <c6/>: de <b>gefuseerde</b> oplossing verslaat <b>elk afzonderlijk linktype</b>; de coastfout van een run met alleen één weg groeit met de tussenruimte tussen passages met twee wegen, consistent met de Allan-grens van de klokklasse; de gezamenlijke covariantie blijft SPD (symmetrisch positief definiet).

seg-26a4bfa8e6ad = MARCONI-constellatie (areostationaire straal, occultatie)

seg-f2c2e1b83411 = <c1/>: een set van vijf relays: drie <b>areostationaire</b> relays op <c2/> (de synchrone Marsstraal uit gepubliceerde μ/spinsnelheid; getest in de band van <b>{ "20 400" }–{ "20 500" } km</b>) met gelijke onderlinge afstand van { "120" }° in lengte en een inclinatie van { "5" }°, plus twee relays in een hogere ({ "1.4" }× areostationair) cirkelvormige baan met een inclinatie van { "60" }° voor dekking in het hemelvlak. De relaytoestanden per epoch worden voorwaarts geïntegreerd onder <c3/>-zwaartekracht; de zichtbaarheidstest voor <b>Mars-occultatie</b> is de geometrie waarbij de koorde de bol vrijlaat (<c4/>, getest: een diametraal tegenoverliggende relay is geoccludeerd, een relay recht erboven is zichtbaar). <b>Eerlijke reikwijdte:</b> een minimale representatieve geometrie van uitzending plus relay, opgebouwd uit gepubliceerde Marsconstanten: geen specifiek ontwerp van een vluchtconstellatie.

seg-b53ea4dd9f7d = Scenario <c1/> bereikbaar via CLI / Python / WASM (WebAssembly) / MCP (Model Context Protocol)

seg-3a01d13ad2e7 = <c1/> / <c2/> is aangesloten als het scenario <c3/> op alle oppervlakken (D3.3): de CLI-runner, de Python-binding, de WASM/playground-build en de dispatch van de MCP-server routeren er allemaal naartoe (round-triptest <c4/> in <c5/>). Meegeleverde referentiescenario's: <c6/>, <c7/>, <c8/>. Het resultaat bevat een expliciete <c9/> die de kwaliteitsmaat aanduidt als een covariantiegrens (geen gecertificeerd PL), en de uitvoer <c10/> / <c11/> herhaalt het eerlijkheidslabel.

seg-28a49a455a74 = Doelen van MARCONI / LightShip gereproduceerd: <b>< { "100" } m orbiter</b>, <b>< { "15" } m rover</b>

seg-28da71940857 = <c1/>: de gepubliceerde programmadoelen van MARCONI / LightShip (orbiter < { "100" } m, oppervlak/rover < { "15" } m) gereproduceerd in simulatie. <b>Gedeelde aannames:</b> de standaardconstellatie MARCONI met vijf relays; elke relay in zicht geeft per epoch een afstand+Doppler met één weg; een coherente stationspassage met twee wegen elke <b>{ "30" } min</b>; ruis van DSN-klasse (<b>afstand σ = { "1" } m, Doppler σ = { "0.1" } mm/s</b>); het gezamenlijke fusiefilter met gereduceerd-dynamische baan + klok met 3 toestanden, geïnitialiseerd vanuit een a-priori-toestand die <b>~{ "2.7" } km</b> is verstoord (strakheid { "0.1" }); kwaliteitsmaat = geconvergeerde 3D-positie-RMS over de tweede helft van de boog tegenover de synthetische referentie. <b>Orbiter</b> (LMO ~{ "400" } km / { "60" }° incl., <b>USO</b>-klok, cadans van { "60" } s, boog van ~{ "2" } h ≈ één omloop): behaalde geconvergeerde RMS <b>≈ { "0.40" } m</b> ≪ het doel van { "100" } m (gemiddeld { "3.1" } relays in zicht, covariantie overal SPD). <b>Rover</b> (vast oppervlaktepunt op de evenaar, <b>USO</b>-klok, cadans van { "30" } s, boog van ~{ "2" } h): behaalde geconvergeerde RMS <b>≈ { "5.1" } m</b> < het doel van { "15" } m (gemiddeld { "3.0" } relays in zicht, covariantie SPD). <b>Beide doelen gehaald zonder enige bewering te versoepelen</b>: de USO is de <em>minder</em> capabele van de realistische klokklassen aan boord (een DSAC zou alleen maar helpen) en de cadans van 30 min voor passages met twee wegen is conservatief voor een routinematig schema van een relaynetwerk, dus de aannames zijn fysiek redelijk voor een systeem van MARCONI-klasse en niet afgestemd om te slagen. <b>Eerlijke reikwijdte:</b> gesimuleerde reproductie onder de vermelde aannames, GEEN bewering over vluchten en geen gecertificeerd beschermingsniveau; de synthetische gesloten-lusreferentie deelt de Marsdynamica en het model van waarneembare grootheden van het filter.

seg-37b2bad62854 = Maancoördinatentijd: relativistische klokgang aarde–maan (<c1/>)

seg-787705fa0fac = Een tijdschaal voor maancoördinatentijd (LTC/TCL (TCL: Temps-Coordonnée Lunaire, de Franse naam van Lunar Coordinate Time)) vereist de seculiere snelheid waarmee een klok op het maanoppervlak loopt ten opzichte van een klok op het aardgeoïde (TT). <c1/> berekent die vanuit eerste principes: een eerste post-Newtoniaanse identiteit die het <b>verschil in eigenpotentiaal</b> (de conventionele geoïdepotentiaal <c3/> van IAU <c2/> min de eigenpotentiaal <c4/> van het maanoppervlak) en de <b>kinetische term (Doppler van de tweede orde)</b> <c5/> uit de geocentrische maansnelheid (met eindige differenties afgeleid uit de maanreeks van Montenbruck-Gill in <c6/>) optelt. De dominante term van de eigenpotentiaal geeft <b>≈ { "57.5" } µs/dag</b>, de kinetische term <b>≈ −{ "0.5" } µs/dag</b>, samen een totaal van <b>≈ { "57" } µs/dag</b>. Het scenario <c7/> rapporteert deze snelheid, de opgebouwde LTC−TT-offset over een horizon en ondersteunt een minimaal ensemble met inverse variantie (een maan-papierklok); omzettingen TT↔LTC keren heen en terug tot < { "1" } ns/dag.

seg-beeb6561ef6b = Onafhankelijke referentie / eerlijke reikwijdte

seg-4500e65ede97 = Relativistische klokgang aarde–maan (LTC/TCL)

seg-4c7a29bc3003 = <c1/>, <c2/>/<c3/>, <c4/>, <c5/>. <b>Onafhankelijke referentie: een interne relativistische identiteit in gesloten vorm</b> (geopotentiaal van IAU <c6/> / IERS-conventies en de eigenpotentiaal GM/r (GM: gravitatieparameter, G maal de massa)), <b>gecontroleerd tegen de gepubliceerde band voor de klokgang op de maan [{ "56" }, { "59" }] µs/dag</b>. Tests (<c7/>): de term van de eigenpotentiaal ≈ { "57.5" } µs/dag, de maansnelheid ≈ { "1" } km/s, de kinetische term een kleine negatieve waarde, het totaal in de band waarbij de genoemde termen optellen tot het totaal, de LTC−TT-offset over 1 dag ≈ { "57" } µs en een omzetting TT↔LTC heen en terug van < { "1" } ns/dag. <b>Eerlijke reikwijdte:</b> het kerncijfer in µs/dag is <b>afhankelijk van de referentie</b>: het hangt af van de gekozen referentievlakken (aardgeoïde <c8/> tegenover een lunaire selenoïde), het tijdgemiddelde venster en de verwaarloosde centrifugale/J₂-correcties onder de µs/dag, en daarom is een <b>band</b> en geen enkel gecertificeerd getal de gepubliceerde uitvoer. Dit is een controle van zelfconsistentie met <c9/>, <b>GEEN</b> externe toetsing, <b>GEEN</b> absolute nauwkeurigheid onder de nanoseconde en <b>GEEN</b> gecertificeerde nauwkeurigheid voor operationele tijdsynchronisatie.

seg-b4e3228c84b8 = Geodetische VLBI op de maan: vertraging in het nabije veld voor een aardbasislijn die een maanbaken waarneemt (<c1/>)

seg-bbb634953ebf = Een waarneembare grootheid van geodetische VLBI (very-long-baseline interferometry) voor twee grondstations op aarde (een basislijn) die een signaal met één weg van een zender van NovaMoon-klasse op het maanoppervlak waarnemen. De maan staat in het <b>nabije veld</b> en is geen vlakke golf, dus de geometrische vertraging is het exacte verschil van twee afstanden <c1/> en niet de projectie op het hemelvlak. De volledige waarneembare grootheid voegt het verschil in klokoffset van de stations en een gedifferentieerde Shapiro-term voor de aardpotentiaal toe (hergebruikt uit <c2/>). Stations worden in geocentrische inertiale (GCRS-)coördinaten geplaatst via <c3/> + <c4/>; het baken via <c5/> (geocentrische maan) + <c6/> (selenografisch→MCMF (MCMF: Moon-centred, Moon-fixed)) + <c7/> (IAU-2015 ME lichaamsgebonden→inertiaal). Het scenario <c8/> bemonstert de vertraging, de snelheid ervan met eindige differenties en de correctie voor het nabije veld over een passage.

seg-b2b758337ebc = De <b>onafhankelijke referentie</b> is de Δ-DOR-waarneembare grootheid voor een vlakke golf <c1/> uit dezelfde codebase in <c2/>: in de limiet van het verre veld (een synthetisch baken op { "1e15" } m) moet de geometrische vertraging tot op machineprecisie samenvallen met <c3/>; op werkelijke maanafstand is de correctie voor het nabije veld door golffrontkromming niet nul (tientallen tot honderden µs). De bakenpartiëlen <c4/> (en de stationspartiëlen) worden geverifieerd met een centraal eindig verschil (relatieve fout < { "1e-5" }).

seg-107b9d328f69 = Geodetische VLBI-vertraging op de maan + partiëlen

seg-acee0ad60cf4 = <c1/>, <c2/>, <c3/>/<c4/>/<c5/>, <c6/>, <c7/>. <b>Onafhankelijke referentie: <c8/></b>: de <c9/> voor een vlakke golf uit dezelfde codebase (<c10/>) in de limiet van het verre veld, plus <b>partiëlen met eindige differenties</b>. Tests (<c11/>): grootte van het station ≈ aardstraal, bakenafstand op maanafstand ({ "356" }–{ "407" } Mm), de geometrische vertraging in het verre veld komt overeen met <c12/> tot < { "1e-9" } s, een correctie voor het nabije veld die op maanafstand niet nul is, FD-partiëlen van baken/station binnen { "1e-5" } relatief, een exacte kloktern en een eindige scenariorun die via <c13/> wordt verstuurd. <b>Eerlijke reikwijdte:</b> <c14/>, <b>GEEN</b> toetsing aan echte VLBI-gegevens. De poolbeweging is weggelaten (<c15/>), dus de inertiale posities van stations hebben een frameafwijking van enkele meters; het baken mengt een maanreeks met gemiddelde evenaar van de datum met een lichaamsgebonden offset in ICRF (International Celestial Reference Frame) (<c16/>), een inconsistentie van frames onder de getrouwheid van het model maar niet rigoureus; en er is geen iteratie voor lichttijd, aardrotatie tijdens de lichttijd, media (troposfeer/ionosfeer/plasma) of aberratieterm buiten de gedifferentieerde Shapiro. Er wordt geen TRL (technology readiness level), vluchtervaring of goedkeuring door een instantie beweerd. { "0.30" }: tegenover ANISE-lichttijden via DE440 ligt geen vertraging van dit analytische pad binnen { "1" } ps (grootste verschil { "24" } µs); de bevinding is vastgelegd.

seg-d90c67f098f7 = <c1/> (aarde en maan uit DE440, maanhoofdassen uit DE440, aardoriëntatie ITRF93, elke lichttijd geconvergeerd in het barycentrische frame), uitgevoerd door het scenario <c2/> wanneer de drie kernelpaden zijn ingesteld. <b>Onafhankelijke referentie: Library</b>: door NAIF SPICE Toolkit N0067 (spiceypy { "8.2.0" }) geconvergeerde lichttijden naar DSS-14/43/63, vooraf vastgelegd: { "75" } vertragingen binnen { "1" } ps (slechtste { "0.06" } ps), baken- en stationspartiëlen binnen { "1e-6" }, op { "25" } epochs nabij J2000 (een amendement nadat de { "2024" } epochs faalden op de eigen emissie-epoch met dubbele precisie van SPICE, ongeveer { "6" } ps, bekendgemaakt en vastgelegd). De gedifferentieerde Shapiro-term, de vertragingssnelheid en de correctie voor het nabije veld van het scenario worden niet vergeleken.

seg-8bed75c5402d = Gezamenlijke multitechniek-OD + klok op de maan: gesimuleerd herstel in gesloten lus (<c1/>)

seg-d518eead07c4 = Een batch-kleinste-kwadratenfit voor één epoch (momentopname) (<c1/>, sinds { "0.30" } een Householder-QR-stap) die de technieken <b>geodetische VLBI, radiometrische/lokale maanafstandsmeting en afstandsmeting tussen satellieten fuseert</b> op een GESIMULEERD maannetwerk om <em>gezamenlijk</em> de 3D-positie van een station op het maanoppervlak, de positie per satelliet van een kleine constellatie en de klokoffset van elk object te herstellen. De waarneembare grootheden zijn: ({ "1" }) geodetische VLBI-vertragingen van de aardbasislijn naar het maanstation dat als baken wordt behandeld (hergebruik van <c2/>, geocentrisch inertiaal): de kerntechniek; ({ "2" }) geocentrische radiometrische afstanden van aardstation→satelliet (die de constellatie multilateren vanuit de goed gespreide aardstations) en lokale maanafstanden station↔satelliet (Euclidische MCI-afstand (Moon-centred inertial) plus de gedifferentieerde klokterm); ({ "3" }) afstanden tussen satellieten (zelfde vorm); plus één pseudowaarneming voor klokssynchronisatie van het station die de anders niet waarneembare gemeenschappelijke klokoffset verankert. De toestandsvector is <c3/>. Er is <b>geen propagatie met een krachtenmodel in de oplosser</b>: de satellieten zijn vaste, onderscheiden, illustratieve punten op een representatieve maanbaan; dit is een bewust zuivere momentopnamefit. Intern worden posities geschaald en klokken geschat in afstandsequivalente meters zodat de normaalmatrix in f64 goed geconditioneerd blijft; de VLBI- en maanafstanden zijn gemiddeld verwijderd rond de nominale geometrie zodat de Jacobiaan met eindige differenties niet onder catastrofale cancellation lijdt. Het scenario <c4/> voert de oplossing uit met en zonder de VLBI-legs op dezelfde seed/referentie en rapporteert beide oplossingen plus de verbeteringsfactor voor de waarneembaarheid van het station.

seg-f634e976b583 = Het <b>belangrijkste eerlijke resultaat</b>: lokale maanafstandsmeting vanaf een polair station naar een handvol satellieten die allemaal naar één kant van de hemel staan, laat de positie van het station <b>zwak waargenomen in één richting</b>, dus de oplossing met alleen afstanden is slecht geconditioneerd en de herstelde 3D-fout van het station is groot (of de oplossing convergeert niet). <b>Het toevoegen van de VLBI-vertragingen van de aardbasislijn maakt de volledige 3D-positie van het station waarneembaar</b> en de herstelde stationsfout zakt naar het meterniveau. De test <c1/> stelt dat de stationsfout met VLBI duidelijk (≥{ "5" }×) kleiner is dan de fout met alleen afstanden op dezelfde geïnjecteerde referentie: het herstellen door VLBI van de anders niet waarneembare richting van het station is het punt van de fase.

seg-d5feea2381b7 = De <b>onafhankelijke referentie</b> is interne consistentie: een geïnjecteerde referentietoestand (station ~{ "50" } m/as, satellieten ~{ "30" } m/as, klokken ~{ "1e-7" } s, met een geseede jitter per component) wordt via <em>hetzelfde</em> geometriemodel dat de oplosser inverteert omgezet in synthetische waarneembare grootheden, geseede Gaussische ruis wordt toegevoegd (illustratieve standaardwaarden: VLBI σ ≈ { "1e-11" } s, afstand σ ≈ { "0.1" } m, ISL σ ≈ { "0.1" } m; gewichten <c1/>), en de schatter moet de geïnjecteerde referentie binnen de ruis herstellen vanuit een beginschatting van nullen. Een Monte-Carlo-gemiddelde NEES <c2/> over seeds (<c3/>) ligt binnen een losse band rond <c4/>, een controle op realisme van de covariantie.

seg-abc40f1f301a = <c1/> ({ "0.30" }, P2: de lineaire algebra van de oplossing)

seg-87de27c2421a = <c1/>, <c2/>, <c3/>. <b>Onafhankelijke referentie van { "0.30" }: P2</b>: numpy { "2.4.6" } (LAPACK gelsd en inv) berekent elke Gauss-Newton-stap, de geconvergeerde gewogen oplossing, de formele sigma's en de stationsfout opnieuw op de vastgelegde Jacobianen van zes netwerken (<c4/>, stappen binnen { "2.4e-11" }, sigma's binnen { "1.3e-11" }); de fysische waarnemingsmodellen en grootheden blijven MODELLED. <b>Eerdere onafhankelijke referentie: <c5/></b>: herstel van een geïnjecteerde gesimuleerde referentie + consistentie van de NEES-covariantie. Tests (<c6/>): volledige fusie herstelt de referentie (station < { "5" } m, RMS van satellieten < { "5" } m, klokken < { "1e-8" } s, geconvergeerd); VLBI herstelt de 3D-waarneembaarheid van het station (stationsfout ≥{ "5" }× kleiner met VLBI dan met alleen afstanden op dezelfde referentie); deterministisch (zelfde seed → bit-identieke oplossing, andere seed → andere maar herstelde oplossing); gemiddelde NEES binnen een losse band rond <c7/>; eindige/bewaakte gerapporteerde getallen ook wanneer alleen afstanden slecht geconditioneerd zijn; scenario verstuurd via <c8/>. <b>Eerlijke reikwijdte:</b> dit is een <b>gesimuleerd herstel in gesloten lus</b>, waarbij de referentie het waarnemingsmodel deelt, <b>GEEN</b> toetsing aan echte gegevens; geen propagatie met een krachtenmodel in de oplosser; de posities van de satellieten en de geometrie van aard- en maanstations zijn illustratief. Er wordt geen TRL, vluchtervaring of goedkeuring door een instantie beweerd.

seg-7620f3a821f6 = Realisatie van het lunaire referentiestelsel: 7-parameter-Helmert-datumfit (<c1/>)

seg-240271b9d7de = Waar <c1/> de oriëntatie van het maanlichaam volgens IAU { "2015" } WGCCRE <em>toepast</em> (een voorwaarts model), <em>schat</em> (realiseert) deze module een lunair referentiestelsel uit een netwerk van geschatte puntcoördinaten die aan een datum zijn gekoppeld. De schattingskern is een klassieke <b>gelijkvormigheidstransformatie met 7 parameters (Helmert)</b>, drie translatie-, drie kleinehoekrotatie- en één schaalparameter, die punten <c2/> (geschat frame) afbeeldt op <c3/> (datumframe) als <c4/>, waarbij <c5/> is opgebouwd uit <c6/>. De zeven parameters <c7/> worden geschat uit ≥ { "3" } niet-collineaire puntparen met gewogen kleinste kwadraten via <c8/>: het voorwaartse model voorspelt elke <c9/> uit zijn <c10/> en legt alle drie componenten van alle punten plat tot de vector van waarneembare grootheden, de waargenomen datumcoördinaten vormen <c11/>, de gewichten zijn <c12/> en de oplossing start vanuit <c13/>. Rotatiehoeken worden geschat in µrad en schaal in ppb zodat de Jacobiaan met eindige differenties goed geschaald blijft bij de grootte van de coördinaten op het maanoppervlak (~{ "1.7e6" } m). Een kleine <c14/> stelt de gerealiseerde kleine rotatie samen via de oriëntatie van lichaam naar ICRF van IAU (<c15/>) en geeft de resterende kleinehoekoffset van het gerealiseerde frame rond de ICRF-assen terug: een bewust eenvoudige wijziging van de uitdrukkingswijze van het frame, <b>geen</b> onafhankelijke schatting van de maanpool.

seg-75769fc9671c = De <b>onafhankelijke referentie</b> is interne consistentie: een bekende Helmert-transformatie (translatie ~tientallen m, rotatie ~µrad, schaal ~{ "1e-7" }) wordt <em>geïnjecteerd</em> in een goed gespreid synthetisch puntnetwerk (gevarieerde selenografische breedte/lengte → MCMF, sommige punten op hoogte), geseede Gaussische ruis wordt toegevoegd en de fit moet de geïnjecteerde parameters herstellen. Op ruisvrije gegevens is het herstel tot ~machineprecisie (translatie < { "1e-6" } m, rotatie < { "1e-9" } rad, schaal < { "1e-12" }); met ruis van een meter liggen de herstelde parameters binnen enkele × de formele σ en ligt de post-fit-RMS-residu nabij het ruisniveau. Het scenario <c1/> rapporteert het herstelde datum, de herstelfout per parameter tegenover de geïnjecteerde referentie, de post-fit-RMS van het residu en de oriëntatiekoppeling aan ICRF van de gerealiseerde rotatie.

seg-3768ce021e23 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>. <b>Onafhankelijke referentie: <c6/></b>: herstel van een geïnjecteerde gelijkvormigheidstransformatie met 7 parameters plus de algebraïsche identiteit van heen en terug van <c7/>. Tests (<c8/>): ruisvrij herstel van de geïnjecteerde transformatie (translatie < { "1e-6" } m, rotatie < { "1e-9" } rad, schaal < { "1e-12" }); herstel met ruis binnen enkele × σ en RMS-residu nabij het ruisniveau; toepassen-dan-inverteren heen en terug; deterministisch (zelfde seed → bit-identiek, andere seed → andere maar herstelde oplossing); de ICRF-koppeling bij nulrotatie is nul en de koppeling behoudt de grootte van de rotatie; scenario verstuurd via <c9/>. <b>Eerlijke reikwijdte:</b> dit is een controle van <b>zelfconsistentie</b>: ze herstelt een <em>geïnjecteerde</em> transformatie op een <em>synthetisch</em> netwerk, <b>GEEN</b> realisatie van het lunaire referentiestelsel aan echte volg-/VLBI-gegevens, en ze beweert geen absolute nauwkeurigheid van het frame. De ICRF-oriëntatiekoppeling is een eenvoudige wijziging van de uitdrukkingswijze, geen onafhankelijke schatting van de pool. Er wordt geen TRL, vluchtervaring of goedkeuring door een instantie beweerd.

seg-f14930d33f47 = Servicevolume voor lunaire navigatie: DOP / dekking / beschikbaarheid + gegeneraliseerd lunair ARAIM-PL (<c1/>)

seg-456bf257f689 = De constellatieparameters zijn een <b>illustratieve benadering van publieke beschrijvingen door ESA</b> van de systeemklasse (≈ { "4" } satellieten in elliptische bevroren maanbanen die dekking van de zuidpool bevoordelen, met de apoluun boven het zuidelijk halfrond; { "4" } is de standaard van de bibliotheek en de meegeleverde <c1/> stelt { "8" } in omdat het beschermingsniveau er minstens { "6" } in zicht nodig heeft). Ze zijn <b>niet</b> de echte efemeride van Moonlight/LCNS en impliceren <b>geen</b> verbondenheid, goedkeuring, vluchtervaring, certificering of TRL. De samenstelling (dekking / beschikbaarheid / integriteit) is <b>MODELLED</b>: een relayset met cirkelvormige/elliptische Kepler-banen (geen met differentiële correctie bepaalde efemeride van LCNS / NRHO (bijna-rechtlijnige haloconfiguratie) van { "9" }:{ "2" }), een maan met gemiddelde rotatie (geen fysieke libratie / precesserende pool) en gepubliceerde integriteitsparameters van LunaNet LNIS. Ze toont de <em>methode</em> van het servicevolume, geen operationeel beschikbaarheidsgetal. Deterministisch (zuivere geometrie; geen toeval). Het scenario <c2/> rapporteert het dekkingspercentage, de omhullenden van het aantal zichtbare satellieten en van PDOP, de HPL/VPL-omhullende over het volume en de beschikbaarheid van het beschermingsniveau tegenover de alarmgrens.

seg-c28e56391894 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. <b>DOP-geometrie getoetst door hergebruik</b> van de aan gnss_lib_py getoetste kernel <c7/>; integriteit hergebruikt de gepubliceerde lunaire ARAIM van LunaNet/LNIS (<c8/>, σ_URE ≈ { "30" } m). Tests (<c9/>): <c10/> is een identiteit op de getoetste kernel; <c11/> op de zuidpool is gelijk aan het bestaande PL van <c12/> tot < { "1e-9" } (reduceert tot het geval van de zuidpool); dekking neemt niet af met de grootte van de constellatie; zichtbaarheid respecteert het elevatiemasker; het scenario is deterministisch en wordt verstuurd via <c13/>. <b>Eerlijke reikwijdte:</b> de constellatie is <b>illustratief, uit publieke bronnen en NIET verbonden met ESA</b>: niet de echte efemeride van Moonlight/LCNS; de samenstelling van dekking/beschikbaarheid/integriteit is <b>MODELLED</b> (relays met cirkelvormige/elliptische Kepler-banen, maan met gemiddelde rotatie, gepubliceerde LNIS-parameters), <b>GEEN</b> operationeel beschikbaarheidsgetal van Moonlight. Er wordt geen TRL, vluchtervaring of goedkeuring door een instantie beweerd.

seg-4ff4929f71df = Lunaire differentiële PNT: opheffing van de gemeenschappelijke modus + residu dat met de basislijn groeit + DGNSS-beschermingsniveaus (<c1/>)

seg-8f94c4bf3fe6 = Een lunair analogon van DGNSS (differentiële satellietnavigatie) / SBAS: een <b>referentiestation van NovaMoon-klasse</b> op een <em>bekende</em> selenografische locatie berekent differentiële correcties per satelliet uit een <b>illustratieve constellatie van de klasse Moonlight / LCNS uit publieke bronnen</b>, en een rondtrekkende gebruiker op een basislijn daarvandaan past ze toe zodat de fouten in de uitgezonden efemeride in de <b>gemeenschappelijke modus</b> wegvallen. Elke satelliet <c1/> heeft een geïnjecteerde gemeenschappelijke 3D-baanfoutvector <c2/> en een gemeenschappelijke klokfout <c3/>. Het pseudoafstandsresidu van het referentiestation is de correctie <c4/>; de ruwe fout van de gebruiker is <c5/>; de gecorrigeerde fout van de gebruiker is hun verschil <c6/>. De <b>klokterm <c7/> valt exact weg</b> (hij is identiek in beide waarnemingen) en de <b>baanterm valt terug op de projectie op het verschil van de twee eenheidsvectoren langs de zichtlijn</b>, die → { "0" } gaat naarmate de basislijn → { "0" } (de ondergrens van ruimtelijke decorrelatie) en ongeveer lineair groeit met de basislijn. De gecorrigeerde afstandsfouten per satelliet worden via de geometrie van de gebruiker afgebeeld door een kleine, afhankelijkheidsarme momentopname met gewogen kleinste kwadraten (toestand <c8/> via <c9/>; een constante afstandsbias wordt door de klokonbekende opgenomen in plaats van de positiebepaling te bederven) om de <b>positie</b>fout van de gebruiker te geven. Het <b>beschermingsniveau van de gebruiker hergebruikt de machinerie voor het SBAS-beschermingsniveau van DO-229E</b> (<c10/>, K-factoren voor Precision-Approach) met de differentiële residu-σ als 1σ-foutbudget van elke satelliet.

seg-06978cfaebe3 = NovaMoon wordt <b>alleen als systeemklasse</b> genoemd (een publieke beschrijving van een lunair referentiestation); de constellatie hergebruikt de illustratieve <c1/> uit publieke bronnen. Dit zijn illustratieve parameters om de differentiële <em>methode</em> te beproeven, <b>geen</b> echte efemeride, en ze impliceren <b>geen</b> verbondenheid, goedkeuring, vluchtervaring, certificering of TRL. Het scenario <c2/> rapporteert de positiefout van de gebruiker met en zonder correcties, de reductiefactor, de curve van de fout tegen de basislijn en het beschermingsniveau. In de standaardconfiguratie is de gecorrigeerde fout van de gebruiker bij een basislijn van { "50" } km ≈ { "0.008" } m tegenover ≈ { "24" } m ongecorrigeerd (een reductie van ~{ "3000" }×), en ≈ { "0" } bij een basislijn van nul.

seg-6bb4dbe998f9 = De <b>onafhankelijke referentie</b> is interne consistentie: het wegvallen van de gemeenschappelijke modus is een <b>exacte algebraïsche identiteit</b> (met <c1/>, gecorrigeerde fout < { "1e-6" } m bij een basislijn van nul; de klokterm valt bij elke basislijn tot op machineprecisie weg), het residu <b>groeit monotoon met de basislijn</b> en het beschermingsniveau is <b>hetzelfde DO-229E-algoritme</b> waaraan de SBAS-stack is vastgelegd. Het residu van ruimtelijke decorrelatie is een geometrisch model van de <b>eerste orde</b>, <b>geen</b> gefit decorrelatiemodel uit echte lunaire volging.

seg-fd282b10cc77 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>. <b>Onafhankelijke referentie: <c6/></b>: de identiteit van differentiële foutopheffing plus hergebruik van de machinerie voor het SBAS-beschermingsniveau van DO-229E (<c7/>). Tests (<c8/>): bij een basislijn van nul zijn de gecorrigeerde fout van de gebruiker en elke gecorrigeerde afstandsfout per satelliet ~{ "0" } (< { "1e-6" } m) en ≪ de ongecorrigeerde fout; de klokterm valt bij elke basislijn exact weg (geval zonder baanfout); de gecorrigeerde fout groeit monotoon met de basislijn en blijft bij bescheiden basislijnen ≪ ongecorrigeerd; differentieel verslaat standalone met een duidelijke marge (> { "2" }×); het beschermingsniveau is gelijk aan een directe aanroep van <c9/> en schaalt met de residu-σ; onderbepaalde geometrie geeft <c10/> terug; het scenario is deterministisch (geseed) en wordt verstuurd via <c11/>. <b>Eerlijke reikwijdte:</b> <b>MODELLED</b>: de opheffing van de gemeenschappelijke modus is een exacte identiteit, maar het residu van ruimtelijke decorrelatie is een geometrisch model van de <b>eerste orde</b>, <b>GEEN</b> gefit decorrelatiemodel uit echte lunaire volging, en dit is <b>GEEN</b> toetsing aan echte gegevens. NovaMoon wordt <b>alleen als systeemklasse</b> genoemd (illustratief, uit publieke bronnen, <b>niet verbonden met ESA</b>). Er wordt geen TRL, vluchtervaring of goedkeuring door een instantie beweerd.

seg-08e8a73f3426 = Lunaire interoperabiliteitsexport: met LunaNet/IOAG afgestemde CCSDS OEM + KIF met formaatcontrole heen en terug (<c1/>)

seg-39b875078d27 = Het lunaire referentiestelsel, de lunaire tijdschaal en de lunaire efemeride worden geëxporteerd in <b>op LunaNet/IOAG afgestemde (IOAG: Interagency Operations Advisory Group), op CCSDS gebaseerde uitwisselingsvormen</b>. Deze fase verzint <b>geen</b> eigen berichtformaat: zij <b>hergebruikt</b> de bestaande CCSDS-OEM-zender (OEM: Orbit Ephemeris Message) { "2.0" } en -parser van de crate (<c1/> / <c2/>) en de envelop van het Kshana Interchange Format (<c3/>), opnieuw getagd voor de lunaire context. <c4/> zet de OEM-<c5/> op het <b>lunaire lichaamsstelsel van IAU { "2015" } WGCCRE</b> (<c6/> gemiddelde aarde of <c7/> hoofdas), <c8/> op de <b>lunaire tijdschaal</b> (<c9/> / <c10/> / <c11/>) en <c12/> op <c13/>, over een voorbeeld van een <b>illustratieve, uit openbare bronnen afkomstige efemeride van LCNS-klasse</b> (posities uit <c14/>, snelheid door centraal eindig verschil). <c15/> levert een op LunaNet/IOAG afgestemde lunaire tijdsbeschrijving (schaal-id, seculiere snelheid in µs/dag uit <c16/>, de gepubliceerde band van { "56" }–{ "59" } µs/dag, referentieoppervlak) die via serde_json heen en weer wordt omgezet. <c17/> verpakt de OEM, de beschrijving en het stelsellabel in de bestaande KIF-envelop met het eerlijkheidslabel MODELLED.

seg-bbfce5323abb = De <b>onafhankelijke referentie</b> is de controle van heen-en-terugomzetting en velden. Omdat <c1/> <em>beide</em> richtingen levert, wordt de OEM via <c2/> heen en weer omgezet (terug naar een gelijk segment, met behoud van lunair stelsel, lunaire tijd en aantal toestanden) <b>en</b> onafhankelijk gecontroleerd door <c3/>. Die controleert of elk vereist CCSDS/LunaNet-headertrefwoord aanwezig is, of <c4/> een lunair <c5/>-token bevat en <c6/> niet leeg is, of de <c7/>-omlijsting klopt en of de regels met positie- en snelheidsgegevens goed gevormd zijn. Het resultaat is een gestructureerde pass plus de lijst van aanwezige en ontbrekende velden, zodat een kapotte export (bijvoorbeeld met een weggevallen <c8/>) wordt opgemerkt en bij naam genoemd. De tijdmetadata worden via <c9/> heen en weer omgezet, en de KIF-envelop via <c10/> naar gelijke artefacten met het label MODELLED.

seg-cb9dfbed826d = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. <b>Onafhankelijke referentie: <c7/></b> — deterministische heen-en-terugomzetting (CCSDS-OEM via <c8/>; KIF via <c9/>; tijdmetadata via serde_json) plus controle van veldnamen aan de hand van gepubliceerde CCSDS-OEM- en LunaNet/IOAG-veldsemantiek. Tests (<c10/>): de geëxporteerde OEM bevat de lunaire tokens <c11/> (<c12/>/<c13/>) en <c14/> (<c15/>/<c16/>), <c17/>, het object en goed gevormde gegevensregels; de lunaire tijdmetadata worden heen en weer omgezet (snelheid/band/referentie) en wijzen rommel af; de KIF-envelop wordt geserialiseerd en gedeserialiseerd naar een gelijke waarde met het eerlijkheidslabel MODELLED aanwezig; een bewust kapotte OEM (zonder <c18/>) faalt voor <c19/> en wordt als ontbrekend gemeld; het scenario wordt afgehandeld via <c20/>. <b>Eerlijke reikwijdte:</b> de veld<b>namen/eenheden</b> sluiten aan op <b>openbare</b> normen (CCSDS 502.0-B OEM, IAU WGCCRE { "2015" } lunaire stelsels, de LunaNet Interoperability Specification / IOAG-architectuur voor de maan); de export is <b>MODELLED</b> — deterministische heen-en-terugomzetting plus controle van veldnamen is de onafhankelijke referentie, dit is <b>GEEN</b> gecertificeerde interoperabiliteitstest, de efemeride is <b>illustratief, uit openbare bronnen en niet gelieerd aan ESA</b>, en er wordt geen TRL, vluchtervaring of onderschrijving door een agentschap beweerd.

seg-69a214b7236d = Gepreregistreerde voorspellingen

seg-343fe86f6a50 = Een gepreregistreerde voorspelling is een MODELLED resultaat dat is vastgelegd voordat er gegevens bestaan om het aan te toetsen, waarbij tegelijk het beoordelingsprotocol wordt vastgelegd. Het is geen validatie en voegt geen registerrij toe. Elke voorspelling staat in <c1/>, met de vastgelegde invoer, het resultaat en hun SHA-256-hashes, en <c2/> faalt zodra een vastgelegde byte verandert; een gewijzigde aanname wordt beantwoord met een nieuwe, gedateerde voorspelling naast de oude, nooit door de oude te bewerken.

seg-e65d79893e2c = Voorspelling

seg-f9e2d4b52b79 = Vastgelegd

seg-dd68891f75e2 = Beoordeeld aan

seg-d5a09f26a028 = Dekking door lunaire referentiestations

seg-c68f124a16e7 = c05dac1d, 2026-10-12

seg-293404a9cb92 = gepubliceerde nauwkeurigheid, beschikbaarheid, dekking en beschermingsniveaus van een lunair differentieel station nabij de zuidpool, door welke partij dan ook

seg-4e7d9449a880 = nog niet beoordeeld (geen gepubliceerde resultaten)

seg-ad1995b3ed17 = Representativiteit van de demonstratie en register van hiaten tot vlucht (<c1/>)

seg-86b70551c37f = Een simulatieresultaat is alleen bruikbaar als bewijs als het op zijn gezicht vermeldt waaraan het verankerd is, wat het aanneemt en wat het nog scheidt van een vluchtsysteem. Het representativiteitsregister maakt dat een volwaardige, machinaal gecontroleerde uitvoer: een <c1/>-record bevat de externe <c2/>s van de demonstratie, de gemodelleerde aannames, de <c3/>s tot vlucht (elk met de fase of activiteit die het zou sluiten) en de TRL-band waarvoor het representatief is. Het is de tegenhanger per resultaat van de <c4/>matrix op mogelijkhedenniveau.

seg-ccd039d5e6a4 = De <b>onafhankelijke referentie</b> is een verzameling invarianten in gesloten vorm, afgedwongen door <c1/>: een <c2/>-record moet minstens één <c3/>-anker vermelden (een simulatie kan niet aan zichzelf worden getoetst); een <c4/>-record moet minstens één hiaat tot vlucht vermelden en mag geen representatieve TRL-band boven { "4" } claimen (rijping daarboven vraagt hardware- of vluchtbewijs, dat is een hiaat en geen simulatieresultaat); de TRL-band moet goed gevormd zijn; en een <c5/>-record mag niets beweren. Deze invarianten maken de discipline "representativiteit onderbouwd en resterende hiaten richting vlucht duidelijk benoemd" operationeel.

seg-6b29111096ca = Representativiteit en register van hiaten tot vlucht

seg-f6b9a2c22ae6 = <c1/>/<c2/>/<c3/>, <c4/>/<c5/>/<c6/>/<c7/>. <b>Onafhankelijke referentie: <c8/></b> — eerlijkheidsinvarianten in gesloten vorm, gekoppeld aan de grens tussen status en referentiesoort van <c9/>. Tests (<c10/>): een Validated-record zonder extern anker faalt; een intern anker (ReferenceImpl) voldoet niet voor Validated; een Modelled-record zonder hiaat faalt; een Modelled-record boven TRL { "4" } faalt; misvormde TRL-banden worden opgemerkt; het record wordt met de verwachte velden naar JSON geserialiseerd en geeft een leesbaar rapport. <b>Eerlijke reikwijdte:</b> het register controleert de <em>indeling</em> van het bewijs van een resultaat — het bewijst niet dat de genoemde ankers naar live tests verwijzen (die worden handmatig bijgehouden, precies zoals de <c11/>matrix); de bewering "machinaal gecontroleerd" geldt alleen voor de invarianten van status, anker, hiaat en TRL.

seg-7e9190395eb6 = Uniform bewijs voor de afweging tussen kwantum en klassiek (<c1/>)

seg-534e48755e2c = Elk toepassingsgebied van kwantum-PNT beantwoordt dezelfde vraag op dezelfde manier: leg één vergelijkingskader vast (scenario + seed + engineversie), stuur een kwantumkandidaat en een klassieke basislijn door één neutraal codepad, beoordeel ze op gemeenschappelijke kwaliteitsmaten en rapporteer — met een betrouwbaarheidsinterval en een eerlijk label getoetst/uit een model berekend — waar kwantum wint en waar niet. <c1/> geeft dat antwoord één vorm, zodat de verticalen voor tijdsynchronisatie, navigatie en anomaliedetectie alle <b>hetzelfde</b> reproduceerbare, eerlijk gelabelde object leveren. Het implementeert geen enkele afweging opnieuw: de getallen per kwaliteitsmaat komen uit de bestaande engines (<c2/>, <c3/> en de verticale modules); dit is het contract plus de omhulling voor reproduceerbaarheid en representativiteit, gebouwd op het representativiteitsregister en de verificatielabels.

seg-5a52fb6670d1 = De <b>onafhankelijke referentie</b> bestaat uit identiteiten voor voordeel en winnaar in gesloten vorm plus een getrouwe omhulling van de bestaande afwegingsuitvoer. <c1/>: de voordeelverhouding heeft de juiste polariteit (zo georiënteerd dat <c2/> altijd betekent dat de kwantumzijde beter is, zowel voor holdover waarbij hoger beter is als voor foutmaten waarbij lager beter is); een bewijsobject gebouwd uit een echt <c3/> reproduceert zijn voordeelverhoudingen; oneerlijk bewijs wordt afgewezen (een Modelled-representativiteit zonder hiaat, of een <c4/>-kwaliteitsmaat waarvan het afwegingsrecord geen extern anker heeft); JSON is deterministisch en bevat de velden voor kader, seed, engine, kwaliteitsmaat en representativiteit.

seg-ae87cea429ba = Bewijs voor de afweging tussen kwantum en klassiek

seg-6622ae19989c = <c1/>/<c2/>/<c3/>/<c4/>. <b>Onafhankelijke referentie: <c5/></b> — identiteiten voor voordeel en winnaar in gesloten vorm plus een getrouwe omhulling van <c6/>; eerlijkheid gekoppeld aan het representativiteitsregister en aan de grens tussen verificatiestatus en referentiesoort. Tests (<c7/>) zoals hierboven. <b>Eerlijke reikwijdte:</b> het harnas standaardiseert <em>hoe</em> een afweging wordt gerapporteerd en gereproduceerd; de onderliggende fysica per kwaliteitsmaat is wat de bijdragende engine levert, met zijn eigen label getoetst/uit een model berekend — <c8/> verheft een uit een model berekende kwaliteitsmaat niet tot een getoetste.

seg-ce13223e04d0 = Bibliotheek van foutmodellen voor kwantumapparaten (<c1/>)

seg-c206fc7d58d6 = Eén plek die de kwantum-PNT-apparaten ontsluit waartussen de demonstrator afweegt — optische klokken, klokken met gevangen ionen en kwikionen, klassieke referentieklokken, de koudeatoominterferometer en tijdoverdrachtsverbindingen — elk als een <c1/> met zijn belangrijkste specificatie en een representativiteitsrecord. De meeste apparaatfysica wordt <b>hergebruikt</b> (klokstabiliteiten uit <c2/> en <c3/>; de koudeatoominterferometer uit <c4/>/<c5/>; klassieke optische en RF-verbindingen uit <c6/>). Het enige echt nieuwe model is de <b>tijdoverdrachtsverbinding met verstrengeling of enkele fotonen</b>, waarvan de timingprecisie door shotruis wordt begrensd: <c7/> in de gedetecteerde coïncidentiesnelheid <c8/> en integratietijd <c9/>, verslechterd door een donkertellingsstraf <c10/> en naar onderen begrensd door een onvermijdelijke systematische fout.

seg-7e8f4f3a5442 = De <b>onafhankelijke referentie</b> bestaat uit de hergebruikte, gepubliceerde klok- en CAI-coëfficiënten plus identiteiten voor shotruis en verlies in gesloten vorm. <c1/>: de volgorde van de hergebruikte klokstabiliteiten klopt (optisch rooster < kwikion < CSAC in σ_y({ "1" } s)); de precisie van de verstrengeling verbetert als <c2/> ({ "4" }× integratie halveert σ) wanneer shotruis de grens bepaalt; de gedetecteerde coïncidentiesnelheid daalt met een factor { "10" } per { "10" } dB verbindingsverlies; donkertellingen verslechteren de precisie monotoon; de systematische ondergrens begrenst de precisie naar onderen; elke apparaatkaart is een geldig Modelled-representativiteitsrecord.

seg-24dd5c3725b9 = <c1/>, <c2/>/<c3/>, <c4/>. <b>Onafhankelijke referentie: <c5/></b> — hergebruikte gepubliceerde klok- en CAI-coëfficiënten plus identiteiten voor shotruis en verlies in gesloten vorm voor de verstrengelingsverbinding. Tests (<c6/>) zoals hierboven. <b>Eerlijke reikwijdte:</b> de apparaatparameters van klok en CAI zijn hergebruikt uit de bestaande modellen van de engine met gepubliceerde coëfficiënten; het model van de verstrengelingsverbinding is MODELLED op basis van gepubliceerd gedrag van kwantumklok-synchronisatie, met illustratieve, uit openbare bronnen afkomstige waarden voor pairsnelheid, efficiëntie en verlies — het is <b>niet</b> getoetst aan een gemeten verbinding, en echte bron-, kanaal- en detectorhardware is een benoemd hiaat tot vlucht.

seg-f6d8e7ad6bec = Vertrouwde kwantumtijdsynchronisatie — keten van begin tot eind, beveiligde verspreiding, anomalie en afweging (<c1/>)

seg-3160cfec0d1f = Het scenario <c1/> stelt de tijdsynchronisatieketen samen die een kwantum-PNT-demonstrator nodig heeft: een eindgebruikerstijdbudget van begin tot eind (uitloopfout van de referentieklok en timingprecisie van de verbinding kwadratisch gecombineerd) voor een <b>kwantum</b>keten (optische-roosterklok + verstrengelings- of enkelefotonverbinding) tegenover een <b>klassieke</b> keten (CSAC + RF-tweewegverbinding); een <b>beschermingsniveau voor tijdsynchronisatie</b> (TPL, hergebruikt uit <c2/>) dat de niet-gedetecteerde tijdfout begrenst; een <b>beveiligingskwaliteitsmaat voor vertragings- en replay-aanvallen</b> <c3/> bij een vermeld vals-alarmpercentage (hergebruikt uit <c4/>); een <b>detectiekans voor klokanomalieën plus CUSUM-latentie (cumulatieve som) voor wijzigingsdetectie</b>; en de vergelijking tussen kwantum en klassiek als eerlijk <c5/> met een representativiteitsrecord en hiaten tot vlucht.

seg-6fa095264bdc = De <b>onafhankelijke referentie</b> is een kwadratisch budget in gesloten vorm over hergebruikte, afzonderlijk getoetste kernels (ADEV tegen Stable32/NIST; de TPL-grens; <c1/>/<c2/>). <c3/>: de kwantumprecisie verbetert met de integratietijd; de kwantumketen kan de precisiekwaliteitsmaat winnen <em>en</em> verliezen (eerlijk — geen universele winst; een zeer verliesgevende verbinding keert het resultaat om); het beschermingsniveau is eindig en positief; de beveiligingskwaliteitsmaat ligt in [{ "0,1" }] en groeit met de aanvalsvertraging; de detectiekans voor anomalieën is monotoon in de grootte van de fout; en het afwegingsbewijs is intern eerlijk (<c4/>).

seg-42a7d1170cc3 = Vertrouwde kwantumtijdsynchronisatie (keten + beveiligde verspreiding + anomalie + afweging)

seg-44855d0cec4f = <c1/>/<c2/>, <c3/>; <c4/>. <b>Onafhankelijke referentie: <c5/></b> — kwadratisch budget in gesloten vorm over hergebruikte, getoetste kernels (ADEV/Stable32-NIST, TPL-grens, analytische detectie Pd/Pmd); eerlijkheid gekoppeld aan het representativiteitsregister. Tests (<c6/>) zoals hierboven. <b>Eerlijke reikwijdte:</b> de parameters van klok en verbinding zijn illustratief en komen uit openbare bronnen; de verstrengelingsverbinding is het MODELLED, door shotruis begrensde model uit <c7/>; dit modelleert de <em>klasse</em> van vertrouwde tijdsynchronisatiesystemen — het is <b>niet</b> getoetst aan een gemeten verbinding van begin tot eind, en echte klok-, verbindings- en ruimtekanaalhardware is een benoemd hiaat tot vlucht; er wordt geen TRL, vluchtervaring of certificering beweerd.

seg-c6ae292a6331 = GNSS-vrije kwantumnavigatie (<c1/>)

seg-f34f784e928c = Het scenario <c1/> vergelijkt dead reckoning tijdens een GNSS-uitval met een <b>kwantum</b>-inertiaalbudget (een koudeatoominterferometer als versnellingsmeter, hergebruikt uit <c2/>/<c3/>, waarvan de CAI-witteruisondergrens is getoetst tot op ~{ "2" } ordes van grootte van Freier et al. { "2016" }) tegenover een <b>klassieke</b> INS van navigatiekwaliteit. Het rapporteert de groei van de positiefout over de uitloop, de holdovertijd tot een positiedrempel en de afweging tussen kwantum en klassiek als eerlijk <c4/>. De waarneembaarheid wordt eerlijk vermeld: zonder externe positiebepaling tijdens de uitval is de bias van de versnellingsmeter niet waarneembaar, dus de positiefout groeit onbegrensd (≈ ½·bias·t² plus een term voor random walk van de snelheid); een kwantumsensor met lagere bias <em>vertraagt</em> die groei maar dicht de kloof niet — alleen een externe positiebepaling doet dat.

seg-4cfde3de8f94 = De <b>onafhankelijke referentie</b> bestaat uit de hergebruikte inertiaalbudgetten (<c1/>/<c2/>, beide een implementatie van de trait <c3/>) plus driftidentiteiten in gesloten vorm. <c4/>: het kwantumbudget verslaat het klassieke over een lange uitval (lagere fout, langere holdover); de fout groeit bij beide met de duur van de uitval (de waarneembaarheidskloof); het voordeel hangt af van de uitval en is geen constante winstfactor (de kwantumcurve wordt bij korte uitloop door ruis bepaald en bij lange uitloop door bias); het afwegingsbewijs is intern eerlijk.

seg-0488b6ec9982 = <c1/>/<c2/>, <c3/>; <c4/>. <b>Onafhankelijke referentie: <c5/></b> — hergebruikte inertiaalbudgetten (CAI getoetst door hergebruik op ~{ "2" } ordes ten opzichte van Freier { "2016" }; klassieke drift in gesloten vorm); eerlijkheid gekoppeld aan het representativiteitsregister. Tests (<c6/>) zoals hierboven. <b>Eerlijke reikwijdte:</b> een statische vergelijking van dead-reckoningbudgetten, geen dynamisch filter op echte trajecten; dat bias zonder positiebepaling niet waarneembaar is, wordt vermeld; de apparaatparameters zijn illustratief en komen uit openbare bronnen; het modelleert de <em>klasse</em> van GNSS-vrije kwantumnavigatie — echte koudeatoom-IMU-hardware, een dynamisch platform en de vluchtomgeving zijn benoemde hiaten tot vlucht; er wordt geen TRL, vluchtervaring of certificering beweerd.

seg-e23e583ecf21 = Fout- en anomaliedetectie voor kwantum-PNT-systemen (<c1/>)

seg-6e6df91ae779 = Het scenario <c1/> definieert een gelabelde catalogus van kwantum-PNT-fouten (klokfrequentiesprong, drift, verlies van lock; sensorbiasstap, uitval), beoordeelt een detectiestatistiek op nominale tegenover foutieve vensters en rapporteert het onderscheidend vermogen van de detector als ROC-AUC en als minimaal detecteerbare fout bij een vast vals-alarmpercentage. De invalshoek kwantum tegenover klassiek: een stabielere kwantumklokreferentie verlaagt de monitorruis σ, zodat kleinere fouten worden gedetecteerd — uitgevoerd als eerlijk <c2/> met een representativiteitsrecord.

seg-eeb3c7d1f507 = De <b>onafhankelijke referentie</b> is een AUC in gesloten vorm voor de gaussische detectiestatistiek (nominaal <c1/>, fout <c2/> ⇒ <c3/>), gecontroleerd tegen de extern getoetste <c4/> (getoetst tegen scikit-learn) en de analytische drempels van <c5/>. <c6/>: de analytische AUC komt overeen met bekende waarden ({ "0.5" } bij μ={ "0" }, →{ "1" } voor grote μ/σ, monotoon); het empirische bootstrap-AUC-interval omvat de gesloten vorm; de kwantummonitor heeft een hogere AUC en een kleinere minimaal detecteerbare fout; het voordeel verdwijnt voor enorme fouten (beide detecteren perfect — geen universele marge); de catalogus heeft vijf gelabelde klassen; de afweging is intern eerlijk.

seg-9dda4ab0647a = Fout- en anomaliedetectie voor kwantum-PNT

seg-cfa7a5c43d14 = <c1/>, <c2/>/<c3/>, <c4/>, <c5/>; <c6/>. <b>Onafhankelijke referentie: <c7/></b> — gaussische AUC in gesloten vorm, gecontroleerd tegen de extern getoetste bootstrap-AUC van <c8/> (tegen scikit-learn) en de analytische drempels van <c9/>. Tests (<c10/>) zoals hierboven. <b>Eerlijke reikwijdte:</b> de detectiestatistiek is een gaussisch model, geen echte telemetrie; de foutcatalogus is gelabeld-synthetisch; de ruisniveaus van kwantum- en klassieke monitor zijn illustratief en komen uit openbare bronnen; het modelleert de <em>klasse</em> van kwantum-PNT-anomaliedetectie — echte hardwaretelemetrie met grondwaarheidlabels is een benoemd hiaat tot vlucht; er wordt geen TRL, vluchtervaring of certificering beweerd.

seg-24ad75143bed = Normcontrole — uitwisselingsformaten, linkbudget en integriteit (controles tegen een externe onafhankelijke referentie)

seg-9d31773e0ecd = Deze normen worden getoetst door de <b>letterlijke uitgewerkte voorbeelden en referentiewaarden te reproduceren die in de normen zelf zijn gepubliceerd</b> (of in een onafhankelijke referentie-implementatie), niet door Kshana's eigen heen-en-terugomzetting. Het reproduceren van het eigen annexvoorbeeld van een norm is de sterkste beschikbare controle op een parser van een uitwisselingsformaat.

seg-7ec3d508c64f = Externe onafhankelijke referentie

seg-e06aa022e7e9 = <b>CCSDS OEM</b> (502.0-B Orbit Data Messages)

seg-65de0a1335d6 = <c1/>: <c2/> reproduceert de exacte epochs en de toestandsvectoren X/Y/Z/Ẋ/Ẏ/Ż van het KVN-OEM-voorbeeld in <b>CCSDS 502.0-B-3, Annex G §G6, Figure G-11</b> ("OEM Example with No Acceleration, No Covariance", p. G-10) — beide efemeridesegmenten, inclusief de bronwaarden met voorloopnul (<c3/>). Fixture <c4/> is teken voor teken overgenomen uit het officiële Blue Book (de redactionele markeringen "< intervening data records omitted here >", die geen geldige OEM-records zijn, zijn niet opgenomen).

seg-54cff1deebc7 = <b>CCSDS TDM</b> (503.0-B Tracking Data Message)

seg-a5c6b58e0053 = <c1/>: <c2/> reproduceert alle { "41" } RANGE-records (eerste { "3198.03679519614" } km, laatste { "3270.46440460551" } km) en de metadata van het KVN-TDM-voorbeeld in <b>CCSDS 503.0-B-2, Annex E, Figure E-9</b> ("Range Data with TIMETAG_REF=TRANSMIT", p. E-9). Fixture <c3/> is letterlijk uit het Blue Book. (Dit is de onafhankelijke referentie uit het gepubliceerde Blue Book naast de al bestaande, met de hand opgestelde heen-en-terugomzetting van <c4/> in <c5/>.)

seg-c9a23ec7956b = <b>CCSDS { "133.0" }</b> (Space Packet Protocol)

seg-aaffd3d25c5f = <c1/>: de encoder reproduceert de testvectoren voor de primaire header op byteniveau van de onafhankelijke <b>bibliotheek <c2/></b> (us-irs/spacepackets-py, <c3/>) — bijvoorbeeld <c4/> en het maximale <c5/> — plus het canonieke telemetriegeval (TM) met allemaal enen, elk heen en weer omgezet via decodering. Breedte en volgorde van de bitvelden volgens <b>CCSDS 133.0-B-2 §{ "4.1.3" }</b>.

seg-e48472df251a = <b>CCSDS { "401" } / DSN</b> (linkbudget, DSN 810-005)

seg-c6caa639e1c6 = <c1/>: de keten van FSPL (verlies in vrije ruimte) en C/N₀ reproduceert de gepubliceerde ontwerp-controletabel voor telemetrie in de diepe ruimte uit <b>J. H. Yuen (ed.), <em>Deep Space Telecommunications Systems Engineering</em> (DESCANSO/JPL (DESCANSO: Deep Space Communications and Navigation Systems Center of Excellence) Pub. 82-76), Table 1-1</b> — de X-band-downlink ({ "8420.43" } MHz) van Galileo op { "6.37" } AU: verlies in vrije ruimte <b>{ "290.54" } dB</b> (<{ "0.05" } dB) en ontvangen <b>Pr/N₀ = { "54.6" } dB-Hz</b> (<{ "0.2" } dB). De bandcentra liggen binnen de downlinktoewijzingen voor de diepe ruimte van DSN/CCSDS-401 (DSN 810-005 Module { "201" }). De <em>standaardmissieparameters</em> blijven representatief (geen gekalibreerde transponder); de <em>linkvergelijking</em> is wat hier wordt vastgepind.

seg-c2cee7d5c7b1 = GNSS-normen — status van de externe onafhankelijke referentie en de resterende hiaten, eerlijk benoemd:

seg-d8f653b3c955 = Status en eerlijk voorbehoud

seg-fff735bd32a1 = <b>Kernel, geometrie en het ARAIM-beschermingsniveau extern getoetst.</b> De detectie-<em>kernel</em> — de χ²-drempel voor foutdetectie, de niet-centraliteit van de niet-centrale χ² voor gemiste detectie en de K-vermenigvuldigers volgens de normale verdeling — reproduceert <b>SciPy</b> (<c1/>, { "171" } gevallen, ≤ { "1e-6" } rel), en de omhullende geometrie reproduceert <b>gnss_lib_py</b> (DOP). Ook de <em>waarde</em> van het ARAIM-beschermingsniveau (PL) is nu vastgepind: tegen het "LPV-200 (LPV: localizer performance with vertical guidance) numerical example" in de WG-C (WG: Working Group) ARAIM Reference ADD (Algorithm Description Document) v3.1 geven <c2/> / <c3/> VPL { "18.2926" } m tegenover { "18.3" } m, HPL { "13.4063" } m tegenover { "13.45" } m en σ_v,acc { "1.3694" } m tegenover { "1.3694" } m, binnen de eigen <c4/> = { "0.05" } m van de referentie (het soort <c5/>). Reikwijdte: foutmodi tot één satelliet of één constellatie (<c6/>); foutsubsets met meerdere gebeurtenissen en uitsluiting zijn niet geïmplementeerd, en voor klassieke RAIM is er nog steeds <b>geen canonieke gepubliceerde testvector van invoer naar HPL</b>. Zie <a1><c7/></a1>.

seg-e6a47dfb7e54 = <b>Beschermingsniveau-algoritme nu extern getoetst.</b> Gegeven de (el, az, σ) per satelliet reproduceert <c1/> van kshana de <b>RTKLIB SBAS-PL-fork</b> (<c2/> <c3/>, Siki & Takács { "2017" }, "DO-229D Appendix J") — gevoed met de <b>eigen</b> σ van dat hulpmiddel, berekend uit <b>echte EGNOS</b>-uitzendberichten en echte BUTE-RINEX — tot <b>< { "2e-3" } m HPL</b> over { "6" } epochs (<c4/>); ESA gLAB { "v6.0.0" } (<c5/>) bevestigde dezelfde conventie. K-factoren (<c6/>, <c7/>, <c8/>) komen overeen met DO-229E Appendix J. <b>Wat getoetst is en wat niet:</b> dit pint het PL-<em>algoritme</em> vast (σ erin → HPL/VPL eruit); de σ-<em>modellering</em> stroomopwaarts uit ruwe UDRE/GIVE-berichten valt buiten de reikwijdte van kshana — daar verschillen onafhankelijke <em>volledige-keten</em>hulpmiddelen op echte gegevens nog steeds meters. K_V kwam overeen bij de afgeronde { "5.33" } van de referentie (de exacte <c9/> van kshana → VPL ~{ "0.06" } % kleiner; de verticaal wordt zonder K-factor getoetst als <c10/>).

seg-4ef39e8ea75c = <b>Uitzendmodel extern getoetst.</b> Het Klobuchar-L1-model reproduceert <b><c1/> van RTKLIB</b> (<c2/>, < { "1e-4" } m) — <em>implementatiepariteit</em> met de feitelijke open referentie, aangezien er geen officieel uitgewerkt voorbeeld met <em>gemeten waarheid</em> bestaat. De IONEX-TEC-kaartlezer bestaat nu (<c3/>, met unittests); het resterende hiaat is een controle ervan tegen een echt GIM-product, niet het uitzendmodel. Zie de Klobuchar-rijen in <a1>Beweringen en werkelijkheid</a1>.

seg-fa3058dffb2a = GPS L1 C/A-spreidingscode (IS-GPS-200)

seg-53ac231770fb = Codegeneratie extern getoetst.

seg-04db7c613bd5 = <c1/> (<c2/>): de G1/G2-LFSR (linear-feedback shift register) voor de C/A-codegenerator reproduceert de <b>gepubliceerde codefasetoewijzingen in IS-GPS-200 Table 3-Ia</b> — de octale eerste tien chips voor PRN (pseudo-random noise) { "1" }–{ "9" } ({ "{" }{ "1440" }, { "1620" }, { "1710" }, { "1744" }, { "1133" }, { "1455" }, { "1131" }, { "1454" }, { "1626" }{ "}" }) — exact. Dit pint de <b>chipreeks van de spreidingscode</b> vast aan de GPS-interfacespecificatie; de omringende onderdelen voor modulatie, spectrale scheiding en codevolging met DLL (delay-locked loop) (<c3/>) blijven MODELLED.

seg-e5f1b960777a = Tijdsynchronisatie voor netwerken, spectrum, het zonnestelsel, constellaties, campagnes en LEO-PNT

seg-c5bf3b23d688 = De mogelijkheden die in de lijn { "0.28" } zijn toegevoegd, worden rij voor rij beoordeeld in de gegenereerde <a1><c1/></a1>; deze sectie vat samen welke ervan een externe onafhankelijke referentie hebben. Een rij is alleen VALIDATED met een onafhankelijke externe referentie; al het overige is MODELLED.

seg-d791a48b3895 = Mogelijkheid (kind)

seg-d4779be2efd8 = Externe onafhankelijke referentie, of waarom het uit een model berekend blijft

seg-0d7bb0fc1c5e = Telecom-MTIE (maximum time interval error) en -TDEV (time deviation) op een holdoverreeks (<c1/>)

seg-18894b55b6c1 = <c1/>: { "17" } middelingsfactoren voor MTIE en { "12" } voor TDEV op een vastgelegde holdoverreeks van een chipschaalklok met { "2" } 048 samples, tegen allantools { "2024.06" }, tot < { "1e-12" } / < { "1e-9" } relatief. De PASS/FAIL-oordelen over de ITU-T-maskers (International Telecommunication Union Telecommunication Standardization Sector) en de voorinstellingen voor oscillatoren uit datasheets blijven MODELLED. Zie <a1><c2/></a1>.

seg-ff9cb967ae08 = Holdovervoorspelling op basis van een gemeten klokregistratie (<c1/>)

seg-7821227795d8 = <c1/>: fit op het eerste derde van de echte 5071A-cesiumregistratie, voorspel het moment waarop de een-sigmagrens wordt overschreden bij zes drempels en meet dat op de achtergehouden twee derde; drempel een factor { "1.5" } naar beide kanten, waargenomen verhoudingen { "0.84" } tot { "1.03" }. Het slotbewakingsbudget en de frequentie van positiebepaling die erop zijn gebouwd, blijven MODELLED.

seg-2667e3ddf829 = Spectrale vermogensdichtheden en spectrale scheiding in L-band in gesloten vorm (<c1/>)

seg-1a0c6ef49f98 = <c1/> gesloten vormen tegen gepubliceerde waarden (matrixrij "Closed-form L-band signal power spectral densities…"). Het waterval-diagram met J/S per band (jammer-to-signal-verhouding) en effectieve C/N0 (carrier-to-noise-dichtheid), en SigMF-invoer en -uitvoer (Signal Metadata Format), blijven MODELLED.

seg-46278e9c03c1 = Planeetposities uit de Standish-elementen van JPL (Jet Propulsion Laboratory) en lichttijd tussen hemellichamen (<c1/>)

seg-43cfeb9f2403 = { "0.30" }, gepreregistreerd tegen JPL Horizons (DE441): <c1/> en <c2/>, RMS per planeet en component hooguit het cijfer uit Table { "8.10.1" } van het Explanatory Supplement (slechtste { "0.778" }), inclusief de aardesplitsing en de ICRF-rotatie; <c3/>, de lichttijdoplosser op DE441-posities binnen { "1e-6" } s van de lichttijd van Horizons (slechtste { "6.7e-9" } s). De eerdere vergelijking met tweemaal nominaal (<c4/>), waarvan de drempel na de eerste vergelijking is vastgesteld, blijft bewaard als niet-poortende regressie. Uranus/Neptunus uit Table { "1" }, Pluto, de manen, de lichaamsconstanten en <c5/> blijven MODELLED.

seg-b96d8ea13c87 = Walker-geometrie en de gepubliceerde GPS-, Galileo- en GLONASS-slots (GLObal NAvigation Satellite System); wereldwijde GPS-verdunning van precisie (<c1/>)

seg-85c293b8d235 = <c1/>: Walker 24/3/1 reproduceert de definitietabel van de Galileo-open-dienst tot { "1e-9" }°, de slotformule uit de GLONASS-interfacecontrole en de equatoriale doorgangen van GPS; de HDOP-mediaan van de GPS-basislijn { "0.940" } tegenover { "0.94" } uit de prestatienorm van de Standard Positioning Service. Willekeurige dekkingskaarten voor meerdere constellaties rond elk hemellichaam blijven MODELLED.

seg-f0187be4b97f = Campagnes: aaneengeschakelde missies, sweeps, Monte-Carlo-ensembles, runs met gedeelde condities (<c1/>)

seg-b5c45fc12e5f = <c1/> ({ "11" } tests): een campagne met één fase reproduceert de losstaande run byte voor byte, een sweep met één knooppunt leest hetzelfde getal, een ensemble met vaste seed is byte-stabiel. Samenstellingsidentiteiten, geen externe onafhankelijke referentie.

seg-bc25d20125e7 = Linkfysica voor LEO (low Earth orbit): regencoëfficiënten volgens ITU-R (ITU Radiocommunication Sector) P.838, regendemping en scintillatie volgens P.618, gebouwpenetratieverlies volgens P.2109, ionosfeer van eerste orde, maximale Doppler

seg-b1f3bd37d169 = <c1/>, <c2/>: de eigen tabellen van de ITU-R-aanbevelingen en de validatievoorbeelden van Study Group { "3" } (vastgelegd met hun bron en ophaaldatum), de groepsvertragingsverhouding uit IS-GPS-200 voor de ionosfeer en de gepubliceerde tabel met maximale Doppler van Leclere, Marathe en Reid (ION GNSS+ { "2025" }, arXiv { "2509.19551" }).

seg-492917f11386 = LEO-navigatiebericht: het gebruikersalgoritme voor de uitgezonden efemeride van de Galileo-ICD (interface control document), CRC-24Q (24-bits cyclische redundantiecontrole), wereldwijd gemiddelde SISRE-gewichten (signal-in-space range error) (<c1/>)

seg-514a7da01582 = <c1/>: het Galileo-gebruikersalgoritme reproduceert RTKLIB (een opensourcebibliotheek voor real-time kinematische positiebepaling) tot { "1" } mm op vier echte uitgezonden Galileo-efemeriden; CRC-24Q geeft de catalogus-controlewaarde 0xCDE703 en de controlebytes van het RTCM-voorbeeldframe (Radio Technical Commission for Maritime Services) { "1005" }; de SISRE-gewichten reproduceren de gepubliceerde MEO/GEO-tabel. De fitter, de update halverwege een pass, de binaire codering, de tekst in RINEX-4-stijl/CSV (door komma's gescheiden waarden) en de selecteerbare efemeridemodellen blijven MODELLED.

seg-94bbcd43e03a = Ontwerp van LEO-signalen, pass- en linkbudget, Doppler en gezamenlijke GNSS+LEO-positiebepaling, PPP-convergentie (precise point positioning), 5G-NTN-positiebepaling (non-terrestrial network), LEO-tijdoverdracht (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>)

seg-4c37a8cfac87 = <c1/>, <c2/>: gesloten vormen, filterconsistentie (bijvoorbeeld de over runs gemiddelde NEES van het PPP-filter binnen zijn { "95" }%-band) en vergelijkingen met gepubliceerde trends; geen veldgegevens.

seg-91cf4e399f0a = Eén LEO-PNT-systeem van begin tot eind (<c1/>)

seg-fb947da2e8b4 = <c1/>: elke doorgegeven waarde is gelijk aan de eigen uitvoer van de voorgaande trap, en het wijzigen van een invoer stroomopwaarts verschuift elk cijfer stroomafwaarts dat ervan afhangt.

seg-7e230aa73770 = LEO-veerkracht en verticalen (spoofing via Doppler en via consistentie tussen banden, ionosfeersondering)

seg-ab2542cfc295 = <c1/> ({ "10" } tests). De scenario's voor veerkracht en de verticalen staan vermeld in <a1><c2/></a1>.

seg-2d3ead293658 = Uitvoer die weergave is en geen bewijs, heeft tests maar geen matrixrij: de uitwisselingsexports (CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, STK-efemeride (Systems Tool Kit), SigMF (Signal Metadata Format)), elk teruggelezen door een validator die is geschreven op basis van de specificatie van het formaat (<c1/>, { "13" } tests; zie <a1><c2/></a1>); de animaties (<c3/>: byte-identieke herhaalde runs, exacte framenaantallen, goed gevormde SVG (Scalable Vector Graphics), geen extern adres in de HTML-speler (HyperText Markup Language)); en het runrapport (<c4/>, <c5/>: elk meegeleverd scenario rapporteert zonder lege sectie of plaatsvervangende waarde, de labels komen overeen met de matrix, en de vastgelegde opdracht reproduceert <c6/> en het rapport byte voor byte).

seg-903e4e51dda1 = Werkingsgebied

seg-e226ad523a3d = Elk pakket wordt over zijn vermelde invoergebied beproefd door <c1/>, dat bevestigt dat elke numerieke uitvoer eindig is (geen NaN/Inf (NaN: not a number)) en begrensd. De tabel toont per pakket het geteste invoerbereik, het verwachte uitvoergedrag en de dekkende test.

seg-8bd4f586f3c7 = Doorlopen invoer

seg-3ebc1201a545 = Getest bereik

seg-a1198518d667 = Verwachte uitvoer

seg-7bf563f5420a = Dekkende test

seg-4906c027a805 = <c1/> (tijdsynchronisatiespecificatie)

seg-d91e18ce3773 = { "1" } – { "500" } ns

seg-10cf765fdd75 = eindige kwaliteitsmaten voor holdover, tijdsynchronisatie en beveiliging

seg-fe640e9c3c1e = { "1e-7" } – { "1e-2" } m/s² (koudeatoom → grove MEMS (micro-electro-mechanical systems))

seg-456c32a126a2 = eindige, begrensde positie-RMS/p95

seg-dae96fd3a01b = <c1/> (elevatiemasker)

seg-a54c3c8933c6 = eindige DOP/beschikbaarheid; begrensd

seg-bf506e17cf81 = { "0.1" } – { "50" } ns/s

seg-b6d0d587046e = eindige P_md / beveiliging, begrensd

seg-fda0b32d7784 = { "10" } – { "1000" } m

seg-132fdea2270f = eindige holdover van tijdsynchronisatie en positie

seg-c9099375b99f = baan (echt)

seg-952b94eda0ff = echte Celestrak-TLE's van <c1/>

seg-60009932477c = momentopname van 30 satellieten, strikte checksum

seg-deb16d50741e = laadt alleen met geldige checksums; begrensde geometrie

seg-c46d726e35b3 = klok (flicker)

seg-15939085bf3a = <c1/> aan/uit

seg-504a95f55b88 = { "0" } tegenover { "1e-12" }

seg-e1cce0c2028e = het inschakelen van de 1/f-ondergrens <b>verslechtert</b> de timing-p95-uitloop

seg-bdd4e56bdef9 = fusie (realisme)

seg-09af9dd78fe3 = <c1/> { "0" } tegenover { "5.88e-7" } m/s²

seg-0a6723be642c = nul tegenover realistisch niet-nul

seg-a9eb04be2b9f = filter convergeert nog steeds, binnen { "3" }× de fout bij nul bias

seg-2a839953aa6a = De rijen voor flicker-FM en fusiebias dichten twee specifieke realismehiaten: de ruistermen staan <b>standaard uit maar beïnvloeden aantoonbaar de uitvoer wanneer ze zijn ingeschakeld</b>, en het gezamenlijke fusiefilter <b>hangt er niet van af dat biases op nul staan</b> — het convergeert ook met een realistische restbias van koudeatoomklasse.

seg-4f0e9f9d4cdf = Kwantum- en klassieke runs gebruiken nu onafhankelijke RNG-seeds (random-number generator) (klassieke seed = seed + 0x9e3779b97f4a7c15), zodat hun ruisrealisaties ongecorreleerd zijn — hersteld na beoordeling.

seg-3b6b785f401a = <c1/> is segmentbewust: uitvaltijdlijnen worden bij heropname van GNSS gesplitst in aaneengesloten segmenten en de gerapporteerde waarde is de slechtste (kortste) uitloop daarover. Ze blijft begrensd door de resolutie van het tijdraster (een ondergrens).

seg-4a830113b13d = Her-synchronisatie van ISL-tijdoverdracht modelleert de resterende onzekerheid van de verbinding als verse jitter met gemiddelde nul per meetstap plus herverankering op het ingestelde interval.

seg-30c4d89aa433 = Beweringen en werkelijkheid — snelle naslag

seg-27a22de7b8c0 = De checklist van een vijandige beoordelaar. Voor elke term die als meer kan worden gelezen dan hij is: wat Kshana vandaag doet en waar de echte versie op de roadmap staat.

seg-759eb0cfafe4 = Term die u kunt tegenkomen

seg-6a2d3691d642 = Wat het vandaag werkelijk is

seg-bbd0145bfb95 = Wat het (nog) <b>niet</b> is

seg-a6fdb038b003 = "hybride kwantum/klassieke PNT-simulator"

seg-4421f8bd0967 = een klassieke stochastische simulator, aangedreven door gepubliceerde Allan-/ruiscoëfficiënten van kwantumsensoren

seg-3885661aafff = kwantumfysica vanuit eerste beginselen (Mach–Zehnder-fase, projectieruis, systematische fouten) — zie <a1><c1/></a1>

seg-1d28debd0302 = "gezamenlijke Kalman-fusie" / fusiepakket

seg-d13beba21ba7 = het uitvoerbare pakket <c1/> observeert de klok en de positie <b>afzonderlijk</b> (een directe tijdsbepaling en een directe positiebepaling), waarvoor de optimale schatter werkelijk blokdiagonaal is — twee filters met twee toestanden en een gecombineerde kwaliteitsmaat

seg-25c2fe6fa6d3 = een <em>gekoppeld</em> filter voor het geval van <b>pseudorange</b> <b>bestaat</b> nu als <c1/> (gestapelde <c2/> met 4 toestanden, niet-nul kruisblokcovariantie, NEES-getoetst) maar is <b>nog niet aangesloten op het uitvoerbare pakket</b>, en het pakket is <b>1-DOF (één vrijheidsgraad)</b> — de 3D-uitbreiding met 8 toestanden is toekomstig werk

seg-5cce1ca5b86f = Beveiligingskwaliteitsmaat (soort <c1/>)

seg-d55c30f63023 = <c1/> van een <b>stochastische detector voor tijd-spoofing</b>: een tweezijdige χ²₁- / Neyman–Pearson-test op een klokondersteunde monitorstatistiek, met drempel vastgesteld uit een doel-<c2/>, <c3/> geëvalueerd <b>bij de specificatiegrootte</b>, zowel in gesloten vorm als met Monte-Carlo (die op een paar ×1/√N na overeenkomen)

seg-dbf2039a4a8e = een RAIM/ARAIM-detector met meerdere satellieten — zie <a1><c1/></a1>; de monitorstatistiek is een gaussisch model met de uit de PSD afgeleide σ van de klok, geen correlatie op signaalniveau

seg-32bcb801e49c = "klokondersteunde spoofingdetectie"

seg-58e4d22075e9 = een tijdverschilmonitor met <b>één klok</b> (gaussische statistiek, σ uit de PSD van de klok), GEEN RAIM met meerdere SV's (SV: space vehicle, dat wil zeggen een satelliet)

seg-f3f6f95bc559 = RAIM met meerdere SV's in het afstandsdomein met beschermingsniveaus

seg-a5faedaab13e = P_md van de spoofingdetector (gesloten vorm tegenover Monte-Carlo)

seg-0362489c341a = de analytische, op <c1/> gebaseerde <c2/> en de empirische schatting uit <c3/> proeven komen overeen binnen de steekproeffout (≈ 1/√N); getoetst in de tests van <c4/> / <c5/> bij een zwaar belaste afwijking (μ/σ = { "2" })

seg-8fa5c9468ff5 = een gemeten ROC van de detector tegen opgenomen spoofinggegevens

seg-8f895aa1c657 = pseudorangemodel van <c1/>

seg-a5e5e1e7a0e9 = een <b>voorwaartse simulatie</b>: <c1/>. Elk atmosfeermodel is per unit getest tegen handmatig berekende waarden (ZHD (zenith hydrostatic delay) ≈ { "2.3" } m, Niell = { "1" } in het zenit, obliquiteit van Klobuchar), en het volledige uitzendmodel van Klobuchar is <b>gecontroleerd tegen de referentie-implementatie <c2/> van RTKLIB</b> tot op submillimeter (<c3/>, { "6.1278" } m voor het geval met de standaardcoëfficiënten van RTKLIB — er bestaat geen officiële gepubliceerde Klobuchar-testvector, dus dit is implementatiepariteit en geen gemeten waarheid); een <b>run zonder ruis reproduceert geometrie plus correcties tot op submillimeter</b> (RAIM-residu ≈ { "0" })

seg-adc8a5d89cbd = een positie-<b>oplossing</b> uit echte signalen (PPP/RTK (PPP: precise point positioning)), tweefrequente ionosfeervrije combinatie of ambiguïteitsoplossing op de draaggolffase — niet gemodelleerd

seg-a56533528c6e = jammingmodel (soort <c1/>)

seg-0a4a28fcd53a = een keten van <b>linkbudget</b>: J/S uit verlies in vrije ruimte plus antennewinst per richting → effectieve C/N₀ via de anti-jamvergelijking (despreidingswinst × spectrale scheiding <c1/>) → verlies van lock bij een drempel (Kaplan & Hegarty §{ "9.4" })

seg-b53e210487fb = multipath, AGC-dynamiek (automatische versterkingsregeling) in de tijd, het acquisitiezoeken zelf (de optionele hysterese <c1/> is een drempelpaar); het optionele kwantiseringsverlies <c2/> geldt voor een gaussische invoer en is niet geldig voor een CW-jammer; de optionele <c3/>-array is smalbandig en ideaal (geen koppeling of mismatch), en de optionele <c4/>-afscherming is één messcherpe rand op één SRTM-tegel; <c5/> is een representatieve constante per type, niet afgeleid uit de gemeten PSD van de jammer

seg-523d66d56f97 = Integriteitskwaliteitsmaat (klok- en holdoverpakketten)

seg-d0702ee52d37 = <b>zelfconsistentie</b> van het filter (aandeel van de uitvalsamples binnen zijn eigen k·σ-grens)

seg-b4b68065e521 = HPL/VPL, integriteitsrisico / P_HMI, alarmgrenzen, DO-229E/316/ED-259A — die worden afzonderlijk gerapporteerd door het soort <c1/> (RAIM / ARAIM) en de SBAS-functies en nooit in deze kwaliteitsmaat opgenomen

seg-d5b1f858f0e3 = kwaliteitsmaat van het oudere scenario<b>pakket</b> <c1/>

seg-e9fe365d7318 = een foutbudget voor een accelerometer/gyro met <b>één as (1-DOF)</b> (VRW/ARW, bias-instabiliteit) met een reset naar de referentie

seg-604e8d96c2c2 = het <em>oudere</em> pakket is 1-DOF; het <b>pad met 3 assen zit in het pakket <c1/></b> (volgende rij)

seg-e2a4a1c47f2c = strapdown-<b>bibliotheek</b> met 3 assen + <b>pakket</b> <c1/> (<c2/>, <c3/>)

seg-01e5672a37a4 = een geverifieerde navigator met quaternionen/NED (NED: north-east-down) met een deterministisch IMU-foutmodel — <b>schaalfactor, misalignment, g-gevoeligheid, kwantisatie, snelheidsramp</b> gemodelleerd (IEEE Std 952-1997 §A.2; Groves { "2013" } §{ "4.3" }) — nu <b>aangestuurd door het scenariopakket <c1/></b> en <b>per sensor configureerbaar vanuit TOML (Tom's Obvious Minimal Language, het scenarioformaat)</b> (<c2/>)

seg-acecd6b81859 = <b>niet gemodelleerd:</b> trillingsrectificatiefout, temperatuurgradiëntdrift. De gefuseerde uitloopfout wordt aan de ondergrens begrensd door de oriëntatiefout bij overdracht (kanteling en accelerometerbias zijn zwak scheidbaar), dus kalibratie per bias wordt niet beweerd

seg-6b04fc376c0d = "Hybride PNT-integratie" (pakket <c1/>)

seg-cd3125081b5c = open-lus dead reckoning, omsloten door resets van GNSS naar de referentie

seg-578c93c67ae7 = een gekoppelde (los/strak) Kalman-mix van GNSS en INS — dat is het afzonderlijke pakket <c1/> (EKF) en het soort <c2/>

seg-57f603da0331 = "Positioneringsprestatie" (klokpakketten)

seg-278aafe7fadf = RMS van de klokfase-<b>tijdsynchronisatie</b> in ns (<c1/>)

seg-a6af364cbcdc = een nauwkeurigheid in het positiedomein, gewogen met RMS/CEP/SEP/DOP (SEP: spherical error probable)

seg-b68c5a4363a5 = inertiale positiekwaliteitsmaat (<c1/>)

seg-850e030bb5e3 = een positie-RMS/p95 met <b>één as</b> in meters, uit één seed tenzij <c1/> om een ensemble vraagt (dan gemiddelde, spreiding en een bootstrap-betrouwbaarheidsinterval van { "95" }% per maat)

seg-be77929afa2c = een verdeling van een ensemble-CEP / 2DRMS (tweemaal de afstands-RMS) (roadmap: Monte-Carlo-CEP)

seg-75f239679dc2 = "getoetst tot ~{ "2" }%"

seg-2d593a99a2b1 = een <em>typische</em> waargenomen overeenstemming; de <b>afgedwongen poort is { "20" }–{ "25" }%</b> relatieve fout

seg-34cfd0e08235 = een gegarandeerde nauwkeurigheidsgrens van { "2" }%

seg-d3402cc1ebd5 = "reproduceerbaar / bit-identiek"

seg-46ea210bcdad = bit-identieke herhaling op <b>hetzelfde besturingssysteem + vastgezette toolchain</b>; over Linux, macOS en Windows controleert CI een vastgelegde SHA-256 van de invoervingerafdruk en de vorm van elk resultaat (<c1/>) en de numerieke waarden tot { "1e-6" } (<c2/>)

seg-38c6528122a8 = een byte-identiek volledig resultaat over besturingssystemen heen (verschillen in het laatste cijfer van libm)

seg-b0e21aea4ccd = SGP4-GPS-scenario (<c1/>)

seg-1131aa869f1d = een echte momentopname van Celestrak <c1/> (2021-07-28, { "30" } satellieten, strikte checksums), waarbij elke satelliet vanaf zijn eigen TLE-epoch wordt gepropageerd

seg-21c2f1b5d7e2 = een actuele constellatie — ververs de momentopname met <c1/> (zie <a1><c2/></a1>); de NORAD-catalogusnummers (North American Aerospace Defense Command) zijn de echte

seg-6948bd06c7e5 = Kruiscontroles met artikelen over lunaire PNT (regressiebewijs, geen matrixrijen)

seg-9ee0faf0b359 = De lunaire/cislunaire suite (de mogelijkheden "Lunar & cislunar" en "Lunar PNT suite" in de README) heeft haar beweringen uit gepubliceerde artikelen onafhankelijk gecontroleerd in <c1/>, elk tegen een onafhankelijke referentie uit een <em>andere</em> implementatie:

seg-b4edbf832fe6 = <b>footprint van baanzenden en -opvangen</b> tegen <c1/> (Cephes-Bessel J1);

seg-c856d319a46e = <b>DOP van de geometrie van oppervlaktebakens</b> tegen een onafhankelijke NumPy-oplossing van <c1/>;

seg-33ee672d98d7 = <b>groei van de voorspellingsfout van UT1/EOP-persistentie</b> tegen een NumPy-herparsing van dezelfde letterlijke IERS-rijen uit <c1/>;

seg-9b6e59789117 = <b>vlakke familie van retrograde banen op grote afstand</b> tegen de NASA/JPL Three-Body Periodic Orbit Database;

seg-c77384abd1cc = <b>budget voor RF-afstandsmetingsprecisie</b> tegen een referentie vanuit eerste beginselen.

seg-a451dbe09e10 = Fixtures en scripts voor onafhankelijke-referentiegeneratoren staan onder <c1/>. Ze versterken het bewijs achter mogelijkheden die in de machinaal gecontroleerde matrix (<c2/>) <b>MODELLED</b> blijven; het zijn regressiecontroles en <b>geen</b> nieuwe VALIDATED matrixrijen, dus ze veranderen zelf het machinaal gecontroleerde matrixaantal niet. Dat aantal wordt hier niet herhaald, omdat een met de hand overgetypte kopie ervan afdrijft: de actuele verdeling is de gegenereerde kop van <a1><c3/></a1>, die <c4/> schrijft op basis van <c5/> en die <c6/> vastpint.

seg-a353a63661de = <s1>Vorige</s1>Interoperabiliteitsexports en -imports

seg-fdae3b73ab67 = <s1>Volgende</s1>Verificatiematrix

seg-59c12422e6e7 = Getijden op de geopotentiaal (src/tides.rs)

seg-10f0b4616abe = Manoeuvres en baanontwerp (src/maneuver.rs)

seg-56cdbd59ce5d = Baanbepaling (OD) (src/orbit_determination.rs, src/batch_ls.rs)

seg-3a2c69fcbb86 = Validatie van krachtmodellen door efemeridefitting (src/precise_od.rs)

seg-05a25c6ef750 = Echte precieze banen van agentschappen (tests/agency_galileo.rs, tests/agency_swarm.rs, tests/agency_lro.rs)

seg-279f4619bc2d = Zwaartekrachtkaart / alt-PNT-navigatie (src/gravimeter.rs, src/mapmatch.rs, src/particle_filter.rs, src/altpnt/terrain.rs)

seg-7b512df70323 = Foutmodel voor INS / IMU — validatie aan de hand van datasheets (src/inertial/)

seg-b385e665cfff = PNT in de diepe ruimte en op Mars — D0-fundament (src/body.rs, src/mars_frame.rs, src/ephem_provider.rs, src/radiometric.rs, src/timescales.rs)

seg-5887e7e1a218 = Radiometrische observabelen in de diepe ruimte en CCSDS Tracking Data Message — D1 (src/radiometric.rs, src/ccsds_tdm.rs)

seg-a9cf84a14301 = Reduced-dynamic baanbepaling in de diepe ruimte — D2 (src/deepspace_od.rs, src/clock_state.rs, src/mars_atmos.rs)

seg-dc406cb825db = PNT-scenario in de diepe ruimte en fusie van eenwegs- en tweewegsmetingen — D3 (src/mars_pnt.rs, src/deepspace_od.rs)

seg-7784f9436dd2 = Lunaire coördinatentijd — relativistische klokgang tussen aarde en maan (src/lunar_time.rs)

seg-8a34cb900611 = Lunaire geodetische VLBI — nabijeveldvertraging voor een aardbasislijn die een lunair baken waarneemt (src/lunar_vlbi.rs)

seg-d47906a347b3 = Lunaire gezamenlijke baanbepaling met meerdere technieken + klok — gesimuleerd herstel in gesloten lus (src/lunar_combination.rs)

seg-17b9f0ae9dee = Realisatie van het lunaire referentiestelsel — datumfit met 7 Helmert-parameters (src/lunar_frame_realise.rs)

seg-3cfffa3eeb79 = Lunair navigatiedienstvolume — DOP / dekking / beschikbaarheid + gegeneraliseerd lunair ARAIM-PL (src/lunar_service.rs)

seg-d80bf3320a15 = Lunaire differentiële PNT — opheffing van gemeenschappelijke modus + met de basislijn groeiend residu + DGNSS-beschermingsniveaus (src/lunar_dpnt.rs)

seg-23c3d8a79acf = Lunaire interoperabiliteitsexport — op LunaNet/IOAG afgestemde CCSDS-OEM + KIF met controle van heen-en-terugomzetting (src/lunar_interop.rs)

seg-a697f4f424b8 = Representativiteit van de demonstratie en register van hiaten tot vlucht (src/representativeness.rs)

seg-4c924153299d = Uniform bewijs voor de afweging tussen kwantum en klassiek (src/qtrade.rs)

seg-bd1a5835c5db = Bibliotheek van foutmodellen voor kwantumapparaten (src/quantum_devices.rs)

seg-6b1bb731f966 = Vertrouwde kwantumtijdsynchronisatie — keten van begin tot eind, beveiligde verspreiding, anomalie en afweging (src/timetransfer_chain.rs)

seg-3332c6c1ae86 = GNSS-vrije kwantumnavigatie (src/quantum_nav_od.rs)

seg-9b46a5add4ab = Fout- en anomaliedetectie voor kwantum-PNT-systemen (src/quantum_faults.rs)

seg-9b4f13e138e4 = Deze module <em>combineert</em> reeds gebouwde onderdelen tot een analyse van het <b>servicevolume</b> van lunaire navigatie: zij doorloopt een selenografisch breedte-/lengteraster over een tijdshorizon tegen een <b>illustratieve lunaire-baanconstellatie van het type Moonlight / LCNS op basis van openbare bronnen</b> (LCNS: Lunar Communications and Navigation Services) en rapporteert DOP, dekking en beschikbaarheid, plus een gegeneraliseerde lunaire ARAIM-beschermingsniveau-envelop. De twee hergebruiken zijn dragend en expliciet. De <b>DOP-geometrie</b> is de <b>VALIDATED</b> kern (tegen gnss_lib_py) <c1/> — <c2/> is slechts een elevatiemaskerfilter plus die kern, en een test stelt de identiteit vast (<c3/> is gelijk aan een directe <c4/> op dezelfde zichtbare posities). <b>Integriteit</b> hergebruikt de lunaire ARAIM-machinerie van LunaNet LNIS (LunaNet Interoperability Specification) <c5/> (σ_URE ≈ { "30" } m, <c6/> ≈ { "1e-4" }); <c7/> generaliseert het bestaande beschermingsniveau voor de zuidpool naar een willekeurig punt op het oppervlak, en een test stelt vast dat het <b>teruggaat op het geval van de zuidpool</b> (op de zuidpool met dezelfde geometrie en hetzelfde budget geeft het exact het bestaande resultaat van <c8/> tot op < { "1e-9" }).
