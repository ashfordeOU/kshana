# docs--provenance: translations (cs)

seg-9a2a5f0a8a02 = Sluneční soustava

seg-d01db1c2710a = Reference

seg-28e87f407a10 = Oblast

seg-ad856ad710eb = Stav

seg-6e0cb6acc073 = VALIDATED

seg-d4a762001549 = Licence

seg-f63dd3d7aad4 = Zdroj

seg-638b8d451550 = Senzor

seg-60cd077d82a7 = Model

seg-2afa300864a9 = Parametry

seg-32b620b3574e = Použití

# c1: docs/PROVENANCE.md
seg-f3de25879362 = Zdroj: <c1/>

seg-257526f1f93f = Původ — každý parametr dohledatelný k publikovanému zdroji

seg-8c12958898a8 = Ústřední disciplínou poctivosti Kshany je, že <b>každý parametr senzoru, fyzikální model a ověřovací datová sada je dohledatelný k publikovanému zdroji</b> — datovému listu, recenzované práci, ICD (interface control document) signálu ve vesmíru nebo standardu. Tento dokument shromažďuje tyto řetězce původu do jediné citovatelné referenční tabulky.

# c1: [clock_quantum]
# c2: [clock_classical]
# c3: provenance
# c4: ModelSpec
# c5: src/types.rs
# c6: with_provenance
# c7: src/inertial/imu_errors.rs
# c8: quantum.spec.provenance
# c9: classical.spec.provenance
# c10: units
# c11: input
# c12: computed
# c13: closed-form
# c14: internal-consistency
seg-279914171c2e = Původ není jen dokumentace: každá tabulka senzoru ve scénáři (například <c1/> a <c2/>) nese řetězec <c3/> (<c4/> v <c5/>; <c6/> v <c7/> pro chybový model inerciální měřicí jednotky (IMU)), který <b>se přenáší do výsledného JSON</b> (JavaScript Object Notation) jako <c8/> a <c9/>, takže každý běh nese vlastní citace parametrů. Blok <c10/> ve výsledku také označuje každé číselné pole třídou původu (<c11/>, <c12/>, <c13/>, <c14/>, …). Tabulky níže jsou sjednoceným, člověkem čitelným rejstříkem těchto řetězců, doplněným o algoritmický a ověřovací původ ze zdrojových komentářů.

# c1: VALIDATION.md
# c2: validated
# c3: modelled
# c4: not modeled
# c5: QUANTUM-MODELS.md
seg-683fd369407a = Vyspělost je poctivě označena v celém dokumentu: <b>letově kvalifikováno</b> (již létalo), <b>pozemní laboratoř / sondážní raketa</b> (předvedeno, nelétalo) nebo <b>cíl pro vesmír na pozemním hardwaru</b> (ambiciózní hodnota pro hardware, který nelétal — zejména každá hodnota pro stronciové hodiny v optické mřížce). Označení <c2/> / <c3/> / <c4/> pro jednotlivé hodnoty viz <a1><c1/></a1> a diskusi o vyspělosti pozemní laboratoře vs. letu viz <a2><c5/></a2>.

seg-80834864bfdd = { "1" }. Parametry hodin a frekvenčních referencí

seg-305f560d4b08 = Klíčová hodnota

seg-c35a20fa2529 = Vyspělost

seg-302e481e5014 = Microchip (Microsemi) SA.45s / SA65 CSAC (čipové atomové hodiny)

seg-a000ca420690 = σ_y({ "1" } s) = { "3.0" }×{ "10" }⁻¹⁰

seg-222707a1bde3 = Datový list výrobce

seg-97709a803dea = <b>letově kvalifikováno</b> (nasazená komerční součástka)

seg-75db01df1aea = Stronciové hodiny v optické mřížce (cíl pro vesmír)

seg-f6f430d898ed = σ_y({ "1" } s) = { "1" }×{ "10" }⁻¹⁵

