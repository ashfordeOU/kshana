# docs--provenance: translations (da)

seg-9a2a5f0a8a02 = Solsystemet

seg-d01db1c2710a = Reference

seg-28e87f407a10 = Domæne

seg-ad856ad710eb = Status

seg-6e0cb6acc073 = VALIDATED

seg-f63dd3d7aad4 = Kilde

seg-638b8d451550 = Sensor

seg-d4a762001549 = Licens

seg-60cd077d82a7 = Model

seg-2afa300864a9 = Parametre

seg-32b620b3574e = Brug

seg-f3de25879362 = Kilde: <c1/>

seg-257526f1f93f = Proveniens — hver parameter kan føres tilbage til en offentliggjort kilde

seg-8c12958898a8 = Kshanas centrale redelighedsdisciplin er, at <b>hver sensorparameter, hver fysisk model og hvert valideringsdatasæt kan føres tilbage til en offentliggjort kilde</b> — et datablad, en fagfællebedømt artikel, en ICD for signal i rummet (interface control document, grænsefladespecifikation) eller en standard. Dette dokument samler disse proveniensstrenge i én citerbar referencetabel.

seg-279914171c2e = Proveniens er ikke kun dokumentation: hver sensortabel i et scenarie (for eksempel <c1/> og <c2/>) har en <c3/>-streng (<c4/> i <c5/>; <c6/> i <c7/> for fejlmodellen til den inertielle måleenhed (IMU)), der <b>løber videre ind i resultat-JSON'en</b> (JavaScript Object Notation) som <c8/> og <c9/>, så enhver kørsel bærer sine egne parameterhenvisninger. Resultatets <c10/>-blok mærker desuden hvert numerisk felt med en proveniensklasse (<c11/>, <c12/>, <c13/>, <c14/>, …). Tabellerne nedenfor er det samlede, menneskelæsbare indeks over disse strenge, plus den algoritmiske proveniens og valideringsproveniensen fra kildekommentarerne.

seg-683fd369407a = Modenhed er mærket redeligt overalt: <b>flight-qualified</b> (har fløjet), <b>ground-lab / sounding-rocket</b> (demonstreret, ikke fløjet) eller <b>space goal on ground hardware</b> (et ambitiøst tal for hardware, der ikke har fløjet — især hvert tal for strontium-optiske gitterure). Se <a1><c1/></a1> for mærkerne <c2/> / <c3/> / <c4/> for hvert enkelt tal og <a2><c5/></a2> for drøftelsen af modenheden fra laboratorium på jorden til flyvning.

seg-80834864bfdd = { "1" }. Parametre for ur og frekvensreference

seg-305f560d4b08 = Nøgletal

seg-c35a20fa2529 = Modenhed

seg-302e481e5014 = Microchip (Microsemi) SA.45s / SA65 CSAC (chip-scale atomic clock, atomur i chipstørrelse)

seg-a000ca420690 = σ_y({ "1" } s) = { "3.0" }×{ "10" }⁻¹⁰

seg-222707a1bde3 = Producentens datablad

seg-97709a803dea = <b>flight-qualified</b> (kommercielt produkt i drift)

seg-75db01df1aea = Strontium-optisk gitterur (rummål)

seg-f6f430d898ed = σ_y({ "1" } s) = { "1" }×{ "10" }⁻¹⁵

seg-1996a1d92bb1 = Origlia, Schiller, Bongs m.fl., <a1>arXiv:{ "1503.08457" }</a1>

seg-b8c64caf79f3 = <b>space goal on ground hardware</b> — intet optisk Sr-ur har fløjet

seg-b5a006507475 = Strontium-optisk gitterur (laboratorierekord)

seg-8a6ca23b19a9 = σ_y({ "1" } s) = { "4.8" }×{ "10" }⁻¹⁷

seg-b21bb1b6bf40 = Oelker m.fl., <em>Nature Photonics</em> ({ "2019" })

seg-95fb87b3a118 = kun laboratorium på jorden

seg-a36f415cccab = ACES/PHARAO (Atomic Clock Ensemble in Space / Projet d'Horloge Atomique par Refroidissement d'Atomes en Orbite; ISS (International Space Station) benchmark)

