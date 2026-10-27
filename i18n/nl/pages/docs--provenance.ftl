# docs--provenance: translations (nl)

seg-9a2a5f0a8a02 = Zonnestelsel

seg-d01db1c2710a = Naslag

seg-28e87f407a10 = Domein

seg-ad856ad710eb = Status

seg-6e0cb6acc073 = VALIDATED

seg-f63dd3d7aad4 = Bron

seg-638b8d451550 = Sensor

seg-d4a762001549 = Licentie

seg-60cd077d82a7 = Model

seg-2afa300864a9 = Parameters

seg-32b620b3574e = Gebruik

seg-f3de25879362 = Bron: <c1/>

seg-257526f1f93f = Herkomst — elke parameter herleidbaar tot een gepubliceerde bron

seg-8c12958898a8 = De centrale eerlijkheidsdiscipline van Kshana is dat <b>elke sensorparameter, elk fysisch model en elke validatiedataset herleidbaar is tot een gepubliceerde bron</b> — een datasheet, een peer-reviewed artikel, een ICD (interface control document) voor het signaal in de ruimte, of een standaard. Dit document verzamelt die herkomstteksten in één citeerbare referentietabel.

seg-279914171c2e = Herkomst is meer dan documentatie: elke sensortabel in een scenario (bijvoorbeeld <c1/> en <c2/>) draagt een string <c3/> (<c4/> in <c5/>; <c6/> in <c7/> voor het foutmodel van de traagheidsmeeteenheid (IMU)) die <b>doorstroomt naar de resultaat-JSON</b> (JavaScript Object Notation) als <c8/> en <c9/>, zodat elke run zijn eigen parameterverwijzingen meedraagt. Het blok <c10/> van het resultaat labelt bovendien elk numeriek veld met een herkomstklasse (<c11/>, <c12/>, <c13/>, <c14/>, …). De onderstaande tabellen zijn de geconsolideerde, voor mensen leesbare index van die strings, plus de herkomst van algoritmen en validatie uit de broncommentaren.

seg-683fd369407a = De rijpheid is overal eerlijk gelabeld: <b>vluchtgekwalificeerd</b> (heeft gevlogen), <b>grondlaboratorium / sondeerraket</b> (gedemonstreerd, niet gevlogen) of <b>ruimtedoel op grondhardware</b> (een streefcijfer voor hardware die niet heeft gevlogen — met name elk cijfer voor de strontium-optische roosterklok). Zie <a1><c1/></a1> voor de labels <c2/> / <c3/> / <c4/> per cijfer en <a2><c5/></a2> voor de bespreking van rijpheid tussen grondlaboratorium en vlucht.

seg-80834864bfdd = { "1" }. Parameters van klokken en frequentiereferenties

seg-305f560d4b08 = Kerncijfer

seg-c35a20fa2529 = Rijpheid

seg-302e481e5014 = Microchip (Microsemi) SA.45s / SA65 CSAC (chip-scale atomic clock)

seg-a000ca420690 = σ_y({ "1" } s) = { "3.0" }×{ "10" }⁻¹⁰

seg-222707a1bde3 = Datasheet van de fabrikant

seg-97709a803dea = <b>vluchtgekwalificeerd</b> (ingezet commercieel onderdeel)

seg-75db01df1aea = Strontium-optische roosterklok (ruimtedoel)

seg-f6f430d898ed = σ_y({ "1" } s) = { "1" }×{ "10" }⁻¹⁵

seg-1996a1d92bb1 = Origlia, Schiller, Bongs et al., <a1>arXiv:{ "1503.08457" }</a1>

seg-b8c64caf79f3 = <b>ruimtedoel op grondhardware</b> — geen enkele optische Sr-klok heeft gevlogen

seg-b5a006507475 = Strontium-optische roosterklok (laboratoriumrecord)

seg-8a6ca23b19a9 = σ_y({ "1" } s) = { "4.8" }×{ "10" }⁻¹⁷

seg-b21bb1b6bf40 = Oelker et al., <em>Nature Photonics</em> ({ "2019" })

seg-95fb87b3a118 = alleen grondlaboratorium

seg-a36f415cccab = ACES/PHARAO (Atomic Clock Ensemble in Space / Projet d'Horloge Atomique par Refroidissement d'Atomes en Orbite; ISS (International Space Station) benchmark)

