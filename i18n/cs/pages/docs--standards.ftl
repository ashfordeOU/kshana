# docs--standards: translations (cs)

seg-4a2ce9f33ab2 = zápis

seg-9120d3e96e5e = čtení

seg-5ad814c7ef9e = Poznámky

seg-aab745a65e76 = Modul

seg-bf09433a7342 = GeoJSON

seg-906440b861cd = Rámec

seg-32b620b3574e = Použití

seg-8ba331635865 = Normy a interoperabilita

seg-1b7710db3abf = Načítání multi-GNSS NAV (GPS LNAV (starší navigační zpráva), Galileo F/NAV, QZSS (japonský kvazizenitální družicový systém), BeiDou MEO/IGSO (MEO: střední oběžná dráha Země; IGSO: nakloněná geosynchronní dráha), stavový vektor GLONASS); použitelné jako plnohodnotný zdroj pro <c1/>.

seg-44991b52d1ff = <b>TLE / 3LE</b> (dvouřádkové / třířádkové elementy)

seg-17769f14095d = NORAD / Celestrak, AIAA (Americký institut pro letectví a kosmonautiku) 2006-6753

seg-8d4dd42edc89 = Propagováno ověřeným jádrem SGP4/SDP4 (SDP4: zjednodušené poruchy v hlubokém vesmíru { "4" }) ({ "4.12" } mm oproti { "666" } oficiálním vektorům AIAA).

seg-498aac915067 = <b>RINEX 3.0x</b> (observační)

seg-437d07b5aa4f = RINEX 3.0x OBS ({ "4.00" } se očekává jako zpracovatelný, na souboru { "4.00" } nikdy nevyzkoušeno)

seg-ac97f77f142c = Druhá polovina RINEX: vlastní záznamy kódu, nosné, Dopplera a SNR (SNR: poměr signálu k šumu) přijímače (<c1/>). Je to vstup, který řešič určení polohy z jednoho bodu <c2/> zpracovává spolu s vysílaným navigačním souborem (<a1><c3/></a1>, skutečná stanice IGS ABMF).

seg-2418cd0e4d79 = <b>IONEX</b> (formát pro výměnu map ionosféry; globální mapy TEC (celkový obsah elektronů))

seg-bf1bb42f04c4 = IONEX { "1" }.x (produkt IGS o ionosféře)

seg-af9efa0df270 = <c1/> čte globální mřížky celkového obsahu elektronů IGS — <em>měřenou</em> alternativu k vysílané Klobucharově korekci — s bilineární prostorovou a časovou interpolací a převodem šikmosti na zpoždění v šikmém směru.

seg-6f0da4b59d7c = <b>IERS (Mezinárodní služba rotace Země a referenčních systémů) <c1/> / Bulletin B</b> (orientace Země)

seg-197dfa18ca19 = Konvence IERS; IERS EOP (parametry orientace Země) { "14" } C04 / <c1/>

seg-0d102d904cfe = UT1 (světový čas { "1" }, čas rotace Země)−UTC (koordinovaný světový čas) a pohyb pólu z oficiálního produktu včetně <b>předpovězených</b> řádků, takže redukci soustavy lze provést v reálném čase a růst chyby předpovědi lze rozpočtovat (<a1><c1/></a1>).

seg-2a4e274838ef = <b>KIF</b> (Kshana Interchange Format)

seg-193b33461507 = tento repozitář — viz <a1><c1/></a1>

seg-33ef8d792a90 = Neutrální, verzovaná obálka, do které lze zabalit libovolný artefakt: <c1/> / <c2/> / <c3/> / <c4/> / <c5/>, s výslovným verdiktem o kompatibilitě hlavní a vedlejší verze pro spotřebitele. Nejde o externí standard; je zde popsána, protože ji cizí nástroj musí rozpoznat.

seg-a492f437efd0 = lunární výměna LunaNet / IOAG (Poradní skupina pro meziagenturní operace)

seg-b19cf72da934 = zápis (časová metadata se rovněž čtou)

seg-d641c72a6449 = specifikace interoperability LunaNet / architektura lunární komunikace IOAG nad CCSDS { "502.0" }

seg-cc796afe7a72 = Lunární soustava, lunární časová stupnice a lunární efemeridy vydávané ve formách CCSDS slaďovaných s LunaNet/IOAG (<c1/>, <c2/>, <c3/>), s kontrolou polí na vydaném OEM (<a1><c4/></a1>).

seg-5abc05382382 = <b>CZML</b> (Cesium Language)

seg-da7e20d3786b = formát paketů CZML pro CesiumJS

seg-8d3a73646be3 = Proud JSON (JavaScript Object Notation) časově označených paketů pro globus CesiumJS; pohybující se objekty zapsané v GCRS (<c1/>). <c2/> u každého druhu, který umisťuje objekty na Zemi.