seg-9d6acc3191a5 = i størrelsesordenen { "1" }×{ "10" }⁻¹⁶ efter integration over flere dage

seg-1cddc44025d7 = ESA (European Space Agency) ACES/PHARAO, i drift på ISS siden april { "2025" } (henvis til ESA's offentliggjorte resultater)

seg-75b7bb5ca4c8 = <b>flight-qualified</b> (mikrobølge/maser, ikke optisk)

seg-aeb8f189db37 = Allans hvid-frekvens-koefficient, som holdover-modellen bruger, er <c1/>; flicker-frekvensmodulation (flicker FM) og aldring modelleres kun, hvor en <c2/> er sat eksplicit (se <a1><c3/></a1>), ellers modelleres de ikke.

seg-bfe4524b6664 = { "2" }. Parametre for inertialsensorer

seg-5cd1984ba399 = Nøgletal

seg-53ad9ba8cecb = Exail hybrid kvanteaccelerometer-triade

seg-b40c95a6bea5 = biasstabilitet { "6" }×{ "10" }⁻⁸ g = { "5.88" }×{ "10" }⁻⁷ m/s² ({ "24" } h); støj { "22" } µg/√Hz = { "2.16" }×{ "10" }⁻⁴ (m/s²)/√Hz

seg-fdb8f1d648ba = Templier m.fl., <em>Science Advances</em> ({ "2022" }), <a1>arXiv:{ "2209.13209" }</a1>

seg-570f41ff76c9 = Honeywell QA-2000 kvartsaccelerometer i navigationsklasse

seg-a7dbc9a9705e = biasstabilitet ~{ "160" } µg = { "1.57" }×{ "10" }⁻³ m/s²; støj ~{ "20" } µg/√Hz; biasustabilitet ~{ "1" } µg

seg-3ad7ce01c6e2 = Producent / Groves <em>AESS (Aerospace and Electronic Systems Society) Tutorial</em>

seg-37c841945d3e = IMU-fejlmodel (skalafaktor, fejljustering, g-følsomhed, kvantisering, rate-ramp)

seg-b7547264e608 = fem systematiske kategorier

seg-2f20d848f9d3 = IEEE (Institute of Electrical and Electronics Engineers) Std 952-1997 §A.2; Groves { "2013" } §{ "4.3" }, tabel { "4.1" }

seg-c24b9890cf3b = model

seg-67a38b3fe143 = Strapdown-mekanisering (NED, nord-øst-ned; coning/sculling)

seg-832b3645b515 = kvaternionattitude §{ "2.2" }, §{ "5.5" }; NED-mekanisering §{ "5.4" }; tyngdekraft §{ "2.4" }

seg-58c85c15b0aa = Groves, <em>Principles of GNSS (global navigation satellite system), Inertial, and Multisensor Integrated Navigation Systems</em>, 2. udg.

seg-ac7ef2be17e0 = { "3" }. Parametre for overførsel af tid og frekvens

seg-7634c6f4b32c = Forbindelse

seg-dddf65bbb231 = Optisk tovejs gennem frit rum (mellem satellitter)

seg-e3a8990e650a = laboratoriegulv ~{ "1" } fs; { "1" } ps som mål, der er troværdigt i kredsløb

seg-1adf3425eda9 = Giorgetta m.fl. ({ "2013" }, <em>Nature Photonics</em>); Deschênes m.fl. ({ "2016" }, <em>Physical Review X</em>)

seg-9ab60d7ed2a9 = TWSTFT (two-way satellite time and frequency transfer, Ku-bånd)

seg-543939310789 = enkelt session ~{ "0.5" } ns

seg-7f6127bdb4d9 = BIPM (International Bureau of Weights and Measures) / PTB (Physikalisch-Technische Bundesanstalt, Tysklands nationale metrologiinstitut) / NIST (National Institute of Standards and Technology)

seg-d1f0ed9c0323 = { "4" }. Modeller for kredsløb, tidssystemer og referencesystemer

seg-2ad53ecbee02 = Ligning / standard

seg-7ed15b9389e0 = Reference (kildekommentar)

seg-4d6989c7153e = SGP4/SDP4 (SGP4: Simplified General Perturbations { "4" }; SDP4: Simplified Deep-space Perturbations { "4" }) propagering

seg-0d46975247cc = WGS-72 (WGS: World Geodetic System) SGP4-modellen

seg-6dcfe89aeb8f = Vallado m.fl., <em>"Revisiting Spacetrack Report #3"</em>, <b>AIAA (American Institute of Aeronautics and Astronautics) 2006-6753</b> ({ "2006" })

seg-e46bf46a4d35 = Skudsekund / tidssystemer (UTC/TAI/TT/UT1 (UTC: Coordinated Universal Time; TAI: International Atomic Time; TT: Terrestrial Time; UT1: Universal Time { "1" }, tid for Jordens rotation))

seg-7505e93b9bf8 = regime med hele skudsekunder fra 1972-01-01

seg-0ea35809be61 = IERS (International Earth Rotation and Reference Systems Service) Conventions ({ "2010" }); skudsekundhistorik fra IERS Bulletin C

seg-d25f68665f8e = Jordens rotationsvinkel

seg-a3a803bdc8a0 = IAU (International Astronomical Union) { "2000" } resolution B1.8

seg-049ad81ff5e8 = Position/ur for SV (space vehicle, altså en satellit) fra broadcast-efemeride

seg-a1a595008b2a = brugeralgoritme, relativistisk <c1/>, <c2/>

seg-8e2e3089e2e6 = IS-GPS-200 (IS: Interface Specification; GPS: Global Positioning System) §{ "20.3.3.4.3.1" } / §{ "20.3.3.3.3.1" }

seg-8e14a54b1f09 = Efemeridekonstanter for Galileo / QZSS (Japans Quasi-Zenith Satellite System) / BeiDou (μ, Ω̇ₑ, C̄₂₀)

seg-93b03e3b3e43 = SIS-ICD'er for hvert system (interface control documents)

seg-c7c6759c0373 = Galileo OS (Open Service) SIS ICD; BeiDou OS SIS ICD (CGCS2000, China Geodetic Coordinate System { "2000" }); GLONASS (Ruslands Global Navigation Satellite System) ICD (PZ-90 (PZ: Parametry Zemli, det russiske geodætiske datum))

seg-7d59b9c3dabc = { "5" }. Modeller for GNSS i målingsdomænet og for robusthed

seg-dd7e88cfd703 = Klobuchars ionosfære for én frekvens

seg-9920eb06b90c = semicirkel-algoritme

seg-f96f24cbe154 = IS-GPS-200 §{ "20.3.3.5.2.5" }

seg-0358759614c5 = Saastamoinens troposfære i zenit

seg-b4b7f91f6112 = hydrostatisk + vådt zenitforsinkelse

seg-ba06204996b7 = Davis m.fl. ({ "1985" }); Groves §{ "9.4" }

seg-9fc988ebf2aa = Niells afbildningsfunktioner

seg-8eb79ff7faaa = hydrostatisk og våd, afbildning efter elevation

seg-ca4642e37561 = Niell ({ "1996" })

seg-7876aa9fc732 = Linkbudget for anti-jam

seg-75e1c40bdc0f = <c1/> (C/N₀ er forholdet mellem bærebølge og støjtæthed, J/S forholdet mellem jamming og signal, Q spektralseparationsfaktoren, Rc chiprate) → effektiv C/N₀ → tab af lås

seg-7afcd0de9ae8 = Kaplan & Hegarty, <em>Understanding GPS/GNSS</em>, 3. udg., §{ "9.4" }

seg-c6e2f2ee16cb = Spoof- / energidetektion

seg-15390c9b849c = Neyman–Pearson / tosidet χ²₁-energitest; Φ⁻¹ via Acklam; erf via Abramowitz & Stegun { "7.1.26" }

seg-1c30c0b6a81f = klassisk detektionsteori

seg-023867611249 = Stabilitet i Allan-familien (ADEV/MDEV/TDEV/HDEV (ADEV: Allan-deviation; MDEV: modificeret Allan-deviation; TDEV: tidsdeviation; HDEV: Hadamard-deviation))

seg-478bb58f8a7f = med konfidensintervaller

seg-2abd4df32f9c = NIST SP (Special Publication) { "1065" } (Riley); Kasdin, <em>Proc. IEEE</em> ({ "1995" })

seg-a958238e3d1c = RAIM (receiver autonomous integrity monitoring) / integritet (HPL/VPL (HPL: horizontalt beskyttelsesniveau; VPL: vertikalt beskyttelsesniveau), ARAIM (advanced receiver autonomous integrity monitoring) solution separation)

seg-41b219635fbe = snapshot og solution separation

seg-b971eeb2bf2b = se <a1><c1/></a1>

seg-926261321371 = { "6" }. Valideringsdatasæt

seg-04863ce407e7 = <b>Politik for medfølgende kopier.</b> Vi lægger en ordret kopi af hvert valideringsdatasæt ind i repositoriet, hvis licensen tillader videredistribution <em>og</em> størrelsen passer fint i git, så en klon kan gengive valideringen offline uden netværk og uden døde links. Et datasæt er <b>fetch-gated</b> (hentes af et <c1/>-hjælpeprogram ind i den git-ignorerede <c2/>, hvor kun de små <em>afledte</em> referenceværdier lægges ind i repositoriet), kun hvis licensen ikke tydeligt tillader videredistribution, eller hvis det er for stort til git. Hvert gated datasæt angiver sin konkrete grund nedenfor; intet er gated af bekvemmelighed.

seg-b966dd26caa6 = Datasæt

seg-e0351f9b83fc = Status i repositoriet

seg-ea1ad9965f74 = AIAA 2006-6753 SGP4-testvektorer (alle { "666" })

seg-cb7efe21070c = Numerisk validering af SGP4 — værste afvigelse { "4.12" } mm

seg-a624c6877c48 = Offentliggjorte referencevektorer (Vallado, AIAA)

seg-d90675af2816 = Medfølgende kopi

seg-c1cee31c42df = ⁸⁸Sr optisk ur ADEV σ_y(τ) (Norcia m.fl., Science { "366" }:{ "93" }, { "2019" })

seg-232e54a0e396 = validering af tilpasning til målt stabilitet for optisk ur

seg-3345cefbfa3c = <b>CC-BY-4.0</b> (Creative Commons Attribution { "4.0" }; Zenodo 10.5281/zenodo.3382347)

seg-2bb00a0c58ef = NASA/USGS (NASA: National Aeronautics and Space Administration; USGS: United States Geological Survey) SRTM (Shuttle Radar Topography Mission) v3 højdeflise N36W117 (Death Valley, decimeret til 6 buesekunder, { "722" } KB)

seg-088a57c3a5b1 = validering af læseren af terræn-DEM (DEM: digital højdemodel) <c1/> på virkeligt relief (Badwater Basin ≈ −{ "86" } m)

seg-ed90325543c8 = <b>Public domain</b> (NASA/USGS SRTM v3; via AWS (Amazon Web Services) Open Data <c1/>)

seg-9607b2318cf5 = CCSDS 502.0/503.0 Blue Book OEM/TDM (OEM: Orbit Ephemeris Message; TDM: Tracking Data Message), eksempler

seg-b53475918422 = validering af rundtur gennem CCSDS-parseren

seg-25d9f396b539 = Offentliggjorte standardeksempler (CCSDS)

seg-35dfb14360e3 = IGS (International GNSS Service) SP3 (Standard Product { "3" }, formatet for præcise baner) præcis bane + RINEX (Receiver Independent Exchange Format) navigationseksempler

seg-5e321b8b5287 = validering af banetilpasning og integritet

seg-ec0b6ff10fc5 = IGS åbne data (frie at bruge til alt, med kildeangivelse)

seg-00db9583ce55 = Celestrak TLE-snapshots (two-line element set) (<c1/>, <c2/>)

seg-4dabd0f62f90 = scenarier med virkelige konstellationer

seg-6e7c8deb24b6 = Celestraks vilkår (kildeangivelse; TLE'er (two-line element sets) med oprindelse i den amerikanske regering (US: United States))

seg-2827577f7008 = <c1/> + live <c2/>

seg-c0945969860a = referenceoutput fra scipy / scikit-learn / filterpy

seg-61546d769e23 = validering af numeriske kerner og estimatorer

seg-b74e03fddbca = Genereret lokalt fra biblioteker under BSD/MIT (BSD: Berkeley Software Distribution licence)

seg-9d818fc79012 = <c1/> (+ generatorscripts)

seg-4d6c3069b01f = Referencedeviationer fra Stable32 (ADEV/HDEV-trapper pr. dekade)

seg-0a7b677330a6 = paritet for Allan-estimatorer

seg-3c91f9ae6473 = Afledte oversigtsværdier (små)

seg-14aecb331164 = 5071A cæsium <b>rå</b> faseserie ({ "556 990" } punkter, { "12" } MB)

seg-9d43f399613b = overlappende ADEV/HDEV på et virkeligt Cs-ur

seg-87b53409bedb = <b>Uklart</b> — <c1/> er LGPL-3.0 (GNU Lesser General Public License, en softwarelicens) <em>uden udtrykkelig tilladelse til videredistribution af data</em>; filen er udeladt fra PyPI-distributionen (Python Package Index)

seg-b741be74c8ad = <c1/>; afledte trapper lagt ind i repositoriet

seg-5e07eabcfe78 = <b>rå</b> PHASE.DAT (regressionsserie med 1000 punkter)

seg-d9f61f4b985c = Serie til estimatorparitet med Stable32

seg-df8e0a135895 = <b>Uklart</b> — distribueres med det kommercielle Stable32 (Hamilton Technical Services); NIST SP { "1065" } er public domain, men trykker ikke værdierne

seg-332b36d2b91f = <c1/>; afledte trapper lagt ind i repositoriet

seg-dd2ee7a9f1fa = JammerTest { "2024" } optagelse af GNSS-jamming/spoofing ({ "1.4" } GB)

seg-20065daf2305 = kalibrering af scenarier for robusthed og anomalier

seg-a4410133d410 = GPL-3.0-or-later (GNU General Public License; Zenodo 10.5281/zenodo.15910563) — videredistribution er tilladt, men <b>størrelsen overstiger GitHubs filgrænse på { "100" } MB</b>, og GPL-copyleft strider mod AGPL-træet (Affero General Public License)

seg-d4c7d2f9ea0d = <b>Fetch-gated</b>; henvis til DOI'en (digital object identifier)

seg-c0e39f83efcd = Licensstatus for hvert fetch-gated datasæt er undersøgt hos den oprindelige myndighed; de to "uklare" urdatasæt forbliver gated, indtil der foreligger en udtrykkelig tilladelse til videredistribution (vi lægger allerede de værdier ind, vi <em>har</em> licens til at offentliggøre), og JammerTest-sættet er gated af hensyn til størrelse og copyleft på trods af sin åbne licens.

seg-e104e19931d4 = { "7" }. Nyere domæner — hvor deres parametre kommer fra

seg-c11f7c73d10b = De typer, der er kommet til siden tabellerne ovenfor, følger samme regel. Hver række angiver kilden og status i verifikationsmatrixen for den funktion, der bygger på den (<a1><c1/></a1> har den fulde række).

seg-5d2c25dd2ff3 = Telekommunikationens tidssynkronisering (<c1/>)

seg-c2ae6b1fe666 = synkroniseringsmasker

seg-e247606fe749 = ITU-T (Telecommunication Standardization Sector of the International Telecommunication Union) Recommendations, hver grænse med sin tabel eller sit punkt, opført i <a1><c1/></a1>

seg-1150ab344107 = MODELLED (afskrift)

seg-01d31590ca44 = oscillatorforudindstillinger <c1/>, <c2/>, <c3/>, <c4/>

seg-9a4c0c214c54 = fire Microchip-datablade, dokumentnumre i <a1><c1/></a1>

seg-a03ea8950ab0 = Estimatorer for MTIE (maximum time interval error) og TDEV (tidsdeviation)

seg-389e18e1a900 = allantools { "2024.06" } på <c1/>

seg-29edfc0f6a6d = Solsystemet (<c1/>, <c2/>)

seg-df22756e5209 = planetpositioner fra JPL's (Jet Propulsion Laboratory) Standish-keplerelementer

seg-194e3a13d51a = kontrolleret mod tilstandsvektorer fra JPL Horizons DE441 (Development Ephemeris { "441" }) i <c1/>

seg-6d23934b3cb7 = VALIDATED; Uranus, Neptun, Pluto og månerne MODELLED

seg-a2624ce2e89a = gravitationsparametre, radier og rotation for hvert legeme

seg-4d501821b508 = JPL Horizons' legemeposter og JPL's tabel over satellitters fysiske parametre

seg-f2715a76f0ec = Udformning af konstellation (<c1/>)

seg-784e471cdada = nominelle pladser for GPS, Galileo og GLONASS

seg-479ddafe5925 = Galileo Open Service Service Definition Document { "1.1" }; GPS Standard Positioning Service Performance Standard, 5. udgave

seg-b5e3dc8605b1 = LEO (low Earth orbit) PNT (<c1/>, <c2/>, <c3/>)

seg-0a535468ad51 = navngivne systemforudindstillinger

seg-aae7fe16f69a = de citerede offentlige tal, hver forudindstilling med sin kilde

seg-a72c37136e3a = LEO-navigationsbesked (<c1/>)

seg-ac50550a250f = vægte for afstandsfejl i signal i rummet

seg-5dae296d5484 = Montenbruck, Steigenberger og Hauschild ({ "2018" }), <em>Advances in Space Research</em>

seg-9148986e8610 = efemeridemodel med 22 parametre

seg-5b82ad0bd2c9 = Liu m.fl. ({ "2025" }), <em>Remote Sensing</em> { "17" }({ "16" }):{ "2894" }

seg-2080b4fc31a8 = Proveniensfod på diagrammer

seg-22d0b06d5df4 = Hvert diagram, Kshana tegner — i browserens legeplads, i CLI'ens (command-line interface) <c1/>-eksport og i diagrammet i den udskrivbare <c2/>-rapport (HTML, HyperText Markup Language) — er stemplet nederst til højre med:

seg-d8b4de856202 = <c1/> er de første { "12" } hex-tegn af kørslens <b>scenariehash</b>: en SHA-256 (SHA: Secure Hash Algorithm) over den <em>kanoniske</em> scenariedefinition (seed, tærskler, modelparametre, GNSS-vinduer og så videre). Det er det samme fingeraftryk, som står i kørslens enlinjesammenfatning og i resultat-JSON'ens felt <c2/>. (Typer, hvis resultatdokument ikke har noget <c3/>, såsom rapporterne om integritet og om Månen, falder tilbage til en SHA-256 af scenariets kilde-TOML (Tom's Obvious, Minimal Language), så hvert diagram stadig har et stabilt fingeraftryk.)