seg-1996a1d92bb1 = Origlia, Schiller, Bongs et al., <a1>arXiv:{ "1503.08457" }</a1>

seg-b8c64caf79f3 = <b>cíl pro vesmír na pozemním hardwaru</b> — žádné optické hodiny se Sr dosud nelétaly

seg-b5a006507475 = Stronciové hodiny v optické mřížce (laboratorní rekord)

seg-8a6ca23b19a9 = σ_y({ "1" } s) = { "4.8" }×{ "10" }⁻¹⁷

seg-b21bb1b6bf40 = Oelker et al., <em>Nature Photonics</em> ({ "2019" })

seg-95fb87b3a118 = pouze pozemní laboratoř

seg-a36f415cccab = ACES/PHARAO (Atomic Clock Ensemble in Space / Projet d'Horloge Atomique par Refroidissement d'Atomes en Orbite; srovnávací zařízení na ISS (Mezinárodní kosmické stanici))

seg-9d6acc3191a5 = řádově { "1" }×{ "10" }⁻¹⁶ po vícedenní integraci

seg-1cddc44025d7 = ESA (Evropská kosmická agentura) ACES/PHARAO, provozní na ISS od dubna { "2025" } (citujte publikované výsledky ESA)

seg-75b7bb5ca4c8 = <b>letově kvalifikováno</b> (mikrovlnné/maser, nikoli optické)

# c1: q_wf = σ_y(1 s)²
# c2: flicker_floor
# c3: VALIDATION.md
seg-aeb8f189db37 = Allanův koeficient bílého šumu frekvence používaný modelem holdoveru je <c1/>; flicker frekvenční modulace (flicker FM) a stárnutí jsou modelovány jen tam, kde je výslovně nastaveno <c2/> (viz <a1><c3/></a1>), jinak nejsou modelovány.

seg-bfe4524b6664 = { "2" }. Parametry inerciálních senzorů

seg-5cd1984ba399 = Klíčové hodnoty

seg-53ad9ba8cecb = Hybridní kvantová trojice akcelerometrů Exail

seg-b40c95a6bea5 = stabilita biasu { "6" }×{ "10" }⁻⁸ g = { "5.88" }×{ "10" }⁻⁷ m/s² ({ "24" } h); šum { "22" } µg/√Hz = { "2.16" }×{ "10" }⁻⁴ (m/s²)/√Hz

seg-fdb8f1d648ba = Templier et al., <em>Science Advances</em> ({ "2022" }), <a1>arXiv:{ "2209.13209" }</a1>

seg-570f41ff76c9 = Křemenný akcelerometr Honeywell QA-2000 navigační třídy

seg-a7dbc9a9705e = stabilita biasu ~{ "160" } µg = { "1.57" }×{ "10" }⁻³ m/s²; šum ~{ "20" } µg/√Hz; nestabilita biasu ~{ "1" } µg

seg-3ad7ce01c6e2 = Výrobce / Groves <em>AESS (Aerospace and Electronic Systems Society) Tutorial</em>

seg-37c841945d3e = Chybový model IMU (škálový faktor, nesouosost, g-citlivost, kvantizace, rampa rychlosti)

seg-b7547264e608 = pět systematických kategorií

seg-2f20d848f9d3 = IEEE (Institute of Electrical and Electronics Engineers) Std 952-1997 §A.2; Groves { "2013" } §{ "4.3" }, tabulka { "4.1" }

seg-c24b9890cf3b = model

seg-67a38b3fe143 = Strapdown mechanizace (NED, sever–východ–dolů; coning/sculling)

seg-832b3645b515 = kvaternionová orientace §{ "2.2" }, §{ "5.5" }; mechanizace NED §{ "5.4" }; tíže §{ "2.4" }

seg-58c85c15b0aa = Groves, <em>Principles of GNSS (globální družicový navigační systém), Inertial, and Multisensor Integrated Navigation Systems</em>, 2. vyd.

