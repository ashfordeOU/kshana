# docs--solar-system: translations (nl)

seg-6cb7a787ac67 = Referenties

seg-31a05429b836 = Hemellichamen

seg-1c78d5337e16 = Pluto

seg-6e0cb6acc073 = VALIDATED

seg-60cd077d82a7 = Model

seg-c5ce76c91ff7 = Label

seg-430edd66bda0 = Niet gemodelleerd

seg-7670cf4ceda3 = Standaard

seg-e0eb14018b2c = zoals hierboven

seg-3dbc7ff9f5ab = Tabel

seg-9fe60d39f2db = Bron: <c1/>

seg-c44439432020 = Zonnestelsel en positiebepaling rond andere lichamen

seg-4d4ee55b5fb4 = Twee scenariosoorten werken buiten het systeem aarde-maan:

seg-fa202376da31 = <c1/> rapporteert elk lichaam van de catalogus op één epoch: positie en snelheid, fysische constanten, lichttijd en afstand vanaf een waarnemerslichaam, en een baanspoor.

seg-9859aabbb4f4 = <c1/> plaatst een navigatiegebruiker (een orbiter of een lander op het oppervlak) rond elk lichaam uit de catalogus behalve de zon en de aarde, met een lokale navigatieconstellatie en een optionele afstandsmeting in de diepe ruimte vanaf de aarde.

seg-ec582fa8f67f = De soort <c1/> gebruikt dezelfde catalogus om constellaties te bouwen rond elk van deze lichamen (<a1>CONSTELLATION-DESIGN.md</a1>).

seg-31f150c83173 = Code: <c1/> (de catalogus en zijn constanten), <c2/> (de analytische efemeriden), <c3/> (<c4/>, de provider die beide soorten lezen), <c5/> en <c6/> (de soorten) en <c7/> (lichttijd, tweewegafstand en de Shapiro-vertraging). Tests: <c8/> en de unittests van elke module.

seg-3ce9aab4916e = De catalogus

seg-35cd9ebaf04e = Achttien lichamen: de zon, de acht planeten, Pluto, de maan, Phobos, Deimos, de vier Galileïsche manen (Io, Europa, Ganymedes, Callisto) en Titan. Namen worden hoofdletteronafhankelijk herkend. Voor elk draagt <c1/> de gravitatieparameter GM, de equatoriale en volumetrisch gemiddelde stralen, de tweede zonale harmonische <c2/> en haar referentiestraal waar die is gepubliceerd, en het model van de pool en de nulmeridiaan van de International Astronomical Union (IAU) (siderische rotatieperiode, negatief voor een retrograde roteerder). Elke waarde noemt haar bron in de code.

seg-525b8b29345d = Waar de posities vandaan komen

seg-0fd4c3af55ba = Mercurius tot Saturnus en de aarde, uit Tabel { "1" } ({ "1800" } AD tot { "2050" } AD)

seg-9d820791a27b = Kepler-elementen van het Jet Propulsion Laboratory (JPL) van Standish en Williams, <a1>https://ssd.jpl.nasa.gov/planets/approx_pos.html</a1>

seg-d8549658ae99 = Alle acht planeten uit Tabellen 2a/2b ({ "3000" } BC tot { "3000" } AD)

seg-1f0b417c3809 = de elementen voor lange tijdspannen van dezelfde pagina

seg-bfe1c209044a = Uranus en Neptunus uit Tabel { "1" }

seg-ba5dfdd2de52 = de rij van Tabel { "1" } uit { "1992" } (alleen { "1800" } AD tot { "2050" } AD; de huidige pagina heeft haar verwijderd en vermeldt geen fout)

seg-001ca2ad22e1 = De maan

seg-6ff6068aeacf = de maanreeks van Montenbruck en Gill, met splitsing van het zwaartepunt aarde-maan

seg-f906cffa45a2 = Phobos, Deimos, de Galileïsche manen, Titan

