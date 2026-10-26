# docs--provenance: translations (nb)

seg-9a2a5f0a8a02 = Solsystemet

seg-d01db1c2710a = Referanse

seg-28e87f407a10 = Område

seg-ad856ad710eb = Status

seg-6e0cb6acc073 = VALIDATED

seg-f63dd3d7aad4 = Kilde

seg-638b8d451550 = Sensor

seg-d4a762001549 = Lisens

seg-60cd077d82a7 = Modell

seg-2afa300864a9 = Parametere

seg-32b620b3574e = Bruk

seg-f3de25879362 = Kilde: <c1/>

seg-257526f1f93f = Proveniens – hver parameter kan spores til en publisert kilde

seg-8c12958898a8 = Kshanas sentrale ærlighetsdisiplin er at <b>hver sensorparameter, fysiske modell og hvert valideringsdatasett kan spores til en publisert kilde</b> – et datablad, en fagfellevurdert artikkel, en ICD for signal i rommet (interface control document) eller en standard. Dette dokumentet samler disse proveniensstrengene i én enkelt siterbar referansetabell.

seg-279914171c2e = Proveniens er ikke bare dokumentasjon: hver sensortabell i et scenario (for eksempel <c1/> og <c2/>) har en <c3/>-streng (<c4/> i <c5/>; <c6/> i <c7/> for feilmodellen til treghetsmåleenheten (IMU)) som <b>flyter videre inn i resultat-JSON-en</b> (JavaScript Object Notation) som <c8/> og <c9/>, slik at hver kjøring bærer sine egne parametersiteringer. Resultatets <c10/>-blokk merker også hvert numerisk felt med en proveniensklasse (<c11/>, <c12/>, <c13/>, <c14/>, …). Tabellene nedenfor er den samlede, menneskelesbare indeksen over disse strengene, pluss proveniensen for algoritmer og validering fra kildekommentarene.

seg-683fd369407a = Modenhet er merket ærlig gjennomgående: <b>flygekvalifisert</b> (har fløyet), <b>bakkelab / sonderakett</b> (demonstrert, ikke fløyet) eller <b>romfartsmål på bakkemaskinvare</b> (et ambisiøst tall for maskinvare som ikke har fløyet – særlig hvert tall for optiske gitterklokker med strontium). Se <a1><c1/></a1> for merkelappene <c2/> / <c3/> / <c4/> per tall og <a2><c5/></a2> for drøftingen av modenhet mellom bakkelab og flyging.

seg-80834864bfdd = { "1" }. Parametere for klokker og frekvensreferanser

seg-305f560d4b08 = Nøkkeltall

seg-c35a20fa2529 = Modenhet

seg-302e481e5014 = Microchip (Microsemi) SA.45s / SA65 CSAC (chip-scale atomic clock)

seg-a000ca420690 = σ_y({ "1" } s) = { "3.0" }×{ "10" }⁻¹⁰

seg-222707a1bde3 = Produsentens datablad

seg-97709a803dea = <b>flygekvalifisert</b> (kommersiell del i bruk)

seg-75db01df1aea = Optisk gitterklokke med strontium (romfartsmål)

seg-f6f430d898ed = σ_y({ "1" } s) = { "1" }×{ "10" }⁻¹⁵

seg-1996a1d92bb1 = Origlia, Schiller, Bongs et al., <a1>arXiv:{ "1503.08457" }</a1>

seg-b8c64caf79f3 = <b>romfartsmål på bakkemaskinvare</b> – ingen optisk Sr-klokke har fløyet

seg-b5a006507475 = Optisk gitterklokke med strontium (labrekord)

seg-8a6ca23b19a9 = σ_y({ "1" } s) = { "4.8" }×{ "10" }⁻¹⁷

seg-b21bb1b6bf40 = Oelker et al., <em>Nature Photonics</em> ({ "2019" })

seg-95fb87b3a118 = bare bakkelab

seg-a36f415cccab = ACES/PHARAO (Atomic Clock Ensemble in Space / Projet d'Horloge Atomique par Refroidissement d'Atomes en Orbite; referanse på ISS (International Space Station))

