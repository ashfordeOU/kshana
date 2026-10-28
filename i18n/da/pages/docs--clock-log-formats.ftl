# docs--clock-log-formats: translations (da)

seg-ca2fcdd60f65 = Kilde: <c1/>

seg-0dfd1160c5d7 = Formater for urlogs

seg-f52a62872493 = <c1/> læser en målt urlog til én normaliseret faseserie: et ensartet gitter af samples <c2/>, med samplingsintervallet <c3/> angivet eller fundet, hvert hul talt og logens enheder navngivet. Otte formater læses, hver en dokumenteret delmængde. Alt uden for delmængden afvises med en fejl, der navngiver det, der blev fundet, i stedet for at blive læst omtrentligt.

seg-dbdbfec37ab6 = <b>Forkortelser.</b> RINEX er Receiver Independent Exchange Format. TICC er TAPR's (Tucson Amateur Packet Radio) tidsintervaltæller. ADEV er den overlappende Allan-deviation, TDEV tidsdeviationen og MTIE den maksimale tidsintervalfejl. <c1/> er samplingsintervallet i sekunder.

seg-1d5a6c2090af = Hvor en log kan bruges

seg-2a391645eeeb = <b><c1/></b>: <c2/> i stedet for <c3/> eller <c4/>. Logens fase i ns er tidsfejlsserien, der kontrolleres mod maskerne, og rapporten får en blok <c5/>, der beskriver, hvordan den blev læst.

seg-4c2a67008451 = <b>Urtypen</b>: en tabel <c1/> tilføjer en blok <c2/> til kørslen: hvordan logen blev læst, SHA-256 af tabellen (<c3/>; kørslens <c4/> dækker ikke tabellen) og af fasesamplene samt den overlappende ADEV, TDEV og MTIE ved gennemsnitsfaktorer i oktaver. Den kræver <c5/>. Den simulerede holdover er uændret.

seg-2f464fe709c9 = Uden tabellen parses, hashes og rapporteres begge typer nøjagtigt som før.

seg-c931c5ec2f4a = Formaterne

seg-0b758195e7eb = <b><c1/></b>: ASCII-fase- eller frekvenslogs i TimeLab-stil, den almindelige tekstform, som TimeLab eksporterer, og som dets ASCII-import og Stable32 læser. Der er én måling pr. linje: enten én kolonne ved et ensartet <c2/> eller to kolonner <c3/>. Kolonner kan adskilles af blanktegn, kommaer eller semikoloner.

seg-a7ae9e712bea = Linjer, der begynder med <c1/>, <c2/> eller <c3/>, er kommentarer. En kommentar på formen <c4/> (eller <c5/>) sætter <c6/> (s), <c7/> (<c8/>, <c9/>, <c10/>, <c11/> eller <c12/>, for fase), <c13/> (<c14/> eller <c15/>) eller <c16/> (<c17/> eller <c18/>, for den første af to kolonner).

seg-84cf463d5e74 = Én indledende ikke-numerisk linje opfattes som kolonneoverskrift.

seg-84f4b59bcdbf = Frekvensdata (fraktionel frekvens) accepteres kun som én kolonne. De integreres til fase som <c1/> (NIST SP { "1065" }, { "2008" }, §{ "4.1" }).

seg-8cc445eb84f3 = TimeLabs binære projektfiler og projektfiler af typen <c1/> læses ikke.

seg-3af6e4e7bc73 = Linjer i timestamp-tilstand (<c1/>, <c2/>) og TimeLab-tilstandens pseudotidsstempelkanal (<c3/>) er hændelsestidsstempler. Fasen for den valgte kanal er dens tidsstempel minus den nominelle tick: <c4/>, hvor <c5/> er det hele antal <c6/> siden den første hændelse. En overset hændelse er et hul.

seg-cecf9df4ff10 = Linjer i interval-tilstand (<c1/> eller en vilkårlig etiket, der begynder med <c2/>) læses direkte som fase, én måling pr. <c3/>. Scenariet skal angive <c4/>, fordi linjen ikke indeholder noget tidspunkt.

seg-5ec2509907dd = Linjer, der begynder med <c1/>, og linjer, der ikke er <c2/> (som opstartsmenuen), springes over og tælles.

seg-cb4b7062dd5a = linuxptp- og chrony-logs

seg-c6c70813a988 = Disse fem formater læser det, en kørende tidsdæmon skriver om sit eget ur. De er til at kontrollere en tidskæde bagefter (et boundary-ur, en grandmasters PHC, en chrony-klient) med de samme estimatorer som de øvrige logs. De læser ikke en dæmons konfiguration, og intet her taler med en dæmon.

seg-e1f85ff146d2 = <b><c1/></b>, <b><c2/></b>, <b><c3/></b>: servolinjerne fra linuxptp, hvor hvert format kun læser linjer fra sit eget program. En måling er en linje på formen