seg-6ba84144ad88 = gemiddelde JPL-elementen met het IAU-rotatiemodel

seg-d5640ad2cd08 = <c1/> (de standaard) neemt Tabel { "1" } binnen { "1800" } AD tot { "2050" } AD en Tabellen 2a/2b daarbuiten; <c2/> en <c3/> dwingen er één af. Pluto buiten zijn tabel is een fout, geen extrapolatie. Het epoch is een ISO { "8601" }-datum en -tijd in Coordinated Universal Time (UTC), omgerekend via Terrestrial Time (TT) met de schrikkelseconden naar Barycentric Dynamical Time (TDB), of een TDB-juliaanse datum die rechtstreeks met <c4/> wordt opgegeven.

seg-912a2223e495 = De onafhankelijke referentie is JPL Horizons (<a1>https://ssd.jpl.nasa.gov/horizons/</a1>, Development Ephemeris DE441), met de opgevraagde vectoren vastgelegd onder <c1/>. Een planeetrij is VALIDATED waar zij binnen tweemaal de eigen nominale fout van de Standish-pagina blijft. Gemeten door <c2/>:

seg-d8bbd5e4f483 = Tabel { "1" }, Mercurius tot Saturnus en het zwaartepunt aarde-maan, { "12" } epochs van { "1800" } tot { "2049" }: ongunstigste { "1.87" } maal de nominale fout (afstand van Saturnus).

seg-18568cec6c91 = Tabellen 2a/2b, alle acht planeten, { "15" } epochs van ongeveer { "1000" } BC tot { "2500" } AD: ongunstigste { "1.71" } maal (afstand van Mars).

seg-7f3aa4a24e8f = Tabel { "1" } Uranus en Neptunus overschrijden de cijfers van de pagina tegen DE441: { "2.04" } en { "5.16" } maal de nominale lengtefout. Ze zijn vastgepind onder zes maal en blijven MODELLED.

seg-41d2f404224b = Pluto: binnen { "39.2" } boogseconden in lengte en { "1.14e9" } m in afstand.

seg-11c31908ba69 = Manen, ongunstigste hoek gezien vanaf de planeet over { "2000" } tot { "2040" }: Phobos { "5.65" } graden, Deimos { "0.38" }, Io { "0.40" }, Europa { "1.63" }, Ganymedes { "0.22" }, Callisto { "0.27" }, Titan { "3.31" }. De geocentrische maan: { "0.046" } graden.

seg-24d36a3ce8d4 = Planeetsnelheden: ongunstigste relatieve fout { "3.72e-3" } van de snelheid (MODELLED).

seg-0bae9b8d09ea = De maan en de zeven manen zijn gemeten met vastgepinde drempels, maar er bestaat geen gepubliceerde grens om ze aan te toetsen, dus ze zijn MODELLED.

seg-2cf791a940ea = De analytische efemeriden hebben geen kernelbestand nodig. Een Development Ephemeris-kernel van JPL (posities van DE-kwaliteit) wordt alleen gelezen door de afzonderlijke kruisvalidatiecrates onder <c1/>, via dezelfde trait <c2/>; de hoofdcrate hangt er niet van af.

seg-5bff2c54125b = Invoer: <c1/> (standaard 2026-01-01T00:{ "00" }:{ "00" }) of <c2/>; <c3/> (standaard alle achttien); <c4/> (standaard de aarde); <c5/> per baan ({ "8" } tot { "2000" }, standaard { "120" }); <c6/>; en een willekeurig aantal <c7/>, elk ontvangen op het epoch.

seg-5787ece2c791 = Per lichaam geeft het resultaat zijn klasse en ouder, de identificatie van de NASA Navigation and Ancillary Information Facility (NAIF), de heliocentrische positie en snelheid in het International Celestial Reference Frame (ICRF, equatoriaal J2000) in meter en meter per seconde, de ecliptische lengte, breedte en afstand, de positie ten opzichte van zijn ouder, de omloopperiode, de bovenstaande constanten, de pool en de nulmeridiaan op het epoch, de nominale fout van Standish waar die bestaat, zijn label en methodestring, en een baanspoor over één omloop (heliocentrisch voor een planeet, gecentreerd op de ouder voor een maan; één punt voor de zon). De verbinding vanaf de waarnemer, en elke extra verbinding, geeft:

seg-36bad4b7b4ba = de newtoniaanse enkele-weg-lichttijd, opgelost met de radiometrische vastepuntsoplosser voor lichttijd met de zender op zijn vertraagde positie, en de bijbehorende enkele-wegafstand;

seg-c5602eb76a05 = de tweewegslichttijd en -afstand;

seg-dab8e2db61d3 = de Shapiro-vertraging van de zon, afzonderlijk gerapporteerd en niet opgeteld;

seg-90d00587a59f = de hoek tot de zon.

seg-4c172f9f7cf6 = De lichttijd is VALIDATED tegen de enkele-weg-lichttijd die Horizons rapporteert: Mars en Jupiter tot het middelpunt van de aarde op vier epochs van { "2000" } tot { "2040" }, ongunstigste fout { "0.070" } s voor Mars tegen een drempel van { "0.207" } s en { "1.31" } s voor Jupiter tegen { "4.04" } s. De drempel is tweemaal de som van de afstandsfouten van Standish voor het doel en het zwaartepunt aarde-maan, gedeeld door de lichtsnelheid: de lichttijd kan niet beter zijn dan de posities. Het is de newtoniaanse geometrische lichttijd, geen relativistisch of voor plasma gecorrigeerde waarneembare grootheid.

seg-4f8cd6aef754 = De meegeleverde <c1/> rapporteert alle achttien lichamen op 2026-09-28T00:{ "00" }:{ "00" } met sporen van 180 punten, en voegt de verbindingen Mars-Jupiter (enkele weg { "2193.539" } s), Saturnus-aarde ({ "4212.176" } s) en Europa-Jupiter ({ "2.218" } s) toe.

seg-d22cc535f04b = Een gebruiker navigeert rond een lichaam dat bij naam is gekozen (elk lichaam uit de catalogus behalve de zon en de aarde, die de soort weigert) met twee soorten metingen:

seg-9eeb7f77aec7 = pseudoranges via enkele weg van een Walker-delta-navigatieconstellatie rond het lichaam (<c1/> bij <c2/>, fasering tussen vlakken <c3/>), gevlogen als tweelichamenbanen met de seculiere drift <c4/> van het lichaam zelf; de gebruikersklok is onbekend, dus deze rijen dragen een kolom voor klokbias;

seg-56ac318f6f27 = optioneel een tweewegafstand vanaf het middelpunt van de aarde (<c1/>), die geen gebruikersklok nodig heeft en wordt gerapporteerd als een enkele-wegafstand met eigen ruis. De richting en afstand van de aarde komen op elk epoch uit de analytische efemeride.

seg-551d44492aae = Een zichtlijn is geblokkeerd wanneer zij binnen de gemiddelde straal van het lichaam loopt (de koordetest van de soort <c1/>), en een gebruiker op het oppervlak heeft ook het elevatiemasker nodig. Op elk epoch vormt de run de geometrische en positionele dilution of precision (GDOP, PDOP) van de constellatie alleen, de formele positieonzekerheid van één sigma met en zonder de aarderij, en een met seed bepaalde Gauss-Newton-kleinstekwadratenpositiebepaling in beide gevallen, zodat het rapport toont wat de verbinding in de diepe ruimte toevoegt.

seg-6f1161567330 = hoogste niveau

seg-432421ccb9d7 = 2027-02-19T00:{ "00" }:{ "00" }, een Marsoppositie

seg-0b688042ed44 = { "86 400" } s, { "600" } s

seg-c7b3aaecd6e2 = <c1/> (of <c2/>)

seg-c452a6f7a9d4 = orbiter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

seg-67f7b23bf604 = { "400" } km, { "75" } graden, { "0" }, { "0" }, { "0" }

seg-b412b65733d8 = oppervlak: <c1/>, <c2/>, <c3/>

seg-7639d2583131 = drie gemiddelde stralen

seg-fe4a8d9da406 = { "60" } graden

seg-7ac449fb9569 = { "1" } m

seg-128c4a5edd9b = <c1/> (gebruiker op het oppervlak)

seg-3d4b760f6ed6 = { "10" } graden

seg-498493929023 = waar, { "1" } m

seg-18e477dc7f02 = <c1/> is de rechte klimming van de stijgende knoop in het equatoriale stelsel van het lichaam en <c2/> het argument van de breedte op het epoch.

seg-a743b0b5e668 = De twee meegeleverde scenario's, zoals ze draaien met kshana { "0.36" } (draagbare wiskunde, op elk platform dezelfde):

seg-b24010bdb302 = Gebruiker

seg-cb9cd741ba85 = orbiter, { "300" } km, { "93" } graden

seg-fa11e61f0d1d = oppervlak, { "20" } graden N, { "60" } graden E

seg-e17a9ae6905c = Relays

seg-359db3c9ad19 = { "12" } op { "10 000" } km, { "60" } graden

seg-1bb041045be4 = { "12" } op { "4500" } km, { "55" } graden, masker van { "10" } graden

seg-604aefd62668 = Duur

seg-825603e2fbed = één sol, { "296" } epochs

seg-372159825c11 = { "306 822" } s, { "171" } epochs

seg-132e3bbcc94c = Lichttijd naar de aarde, enkele weg / heen en terug

seg-76351e2f75f8 = { "338.3" } s / { "676.6" } s

seg-2d0234ec6301 = { "2182.9" } s / { "4365.8" } s

seg-d0f05f440103 = Aarde in zicht

seg-d7ad84776ec6 = { "0.811" } van de epochs

seg-44bf83b16660 = Beschikbaarheid, alleen relays / met de afstand tot de aarde

seg-07e0a8499670 = Mediane PDOP

seg-e802f5920237 = RMS-fout van de positiebepaling, alleen relays / met de afstand tot de aarde

seg-ed769d9370a0 = { "1.883" } m / { "1.629" } m

seg-873187e2b016 = { "112.742" } m / { "86.499" } m

seg-bcba58871d0b = Mediane formele sigma, alleen relays / met de afstand tot de aarde

seg-536757d9f141 = { "1.375" } m / { "1.304" } m

seg-14d7b5dc82e8 = { "5.360" } m / { "4.239" } m

seg-67d3d30060ad = (RMS: root mean square.) Eén Europa-epoch (t = { "16 200" } s) ligt op de rand van de beschikbaarheid, waar het laatste bit van een berekende straal bepaalt of zijn positiebepaling met de afstand tot de aarde tot stand komt. Vóór { "0.36" } besliste de wiskundebibliotheek van de host dat, dus hetzelfde scenario toonde { "0.719" } en { "86.147" } m op Linux x86-64 en { "0.725" } en { "85.800" } m op macOS arm64 voor de twee cijfers "met de afstand tot de aarde". Sinds { "0.36" } wordt elke transcendente functie berekend door de draagbare wiskundebibliotheek, dus het epoch wordt op elk platform op dezelfde manier beslist (native en WebAssembly geven dezelfde bytes), en de cijfers zijn { "0.713" } en { "86.499" } m (<a1><c1/></a1>). Rond Europa tilt de afstand tot de aarde de beschikbaarheid van { "0.480" } naar { "0.713" } van de epochs. Waar de aarde nooit boven de rand uitkomt, voegt de verbinding niets toe: een lander op { "89.5" } graden Z op de maan onder een relayschil van 12 satellieten en { "5000" } km heeft de aarde op { "0" } van { "145" } epochs in zicht, en zijn fouten zijn met en zonder de verbinding gelijk.

seg-41507568efb8 = <b>MODELLED.</b> De relaybanen negeren derde lichamen (de aantrekking van Jupiter op relays rond Europa is niet gemodelleerd), de ruis is Gauss op de vermelde niveaus en het meetmodel is instantaan, niet vertraagd met de lichttijd. Wat wordt gecontroleerd: de relayperiode tegen de derde wet van Kepler voor het lichaam, een orbiter die zijn straal behoudt en een lander op het oppervlak, de afstand tot de aarde die de formele onzekerheid nooit verslechtert, de met seed bepaalde positiebepalingsfouten die overeenstemmen met de formele sigma (effectieve waarde van fout gedeeld door sigma in [{ "0.6" }, { "1.5" }]), en een deterministische run. Niets hiervan zijn navigatiegegevens van een missie.

seg-b78c9e331a43 = De soort <c1/>

seg-b9f40c641a49 = Ondanks de naam is <c1/> een soort voor aardsatellieten: één satelliet, uit een two-line element set (TLE) via de propagator Simplified General Perturbations { "4" } (SGP4) of uit een analytische baan, over een tijdraster. Bij elke stap geeft hij de inertiale toestand (positie en snelheid) in het stelsel true equator, mean equinox (TEME) en in het Geocentric Celestial Reference System (GCRS), de aardvaste positie, het subsatellietpunt in het World Geodetic System { "1984" } (WGS { "84" }) en, voor een optioneel grondstation, azimut, elevatie, afstand en afstandssnelheid. <c2/> neemt de tekst aan van een <c3/>-bestand van de International Earth Rotation and Reference Systems Service (IERS) voor UT1−UTC en poolbeweging per epoch. Code: <c4/>.

seg-1babcba7b4ba = Relativistische lichttijdtermen buiten de afzonderlijk gerapporteerde Shapiro-vertraging, en de zonneplasmavertraging.

seg-0c49dfc777ca = Posities die beter zijn dan de hierboven vermelde nauwkeurigheid van Standish en van de gemiddelde elementen; de hoofdcrate heeft geen kernelreader.

seg-18d925e53ce0 = Verstoringen door derde lichamen op relays van <c1/> en op banen van <c2/>.

seg-3968ed54e3fe = Terrein op een willekeurig lichaam: een lichaam is zijn gemiddelde bol.

seg-4650526c532e = Interoperabiliteitsexports: CZML, KML en GeoJSON beschrijven posities rond de aarde, dus de scenario's <c1/> en <c2/> exporteren er geen (<a1>INTEROP.md</a1>).

seg-cb7e3d4bf5aa = E. M. Standish en J. G. Williams, "Keplerian Elements for Approximate Positions of the Major Planets," JPL Solar System Dynamics, <a1>https://ssd.jpl.nasa.gov/planets/approx_pos.html</a1>.

seg-aaf6a1f91c1a = O. Montenbruck en E. Gill, <em>Satellite Orbits: Models, Methods and Applications</em>, Springer, { "2000" }, §{ "3.3.2" }.

seg-8b7aa3bb95f0 = B. A. Archinal et al., "Report of the IAU Working Group on Cartographic Coordinates and Rotational Elements: { "2015" }," <em>Celestial Mechanics and Dynamical Astronomy</em> { "130" }, { "2018" }.

seg-10c8408cab27 = JPL Horizons, <a1>https://ssd.jpl.nasa.gov/horizons/</a1>.

seg-e95a41f0ded7 = <s1>Vorige</s1>Validatie van het krachtmodel

seg-a801b99f7040 = <s1>Volgende</s1>Maanreferentiestation

seg-e0aba02258f4 = De soort ephemeris