seg-9d6acc3191a5 = i størrelsesorden { "1" }×{ "10" }⁻¹⁶ etter integrasjon over flere døgn

seg-1cddc44025d7 = ESA (European Space Agency) ACES/PHARAO, i drift på ISS siden april { "2025" } (siter ESAs publiserte resultater)

seg-75b7bb5ca4c8 = <b>flygekvalifisert</b> (mikrobølge/maser, ikke optisk)

seg-aeb8f189db37 = Allans koeffisient for hvit frekvens som holdover-modellen bruker er <c1/>; flickerfrekvensmodulasjon (flicker FM) og aldring modelleres bare der et <c2/> er satt eksplisitt (se <a1><c3/></a1>), ellers er de ikke modellert.

seg-bfe4524b6664 = { "2" }. Parametere for treghetssensorer

seg-5cd1984ba399 = Nøkkeltall

seg-53ad9ba8cecb = Exails hybride kvanteakselerometer-triade

seg-b40c95a6bea5 = biasstabilitet { "6" }×{ "10" }⁻⁸ g = { "5.88" }×{ "10" }⁻⁷ m/s² ({ "24" } t); støy { "22" } µg/√Hz = { "2.16" }×{ "10" }⁻⁴ (m/s²)/√Hz

seg-fdb8f1d648ba = Templier et al., <em>Science Advances</em> ({ "2022" }), <a1>arXiv:{ "2209.13209" }</a1>

seg-570f41ff76c9 = Honeywell QA-2000, kvartsakselerometer av navigasjonsklasse

seg-a7dbc9a9705e = biasstabilitet ~{ "160" } µg = { "1.57" }×{ "10" }⁻³ m/s²; støy ~{ "20" } µg/√Hz; biasustabilitet ~{ "1" } µg

seg-3ad7ce01c6e2 = Produsent / Groves <em>AESS (Aerospace and Electronic Systems Society) Tutorial</em>

seg-37c841945d3e = IMU-feilmodell (skalafaktor, skjevstilling, g-følsomhet, kvantisering, ratterampe)

seg-b7547264e608 = fem systematiske kategorier

seg-2f20d848f9d3 = IEEE (Institute of Electrical and Electronics Engineers) Std 952-1997 §A.2; Groves { "2013" } §{ "4.3" }, Table { "4.1" }

seg-c24b9890cf3b = modell

seg-67a38b3fe143 = Strapdown-mekanisering (NED, nord–øst–ned; coning/sculling)

seg-832b3645b515 = kvaternionbasert orientering §{ "2.2" }, §{ "5.5" }; NED-mekanisering §{ "5.4" }; tyngde §{ "2.4" }

seg-58c85c15b0aa = Groves, <em>Principles of GNSS (global navigation satellite system), Inertial, and Multisensor Integrated Navigation Systems</em>, 2. utg.

seg-ac7ef2be17e0 = { "3" }. Parametere for overføring av tid og frekvens

seg-7634c6f4b32c = Link

seg-dddf65bbb231 = Optisk toveis i fritt rom (mellom satellitter)

seg-e3a8990e650a = labgulv ~{ "1" } fs; { "1" } ps som mål som er troverdig i bane

seg-1adf3425eda9 = Giorgetta et al. ({ "2013" }, <em>Nature Photonics</em>); Deschênes et al. ({ "2016" }, <em>Physical Review X</em>)

seg-9ab60d7ed2a9 = TWSTFT (toveis satellittbasert overføring av tid og frekvens, Ku-bånd)

seg-543939310789 = enkeltøkt ~{ "0.5" } ns

seg-7f6127bdb4d9 = BIPM (Det internasjonale byrået for mål og vekt) / PTB (Physikalisch-Technische Bundesanstalt, Tysklands nasjonale metrologiinstitutt) / NIST (National Institute of Standards and Technology)

seg-d1f0ed9c0323 = { "4" }. Modeller for bane, tidssystem og referansesystem

seg-2ad53ecbee02 = Ligning / standard

seg-7ed15b9389e0 = Referanse (kildekommentar)

seg-4d6989c7153e = Propagering med SGP4/SDP4 (SGP4: Simplified General Perturbations { "4" }; SDP4: Simplified Deep-space Perturbations { "4" })

