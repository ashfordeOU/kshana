# docs--provenance: translations (sv)

seg-9a2a5f0a8a02 = Solsystemet

seg-d01db1c2710a = Referens

seg-28e87f407a10 = Område

seg-ad856ad710eb = Status

seg-6e0cb6acc073 = VALIDATED

seg-f63dd3d7aad4 = Källa

seg-638b8d451550 = Sensor

seg-d4a762001549 = Licens

seg-60cd077d82a7 = Modell

seg-2afa300864a9 = Parametrar

seg-32b620b3574e = Användning

seg-f3de25879362 = Källa: <c1/>

seg-257526f1f93f = Proveniens — varje parameter kan spåras till en publicerad källa

seg-8c12958898a8 = Kshanas centrala ärlighetsprincip är att <b>varje sensorparameter, fysikalisk modell och valideringsdatamängd kan spåras till en publicerad källa</b> — ett datablad, en referentgranskad artikel, en ICD för signal i rymden (gränssnittsspecifikation) eller en standard. Det här dokumentet samlar dessa provenienssträngar i en enda citerbar referenstabell.

seg-279914171c2e = Proveniens är inte bara dokumentation: varje sensortabell i ett scenario (till exempel <c1/> och <c2/>) har en <c3/>-sträng (<c4/> i <c5/>; <c6/> i <c7/> för felmodellen för tröghetsmätenheten (IMU)) som <b>följer med in i resultat-JSON</b> (JavaScript Object Notation) som <c8/> och <c9/>, så varje körning bär sina egna parameterhänvisningar. Resultatets <c10/>-block märker dessutom varje numeriskt fält med en proveniensklass (<c11/>, <c12/>, <c13/>, <c14/>, …). Tabellerna nedan är det sammanställda, läsbara registret över dessa strängar, plus proveniensen för algoritmer och validering från källkodens kommentarer.

seg-683fd369407a = Mognadsgraden anges ärligt genomgående: <b>flygkvalificerad</b> (har flugit), <b>markbaserat labb / sondraket</b> (demonstrerad, inte flugen) eller <b>rymdmål på markbaserad hårdvara</b> (ett ambitionsmål för hårdvara som inte har flugit — framför allt varje värde för strontium-klockor med optiskt gitter). Se <a1><c1/></a1> för etiketterna per värde (<c2/> / <c3/> / <c4/>) och <a2><c5/></a2> för diskussionen om mognad hos markbaserat labb jämfört med flyg.

seg-80834864bfdd = { "1" }. Parametrar för klockor och frekvensreferenser

seg-305f560d4b08 = Nyckelvärde

seg-c35a20fa2529 = Mognad

seg-302e481e5014 = Microchip (Microsemi) SA.45s / SA65 CSAC (atomklocka i chipformat)

seg-a000ca420690 = σ_y({ "1" } s) = { "3.0" }×{ "10" }⁻¹⁰

seg-222707a1bde3 = Tillverkarens datablad

seg-97709a803dea = <b>flygkvalificerad</b> (använd kommersiell komponent)

seg-75db01df1aea = Strontium-klocka med optiskt gitter (rymdmål)

seg-f6f430d898ed = σ_y({ "1" } s) = { "1" }×{ "10" }⁻¹⁵

seg-1996a1d92bb1 = Origlia, Schiller, Bongs m.fl., <a1>arXiv:{ "1503.08457" }</a1>

seg-b8c64caf79f3 = <b>rymdmål på markbaserad hårdvara</b> — ingen optisk Sr-klocka har flugit

seg-b5a006507475 = Strontium-klocka med optiskt gitter (laboratorierekord)

seg-8a6ca23b19a9 = σ_y({ "1" } s) = { "4.8" }×{ "10" }⁻¹⁷

seg-b21bb1b6bf40 = Oelker m.fl., <em>Nature Photonics</em> ({ "2019" })

seg-95fb87b3a118 = endast markbaserat labb

seg-a36f415cccab = ACES/PHARAO (Atomic Clock Ensemble in Space / Projet d'Horloge Atomique par Refroidissement d'Atomes en Orbite; referens på ISS (Internationella rymdstationen))

