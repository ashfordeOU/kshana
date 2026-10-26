# docs--rust: translations (nl)

seg-d4a762001549 = Licentie

seg-4dbf41c0ec3b = Functie

seg-81a87d14efda = Kshana: het merkteken, een kompasvizier dat het precieze moment markeert, naast het woordmerk kshana

seg-32c82b87acd6 = <b>Kshana · <s1>क्षण</s1> · <em>het precieze moment</em></b><br/> Een opensource-simulator voor de veerkracht van PNT (positiebepaling, navigatie en tijdsynchronisatie).

seg-3b861b2f08b8 = Release v{ $version }

seg-ebe636986f46 = { "176" } van { "388" } mogelijkheden getoetst aan onafhankelijke externe referenties

seg-6a1906d8d4ad = Ongeveer { "95" }% regeldekking, in continue integratie bewaakt op { "85" }%

seg-a9f4f2795fb5 = Licentie: AGPL-3.0-only, of een commerciële licentie

seg-3f6b9ca5e225 = DOI 10.5281/zenodo.20528627

seg-7fcbe854ebc4 = Oefen de minuut waarin GNSS uitvalt: de missieconsole van Kshana, getekend op basis van een echte run van de engine, een geketende campagne van jamming, spoofing, holdover en integriteit over de { "102" } satellieten van GPS, Galileo, BeiDou en GLONASS

seg-d1153c5e9112 = Oefen de minuut waarin GNSS uitvalt

seg-d1a3f78ad8e0 = Probeer het eerst zonder iets te installeren: <a1>Kshana Studio</a1> draait de hele engine in uw browser, gecompileerd naar WebAssembly, en uploadt niets.

seg-2d2c47db0c1f = <b>{ "176" } van { "388" }</b> mogelijkheden getoetst aan onafhankelijke externe referenties; { "208" } eerlijk gelabeld als modelmatig, { "4" } in eigendom van een partner. Elke mogelijkheid draagt één label in een machinaal gecontroleerd register: VALIDATED (een onafhankelijke externe referentie komt overeen: echte data, een onafhankelijke implementatie of gepubliceerde referentievectoren), MODELLED (intern consistent, en dat wordt openlijk gezegd) of PARTNER (een hardwarepartner is eigenaar). Onder de controles: alle { "666" } SGP4-vectoren (Simplified General Perturbations { "4" }) van AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 tot { "4.12" } mm, en het Cowell-krachtmodel tot { "0.08" } m ten opzichte van Orekit { "12.2" }.

seg-44f7862c45a2 = Hoe een mogelijkheid haar label verdient: mogelijkheid, onafhankelijke referentie, test, registerlabel. De verificatiestatus over alle { "388" } mogelijkheden: { "176" } getoetst aan een onafhankelijke externe referentie, { "208" } modelmatig, { "4" } in eigendom van een partner

seg-12a295fba8a5 = Elke mogelijkheid in de verificatiematrix is gelabeld <b>getoetst aan een onafhankelijke externe referentie</b>, <b>modelmatig</b> of <b>in eigendom van een partner</b>; de cijfers voor optische klokken zijn ruimtedoelen op grondhardware (er is nog geen optische strontiumklok gevlogen). De maturiteit is <em>niet</em> uniform over de domeinen — PNT op aarde is getoetst aan echte data; navigatie in de diepe ruimte en op Mars is modelmatig, waarbij alleen de bouwstenen (lichttijd, planeetposities) zijn getoetst aan externe onafhankelijke referenties; baanbepaling (orbit determination) in de diepe ruimte voor echte missies staat op de roadmap.

seg-3de57431d3e6 = De engine heeft { "87" } scenariosoorten; <c1/> toont ze met hun velden. Nieuw in { "0.38.0" }: <c2/> (GNSS-signalen voor ruimtevaartuigen boven, rond en voorbij de GNSS-banen) en <c3/> (maanbaan en maanoppervlak als navigatie- en geodetische infrastructuur), beide MODELLED, en <c4/> (een tijdfoutregistratie tegenover de ITU-T-maskers).

seg-68ed88ec0b32 = <b>Spectrum</b>: hoe een jammer de GNSS L-band inneemt, band voor band.

seg-f04a0aeeee33 = <b>Klokken en tijdsynchronisatie</b>: holdover tegenover een drempel, tijdoverdracht, en telecom-holdover tegenover de maskers van de standaardisatiesector van de International Telecommunication Union (ITU-T).

