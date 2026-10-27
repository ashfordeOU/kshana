# docs--timing-hil: translations (nb)

seg-f8cf777c0caa = Flater

seg-f2ce7fc60cdf = Format

seg-d00b65801e9b = Trinn

seg-0d580ea8043d = En holdover-test skåret fra en tidsfeilrekke, fra en ekte kjøring av motor v{ $version } på scenarios/holdover-test-example.toml ({ "601" } sampler hvert { "5" } s). GNSS fjernes av operatøren ved { "600" } s og gjenopprettes ved { "2400" } s; tidsfeilen driver til { "299" } ns ved slutten av holdover, forbi budsjettet på { "100" } ns etter { "675" } s, og går tilbake innenfor båndet på { "100" } ns { "70" } s etter gjenopprettingen. Vurderinger: grunnlinjemasker PASS, holdover-masker FAIL, holdover-envelope FAIL, gjenoppretting RECOVERED. Målt mot masken, ikke en godkjenning. Tidene er operatørens erklæring, ikke verifisert av Kshana. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en tjeneste for liv og sikkerhet.

seg-7a1246297c82 = Kilde: <c1/>

seg-6ea3dec83080 = Tidssynkronisering med maskinvare i løkken: trekk ut antennen, skår holdoveren

seg-5901f0b26939 = Telekom- og kraftoperatører tester et tidssynkroniseringssystem ved å ta GNSS bort og se hva klokken gjør. Kshana gjør ikke det for dem, og rører ikke utstyret deres. Den leser tidsfeilregistreringen operatørens egne instrumenter har laget, deler den ved de to tidspunktene operatøren oppgir, og <b>måler hvert trinn mot offentlige ITU-T-masker</b>. Scenariotypen er <a1><c1/></a1>; eksempelscenarioene er <c2/> og <c3/>.

seg-daf4b071bad0 = Dette er maskinvaresikkerhet <b>trinn { "1" }</b>: passivt, bare mottak, ingen RF fra Kshana (<a1><c1/></a1>). Veiledende programvare, ikke typegodkjent utstyr. Ingen har vurdert, godkjent eller gjennomgått denne prosedyren, og den sier ingenting om hvorvidt et system oppfyller en anbefaling.

seg-da0c48bbe011 = Prosedyren

seg-e753ca7a1c99 = Operatøren utfører fire trinn. Kshana utfører ingen av dem.

seg-0c338b956741 = Hva operatøren gjør

seg-ebd95b343349 = Hva registreringen viser

seg-03999de98059 = { "1" }. Grunnlinje

seg-730f2037d22a = Lar systemet gå låst til GNSS så lenge testen trenger (og noterer hvor mange dager det hadde vært låst før).

seg-f45aae4139bd = Tidsfeilen mens systemet er disiplinert.

seg-0f050dcede80 = { "2" }. GNSS fjernes

seg-50c0df832eda = Fjerner GNSS fra systemet under test, for eksempel antennekabelen ved mottakeren eller utgangen fra laboratoriets egen simulator, og <b>skriver ned tidspunktet</b>. Sjekk mottakerprodusentens håndbok først: noen mottakere gir strøm til antennen, og noen trenger en avslutningsmotstand på den åpne porten.

seg-e371e7e357e3 = Øyeblikket tidsfeilen begynner å vandre.

seg-f05dc0acb396 = { "3" }. Holdover

seg-a98186503e0f = Lar systemet gå på sin egen oscillator i den planlagte tiden.

seg-1da66cdca856 = Systemets holdover.

seg-61197c9bad91 = { "4" }. Gjenoppretting

seg-75af1f4fec83 = Gjenoppretter GNSS og <b>skriver ned tidspunktet</b>.

seg-1259d36fc78c = Tidsfeilen som kommer tilbake (eller ikke).

seg-c09b1ea8f1a4 = To ting operatøren må gjøre, fordi Kshana ikke kan:

seg-31f6c357864b = Oppgi de to tidspunktene.

