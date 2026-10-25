# docs--jammertest: translations (sv)

seg-f8cf777c0caa = Ytor

seg-45425f378b61 = betydelse

seg-9367b8736d36 = Källa: <c1/>

seg-c2a40cd73d0e = Jammertest-poängsättning: den publicerade planen som schemalagd referens

seg-a560942cbd27 = <c1/> läser Jammertests testkatalog och sändningsplan och gör om ett testområdes tidsluckor till receiver-trust <c2/>. <c3/> kör en mottagarlogg genom förtroendemonitorerna och poängsätter den mot det schemat, test för test. Varje resultat är <b>MODELLED</b>: schemat anger när ett test var <em>planerat</em>, inte när en sändare var på.

seg-bc4e7285c38a = Rådgivande programvara, inte typgodkänd navigationsutrustning (IEC { "61108" }, IEC { "61162" }): operatören är fortsatt ansvarig för fartygets navigering. Inget här stöds av Norwegian Public Roads Administration, Nkom eller evenemangets arrangörer; inget avtal med dem görs gällande.

seg-af0edceb1503 = Poängsättning av en syntetisk mottagarlogg mot ett schema med tre test, från en verklig körning av motor v{ $version } (`kshana jammertest score`). Loggen är påhittad: { "1800" } s NMEA med ett fall på { "20" } dB C/N0 under två intervall. Schemat listar tre tidsluckor; den mittersta luckan har ingen jammer i loggen. Poängen markerar { "2" } av { "3" } test som detekterade (mediantid till detektion { "0" } s) och { "1" } som missade, med { "0" } körningar med falsklarm över { "0.25" } h ren tid. Inget här säger något om en verklig mottagare. Rådgivande programvara, inte typgodkänd navigationsutrustning (IEC { "61108" }, IEC { "61162" }): operatören är fortsatt ansvarig för fartygets navigering.

seg-ceaa46bdcb7e = Planen och katalogen