seg-9d6acc3191a5 = storleksordningen { "1" }×{ "10" }⁻¹⁶ efter integrering över flera dygn

seg-1cddc44025d7 = ESA (Europeiska rymdorganisationen) ACES/PHARAO, i drift på ISS sedan april { "2025" } (hänvisa till ESA:s publicerade resultat)

seg-75b7bb5ca4c8 = <b>flygkvalificerad</b> (mikrovåg/maser, inte optisk)

seg-aeb8f189db37 = Allans vitfrekvenskoefficient som holdover-modellen använder är <c1/>; flickerfrekvensmodulering (flicker FM) och åldring modelleras bara där en <c2/> anges uttryckligen (se <a1><c3/></a1>), annars modelleras de inte.

seg-bfe4524b6664 = { "2" }. Parametrar för tröghetssensorer

seg-5cd1984ba399 = Nyckelvärden

seg-53ad9ba8cecb = Exails hybrida kvantaccelerometertriad

seg-b40c95a6bea5 = biasstabilitet { "6" }×{ "10" }⁻⁸ g = { "5.88" }×{ "10" }⁻⁷ m/s² ({ "24" } h); brus { "22" } µg/√Hz = { "2.16" }×{ "10" }⁻⁴ (m/s²)/√Hz

seg-fdb8f1d648ba = Templier m.fl., <em>Science Advances</em> ({ "2022" }), <a1>arXiv:{ "2209.13209" }</a1>

seg-570f41ff76c9 = Honeywell QA-2000, kvartsaccelerometer i navigeringsklass

seg-a7dbc9a9705e = biasstabilitet ~{ "160" } µg = { "1.57" }×{ "10" }⁻³ m/s²; brus ~{ "20" } µg/√Hz; biasinstabilitet ~{ "1" } µg

seg-3ad7ce01c6e2 = Tillverkaren / Groves <em>AESS (Aerospace and Electronic Systems Society) Tutorial</em>

seg-37c841945d3e = Felmodell för IMU (skalfaktor, feljustering, g-känslighet, kvantisering, rampfel)

seg-b7547264e608 = fem systematiska kategorier

seg-2f20d848f9d3 = IEEE (Institute of Electrical and Electronics Engineers) Std 952-1997 §A.2; Groves { "2013" } §{ "4.3" }, tabell { "4.1" }

seg-c24b9890cf3b = modell

seg-67a38b3fe143 = Strapdown-mekanisering (NED, nord-öst-ned; coning/sculling)

seg-832b3645b515 = kvaternionbaserad attityd §{ "2.2" }, §{ "5.5" }; NED-mekanisering §{ "5.4" }; gravitation §{ "2.4" }

seg-58c85c15b0aa = Groves, <em>Principles of GNSS (global navigation satellite system), Inertial, and Multisensor Integrated Navigation Systems</em>, 2:a uppl.

seg-ac7ef2be17e0 = { "3" }. Parametrar för överföring av tid och frekvens

seg-7634c6f4b32c = Länk

seg-dddf65bbb231 = Tvåvägs optisk länk i fritt rum (mellan satelliter)

seg-e3a8990e650a = laboratoriegolv ~{ "1" } fs; { "1" } ps som mål som är trovärdigt i omloppsbana

seg-1adf3425eda9 = Giorgetta m.fl. ({ "2013" }, <em>Nature Photonics</em>); Deschênes m.fl. ({ "2016" }, <em>Physical Review X</em>)

seg-9ab60d7ed2a9 = TWSTFT (tvåvägsöverföring av tid och frekvens via satellit, Ku-band)

seg-543939310789 = en enskild session ~{ "0.5" } ns

seg-7f6127bdb4d9 = BIPM (Internationella byrån för mått och vikt) / PTB (Physikalisch-Technische Bundesanstalt, Tysklands nationella metrologiinstitut) / NIST (National Institute of Standards and Technology)

seg-d1f0ed9c0323 = { "4" }. Modeller för bana, tidssystem och referenssystem

seg-2ad53ecbee02 = Ekvation / standard

seg-7ed15b9389e0 = Referens (källkommentar)