seg-0d46975247cc = WGS-72-modellen (WGS: World Geodetic System) for SGP4

seg-6dcfe89aeb8f = Vallado et al., <em>«Revisiting Spacetrack Report #3»</em>, <b>AIAA (American Institute of Aeronautics and Astronautics) 2006-6753</b> ({ "2006" })

seg-e46bf46a4d35 = Skuddsekund / tidssystemer (UTC/TAI/TT/UT1 (UTC: koordinert universaltid; TAI: internasjonal atomtid; TT: terrestrisk tid; UT1: universaltid { "1" }, tid basert på jordrotasjon))

seg-7505e93b9bf8 = regime med hele skuddsekunder fra 1972-01-01

seg-0ea35809be61 = IERS (International Earth Rotation and Reference Systems Service) Conventions ({ "2010" }); skuddsekundhistorikk fra IERS Bulletin C

seg-d25f68665f8e = Jordrotasjonsvinkel

seg-a3a803bdc8a0 = IAU (International Astronomical Union) { "2000" } resolusjon B1.8

seg-049ad81ff5e8 = Posisjon/klokke for SV (space vehicle, det vil si en satellitt) fra kringkastet efemeride

seg-a1a595008b2a = brukeralgoritme, relativistisk <c1/>, <c2/>

seg-8e2e3089e2e6 = IS-GPS-200 (IS: Interface Specification; GPS: Global Positioning System) §{ "20.3.3.4.3.1" } / §{ "20.3.3.3.3.1" }

seg-8e14a54b1f09 = Efemeridekonstanter for Galileo / QZSS (Japans Quasi-Zenith Satellite System) / BeiDou (μ, Ω̇ₑ, C̄₂₀)

seg-93b03e3b3e43 = ICD-er (interface control documents) for signal i rommet per system

seg-c7c6759c0373 = Galileo OS (Open Service) SIS ICD; BeiDou OS SIS ICD (CGCS2000, China Geodetic Coordinate System { "2000" }); GLONASS (Russlands Global Navigation Satellite System) ICD (PZ-90 (PZ: Parametry Zemli, det russiske geodetiske datumet))

seg-7d59b9c3dabc = { "5" }. Modeller for GNSS i målingsdomenet og for robusthet

seg-dd7e88cfd703 = Klobuchar enfrekvent ionosfære

seg-9920eb06b90c = semisirkel-algoritme

seg-f96f24cbe154 = IS-GPS-200 §{ "20.3.3.5.2.5" }

seg-0358759614c5 = Saastamoinen zenittroposfære

seg-b4b7f91f6112 = hydrostatisk + våt zenittforsinkelse

seg-ba06204996b7 = Davis et al. ({ "1985" }); Groves §{ "9.4" }

seg-9fc988ebf2aa = Niell-mappingfunksjoner

seg-8eb79ff7faaa = hydrostatisk og våt, mapping etter elevasjon

seg-ca4642e37561 = Niell ({ "1996" })

seg-7876aa9fc732 = Linkbudsjett for anti-jam

seg-75e1c40bdc0f = <c1/> (C/N₀ forholdet mellom bærebølge og støytetthet, J/S forholdet mellom jamming og signal, Q spektralseparasjonsfaktoren, Rc chiprate) → effektiv C/N₀ → tap av lås

seg-7afcd0de9ae8 = Kaplan & Hegarty, <em>Understanding GPS/GNSS</em>, 3. utg., §{ "9.4" }

seg-c6e2f2ee16cb = Spoofing- / energidetektering

seg-15390c9b849c = Neyman–Pearson / tosidig χ²₁-energitest; Φ⁻¹ via Acklam; erf via Abramowitz & Stegun { "7.1.26" }

seg-1c30c0b6a81f = klassisk deteksjonsteori

seg-023867611249 = Stabilitet i Allan-familien (ADEV/MDEV/TDEV/HDEV (ADEV: Allan-deviasjon; MDEV: modifisert Allan-deviasjon; TDEV: tidsdeviasjon; HDEV: Hadamard-deviasjon))

seg-478bb58f8a7f = med konfidensintervaller

seg-2abd4df32f9c = NIST SP (Special Publication) { "1065" } (Riley); Kasdin, <em>Proc. IEEE</em> ({ "1995" })