seg-9d6acc3191a5 = orde { "1" }×{ "10" }⁻¹⁶ na integratie over meerdere dagen

seg-1cddc44025d7 = ESA (European Space Agency) ACES/PHARAO, operationeel op het ISS sinds april { "2025" } (verwijs naar de gepubliceerde resultaten van ESA)

seg-75b7bb5ca4c8 = <b>vluchtgekwalificeerd</b> (microgolf/maser, niet optisch)

seg-aeb8f189db37 = De Allan-witte-frequentiecoëfficiënt die het holdovermodel gebruikt is <c1/>; flicker-frequentiemodulatie (flicker FM) en veroudering worden alleen gemodelleerd waar een <c2/> expliciet is ingesteld (zie <a1><c3/></a1>), anders worden ze niet gemodelleerd.

seg-bfe4524b6664 = { "2" }. Parameters van traagheidssensoren

seg-5cd1984ba399 = Kerncijfers

seg-53ad9ba8cecb = Exail hybride kwantumversnellingsmeter-triade

seg-b40c95a6bea5 = biasstabiliteit { "6" }×{ "10" }⁻⁸ g = { "5.88" }×{ "10" }⁻⁷ m/s² ({ "24" } h); ruis { "22" } µg/√Hz = { "2.16" }×{ "10" }⁻⁴ (m/s²)/√Hz

seg-fdb8f1d648ba = Templier et al., <em>Science Advances</em> ({ "2022" }), <a1>arXiv:{ "2209.13209" }</a1>

seg-570f41ff76c9 = Honeywell QA-2000 kwartsversnellingsmeter van navigatiekwaliteit

seg-a7dbc9a9705e = biasstabiliteit ~{ "160" } µg = { "1.57" }×{ "10" }⁻³ m/s²; ruis ~{ "20" } µg/√Hz; biasinstabiliteit ~{ "1" } µg

seg-3ad7ce01c6e2 = Fabrikant / Groves <em>AESS (Aerospace and Electronic Systems Society) Tutorial</em>

seg-37c841945d3e = IMU-foutmodel (schaalfactor, misalignment, g-gevoeligheid, kwantisatie, hellingsstijging)

seg-b7547264e608 = vijf systematische categorieën

seg-2f20d848f9d3 = IEEE (Institute of Electrical and Electronics Engineers) Std 952-1997 §A.2; Groves { "2013" } §{ "4.3" }, Table { "4.1" }

seg-c24b9890cf3b = model

seg-67a38b3fe143 = Strapdown-mechanisatie (NED, north-east-down; coning/sculling)

seg-832b3645b515 = quaternionattitude §{ "2.2" }, §{ "5.5" }; NED-mechanisatie §{ "5.4" }; zwaartekracht §{ "2.4" }

seg-58c85c15b0aa = Groves, <em>Principles of GNSS (global navigation satellite system), Inertial, and Multisensor Integrated Navigation Systems</em>, 2e druk

seg-ac7ef2be17e0 = { "3" }. Parameters voor tijd- en frequentieoverdracht

seg-7634c6f4b32c = Verbinding

seg-dddf65bbb231 = Optisch tweewegs door de vrije ruimte (tussen satellieten)

seg-e3a8990e650a = laboratoriumvloer ~{ "1" } fs; { "1" } ps als geloofwaardig doel in een baan

seg-1adf3425eda9 = Giorgetta et al. ({ "2013" }, <em>Nature Photonics</em>); Deschênes et al. ({ "2016" }, <em>Physical Review X</em>)

seg-9ab60d7ed2a9 = TWSTFT (two-way satellite time and frequency transfer, Ku-band)

seg-543939310789 = enkele sessie ~{ "0.5" } ns

seg-7f6127bdb4d9 = BIPM (Internationaal Bureau voor Maten en Gewichten) / PTB (Physikalisch-Technische Bundesanstalt, het Duitse nationale metrologisch instituut) / NIST (National Institute of Standards and Technology)

seg-d1f0ed9c0323 = { "4" }. Modellen voor banen, tijdsystemen en frames

seg-2ad53ecbee02 = Vergelijking / standaard

seg-7ed15b9389e0 = Referentie (broncommentaar)

