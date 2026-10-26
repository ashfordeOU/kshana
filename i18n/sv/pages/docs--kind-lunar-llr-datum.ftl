# docs--kind-lunar-llr-datum: translations (sv)

seg-3068552e4ab4 = VALIDATED: raderna i <a1>verifieringsmatrisen</a1> som nämner den här typen.

seg-1f17ef6a853e = Scenariotyp i motor v{ $version }, familj <a1>Måne och cislunart</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-1c1eeb2dcaa0 = Familjesida: <a1>Måne och cislunart</a1>

seg-3bc1761c76ab = { "3" } medföljande scenarier använder den här typen; de övriga finns i <a1><c1/></a1>.

seg-8f8871ac8a0f = Ämnessida: <a1>LUNAR-REFERENCE-STATION.md</a1>

seg-fd34d760edb1 = <b>VALIDATED</b> Datumkovariansen för Helmert med sju parametrar, där de två simulerade indata ersatts av uppmätta: schemat är sändningsepokerna från marken för { "337" } arkiverade normalpunkter för ILRS lunar laseravståndsmätning (2015-04-08 till 2015-06-27, Grasse MeO { "7" } Tester: <a1>lunar_llr_real_data.rs</a1>.

seg-49baab4910f3 = ppb

seg-a7d59ba6e225 = rad

seg-8db575fc6d82 = Källa: <c1/>

seg-5329c6c75887 = <c1/> (scenariotyp)

seg-25455a33523c = Lunart referenssystemsdatum med Helmert med sju parametrar, drivet av en VERKLIG, ARKIVERAD observationskampanj i stället för en simulerad. Där lunar-frame-campaign tog bort den injicerade transformationen men ändå angav sitt stationsnätverk, sitt schema och sitt sigma per observation som ILLUSTRATIVE indata, hämtar den här typen alla tre från mätning: epokerna är sändningstiderna från marken för arkiverade normalpunkter i ILRS Consolidated Laser Ranging Data, observationerna är de laseravstånd som verkligen avfyrats mot de fem retroreflektorfälten på månen, och varje observationsvikt är den normalpunktens egen arkiverade precision bin_rms/sqrt(n_raw) utläst ur filen. Stationskoordinaterna kommer från IERS ITRF2020 SLR-lösning (propagerade till epoken med sina publicerade hastigheter) och reflektorkoordinaterna från JPL DE430 tabell { "7" } i det medeljordsfasta/medelrotationsreferenssystem som IAU { "2015" } WGCCRE-modellen realiserar. Avståndspartialerna ackumuleras till den gemensamma Fisher-informationsmatrisen för reflektorkoordinaterna och propageras genom samma Helmert-design till datumkovariansen, diagnostiserad av crate::fim::crlb. Rang, defekt, konditionstal, spektrum, oobserverbara riktningar i sjuparameterbasen, den svagaste riktningen vid full rang och varje parameters andel av den redovisas vid varje körning, och en obegränsad parameter publiceras som NULL med en status. Korrelationen mellan fält är MÄTT till exakt noll i stället för antagen, eftersom ett laseravstånd rör ett fält. En post som katalogerna inte kan placera — en station utan publicerad ITRF-position — HOPPAS ÖVER OCH RÄKNAS, och får aldrig en ersatt koordinat. VILKA LÄNKAR SOM ÄR MÄTTA OCH VILKA SOM ÄR MODELLED ÄR SJÄLVA RAPPORTEN, INTE EN FOTNOT: månens centrumefemerid och IAU:s kroppsorientering förblir modellerade och deras sammanlagda storlek skickas ut som residualen observerat minus beräknat för enkelriktat avstånd över varje använd punkt; troposfär, fasta jordtidvatten, stationsexcentricitet, polarrörelse, UT1-UTC, relativistisk fördröjning och stationsklockor saknas och ryms i den residualen. Eftersom ett efemerisfel når en kovarians enbart genom riktningen på varje siktlinje löser varje körning också hela datumet på nytt med alla partialer lutade med sensitivity_tilt_deg (med växlande tecken) och skickar ut kvoten, så att kovariansens okänslighet för den modellerade efemeriden är ett tal i stället för ett argument. Den simulerade kampanjens egna värden KÖRS och skrivs ut bredvid de uppmätta, inte avskrivna. MODELLED: värdena för de sju parametrarna är en Cramer-Rao-gräns för en reducerad parameteruppsättning på ett verkligt schema — inte ett löst datum, inte en LLR-analys och inte en geodetisk produkt. Den incheckade skivan med verkliga data levereras med repot men inte med den publicerade craten; peka data_dir mot en kopia av den.

seg-f4359803d67a = En körning av <c1/> sammanfattas som: lunar-llr-datum: { "337" } arkiverade normalpunkter ({ "349" } tolkade) från { "2" } station(er) till { "5" } retroreflektorfält under { "80.9" } d; median för uppmätt normalpunktsprecision { "5.13" } mm enkelriktat; informationsrang för reflektorer 15/15; Helmert-rang 7/7 kond { "2.399e4" }; datumtranslationens sigma { "1.851746e-2" } m; RMS för residualen observerat minus beräknat för enkelriktat avstånd { "156493.9" } m (de modellerade länkarna, främst den analytiska lunara efemeriden)

seg-7eda56c1285a = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>

seg-c95b4d285cbd = Exemplet <c1/> anger bland annat:

seg-37a77f49f048 = ps

seg-b5c1e8681164 = Resultatetikett (motorns egen): Lunart referenssystemsdatum från en VERKLIG observationskampanj. Schemat, antalet observationer och varje observationsvikt kommer från arkiverade normalpunkter för ILRS lunar laseravståndsmätning (uppmätta); stationskoordinaterna kommer från IERS ITRF2020 och retroreflektorkoordinaterna från JPL DE430 tabell { "7" } (publishe

seg-e4da113cbe18 = Diagrammet som motorn skriver för scenarios/lunar-llr-datum.toml, typ lunar-llr-datum

seg-764e54be97a0 = <b>VALIDATED</b> Datumkovariansen för lunar-llr-datum med Helmert med sju parametrar från arkiverade normalpunkter i ILRS och deras uppmätta vikter, på kernelvägen: det geocentriska månens centrum läses ur JPL DE440 av motorns egen kernelläsare (planetary_ker Tester: <a1>validate_llr_datum_kernel_moon.rs</a1>.

seg-cae262db0e46 = <b>VALIDATED</b> Datumkovariansen för Helmert med sju parametrar, där de två simulerade indata ersatts av uppmätta: schemat är sändningsepokerna från marken för { "337" } arkiv. Oberoende referens (ExternalDataset): Slutna identiteter, en oberoende väg i samma repo och, sedan { "0.36" }, en oberoende SPICE- och NumPy-biblioteksreferens på nya uppmätta data (nedan); inget publicerat par av lunar LLR-datumkovarians finns att kontrollera mot, så ingen noggrannhet görs gällande. Den enda nya derivatan — avståndspartialen med avseende på reflektorns kroppsfasta position — härleds på nytt med central finit differens av den tvåvägs ljustid som den differ

seg-61ac3609406a = Lunart referenssystemsdatum från en VERKLIG observationskampanj. Schemat, antalet observationer och varje observationsvikt kommer från arkiverade normalpunkter för ILRS lunar laseravståndsmätning (uppmätta); stationskoordinaterna kommer från IERS ITRF2020 och retroreflektorkoordinaterna från JPL DE430 tabell { "7" } (publicerade). Månens centrumefemerid, kroppsorienteringen enligt IAU { "2015" } WGCCRE och avsaknaden av troposfär, tidvatten, stationsexcentricitet (resultat <c1/>)

seg-97610a2cca73 = Korrelationen mellan fält är MÄTT till exakt noll i stället för antagen, eftersom ett laseravstånd rör ett fält. (typkatalog (<c1/>))

seg-64b1c08eeb11 = VILKA LÄNKAR SOM ÄR MÄTTA OCH VILKA SOM ÄR MODELLED ÄR SJÄLVA RAPPORTEN, INTE EN FOTNOT: månens centrumefemerid och IAU:s kroppsorientering förblir modellerade och deras sammanlagda storlek skickas ut som residualen observerat minus beräknat för enkelriktat avstånd över varje använd punkt; troposfär, fasta jordtidvatten, stationsexcentricitet, polarrörelse, UT1-UTC, relativistisk fördröjning och stationsklockor saknas och ryms i den residualen. (typkatalog (<c1/>))

seg-d38710f3ce4a = MODELLED: värdena för de sju parametrarna är en Cramer-Rao-gräns för en reducerad parameteruppsättning på ett verkligt schema — inte ett löst datum, inte en LLR-analys och inte en geodetisk produkt. (typkatalog (<c1/>))

seg-a19e2b1fcaf1 = epokerna är sändningstiderna från marken för arkiverade normalpunkter i ILRS Consolidated Laser Ranging Data; * observationerna är de laseravstånd som verkligen avfyrats mot de fem retroreflektorfälten på månen; * varje observationsvikt är den normalpunktens EGEN arkiverade precision, bin_rms/sqrt(n_raw), utläst ur filen i stället för antagen. (kommentar i scenariofilen, rad { "7" } till { "12" })

seg-5ed6b83c01da = VILKA LÄNKAR SOM ÄR MÄTTA OCH VILKA SOM ÄR MODELLED ÄR SJÄLVA RAPPORTEN, INTE EN FOTNOT. Månens centrumefemerid och IAU:s kroppsorientering förblir modellerade, och deras sammanlagda storlek skickas ut som residualen observerat minus beräknat för enkelriktat avstånd över varje använd punkt; troposfär, fasta jordtidvatten, stationsexcentricitet, polarrörelse, UT1-UTC, relativistisk fördröjning och stationsklockor saknas och ryms i den residualen. Beca (kommentar i scenariofilen, rad { "18" } till { "26" })

seg-7e7ff3ce4971 = Korrelationen mellan fält är MÄTT till exakt noll i stället för antagen, eftersom ett laseravstånd rör ett fält. En post som katalogerna inte kan placera — en station utan publicerad ITRF-position — HOPPAS ÖVER OCH RÄKNAS, och får aldrig en ersatt koordinat. Den simulerade kampanjens egna värden KÖRS och skrivs ut bredvid de uppmätta. (kommentar i scenariofilen, rad { "28" } till { "31" })

seg-8bfe258bedf5 = MODELLED: värdena för de sju parametrarna är en Cramer-Rao-gräns för en reducerad parameteruppsättning på ett verkligt schema. Inte ett löst datum, inte en LLR-analys, inte en geodetisk produkt. (kommentar i scenariofilen, rad { "33" } till { "34" })

seg-598a7d6ba1e7 = <s1>Föregående</s1>lunar-joint-od-clock

seg-54b1c9200aae = <s1>Nästa</s1>lunar-station-coverage