seg-cd7a91109a8d = <b>KML</b> (Keyhole Markup Language)

seg-be4dd74f3915 = OGC (Open Geospatial Consortium) KML { "2.2" }

seg-57468e6d97f2 = Zeměpisná délka, šířka a výška vázané na Zemi pro Google Earth a nástroje GIS (geografický informační systém). <c1/>.

seg-46d977015b07 = zápis <b>i</b> čtení (trasa)

seg-42b8e3129e64 = IETF (Internet Engineering Task Force) RFC { "7946" }

seg-425a83b44545 = Geometrie vázaná na Zemi pro webové mapy a nástroje GIS (<c1/>); <c2/> se čte zpět jako vstup přímé trati pro druhy, které ji létají (<c3/>).

seg-d9b137e11514 = <b>Efemeridy STK</b> (<c1/>, <c2/>)

seg-347ee6f6c1df = formát souboru efemerid Ansys STK

seg-45576578d357 = Inerciální (<c1/>) poloha a rychlost pro STK a nástroje, které čtou jeho formát efemerid. <c2/>.

seg-03fd79cce4a4 = <b>SigMF</b> (Signal Metadata Format)

seg-42272f73f456 = specifikace SigMF

seg-202b559c30a6 = Komplexní záznamy v základním pásmu plus metadata JSON: druh <c1/> zapisuje své syntetizované vzorky IQ (in-phase/quadrature) (<c2/>) a záznam čte přes blok <c3/>.

seg-60e7c8505cb5 = <b>Text navigační zprávy LEO</b> (ve stylu RINEX-4 a CSV (hodnoty oddělené čárkami))

seg-f22442e0e8ea = rozvržení navigační zprávy RINEX { "4" }, upravené

seg-8338e445b3a5 = Vysílané efemeridy a hodiny druhu <c1/> pro družici na nízké oběžné dráze Země (LEO), exportované a znovu importované; zdokumentovaná úprava, nikoli registrovaný typ zprávy RINEX (MODELLED ve verifikační matici).

seg-1b89ab4e93f7 = Referenční soustavy a čas

seg-dbbd023631b6 = Soustava, kterou engine vydává, je explicitní, nikoli implicitní. Redukce IAU (Mezinárodní astronomická unie) 2006/2000A založená na CIO (CIO: Celestial Intermediate Origin, nebeský střední počátek) (<a1><c1/></a1>) a redukce TEME (rovník okamžitý, rovnodennost střední) založená na rovnodennosti/GMST (GMST: greenwichský střední hvězdný čas) (<a2><c2/></a2>, <a3><c3/></a3>) jsou ověřeny bit po bitu proti referenčním vektorům SOFA/ERFA (SOFA: Standards of Fundamental Astronomy; ERFA: Essential Routines for Fundamental Astronomy) (viz <a4><c4/></a4>).

seg-819d28bd9361 = Realizace

seg-69aca96b7e42 = TEME

seg-ec81608934a6 = nativní pro SGP4

seg-7631c594fd1a = Rovník okamžitý, rovnodennost střední — výstupní soustava SGP4/SDP4.

seg-eeb28cc286b3 = GCRS (geocentrická nebeská referenční soustava) / J2000

seg-745285e29202 = precese IAU { "2006" } + nutace IAU 2000A/2000B

seg-3747add299d5 = <c1/> (řetězec přes rovnodennost).

seg-4859fd3e5864 = <b>CIRS</b> (nebeská střední referenční soustava)

seg-1c09f22adcf2 = IAU 2006/2000A CIO (X, Y, s)

seg-8891621dc302 = ITRS (Mezinárodní pozemní referenční systém) / ECEF

seg-a28e26cd2481 = ERA (úhel rotace Země) + pohyb pólu IERS (CIO) nebo GMST + pohyb pólu (rovnodennost)

seg-e7426df3c59d = <c1/> (CIO, <c2/>) / <c3/> (rovnodennost).

seg-74a4801fd685 = geodetické WGS-84 (WGS: World Geodetic System)

seg-b58a44eaaa39 = přesná + iterativní inverze

seg-4d9472dd73d3 = Časová stupnice

seg-cbe7a7ce7317 = <b>TT</b> (pozemský čas)

seg-25191c1a4135 = Vyhodnocení argumentu precese/nutace/CIO (<c1/>).

seg-8c478d6b4786 = Úhel rotace Země / GMST (<c1/>).

seg-f7033ca0c13f = <b>Dvoudílné JD</b> (juliánské datum)

seg-64a5adeacd5b = <c1/> pro rozlišení epochy pod µs.

seg-210f40885a8e = Mapování výstupních polí na standard (CCSDS { "502.0" })