seg-59f9eb10035a = <c1/> og <c2/> er operatørens oppgave. Kshana oppdager ikke fjerningen ut fra registreringen og verifiserer ikke tidspunktene. Et feil tidspunkt flytter trinngrensene og dermed resultatet.

seg-6d0d3186fbe3 = <b>Bruk den samme klokken for registreringen og tidspunktene.</b> For en klokkelogg starter tidsaksen ved den første avlesningen, så de to tidspunktene er sekunder fra første linje i loggen.

seg-bd181a831803 = Hva som skal registreres

seg-52758c10be0a = Hvilken som helst av disse, gjennom de eksisterende leserne for <c1/> (<a1><c2/></a1>):

seg-fef0034cb88b = Instrument

seg-ad6f33d70f3f = Hvordan registreringen lages

seg-ef7f547609ad = linuxptp <c1/> (servoen i slave- eller boundary-klokken)

seg-f548a2ae96e5 = kjør med <c1/> og behold linjene <c2/>

seg-9a3b58be1b0b = linuxptp <c1/>

seg-77255f8f5fef = linjene <c1/>

seg-2cf9256bd790 = linuxptp <c1/>

seg-c667a97b92a8 = linjene <c1/>

seg-ed305bcea4f8 = chrony <c1/>

seg-021b760aae59 = <c1/> i <c2/>

seg-a7f2d72a5cb7 = chrony <c1/>

seg-a70952a099d5 = <c1/> i <c2/>

seg-6ad29120ffe7 = en TAPR TICC-teller

seg-32f703bfcab7 = tidsstempelmodus mot referansen

seg-6862a9ac9a68 = en TimeLab ASCII-eksport

seg-b5e7e3a272d6 = fase i en oppgitt enhet

seg-8af4aac4426f = en RINEX-klokkefil

seg-21d5c43719f2 = én klokke

seg-3a82b5295ab1 = alt annet

seg-6bebda4a3c6c = <c1/> eller <c2/>

seg-9a443cc0c444 = <c1/>-par, jevnt samplet

seg-b8d1d45df70b = <b>Hva registreringen måler, har betydning.</b> En servolog (linuxptp, chrony) registrerer forskyvningen daemonen målte og korrigerer: det er tidsfeilen som er igjen under servostyring, ikke en uavhengig måling av klokken mot UTC. Under holdover-trinnet i en test som virkelig fjerner referansen, viser en servolog fortsatt hva daemonen trodde, og det kan avvike fra den sanne feilen. En TICC eller en annen teller mot en uavhengig referanse er den sterkere registreringen; oppgi hvilken du brukte når du rapporterer resultatet.

seg-6d4e25914d1c = Scenarioet

seg-ca1244db2387 = Valgfrie nøkler: <c1/> (navn, <c2/>, kilde; standardverdiene for telecom-timing når de mangler) og <c3/> inne i <c4/> for å velge én kilde fra en logg som inneholder flere.

seg-38eb634b7f8f = Hva rapporten inneholder

seg-6a64755e11d6 = <b><c1/></b>: for grunnlinjen, holdoveren og gjenopprettingen: start og slutt, antall sampler og middelverdi, rms, største verdi og sluttverdi for tidsfeilen.

seg-cd11d0838c44 = <b><c1/></b>: hver maske du navnga, målt på trinnet betingelsen dens peker ut. En maske skrevet for en låst klokke måles på grunnlinjen; en skrevet for holdover eller en autonom klokke måles på holdoveren. Hver kontroll har sin grense, den målte verdien, marginen og tabellen den er overført fra. En maske som trenger en lengre registrering enn trinnet ga, er <b>INCOMPLETE</b>, aldri ekstrapolert; en som motoren ikke kan evaluere for registreringens sampleintervall, er <b>NOT-EVALUATED</b> med begrunnelse.