seg-4d6989c7153e = SGP4/SDP4 (SGP4: Simplified General Perturbations { "4" }; SDP4: Simplified Deep-space Perturbations { "4" })-propagatie

seg-0d46975247cc = het WGS-72 (WGS: World Geodetic System) SGP4-model

seg-6dcfe89aeb8f = Vallado et al., <em>"Revisiting Spacetrack Report #3"</em>, <b>AIAA (American Institute of Aeronautics and Astronautics) 2006-6753</b> ({ "2006" })

seg-e46bf46a4d35 = Schrikkelseconden / tijdsystemen (UTC/TAI/TT/UT1 (UTC: gecoördineerde wereldtijd; TAI: internationale atoomtijd; TT: terrestrische tijd; UT1: wereldtijd { "1" }, tijd van de aardrotatie))

seg-7505e93b9bf8 = regime met gehele schrikkelseconden vanaf 1972-01-01

seg-0ea35809be61 = IERS (International Earth Rotation and Reference Systems Service) Conventions ({ "2010" }); schrikkelgeschiedenis uit IERS Bulletin C

seg-d25f68665f8e = Aardrotatiehoek

seg-a3a803bdc8a0 = IAU (International Astronomical Union) { "2000" } resolutie B1.8

seg-049ad81ff5e8 = Positie en klok van een SV (space vehicle, dat wil zeggen een satelliet) uit de uitgezonden efemeride

seg-a1a595008b2a = gebruikersalgoritme, relativistische <c1/>, <c2/>

seg-8e2e3089e2e6 = IS-GPS-200 (IS: Interface Specification; GPS: Global Positioning System) §{ "20.3.3.4.3.1" } / §{ "20.3.3.3.3.1" }

seg-8e14a54b1f09 = Efemeridenconstanten van Galileo / QZSS (het Japanse Quasi-Zenith Satellite System) / BeiDou (μ, Ω̇ₑ, C̄₂₀)

seg-93b03e3b3e43 = SIS-ICD's (interface control documents) per systeem

seg-c7c6759c0373 = Galileo OS (Open Service) SIS-ICD; BeiDou OS SIS-ICD (CGCS2000, het China Geodetic Coordinate System { "2000" }); GLONASS (het Russische Global Navigation Satellite System) ICD (PZ-90 (PZ: Parametry Zemli, het Russische geodetische datum))

seg-7d59b9c3dabc = { "5" }. Modellen voor het meetdomein en de veerkracht van GNSS

seg-dd7e88cfd703 = Klobuchar-ionosfeer voor één frequentie

seg-9920eb06b90c = semicircle-algoritme

seg-f96f24cbe154 = IS-GPS-200 §{ "20.3.3.5.2.5" }

seg-0358759614c5 = Saastamoinen-zenittroposfeer

seg-b4b7f91f6112 = hydrostatische + natte zenitvertraging

seg-ba06204996b7 = Davis et al. ({ "1985" }); Groves §{ "9.4" }

seg-9fc988ebf2aa = Niell-mappingfuncties

seg-8eb79ff7faaa = hydrostatische en natte elevatiemapping

seg-ca4642e37561 = Niell ({ "1996" })

seg-7876aa9fc732 = Anti-jam-linkbudget

seg-75e1c40bdc0f = <c1/> (C/N₀ de verhouding tussen draaggolf en ruisdichtheid, J/S de verhouding tussen jamming en signaal, Q de spectrale scheidingsfactor, Rc de chipsnelheid) → effectieve C/N₀ → verlies van lock

seg-7afcd0de9ae8 = Kaplan & Hegarty, <em>Understanding GPS/GNSS</em>, 3e druk, §{ "9.4" }

seg-c6e2f2ee16cb = Spoof- / energiedetectie

seg-15390c9b849c = Neyman–Pearson / tweezijdige χ²₁-energietoets; Φ⁻¹ via Acklam; erf via Abramowitz & Stegun { "7.1.26" }

seg-1c30c0b6a81f = klassieke detectietheorie

seg-023867611249 = Stabiliteit van de Allan-familie (ADEV/MDEV/TDEV/HDEV (ADEV: Allan-deviatie; MDEV: gemodificeerde Allan-deviatie; TDEV: tijdsdeviatie; HDEV: Hadamard-deviatie))

seg-478bb58f8a7f = met betrouwbaarheidsintervallen

