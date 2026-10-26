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
