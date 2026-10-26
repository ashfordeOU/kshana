# docs--test-bench: translations (nb)

seg-245fe1f87b08 = Fil

seg-e305279d5b11 = Innhold

seg-292871e5747d = Kilde: <c1/>

seg-d18a29239225 = Kjøre en mottaker mot et eksportert scenario

seg-aa3498c7cb16 = En mottakerprodusent som eier en GNSS-simulator i laboratoriet, kan spille av bevegelsen til et Kshana-scenarios kjøretøy gjennom den, registrere hva mottakeren under test gjør, og skåre den loggen med <c1/> mot hendelser som er oppgitt før kjøringen. Kshana leverer bevegelsen, hendelsestidspunktene og skåringen. Den skriver <b>ikke noe signal</b>: ingenting som eksporteres her syntetiserer, modellerer eller sender en radiofrekvent bølgeform eller en bølgeform i basebånd, og en eksportert hendelse er et merket tidsintervall, ikke en oppskrift for å lage interferens. Simulatoren og operatøren leverer signalene, og operatøren er ansvarlig for å kjøre dem bare der det er tillatt (kablet eller skjermet, i henhold til simulatorens egne sikkerhetsanvisninger).

seg-414c7774d133 = Denne siden er en metode. Den publiserer ingen resultater.

seg-a0ad7b35922f = { "1" }. Eksport

seg-798d75d3b65c = Gjelder typen <c1/> (en kjøreprofil med holdning; utfallene i navigasjonstilstanden er hendelsene), og <c2/> og <c3/> (en stasjonær mottaker i scenarioets varighet; jammeren i et <c4/>-scenario er én hendelse over kjøringen). Andre typer sier hvorfor de ikke har noen kjøretøybane. <c5/> er UTC-tidspunktet for bevegelsestid null (standard 2024-01-01T00:{ "00" }:00Z); scenarioene har ingen egen kalenderdato for kjøretøybevegelse. Det må være et ekte UTC-tidspunkt, <c6/> (en avsluttende <c7/> godtas) med år i området { "2000" } til { "2099" } og alle felt innenfor gyldig område; alt annet avvises. Utdataene er byte for byte identiske for samme scenario og epoke.

seg-c153d8ef8735 = én rad per sampel: <c1/>, jordfast <c2/>, <c3/>, geodetisk <c4/>, <c5/>, <c6/>, <c7/>

seg-fa4c8c0d2b72 = epoken, referansesystemene, enhetene, kolonnene og rundtur-toleransene for den CSV-filen

seg-8c74ca211e3a = NMEA { "0183" }-setningene <c1/> og <c2/> per sampel, med kontrollsummer

seg-2b0fd541f1dc = en <c1/>-linje og deretter <c2/>-rader (skrives bare når alle sampleintervaller er det samme hele antallet millisekunder; når den utelates, sier kommandoen hvorfor på standard feilutgang)

seg-d09d2dab9a17 = de samme hendelsene som <c1/>-blokker for et <c2/>-scenario

seg-866a3c4870af = kjøringen som et <a1><c1/></a1>-dokument for en <c2/>-registrering: hendelsene som oppgitt referanse, med <c3/>, <c4/>, <c5/>, hver hendelses <c6/> og effekt overlatt til laboratoriet å fylle inn

seg-9ea6a94d4586 = Referansesystemer og konvensjoner

seg-8d3b7d2ef815 = <b>Posisjon:</b> WGS { "84" }, jordfast (ECEF: <c1/> gjennom ekvator ved nullmeridianen, <c2/> gjennom polen); <c3/>, <c4/>, <c5/> gir den samme posisjonen geodetisk, <c6/> over ellipsoiden.

seg-93a2975d2a19 = <b>Hastighet:</b> jordfaste akser, relativt til jorden.

