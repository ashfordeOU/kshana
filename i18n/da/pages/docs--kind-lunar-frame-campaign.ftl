# docs--kind-lunar-frame-campaign: translations (da)

seg-1f17ef6a853e = Scenarietype i motoren v{ $version }, familie <a1>Måne og cislunart rum</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: README'ens afsnit Evidence).

seg-1c1eeb2dcaa0 = Familieside: <a1>Måne og cislunart rum</a1>

seg-3319b18ac61f = og { "1" } flere i matrixen.

seg-dd57b833cb20 = Kilde: <c1/>

seg-120769aba2cc = <c1/> (scenarietype)

seg-55679aff66db = Helmert-referencesystem (similaritet) med syv parametre, drevet af en SIMULERET OBSERVATIONSKAMPAGNE i stedet for en tilført transformation. Et net af jordstationer observerer et katalog af fyr på månens overflade efter en eksplicit plan; lunar-VLBI-delay-partialerne akkumuleres over planen til en Fisher-informationsmatrix for fyrenes koordinater, nøjagtigt som lunar-vlbi-fim gør; og denne information udbredes gennem Helmert-designet A = [I3 | [p]_x | p] i katalogpunkterne til datumkovariansen H = A^T M_b A, diagnosticeret af crate::fim::crlb. INGEN transformation tilføres, og intet gendannes fra et plantet svar, så den rapporterede datumnøjagtighed udspringer af observationsprogrammet: halveres delay-sigma, halveres den præcist, og en længere bue forbedrer den, fordi den libration, som rapporten MÅLER (sub_earth_direction_sweep_deg), er det, der adskiller fyrets koordinat i sigtelinjen fra koordinaterne i himmelplanet. Rang, datumdefekt, konditionstal, hele spektret, de uobserverbare retninger I DEN SYVPARAMETRIDE BASIS, den svageste retning selv ved fuld rang og hver parameters andel af den udsendes ved hver kørsel; en parameter, som kampagnen ikke begrænser, offentliggøres som NULL med en status, aldrig aflæst fra en næsten singulær invers. Korrelationen mellem fyrenes fejl er målt, ikke antaget: med stationerne holdt fast berører ingen observation to fyr, så informationsmatrixen er præcis blokdiagonal (offblock_fraction { "0" }), og med stationerne estimeret er den Schur-marginaliserede blok koblet, med den inducerede korrelation udskrevet og hele udbredelsen kørt igen uden den, så prisen for en uafhængighedsantagelse er et tal. Den samme udbredelse under en isotrop sigma pr. koordinat og den gendannelsesfejl, som scenariet lunar-frame-realisation rapporterer, køres begge her og udskrives ved siden af kampagneværdien med deres forhold. MODELLED: fyrkataloget har kilder, men KAMPAGNEN er simuleret — stationsnettet og delay-sigma er illustrative input, de enkelte delay-observationer behandles som uafhængige, og Måne-centrets efemeride, stationsure, troposfære og jordorienteringsparametre holdes FASTE, så datumkovariansen er en Cramer-Rao-grænse for et reduceret parametersæt. Ikke et geodætisk produkt.

seg-2e02c1ff8f48 = Én kørsel af <c1/> opsummeres som: lunar-frame-campaign | { "4" } beacons x { "3" } baselines x { "49" } epochs = { "64" } obs (delay sigma { "1.000e-11" } s) | station datum fixed | Helmert rank 7/7 cond { "3.798e5" } | datum translation sigma { "6.397500" } m vs injected-transform recovery error { "0.3125" } m (ratio { "0.049" })

seg-9c5feacf15ce = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>

seg-1d70a5b4a197 = Eksemplet <c1/> sætter blandt andet:

seg-df90e5910fb4 = hr

seg-d9523213de9f = Resultatmærkat (motorens egen): MODELLED kampagnedrevet lunart referencesystem. Helmert-kovariansen med syv parametre udbredes fra en informationsmatrix for fyrenes koordinater, akkumuleret fra motorens egne lunar-VLBI-delay-partialer over en eksplicit plan af fyr, baselines og epoker; INGEN similaritetstransformation tilføres og

seg-883d94b321b4 = Diagrammet, som motoren skriver for scenarios/lunar-frame-campaign.toml, type lunar-frame-campaign

seg-fbac1cbb2422 = MODELLED { "2" } · VALIDATED { "3" }: rækkerne i <a1>verifikationsmatrixen</a1>, som nævner denne type.

seg-2595bd629ffb = <b>MODELLED</b> Helmert-referencesystemet med syv parametre udbredt fra en SIMULERET OBSERVATIONSKAMPAGNE i stedet for gendannet fra en tilført transformation.

