# docs--jammertest: translations (nb)

seg-45425f378b61 = betydning

seg-9367b8736d36 = Kilde: <c1/>

seg-c2a40cd73d0e = Jammertest-poengsetting: den publiserte planen som planlagt referanse

seg-a560942cbd27 = <c1/> leser testkatalogen og sendeplanen fra Jammertest og gjør ett testområdes tidsluker om til <c2/> for mottakertillit. <c3/> kjører en mottakerlogg gjennom tillitsmonitorene og poengsetter den mot den tidsplanen, test for test. Hvert resultat er <b>MODELLED</b>: tidsplanen sier når en test var <em>planlagt</em>, ikke når en sender var på.

seg-bc4e7285c38a = Veiledende programvare, ikke typegodkjent navigasjonsutstyr (IEC { "61108" }, IEC { "61162" }): operatøren er fortsatt ansvarlig for fartøyets navigasjon. Ingenting her er støttet av Statens vegvesen (Norwegian Public Roads Administration), Nkom eller arrangørene av hendelsen; ingen avtale med dem hevdes.

seg-af0edceb1503 = Poengsetting av én syntetisk mottakerlogg mot en tidsplan med tre tester, fra en ekte kjøring av motoren v{ $version } (`kshana jammertest score`). Loggen er funnet på: { "1800" } s med NMEA med et fall på { "20" } dB C/N0 over to intervaller. Tidsplanen har tre tidsluker; den midterste tidsluken har ingen jammer i loggen. Poengsettingen markerer { "2" } av { "3" } tester som oppdaget (median ventetid { "0" } s) og { "1" } som bommet, med { "0" } kjøringer med falsk alarm over { "0.25" } time ren tid. Ingenting her sier noe om en ekte mottaker. Veiledende programvare, ikke typegodkjent navigasjonsutstyr (IEC { "61108" }, IEC { "61162" }): operatøren er fortsatt ansvarlig for fartøyets navigasjon.

seg-ceaa46bdcb7e = Planen og katalogen