seg-4d6989c7153e = Propagering med SGP4/SDP4 (SGP4: Simplified General Perturbations { "4" }; SDP4: Simplified Deep-space Perturbations { "4" })

seg-0d46975247cc = SGP4-modellen WGS-72 (WGS: World Geodetic System)

seg-6dcfe89aeb8f = Vallado m.fl., <em>"Revisiting Spacetrack Report #3"</em>, <b>AIAA (American Institute of Aeronautics and Astronautics) 2006-6753</b> ({ "2006" })

seg-e46bf46a4d35 = Skottsekunder / tidssystem (UTC/TAI/TT/UT1 (UTC: koordinerad universell tid; TAI: internationell atomtid; TT: terrester tid; UT1: universell tid { "1" }, jordrotationstid))

seg-7505e93b9bf8 = regim med heltalsskottsekunder från 1972-01-01

seg-0ea35809be61 = IERS (International Earth Rotation and Reference Systems Service) Conventions ({ "2010" }); skottsekundshistorik från IERS Bulletin C

seg-d25f68665f8e = Jordrotationsvinkel

seg-a3a803bdc8a0 = IAU (Internationella astronomiska unionen) { "2000" }, resolution B1.8

seg-049ad81ff5e8 = Position och klocka för SV (rymdfarkost, alltså en satellit) ur sänd efemerid

seg-a1a595008b2a = användaralgoritm, relativistisk <c1/>, <c2/>

seg-8e2e3089e2e6 = IS-GPS-200 (IS: Interface Specification; GPS: Global Positioning System) §{ "20.3.3.4.3.1" } / §{ "20.3.3.3.3.1" }

seg-8e14a54b1f09 = Efemeriskonstanter för Galileo / QZSS (Japans Quasi-Zenith Satellite System) / BeiDou (μ, Ω̇ₑ, C̄₂₀)

seg-93b03e3b3e43 = ICD:er för signal i rymden (gränssnittsspecifikationer) per system

seg-c7c6759c0373 = Galileo OS (Open Service) SIS ICD; BeiDou OS SIS ICD (CGCS2000, China Geodetic Coordinate System { "2000" }); GLONASS (Rysslands globala satellitnavigeringssystem) ICD (PZ-90 (PZ: Parametry Zemli, det ryska geodetiska datumet))

seg-7d59b9c3dabc = { "5" }. Modeller för GNSS i mätdomänen och för resiliens

seg-dd7e88cfd703 = Klobuchars jonosfär för en frekvens

seg-9920eb06b90c = semicirkelalgoritm

seg-f96f24cbe154 = IS-GPS-200 §{ "20.3.3.5.2.5" }

seg-0358759614c5 = Saastamoinens zenittroposfär

seg-b4b7f91f6112 = hydrostatisk + våt zenitfördröjning

seg-ba06204996b7 = Davis m.fl. ({ "1985" }); Groves §{ "9.4" }

seg-9fc988ebf2aa = Niells avbildningsfunktioner

seg-8eb79ff7faaa = hydrostatisk och våt, avbildning över elevation

seg-ca4642e37561 = Niell ({ "1996" })

seg-7876aa9fc732 = Länkbudget för anti-jam

seg-75e1c40bdc0f = <c1/> (C/N₀ är förhållandet mellan bärvåg och brusdensitet, J/S förhållandet mellan jamming och signal, Q spektralseparationsfaktorn, Rc chiphastigheten) → effektivt C/N₀ → förlorad låsning

seg-7afcd0de9ae8 = Kaplan & Hegarty, <em>Understanding GPS/GNSS</em>, 3:e uppl., §{ "9.4" }

seg-c6e2f2ee16cb = Spoof- / energidetektering

seg-15390c9b849c = Neyman–Pearson / tvåsidigt χ²₁-energitest; Φ⁻¹ enligt Acklam; erf enligt Abramowitz & Stegun { "7.1.26" }

seg-1c30c0b6a81f = klassisk detektionsteori

seg-023867611249 = Stabilitet i Allan-familjen (ADEV/MDEV/TDEV/HDEV (ADEV: Allan-deviation; MDEV: modifierad Allan-deviation; TDEV: tidsdeviation; HDEV: Hadamard-deviation))