seg-be05c2278e98 = <c1/> med klokken fra sann nord i [{ "0" }, { "360" }), <c2/> nese opp er positiv, <c3/> høyre vinge ned er positiv; gire-stampe-rulle (3-2-1) fra det lokale nord-øst-ned-systemet til kroppsaksene x fremover, y til høyre, z ned. En stasjonær kilde skriver nuller. NMEA og veipunktteksten har ingen holdning.

seg-3c3ad1295628 = <b>Heading er kroppens gir, ikke bevegelsesretningen.</b> I kjøreprofilen <c1/> girer kroppen i firkantbølger mens hastigheten følger etter, slik at heading og kursen over bakken kan avvike med flere titalls grader (opptil omtrent { "77" } grader i det medfølgende scenarioet <c2/>). NMEA-kursen i <c3/> er kursen over bakken, retningen til hastighetsvektoren, så en simulator som leser heading fra bevegelsesfilen og en som leser kurs fra NMEA-filen ser ulike vinkler. Kursen over bakken fra CSV-filen er <c4/> av hastigheten rotert til nord-øst-ned.

seg-224b53995157 = <b>Høyden følger scenarioet.</b> For <c1/> er <c2/> typens egen trinnvise beregning i tangentplanet av referansen sin og holdes ikke konstant (omtrent { "7" } m over { "180" } s av <c3/>); det er scenarioets bevegelse, skrevet slik den er.

seg-f78a354f96ee = <b>NMEA-plassholdere i <c1/>.</b> Posisjonskvalitet ({ "1" }), brukte satellitter ({ "12" }) og HDOP ({ "1.0" }) skrives bare for at setningen skal være velformet. De sier ingenting om scenarioets geometri eller noen mottakertilstand.

seg-f5cd510aac0c = <c1/> etter epoken, UTC, skuddsekunder er ikke modellert.

seg-d2a2f655760d = <b>NMEA-høyder er ellipsoidiske.</b> Høyden i <c1/> inneholder den ellipsoidiske høyden, og geoideseparasjonen skrives som { "0.0" }. En simulator som behandler høyden som høyde over middelhavsnivå, vil plassere kjøretøyet feil med den lokale geoideundulasjonen.

seg-ee3a9a3ec84d = <b>Rundtur-toleranser</b> (testet ved å lese hver fil tilbake): CSV-posisjon { "0.1" } mm, bredde- og lengdegrad { "1e-9" } grad, hastighet { "0.1" } mm/s, vinkler { "1e-6" } grad; NMEA horisontal posisjon { "5" } mm, høyde { "1" } mm, fart { "0.001" } knop, kurs { "0.001" } grad.

seg-a554992d2694 = Laste filene inn i en simulator

seg-757382614413 = Laboratoriesimulatorer er forskjellige, og dette depotet gjengir ingen simulators håndbok. Sjekk hvilke av formatene ovenfor din leser, og dens oppgitte krav:

seg-cc49ceccea20 = Mange bevegelsesimportører forventer en fast oppdateringsrate, ofte { "10" } Hz. Scenarioet <c1/> går i steg på { "0.1" } s; for et stasjonært scenario setter du <c2/> til den raten simulatoren din vil ha.

seg-e98bf4bf6c6e = Noen importører hopper over sampler som faller mellom hele sekunder, eller ignorerer tidskolonnen og bruker radrekkefølgen. Start bevegelsen på et helt sekund og hold rutenettet regelmessig.

seg-3c470262eb15 = En CSV-importør der du kan tilordne kolonner, kan lese <c1/> direkte: velg de jordfaste eller geodetiske kolonnene og sett enhetene deres ut fra <c2/>. Å kutte desimaler gir falsk akselerasjon, så behold den skrevne presisjonen.

seg-41a2bfe45b37 = Filen inneholder bare bevegelse. Sett opp konstellasjonen, interferensen og mottakerens frontend i simulatoren, og tidfest dem mot hendelsene i <c1/>.

seg-024ab011a2e3 = Kshana skriver ikke noe skriptgrensesnitt for noen leverandør.