seg-73a5899de383 = Källa: Norwegian Public Roads Administrations repository <c1/> (<a1>https://github.com/NPRA/jammertest-plan</a1>), <b>MIT-licens</b> (copyright { "2024" } Norwegian Public Roads Administration; licenstexten kontrolleras i <c2/>). Filerna hämtas, aldrig inkluderade i källkoden:

seg-2a4967d30c3a = Den hämtar katalogerna och planfilerna för { "2025" } vid den fastlåsta incheckningen <c1/> och avvisar varje fil vars SHA-256 skiljer sig från <c2/>.

seg-7826929c89f6 = Ett katalogtest har ett punktseparerat id, <c1/> (till exempel <c2/>: typ { "1" } jamming, grupp { "2" }, test { "5" }). Planen listar, per testområde och tidslucka, vilket id som är schemalagt. Typerna { "1" } (jamming), { "2" } (spoofing) och { "3" } (meaconing) sänder; typ { "0" } (genomgångar, karenstid, bokade och ad hoc-luckor) sänder inte och hoppas över. Plantider är lokal väggklocktid; <c3/> (standardvärde { "2" }, CEST) anger hur långt de ligger från UTC. Planfilerna har ett testkontaktfält med en persons namn: det läses aldrig, och inget som härleds från det skrivs.

seg-3eab33a0c38f = Import

seg-91fddde78691 = <c1/> ersätter <c2/>/<c3/> när loggen inte anger sin start. Utdata är TOML <c4/> att lägga till i ett receiver-trust-scenario; varje etikett börjar med <c5/> och innehåller utgåveåret, katalogid och området, och huvudet registrerar SHA-256 för varje källfil. <c6/> läser i stället händelsereferensen för en mapp i JammerTest-datamängden för { "2024" } (dess <c7/>, tidsstämplar förskjutna med <c8/>, standardvärde -2: de säger <c9/> men är lokal tid).

seg-6ed6415a6f52 = Poängsättning

seg-1e72a977f7ad = <c1/> är ett receiver-trust-scenario (<c2/>, valfritt <c3/>, <c4/>). Dess egna <c5/> ersätts av det importerade schemat. Per schemalagt test:

seg-99427ab75a03 = fält

seg-d2681be37798 = <c1/> (ett larm inom <c2/>, standardvärde { "10" } s, från planerad start), <c3/> (senare, inom luckan), <c4/> (inget), <c5/>

seg-01a977f18700 = första larmet minus planerad start

seg-b83d1f0a1fb7 = luckans slut till starten av den första sträckan på minst <c1/> ({ "10" } s) utan larm, före nästa test

seg-84a34f13e93b = Ett test kan poängsättas bara om det startar minst <c1/> efter att loggen började; en logg med ett tidigare test flaggas <c2/> (baslinjen kan ha bildats under störning). <b>Falsklarm</b> är larmande epoker efter kalibreringen utanför varje lucka utvidgad med <c3/> ({ "60" } s) före och efter (eller efter återhämtningspunkten), räknade som epoker och som körningar, med körningar per timme ren tid. Med <c4/> och <c5/> skrivs körningen som ett signerat bevispaket (<c6/>): resultatkortet och det importerade schemat ligger i <c7/>, alltså inom hashkedjan och signaturen. Ett paket är en teknisk journal, inte ett juridiskt utlåtande.

seg-382613112d5d = Vad ett resultat inte säger

seg-f1cb12a89001 = En planerad lucka är inte en sändningslogg. En sändare kan ha startat sent, stoppat tidigt eller aldrig körts; ett "missat" test kan vara ett test som inte sände, och en tidsfördröjning räknas från planerad start.

seg-32baa4a4b9f0 = En "ren" epok är "utanför de planerade luckorna", inte "bevisat störningsfri".

seg-95cc22bbacc5 = Detektion med monitorer i mätdomänen säger ingenting om detektion av en spoofer med låg effekt och koherens.

seg-2e91813cf9d7 = Ingen extern oberoende referens anger de verkliga sändningstiderna, så inget här är VALIDATED.

seg-cfdf09e38e6e = Körningen på datamängden för { "2024" } (förhandsregistrerad)

seg-473ed6ca71e5 = <c1/> fastställde populationen, definitionerna och trösklarna före den första poängsatta körningen; <c2/> registrerar den körningen. Resultat: <b>den registrerade regeln om minsta datamängd misslyckades</b> ({ "4" } poängsättningsbara jamming-fönster från { "4" } av de { "12" } <c3/>-mapparna: { "5" } mappar föll bort på grund av baslinjeregeln och { "3" } UBX-loggar anger sin start bara som GPS-veckotid), så <b>ingen tröskel kan bedömas</b>. Inget lättades på eller kördes om. <b>v2</b> (<c4/>, incheckad ensam före sin körning; enbart datahantering, samma trösklar och samma regel om minsta datamängd) placerade loggarna med enbart GPS-tid utifrån mappens datum, poängsatte de { "12" } mapparna med enbart CSV och använde en session för rörlig plattform för de rörliga rovrarna. Resultat (<c5/>): { "14" } av { "24" } mappar behölls men bara <c6/> poängsättningsbara jamming-fönster, så regeln om minsta datamängd misslyckades igen och <b>ingen tröskel kan bedömas</b>. Resultatet för v1 är oförändrat. Endast beskrivande: { "3" } av { "7" } jamming-fönster gav larm inom { "10" } s, { "4" } senare, inga missade; mediantid till detektion { "18" } s; larmfrekvens vid ren signal { "0.089" }. Den bindande begränsningen är nu baslinjeregeln, som tar bort { "10" } mappar; en ytterligare registrering skulle kräva en annan regel för tidiga fönster. Datamängden (JammerTest { "2024" }, Zenodo { "15911589" }, GPL-3.0-or-later) hämtas av <c7/> och inkluderas aldrig i källkoden; testet <c8/> fäster den registrerade körningen när <c9/> pekar på den uppackade datamängden.

seg-cd75b60bd0db = NMEA-datamängden från SimulaMet för { "2025" }

seg-87bc2544154b = NMEA-härledda datamängden från SimulaMet Jammertest { "2025" } (IEEE DataPort, DOI 10.21227/a7v4-xw11) är <b>inte</b> anpassad i { "0.38" }. Dess sida anger ingen licens och säger "This dataset requires an IEEE DataPort Subscription to access" (datamängden kräver en IEEE DataPort-prenumeration för åtkomst): villkoren tillåter inte tydligt vidaredistribution eller automatisk hämtning, så ingen adapter eller hämtningsskript skrevs. Att använda den kräver ägarens beslut och helst författarnas skriftliga medgivande.

seg-aa8d3fe2adf3 = CLI, Rust (<c1/>), Python (<c2/>, <c3/>), WebAssembly (samma namn), MCP-verktyg med samma namn samt kommandot <c4/> och färdigheten <c5/>. Det signerade paketet finns bara på kommandoraden (det kräver en signeringsnyckel). Se <c6/>.

seg-82aab597103a = <s1>Föregående</s1>LunaNets förstärkta framåtsignal

seg-fb9e48a04566 = <s1>Nästa</s1>Maskin- och sensorindata