seg-e9dbc25a3ee9 = Co oba zapisovače orbitálních zpráv ukládají do jednotlivých polí CCSDS ODM (Orbit Data Messages, { "502.0" }), čteno z běhu <c1/> s <c2/> a <c3/>:

seg-d2b91c300b82 = Výstup Kshana

seg-119884b009cc = Pole CCSDS ODM

seg-8b0593f67c7f = Hodnota / jednotka

seg-d33eb162d179 = Metadata segmentu OEM

seg-4b338284e56a = <c1/> / <c2/> / <c3/> — soustava, ve které propagátory integrují, a časová stupnice mřížky epoch, bez přejmenování

seg-e0a44af9aaf8 = Epocha stavu OEM

seg-b0623bab9fcc = první sloupec každého datového řádku

seg-410bd5a9ba14 = kalendářní čas ISO-8601 (ISO: Mezinárodní organizace pro normalizaci), časová stupnice GPS

seg-a7c95802e01a = Poloha a rychlost OEM

seg-0539cafabf60 = datové sloupce <c1/>

seg-8add7e800e0e = km, km/s

seg-8b386548c03c = Metadata OMM

seg-e2c63414d7c2 = Epocha OMM

seg-5109e5948d2a = tvar ISO-8601 s dnem v roce (epocha TLE)

seg-b74289a29c24 = Střední elementy OMM

seg-f3492fa95178 = obrátky/den, –, deg, 1/poloměr Země

seg-fc82185abe10 = Výsledek JSON (JavaScript Object Notation) druhu <c1/> nese týž stav v jednotkách SI (mezinárodní soustava jednotek) pro každý vzorek: <c2/>, <c3/> / <c4/>, <c5/> / <c6/>, <c7/> (m, m/s), plus <c8/>, <c9/>, <c10/>.

seg-014d1392018e = Poctivý rozsah

seg-017c026df3d7 = OEM, TDM, Space Packet, KIF, SigMF a text navigační zprávy LEO se <b>čtou i zapisují</b>; OMM, CZML, KML a efemeridy STK jsou <b>zapisovače</b> (čtečka OMM a serializace XML jsou navazující kroky); GeoJSON se zapisuje a čte zpět jako trasa; RINEX NAV, RINEX OBS, IONEX, produkty IERS EOP a TLE jsou <b>čtečky</b>; lunární export LunaNet/IOAG je zapisovač, jehož časová metadata se při zpětném čtení shodují. <a1><c1/></a1> uvádí, který export platí pro každý přibalený scénář.

seg-68b4f5116419 = Mapování polí CCSDS/IGS výše je dokumentace, nikoli tvrzení, že je některý standard splněn; formální posouzení vůči těmto standardům (a registrace v otevřeném katalogu ESA (Evropská kosmická agentura) ESSR (European Space Software Repository) / NASA (Národní úřad pro letectví a kosmonautiku)) se vede zvlášť a čeká na posouzení.

seg-e461587ad2cf = Nezávislá numerická křížová kontrola redukce soustavy pomocí SPICE/ANISE (SPICE: Spacecraft, Planet, Instrument, C-matrix, Events; ANISE: Attitude, Navigation, Instrument, Spacecraft, Ephemeris — čistě rustový nástroj pro planetární geometrii) je dodávána v samostatném crate <c1/> vyloučeném z workspace: <c2/> proti rotaci GCRF (geocentrická nebeská referenční soustava) → ITRF93 (Mezinárodní pozemní referenční soustava { "1993" }) z ANISE přes osm epoch { "2020" }–{ "2023" } souhlasí do ≤ { "0.86" } m na zemi a do ≤ { "3.6" } m na oběžné dráze GNSS (viz <a1><c3/></a1>). Vyžaduje jádra SPICE, takže není výchozí branou kontinuální integrace (CI).

seg-f6d67027d669 = <s1>Předchozí</s1>Mapa schopností

seg-01b6270b6c6a = <s1>Další</s1>Pokrytí řádků

seg-96a449a63d11 = Zdroj: <c1/>

seg-3ed65a16e7d0 = Kshana mluví standardními výměnnými formáty komunit GNSS (globálního družicového navigačního systému), letové dynamiky a časování, takže může stát vedle RTKLIB (open-source knihovny pro kinematické určování polohy v reálném čase), gLAB, Ginan, GMAT (General Mission Analysis Tool), Orekit a nástrojů analytických center IGS (International GNSS Service), a nikoli na soukromém ostrově. Tato stránka mapuje <b>výměnné formáty</b>, které engine parsuje nebo vydává, na modul, který každý z nich implementuje, a na autoritativní specifikaci.

