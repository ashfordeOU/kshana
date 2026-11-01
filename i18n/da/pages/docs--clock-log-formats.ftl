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

seg-9c8042f0d3d7 = <b><c1/></b>: RINEX-urfiler, version { "2.00" } og { "3.00" } til { "3.04" } (herunder navnefeltet med ni tegn i { "3.04" }). Posten <c2/> kontrolleres, og enhver anden version afvises med angivelse af den fundne version: IGS udgiver urformatet (<c3/>, <c4/>, <c5/>) op til { "3.04" }, og dokumenterne RINEX { "4.00" }, { "4.01" } og { "4.02" } definerer kun observations-, navigations- og meteorologiske filer, så der findes ingen version { "4.00" } af urfilen at læse. Headeren læses kun for sit <c6/> og springes over til <c7/>. Af dataposterne beholdes kun posterne <c8/> (satellit) og <c9/> (modtager eller station) for ét ur, valgt efter navn. Deres første værdifelt, urbiasen i sekunder, er fasen. Fortsættelseslinjer og posterne <c10/>, <c11/> og <c12/> springes over. Epoker er postens kalenderfelter, som sekunder fra 1980-01-06 { "00" }:{ "00" }:{ "00" } i filens eget tidssystem, uden konvertering.

seg-b65f4a928891 = <b><c1/></b>: logs fra TAPR TICC-tælleren (TICC Operation Manual, revisioner af { "23" } november { "2016" } og { "15" } december { "2025" }, "measurement modes"). Hvert datafelt er sekunder med { "12" } decimaler ({ "11" } som standard fra firmware { "20251101" }: ethvert antal op til { "15" } læses). Et tidsstempel læses fra sin decimaltekst som et helt antal femtosekunder, ikke som et binært flydende tal, så fasen i en log optaget dage efter tællerens start bevarer tællerens egen opløsning: et <c2/>-tidsstempel ved { "3.0e5" } s har en afstand på { "5.8e-11" } s, omkring tællerens { "60" } ps.

seg-bb51bfa2a834 = Tilstanden Paired Timestamp udskriver de samme linjer i kanalrækkefølge og læses som tilstanden Timestamp; tilstanden 3-Corner Hat tilføjer den syntetiserede <c1/>, læst som ovenfor.

seg-220bc7450e83 = Output i periode-tilstand og debug-tilstand afvises. En kanal, hvis målinger ikke vokser, rapporteres som periode-tilstand. Binær Timestamp-tilstand er ikke tekst, og en fil i den afvises med en meddelelse, der siger det.

seg-1138c53b3eac = Dit eget ur

seg-1f9cce016fa0 = En tabel <c1/> på urtypen rapporterer, hvor stabilt dit eget ur var, ved siden af simuleringen: <c2/> (<c3/>) er <c4/> med et udtræk på 96 aflæsninger af et IGS-satellitur som en indlejret TimeLab-log. Erstat <c5/> med <c6/> og <c7/> for din egen fil. Blokken <c8/> i resultatet rummer, hvordan loggen blev læst (format, <c9/> og hvor den kom fra, hvert hul) og dens ADEV, TDEV og MTIE; den ændrer ikke simuleringen.

seg-584564d1a734 = At drive holdoveren med dit eget ur: <c1/>

seg-56799b5fea19 = Loggen tilpasses med enhedskortets procedure fra <c1/> (konditionering, kvadratisk led fjernet, lag-1-støjidentifikation, vægtet mindste kvadraters metode i hvid PM, hvid FM, flicker-FM og random-walk-FM ved de middelingstider, der har mindst { "30" } frihedsgrader). Det navngivne ur får derefter <c2/>, <c3/>, <c4/> og den tilpassede <c5/>; <c6/> forbliver, som scenariet har det, fordi en log bærer referencens offset, ikke urets efter disciplinering. Hvid fasestøj tilpasses og rapporteres, men simuleres ikke. Resultatet får en blok <c7/> (koefficienterne, tilpasningspunkterne, de værdier, kørslen brugte, hvad der blev udeladt, logens SHA-256), og uret bærer id'et <c8/>. Med <c9/> trækker ensemblet fra det tilpassede ur (blokken <c10/> kræver <c11/>). En tilpasning uden frekvensstøj, en log for kort til at tilpasse og en <c12/> andre end <c13/> eller <c14/> er fejl, der siger det. <c15/> er et eksempel ({ "6" } timer af et IGS-satellitur).

