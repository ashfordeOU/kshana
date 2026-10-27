# docs--lunar-infrastructure: translations (nl)

seg-61817375c8ea = Maanbaan en maanoppervlak als navigatie- en geodetische infrastructuur

seg-cae10fb9bff8 = Scenario

seg-9872e31ebd72 = Bronnen

seg-922905241a6b = Bron: <c1/>

seg-bfb9c5efbe57 = Scenariosoort <c1/>, vijf studies geselecteerd door <c2/>. <b>MODELLED</b>: een beperkt driebolsmodel met vermelde vereenvoudigingen en ILLUSTRATIVE invoer. De numerieke uitkomsten zijn gecontroleerd aan de hand van onafhankelijke numpy/scipy-programma's; niets wordt vergeleken met een meting van een maangrootheid en niets hier is een uitspraak over een missie of systeem. Niet verbonden aan of onderschreven door enig agentschap. Adviserende software, geen typegoedgekeurde apparatuur. { -brand } zendt niets uit en stuurt geen hardware aan.

seg-7908583855a2 = De ontwerpen, invoer en drempels zijn vastgelegd in <c1/> (vastgelegd voordat enige studie werd gescoord) en twee openbaar gemaakte amendementen (<c2/>). Het oordeel over elke drempel staat in <c3/>.

seg-d9d9d0864ae0 = Studie

seg-3b01a756c305 = Wat zij berekent

seg-a4ef7c81b35f = Baanbepaling aan boord met Earth-GNSS in een NRHO (of <c1/>) tegenover een onafhankelijke baanbepaling vanaf de grond met afstand en afstandsverandering via drie DSN-stations; de formele covariantie van elke schatting; een geseedde Monte Carlo of de twee covarianties hun verschil verklaren (q, chi-kwadraat met { "6" } vrijheidsgraden); een geïnjecteerde ongemodelleerde versnelling

seg-849c67471e69 = <c1/> (snel), <c2/> (gescoord, ongeveer acht minuten)

seg-b9c6eb8d778c = Gezamenlijke dubbelverschil-draaggolffase van oppervlaktestation en orbiter; covariantie van de float-ambiguïteit; LAMBDA; bootstrap- en Monte Carlo-succes; positiesigma float en fixed

seg-74c347e0bc69 = Fisher-informatie van het 7-parameter maandatum uit afstandsmeting vanaf aardstations, met en zonder afstanden van orbiter naar oppervlaktestation; geseedde willekeurige stationsverzamelingen

seg-4ed875c39781 = GNSS, VLBI en laserafstandsmeting op één ruimtevaartuig: Cramér-Rao-precisie van de offsets tussen technieken tegenover de fout van de lokale tie

seg-de25104c09a2 = Informatie over h2, k2, l2 en de fysieke libratie uit laserafstandsmeting, orbitervolging, een gravimeter en een oppervlakteklok (constanten gedeeld met de maantijdmodules)

seg-18fc4ba766df = Consistentie van een baanbepaling aan boord met Earth-GNSS in een bijna rechtlijnige halobaan met een onafhankelijke baanbepaling vanaf de grond, uit echte runs van engine v{ $version } op scenarios/lunar-infrastructure-od-consistency.toml en de variant met modelfout ({ "400" } trials elk). Het gemiddelde genormaliseerde verschil q is { "5.81" } zonder modelfout en { "5.95" } met een geïnjecteerde versnellingsfout van { "3e-10" } m/s2, tegenover { "6" } verwacht: de twee baanoplossingen zijn consistent (drempel C1 MET). Het aandeel trials boven het { "95" } %-punt is { "0.040" } en { "0.052" }; de drempel voor het detecteren van de geïnjecteerde fout was ten minste { "0.5" }, dus die is NOT MET (C3): de oplossing aan boord is bekend tot ongeveer { "352" } m tegenover { "23" } m voor die vanaf de grond, zodat een verplaatsing van tien meter zich binnen haar covariantie verbergt. MODELLED: een beperkt driebolsmodel met vermelde vereenvoudigingen en illustratieve invoer, geen meting van enige maangrootheid. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen safety-of-life-dienst.

