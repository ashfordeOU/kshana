# docs--jammertest: translations (da)

seg-f8cf777c0caa = Flader

seg-45425f378b61 = betydning

seg-9367b8736d36 = Kilde: <c1/>

seg-c2a40cd73d0e = Scoring i Jammertest: den publicerede plan som planlagt sandhed

seg-a560942cbd27 = <c1/> læser testkataloget og transmissionsplanen for Jammertest og omdanner ét testområdes tidsvinduer til <c2/> for modtagertillid. <c3/> kører en modtagerlog gennem tillidsovervågningerne og bedømmer den mod den plan, test for test. Hvert resultat er <b>MODELLED</b>: planen siger, hvornår en test var <em>planlagt</em>, ikke hvornår en sender var tændt.

seg-bc4e7285c38a = Vejledende software, ikke typegodkendt navigationsudstyr (IEC { "61108" }, IEC { "61162" }): operatøren er fortsat ansvarlig for fartøjets navigation. Intet her er anbefalet af den norske vejmyndighed (Statens vegvesen), Nkom eller arrangørerne; der gøres ikke krav på nogen aftale med dem.

seg-af0edceb1503 = Scoring af én syntetisk modtagerlog mod en plan med tre tests, fra en rigtig kørsel af motoren v{ $version } (`kshana jammertest score`). Loggen er opdigtet: { "1800" } s NMEA med et fald på { "20" } dB i C/N0 over to intervaller. Planen opregner tre tidsvinduer; i det midterste er der ingen jammer i loggen. Scoren markerer { "2" } af { "3" } tests som opdaget (median for latenstid { "0" } s) og { "1" } som misset, med { "0" } kørsler med falsk alarm over { "0.25" } t ren tid. Intet her siger noget om en rigtig modtager. Vejledende software, ikke typegodkendt navigationsudstyr (IEC { "61108" }, IEC { "61162" }): operatøren er fortsat ansvarlig for fartøjets navigation.

seg-ceaa46bdcb7e = Planen og kataloget