seg-ac7ef2be17e0 = { "3" }. Parametry přenosu času a frekvence

seg-7634c6f4b32c = Spoj

seg-dddf65bbb231 = Optický dvoucestný přenos volným prostorem (mezidružicový)

seg-e3a8990e650a = laboratorní hranice ~{ "1" } fs; { "1" } ps jako cíl věrohodný na oběžné dráze

seg-1adf3425eda9 = Giorgetta et al. ({ "2013" }, <em>Nature Photonics</em>); Deschênes et al. ({ "2016" }, <em>Physical Review X</em>)

seg-9ab60d7ed2a9 = TWSTFT (dvoucestný družicový přenos času a frekvence, pásmo Ku)

seg-543939310789 = jedna relace ~{ "0.5" } ns

seg-7f6127bdb4d9 = BIPM (Mezinárodní úřad pro váhy a míry) / PTB (Physikalisch-Technische Bundesanstalt, německý národní metrologický ústav) / NIST (National Institute of Standards and Technology)

seg-d1f0ed9c0323 = { "4" }. Modely oběžných drah, časových systémů a referenčních soustav

seg-2ad53ecbee02 = Rovnice / standard

seg-7ed15b9389e0 = Reference (zdrojový komentář)

seg-4d6989c7153e = Propagace SGP4/SDP4 (SGP4: Simplified General Perturbations { "4" }; SDP4: Simplified Deep-space Perturbations { "4" })

seg-0d46975247cc = model SGP4 podle WGS-72 (WGS: World Geodetic System)

seg-6dcfe89aeb8f = Vallado et al., <em>„Revisiting Spacetrack Report #3“</em>, <b>AIAA (American Institute of Aeronautics and Astronautics) 2006-6753</b> ({ "2006" })

seg-e46bf46a4d35 = Přestupné sekundy / časové systémy (UTC/TAI/TT/UT1 (UTC: koordinovaný světový čas; TAI: mezinárodní atomový čas; TT: pozemský čas; UT1: světový čas { "1" }, čas rotace Země))

seg-7505e93b9bf8 = režim celočíselných přestupných sekund od 1972-01-01

seg-0ea35809be61 = IERS (International Earth Rotation and Reference Systems Service) Conventions ({ "2010" }); historie přestupných sekund z IERS Bulletin C

seg-d25f68665f8e = Úhel rotace Země

seg-a3a803bdc8a0 = IAU (Mezinárodní astronomická unie) rezoluce { "2000" } B1.8

seg-049ad81ff5e8 = Poloha/hodiny SV (kosmického tělesa, tj. družice) z vysílaných efemerid

# c1: F·e·√A·sin Eₖ
# c2: TGD
seg-a1a595008b2a = uživatelský algoritmus, relativistický člen <c1/>, <c2/>

seg-8e2e3089e2e6 = IS-GPS-200 (IS: Interface Specification; GPS: Global Positioning System) §{ "20.3.3.4.3.1" } / §{ "20.3.3.3.3.1" }

seg-8e14a54b1f09 = Konstanty efemerid Galileo / QZSS (japonský Quasi-Zenith Satellite System) / BeiDou (μ, Ω̇ₑ, C̄₂₀)

seg-93b03e3b3e43 = ICD signálu ve vesmíru (SIS) pro jednotlivé systémy (interface control documents)

seg-c7c6759c0373 = Galileo OS (Open Service) SIS ICD; BeiDou OS SIS ICD (CGCS2000, čínský geodetický souřadnicový systém { "2000" }); GLONASS (ruský Global Navigation Satellite System) ICD (PZ-90 (PZ: Parametry Zemli, ruský geodetický referenční systém))

seg-7d59b9c3dabc = { "5" }. Modely měřicí domény GNSS a odolnosti

seg-dd7e88cfd703 = Klobucharova jednofrekvenční ionosféra

seg-9920eb06b90c = algoritmus v semicirklech