seg-fe695061eed3 = Hvad sammenligningen på kendt støj (<c1/>) viser, og hvad man bør huske:

seg-90657795ba62 = Nået: niveauet af hvid FM genfindes inden for { "5" } % på hver syntetisk optagelse, der har den; det tilpassede kort gengiver den sande Allan-deviation inden for en faktor { "1.35" } ved hver middelingstid, det blev tilpasset ved; støjeksponenten, som tilpasningen identificerer, er lig med allantools' i hvert punkt (på 5071A-optagelsen, når fasetrinnet, som konditioneringen fjerner, også er fjernet fra allantools' input).

seg-f1ec27a393ae = <b>Ikke nået og fastholdt af testen:</b> random-walk-FM genfindes kun, når den dominerer rækkens længste middelingstider, og selv da kun i én af tre optagelser; i en serie på { "131 072" } s med et krydsningspunkt ved { "3 000" } s gav tilpasningen den til flicker-FM og til driften. Fordelingen mellem random-walk-FM og flicker-FM er ikke pålidelig ud fra én optagelse. Kørslen gengiver logens stabilitet over de middelingstider, loggen dækker; ud over dem divergerer de to valg (flicker-FM er et konstant gulv, random-walk-FM vokser som kvadratroden af middelingstiden).

seg-88ba5ae782d4 = MODELLED: et hvad-nu-hvis for det urs støj, som loggen viser den, ikke en kalibrering af uret og ikke en forudsigelse af dets fremtidige adfærd.

seg-6e88b597bbf0 = En ugyldig log er en fejl, der nævner, hvad der blev fundet (linjen, versionen, den manglende vælger), aldrig et delvist resultat: <c1/> fastholder { "24" } sådanne tilfælde.

seg-4a05abb27420 = MODELLED. Dette er en parser, og dens output føder estimatorer, der er valideret andetsteds mod allantools. Enhedstestene i <c1/> bruger små håndskrevne logs og for formaterne linuxptp og chrony fixturerne i <c2/>. <c3/> kører den sammenligning, der er præregistreret i <c4/>: tre seedede syntetiske logs, én pr. format, læst tilbage af en uafhængig læser skrevet ud fra denne side af samme forfatter, med ADEV, TDEV og MTIE kontrolleret mod allantools { "2024.6" }; den sammenligning dækker kun de tre første formater, og læserne af linuxptp og chrony har parsertests, men ingen sammenligning med en uafhængig reference. Logs i den sammenligning er syntetiske, så intet dér beskriver et virkeligt ur eller en virkelig tæller; sammenligningen på målte serier beskrives nedenfor.

seg-576211abf0b4 = På målte data

seg-3c8d10e8bd1c = <c1/> kører den sammenligning, der er præregistreret i <c2/> (indlagt før nogen fixture eller kørsel), på fire målte serier: Stable32-filen <c3/>, de første { "65 536" } aflæsninger af et 5071A-cæsiumur mod en brintmaser samt urene i IGS-satellitten G01 ({ "30" } s) og stationen ABMF ({ "300" } s) fra IGS' endelige urfil for 2026-08-02, som et medleveret udsnit med sin NOTICE. De to første bærer ingen tilladelse til videredistribution: de logs, der er skrevet ud fra dem, ligger i det git-ignorerede <c4/> (<c5/>), og testen siger det og bestås, når de mangler, medmindre <c6/>. Hver log læses af motoren og af en uafhængig læser, og ADEV, TDEV og MTIE sammenlignes med allantools { "2024.6" }. Optaget i <c7/>: på den udleverede læser fejlede TICC-logs, headerversionen og fem fejlmeddelelser de præregistrerede tærskler; de blev rettet, og sammenligningen blev kørt igen uændret. Nået, bortset fra ét par: MTIE for en frekvenslog afviger fra allantools', fordi allantools integrerer frekvensen minus dens middelværdi (fastholdt som NOT MET; sammenligningen på sammenlignelig basis er nået). Rækken forbliver MODELLED: TICC-logs er målte urdata, omkodet til tællerens layout af vores script (ingen virkelig TICC-optagelse blev fundet), og referencelæseren har samme forfatter som motorens.

seg-52778d17f4db = At drive holdoveren med dit eget ur: [clock_fit]