seg-478bb58f8a7f = med konfidensintervall

seg-2abd4df32f9c = NIST SP (Special Publication) { "1065" } (Riley); Kasdin, <em>Proc. IEEE</em> ({ "1995" })

seg-a958238e3d1c = RAIM (autonom integritetsövervakning i mottagaren) / integritet (HPL/VPL (HPL: horisontell skyddsnivå; VPL: vertikal skyddsnivå), ARAIM (avancerad autonom integritetsövervakning i mottagaren) med lösningsseparation)

seg-41b219635fbe = ögonblicksbild och lösningsseparation

seg-b971eeb2bf2b = se <a1><c1/></a1>

seg-926261321371 = { "6" }. Valideringsdatamängder

seg-04863ce407e7 = <b>Policy för medföljande data.</b> Vi checkar in en ordagrann kopia av varje valideringsdatamängd vars licens tillåter vidaredistribution <em>och</em> vars storlek ryms bekvämt i git, så att en klon kan återskapa valideringen offline utan nätverk och utan döda länkar. En datamängd är <b>hämtningsspärrad</b> (nedladdad av en hjälpare <c1/> till den git-ignorerade <c2/>, där bara de små <em>härledda</em> referensvärdena checkas in) endast när licensen inte tydligt tillåter vidaredistribution eller när den är för stor för git. Varje spärrad datamängd anger sin särskilda orsak nedan; ingenting spärras av bekvämlighet.

seg-b966dd26caa6 = Datamängd

seg-e0351f9b83fc = Status i repot

seg-ea1ad9965f74 = AIAA 2006-6753, testvektorer för SGP4 (alla { "666" })

seg-cb7efe21070c = Numerisk validering av SGP4 — sämst { "4.12" } mm

seg-a624c6877c48 = Publicerade referensvektorer (Vallado, AIAA)

seg-d90675af2816 = Medföljer

seg-c1cee31c42df = ⁸⁸Sr, ADEV σ_y(τ) för optisk klocka (Norcia m.fl., Science { "366" }:{ "93" }, { "2019" })

seg-232e54a0e396 = validering av anpassning till uppmätt stabilitet för optisk klocka

seg-3345cefbfa3c = <b>CC-BY-4.0</b> (Creative Commons Attribution { "4.0" }; Zenodo 10.5281/zenodo.3382347)

seg-2bb00a0c58ef = NASA/USGS (NASA: National Aeronautics and Space Administration; USGS: United States Geological Survey) SRTM (Shuttle Radar Topography Mission) v3, höjdruta N36W117 (Death Valley, decimerad till 6 bågsekunder, { "722" } KB)

seg-088a57c3a5b1 = validering av läsare för terräng-DEM (DEM: digital höjdmodell) <c1/> på verklig reliefs (Badwater Basin ≈ −{ "86" } m)

seg-ed90325543c8 = <b>Allmän egendom</b> (NASA/USGS SRTM v3; via AWS (Amazon Web Services) Open Data <c1/>)

seg-9607b2318cf5 = Exempel i CCSDS 502.0/503.0 Blue Book för OEM/TDM (OEM: Orbit Ephemeris Message; TDM: Tracking Data Message)

seg-b53475918422 = validering av tur-och-retur för CCSDS-tolkaren

seg-25d9f396b539 = Publicerade standardexempel (CCSDS)

seg-35dfb14360e3 = IGS (International GNSS Service) SP3 (Standard Product { "3" }, formatet för precisa banor), precis bana + navigeringsprover i RINEX (Receiver Independent Exchange Format)

seg-5e321b8b5287 = validering av bananpassning och integritet

seg-ec0b6ff10fc5 = Öppna data från IGS (fria för all användning, med angivande av källa)

seg-00db9583ce55 = Ögonblicksbilder av Celestrak TLE (tvåradiga elementmängder) (<c1/>, <c2/>)

seg-4dabd0f62f90 = scenarier med verkliga konstellationer

seg-6e7c8deb24b6 = Celestraks villkor (angivande av källa; TLE:er (tvåradiga elementmängder) med ursprung hos den amerikanska staten)

seg-2827577f7008 = <c1/> + live <c2/>

