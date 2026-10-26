# docs--hardware-safety: translations (da)

seg-2015f437e669 = Kilde: <c1/>

seg-10c7eaab58c5 = Hardwaresikkerhed: hvad Kshana gør med hardware, og hvad den aldrig gør

seg-fe4873962140 = <b>Status: ejerens juridiske gennemgang afventer.</b> De juridiske noter nedenfor er vedligeholdernes læsning af offentlige kilder, skrevet, så en bruger ved, hvor grænserne går. De er ikke juridisk rådgivning, de er ikke gennemgået af en jurist, og lovgivningen er forskellig fra land til land. Læs dem som en grund til at spørge en jurist, ikke som en tilladelse.

seg-bd2fbb355834 = Kshana er vejledende software til forskning, simulering og test. Den er ikke typegodkendt udstyr og vurderer eller godkender hverken en modtager, et ur eller et laboratorium. Se den vejledende erklæring i README.

seg-f27c286787b1 = Reglen

seg-88638e41faab = Modtagelse er produktet. Udsendelse er aldrig en del af den åbne motor.

seg-614d381dd0d0 = Kshana indeholder ingen kode, der styrer en sender. Der er ingen SDR-sendesti (intet sendekald til UHD, HackRF, bladeRF eller Soapy), og ingen jamming- eller spoofingsignalform skrives til en fil, der er beregnet til afspilning.

seg-2e370a1c6c4c = Filer, som Kshana skriver (IQ-scener, SigMF- og ION <c1/>-optagelser, NMEA- og bench-eksporter), beskriver <b>simulerede, legitime</b> signaler eller bevægelser, og de metadata, Kshana skriver for en scene, siger, at den er skrevet af <c2/> (ION <c3/>-kommentaren siger, at det er en simuleret scene, ikke en optagelse).

seg-8ce652bc1af6 = Hvor et eksperiment har brug for RF på en forsøgsbænk, frembringer <b>operatørens eget udstyr</b> det, i operatørens egen afskærmning og under operatørens egen tilladelse. Kshana registrerer, hvad operatøren siger er gjort, og udleder det aldrig.

seg-c74fc5d82071 = Trin

seg-01e7633921dc = Hvert trin angiver, hvad Kshana gør, hvilken hardware der er involveret, hvem der udsender RF (hvis nogen), og den betingelse, der skal være opfyldt, før Kshana vil behandle resultatet som evidens.

seg-324e16b11186 = Trin

seg-bb269645d988 = Kshanas rolle

seg-76c0861cbe83 = Hardware

seg-92ab27525ed1 = RF-emission

seg-c822f981cfcf = Betingelse

seg-00727bb577f9 = Status i { "0.38" }

seg-1c566ec98a03 = Filer: afspilningslogfiler, IQ, bench-eksporter, live NMEA eller UBX over stdin, TCP eller UDP

seg-0435986aa760 = leveret

seg-56b9a4399108 = Passiv modtagelse: modtagere kun med læseadgang; tidslogfiler (linuxptp, chrony, TICC); IMU-CSV; <c1/> på en voksende SigMF-fil

seg-608fc0a99107 = brugerens modtagere, grandmaster, SDR i modtagetilstand

seg-786d9e5ccf93 = enhver konfigurationsskrivning til en modtager kræver en eksplicit <c1/>; standarden er kun læsning

seg-ab8874046283 = delvist leveret: formater for tidslogfiler, <c1/>, <c2/>; seriel modtagerinput er planlagt

seg-6b0a194d3f64 = Laboratorieorkestrering uden RF fra Kshana: en specifikation af testbetingelser, operatørtrin (antennefrakobling, simulatorstart) med prompt og tidsstempel, scoring og evidens i en rundtur

seg-8e2847bce9ac = simulatorer ejet af laboratoriet, afskærmede bokse

seg-121fe22c92ec = kun fra <b>laboratoriets</b> simulator, ledningsbåret