seg-cb54e67ca4eb = <b><c1/></b>: den fraksjonelle frekvensforskyvningen systemet holdt (stigningstallet til en minste kvadraters linje gjennom holdoverens tidsfeil, i ns/s, som er milliarddeler), restavviket rundt den linjen, den største absolutte tidsfeilen og når den oppstod, og sprangene ved fjerningen.

seg-daa40ac07396 = <b><c1/></b>: ePRTC-A-holdover-omhyllingskurven i ITU-T G.8272.1 tabell { "3" }, ut fra <c2/>, med tidspunktet den først overskrides.

seg-cd480a1bf901 = <b><c1/></b>: tiden etter fjerningen da hvert tidsfeilbudsjett først overskrides.

seg-007a0393cb39 = <b><c1/></b>: om <c2/> kom inn i båndet og ble der i hviletiden, hvor lenge etter at GNSS kom tilbake det startet, toppverdien etter gjenopprettingen og det største sprang mellom påfølgende sampler under gjenopprettingen.

seg-199497dfcc09 = <b><c1/></b>: MTIE og TDEV for grunnlinje- og holdover-trinnene.

seg-ce00a41a322f = <b><c1/></b>: en oppsummering på ett ord per trinn.

seg-c09fc305ead1 = Hvert tall oppgir enheten sin og hvor det kom fra, i rapportens <c1/>-blokk.

seg-5d87a772c132 = Ordene og grensene

seg-0810b24c6f3e = Resultatet er <b>målt mot masken</b>. Maskene er overført fra ITU-T-anbefalinger som kan lastes ned fritt (de samme tabellene som typen <c1/>, oppført i <a1><c2/></a1>), og hver oppføring som anbefalingene overlater «for further study», er utelatt, ikke fylt inn. Kshana sier ikke at en klokke eller et system oppfyller eller er godkjent mot en anbefaling, og det gjør heller ikke rapporten.

seg-527189cf37c6 = <b>MODELLED.</b> Trinnlogikken, linjetilpasningen og gjenopprettingsregelen er kontrollert på registreringer bygd fra formler der svarene er kjent før kjøringen; ingen laboratorie-holdover er skåret mot en ekstern uavhengig referanse, og ingen partner eller noe laboratorium har gått med på noe. Et tidslaboratorium ville være nødvendig før noe tall per klokkeklasse kunne løftes.

seg-ad8160fbed46 = <b>Hva som ikke dekkes</b>, oppgitt i hver rapport: om GNSS virkelig ble fjernet og gjenopprettet på de oppgitte tidspunktene; ethvert trinn operatøren ikke registrerte; masker definert gjennom et { "0.1" } Hz-filter for en registrering samplet saktere enn én gang i sekundet; instrumentets egen måleusikkerhet; og enhver prosedyre i anbefalingene utover en tidsfeilregistrering (temperaturprofiler, pakkenettbelastning).

seg-cf681db42f05 = <b>Gjenopprettingsbåndet er testens eget valg.</b> Standarden på { "100" } ns er den maksimale absolutte tidsfeilen for en PRTC-A (ITU-T G.8272); det er en praktisk grense, ikke et krav i noen anbefaling for gjenoppretting.

seg-4ce2f2052df4 = <b>Ingen sendevei.</b> Kshana leser filer. Den genererer ikke et signal, og å fjerne GNSS i et laboratorium gjøres med laboratoriets eget utstyr og under dets egen tillatelse.

seg-0cff831a8444 = <c1/> er en scenariotype, så den kjører overalt der typer kjører: <c2/>, Rust-API-et (<c3/>), Python-bindingen (<c4/>), WebAssembly- og npm-bygget (innebygd <c5/> eller <c6/>; filnøklene er ikke tilgjengelige der), MCP-serveren (<c7/>, bare innebygd innhold) og Kshana Studios scenariokjører. De to scenariofilene følger med (<c8/>).

seg-432c07a8e6f5 = <s1>Forrige</s1>Bedratt tid

seg-8499ae539222 = <s1>Neste</s1>Klokkeloggformater