seg-e32842403b6b = Tidsstemplet er den første <c1/> i linjen (dæmonens monotone ur). Det læses også efter et syslog-præfiks, hvor et proces-id som <c2/> ikke har nogen brøkdel og ikke tages med.

seg-72678cd6c03e = Fasen er den loggede <c1/> i nanosekunder, omregnet til sekunder. Det er dæmonens målte tidsfejl for dens slave-ur i forhold til dens reference, som logget: positiv, når slaven er forud. Det er den fejl, der er tilbage under servostyring, ikke et frit løbende urs drift.

seg-f9080412572a = Ordene mellem tidsstemplet og <c1/> angiver kilden (<c2/>, <c3/> for et præfiks <c4/>, <c5/>, <c6/>). En log med mere end én kilde kræver <c7/>; fejlen opregner dem.

seg-5bef874341f2 = Målinger, før servoen første gang rapporterer <c1/> (låst), udelades og tælles i <c2/>: <c3/> og <c4/> er tilstandene ulåst og trin, hvis offsets er indsvingningstransienter. En servo, der aldrig når <c5/>, afvises. En linje uden tilstandsfelt læses, som den er.

seg-121fbe1486cf = Oversigtslinjer (<c1/>), meddelelserne <c2/> og <c3/> og linjer fra andre programmer springes over og tælles.

seg-92164f4a56be = Tidsstempler, der går baglæns (en genstartet dæmon), afvises; del logen.

seg-d86fd2a815d8 = <b><c1/></b>, <b><c2/></b>: chronys filer <c3/> og <c4/>, læst efter kolonneposition. En måling er en linje med mindst { "14" } kolonner (tracking) eller { "13" } (statistics), der begynder med en UTC-dato og -tid på formen <c5/>. Linjen med kolonneoverskrifter springes over og tælles; stregen <c6/> under den springes over uden at blive talt.

seg-bae4f6895d14 = Tracking: kolonne { "7" }, det lokale offset ved opdateringen af uret, i sekunder. IP-adressen eller reference-id'et skifter med den valgte kilde, så uden <c1/> læses hver linje som ét lokalt ur. <c2/> beholder ét reference-id.

seg-12b284cd7d8c = Statistics: kolonne { "5" }, en kildes estimerede offset, i sekunder. Der er én serie pr. kildeadresse, og logen kræver <c1/>, når den indeholder mere end én.

seg-197645e3c7c5 = Epoker er sekunder fra 1980-01-06 { "00" }:{ "00" }:{ "00" } UTC uden håndtering af skudsekunder. Chrony skriver en linje pr. opdatering eller pr. kildesample, så afstanden er ikke ensartet. <c1/> er medianafstanden; en måling under et halvt <c2/> efter den foregående beholdte måling droppes og tælles i <c3/>, og en længere afstand er et hul, som <c4/> rapporterer. Angiv <c5/> og <c6/> for en log med et stabilt pollinginterval.

seg-61fbb0479c95 = Chrony-kolonnerne og linuxptp-linjelayoutene er dem fra dæmonernes offentlige dokumentation. Fixturerne i <c1/> er skrevet til Kshana med opdigtede værdier (se dens <c2/>); ingen rigtig log er læst, så et layout, der afviger mellem dæmonversioner, stadig kan blive afvist eller læst forkert. En linje, der ikke passer, springes over og tælles, aldrig gættet.

seg-b120a37b7d60 = <c1/> og huller

seg-6fd68aad2fd7 = Når logen har tidsstempler og der ikke er angivet <c1/>, er <c2/> medianafstanden mellem på hinanden følgende tidsstempler, afrundet til fire betydende cifre, og kilden rapporteres som <c3/>. En tællers afstand afviger fra den nominelle med referencens frekvensforskydning, dele pr. { "10" }^{ "6" } eller mindre. Et <c4/> i scenariet vinder altid (kilde <c5/>), derefter en headerkommentar <c6/> (kilde <c7/>).

seg-59e52611a7d3 = Samples placeres på gitteret <c1/>, og en manglende epoke er et hul. Målinger, der ligger mere end { "1" } % af <c2/> fra gitteret, droppes og tælles, det samme gælder dubletter (den første beholdes). Hulpolitikken er en af følgende:

seg-61b1664a7c48 = <c1/> (standard): ethvert hul er en fejl, der tæller hullerne;

seg-593c998b65e0 = <c1/>: behold den længste hulfrie række;

seg-f184ce746389 = <c1/>: udfyld indre huller ved lineær interpolation, og rapportér antallet udfyldt.

seg-1f3dc3429615 = Estimatorerne kræver en hulfri optagelse, og derfor løses hullerne her.

seg-0f061f726ec5 = <s1>Forrige</s1>Holdover-test og tidssynkroniseringshardware i løkken

seg-3c89cfcbbd04 = <s1>Næste</s1>Hardwaresikkerhed

seg-9b52cd5eb4be = tau0 og huller
