# docs--maritime-trust: translations (nb)

seg-6940543aa3c0 = streng

seg-abec93a4a488 = streng eller null

seg-f5e7215e6835 = objekt

seg-b993ef559bd0 = Fra kode

seg-c353e7bec219 = Nøkkel

seg-0da78c80fb76 = <c1/>, <c2/>, <c3/> eller <c4/>

seg-2896f449bffb = Kilde: <c1/>

seg-342f34403ac5 = Maritim tillit: kan broen stole på denne posisjonsbestemmelsen?

seg-49b609a9655c = <c1/> kan, for et <b>fartøy i bevegelse</b>, score et løpende tillitstall fra 0 til 100 for hver posisjonsbestemmelse, ut fra det enhver mottaker allerede legger på bussen (NMEA { "0183" } først), og si hvilke kontroller som reduserte det. Det er et programvarelag som sitter ved siden av en mottaker. Det er ikke en mottaker, det erstatter ikke en, og det gjør ikke en posisjonsbestemmelse mer nøyaktig.

seg-3c66739c9250 = <b>Veiledende programvare.</b> Kshana er ikke typegodkjent navigasjonsutstyr (IEC { "61108" }, IEC { "61162" }) og er ikke vurdert mot noen ytelsesstandard. Scoren og gaten er hjelpemidler for navigatørens skjønn. Operatøren er fortsatt ansvarlig for fartøyets sikre navigasjon og for enhver beslutning om å stole på, eller slutte å stole på, en posisjonsbestemmelse.

seg-a9899ca66661 = Denne siden sier hva kontrollene ser på, hva hver av dem kan og ikke kan fange opp, hvordan den kjøres løpende og hva gaten gjør. Scoreavbildningen og hver standardverdi står i <a1><c1/></a1>.

seg-05e79b6c5a58 = Hva den leser

seg-e784fdbe26e6 = Et fartøy deklareres i sesjonsfilen, med sine grenser oppgitt før kjøringen:

seg-e8e9ee2965cf = Setning

seg-e127f2f26824 = Leses

seg-5e17bb4156f1 = GGA

seg-b38b8385ddcb = posisjon, kvalitet på posisjonsbestemmelsen ({ "0" } = ingen posisjonsbestemmelse), høyde over middelhavnivå, geoideseparasjon, HDOP

seg-870056f55c30 = RMC

seg-445c02505551 = status (<c1/> gyldig, <c2/> ikke), fart og kurs over grunnen, dato, modus

seg-8a259fc7b06d = VTG

seg-eb3e34f58751 = fart og kurs over grunnen, der RMC ikke har noen

seg-add66711c27b = HDT, THS

seg-24e36e50b0ad = retning (THS bare når modusen ikke er <c1/>)

seg-bcfb4cd59951 = VHW, VBW

seg-fa0a0dae1510 = fart gjennom vannet (VBW bare når statusen er <c1/>)

seg-774d1991fb0b = ZDA

seg-68d981999c72 = tid

seg-a0cc45088f5f = GSV

seg-0fad368a11cb = signalstyrke per satellitt (dB-Hz), elevasjon og asimut (for geometrien)

seg-032eafc03b42 = GSA

seg-71334afb8a7d = presisjonsfortynning og brukte satellitter (for geometrien, der GSV ikke gir noen himmel; og den oppgitte HDOP som vakten sammenligner)

seg-305f423d3ead = en OSNMA-status en mottaker rapporterte, oversatt til denne setningen av adapteren som leser mottakeren: <c1/> autentisert, <c2/> mislyktes, <c3/> ingen resultat

seg-7ce1d69e710e = Epoker mottakeren selv sier ikke er en satellittbasert posisjonsbestemmelse (GGA-kvalitet { "0" }, eller { "6" } til { "8" }: estimert, manuell, simulator; RMC-status <c1/>, eller modus <c2/>, <c3/>, <c4/>, <c5/>) brukes ikke i posisjonskontrollene og utgjør ikke noe belegg i noen retning: mottakeren har allerede sagt det.

seg-a0ae80781c6e = De første <c1/> sekundene danner grunnlinjen og scores aldri. Hver monitor ser bare på den nåværende og tidligere epoker, så en beslutning i en epoke endres ikke når senere data kommer, og en løpende strøm gir samme score som den samme teksten lest som en fil.

seg-068593ad0a52 = Hva hver kontroll fanger opp, og hva den ikke kan

seg-094b90f0c701 = Retninger mellom posisjonsbestemmelser (sporkursen brukt av svingrate-kontrollen, kursen to posisjoner innebærer) er retningen til korden mellom dem, som er geodetens <b>middelasimut</b> mellom posisjonsbestemmelsene, ikke fremoverasimuten ved den første; de to avviker med omtrent halve meridiankonvergensen mellom posisjonsbestemmelsene ({ "0.001" } grader for en grunnlinje på { "260" } m ved { "59.5" } graders breddegrad).

seg-ed3cdfcfbff5 = En forfalsket posisjon må stemme med et skips fysikk og med skipets andre sensorer. Hver kontroll sammenligner posisjonsbestemmelsen med én av dem. En kontroll er bare så uavhengig som den andre kilden: en retning fra et GNSS-kompass, eller en «fart gjennom vannet» utledet fra GNSS, er ikke uavhengig av mottakeren under test og tilfører ingenting.

seg-5dd62cd853c6 = Den kan <b>holde tilbake en god posisjonsbestemmelse</b> (en falsk alarm) i tillegg til å slippe gjennom en spoofet (en uteblitt deteksjon). Overvåkerne sjekker en posisjonsbestemmelse mot et skips fysikk og dets andre sensorer; en forfalskning som er konsistent med alle disse, blir ikke oppdaget (se begrensningene nedenfor).

seg-a284a3ec9dfe = Den forventer en <b>ren tekststrøm i NMEA { "0183" }</b>. Binære rammer som er blandet inn i strømmen, videresendes uendret, men en <c1/> kan da havne mellom bytene i en ramme.

seg-0c919698fa92 = Den er <b>ikke typegodkjent</b>, og ingenting i den er vurdert mot IEC { "61108" } eller IEC { "61162" }. Operatøren er fortsatt ansvarlig for fartøyets navigasjon.

seg-9e3ea39c38cf = <s1>Forrige</s1>Mottakertillit

seg-136da5c10b2d = <s1>Neste</s1>NMEA-treningsstrømmer

seg-990a49527516 = $PKSHT: den proprietære setningen