seg-2abd4df32f9c = NIST SP (Special Publication) { "1065" } (Riley); Kasdin, <em>Proc. IEEE</em> ({ "1995" })

seg-a958238e3d1c = RAIM (receiver autonomous integrity monitoring) / integriteit (HPL/VPL (HPL: horizontaal beschermingsniveau; VPL: verticaal beschermingsniveau), ARAIM (advanced receiver autonomous integrity monitoring) met oplossingsscheiding)

seg-41b219635fbe = snapshot en oplossingsscheiding

seg-b971eeb2bf2b = zie <a1><c1/></a1>

seg-926261321371 = { "6" }. Validatiedatasets

seg-04863ce407e7 = <b>Vendoringbeleid.</b> Wij leggen een letterlijke kopie vast van elke validatiedataset waarvan de licentie herdistributie toestaat <em>en</em> waarvan de omvang comfortabel in git past, zodat een kloon de validatie offline kan reproduceren, zonder netwerk en zonder linkrot. Een dataset is <b>fetch-gated</b> (gedownload door een <c1/>-hulpscript naar de door git genegeerde <c2/>, waarbij alleen de kleine <em>afgeleide</em> referentiewaarden worden vastgelegd) uitsluitend wanneer de licentie herdistributie niet duidelijk toestaat, of wanneer de dataset te groot is voor git. Elke gated dataset vermeldt hieronder zijn specifieke reden; niets is gated voor het gemak.

seg-b966dd26caa6 = Dataset

seg-e0351f9b83fc = Status in de repository

seg-ea1ad9965f74 = AIAA 2006-6753 SGP4-testvectoren (alle { "666" })

seg-cb7efe21070c = Numerieke validatie van SGP4 — slechtste { "4.12" } mm

seg-a624c6877c48 = Gepubliceerde referentievectoren (Vallado, AIAA)

seg-d90675af2816 = Vendored

seg-c1cee31c42df = ⁸⁸Sr optische klok ADEV σ_y(τ) (Norcia et al., Science { "366" }:{ "93" }, { "2019" })

seg-232e54a0e396 = validatie van de fit aan de gemeten stabiliteit van optische klokken

seg-3345cefbfa3c = <b>CC-BY-4.0</b> (Creative Commons Attribution { "4.0" }; Zenodo 10.5281/zenodo.3382347)

seg-2bb00a0c58ef = NASA/USGS (NASA: National Aeronautics and Space Administration; USGS: United States Geological Survey) SRTM (Shuttle Radar Topography Mission) v3 hoogtetegel N36W117 (Death Valley, gedecimeerd tot 6 boogseconden, { "722" } KB)

seg-088a57c3a5b1 = validatie van de terrein-DEM (DEM: digitaal hoogtemodel) <c1/>-lezer op echt reliëf (Badwater Basin ≈ −{ "86" } m)

seg-ed90325543c8 = <b>Publiek domein</b> (NASA/USGS SRTM v3; via AWS (Amazon Web Services) Open Data <c1/>)

seg-9607b2318cf5 = Voorbeelden uit CCSDS 502.0/503.0 Blue Book OEM/TDM (OEM: Orbit Ephemeris Message; TDM: Tracking Data Message)

seg-b53475918422 = round-trip-validatie van de CCSDS-parser

seg-25d9f396b539 = Gepubliceerde standaardvoorbeelden (CCSDS)

seg-35dfb14360e3 = IGS (International GNSS Service) SP3 (Standard Product { "3" }, het formaat voor nauwkeurige banen) nauwkeurige baan + RINEX (Receiver Independent Exchange Format) navigatiemonsters

seg-5e321b8b5287 = baanfit- en integriteitsvalidatie

seg-ec0b6ff10fc5 = Open data van IGS (vrij voor elk gebruik, met naamsvermelding)

seg-00db9583ce55 = Snapshots van Celestrak-TLE's (two-line element sets) (<c1/>, <c2/>)

seg-4dabd0f62f90 = scenario's met echte constellaties