seg-6d67d4e2cdf0 = Kontrollert mot leserne i én åpen kildekode-simulator

seg-e4ce0597a644 = Bevegelsesleserne i gps-sdr-sim (MIT, commit 28ca29a6) fikk eksportene fra åtte medfølgende scenarioer. Hver leser returnerte den eksporterte banen (<c1/>, forhåndsregistrert i <c2/>):

seg-3caed3fc2e47 = gps-sdr-sim-alternativ

seg-ad9e78555851 = Gi den

seg-4f9be75880d3 = Største avvik fra CSV-filen

seg-0e86c1df1bc5 = <c1/> (NMEA GGA)

seg-e03dd1d45ced = <c1/> som skrevet

seg-8d28fbcc4c4a = { "1.2" } mm

seg-fd39660fcb73 = <c1/> (tid, breddegrad, lengdegrad, høyde)

seg-c4e171cbf0de = { "0.15" } mm

seg-390b0c0fb695 = <c1/> (tid, x, y, z)

seg-ff26559a85e8 = nøyaktig

seg-f4c13a327904 = Ikke gi <c1/> den fulle bevegelses-CSV-filen. Leseren rommer { "100" } tegn per linje, og en CSV-rad er omtrent { "160" } tegn, så hver rad leses som to sampler. Overskriftslinjen leses som ett sampel til uten tall i seg.

seg-43cc6f9c50b2 = gps-sdr-sim rommer høyst { "3000" } sampler, { "300" } s ved den faste raten på { "10" } Hz, og ignorerer tidskolonnen. Eksportene fra <c1/> går i steg på nøyaktig { "0.1" } s. Lengre scenarioer, for eksempel det 20 minutter lange <c2/>, leses bare til de første { "300" } s.

seg-500243b6e402 = Dette kontrollerer at filene leses slik de er skrevet. Det kontrollerer ikke scenarioets fysikk eller noe simulatoren sender.

seg-a4c4514276e9 = { "2" }. Oppgi hva du vil skåre før kjøringen

seg-3a3e2be36c65 = Hendelsesfilen gir intervallene scenarioet definerer. Kopier <c1/> inn i et <c2/>-scenario, legg til eventuelle prediksjoner du vil ha kontrollert, og fastsett monitorterskler og toleranser <b>før</b> mottakeren kjører. Ikke juster dem etter å ha sett loggen; scenarioet, tersklene og loggens SHA-256 inngår alle i resultatets hash.

seg-d07b9ad8cfa9 = De eksporterte hendelsene har scenarioets egen type: jammeren i et <c1/>-scenario er <c2/>; et utfall i navigasjonstilstanden er <c3/>, fordi scenarioet oppgir at GNSS var utilgjengelig, ikke hvordan. Endre <c4/> slik at det stemmer med det du setter opp simulatoren til å gjøre.

seg-faa87b3ba315 = { "3" }. Kjør mottakeren

seg-0a3b63cf5615 = Start mottakeren og loggeren, start simulatorscenarioet med bevegelsesfilen, og la kjøringen dekke kalibreringsintervallet, hver hendelse og en margin etter den siste. Behold mottakerens egen logg (UBX, RINEX { "3" }-observasjoner, en Android-logger-CSV eller NMEA med setninger for satellittstatus). En logg uten signalstyrke per satellitt kan fortsatt skåres på mottakerens egen posisjon, men monitorene for bærebølge-til-støy trenger den.

seg-fbbc12dfeb3f = { "4" }. Synkroniser klokkene

seg-5828311af3d4 = <c1/> teller hendelsestidspunkter fra første epoke i mottakerens logg; bevegelsesfilen teller fra sitt første sampel. Hvis loggen starter <c2/> sekunder før bevegelsens første sampel, legger du <c3/> til hver <c4/> og <c5/>. Noter forskyvningen og hvordan du målte den, og oppgi den i scenarioets <c6/> eller i en kommentar, siden en feil forskyvning flytter hver skåring. Hendelsestidspunktene alene kan ikke fortelle deg forskyvningen; bruk simulatorens markør for scenariostart eller mottakerens egne tidsstempler.