seg-a958238e3d1c = RAIM (receiver autonomous integrity monitoring) / integritet (HPL/VPL (HPL: horisontalt beskyttelsesnivå; VPL: vertikalt beskyttelsesnivå), ARAIM (advanced receiver autonomous integrity monitoring) med løsningsseparasjon)

seg-41b219635fbe = snapshot og løsningsseparasjon

seg-b971eeb2bf2b = se <a1><c1/></a1>

seg-926261321371 = { "6" }. Valideringsdatasett

seg-04863ce407e7 = <b>Retningslinje for vendoring.</b> Vi committer en ordrett kopi av hvert valideringsdatasett der lisensen tillater videredistribusjon <em>og</em> størrelsen passer greit i git, slik at en klone kan gjenskape valideringen frakoblet, uten nettverk og uten råtne lenker. Et datasett er <b>fetch-gated</b> (lastet ned av en <c1/>-hjelper til den git-ignorerte <c2/>, med bare de små <em>avledede</em> referanseverdiene committet) bare når lisensen ikke tydelig tillater videredistribusjon, eller når det er for stort for git. Hvert datasett som holdes bak fetch-gate oppgir sin konkrete grunn nedenfor; ingenting holdes bak av bekvemmelighet.

seg-b966dd26caa6 = Datasett

seg-e0351f9b83fc = Status i depotet

seg-ea1ad9965f74 = AIAA 2006-6753 SGP4-testvektorer (alle { "666" })

seg-cb7efe21070c = Numerisk validering av SGP4 – verste { "4.12" } mm

seg-a624c6877c48 = Publiserte referansevektorer (Vallado, AIAA)

seg-d90675af2816 = Vendoret

seg-c1cee31c42df = ⁸⁸Sr optisk klokke ADEV σ_y(τ) (Norcia et al., Science { "366" }:{ "93" }, { "2019" })

seg-232e54a0e396 = validering av tilpasning til målt stabilitet for optiske klokker

seg-3345cefbfa3c = <b>CC-BY-4.0</b> (Creative Commons Attribution { "4.0" }; Zenodo 10.5281/zenodo.3382347)

seg-2bb00a0c58ef = NASA/USGS (NASA: National Aeronautics and Space Administration; USGS: United States Geological Survey) SRTM (Shuttle Radar Topography Mission) v3 høydefliser N36W117 (Death Valley, desimert til 6 buesekunder, { "722" } KB)

seg-088a57c3a5b1 = validering av <c1/>-leseren for terreng-DEM (DEM: digital høydemodell) på ekte relieff (Badwater Basin ≈ −{ "86" } m)

seg-ed90325543c8 = <b>Allemannseie (public domain)</b> (NASA/USGS SRTM v3; via AWS (Amazon Web Services) Open Data <c1/>)

seg-9607b2318cf5 = Eksempler på CCSDS 502.0/503.0 Blue Book OEM/TDM (OEM: Orbit Ephemeris Message; TDM: Tracking Data Message)

seg-b53475918422 = validering av rundtur for CCSDS-parseren

seg-25d9f396b539 = Publiserte standardeksempler (CCSDS)

seg-35dfb14360e3 = IGS (International GNSS Service) SP3 (Standard Product { "3" }, formatet for presise baner) presis bane + RINEX (Receiver Independent Exchange Format) navigasjonsprøver

seg-5e321b8b5287 = validering av banetilpasning og integritet

seg-ec0b6ff10fc5 = Åpne data fra IGS (fri til enhver bruk, med kreditering)

seg-00db9583ce55 = Øyeblikksbilder av Celestrak-TLE-er (two-line element set) (<c1/>, <c2/>)

seg-4dabd0f62f90 = scenarioer med reelle konstellasjoner

seg-6e7c8deb24b6 = Celestraks vilkår (kreditering; TLE-er (two-line element sets) med opprinnelse i den amerikanske staten (US: United States))

seg-2827577f7008 = <c1/> + levende <c2/>

seg-c0945969860a = referanseutdata fra scipy / scikit-learn / filterpy

seg-61546d769e23 = validering av numeriske kjerner og estimatorer

