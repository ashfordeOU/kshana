# docs--kind-lunar-llr-datum: translations (nl)

seg-3068552e4ab4 = VALIDATED: de rijen van de <a1>verificatiematrix</a1> die dit kind noemen.

seg-1f17ef6a853e = Scenariokind van de engine v{ $version }, familie <a1>Maan en cislunair</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen veiligheidskritieke dienst. Elk label hier is dat van de engine of van de verificatiematrix; een kind is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-1c1eeb2dcaa0 = Familiepagina: <a1>Maan en cislunair</a1>

seg-3bc1761c76ab = { "3" } meegeleverde scenario's gebruiken dit kind; de overige staan in <a1><c1/></a1>.

seg-8f8871ac8a0f = Onderwerppagina: <a1>LUNAR-REFERENCE-STATION.md</a1>

seg-fd34d760edb1 = <b>VALIDATED</b> De datumcovariantie van de zevenparameter-Helmert, met haar twee gesimuleerde invoeren vervangen door gemeten invoeren: het schema is de zendepochs vanaf de grond van { "337" } gearchiveerde ILRS-normaalpunten van lunar laser ranging (2015-04-08 tot 2015-06-27, Grasse MeO { "7" } Tests: <a1>lunar_llr_real_data.rs</a1>.

seg-49baab4910f3 = ppb

seg-a7d59ba6e225 = rad

seg-8db575fc6d82 = Bron: <c1/>

seg-5329c6c75887 = <c1/> (scenariosoort)

seg-25455a33523c = Zevenparameter-Helmert-datum van het maanstelsel, aangedreven door een ECHTE, GEARCHIVEERDE waarnemingscampagne in plaats van een gesimuleerde. Waar lunar-frame-campaign de geïnjecteerde transformatie wegliet maar zijn stationsnetwerk, zijn schema en zijn sigma per waarneming nog als ILLUSTRATIVE invoer opgaf, haalt deze soort alle drie uit metingen: de epochs zijn de zendtijden vanaf de grond van gearchiveerde normaalpunten uit de ILRS Consolidated Laser Ranging Data, de waarnemingen zijn de laserafstanden die werkelijk zijn afgevuurd op de vijf retroreflectorarrays op de maan, en elk waarnemingsgewicht is de eigen gearchiveerde precisie van dat normaalpunt, bin_rms/sqrt(n_raw), uitgelezen uit het bestand. De stationscoördinaten komen uit de SLR-oplossing van IERS ITRF2020 (naar de epoch voortgeplant met hun gepubliceerde snelheden) en de reflectorcoördinaten uit JPL DE430 Table { "7" } in het mean-Earth/mean-rotation-stelsel dat het model IAU { "2015" } WGCCRE realiseert. Afstandspartiëlen worden opgeteld tot de gezamenlijke Fisher-informatiematrix van de reflectorcoördinaten en via hetzelfde Helmert-ontwerp voortgeplant naar de datumcovariantie, gediagnosticeerd door crate::fim::crlb. Rang, defect, conditie, spectrum, onwaarneembare richtingen in de zevenparameterbasis, de zwakste richting bij volle rang en het aandeel van elke parameter daarin worden bij elke run uitgegeven, en een niet-beperkte parameter wordt gepubliceerd als NULL met een status. De correlatie tussen arrays is MEASURED op exact nul in plaats van aangenomen, omdat een laserafstand één array raakt. Een record dat de catalogi niet kunnen plaatsen — een station zonder gepubliceerde ITRF-positie — wordt OVERGESLAGEN EN GETELD en krijgt nooit een vervangende coördinaat. WELKE LINKS MEASURED ZIJN EN WELKE MODELLED, IS HET RAPPORT ZELF, GEEN VOETNOOT: de efemeride van het maanmiddelpunt en de IAU-lichaamsoriëntatie blijven gemodelleerd en hun gecombineerde omvang wordt uitgegeven als het residu waargenomen-min-berekend van de enkele afstand over elk gebruikt punt; troposfeer, vastelichaamsgetijden, stationsexcentriciteit, poolbeweging, UT1-UTC, relativistische vertraging en stationsklokken ontbreken en zitten binnen dat residu. Omdat een efemeridefout een covariantie alleen bereikt via de richting van elke zichtlijn, lost elke run ook het hele datum opnieuw op met alle partiëlen gekanteld met sensitivity_tilt_deg (met wisselend teken) en geeft de verhouding uit, zodat de ongevoeligheid van de covariantie voor de gemodelleerde efemeride een getal is in plaats van een betoog. De eigen cijfers van de gesimuleerde campagne worden UITGEVOERD en naast de gemeten cijfers afgedrukt, niet overgenomen. MODELLED: de zevenparametercijfers zijn een Cramer-Rao-grens voor een verkleinde parameterverzameling op een echt schema — geen opgelost datum, geen LLR-analyse en geen geodetisch product. De vastgelegde reeks met echte gegevens wordt met de repository meegeleverd maar niet met de gepubliceerde crate; wijs data_dir aan op een kopie ervan.

seg-f4359803d67a = Eén run van <c1/> vat zich samen als: lunar-llr-datum: { "337" } gearchiveerde normaalpunten ({ "349" } geparseerd) van { "2" } station(s) naar { "5" } retroreflectorarrays over { "80.9" } d; mediane gemeten precisie van het normaalpunt { "5.13" } mm enkele afstand; informatierang van de reflector 15/15; Helmert-rang 7/7 cond { "2.399e4" }; datumtranslatiesigma { "1.851746e-2" } m; RMS van het residu waargenomen-min-berekend van de enkele afstand { "156493.9" } m (de gemodelleerde links, vooral de analytische maanefemeride)

seg-7eda56c1285a = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>

seg-c95b4d285cbd = Het voorbeeld <c1/> stelt onder meer in:

seg-37a77f49f048 = ps

seg-b5c1e8681164 = Resultaatlabel (dat van de engine): Datum van het maanstelsel uit een ECHTE waarnemingscampagne. Het schema, het aantal waarnemingen en elk waarnemingsgewicht komen uit gearchiveerde normaalpunten van ILRS lunar laser ranging (gemeten); de stationscoördinaten komen uit IERS ITRF2020 en de coördinaten van de retroreflectoren uit JPL DE430 Table { "7" } (publishe

seg-e4da113cbe18 = De grafiek die de engine schrijft voor scenarios/lunar-llr-datum.toml, soort lunar-llr-datum

seg-764e54be97a0 = <b>VALIDATED</b> De datumcovariantie van de zevenparameter-Helmert van lunar-llr-datum uit gearchiveerde ILRS-normaalpunten en hun gemeten gewichten, op het kernelpad: het geocentrische maanmiddelpunt wordt uit JPL DE440 gelezen door de eigen kernellezer van de engine (planetary_ker Tests: <a1>validate_llr_datum_kernel_moon.rs</a1>.

seg-cae262db0e46 = <b>VALIDATED</b> De datumcovariantie van de zevenparameter-Helmert, met haar twee gesimuleerde invoeren vervangen door gemeten invoeren: het schema is de zendepochs vanaf de grond van { "337" } archief. Onafhankelijke referentie (ExternalDataset): Identiteiten in gesloten vorm, een onafhankelijke route binnen de repository en, sinds { "0.36" }, een onafhankelijke referentiebibliotheek van SPICE en NumPy op verse gemeten gegevens (hieronder); er bestaat geen gepubliceerd paar datumcovarianties voor lunar LLR om aan te toetsen, dus er wordt geen nauwkeurigheid geclaimd. De enige nieuwe afgeleide — de afstandspartiële naar de lichaamsgebonden positie van de reflector — wordt opnieuw afgeleid via een centraal eindig verschil van de tweewegs-looptijd die ze diffe

seg-61ac3609406a = Datum van het maanstelsel uit een ECHTE waarnemingscampagne. Het schema, het aantal waarnemingen en elk waarnemingsgewicht komen uit gearchiveerde normaalpunten van ILRS lunar laser ranging (gemeten); de stationscoördinaten komen uit IERS ITRF2020 en de coördinaten van de retroreflectoren uit JPL DE430 Table { "7" } (gepubliceerd). De efemeride van het maanmiddelpunt, de IAU { "2015" } WGCCRE-lichaamsoriëntatie en de afwezigheid van troposfeer, getijden, stationsexcen (resultaat <c1/>)

seg-97610a2cca73 = De correlatie tussen arrays is MEASURED op exact nul in plaats van aangenomen, omdat een laserafstand één array raakt. (soortencatalogus (<c1/>))

seg-64b1c08eeb11 = WELKE LINKS MEASURED ZIJN EN WELKE MODELLED, IS HET RAPPORT ZELF, GEEN VOETNOOT: de efemeride van het maanmiddelpunt en de IAU-lichaamsoriëntatie blijven gemodelleerd en hun gecombineerde omvang wordt uitgegeven als het residu waargenomen-min-berekend van de enkele afstand over elk gebruikt punt; troposfeer, vastelichaamsgetijden, stationsexcentriciteit, poolbeweging, UT1-UTC, relativistische vertraging en stationsklokken ontbreken en zitten binnen dat residu. (soortencatalogus (<c1/>))

seg-d38710f3ce4a = MODELLED: de zevenparametercijfers zijn een Cramer-Rao-grens voor een verkleinde parameterverzameling op een echt schema — geen opgelost datum, geen LLR-analyse en geen geodetisch product. (soortencatalogus (<c1/>))

seg-a19e2b1fcaf1 = de epochs zijn de zendtijden vanaf de grond van gearchiveerde normaalpunten uit de ILRS Consolidated Laser Ranging Data; * de waarnemingen zijn de laserafstanden die werkelijk zijn afgevuurd op de vijf retroreflectorarrays op de maan; * elk waarnemingsgewicht is de EIGEN gearchiveerde precisie van dat normaalpunt, bin_rms/sqrt(n_raw), uitgelezen uit het bestand in plaats van aangenomen. (commentaar in het scenariobestand, regels { "7" } tot { "12" })

seg-5ed6b83c01da = WELKE LINKS MEASURED ZIJN EN WELKE MODELLED, IS HET RAPPORT ZELF, GEEN VOETNOOT. De efemeride van het maanmiddelpunt en de IAU-lichaamsoriëntatie blijven gemodelleerd, en hun gecombineerde omvang wordt uitgegeven als het residu waargenomen-min-berekend van de enkele afstand over elk gebruikt punt; troposfeer, vastelichaamsgetijden, stationsexcentriciteit, poolbeweging, UT1-UTC, relativistische vertraging en stationsklokken ontbreken en zitten binnen dat residu. Omdat (commentaar in het scenariobestand, regels { "18" } tot { "26" })

seg-7e7ff3ce4971 = De correlatie tussen arrays is MEASURED op exact nul in plaats van aangenomen, omdat een laserafstand één array raakt. Een record dat de catalogi niet kunnen plaatsen — een station zonder gepubliceerde ITRF-positie — wordt OVERGESLAGEN EN GETELD en krijgt nooit een vervangende coördinaat. De eigen cijfers van de gesimuleerde campagne worden UITGEVOERD en naast de gemeten cijfers afgedrukt. (commentaar in het scenariobestand, regels { "28" } tot { "31" })

seg-8bfe258bedf5 = MODELLED: de zevenparametercijfers zijn een Cramer-Rao-grens voor een verkleinde parameterverzameling op een echt schema. Geen opgelost datum, geen LLR-analyse, geen geodetisch product. (commentaar in het scenariobestand, regels { "33" } tot { "34" })

seg-598a7d6ba1e7 = <s1>Vorige</s1>lunar-joint-od-clock

seg-54b1c9200aae = <s1>Volgende</s1>lunar-station-coverage