seg-c0945969860a = Referensutdata från scipy / scikit-learn / filterpy

seg-61546d769e23 = validering av numeriska kärnor och estimatorer

seg-b74e03fddbca = Genererade lokalt från bibliotek under BSD/MIT (BSD: Berkeley Software Distribution-licensen)

seg-9d818fc79012 = <c1/> (+ generatorskript)

seg-4d6c3069b01f = Referensdeviationer från Stable32 (ADEV/HDEV-stegar per dekad)

seg-0a7b677330a6 = paritet för Allan-estimatorer

seg-3c91f9ae6473 = Härledda sammanfattningsvärden (små)

seg-14aecb331164 = <b>Rå</b> fasserie från en 5071A-cesiumklocka ({ "556 990" } punkter, { "12" } MB)

seg-9d43f399613b = överlappande ADEV/HDEV på en verklig Cs-klocka

seg-87b53409bedb = <b>Oklart</b> — <c1/> står under LGPL-3.0 (GNU Lesser General Public License, en programvarulicens) utan <em>uttryckligt tillstånd att vidaredistribuera data</em>; filen är undantagen från PyPI-distributionen (Python Package Index)

seg-b741be74c8ad = <c1/>; härledda stegar incheckade

seg-5e07eabcfe78 = <b>rå</b> PHASE.DAT (regressionsserie med 1000 punkter)

seg-d9f61f4b985c = Serie för estimatorparitet med Stable32

seg-df8e0a135895 = <b>Oklart</b> — distribueras med den kommersiella Stable32 (Hamilton Technical Services); NIST SP { "1065" } är allmän egendom men skriver inte ut värdena

seg-332b36d2b91f = <c1/>; härledda stegar incheckade

seg-dd2ee7a9f1fa = JammerTest { "2024" }, inspelning av jamming/spoofing för GNSS ({ "1.4" } GB)

seg-20065daf2305 = kalibrering av scenarier för resiliens/avvikelser

seg-a4410133d410 = GPL-3.0-or-later (GNU General Public License; Zenodo 10.5281/zenodo.15910563) — vidaredistribution tillåten, men <b>storleken överstiger GitHubs filgräns på { "100" } MB</b> och GPL:s copyleft står i konflikt med AGPL-trädet (Affero General Public License)

seg-d4c7d2f9ea0d = <b>Hämtningsspärrad</b>; hänvisa till DOI (digital objektidentifierare)

seg-c0e39f83efcd = Licensstatusen för varje hämtningsspärrad datamängd undersöktes mot den ursprungliga rättighetshavaren; de två "oklara" klockdatamängderna förblir spärrade i väntan på ett uttryckligt tillstånd till vidaredistribution (vi checkar redan in de värden vi <em>har</em> licens att publicera), och JammerTest-mängden är spärrad på grund av storlek/copyleft trots sin öppna licens.

seg-e104e19931d4 = { "7" }. Nyare områden — varifrån deras parametrar kommer

seg-c11f7c73d10b = De typer som lagts till sedan tabellerna ovan följer samma regel. Varje rad anger källan och verifieringsmatrisens status för förmågan som bygger på den (<a1><c1/></a1> har hela raden).

seg-5d2c25dd2ff3 = Telekomtidssynkronisering (<c1/>)

seg-c2ae6b1fe666 = synkroniseringsmasker

seg-e247606fe749 = ITU-T-rekommendationer (Telecommunication Standardization Sector of the International Telecommunication Union), varje gräns med sin tabell eller klausul, förtecknade i <a1><c1/></a1>

seg-1150ab344107 = MODELLED (avskrift)

seg-01d31590ca44 = förinställningar för oscillatorer <c1/>, <c2/>, <c3/>, <c4/>

seg-9a4c0c214c54 = fyra datablad från Microchip, dokumentnummer i <a1><c1/></a1>

seg-a03ea8950ab0 = Estimatorer för MTIE (största tidsintervallfel) och TDEV (tidsdeviation)

seg-389e18e1a900 = allantools { "2024.06" } på <c1/>

seg-29edfc0f6a6d = Solsystemet (<c1/>, <c2/>)

seg-df22756e5209 = planetpositioner ur JPL:s (Jet Propulsion Laboratory) keplerska Standish-element