seg-0a704c5443c5 = en signeret <c1/> (nedenfor) registreret i bevispakken; Kshana nægter at score en laboratoriekørsel uden den

seg-9e94d44cd197 = registreringen er implementeret i bevispakker; nægtelsen af at score uden den er det endnu ikke (der findes ingen kommando til laboratoriekørsler)

seg-ee5333e346ad = Ledningsbåret afspilning af <b>legitime</b> GNSS IQ-scener: Kshana skriver scenefilen, og brugeren afspiller den med sit eget værktøj ind i et kabel med dæmpere og et testobjekt i en RF-afskærmning

seg-fa5b0f1b41f7 = brugerens SDR, dæmpere, afskærmning

seg-9049203a2a6e = kun ledningsbåret, brugerens ansvar

seg-b4392e583cb8 = ingen sendekode i den åbne motor; signalformer til interferens og spoofing forbliver uden for omfanget; eksportkontrolgennemgang; jurist

seg-ced2afbf108f = ikke i den åbne motor; et punkt for den kommercielle udgave, der skal gennemføres sammen med en jurist

seg-0f8a0fce4d20 = Lukket RF-hardware-in-the-loop i realtid

seg-d109f8e36ce8 = partnerudstyr

seg-fb26b352f56e = partner

seg-38c768d5faa7 = integrer i stedet gennem specifikationen for trin { "2" }

seg-458f37b807ba = ikke planlagt

seg-2e59d363e31b = "Leveret" betyder, at koden er i denne udgivelse. Intet i denne tabel siger, at noget trin er brugt sammen med nogen partner, noget laboratorium eller nogen myndighed; det er ingen af dem.

seg-1524fb5b0aba = Principper

seg-82b8ed15bbe6 = Modtagelse er produktet, og udsendelse er aldrig i den åbne kode.

seg-63c000eccfc2 = Hver hardwaresession giver en bevispakke med hashværdier af inputtet, betingelserne og de tærskler, der er brugt.

seg-63cc5d9513ff = En attestering af ledningsbåret eller afskærmet opsætning registreres, aldrig udledes.

seg-da1e4f5da956 = Tal, der kommer fra hardware, forbliver <b>MODELLED</b>, indtil en uafhængig ekstern reference er enig (for eksempel en referencebane fra et laboratorium eller et referenceur). En tærskel, der er fastsat på forhånd, løsnes ikke efter en kørsel.

seg-d8e445427d02 = Antenner med kontrollerede mønstre, inertienheder og atomure i chipstørrelse behandles som datakilder (mønstre, logfiler, offentliggjorte stabilitetskurver), ikke som enheder, Kshana styrer.

seg-7a22a9591fa3 = Formulering: et resultat er "målt mod masken" eller "leverer belæg for" et krav. Kshana siger ikke, at et udstyr lever op til en standard, og ingen har vurderet eller godkendt det.

seg-913509e5d6b2 = Juridiske noter (ejerens juridiske gennemgang afventer)

seg-c18b68936406 = At modtage GNSS-signaler er lovligt næsten overalt. At udsende i GNSS-bånd er det ikke.