seg-4c08262e2556 = Vaststelling van de geheeltallige ambiguïteit van de draaggolffase tussen maanoppervlaktestations en een orbiter, uit het vastgelegde resultaat van de gescoorde run van engine v{ $version } (tests/fixtures/lunar_infra/phase_full_run.json: { "3" } booglengtes, elk een Monte Carlo van { "400" } trekkingen, geschreven door scenarios/carrier-phase-scored.toml). { "1" } dag: succes { "1.0" } % (standaardfout { "0.5" } %), { "134" } ambiguïteiten, positiesigma van de orbiter { "45.6" } m float en { "18.5" } m fixed; { "2" } dag: succes { "0.5" } % (standaardfout { "0.4" } %), { "259" } ambiguïteiten, positiesigma van de orbiter { "21.5" } m float en { "8.7" } m fixed; { "3" } dag: succes { "2.8" } % (standaardfout { "0.8" } %), { "375" } ambiguïteiten, positiesigma van de orbiter { "6.3" } m float en { "2.1" } m fixed. Geheeltallige vaststelling wordt niet bereikt: het succes blijft tussen { "1" } % en { "3" } % bij { "25" } dBi, en bij de geregistreerde { "12" } dBi kan het probleem niet worden opgesteld. MODELLED: een beperkt driebolsmodel met vermelde vereenvoudigingen en illustratieve invoer, geen meting van enige maangrootheid. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen safety-of-life-dienst.

seg-7e5b10641b20 = Precisie van het zevenparameter-maandatum (drie translaties, een schaal en drie rotaties) uit afstandsmeting vanaf aardstations, met en zonder afstanden van orbiter naar oppervlaktestation, uit een echte run van engine v{ $version } op scenarios/lunar-infrastructure-frame-coestimation.toml. De Cramér-Rao-sigma van de translaties en rotaties daalt met de orbiterlinks (bijvoorbeeld t_z van { "0.98" } m naar { "0.046" } m); de kleinste informatie-eigenwaarde stijgt 111-voudig en het CRLB-spoor daalt tot { "1.0" } % (drempel F3 MET). Dit veronderstelt dat de baan bekend is in de maanassen, met haar fout meegenomen via de afstandssigma van de orbiter van { "1" } m. MODELLED: een beperkt driebolsmodel met vermelde vereenvoudigingen en illustratieve invoer, geen meting van enige maangrootheid. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen safety-of-life-dienst.