seg-22f7b68c445b = { "5" }. Skår

seg-e024186a2874 = skriver <c1/>, <c2/> og <c3/>. For hver hendelse oppgir resultatet falske alarmer før starten, den første alarmen og monitorene bak den, forsinkelsen og utfallet (<c4/>, <c5/>, <c6/>, <c7/>), pluss et predikert og observert fall i bærebølge-til-støy der du har oppgitt en prediksjon. Et avvik rapporteres, aldri justert bort. Se <a1>RECEIVER-TRUST.md</a1>.

seg-5fa1e4890f91 = For å se hvilke offentlige rammeverksrader økten gir belegg for:

seg-abc6aaf44c95 = Se <a1>compliance/README.md</a1>. Den rapporten beskriver evidensen i kjøringene du gir den; den gir ingen konklusjon om mottakeren eller noe rammeverk.

seg-69fa39640c2d = { "6" }. Knytt rundturen sammen i én signert pakke

seg-f24e2dd64c47 = Etter skåringen knytter <c1/> de fire registreringene sammen: scenarioet du eksporterte, laboratoriets <a1>testbetingelser</a1>, mottakerloggen og skåringen. Fyll inn <c2/> (loggens sti og SHA-256, mottakeren under test, hver hendelses type og oppgitte effekt), og kjør deretter:

seg-78bed55de550 = <c1/> inneholder en <c2/>-blokk (<c3/>) med <c4/>, <c5/>, <c6/> og skåringen (hendelser oppdaget av evaluerbare, første alarm), dekket av manifestets hasher og signaturen. Kommandoen avviser en pakke der betingelsene og skåringshendelsene er uenige, eller der den oppgitte loggkontrollsummen ikke er loggens. Som alle bevispakker er den en teknisk registrering, ikke en juridisk vurdering.

seg-5fe6548911da = Gjennomgått eksempel: gps-sdr-sim som skriver en fil

seg-eeccc823e109 = Dette eksempelet bruker åpen kildekode-simulatoren gps-sdr-sim bare til å <b>skrive en basebåndfil</b> ut fra den eksporterte bevegelsen. Kshana sender ikke, og ingenting på denne siden automatiserer avspilling av den filen gjennom en radio. Hvis laboratoriet ditt spiller en slik fil inn i en mottaker, er det operatørens ansvar, og skal bare gjøres der det er tillatt (kablet eller skjermet, i henhold til simulatorens og radioens egne sikkerhetsanvisninger); Kshana verken dokumenterer eller pakker inn dette.

seg-db81fdadfd19 = Det laboratoriet deretter gjør med <c1/>, skjer utenfor Kshana. Mottakerens egen logg, uansett hvordan den er skaffet, er det trinn { "5" } skårer og trinn { "6" } knytter sammen. Filene og kontrollene Kshana gjør av sine egne eksporter, er bare testet på syntetiske data (<c2/>); ingen laboratoriekjøring påstås her.

seg-dffcbdb8e6c3 = Hva denne metoden ikke gjør

seg-d0b62c238953 = Den lager ikke et signal, og den sier ikke hvilken interferens en simulator bør generere. Hendelsene sier når, ikke hva.

seg-3aa11bed60c8 = Én enkelt økt er ett enkelt datapunkt. Resultatet beskriver den loggen under den konfigurasjonen, og sier ingenting om andre mottakere, firmware, antenner eller ekte interferens.

seg-b156403456e4 = Høyder, rater og tidssynkronisering må operatøren selv kontrollere mot simulatoren; eksporten oppgir sine egne konvensjoner og toleranser og ikke mer.

seg-337ff53bc890 = <s1>Forrige</s1>kshana-bench

seg-87be81f5e600 = <s1>Neste</s1>Compliance-kartlegging