seg-6e7c8deb24b6 = Celestrak-voorwaarden (naamsvermelding; TLE's (two-line element sets) van Amerikaanse overheidsoorsprong)

seg-2827577f7008 = <c1/> + live <c2/>

seg-c0945969860a = Referentie-uitvoer van scipy / scikit-learn / filterpy

seg-61546d769e23 = validatie van numerieke kernels en schatters

seg-b74e03fddbca = Lokaal gegenereerd uit bibliotheken onder BSD/MIT (BSD: Berkeley Software Distribution-licentie)

seg-9d818fc79012 = <c1/> (+ generatorscripts)

seg-4d6c3069b01f = Referentiedeviaties van Stable32 (decade-ladders voor ADEV/HDEV)

seg-0a7b677330a6 = pariteit van Allan-schatters

seg-3c91f9ae6473 = Afgeleide samenvattingswaarden (klein)

seg-14aecb331164 = <b>Ruwe</b> faseserie van een 5071A-cesiumklok ({ "556 990" } punten, { "12" } MB)

seg-9d43f399613b = overlappende ADEV/HDEV op een echte Cs-klok

seg-87b53409bedb = <b>Onduidelijk</b> — <c1/> valt onder LGPL-3.0 (de GNU Lesser General Public License, een softwarelicentie) zonder <em>expliciete toestemming voor herdistributie van gegevens</em>; het bestand is uitgesloten van de PyPI-distributie (Python Package Index)

seg-b741be74c8ad = <c1/>; afgeleide ladders vastgelegd

seg-5e07eabcfe78 = <b>ruwe</b> PHASE.DAT (regressieserie van 1000 punten)

seg-d9f61f4b985c = Pariteitsserie voor Stable32-schatters

seg-df8e0a135895 = <b>Onduidelijk</b> — meegeleverd met de commerciële Stable32 (Hamilton Technical Services); NIST SP { "1065" } is publiek domein maar drukt de waarden niet af

seg-332b36d2b91f = <c1/>; afgeleide ladders vastgelegd

seg-dd2ee7a9f1fa = JammerTest { "2024" }-opname van GNSS-jamming/spoofing ({ "1.4" } GB)

seg-20065daf2305 = kalibratie van veerkracht- en anomaliescenario's

seg-a4410133d410 = GPL-3.0-or-later (de GNU General Public License; Zenodo 10.5281/zenodo.15910563) — herdistributie toegestaan, maar <b>de omvang overschrijdt de bestandslimiet van { "100" } MB van GitHub</b> en GPL-copyleft botst met de AGPL-boom (Affero General Public License)

seg-d4c7d2f9ea0d = <b>Fetch-gated</b>; verwijs naar de DOI (digital object identifier)

seg-c0e39f83efcd = De licentiestatus van elke fetch-gated dataset is nagezocht bij de autoriteit upstream; de twee "onduidelijke" klokdatasets blijven gated in afwachting van een expliciete toestemming voor herdistributie (de waarden die wij <em>wel</em> mogen publiceren leggen wij al vast), en de JammerTest-set is gated op grond van omvang en copyleft, ondanks haar open licentie.

seg-e104e19931d4 = { "7" }. Nieuwere domeinen — waar hun parameters vandaan komen

seg-c11f7c73d10b = Voor de typen die na de bovenstaande tabellen zijn toegevoegd geldt dezelfde regel. Elke rij noemt de bron en de status in de verificatiematrix van de mogelijkheid die erop is gebouwd (<a1><c1/></a1> bevat de volledige rij).

seg-5d2c25dd2ff3 = Telecomtijdsynchronisatie (<c1/>)

seg-c2ae6b1fe666 = synchronisatiemaskers

seg-e247606fe749 = ITU-T-aanbevelingen (Telecommunication Standardization Sector van de International Telecommunication Union), elke limiet met zijn tabel of clausule, vermeld in <a1><c1/></a1>

seg-1150ab344107 = MODELLED (transcriptie)

seg-01d31590ca44 = oscillatorvoorinstellingen <c1/>, <c2/>, <c3/>, <c4/>

seg-9a4c0c214c54 = vier datasheets van Microchip, documentnummers in <a1><c1/></a1>

seg-a03ea8950ab0 = schatters voor MTIE (maximum time interval error) en TDEV (time deviation)

seg-389e18e1a900 = allantools { "2024.06" } op <c1/>

seg-29edfc0f6a6d = Zonnestelsel (<c1/>, <c2/>)

seg-df22756e5209 = planeetposities uit de Keplerelementen van Standish van het JPL (Jet Propulsion Laboratory)

seg-194e3a13d51a = gecontroleerd aan de toestandsvectoren van JPL Horizons DE441 (Development Ephemeris { "441" }) in <c1/>

seg-6d23934b3cb7 = VALIDATED; Uranus, Neptunus, Pluto en de manen MODELLED

seg-a2624ce2e89a = gravitatieparameters, stralen en rotatie van elk hemellichaam

seg-4d501821b508 = lichaamsrecords van JPL Horizons en de tabel met fysische parameters van satellieten van het JPL

seg-f2715a76f0ec = Constellatieontwerp (<c1/>)

seg-784e471cdada = nominale slots van GPS, Galileo en GLONASS

seg-479ddafe5925 = Galileo Open Service Service Definition Document { "1.1" }; GPS Standard Positioning Service Performance Standard, 5e editie

seg-b5e3dc8605b1 = PNT in een lage baan om de aarde (LEO) (<c1/>, <c2/>, <c3/>)

seg-0a535468ad51 = voorinstellingen van benoemde systemen

seg-aae7fe16f69a = de aangehaalde openbare cijfers, elke voorinstelling met haar bron

seg-a72c37136e3a = LEO-navigatiebericht (<c1/>)

seg-ac50550a250f = gewichten voor de range-fout van het signaal in de ruimte

seg-5dae296d5484 = Montenbruck, Steigenberger en Hauschild ({ "2018" }), <em>Advances in Space Research</em>

seg-9148986e8610 = efemeridenmodel met 22 parameters

seg-5b82ad0bd2c9 = Liu et al. ({ "2025" }), <em>Remote Sensing</em> { "17" }({ "16" }):{ "2894" }

seg-2080b4fc31a8 = Herkomstvoettekst van grafieken

seg-22d0b06d5df4 = Elke grafiek die Kshana rendert — in de browserplayground, in de export <c1/> van de CLI (command-line interface) en in de grafiek in het afdrukbare rapport <c2/> (HTML, HyperText Markup Language) — wordt rechtsonder gemerkt met:

seg-d8b4de856202 = <c1/> bestaat uit de eerste { "12" } hexadecimale tekens van de <b>scenario-hash</b> van de run: een SHA-256 (SHA: Secure Hash Algorithm) over de <em>canonieke</em> scenariodefinitie (seed, drempels, modelparameters, GNSS-vensters, enzovoort). Het is dezelfde vingerafdruk die in de samenvatting van één regel van de run staat en in het veld <c2/> van de resultaat-JSON. (Typen waarvan het resultaatdocument geen <c3/> bevat, zoals de integriteits- en maanrapporten, vallen terug op een SHA-256 van de TOML-bron van het scenario (Tom's Obvious, Minimal Language), zodat elke grafiek toch een stabiele vingerafdruk heeft.)

seg-8d218131da01 = Omdat de hash deterministisch en gevoelig voor de invoer is, identificeert een opgeslagen of geplakt grafiekbeeld zichzelf: het legt de engineversie vast, het exacte scenario dat het heeft voortgebracht (voor reproductie bit voor bit) en de bron — en elke gewijzigde parameter levert een andere hash op, zodat een verkeerd gelabelde grafiek te herkennen is.

seg-89c9b001868f = Hoe te citeren en te reproduceren

seg-6eca19b7978c = Elk resultaat is reproduceerbaar uit <c1/>. Citeer de engine via <a1><c2/></a1> / de Zenodo-concept-DOI <a2>10.5281/zenodo.20528627</a2>, en citeer de bronnen van de <em>parameters</em> hierboven voor de cijfers waarvan een bepaalde run afhangt — ze reizen mee in de velden <c3/> van de resultaat-JSON, zodat een gepubliceerd resultaat zichzelf documenteert.

seg-c5c58ef3771c = Waar een cijfer een ruimtedoel op grondhardware is (elk cijfer van een optische strontiumklok) of een demonstratie in een grondlaboratorium (koude-atoomversnellingsmeter), zeggen dit document en de herkomst van het resultaat dat uitdrukkelijk. Kshana presenteert laboratorium- of doelcijfers niet als gevlogen prestaties.

seg-925d456df88c = <s1>Vorige</s1>Claims versus werkelijkheid

seg-19e8fefd1ceb = <s1>Volgende</s1>Reproduceerbaarheid