seg-b74e03fddbca = Generert lokalt fra BSD/MIT-biblioteker (BSD: Berkeley Software Distribution-lisensen)

seg-9d818fc79012 = <c1/> (+ generatorskript)

seg-4d6c3069b01f = Referansedeviasjoner fra Stable32 (ADEV/HDEV-trapper per dekade)

seg-0a7b677330a6 = paritet for Allan-estimatorer

seg-3c91f9ae6473 = Avledede sammendragsverdier (små)

seg-14aecb331164 = <b>Rå</b> fasetidsserie fra 5071A cesium ({ "556 990" } punkter, { "12" } MB)

seg-9d43f399613b = overlappende ADEV/HDEV på en ekte Cs-klokke

seg-87b53409bedb = <b>Uklart</b> – <c1/> er LGPL-3.0 (GNU Lesser General Public License, en programvarelisens) uten <em>noen eksplisitt tillatelse til videredistribusjon av data</em>; filen er utelatt fra PyPI-distribusjonen (Python Package Index)

seg-b741be74c8ad = <c1/>; avledede trapper er committet

seg-5e07eabcfe78 = <b>rå</b> PHASE.DAT (regresjonsserie med 1000 punkter)

seg-d9f61f4b985c = paritetsserie for Stable32-estimatorer

seg-df8e0a135895 = <b>Uklart</b> – distribuert med den kommersielle Stable32 (Hamilton Technical Services); NIST SP { "1065" } er allemannseie, men skriver ikke ut verdiene

seg-332b36d2b91f = <c1/>; avledede trapper er committet

seg-dd2ee7a9f1fa = JammerTest { "2024" } opptak av GNSS-jamming/-spoofing ({ "1.4" } GB)

seg-20065daf2305 = kalibrering av scenarioer for robusthet og anomalier

seg-a4410133d410 = GPL-3.0-or-later (GNU General Public License; Zenodo 10.5281/zenodo.15910563) – videredistribusjon er tillatt, men <b>størrelsen overskrider GitHubs filgrense på { "100" } MB</b>, og GPL-copyleft strider mot AGPL-treet (Affero General Public License)

seg-d4c7d2f9ea0d = <b>Fetch-gated</b>; henvis til DOI-en (digital object identifier)

seg-c0e39f83efcd = Lisensstatusen til hvert datasett bak fetch-gate ble undersøkt mot den opprinnelige autoriteten; de to «uklare» klokkedatasettene forblir bak gate i påvente av en eksplisitt tillatelse til videredistribusjon (vi committer allerede verdiene vi <em>har</em> lisens til å publisere), og JammerTest-settet holdes bak gate på grunn av størrelse og copyleft, til tross for den åpne lisensen.

seg-e104e19931d4 = { "7" }. Nyere domener – hvor parametrene kommer fra

seg-c11f7c73d10b = Typene som er lagt til siden tabellene ovenfor følger den samme regelen. Hver rad oppgir kilden og statusen i verifikasjonsmatrisen for funksjonen som er bygget på den (<a1><c1/></a1> har hele raden).

seg-5d2c25dd2ff3 = Tidssynkronisering for telekom (<c1/>)

seg-c2ae6b1fe666 = synkroniseringsmasker

seg-e247606fe749 = ITU-T-anbefalinger (Telecommunication Standardization Sector i International Telecommunication Union), hver grense med sin tabell eller klausul, oppført i <a1><c1/></a1>

seg-1150ab344107 = MODELLED (avskrift)

seg-01d31590ca44 = forhåndsinnstillinger for oscillatorer <c1/>, <c2/>, <c3/>, <c4/>

seg-9a4c0c214c54 = fire datablad fra Microchip, dokumentnumre i <a1><c1/></a1>

seg-a03ea8950ab0 = estimatorer for MTIE (maksimal tidsintervallfeil) og TDEV (tidsdeviasjon)

seg-389e18e1a900 = allantools { "2024.06" } på <c1/>

seg-29edfc0f6a6d = Solsystemet (<c1/>, <c2/>)

seg-df22756e5209 = planetposisjoner fra JPLs (Jet Propulsion Laboratory) Keplerelementer fra Standish

