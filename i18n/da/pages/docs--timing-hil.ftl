# docs--timing-hil: translations (da)

seg-f8cf777c0caa = Flader

seg-f2ce7fc60cdf = Format

seg-d00b65801e9b = Trin

seg-0d580ea8043d = En holdover-test scoret ud fra en tidsfejlsoptegnelse, fra en egentlig kørsel af motor v{ $version } på scenarios/holdover-test-example.toml ({ "601" } samples hvert { "5" } s). GNSS fjernes af operatøren ved { "600" } s og genoprettes ved { "2400" } s; tidsfejlen driver til { "299" } ns ved slutningen af holdover, forbi budgettet på { "100" } ns efter { "675" } s, og vender tilbage inden for båndet på { "100" } ns { "70" } s efter genoprettelsen. Afgørelser: baseline-masker PASS, holdover-masker FAIL, holdover-envelope FAIL, genoprettelse RECOVERED. Målt mod masken, ikke en godkendelse. Tidspunkterne er operatørens angivelse, ikke verificeret af Kshana. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en livsikkerhedstjeneste.

seg-7a1246297c82 = Kilde: <c1/>

seg-6ea3dec83080 = Timing hardware-in-the-loop: træk antennen, og scor holdoveren

seg-5901f0b26939 = Telecom- og energioperatører tester et tidssynkroniseringssystem ved at tage dets GNSS væk og se, hvad uret gør. Kshana gør ikke det for dem og rører ikke deres udstyr. Det læser den tidsfejlsoptegnelse, som operatørens egne instrumenter har frembragt, deler den ved de to tidspunkter, operatøren angiver, og <b>måler hvert trin mod offentlige ITU-T-masker</b>. Scenarietypen er <a1><c1/></a1>; eksempelscenarierne er <c2/> og <c3/>.

seg-daf4b071bad0 = Dette er hardwaresikkerhedens <b>trin { "1" }</b>: passivt, kun modtagelse, ingen RF fra Kshana (<a1><c1/></a1>). Vejledende software, ikke typegodkendt udstyr. Ingen har vurderet, godkendt eller gennemgået denne fremgangsmåde, og den siger intet om, hvorvidt et system lever op til en anbefaling.

seg-da0c48bbe011 = Fremgangsmåden

seg-e753ca7a1c99 = Operatøren udfører fire trin. Kshana udfører ingen af dem.

seg-0c338b956741 = Hvad operatøren gør

seg-ebd95b343349 = Hvad optegnelsen viser

seg-03999de98059 = { "1" }. Baseline

seg-730f2037d22a = Lader systemet køre låst til GNSS så længe, testen kræver (og noterer, hvor mange dage det havde været låst før).

seg-f45aae4139bd = Tidsfejlen, mens det er disciplineret.

seg-0f050dcede80 = { "2" }. GNSS fjernet

seg-50c0df832eda = Fjerner GNSS fra systemet under test, for eksempel antennekablet ved modtageren eller output fra laboratoriets egen simulator, og <b>skriver tidspunktet ned</b>. Tjek først modtagerproducentens manual: nogle modtagere forsyner antennen med strøm, og nogle har brug for en terminator på den åbne port.

seg-e371e7e357e3 = Øjeblikket, hvor tidsfejlen begynder at vandre.

seg-f05dc0acb396 = { "3" }. Holdover

seg-a98186503e0f = Lader systemet køre på sin egen oscillator i den planlagte tid.

seg-1da66cdca856 = Systemets holdover.

seg-61197c9bad91 = { "4" }. Genopretning

seg-75af1f4fec83 = Genopretter GNSS og <b>skriver tidspunktet ned</b>.

seg-1259d36fc78c = Tidsfejlen, der vender tilbage (eller ikke gør).

seg-c09b1ea8f1a4 = To ting, operatøren skal gøre, fordi Kshana ikke kan:

seg-31f6c357864b = Angiv de to tidspunkter.