seg-f96f24cbe154 = IS-GPS-200 §{ "20.3.3.5.2.5" }

seg-0358759614c5 = Saastamoinenova zenitová troposféra

seg-b4b7f91f6112 = hydrostatické + vlhké zenitové zpoždění

seg-ba06204996b7 = Davis et al. ({ "1985" }); Groves §{ "9.4" }

seg-9fc988ebf2aa = Niellovy mapovací funkce

seg-8eb79ff7faaa = hydrostatické a vlhké, mapování podle elevace

seg-ca4642e37561 = Niell ({ "1996" })

seg-7876aa9fc732 = Rozpočet spoje při potlačení rušení

# c1: [1/(C/N₀) + (J/S)/(Q·Rc)]⁻¹
seg-75e1c40bdc0f = <c1/> (C/N₀ poměr nosné k hustotě šumu, J/S poměr rušení k signálu, Q činitel spektrální separace, Rc čipová rychlost) → efektivní C/N₀ → ztráta zámku

seg-7afcd0de9ae8 = Kaplan & Hegarty, <em>Understanding GPS/GNSS</em>, 3. vyd., §{ "9.4" }

seg-c6e2f2ee16cb = Detekce spoofingu / energetická detekce

seg-15390c9b849c = Neymanův–Pearsonův / oboustranný energetický test χ²₁; Φ⁻¹ podle Acklama; erf podle Abramowitze & Steguna { "7.1.26" }

seg-1c30c0b6a81f = klasická teorie detekce

seg-023867611249 = Stabilita rodiny Allanových odchylek (ADEV/MDEV/TDEV/HDEV (ADEV: Allanova odchylka; MDEV: modifikovaná Allanova odchylka; TDEV: časová odchylka; HDEV: Hadamardova odchylka))

seg-478bb58f8a7f = s intervaly spolehlivosti

seg-2abd4df32f9c = NIST SP (Special Publication) { "1065" } (Riley); Kasdin, <em>Proc. IEEE</em> ({ "1995" })

seg-a958238e3d1c = RAIM (autonomní monitorování integrity v přijímači) / integrita (HPL/VPL (HPL: horizontální ochranná úroveň; VPL: vertikální ochranná úroveň), ARAIM (pokročilé autonomní monitorování integrity v přijímači), separace řešení)

seg-41b219635fbe = snímek a separace řešení

# c1: INTEGRITY.md
seg-b971eeb2bf2b = viz <a1><c1/></a1>

seg-926261321371 = { "6" }. Ověřovací datové sady

# c1: scripts/fetch_*.sh
# c2: realdata-cache/
seg-04863ce407e7 = <b>Zásady vendorování.</b> Do gitu zapisujeme doslovnou kopii každé ověřovací datové sady, jejíž licence dovoluje redistribuci <em>a</em> jejíž velikost se pohodlně vejde do gitu, takže klon umí ověření reprodukovat offline, bez sítě a bez zanikajících odkazů. Datová sada je <b>podmíněná stažením</b> (stahuje ji pomocník <c1/> do adresáře <c2/> ignorovaného gitem, přičemž se zapisují jen malé <em>odvozené</em> referenční hodnoty) pouze tehdy, když její licence redistribuci jasně nedovoluje nebo když je pro git příliš velká. U každé takto podmíněné sady je níže uveden konkrétní důvod; nic není podmíněno kvůli pohodlí.

seg-b966dd26caa6 = Datová sada

seg-e0351f9b83fc = Stav v repozitáři

seg-ea1ad9965f74 = Testovací vektory SGP4 podle AIAA 2006-6753 (všech { "666" })

seg-cb7efe21070c = numerické ověření SGP4 — nejhorší { "4.12" } mm

seg-a624c6877c48 = Publikované referenční vektory (Vallado, AIAA)

seg-d90675af2816 = Vendorováno