seg-8d218131da01 = Fordi hashen er deterministisk og følsom over for input, identificerer et gemt eller indsat diagrambillede sig selv: det registrerer motorens version, det præcise scenarie, der frembragte det (til gengivelse bit for bit), og kilden — og enhver ændret parameter giver en anden hash, så et fejlmærket diagram kan opdages.

seg-89c9b001868f = Sådan citerer og gengiver du

seg-6eca19b7978c = Hvert resultat kan gengives ud fra <c1/>. Citér motoren via <a1><c2/></a1> / Zenodo-konceptets DOI <a2>10.5281/zenodo.20528627</a2>, og citér de <em>parameter</em>kilder, der står ovenfor, for de tal, en given kørsel afhænger af — de følger med i resultat-JSON'ens <c3/>-felter, så et offentliggjort resultat dokumenterer sig selv.

seg-c5c58ef3771c = Hvor et tal er et rummål på hardware på jorden (hvert tal for strontium-optiske ure) eller en demonstration i laboratorium på jorden (kold-atom-accelerometer), siger dette dokument og resultatets proveniens det udtrykkeligt. Kshana fremstiller ikke laboratorie- eller måltal som ydeevne under flyvning.

seg-925d456df88c = <s1>Forrige</s1>Påstande mod virkeligheden

seg-19e8fefd1ceb = <s1>Næste</s1>Reproducerbarhed