seg-194e3a13d51a = kontrollerade mot tillståndsvektorer från JPL Horizons DE441 (Development Ephemeris { "441" }) i <c1/>

seg-6d23934b3cb7 = VALIDATED; Uranus, Neptunus, Pluto och månarna MODELLED

seg-a2624ce2e89a = gravitationsparametrar, radier och rotation för varje himlakropp

seg-4d501821b508 = JPL Horizons-poster för himlakroppar och JPL:s tabell över fysikaliska parametrar för satelliter

seg-f2715a76f0ec = Utformning av konstellationer (<c1/>)

seg-784e471cdada = nominella positioner för GPS, Galileo och GLONASS

seg-479ddafe5925 = Galileo Open Service Service Definition Document { "1.1" }; GPS Standard Positioning Service Performance Standard, 5:e utgåvan

seg-b5e3dc8605b1 = PNT för LEO (låg omloppsbana runt jorden) (<c1/>, <c2/>, <c3/>)

seg-0a535468ad51 = förinställningar för namngivna system

seg-aae7fe16f69a = de angivna offentliga siffrorna, varje förinställning med sin källa

seg-a72c37136e3a = Navigeringsmeddelande för LEO (<c1/>)

seg-ac50550a250f = vikter för avståndsfel i signal i rymden

seg-5dae296d5484 = Montenbruck, Steigenberger och Hauschild ({ "2018" }), <em>Advances in Space Research</em>

seg-9148986e8610 = efemeridmodell med 22 parametrar

seg-5b82ad0bd2c9 = Liu m.fl. ({ "2025" }), <em>Remote Sensing</em> { "17" }({ "16" }):{ "2894" }

seg-2080b4fc31a8 = Proveniensfot för diagram

seg-22d0b06d5df4 = Varje diagram som Kshana ritar — i lekplatsen i webbläsaren, i exporten <c1/> från kommandoraden (CLI) och i diagrammet i den utskrivbara rapporten <c2/> (HTML, HyperText Markup Language) — stämplas nere till höger med:

seg-d8b4de856202 = <c1/> är de första { "12" } hexadecimala tecknen i körningens <b>scenario-hash</b>: en SHA-256 (SHA: Secure Hash Algorithm) över den <em>kanoniska</em> scenariodefinitionen (frö, trösklar, modellparametrar, GNSS-fönster och så vidare). Det är samma fingeravtryck som syns i körningens enradiga sammanfattning och i fältet <c2/> i resultat-JSON. (Typer vars resultatdokument saknar <c3/>, till exempel rapporterna om integritet och om månen, faller tillbaka på en SHA-256 av scenariots TOML-källa (Tom's Obvious, Minimal Language), så att varje diagram ändå har ett stabilt fingeravtryck.)

seg-8d218131da01 = Eftersom hashen är deterministisk och känslig för indata är en sparad eller inklistrad diagrambild självidentifierande: den anger motorversionen, det exakta scenariot som gav den (för bit-för-bit-reproduktion) och källan — och varje ändrad parameter ger en annan hash, så ett felmärkt diagram kan upptäckas.

seg-89c9b001868f = Så citerar och reproducerar du

seg-6eca19b7978c = Varje resultat kan reproduceras utifrån <c1/>. Citera motorn via <a1><c2/></a1> / Zenodos övergripande DOI <a2>10.5281/zenodo.20528627</a2>, och citera <em>parameter</em>källorna ovan för de värden som en viss körning beror på — de följer med i resultat-JSON:s <c3/>-fält, så ett publicerat resultat dokumenterar sig självt.

seg-c5c58ef3771c = Där ett värde är ett rymdmål på markbaserad hårdvara (varje siffra för strontium-klockor med optiskt gitter) eller en demonstration i markbaserat labb (kall-atom-accelerometer) säger det här dokumentet och resultatets proveniens det uttryckligen. Kshana presenterar inte labb- eller målvärden som flugen prestanda.

seg-925d456df88c = <s1>Föregående</s1>Anspråk mot verkligheten

seg-19e8fefd1ceb = <s1>Nästa</s1>Reproducerbarhet