seg-c1cee31c42df = ADEV σ_y(τ) optických hodin s ⁸⁸Sr (Norcia et al., Science { "366" }:{ "93" }, { "2019" })

seg-232e54a0e396 = ověření fitu naměřené stability optických hodin

seg-3345cefbfa3c = <b>CC-BY-4.0</b> (Creative Commons Attribution { "4.0" }; Zenodo 10.5281/zenodo.3382347)

seg-2bb00a0c58ef = Výšková dlaždice NASA/USGS (NASA: National Aeronautics and Space Administration; USGS: United States Geological Survey) SRTM (Shuttle Radar Topography Mission) v3 N36W117 (Údolí smrti, decimovaná na 6 obloukových sekund, { "722" } KB)

# c1: .hgt
seg-088a57c3a5b1 = ověření čtečky <c1/> terénního DEM (DEM: digitální model terénu) na skutečném reliéfu (Badwater Basin ≈ −{ "86" } m)

# c1: elevation-tiles-prod
seg-ed90325543c8 = <b>Volné dílo</b> (NASA/USGS SRTM v3; přes AWS (Amazon Web Services) Open Data <c1/>)

seg-9607b2318cf5 = Příklady CCSDS 502.0/503.0 Blue Book OEM/TDM (OEM: Orbit Ephemeris Message; TDM: Tracking Data Message)

seg-b53475918422 = ověření zpětného převodu parseru CCSDS

seg-25d9f396b539 = Publikované příklady ze standardu (CCSDS)

seg-35dfb14360e3 = Přesná dráha IGS (International GNSS Service) SP3 (Standard Product { "3" }, formát přesných drah) + vzorky navigačních dat RINEX (Receiver Independent Exchange Format)

seg-5e321b8b5287 = ověření fitu dráhy a integrity

seg-ec0b6ff10fc5 = Otevřená data IGS (zdarma pro jakékoli použití, s uvedením zdroje)

# c1: gps-ops
# c2: galileo
seg-00db9583ce55 = Snímky TLE (dvouřádkové sady elementů) z Celestraku (<c1/>, <c2/>)

seg-4dabd0f62f90 = scénáře se skutečnými konstelacemi

seg-6e7c8deb24b6 = Podmínky Celestraku (uvedení zdroje; TLE (dvouřádkové sady elementů) s původem ve vládě USA)

# c1: tests/fixtures/celestrak/
# c2: scripts/fetch_tles.sh
seg-2827577f7008 = <c1/> + živě <c2/>

seg-c0945969860a = referenční výstupy scipy / scikit-learn / filterpy

seg-61546d769e23 = ověření numerických jader a estimátorů

seg-b74e03fddbca = Vygenerováno lokálně z knihoven pod licencí BSD/MIT (BSD: Berkeley Software Distribution)

# c1: tests/fixtures/scipy/
seg-9d818fc79012 = <c1/> (+ generátorové skripty)

seg-4d6c3069b01f = Referenční odchylky Stable32 (dekádové žebříčky ADEV/HDEV)

seg-0a7b677330a6 = shoda estimátorů Allanovy odchylky

seg-3c91f9ae6473 = Odvozené souhrnné hodnoty (malé)

seg-14aecb331164 = <b>Surová</b> fázová řada cesiových hodin 5071A ({ "556 990" } bodů, { "12" } MB)

seg-9d43f399613b = překrývající se ADEV/HDEV na skutečných hodinách s Cs

# c1: allantools
seg-87b53409bedb = <b>Nejasné</b> — <c1/> je pod LGPL-3.0 (GNU Lesser General Public License, softwarová licence) <em>bez výslovného udělení práva na redistribuci dat</em>; soubor je z distribuce PyPI (Python Package Index) vyloučen

# c1: scripts/fetch_cs5071a.sh
seg-b741be74c8ad = <c1/>; odvozené žebříčky zapsány

seg-5e07eabcfe78 = <b>surový</b> PHASE.DAT (regresní řada o 1000 bodech)