seg-59f9eb10035a = <c1/> og <c2/> er operatørens erklæring. Kshana opdager ikke fjernelsen ud fra optegnelsen og verificerer ikke tidspunkterne. Et forkert tidspunkt flytter trinnenes grænser og dermed resultatet.

seg-6d0d3186fbe3 = <b>Brug det samme ur til optegnelsen og tidspunkterne.</b> For en urlog starter tidsaksen ved den første aflæsning, så de to tidspunkter er sekunder fra logens første linje.

seg-bd181a831803 = Hvad der skal optages

seg-52758c10be0a = Et hvilket som helst af disse, gennem de eksisterende læsere i <c1/> (<a1><c2/></a1>):

seg-fef0034cb88b = Instrument

seg-ad6f33d70f3f = Hvordan optegnelsen laves

seg-ef7f547609ad = linuxptp <c1/> (slave- eller grænseurets servo)

seg-f548a2ae96e5 = kør med <c1/> og behold linjerne <c2/>

seg-9a3b58be1b0b = linuxptp <c1/>

seg-77255f8f5fef = linjerne <c1/>

seg-2cf9256bd790 = linuxptp <c1/>

seg-c667a97b92a8 = linjerne <c1/>

seg-ed305bcea4f8 = chrony <c1/>

seg-021b760aae59 = <c1/> i <c2/>

seg-a7f2d72a5cb7 = chrony <c1/>

seg-a70952a099d5 = <c1/> i <c2/>

seg-6ad29120ffe7 = en TAPR TICC-tæller

seg-32f703bfcab7 = tidsstempeltilstand mod referencen

seg-6862a9ac9a68 = en TimeLab ASCII-eksport

seg-b5e7e3a272d6 = fase i en angiven enhed

seg-8af4aac4426f = en RINEX-urfil

seg-21d5c43719f2 = ét ur

seg-3a82b5295ab1 = alt andet

seg-6bebda4a3c6c = <c1/> eller <c2/>

seg-9a443cc0c444 = <c1/>-par, jævnt samplet

seg-b8d1d45df70b = <b>Det, optegnelsen måler, betyder noget.</b> En servolog (linuxptp, chrony) registrerer den forskydning, som dæmonen målte og er ved at korrigere: det er den tidsfejl, der er tilbage under servostyring, ikke en uafhængig måling af uret mod UTC. Under holdover-trinnet i en test, der virkelig fjerner referencen, viser en servolog stadig, hvad dæmonen mente, hvilket kan afvige fra den sande fejl. En TICC eller en anden tæller mod en uafhængig reference er den stærkere optegnelse; angiv, hvilken du brugte, når du rapporterer resultatet.

seg-6d4e25914d1c = Scenariet

seg-ca1244db2387 = Valgfrie nøgler: <c1/> (navn, <c2/>, kilde; standardværdierne for telecom-timing, når de mangler) og <c3/> inde i <c4/> for at udvælge én kilde fra en log, der rummer flere.

seg-38eb634b7f8f = Hvad rapporten indeholder

seg-6a64755e11d6 = <b><c1/></b>: for baseline, holdover og genopretning start og slut, antal sampler samt middelværdien, rms, den største og slutværdien af tidsfejlen.

seg-cd11d0838c44 = <b><c1/></b>: hver maske, du navngav, målt på det trin, dens betingelse angiver. En maske, der er skrevet til et låst ur, måles på baseline; en, der er skrevet til holdover eller et autonomt ur, måles på holdoveren. Hver kontrol har sin grænse, den målte værdi, marginen og den tabel, den er afskrevet fra. En maske, der kræver en længere optegnelse, end trinnet gav, er <b>INCOMPLETE</b> og bliver aldrig ekstrapoleret; en, som motoren ikke kan evaluere for optegnelsens sampleinterval, er <b>NOT-EVALUATED</b> med begrundelsen.