seg-d1aa512ad4ee = Je vymezena na formáty — věci se směrem čtení/zápisu. Signálové a algoritmické normy, které engine <em>implementuje</em>, nikoli parsuje (IS-GPS-200 (IS: Interface Specification; GPS: Global Positioning System), IEEE (Institute of Electrical and Electronics Engineers) { "1139" }, RTCA (dříve Radio Technical Commission for Aeronautics) DO-229E, IGRF-14 (IGRF: International Geomagnetic Reference Field), reference ARAIM (pokročilé autonomní monitorování integrity přijímačem) WG-C (WG: pracovní skupina), CCSDS (Consultative Committee for Space Data Systems) 401/DSN (DSN: Deep Space Network)), jsou doloženy řádek po řádku místo toho v <a1><c1/></a1>.

seg-656920618fb7 = Formáty, kterými engine mluví

seg-4fe4920a3fa1 = Norma

seg-d08f1943c53b = Směr

seg-968a1d48364c = Specifikace / autorita

seg-304ffba9669f = <b>CCSDS OEM</b> (Orbit Ephemeris Message)

seg-68d762928f76 = čtení <b>i</b> zápis

seg-eea6e5c8c220 = CCSDS 502.0-B Orbit Data Messages, forma KVN (zápis klíč–hodnota)

seg-be700901c03e = Tabelární efemeridy stavových vektorů, které přijímají GMAT, Orekit, STK (Systems Tool Kit). <c1/> je čte zpět; <b>ověřeno obnovením doslovného příkladu z Blue Book CCSDS 502.0-B-3, obrázek G-11</b> (<a1><c2/></a1>). Nepovinný <b>kovarianční blok</b> polohy/rychlosti { "6" }×{ "6" } (<c3/>, serializace KVN dolního trojúhelníku o 21 prvcích s nepovinným <c4/>) se zapisuje (<c5/>) i čte (<c6/>), zpáteční převod je symetrický (testy <a2><c7/></a2>).

seg-3c439cc66ea6 = <b>CCSDS OMM</b> (Orbit Mean-Elements Message)

seg-8e9f975d443b = CCSDS 502.0-B-2, forma KVN

seg-fb5218415d68 = Publikace středních elementů SGP4/TLE na standardní dráze (SGP4: Simplified General Perturbations { "4" }; TLE: dvouřádková sada elementů) (střední pohyb, e, i, Ω, ω, M, BSTAR (člen odporu orbitálního propagátoru)). Dosažitelné z CLI (CLI: rozhraní příkazové řádky) u scénáře <c1/> přes <c2/> nebo <c3/> (jeden OMM na každou družici definovanou TLE, s jejím skutečným identifikátorem NORAD (North American Aerospace Defense Command), označením COSPAR (Committee on Space Research) a epochou; <a1><c4/></a1>). Forma XML (Extensible Markup Language) a čtečka jsou na řadě později.

seg-08425c4b2093 = <b>CCSDS TDM</b> (Tracking Data Message)

seg-bf870037a77d = CCSDS 503.0-B Tracking Data Message, forma KVN

seg-cd96db42ab43 = Záznamy sledování vzdálenosti / Dopplera / úhlu, které přelet nad DSN/ESTRACK (ESTRACK: evropská síť pro sledování kosmických těles) dodává systému OD (určování oběžné dráhy). <b>Ověřeno obnovením doslovného příkladu z Blue Book CCSDS 503.0-B-2, obrázek E-9</b> (<a1><c1/></a1>).

seg-4dd7358264b8 = <b>CCSDS Space Packet</b> ({ "133.0" })

seg-40accc5f1a67 = CCSDS 133.0-B-2 Space Packet Protocol

seg-ed9c8bdddd6d = Rámování primární hlavičky TM/TC (TM: telemetrie; TC: telekomando) o 6 oktetech, které si vyměňují pozemní systémy. <b>Kodér reprodukuje publikované bajtové testovací vektory nezávislé knihovny <c1/></b> (testy <a1><c2/></a1>).

seg-aa942198bb2e = <b>SP3-c (SP3: Standard Product { "3" }, formát přesných drah) / SP3-d</b> (přesné efemeridy)

seg-4d4237e15ef1 = IGS Standard Product { "3" } (c/d)

seg-8d1089fbd59d = Časová řada polohy v zemském pevném systému (ECEF) + času hodin. Zpáteční převod ověřen na < { "0.5" } m na skutečném snímku <c1/> (<a1><c2/></a1>).

seg-761698fcf960 = <b>RINEX (Receiver Independent Exchange Format) { "3" }</b> (broadcast navigace)

seg-897068cff342 = RINEX { "3" }.x NAV (IS-GPS-200, Galileo ICD (interface control document), BeiDou ICD, GLONASS (ruský globální družicový navigační systém) ICD)