seg-194e3a13d51a = kontrollert mot tilstandsvektorer fra JPL Horizons DE441 (Development Ephemeris { "441" }) i <c1/>

seg-6d23934b3cb7 = VALIDATED; Uranus, Neptun, Pluto og månene MODELLED

seg-a2624ce2e89a = gravitasjonsparametere, radier og rotasjon for hvert legeme

seg-4d501821b508 = JPL Horizons' legemeregistre og JPLs tabell over fysiske parametere for satellitter

seg-f2715a76f0ec = Utforming av konstellasjoner (<c1/>)

seg-784e471cdada = nominelle slots for GPS, Galileo og GLONASS

seg-479ddafe5925 = Galileo Open Service Service Definition Document { "1.1" }; GPS Standard Positioning Service Performance Standard, 5. utgave

seg-b5e3dc8605b1 = PNT i LEO (lav jordbane) (<c1/>, <c2/>, <c3/>)

seg-0a535468ad51 = navngitte forhåndsinnstillinger for systemer

seg-aae7fe16f69a = de siterte offentlige tallene, hver forhåndsinnstilling med sin kilde

seg-a72c37136e3a = Navigasjonsmelding for LEO (<c1/>)

seg-ac50550a250f = vekter for avstandsfeil i signal i rommet

seg-5dae296d5484 = Montenbruck, Steigenberger og Hauschild ({ "2018" }), <em>Advances in Space Research</em>

seg-9148986e8610 = efemeridemodell med 22 parametere

seg-5b82ad0bd2c9 = Liu et al. ({ "2025" }), <em>Remote Sensing</em> { "17" }({ "16" }):{ "2894" }

seg-2080b4fc31a8 = Bunntekst med proveniens for diagram

seg-22d0b06d5df4 = Hvert diagram Kshana tegner – i nettleser-playgrounden, i CLI-ens (kommandolinjegrensesnitt) <c1/>-eksport og i diagrammet i den utskrivbare <c2/>-rapporten (HTML, HyperText Markup Language) – stemples nederst til høyre med:

seg-d8b4de856202 = <c1/> er de første { "12" } heksadesimale tegnene i kjøringens <b>scenario-hash</b>: en SHA-256 (SHA: Secure Hash Algorithm) over den <em>kanoniske</em> scenariodefinisjonen (seed, terskler, modellparametere, GNSS-vinduer og så videre). Det er det samme fingeravtrykket som vises i enlinjesammendraget av kjøringen og i resultat-JSON-ens <c2/>-felt. (Typer der resultatdokumentet ikke har noen <c3/>, som integritets- og månerapportene, faller tilbake til en SHA-256 av scenariokildens TOML (Tom's Obvious, Minimal Language), slik at hvert diagram likevel har et stabilt fingeravtrykk.)

seg-8d218131da01 = Fordi hashen er deterministisk og følsom for inndata, identifiserer et lagret eller limt inn diagrambilde seg selv: det registrerer motorversjonen, det nøyaktige scenarioet som produserte det (for bit-for-bit-gjenskaping) og kilden – og enhver endret parameter gir en annen hash, slik at et feilmerket diagram kan oppdages.

seg-89c9b001868f = Hvordan du siterer og gjenskaper

seg-6eca19b7978c = Hvert resultat kan gjenskapes fra <c1/>. Siter motoren via <a1><c2/></a1> / Zenodos konsept-DOI <a2>10.5281/zenodo.20528627</a2>, og siter kildene til <em>parametrene</em> ovenfor for tallene en gitt kjøring avhenger av – de følger med i resultat-JSON-ens <c3/>-felt, slik at et publisert resultat dokumenterer seg selv.

seg-c5c58ef3771c = Der et tall er et romfartsmål på bakkemaskinvare (hvert tall for optiske strontiumklokker) eller en demonstrasjon i bakkelab (kaldatom-akselerometer), sier dette dokumentet og resultatets proveniens det eksplisitt. Kshana fremstiller ikke lab- eller måltall som ytelse i flyging.

seg-925d456df88c = <s1>Forrige</s1>Påstander mot virkeligheten

seg-19e8fefd1ceb = <s1>Neste</s1>Reproduserbarhet