seg-d9f61f4b985c = Řada pro shodu estimátorů se Stable32

seg-df8e0a135895 = <b>Nejasné</b> — distribuováno s komerčním Stable32 (Hamilton Technical Services); NIST SP { "1065" } je volné dílo, ale hodnoty neuvádí

# c1: scripts/fetch_phasedat.sh
seg-332b36d2b91f = <c1/>; odvozené žebříčky zapsány

seg-dd2ee7a9f1fa = Záznam rušení/spoofingu GNSS z JammerTest { "2024" } ({ "1.4" } GB)

seg-20065daf2305 = kalibrace scénářů odolnosti/anomálií

seg-a4410133d410 = GPL-3.0-or-later (GNU General Public License; Zenodo 10.5281/zenodo.15910563) — redistribuce povolena, ale <b>velikost překračuje limit GitHubu { "100" } MB na soubor</b> a copyleft licence GPL je v rozporu se stromem pod AGPL (Affero General Public License)

seg-d4c7d2f9ea0d = <b>Podmíněno stažením</b>; odkaz na DOI (digital object identifier)

seg-c0e39f83efcd = Licenční stav každé datové sady podmíněné stažením byl prověřen u původní autority; obě „nejasné“ sady dat hodin zůstávají podmíněné, dokud nebude výslovně uděleno právo na redistribuci (hodnoty, které publikovat <em>smíme</em>, již zapisujeme), a sada JammerTest je podmíněná z důvodu velikosti/copyleftu navzdory své otevřené licenci.

seg-e104e19931d4 = { "7" }. Novější domény — odkud pocházejí jejich parametry

# c1: VERIFICATION-MATRIX.md
seg-c11f7c73d10b = Druhy přidané po výše uvedených tabulkách se řídí stejným pravidlem. Každý řádek uvádí zdroj a stav ve verifikační matici pro schopnost, která na něm stojí (úplný řádek má <a1><c1/></a1>).

# c1: telecom-timing
seg-5d2c25dd2ff3 = Telekomunikační časování (<c1/>)

seg-c2ae6b1fe666 = synchronizační masky

# c1: TELECOM-TIMING.md
seg-e247606fe749 = doporučení ITU-T (sektor Mezinárodní telekomunikační unie pro telekomunikační standardizaci), každý limit s tabulkou nebo článkem, uvedeno v <a1><c1/></a1>

seg-1150ab344107 = MODELLED (přepis)

# c1: ocxo
# c2: rubidium
# c3: caesium
# c4: csac
seg-01d31590ca44 = předvolby oscilátorů <c1/>, <c2/>, <c3/>, <c4/>

# c1: TELECOM-TIMING.md
seg-9a4c0c214c54 = čtyři datové listy Microchip, čísla dokumentů v <a1><c1/></a1>

seg-a03ea8950ab0 = odhadovače MTIE (maximální chyba časového intervalu) a TDEV (časová odchylka)

# c1: tests/fixtures/telecom_timing/
seg-389e18e1a900 = allantools { "2024.06" } na <c1/>

# c1: solar-system
# c2: body-pnt
seg-29edfc0f6a6d = Sluneční soustava (<c1/>, <c2/>)

seg-df22756e5209 = polohy planet z keplerovských elementů Standish z JPL (Jet Propulsion Laboratory)

# c1: tests/fixtures/solar_system/
seg-194e3a13d51a = kontrolováno proti stavovým vektorům JPL Horizons DE441 (Development Ephemeris { "441" }) v <c1/>

seg-6d23934b3cb7 = VALIDATED; Uran, Neptun, Pluto a měsíce MODELLED

seg-a2624ce2e89a = gravitační parametry, poloměry a rotace jednotlivých těles

seg-4d501821b508 = záznamy těles JPL Horizons a tabulka fyzikálních parametrů družic JPL

# c1: constellation-design
seg-f2715a76f0ec = Návrh konstelací (<c1/>)

