# docs--kind-lunar-llr-datum: translations (nb)

seg-3068552e4ab4 = VALIDATED: radene i <a1>verifikasjonsmatrisen</a1> som nevner denne typen.

seg-1f17ef6a853e = Scenariotype i motoren v{ $version }, familie <a1>Måne og cislunart rom</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en sikkerhetskritisk tjeneste for menneskeliv. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett fortjenes: Evidens-avsnittet i README).

seg-1c1eeb2dcaa0 = Familieside: <a1>Måne og cislunart rom</a1>

seg-3bc1761c76ab = { "3" } medfølgende scenarioer bruker denne typen; de andre står i <a1><c1/></a1>.

seg-8f8871ac8a0f = Temaside: <a1>LUNAR-REFERENCE-STATION.md</a1>

seg-fd34d760edb1 = <b>VALIDATED</b> Helmert-datumkovariansen med sju parametere, med de to simulerte inngangsverdiene erstattet av målte: tidsplanen er bakkesendeepokene til { "337" } arkiverte ILRS-normalpunkter for månelaseravstandsmåling (2015-04-08 til 2015-06-27, Grasse MeO { "7" } Tester: <a1>lunar_llr_real_data.rs</a1>.

seg-49baab4910f3 = ppb

seg-a7d59ba6e225 = rad

seg-8db575fc6d82 = Kilde: <c1/>

seg-5329c6c75887 = <c1/> (scenariotype)

seg-25455a33523c = Helmert-datum for referansesystemet på månen med sju parametere, drevet av en VIRKELIG, ARKIVERT observasjonskampanje i stedet for en simulert. Der lunar-frame-campaign fjernet den injiserte transformasjonen, men fortsatt oppga stasjonsnettverket, tidsplanen og sigma per observasjon som ILLUSTRATIVE inngangsverdier, henter denne typen alle tre fra målinger: epokene er bakkesendetidene til arkiverte ILRS Consolidated Laser Ranging Data-normalpunkter, observasjonene er laseravstandene som faktisk ble skutt mot de fem retroreflektorarrayene på Månen, og hver observasjonsvekt er det normalpunktets egen arkiverte presisjon bin_rms/sqrt(n_raw), lest ut av filen. Stasjonskoordinatene kommer fra IERS ITRF2020 SLR-løsningen (propagert til epoken med sine publiserte hastigheter) og reflektorkoordinatene fra JPL DE430 tabell { "7" } i referansesystemet for gjennomsnittlig jord/gjennomsnittlig rotasjon som IAU { "2015" } WGCCRE-modellen realiserer. Avstandspartialer akkumuleres til den felles Fisher-informasjonsmatrisen for reflektorkoordinater og propageres gjennom det samme Helmert-designet til datumkovariansen, diagnostisert av crate::fim::crlb. Rang, defekt, kondisjon, spektrum, uobserverbare retninger i basisen med sju parametere, den svakeste retningen ved full rang og hver parameters andel av den gis ut ved hver kjøring, og en ubegrenset parameter publiseres som NULL med en status. Korrelasjon mellom arrayer er MEASURED til nøyaktig null i stedet for antatt, fordi en laseravstand berører ett array. En post katalogene ikke kan plassere — en stasjon uten publisert ITRF-posisjon — HOPPES OVER OG TELLES, aldri gitt en erstattet koordinat. HVILKE LINKER SOM ER MEASURED OG HVILKE SOM ER MODELLED ER RAPPORTEN, IKKE EN FOTNOTE: månesentrumsefemeriden og IAUs legemsorientering forblir modellert, og deres samlede størrelse gis ut som observert-minus-beregnet énveis avstandsresidual over hvert punkt som er brukt; troposfære, jordtidevann, stasjonseksentrisitet, polbevegelse, UT1-UTC, relativistisk forsinkelse og stasjonsklokker er fraværende og ligger inne i det residualet. Fordi en efemeridefeil bare når en kovarians gjennom retningen til hver siktlinje, løser hver kjøring også hele datumet på nytt med alle partialer vippet med sensitivity_tilt_deg (vekslende fortegn) og gir ut forholdet, så kovariansens ufølsomhet for den modellerte efemeriden er et tall i stedet for et argument. Den simulerte kampanjens egne verdier KJØRES og skrives ut ved siden av de målte, ikke avskrevet. MODELLED: verdiene for de sju parameterne er en Cramer-Rao-grense for et redusert parametersett på en virkelig tidsplan — ikke et løst datum, ikke en LLR-analyse og ikke et geodetisk produkt. Den innsjekkede skiven med virkelige data følger med repoet, men ikke med den publiserte craten; pek data_dir til en kopi av den.

seg-f4359803d67a = Én kjøring av <c1/> oppsummeres slik: lunar-llr-datum: { "337" } arkiverte normalpunkter ({ "349" } tolket) fra { "2" } stasjon(er) til { "5" } retroreflektorarrayer over { "80.9" } d; median målt presisjon for normalpunkter { "5.13" } mm énveis; informasjonsrang for reflektorer 15/15; Helmert-rang 7/7 cond { "2.399e4" }; datumtranslasjon-sigma { "1.851746e-2" } m; observert-minus-beregnet énveis residual-RMS { "156493.9" } m (de modellerte linkene, hovedsakelig den analytiske månefemeriden)

seg-7eda56c1285a = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>

seg-c95b4d285cbd = Eksempelet <c1/> setter blant annet:

seg-37a77f49f048 = ps

seg-b5c1e8681164 = Resultatetikett (motorens egen): Datum for referansesystemet på månen fra en VIRKELIG observasjonskampanje. Tidsplanen, antall observasjoner og hver observasjonsvekt kommer fra arkiverte ILRS-normalpunkter for månelaseravstandsmåling (målt); stasjonskoordinatene kommer fra IERS ITRF2020 og retroreflektorkoordinatene fra JPL DE430 tabell { "7" } (publisert

seg-e4da113cbe18 = Diagrammet motoren skriver for scenarios/lunar-llr-datum.toml, type lunar-llr-datum

seg-764e54be97a0 = <b>VALIDATED</b> Helmert-datumkovariansen med sju parametere for lunar-llr-datum fra arkiverte ILRS-normalpunkter og deres målte vekter, på kjerne-veien: det geosentriske månesentrumet leses fra JPL DE440 av motorens egen kjernelser (planetary_ker Tester: <a1>validate_llr_datum_kernel_moon.rs</a1>.

seg-cae262db0e46 = <b>VALIDATED</b> Helmert-datumkovariansen med sju parametere, med de to simulerte inngangsverdiene erstattet av målte: tidsplanen er bakkesendeepokene til { "337" } arkiv. Uavhengig referanse (ExternalDataset): Lukkede identiteter, en uavhengig vei i samme repo og, siden { "0.36" }, en uavhengig referanse fra SPICE- og NumPy-biblioteker på nye målte data (under); det finnes ikke noe publisert datumkovariansepar for månelaseravstandsmåling å kontrollere mot, så ingen nøyaktighet hevdes. Den eneste nye deriverte — avstandspartialen med hensyn til reflektorens legemsfaste posisjon — utledes på nytt ved sentral finite differanse av tovegs lysforsinkelsen den differ

seg-61ac3609406a = Datum for referansesystemet på månen fra en VIRKELIG observasjonskampanje. Tidsplanen, antall observasjoner og hver observasjonsvekt kommer fra arkiverte ILRS-normalpunkter for månelaseravstandsmåling (målt); stasjonskoordinatene kommer fra IERS ITRF2020 og retroreflektorkoordinatene fra JPL DE430 tabell { "7" } (publisert). Månesentrumsefemeriden, IAU { "2015" } WGCCRE-legemsorienteringen og fraværet av troposfære, tidevann, stasjonsekse (resultat <c1/>)

seg-97610a2cca73 = Korrelasjon mellom arrayer er MEASURED til nøyaktig null i stedet for antatt, fordi en laseravstand berører ett array. (typekatalog (<c1/>))

seg-64b1c08eeb11 = HVILKE LINKER SOM ER MEASURED OG HVILKE SOM ER MODELLED ER RAPPORTEN, IKKE EN FOTNOTE: månesentrumsefemeriden og IAUs legemsorientering forblir modellert, og deres samlede størrelse gis ut som observert-minus-beregnet énveis avstandsresidual over hvert punkt som er brukt; troposfære, jordtidevann, stasjonseksentrisitet, polbevegelse, UT1-UTC, relativistisk forsinkelse og stasjonsklokker er fraværende og ligger inne i det residualet. (typekatalog (<c1/>))

seg-d38710f3ce4a = MODELLED: verdiene for de sju parameterne er en Cramer-Rao-grense for et redusert parametersett på en virkelig tidsplan — ikke et løst datum, ikke en LLR-analyse og ikke et geodetisk produkt. (typekatalog (<c1/>))

seg-a19e2b1fcaf1 = epokene er bakkesendetidene til arkiverte ILRS Consolidated Laser Ranging Data-normalpunkter; * observasjonene er laseravstandene som faktisk ble skutt mot de fem retroreflektorarrayene på Månen; * hver observasjonsvekt er det normalpunktets EGEN arkiverte presisjon, bin_rms/sqrt(n_raw), lest ut av filen i stedet for antatt. (kommentar i scenariofilen, linje { "7" } til { "12" })

seg-5ed6b83c01da = HVILKE LINKER SOM ER MEASURED OG HVILKE SOM ER MODELLED ER RAPPORTEN, IKKE EN FOTNOTE. Månesentrumsefemeriden og IAUs legemsorientering forblir modellert, og deres samlede størrelse gis ut som observert-minus-beregnet énveis avstandsresidual over hvert punkt som er brukt; troposfære, jordtidevann, stasjonseksentrisitet, polbevegelse, UT1-UTC, relativistisk forsinkelse og stasjonsklokker er fraværende og ligger inne i det residualet. Beca (kommentar i scenariofilen, linje { "18" } til { "26" })

seg-7e7ff3ce4971 = Korrelasjon mellom arrayer er MEASURED til nøyaktig null i stedet for antatt, fordi en laseravstand berører ett array. En post katalogene ikke kan plassere — en stasjon uten publisert ITRF-posisjon — HOPPES OVER OG TELLES, aldri gitt en erstattet koordinat. Den simulerte kampanjens egne verdier KJØRES og skrives ut ved siden av de målte. (kommentar i scenariofilen, linje { "28" } til { "31" })

seg-8bfe258bedf5 = MODELLED: verdiene for de sju parameterne er en Cramer-Rao-grense for et redusert parametersett på en virkelig tidsplan. Ikke et løst datum, ikke en LLR-analyse, ikke et geodetisk produkt. (kommentar i scenariofilen, linje { "33" } til { "34" })

seg-598a7d6ba1e7 = <s1>Forrige</s1>lunar-joint-od-clock

seg-54b1c9200aae = <s1>Neste</s1>lunar-station-coverage

seg-2053999af5ef = <s1>Neste</s1>lunar-orbit-rendezvous
