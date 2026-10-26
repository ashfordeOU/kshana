# docs--kind-lunar-frame-campaign: translations (nb)

seg-1f17ef6a853e = Scenariotype i motoren v{ $version }, familie <a1>Måne og cislunart rom</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en sikkerhetskritisk tjeneste for menneskeliv. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett fortjenes: Evidens-avsnittet i README).

seg-1c1eeb2dcaa0 = Familieside: <a1>Måne og cislunart rom</a1>

seg-dd57b833cb20 = Kilde: <c1/>

seg-120769aba2cc = <c1/> (scenariotype)

seg-55679aff66db = Syvparameters Helmert-datum (likhetstransformasjon) for referansesystemet, drevet av en SIMULERT OBSERVASJONSKAMPANJE i stedet for av en injisert transformasjon. Et nettverk av jordstasjoner observerer en katalog av baker på månens overflate etter en eksplisitt tidsplan; delay-partialene til lunar VLBI akkumuleres over den tidsplanen til en Fisher-informasjonsmatrise for bakekoordinatene, nøyaktig slik lunar-vlbi-fim gjør; og den informasjonen propageres gjennom Helmert-designet A = [I3 | [p]_x | p] ved katalogpunktene til datumkovariansen H = A^T M_b A, diagnostisert av crate::fim::crlb. INGEN transformasjon injiseres og ingenting gjenfinnes fra et plantet svar, så den rapporterte datumnøyaktigheten avledes fra observasjonsprogrammet: å halvere delay-sigma halverer den nøyaktig, og å forlenge buen forbedrer den fordi librasjonen rapporten MÅLER (sub_earth_direction_sweep_deg) er det som skiller bakekoordinaten langs siktlinjen fra de i himmelplanet. Rang, datumdefekt, kondisjonstall, hele spekteret, de uobserverbare retningene I DET SYVPARAMETERS BASISET, den svakeste retningen selv ved full rang og hver parameters andel av den gis ut ved hver kjøring; en parameter kampanjen ikke begrenser, publiseres som NULL med en status, aldri lest ut av en nesten singulær invers. Feilkorrelasjon mellom baker er målt, ikke antatt: med stasjonene holdt fast berører ingen observasjon to baker, så informasjonsmatrisen er nøyaktig blokkdiagonal (offblock_fraction { "0" }), og med stasjonene estimert er den Schur-marginaliserte blokken koblet, med den induserte korrelasjonen skrevet ut og hele propageringen kjørt på nytt med den forkastet, slik at prisen for en uavhengighetsantakelse er et tall. Den samme propageringen under en isotrop sigma per koordinat, og gjenfinningsfeilen scenarioet lunar-frame-realisation rapporterer, kjøres begge her og skrives ut ved siden av kampanjeverdien med forholdstallene deres. MODELLED: bakekatalogen har kilder, men KAMPANJEN er simulert; stasjonsnettverket og delay-sigma er illustrative inngangsverdier, de enkelte delay-observasjonene behandles som uavhengige, og månesentrumsefemeriden, stasjonsklokkene, troposfæren og jordorienteringsparameterne holdes FASTE, så datumkovariansen er en Cramer-Rao-grense for et redusert parametersett. Ikke et geodetisk produkt.

seg-2e02c1ff8f48 = Én kjøring av <c1/> oppsummeres slik: lunar-frame-campaign | { "4" } baker x { "3" } grunnlinjer x { "49" } epoker = { "64" } obs (delay-sigma { "1.000e-11" } s) | stasjonsdatum fast | Helmert-rang 7/7 cond { "3.798e5" } | datumtranslasjon-sigma { "6.397500" } m mot gjenfinningsfeil for injisert transformasjon { "0.3125" } m (forhold { "0.049" })

seg-9c5feacf15ce = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>

seg-1d70a5b4a197 = Eksempelet <c1/> setter blant annet:

seg-df90e5910fb4 = hr

seg-d9523213de9f = Resultatetikett (motorens egen): MODELLED kampanjedrevet datum for referansesystemet på månen. Helmert-kovariansen med sju parametere propageres fra en informasjonsmatrise for bakekoordinater, akkumulert fra motorens egne lunar-VLBI-delay-partialer over en eksplisitt tidsplan av baker, grunnlinjer og epoker; INGEN likhetstransformasjon injiseres og

seg-883d94b321b4 = Diagrammet motoren skriver for scenarios/lunar-frame-campaign.toml, type lunar-frame-campaign

seg-fbac1cbb2422 = MODELLED { "2" } · VALIDATED { "3" }: radene i <a1>verifikasjonsmatrisen</a1> som nevner denne typen.

seg-2595bd629ffb = <b>MODELLED</b> Helmert-datumet med sju parametere propagert fra en SIMULERT OBSERVASJONSKAMPANJE i stedet for gjenfunnet fra en injisert transformasjon.