seg-784e471cdada = nominální sloty GPS, Galileo a GLONASS

seg-479ddafe5925 = Galileo Open Service Service Definition Document { "1.1" }; GPS Standard Positioning Service Performance Standard, 5. vydání

# c1: leo-signal
# c2: leo-pass
# c3: leo-pvt
seg-b5e3dc8605b1 = PNT z LEO (nízké oběžné dráhy Země) (<c1/>, <c2/>, <c3/>)

seg-0a535468ad51 = pojmenované předvolby systémů

seg-aae7fe16f69a = citované veřejné hodnoty, každá předvolba se svým zdrojem

# c1: leo-navmsg
seg-a72c37136e3a = Navigační zpráva LEO (<c1/>)

seg-ac50550a250f = váhy chyby vzdálenosti signálu ve vesmíru

seg-5dae296d5484 = Montenbruck, Steigenberger a Hauschild ({ "2018" }), <em>Advances in Space Research</em>

seg-9148986e8610 = model efemerid s 22 parametry

seg-5b82ad0bd2c9 = Liu et al. ({ "2025" }), <em>Remote Sensing</em> { "17" }({ "16" }):{ "2894" }

seg-2080b4fc31a8 = Patička s původem grafu

# c1: *.chart.svg
# c2: *.report.html
seg-22d0b06d5df4 = Každý graf, který Kshana vykreslí — v prohlížečovém hřišti, v exportu <c1/> z CLI (rozhraní příkazové řádky) a v grafu uvnitř tisknutelné zprávy <c2/> (HTML, HyperText Markup Language) — je vpravo dole opatřen razítkem:

# c1: scenario <hash>
# c2: scenario_hash
# c3: scenario_hash
seg-d8b4de856202 = <c1/> je prvních { "12" } hexadecimálních znaků <b>hashe scénáře</b> běhu: SHA-256 (SHA: Secure Hash Algorithm) z <em>kanonické</em> definice scénáře (seed, prahy, parametry modelu, okna GNSS atd.). Je to tentýž otisk, který se objevuje v jednořádkovém souhrnu běhu a v poli <c2/> výsledného JSON. (Druhy, jejichž dokument s výsledkem <c3/> neobsahuje, například zprávy o integritě a lunární zprávy, se vracejí k SHA-256 ze zdrojového TOML scénáře (Tom's Obvious, Minimal Language), takže každý graf má stále stabilní otisk.)

seg-8d218131da01 = Protože je hash deterministický a citlivý na vstup, je uložený nebo vložený obrázek grafu sám sebe identifikující: zaznamenává verzi enginu, přesný scénář, který jej vytvořil (pro reprodukci bit po bitu), a zdroj — a každý změněný parametr dává jiný hash, takže chybně označený graf lze odhalit.

seg-89c9b001868f = Jak citovat a reprodukovat

# c1: scenario + seed + engine version
# c2: CITATION.cff
# c3: provenance
seg-6eca19b7978c = Každý výsledek je reprodukovatelný z <c1/>. Engine citujte přes <a1><c2/></a1> / koncepční DOI Zenodo <a2>10.5281/zenodo.20528627</a2> a citujte též zdroje <em>parametrů</em> výše pro hodnoty, na nichž daný běh závisí — putují v polích <c3/> výsledného JSON, takže publikovaný výsledek je sám sebe dokumentující.

seg-c5c58ef3771c = Kde je hodnota cílem pro vesmír na pozemním hardwaru (každé číslo optických hodin se stronciem) nebo laboratorní ukázkou (akcelerometr s chladnými atomy), tento dokument i původ výsledku to výslovně uvádějí. Kshana nevydává laboratorní ani cílové hodnoty za letový výkon.

seg-925d456df88c = <s1>Předchozí</s1>Tvrzení proti realitě

seg-19e8fefd1ceb = <s1>Další</s1>Reprodukovatelnost