seg-7e38ac603ef2 = <b>Constellaties rond elk lichaam</b>: dekking, dilution of precision en beschikbaarheid rond de aarde, de maan of Mars, en het zonnestelsel op één epoch.

seg-82708b06dcc6 = <b>Navigatie met lage aardbaan</b>: signaal, passage en link, navigatiebericht, en een gefuseerde positiebepaling, fase voor fase.

seg-e21e9bb02d00 = <b>Campagnes</b>: een geketende missie, een sweep of een Monte Carlo-ensemble in één scenario.

seg-ba5057da54e4 = <b>Rapporten, animatie en exports</b>: elk cijfer met zijn eenheid en label; een geanimeerde tekening van een run; SP3- (Standard Product { "3" }), CCSDS- (Consultative Committee for Space Data Systems) baanberichten, CZML- (Cesium Language), KML- (Keyhole Markup Language), GeoJSON-, STK- (Systems Tool Kit) en SigMF-bestanden (Signal Metadata Format).

seg-6b43a8c3031e = Eén open engine in het midden, kshana { $version }, met een getypeerde dispatch over { "75" } soorten; eromheen de opdrachtregel, de Rust-bibliotheek, Python, WebAssembly en Kshana Studio, de MCP-server, het Docker-image en de JetBrains-plug-in; eronder Kshana Pro, een propriëtaire laag die van de open engine afhangt en hem nooit forkt

seg-ea6f46d62e7b = Hetzelfde scenariobestand geeft op elk vlak dezelfde bytes. MCP is het Model Context Protocol: <a1><c1/></a1> laat een AI-assistent (kunstmatige intelligentie) de engine uitvoeren.

seg-f51b0a8cd30e = Zes artikelen op arXiv zijn gebouwd op de open engine, elk met de opdracht erachter: <a1>arXiv:{ "2606.22054" }</a1> (de optimismekloof van interferentiedetectoren), <a2>arXiv:{ "2606.24210" }</a2> (een voorwaardelijk beschermingsniveau voor tijdsynchronisatie), <a3>arXiv:{ "2607.05415" }</a3> (hoe stabiel een veerkrachtscore voor PNT is), <a4>arXiv:{ "2607.02566" }</a4> (waarneembaarheid van maanoppervlaktestations met very-long-baseline interferometrie), <a5>arXiv:{ "2607.06212" }</a5> (geometrie van het zuidpoolgebied van de maan en oppervlaktebakens) en <a6>arXiv:{ "2610.23871" }</a6> (cislunaire navigatie als waarneembaarheidsprobleem: booglengte, Gramiaan-conditionering en de Doppler-hefboom). Zie <a7>Onderzoek</a7>.

seg-dad7832bf2d2 = De hele engine is vrij onder de AGPL-3.0. Kshana Pro, een propriëtaire laag die van de open engine afhangt en hem nooit forkt, en studies op maat zijn onder contract beschikbaar bij Ashforde® OÜ: <a1>contact@ashforde.org</a1>. Er zijn geen prijzen; zie <a2>docs/PRO.md</a2>.

seg-d217f23af0c2 = Meer informatie

seg-0e8320f8ea91 = <b>De volledige README</b> → <a1>https://github.com/AshfordeOU/kshana</a1>

seg-acba56f9ed36 = <b>Kshana Studio</b> (de engine in uw browser, als WebAssembly) → <a1>https://kshana.dev</a1>

seg-13426521456e = <b>Mogelijkheden</b> → <a1>docs/CAPABILITY.md</a1>

seg-a42cfefa5e6d = <b>Validatie en herkomst</b> → <a1>docs/VALIDATION.md</a1> · <a2>docs/PROVENANCE.md</a2>

seg-07b9e03942cb = <b>Verificatiematrix</b> → <a1>docs/VERIFICATION-MATRIX.md</a1>

seg-9390336ecc01 = <b>Citeren</b> → <a1>CITATION.cff</a1> · DOI <a2>10.5281/zenodo.20528627</a2>

seg-d059e9fc67e1 = Vrij en opensource onder de <b>GNU AGPL-3.0-only</b> (de GNU Affero General Public License, alleen versie { "3" }). Een <b>commerciële licentie</b> is verkrijgbaar bij <a1>Ashforde® OÜ</a1> (een Estse besloten vennootschap; OÜ = osaühing) voor gesloten integratie; zie <a2>LICENSING.md</a2>. Professioneel ontwikkeld en onderhouden door Ashforde® OÜ.

seg-8c83544270b5 = Signatuur