seg-73a5899de383 = Kilde: repositoriet <c1/> fra Statens vegvesen (Norwegian Public Roads Administration) (<a1>https://github.com/NPRA/jammertest-plan</a1>), <b>MIT-lisens</b> (opphavsrett { "2024" } Norwegian Public Roads Administration; lisensteksten er kontrollert i <c2/>). Filene hentes, medleveres aldri:

seg-2a4967d30c3a = Den laster ned katalogene og planfilene for { "2025" } ved den festede commit-en <c1/> og avviser enhver fil der SHA-256 avviker fra <c2/>.

seg-7826929c89f6 = En katalogtest har en id med punktum, <c1/> (for eksempel <c2/>: type { "1" } jamming, gruppe { "2" }, test { "5" }). Planen lister, per testområde og tidsluke, hvilken id som er planlagt. Typene { "1" } (jamming), { "2" } (spoofing) og { "3" } (meaconing) sender; type { "0" } (orienteringer, karensperiode, booking og ad hoc-tidsluker) sender ikke og hoppes over. Plantidene er lokal veggklokketid; <c3/> (standard { "2" }, CEST) sier hvor langt de er fra UTC. Planfilene har et felt for testkontakt med en persons navn: det leses aldri, og ingenting avledet av det skrives.

seg-3eab33a0c38f = Import

seg-91fddde78691 = <c1/> erstatter <c2/>/<c3/> når loggen ikke oppgir starten sin. Utdataene er TOML-<c4/> som skal føyes til et scenario for mottakertillit; hver etikett begynner med <c5/> og har utgaveåret, katalog-id-en og området, og hodet registrerer SHA-256 for hver kildefil. <c6/> leser i stedet hendelsesreferansen for én mappe i datasettet JammerTest { "2024" } (dets <c7/>, tidsstempler forskjøvet med <c8/>, standard -2: de sier <c9/> men er lokal tid).

seg-6ed6415a6f52 = Poengsetting

seg-1e72a977f7ad = <c1/> er et scenario for mottakertillit (<c2/>, valgfri <c3/>, <c4/>). Dets egne <c5/> erstattes av den importerte tidsplanen. Per planlagt test:

seg-99427ab75a03 = felt

seg-d2681be37798 = <c1/> (en alarm innenfor <c2/>, standard { "10" } s, fra planlagt start), <c3/> (senere, innenfor tidsluken), <c4/> (ingen), <c5/>

seg-01a977f18700 = første alarm minus planlagt start

seg-b83d1f0a1fb7 = fra slutten av tidsluken til starten av den første strekningen på minst <c1/> ({ "10" } s) uten alarm, før neste test

seg-84a34f13e93b = En test kan bare poengsettes hvis den starter minst <c1/> etter at loggen begynte; en logg med en tidligere test flagges <c2/> (grunnlinjen kan være dannet under interferens). <b>Falske alarmer</b> er alarmerende epoker etter kalibreringen utenfor hver tidsluke utvidet med <c3/> ({ "60" } s) før og etter (eller etter gjenopprettingspunktet), talt som epoker og som kjøringer, med kjøringer per time ren tid. Med <c4/> og <c5/> skrives kjøringen som en signert bevispakke (<c6/>): resultatkortet og den importerte tidsplanen ligger inne i <c7/>, altså innenfor hashkjeden og signaturen. En pakke er en teknisk oppføring, ikke en juridisk vurdering.

seg-382613112d5d = Hva et resultat ikke sier

seg-f1cb12a89001 = En planlagt tidsluke er ikke en registrering av sendingen. En sender kan ha startet sent, stoppet tidlig eller aldri vært på; en «missed» test kan være en test som ikke sendte, og en ventetid regnes fra planlagt start.

seg-32baa4a4b9f0 = En «ren» epoke er «utenfor de planlagte tidslukene», ikke «bevist fri for interferens».

seg-95cc22bbacc5 = Deteksjon med monitorer i måledomenet sier ingenting om å oppdage en koherent spoofer med lav effekt.

seg-2e91813cf9d7 = Ingen ekstern uavhengig referanse oppgir de sanne sendetidene, så ingenting her er VALIDATED.

seg-cfdf09e38e6e = Kjøringen på datasettet for { "2024" } (forhåndsregistrert)

seg-473ed6ca71e5 = <c1/> fastsatte populasjonen, definisjonene og tersklene før den første poengsatte kjøringen; <c2/> registrerer den kjøringen. Resultat: <b>den registrerte regelen om minstedata sviktet</b> ({ "4" } poengsettbare jamming-vinduer fra { "4" } av de { "12" } <c3/>-mappene: { "5" } mapper ble droppet av grunnlinjeregelen og { "3" } UBX-logger oppgir starten bare som GPS-ukestid), så <b>ingen terskel kan vurderes</b>. Ingenting ble løsnet på eller kjørt på nytt. <b>v2</b> (<c4/>, innsjekket alene før sin kjøring; bare databehandling, de samme tersklene og regelen om minstedata) plasserte loggene med bare GPS-tid fra mappedatoen, poengsatte de { "12" } mappene med bare CSV og brukte en økt for bevegelig plattform for de bevegelige roverne. Resultat (<c5/>): { "14" } av { "24" } mapper beholdt, men bare <c6/> poengsettbare jamming-vinduer, så regelen om minstedata sviktet igjen og <b>ingen terskel kan vurderes</b>. Resultatet fra v1 er uendret. Bare beskrivende: { "3" } av { "7" } jamming-vinduer ga alarm innenfor { "10" } s, { "4" } senere, ingen bommet; median ventetid { "18" } s; alarmrate i ren tid { "0.089" }. Den bindende begrensningen er nå grunnlinjeregelen, som fjerner { "10" } mapper; en ny registrering ville trenge en annen regel for tidlige vinduer. Datasettet (JammerTest { "2024" }, Zenodo { "15911589" }, GPL-3.0-or-later) hentes av <c7/> og medleveres aldri; testen <c8/> fester den registrerte kjøringen når <c9/> peker på det utpakkede datasettet.

seg-cd75b60bd0db = NMEA-datasettet fra SimulaMet for { "2025" }

seg-87bc2544154b = NMEA-avledet datasett for SimulaMet Jammertest { "2025" } (IEEE DataPort, DOI 10.21227/a7v4-xw11) er <b>ikke</b> tilpasset i { "0.38" }. Siden oppgir ingen lisens og sier «This dataset requires an IEEE DataPort Subscription to access»: vilkårene tillater ikke tydelig videredistribusjon eller automatisk henting, så ingen adapter eller hentescript er skrevet. Bruk krever eierens beslutning og helst forfatternes skriftlige samtykke.

seg-aa8d3fe2adf3 = CLI, Rust (<c1/>), Python (<c2/>, <c3/>), WebAssembly (de samme navnene), MCP-verktøy med de samme navnene, og kommandoen <c4/> og ferdigheten <c5/>. Den signerte pakken finnes bare på kommandolinjen (den trenger en signeringsnøkkel). Se <c6/>.

seg-82aab597103a = <s1>Forrige</s1>Utvidet LunaNet-forovertsignal

seg-fb9e48a04566 = <s1>Neste</s1>Maskin- og sensorinndata