seg-070d8a8d5494 = <b>USA.</b> Forsætlig forstyrrelse af radiokommunikation er forbudt efter { "47" } U.S.C. §{ "333" }, og FCC håndhæver mod jammere (<a1>https://www.fcc.gov/general/jammer-enforcement</a1>). En udsendelse fra en forsøgsbænk kan række ud over bænken.

seg-336b48c6f5f2 = <b>Andre steder.</b> Vedligeholderne har ikke gennemgået andre landes lovgivning. Fællesskabet omkring gps-sdr-sim oplyser, at det er forbudt ved lov i de fleste lande at udsende dets output; betragt det som arbejdsantagelsen overalt, hvor en jurist ikke har sagt andet.

seg-8d31cbd38718 = <b>En afskærmet eller ledningsbåret opsætning er en sikring, ikke en tilladelse.</b> Attesteringen nedenfor registrerer den sikring, operatøren siger var på plads. Den gør ikke en emission lovlig.

seg-7373bfd21035 = <b>Optagelse.</b> Optagelse af radiosignaler kan rejse spørgsmål om privatliv og lovlighed visse steder. <c1/> og enhver optagelsesopskrift er kun til modtagelse, og operatøren er ansvarlig for, hvor og hvad der optages.

seg-2edf9b14e62c = <b>Eksportkontrol.</b> Hardware-in-the-loop-software, der styrer signalgeneratorer, kan være omfattet af eksportkontrolregler. Derfor er trin { "3" } uden for den åbne motor.

seg-bcd59f201022 = <b>Intet her er en tilslutning eller en aftale.</b> Ingen myndighed, intet testområde, intet laboratorium og ingen leverandør er blevet hørt om dette dokument eller har accepteret noget i det.

seg-81091020e648 = Feltet <c1/>

seg-64918fd6895d = For trin { "2" } og derover bærer en kørsel, der involverede laboratorieudstyr, et <c1/>-objekt, registreret i bevispakken ved siden af hashværdierne af inputtet. Det er en erklæring fra en navngiven operatør, ikke en måling, og Kshana verificerer den ikke.

seg-3bf153c63fa3 = Hvad der er implementeret i { "0.38" }:

seg-bf212e141046 = <c1/> validerer filen og registrerer attesteringen i pakkens <c2/>. Manifestet er dækket af pakkens Ed25519-signatur, så registreringen ikke kan redigeres uden at bryde verifikationen. Det samme er tilgængeligt som argumentet <c3/> til Python-funktionen <c4/> og argumentet <c5/> til MCP-værktøjet <c6/> (browserudgaven opretter ikke pakker).

seg-431036f13a37 = En pakke lavet uden en attestering er byte for byte, hvad den var før.

seg-4360b8fbdafb = <c1/> rapporterer attesteringen og siger, at den er "attested by the named operator; not verified by Kshana".

seg-438bbe788314 = En attestering, der er ufuldstændig, eller hvis <c1/> hverken er <c2/> eller <c3/> (en opsætning over luften accepteres ikke som en laboratoriekørsel), afvises, og der oprettes ingen pakke.

seg-c8c40ed88dde = Hvad der <b>ikke</b> er implementeret endnu: reglen for trin { "2" } om, at Kshana nægter at <em>score</em> en laboratoriekørsel uden attestering. Ingen kommando tager et flag for laboratoriekørsel i { "0.38" }, så der er intet at nægte; reglen kommer med kommandoerne til laboratorieorkestrering. En attestering registrerer operatørens erklæring om en sikring. Den gør ingen emission lovlig, og den ændrer ikke et resultats mærkning: en scoret laboratoriekørsel er MODELLED, medmindre en ekstern reference er enig.

seg-b0db377bce58 = Hvad det betyder for en bidragyder

seg-c2e215edd86c = Tilføj ikke en sendesti, en sendeafhængighed eller et sendeeksempel til den åbne motor.

seg-452b44a9ca8a = Tilføj ikke en signalgenerator, hvis output er et jamming- eller spoofingsignal beregnet til afspilning.

seg-4df4d15a5f1c = Nye hardwareinput er som standard kun til læsning; en skrivning kræver et eksplicit flag og en linje i denne fil.

seg-ee5f1fa9b822 = En ny kommando, der berører hardware, kommer på alle flader eller markeres N/A med en begrundelse i <a1><c1/></a1> og angiver sit trin her.

seg-7d65c3565acd = <s1>Forrige</s1>Formater for urlogfiler

seg-82eb53d4efbd = <s1>Næste</s1>Integritet og sikkerhed

seg-8a78e520fc9e = Laboratorieattesteringsfeltet