seg-cb54e67ca4eb = <b><c1/></b>: den brøkdelsfrekvensforskydning, som systemet holdt (hældningen på en mindste kvadraters linje gennem holdoverens tidsfejl, i ns/s, hvilket er dele pr. milliard), resten omkring den linje, den største absolutte tidsfejl og hvornår den opstod, samt trinnet i det øjeblik, referencen blev fjernet.

seg-daa40ac07396 = <b><c1/></b>: ePRTC-A-holdoverindhyllingen i ITU-T G.8272.1 Tabel { "3" }, ud fra <c2/>, med det tidspunkt, hvor den første gang overskrides.

seg-cd480a1bf901 = <b><c1/></b>: tiden efter fjernelsen, hvor hvert tidsfejlsbudget første gang overskrides.

seg-007a0393cb39 = <b><c1/></b>: om <c2/> kom inden for båndet og blev der i opholdstiden, hvor længe efter GNSS vendte tilbage det begyndte, spidsen efter genoprettelsen og det største trin mellem på hinanden følgende sampler under genopretningen.

seg-199497dfcc09 = <b><c1/></b>: MTIE og TDEV for baseline- og holdovertrinnene.

seg-ce00a41a322f = <b><c1/></b>: en opsummering på ét ord pr. trin.

seg-c09fc305ead1 = Hvert tal bærer sin enhed og hvor det kom fra, i rapportens <c1/>-blok.

seg-5d87a772c132 = Ordene og grænserne

seg-0810b24c6f3e = Resultatet er <b>målt mod masken</b>. Maskerne er afskrevet fra frit tilgængelige ITU-T-anbefalinger (de samme tabeller som typen <c1/>, opført i <a1><c2/></a1>), og hver post, som anbefalingerne lader stå "for further study", er udeladt og ikke udfyldt. Kshana siger ikke, at et ur eller et system lever op til eller er godkendt i forhold til en anbefaling, og det gør rapporten heller ikke.

seg-527189cf37c6 = <b>MODELLED.</b> Trinlogikken, linjetilpasningen og genopretningsreglen er kontrolleret på optegnelser bygget ud fra formler, hvis svar er kendt før kørslen; ingen laboratorieholdover er scoret mod en ekstern uafhængig reference, og ingen partner eller noget laboratorium har aftalt noget. Der ville være brug for et tidslaboratorium, før noget tal for en urklasse kan opgraderes.

seg-ad8160fbed46 = <b>Hvad der ikke er dækket</b>, angivet i hver rapport: om GNSS virkelig blev fjernet og genoprettet på de angivne tidspunkter; ethvert trin, operatøren ikke optog; masker defineret gennem et filter på { "0.1" } Hz for en optegnelse, der er samplet langsommere end én gang i sekundet; instrumentets egen måleusikkerhed; og enhver procedure i en anbefaling ud over en tidsfejlsoptegnelse (temperaturprofiler, belastning af pakkenetværk).

seg-cf681db42f05 = <b>Genopretningsbåndet er testens eget valg.</b> Standarden på { "100" } ns er den maksimale absolutte tidsfejl for en PRTC-A (ITU-T G.8272); det er en praktisk linje og ikke et krav i nogen anbefaling til genopretning.

seg-4ce2f2052df4 = <b>Ingen sendevej.</b> Kshana læser filer. Det genererer ikke et signal, og fjernelse af GNSS i et laboratorium sker med laboratoriets eget udstyr og under dets egen tilladelse.

seg-0cff831a8444 = <c1/> er en scenarietype, så den kører overalt, hvor typer kører: <c2/>, Rust-API'et (<c3/>), Python-bindingen (<c4/>), WebAssembly- og npm-builden (inline <c5/> eller <c6/>; filnøglerne er ikke tilgængelige dér), MCP-serveren (<c7/>, kun inline indhold) og Kshana Studios scenarieafvikler. De to scenariefiler er medfølgende (<c8/>).

seg-432c07a8e6f5 = <s1>Forrige</s1>Vildledt tid

seg-8499ae539222 = <s1>Næste</s1>Urlogformater
