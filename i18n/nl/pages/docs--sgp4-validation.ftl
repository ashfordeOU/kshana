# docs--sgp4-validation: translations (nl)

seg-3c513ef2fd3b = Grootheid

seg-09da3685124b = Bron: <c1/>

seg-dd68e234a5cd = Validatie van SGP4/SDP4 tegen de referentie van de gemeenschap

seg-d7567fa218fe = De baanpropagator van { -brand } is getoetst aan de <b>canonieke referentie van de gemeenschap</b> voor SGP4/SDP4 (SGP4: Simplified General Perturbations { "4" }; SDP4: Simplified Deep-space Perturbations { "4" }): de verificatievectoren die zijn gepubliceerd bij Vallado e.a., <em>"Revisiting Spacetrack Report #3"</em> (AIAA (American Institute of Aeronautics and Astronautics) 2006-6753), verspreid als <c1/> (de test-TLE's (two-line element sets)) en <c2/> (de verwachte TEME-toestand (true equator, mean equinox) op elk tijdstip). Dit is dezelfde referentie waaraan de openbare C++/Python/MATLAB-implementaties worden getoetst, dus overeenstemming hier is overeenstemming met de feitelijke standaard.

seg-b99fb640886c = Vergeleken referentietoestanden

seg-b16a220a41b7 = (alle rijen in <c1/>, vastgelegd in de test)

seg-e7d45e243571 = Grootste positiefout

seg-af3129dd345c = <b>{ "4.12" } mm</b> ({ "4.120e-6" } km, satelliet { "23333" }; < <c1/> km tolerantie)

seg-01da72026e56 = Grootste snelheidsfout

seg-483a7f8f4104 = <b>{ "1.85e-9" } km/s</b> (satelliet { "23333" }; < <c1/> km/s tolerantie)

seg-041cbc679ed7 = Gedekte gevallen

seg-283f3c571a7c = SGP4 voor nabij de aarde, SDP4 voor de diepe ruimte (maan-zon + { "12" } u/24 u resonantie), en de opzettelijke foutcodegevallen

seg-75c2bd004348 = De gevallen voor de diepe ruimte en met resonantie zijn voor dit project specifiek van belang: GNSS-satellieten (global navigation satellite system) bevinden zich in banen van ~{ "12" } u die zich in de diepe ruimte bevinden en resonant zijn, wat een tweelichamenmodel met J2-seculair niet kan reproduceren; SGP4/SDP4 wel.

seg-613697670501 = Methode

seg-d753e2f76b4a = De implementatie (<c1/>) is een Rust-port zonder afhankelijkheden van het algoritme van Vallado, dat tot het publieke domein behoort; de epochverwerking is dagen sinds 1950, de modus <c2/> (niet <c3/>) wordt gebruikt, en de zwaartekrachtconstanten van WGS-72 (WGS: World Geodetic System) worden toegepast zoals de referentie voorschrijft.

seg-ebc18c4cb8ad = De test (<c1/>) parseert de meegeleverde fixtures <c2/> en <c3/> (<c4/>), propageert elke testsatelliet naar elk referentietijdstip en controleert dat de TEME-positie en -snelheid binnen de bovenstaande toleranties overeenkomen. Het aantal vergeleken rijen ligt vast op precies <c5/>, zodat een regressie in een fixture of in het overslaggedrag de dekking niet ongemerkt kan verkleinen.

seg-d0566d4db829 = Reproduceer het

seg-ba3ed7f0aba7 = De test toont het aantal vergeleken rijen en de grootste fouten in positie en snelheid. De fixtures zijn vastgelegd in de repository, dus de controle is volledig offline en deterministisch.

seg-4f539e17926e = Onafhankelijke kruiscontrole met de crate <c1/>

seg-0c2d2752179f = Overeenstemming met de gepubliceerde referentie bewijst juistheid tegenover een <em>tabel</em>. Om ook juistheid aan te tonen tegenover een <em>onafhankelijke implementatie</em>, laat <c1/> een veelgebruikte, onafhankelijke Rust-SGP4-bibliotheek draaien, de crate <a1><c2/></a1> (neuromorphicsystems/sgp4, versie { "2.4" }), over dezelfde { "666" } AIAA-vectoren en vergelijkt de twee codebases rechtstreeks. Beide worden aangestuurd met het zwaartekrachtmodel <b>WGS72</b> (World Geodetic System { "1972" }) waarin de vectoren zijn gedefinieerd (de standaard <c3/> van de crate gebruikt WGS84 (World Geodetic System { "1984" }), dat ongeveer een km afwijkt van de WGS72-referentie: een modelleringskeuze, eerlijk vermeld, geen fout).

seg-da0e4e6c9e96 = Regime

seg-a6eefd68c27c = kshana ↔ referentie

seg-e725899898a3 = crate ↔ referentie

seg-427820fec0e7 = kshana ↔ crate

seg-6305527acfa4 = nabij de aarde (LEO/MEO (LEO: low Earth orbit; MEO: medium Earth orbit))

seg-081e28a39101 = { "7.3e-9" } km

seg-e68c97a6528a = { "4.4e-10" } km

seg-4c34e8e2f4c4 = diepe ruimte (niet-resonant)

seg-12e758e04df0 = { "4.1e-6" } km

seg-db82b835dec9 = { "2.1e-7" } km

seg-d7d4f47417bc = resonantie in de diepe ruimte (½ dag)

seg-17007f8aada3 = { "8.1e-9" } km

seg-895ba7518ab3 = { "7.7e-9" } km

seg-be5a634658e5 = { "2.2e-9" } km

seg-6cf60f32cbcd = resonantie in de diepe ruimte (1 dag)

seg-7698aecab6b4 = { "8.2e-9" } km

seg-60520079d492 = { "7.8e-9" } km

seg-c22876d62c29 = Twee onafhankelijke implementaties komen overeen tot <b>submicron</b> bij banen nabij de aarde en resonante banen, en tot <b>{ "4.12" } mm in het ongunstigste geval</b> over alle regimes: dezelfde { "4.12" } mm die de eigen afwijking van { -brand } van de referentie is, dus het verschil <em>is</em> dat ene geval in de diepe ruimte, waarbij de crate tussen { -brand } en de tabel in zit. De volledige tabel (met aantallen rijen per regime en de vier pathologische gevallen die de crate bij constructie weigert) is vastgelegd in <a1><c1/></a1> en wordt opnieuw gegenereerd via <c2/>.

seg-3aae516df868 = Status van het "publiceren" van dit resultaat

seg-2dd4b77c49d1 = De kruisvalidatie zelf is voltooid en maakt deel uit van de repository. Het indienen van het resultaat bij externe podia (een gemeenschapscatalogus, een korte notitie, een in een DOI (digital object identifier) gearchiveerd record) is een actie van de maintainers die afzonderlijk op de roadmap wordt bijgehouden; dit document is het record in de repository waarnaar die indieningen zouden verwijzen.

seg-b36bbcc0a0c8 = <s1>Vorige</s1>EN { "16803" }

seg-4d5234d85d9f = <s1>Volgende</s1>Validatie van het krachtmodel

seg-6539dbb48bca = Onafhankelijke kruiscontrole met de crate sgp4