seg-377d29dcc6e8 = Precisie van de offsets tussen laserafstandsmeting-, VLBI- en GNSS-posities van één ruimtevaartuig, tegenover de fout van de lokale tie op de grond, uit een echte run van engine v{ $version } op scenarios/lunar-infrastructure-space-tie.toml (één boog van 6.56 dagen, techniek-sigma's GNSS { "10" } m, VLBI { "1" } m, laser { "0.1" } m). Met een lokale tie van { "1" } mm tot { "1" } m blijft de translatiesigma laser-min-GNSS rond { "1.04" } m tot de tie { "1" } m bereikt: zij wordt beperkt door de meetruis van de technieken, niet door de lokale tie. De ondergrens die de tie alleen vastlegt is de wortel uit twee maal haar sigma. MODELLED: een beperkt driebolsmodel met vermelde vereenvoudigingen en illustratieve invoer, geen meting van enige maangrootheid. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen safety-of-life-dienst.

seg-9d507a371319 = Welke observeerbare familie gevoelig is voor de Love-getallen h2, k2 en l2 van de maan, uit een echte run van engine v{ $version } op scenarios/lunar-infrastructure-geodesy-sensitivity.toml. Elke cel is de RMS-partiële afgeleide van de waarnemingen van een familie naar een parameter, in de eigen eenheden van die familie (cellen worden dus langs een rij vergeleken, niet langs een kolom); een streepje betekent dat de familie geen gevoeligheid heeft. laserafstandsmeting: h2 { "7.6" }, k2 geen, l2 { "9.8" }. orbitervolging: h2 geen, k2 { "0.00086" }, l2 geen. oppervlaktegravimeter: h2 { "2.9e+03" }, k2 { "4.3e+03" }, l2 geen. oppervlakteklok: h2 { "2.8e-17" }, k2 { "2.8e-17" }, l2 geen. Met alle vier de families is de Cramér-Rao-sigma { "0.36" } % van het nominale h2, { "0.52" } % van k2 en { "1.16" } % van l2. Het toevoegen van een familie verlaagde nooit de kleinste eigenwaarde ({ "28" } van { "28" } toevoegingen), maar het spoor van de pseudo-inverse was slechts in { "16" } van { "28" } gevallen niet groter: die helft van drempel G3 is NOT MET. De orbiterfamilie ziet de zichtlijnintegraal van de k2-versnelling, een cijfer aan de bovenkant. MODELLED: een beperkt driebolsmodel met vermelde vereenvoudigingen en illustratieve invoer, geen meting van enige maangrootheid. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen safety-of-life-dienst.

seg-570b9276834b = Vermelde vereenvoudigingen

seg-ab053aadb65d = Aarde en Maan als puntmassa's op een cirkelbaan, geen Zon, geen zwaartekrachtharmonischen van de maan; de rotatieas van de Aarde is de baannormaal; het inertiaalstelsel is gelijk aan het roterende stelsel op t = { "0" }; een bolvormige Maan; een synchroon maanstelsel (geen libratie) behalve in <c1/>; de baan wordt in <c2/> als bekend in de maanassen gehouden (haar fout wordt meegenomen door de afstandssigma van de orbiter); de orbiterfamilie van <c3/> ziet de zichtlijnintegraal van de k2-versnelling nadat een constante en een lineaire trend zijn verwijderd, een cijfer aan de bovenkant.

seg-fd644b1f33ec = Vorm van het rapport

seg-03efc65cbb0e = Elk rapport bevat <c1/>, <c2/>, <c3/>, <c4/>, de velden van de studie en een blok <c5/> (een eenheid en een herkomstklasse voor elk numeriek veld). Er worden geen reeksen per tijdstip uitgegeven. Veldlijsten: het blok <c6/> van elk rapport en <c7/>.

seg-bc9bb4f545e2 = k2 = { "0.024116" } +/- { "0.000108" } (Lemoine et al., Geophys. Res. Lett. { "41" }({ "10" }), 3382-3389, { "2014" }, doi 10.1002/2014GL060027), gebruikt als nominale waarde. h2 en l2 zijn linearisatiepunten, geen geverifieerde waarden. De coördinaten van DSN-stations zijn de ITRF93-waarden in de commentaren van de NAIF-kernel <c1/>; de nauwkeurigheidsbanden van de DSN zijn alleen uit samenvattingen uit zoekresultaten gelezen. Het space-tie-concept volgt de openbare beschrijvingen van GRASP en ESA Genesis. De volledige tabel, met hoe elke waarde is gelezen, staat in de preregistratie.

seg-6cd670ae6eea = Resultaten in één oogopslag (zie RESULTS.md)

seg-6334f82991d3 = Niet gehaald, en vastgepind door tests die de misser vaststellen: C3 (de metriek voor de geïnjecteerde fout slaat niet aan bij { "3e-10" } m/s2), de helft van Q3 met het bootstrap-percentage bij { "1e-9" }, en de helft van G3 met het CRLB-spoor. Geheeltallige ambiguïteitsvaststelling wordt bij de geregistreerde invoer niet bereikt. Niets is VALIDATED.

seg-1d3bffc2fd02 = <s1>Vorige</s1>Navigatie voor ruimtegebruikers (gnss-ssv)

seg-90932eed0074 = <s1>Volgende</s1>Positiebepaling, navigatie en tijdsynchronisatie in een LEO