seg-73a5899de383 = Kilde: den norske vejmyndigheds repositorium <c1/> (<a1>https://github.com/NPRA/jammertest-plan</a1>), <b>MIT-licens</b> (ophavsret { "2024" } Statens vegvesen; licensteksten er kontrolleret i <c2/>). Filerne hentes, aldrig medleveret:

seg-2a4967d30c3a = Den downloader katalogerne og planfilerne fra { "2025" } ved den fastlåste commit <c1/> og afviser enhver fil, hvis SHA-256 afviger fra <c2/>.

seg-7826929c89f6 = En katalogtest har et id med punktummer, <c1/> (for eksempel <c2/>: type { "1" } jamming, gruppe { "2" }, test { "5" }). Planen angiver pr. testområde og tidsvindue, hvilket id der er planlagt. Typerne { "1" } (jamming), { "2" } (spoofing) og { "3" } (meaconing) sender; type { "0" } (briefinger, karensperiode, booking og ad hoc-vinduer) sender ikke og springes over. Plantider er lokal vægurstid; <c3/> (standard { "2" }, CEST) angiver, hvor langt de er fra UTC. Planfilerne har et felt for testkontakt med en persons navn: det læses aldrig, og intet afledt af det skrives.

seg-3eab33a0c38f = Import

seg-91fddde78691 = <c1/> erstatter <c2/>/<c3/>, når loggen ikke angiver sin start. Outputtet er TOML <c4/> til at føje til et scenarie for modtagertillid; hver etiket begynder med <c5/> og bærer udgaveåret, katalog-id'et og området, og headeren registrerer SHA-256 for hver kildefil. <c6/> læser i stedet hændelsessandheden fra én mappe i datasættet JammerTest { "2024" } (dets <c7/>, stempler forskudt med <c8/>, standard -2: de siger <c9/>, men er lokal tid).

seg-6ed6415a6f52 = Score

seg-1e72a977f7ad = <c1/> er et scenarie for modtagertillid (<c2/>, valgfri <c3/>, <c4/>). Dets egne <c5/> erstattes af den importerede plan. Pr. planlagt test:

seg-99427ab75a03 = felt

seg-d2681be37798 = <c1/> (en alarm inden for <c2/>, standard { "10" } s, fra den planlagte start), <c3/> (senere, inden for vinduet), <c4/> (ingen), <c5/>

seg-01a977f18700 = første alarm minus planlagt start

seg-b83d1f0a1fb7 = vinduets slutning til starten af første strækning på mindst <c1/> ({ "10" } s) uden alarm, før næste test

seg-84a34f13e93b = En test kan kun bedømmes, hvis den starter mindst <c1/> efter, at loggen begyndte; en log med en tidligere test markeres <c2/> (baseline kan være dannet under interferens). <b>Falske alarmer</b> er alarmerende epoker efter kalibreringen uden for ethvert vindue, forlænget med <c3/> ({ "60" } s) før og efter (eller efter genopretningspunktet), talt som epoker og som kørsler, med kørsler pr. time ren tid. Med <c4/> og <c5/> skrives kørslen som en signeret bevispakke (<c6/>): scorekortet og den importerede plan ligger inde i <c7/>, altså inde i hashkæden og signaturen. En pakke er en teknisk optegnelse, ikke en juridisk vurdering.

seg-382613112d5d = Hvad et resultat ikke siger

seg-f1cb12a89001 = Et planlagt vindue er ikke en optegnelse over udsendelse. En sender kan være startet sent, stoppet tidligt eller aldrig have kørt; en "missed" test kan være en test, der ikke sendte, og en latenstid regnes fra den planlagte start.

seg-32baa4a4b9f0 = En "ren" epoke er "uden for de planlagte vinduer", ikke "bevist fri for interferens".

seg-95cc22bbacc5 = Detektion med overvågninger i måledomænet siger intet om at opdage en spoofer med lav effekt og kohærens.

seg-2e91813cf9d7 = Ingen ekstern uafhængig reference angiver de sande udsendelsestidspunkter, så intet her er VALIDATED.

seg-cfdf09e38e6e = Kørslen på datasættet fra { "2024" } (præregistreret)

seg-473ed6ca71e5 = <c1/> fastlagde populationen, definitionerne og tærsklerne før den første bedømte kørsel; <c2/> registrerer den kørsel. Resultat: <b>den registrerede regel om minimumsdata svigtede</b> ({ "4" } bedømmelige jamming-vinduer fra { "4" } af de { "12" } mapper <c3/>: { "5" } mapper blev udeladt efter baseline-reglen, og { "3" } UBX-logs angiver kun deres start som GPS-ugetid), så <b>ingen tærskel kan bedømmes</b>. Intet blev lempet eller kørt om. <b>v2</b> (<c4/>, committet alene før sin kørsel; kun databehandling, de samme tærskler og regel om minimumsdata) placerede logs med kun GPS-tid ud fra mappens dato, bedømte de { "12" } mapper med kun CSV og brugte en session med bevægelig platform til de bevægelige rovere. Resultat (<c5/>): { "14" } af { "24" } mapper beholdt, men kun <c6/> bedømmelige jamming-vinduer, så reglen om minimumsdata svigtede igen, og <b>ingen tærskel kan bedømmes</b>. Resultatet af v1 er uændret. Kun beskrivende: { "3" } af { "7" } jamming-vinduer gav alarm inden for { "10" } s, { "4" } senere, ingen misset; median for latenstid { "18" } s; alarmrate på rene tidspunkter { "0.089" }. Den bindende begrænsning er nu baseline-reglen, som fjerner { "10" } mapper; en yderligere registrering ville kræve en anden regel for tidlige vinduer. Datasættet (JammerTest { "2024" }, Zenodo { "15911589" }, GPL-3.0-or-later) hentes af <c7/> og medleveres aldrig; testen <c8/> fastlåser den registrerede kørsel, når <c9/> peger på det udpakkede datasæt.

seg-cd75b60bd0db = NMEA-datasættet fra SimulaMet fra { "2025" }

seg-87bc2544154b = NMEA-datasættet afledt fra SimulaMets Jammertest { "2025" } (IEEE DataPort, DOI 10.21227/a7v4-xw11) er <b>ikke</b> tilpasset i { "0.38" }. Dets side angiver ingen licens og siger "This dataset requires an IEEE DataPort Subscription to access": vilkårene tillader ikke klart videredistribution eller automatisk hentning, så der er ikke skrevet nogen adapter eller hentescript. At bruge det kræver ejerens beslutning og helst forfatternes skriftlige aftale.

seg-aa8d3fe2adf3 = CLI, Rust (<c1/>), Python (<c2/>, <c3/>), WebAssembly (de samme navne), MCP-værktøjer med de samme navne og kommandoen <c4/> og skill'en <c5/>. Den signerede pakke findes kun på kommandolinjen (den kræver en signeringsnøgle). Se <c6/>.

seg-82aab597103a = <s1>Forrige</s1>LunaNet augmenteret fremadrettet signal

seg-fb9e48a04566 = <s1>Næste</s1>Maskin- og sensorinput
