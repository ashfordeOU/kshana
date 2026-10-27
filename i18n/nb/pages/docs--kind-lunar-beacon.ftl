# docs--kind-lunar-beacon: translations (nb)

seg-1f17ef6a853e = Scenariotype i motoren v{ $version }, familie <a1>Måne og cislunart rom</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en sikkerhetskritisk tjeneste for menneskeliv. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett fortjenes: Evidens-avsnittet i README).

seg-1c1eeb2dcaa0 = Familieside: <a1>Måne og cislunart rom</a1>

seg-3c4e3d725bb6 = Kilde: <c1/>

seg-5e402fc935cb = <c1/> (scenariotype)

seg-142ad48fe422 = Forsterkning med overflatebaker av en orbital navigasjonstjeneste på månen, som en kjørbar før/etter-tabell. En bruker ved sørpolen ser et tynt orbitalt sett i et smalt himmelfelt, så avstandsgeometrien er dårlig betinget; noen få OPPMÅLTE OVERFLATEBAKER gir de siktlinjeradene med lav elevasjon og bred asimut som et sett som bare står over hodet mangler, og den horisontale presisjonsfortynningen kollapser. Scenarioet rapporterer tre konfigurasjoner ved én epoke: bare satellitter, satellitter pluss de synlige bakene, og en større konstellasjon som alternativ vei til samme geometri. Hver har sine antall synlige kilder, sin fulle DOP og den realiserte 1-sigma-nøyaktigheten i METER, oppnådd ved å multiplisere med en brukerekvivalent avstandsfeil per bake, satt sammen som kvadratroten av summen av kvadratene til klokkesynkroniserings-, flerveis- og oppmålingsledd. Synligheten til bakene er den geometriske horisonten med to høyder for Månen uten atmosfære (ingen atmosfære, så grensen er eksakt), og DOP-oppsettet er den samme kjernen som er kryssjekket mot gnss_lib_py i tests/dop_reference.rs. HVORFOR DENNE TYPEN FINNES: modulen bak den har vært i motoren og kontrollert mot en uavhengig DOP-vei siden L08/L09, men den kunne ikke nås fra en kjøring: ingen type, ingen dispatch-gren, ingen medfølgende fil. README-en omtalte funksjonen, og verifikasjonsmatrisen hadde INGEN rad for den i det hele tatt, så den var samtidig hevdet i prosa og ikke hevdet i registeret, mens den var utilgjengelig i motoren. Standardverdiene er geometrien som allerede har en innsjekket golden-fil (en bruker ved -80 deg med en antenne på { "2" } m, tre baker ved -80/0, -79/+{ "60" } og -79/-60 på { "2" } km, et illustrativt LCNS-øyeblikksbilde med seks satellitter ved t={ "0" }, en maske på { "5" } deg), slik at en rå kjøring gjengir en tabell som en uavhengig referanse allerede dekker, i stedet for å finne på nye tall. MODELLED: konstellasjonsutformingen, plasseringen av bakene og hver størrelse i feilbudsjettet er illustrative inngangsverdier, ikke en operativ oppmåling eller en målt link; bare DOP-aritmetikken, den lukkede formen for horisonten og relasjonen sigma = DOP x sigma_URE er forankret eksternt. Ikke et løfte om tjenesteytelse.

seg-22ea11fcf367 = Én kjøring av <c1/> oppsummeres slik: Forsterkning med overflatebaker på månen — maske { "5.0" } deg, epoke +{ "0" } s, sigma_URE per bake { "1.1576" } m { "6" } satellitter, ingen baker sats { "5" } beacons { "0" } GDOP { "11.6627" } PDOP { "9.6941" } HDOP { "3.4868" } VDOP { "9.0454" } TDOP { "6.4840" } realisert 1-sigma: 3D { "11.222" } m H { "4.036" } m V { "10.471" } m { "6" } satellitter + { "1" } synlige baker sats { "5" } beacons { "1" } GDOP { "4.9979" } PDOP { "4.1160" } HDOP { "1.9721" } VDOP { "3.6128" } TDOP { "2.8350" } realisert 1-sigma: 3D { "4.765" } m H { "2.283" } m V { "4.182" } m { "24" } satellitter, ingen baker sats { "19" } beacons { "0" } GDOP { "2.8929" } PDOP { "2.4226" } HDOP { "1.0199" } VDOP { "2.1974" } TDOP { "1.5811" } realisert 1-sigma: 3D { "2.804" } m H { "1.181" } m V { "2.544" } m bakene forbedrer PDOP med 2.355x; en større konstellasjon i stedet, 4.002x MODELLED: konstellasjonen, plasseringen av bakene og feilbudsjettet er illustrative inngangsverdier. DOP-kjernen under er den som er validert mot gnss_lib_py, og bakehorisonten er den lukkede formen fra L01.

seg-25522022cf9a = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>

seg-acfef3f325e4 = Eksempelet <c1/> setter blant annet:

seg-a53e353706f6 = Diagrammet motoren skriver for scenarios/lunar-beacon.toml, type lunar-beacon

seg-89e2f6bb2540 = <b>MODELLED</b> Bakeforsterket presisjonsfortynning for en bruker på månens overflate: siktlinjeradene til de synlige satellittene og avstandsradene til de synlige overflatebakene settes sammen til én designmatrise og evalueres gjennom den felles DOP-kjernen, og t Tester: <a1>validate_p2_beacon_before_after_table.rs</a1>.

seg-654a3554b1e3 = <b>MODELLED</b> Bakeforsterket presisjonsfortynning for en bruker på månens overflate: siktlinjeradene til de synlige satellittene og avstandsradene til de synlige overflatebakene er sammenslått. Uavhengig referanse (ReferenceImpl): DOP-aritmetikken er kjernen crate::orbit::dop, som er validert separat og eksternt mot gnss_lib_py i tests/dop_reference.rs; denne raden låner ikke den radens status på nytt. Bakenes synlighetshorisont er den lukkede formen fra L01, og sigma = DOP x sigma_URE er den vanlige GNSS-relasjonen (Kaplan og Hegarty, Understanding GPS/GNSS, avsnitt { "7" }). Innenfor denne raden kontrolleres selve forsterkningen mot en uavhengig

seg-4d1fc06e907b = MODELLED: konstellasjonsutformingen, plasseringen av bakene og hver størrelse i feilbudsjettet er illustrative inngangsverdier, ikke en operativ oppmåling eller en målt link; bare DOP-aritmetikken, den lukkede formen for horisonten og relasjonen sigma = DOP x sigma_URE er forankret eksternt. (typekatalog (<c1/>))

seg-aaafed663400 = HVA SOM ER FORANKRET OG HVA SOM IKKE ER Forankret: DOP-oppsettet er kjernen som er kryssjekket mot gnss_lib_py i tests/dop_reference.rs; bakesynlighet er den lukkede formen for den geometriske horisonten med to høyder for Månen uten atmosfære (ingen atmosfære, så det finnes ingen refraktiv utvidelse og grensen er eksakt); og sigma = DOP x sigma_URE er den vanlige relasjonen (Kaplan & Hegarty, Understanding GPS/GNSS, avsnitt { "7" }). IKKE forankret — MODELL (kommentar i scenariofilen, linje { "40" } til { "49" })

seg-2516c4208769 = DOP-forsterkning med overflatebaker på månen er MODELLED, ikke validert: kontrollert mot en separat implementasjon i samme kodebase, uavhengig av enheten som testes, men ikke eksternt autoritativ. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-ebb9724de60a = <s1>Forrige</s1>lunar-attack-surface

seg-ca9b68783354 = <s1>Neste</s1>lunar-differential-pnt