seg-fd34d760edb1 = <b>VALIDATED</b> Helmert-datumkovariansen med sju parametere, med de to simulerte inngangsverdiene erstattet av målte: tidsplanen er bakkesendeepokene til { "337" } arkiverte ILRS-normalpunkter for månelaseravstandsmåling (2015-04-08 til 2015-06-27, Grasse MeO { "7" } Tester: <a1>lunar_llr_real_data.rs</a1>.

seg-055864084843 = <b>MODELLED</b> De valgfrie inngangsverdiene extra_reflectors og extra_beacons i scenarioet lunar-llr-datum legger til en station_geodesy-blokk: Helmert-informasjonen med fem matriser fra den arkiverte skiven av månelaseravstandsmåling pluss informasjonen en lagt til retroreflektor (ran Tester: <a1>lunar_station_geodesy.rs</a1>.

seg-23bd763c32d8 = <b>VALIDATED</b> Helmert-datumkovariansen med sju parametere for scenarioet lunar-frame-campaign med jordstasjonene estimert (stasjon { "1" } forankret), slik lunar_frame_campaign beregner den i binary64: den felles Fisher-informasjonen for stasjoner og baker akkum Tester: <a1>lunar_frame_campaign_mpmath_oracle.rs</a1>.

seg-49f323360dc3 = <b>VALIDATED</b> Helmert-datumtilpasning med 7 parametere + ICRF-orienteringsbinding fra et nettverk av punkter. Uavhengig referanse (ExternalDataset): Uavhengig lukket vektet Umeyama-løser (Horn) for likhetstransformasjon (numpy/scipy, SVD-basert; Umeyama { "1991" } IEEE TPAMI, Horn { "1987" } JOSA A): en annen algoritme enn kshanas iterative Gauss–Newton-tilpasning, som når samme entydig definerte vektede minste kvadraters optimum på byte-identiske punktnettverk

seg-d024abcfd87c = <b>MODELLED</b> Helmert-datumet med sju parametere propagert fra en SIMULERT OBSERVASJONSKAMPANJE i stedet for gjenfunnet fra en injisert transformasjon. Jordstasjoner observerer en kilde. Uavhengig referanse (ReferenceImpl): Lukkede identiteter og en uavhengig vei i samme repo, uten at noen ekstern uavhengig referanse hevdes. Helmert-designet, den eneste nye deriverte i modulen, utledes på nytt ved sentral finite differanse av lunar_frame_realise::apply_helmert, en vei som ikke deler noe uttrykk med den analytiske formen. Akkumuleringen den setter sammen er den til lunar-vlbi-fim, hvis Jacobi-matrise er differensiert med finite differanser mot lunar_vlbi::vlbi_delay_s der, og som

seg-0abd7b181f21 = MODELLED kampanjedrevet datum for referansesystemet på månen. Helmert-kovariansen med sju parametere propageres fra en informasjonsmatrise for bakekoordinater, akkumulert fra motorens egne lunar-VLBI-delay-partialer over en eksplisitt tidsplan av baker, grunnlinjer og epoker; INGEN likhetstransformasjon injiseres og ingenting gjenfinnes fra et plantet svar. Bakekatalogen er cratens kildebelagte tabell med navngitte steder, men KAMPA (resultat <c1/>)

seg-f92d22c06cd5 = Feilkorrelasjon mellom baker er målt, ikke antatt: med stasjonene holdt fast berører ingen observasjon to baker, så informasjonsmatrisen er nøyaktig blokkdiagonal (offblock_fraction { "0" }), og med stasjonene estimert er den Schur-marginaliserte blokken koblet, med den induserte korrelasjonen skrevet ut og hele propageringen kjørt på nytt med den forkastet, slik at prisen for en uavhengighetsantakelse er et tall. (typekatalog (<c1/>))

seg-534cea416496 = MODELLED: bakekatalogen har kilder, men KAMPANJEN er simulert; stasjonsnettverket og delay-sigma er illustrative inngangsverdier, de enkelte delay-observasjonene behandles som uavhengige, og månesentrumsefemeriden, stasjonsklokkene, troposfæren og jordorienteringsparameterne holdes FASTE, så datumkovariansen er en Cramer-Rao-grense for et redusert parametersett. (typekatalog (<c1/>))

seg-ec67b9d3adbb = Feilkorrelasjon mellom baker er MÅLT, ikke antatt. Med stasjonene holdt fast berører ingen observasjon to baker, så informasjonsmatrisen er nøyaktig blokkdiagonal (offblock_fraction { "0" }); med stasjonene estimert er den Schur-marginaliserte blokken koblet, den induserte korrelasjonen skrives ut, og hele propageringen kjøres på nytt med den forkastet, slik at prisen for en uavhengighetsantakelse er et tall i stedet for en c (kommentar i scenariofilen, linje { "17" } til { "21" })

seg-a2bb557da7ba = MODELLED: bakekatalogen har kilder, men KAMPANJEN er simulert; stasjonsnettverket og delay-sigma er illustrative inngangsverdier, de enkelte delay-observasjonene behandles som uavhengige, og månesentrumsefemeriden, stasjonsklokkene, troposfæren og jordorienteringsparameterne holdes FASTE. Ikke et geodetisk produkt. (kommentar i scenariofilen, linje { "27" } til { "30" })

seg-57a371bca2c7 = Datum for referansesystemet på månen fra en observasjonskampanje er MODELLED, ikke validert: kontrollert mot en separat implementasjon i samme kodebase, uavhengig av enheten som testes, men ikke eksternt autoritativ. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-7b56c979b2c9 = <s1>Forrige</s1>lunar-differential-pnt

seg-70072dbfa305 = <s1>Neste</s1>lunar-frame-realisation