seg-fd34d760edb1 = <b>VALIDATED</b> Kovariansen for Helmert-referencesystemet med syv parametre, hvor de to simulerede input er erstattet af målte: planen er jordsendingsepokerne for { "337" } arkiverede ILRS-normalpunkter fra månelaserafstandsmåling (2015-04-08 til 2015-06-27, Grasse MeO { "7" } Tests: <a1>lunar_llr_real_data.rs</a1>.

seg-055864084843 = <b>MODELLED</b> De valgfrie input extra_reflectors og extra_beacons i scenariet lunar-llr-datum tilføjer en blok station_geodesy: Helmert-informationen med fem arrays fra det arkiverede udsnit af månelaserafstandsmåling plus den information, en tilføjet retroreflektor (ran Tests: <a1>lunar_station_geodesy.rs</a1>.

seg-23bd763c32d8 = <b>VALIDATED</b> Kovariansen for Helmert-referencesystemet med syv parametre i scenariet lunar-frame-campaign med jordstationerne estimeret (station { "1" } forankret), som lunar_frame_campaign beregner den i binary64: den fælles Fisher-information for station og fyr akkum Tests: <a1>lunar_frame_campaign_mpmath_oracle.rs</a1>.

seg-49f323360dc3 = <b>VALIDATED</b> Tilpasning af Helmert-referencesystem med 7 parametre + ICRF-orienteringsforbindelse ud fra et net af punkter. Uafhængig reference (ExternalDataset): Uafhængig vægtet Umeyama-løser (Horn) for similaritetstransformation i lukket form (numpy/scipy, SVD-baseret; Umeyama { "1991" } IEEE TPAMI, Horn { "1987" } JOSA A) — en anden algoritme end kshanas iterative Gauss–Newton-tilpasning, der når samme entydigt definerede vægtede LS-optimum på byte-identiske punktnet

seg-d024abcfd87c = <b>MODELLED</b> Helmert-referencesystemet med syv parametre udbredt fra en SIMULERET OBSERVATIONSKAMPAGNE i stedet for gendannet fra en tilført transformation. Jordstationer observerer en sourc. Uafhængig reference (ReferenceImpl): Identiteter i lukket form og en uafhængig vej i selve repositoriet, uden at nogen ekstern uafhængig reference gøres gældende. Helmert-designet — den eneste nye afledede i modulet — udledes igen ved central differenskvotient af lunar_frame_realise::apply_helmert, en vej, der ikke deler noget udtryk med den analytiske form. Den akkumulering, den sammensætter, er lunar-vlbi-fim's, hvis Jacobi-matrix differenskvotientberegnes mod lunar_vlbi::vlbi_delay_s dér, og som

seg-0abd7b181f21 = MODELLED kampagnedrevet lunart referencesystem. Helmert-kovariansen med syv parametre udbredes fra en informationsmatrix for fyrenes koordinater, akkumuleret fra motorens egne lunar-VLBI-delay-partialer over en eksplicit plan af fyr, baselines og epoker; INGEN similaritetstransformation tilføres, og intet gendannes fra et plantet svar. Fyrkataloget er cratens tabel over navngivne steder med kilder, men KAMPA (resultat <c1/>)

seg-f92d22c06cd5 = Korrelationen mellem fyrenes fejl er målt, ikke antaget: med stationerne holdt fast berører ingen observation to fyr, så informationsmatrixen er præcis blokdiagonal (offblock_fraction { "0" }), og med stationerne estimeret er den Schur-marginaliserede blok koblet, med den inducerede korrelation udskrevet og hele udbredelsen kørt igen uden den, så prisen for en uafhængighedsantagelse er et tal. (kategori-katalog (<c1/>))

seg-534cea416496 = MODELLED: fyrkataloget har kilder, men KAMPAGNEN er simuleret — stationsnettet og delay-sigma er illustrative input, de enkelte delay-observationer behandles som uafhængige, og Måne-centrets efemeride, stationsure, troposfære og jordorienteringsparametre holdes FASTE, så datumkovariansen er en Cramer-Rao-grænse for et reduceret parametersæt. (kategori-katalog (<c1/>))

seg-ec67b9d3adbb = Korrelationen mellem fyrenes fejl er MÅLT, ikke antaget. Med stationerne holdt fast berører ingen observation to fyr, så informationsmatrixen er præcis blokdiagonal (offblock_fraction { "0" }); med stationerne estimeret er den Schur-marginaliserede blok koblet, den inducerede korrelation udskrives, og hele udbredelsen køres igen uden den, så prisen for en uafhængighedsantagelse er et tal frem for en c (kommentar i scenariefilen, linje { "17" } til { "21" })

seg-a2bb557da7ba = MODELLED: fyrkataloget har kilder, men KAMPAGNEN er simuleret — stationsnettet og delay-sigma er illustrative input, de enkelte delay-observationer behandles som uafhængige, og Måne-centrets efemeride, stationsure, troposfære og jordorienteringsparametre holdes FASTE. Ikke et geodætisk produkt. (kommentar i scenariefilen, linje { "27" } til { "30" })

seg-57a371bca2c7 = Lunart referencesystem ud fra en observationskampagne er MODELLED, ikke valideret: kontrolleret mod en separat implementering i selve denne kodebase — uafhængig af enheden under test, men ikke eksternt autoritativ. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-7b56c979b2c9 = <s1>Forrige</s1>lunar-differential-pnt

seg-70072dbfa305 = <s1>Næste</s1>lunar-frame-realisation
