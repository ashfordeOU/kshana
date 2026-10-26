# docs--hardware-safety: translations (nb)

seg-fdbb9db68f1d = ingen

seg-2015f437e669 = Kilde: <c1/>

seg-10c7eaab58c5 = Maskinvaresikkerhet: hva Kshana gjør med maskinvare, og hva den aldri gjør

seg-fe4873962140 = <b>Status: juridisk gjennomgang hos eieren venter.</b> De juridiske merknadene nedenfor er vedlikeholdernes lesning av offentlige kilder, skrevet slik at en bruker vet hvor grensene går. De er ikke juridisk rådgivning, de er ikke gjennomgått av en advokat, og lovgivningen varierer fra land til land. Les dem som en grunn til å spørre en advokat, ikke som en tillatelse.

seg-bd2fbb355834 = Kshana er veiledende programvare for forskning, simulering og testing. Den er ikke typegodkjent utstyr og vurderer eller godkjenner verken en mottaker, en klokke eller et laboratorium. Se den veiledende erklæringen i README.

seg-f27c286787b1 = Regelen

seg-88638e41faab = Mottak er produktet. Sending er aldri en del av den åpne motoren.

seg-614d381dd0d0 = Kshana inneholder ingen kode som styrer en sender. Det finnes ingen SDR-sendebane (ingen sendekall til UHD, HackRF, bladeRF eller Soapy), og ingen jamming- eller spoofing-bølgeform skrives til en fil som er ment for avspilling.

seg-2e370a1c6c4c = Filene Kshana skriver (IQ-scener, SigMF- og ION <c1/>-opptak, NMEA- og bench-eksporter) beskriver <b>simulerte, legitime</b> signaler eller bevegelser, og metadataene Kshana skriver for en scene sier at den er skrevet av <c2/> (ION <c3/>-kommentaren sier at det er en simulert scene, ikke et opptak).

seg-8ce652bc1af6 = Der et eksperiment trenger RF på en benk, produserer <b>operatørens eget utstyr</b> det, i operatørens egen skjermede kasse, under operatørens egen tillatelse. Kshana registrerer det operatøren sier ble gjort, og utleder det aldri.

seg-c74fc5d82071 = Trinn

seg-01e7633921dc = Hvert trinn sier hva Kshana gjør, hvilken maskinvare som er involvert, hvem som sender RF (hvis noen), og porten som må holde før Kshana behandler resultatet som evidens.

seg-324e16b11186 = Trinn

seg-bb269645d988 = Kshana sin rolle

seg-76c0861cbe83 = Maskinvare

seg-92ab27525ed1 = RF-utsendelse

seg-c822f981cfcf = Port

seg-00727bb577f9 = Status i { "0.38" }

seg-1c566ec98a03 = Filer: avspillingslogger, IQ, bench-eksporter, direkte NMEA eller UBX over stdin, TCP eller UDP

seg-0435986aa760 = levert

seg-56b9a4399108 = Passivt mottak: mottakere skrivebeskyttet; tidslogger (linuxptp, chrony, TICC); IMU-CSV; <c1/> på en voksende SigMF-fil

seg-608fc0a99107 = brukerens mottakere, grandmaster, SDR i mottak

seg-786d9e5ccf93 = enhver konfigurasjonsskriving til en mottaker krever en uttrykkelig <c1/>; standarden er skrivebeskyttet

seg-ab8874046283 = delvis levert: formater for tidslogger, <c1/>, <c2/>; seriell mottakerinngang er planlagt

seg-6b0a194d3f64 = Laboratorieorkestrering uten RF fra Kshana: en spesifikasjon av testforhold, operatørtrinn (trekke ut antennen, starte simulatoren) som varsles og tidsstemples, tur-retur-scoring og evidens

seg-8e2847bce9ac = simulatorer og skjermede bokser som laboratoriet eier

seg-121fe22c92ec = bare fra <b>laboratoriets</b> simulator, ledningsbundet

seg-0a704c5443c5 = en signert <c1/> (nedenfor) registrert i bevispakken; Kshana nekter å score en laboratoriekjøring uten den

seg-9e94d44cd197 = registreringen er implementert i bevispakker; nektelsen av å score uten den er det ikke ennå (det finnes ingen kommando for laboratoriekjøring)

seg-ee5333e346ad = Ledningsbundet avspilling av <b>legitime</b> GNSS IQ-scener: Kshana skriver scenefilen, og brukeren spiller den av med eget verktøy inn i en kabel med dempere og en enhet under test i en RF-kasse

seg-fa5b0f1b41f7 = brukerens SDR, dempere og kasse

seg-9049203a2a6e = bare ledningsbundet, brukerens ansvar

seg-b4392e583cb8 = ingen sendekode i den åpne motoren; bølgeformer for interferens og spoofing holdes utenfor omfanget; eksportkontrollgjennomgang; advokat

seg-ced2afbf108f = ikke i den åpne motoren; en oppgave for den kommersielle utgaven som må gjøres sammen med en advokat

seg-0f8a0fce4d20 = Lukket sløyfe med RF-maskinvare i sanntid (hardware-in-the-loop)

seg-d109f8e36ce8 = partnerens utstyr

seg-fb26b352f56e = partner

seg-38c768d5faa7 = integrer i stedet gjennom spesifikasjonen for trinn { "2" }

seg-458f37b807ba = ikke planlagt

seg-2e59d363e31b = «Levert» betyr at koden er i denne utgivelsen. Ingenting i denne tabellen sier at noe trinn har vært brukt sammen med noen partner, noe laboratorium eller noen myndighet; ingen har det.

seg-1524fb5b0aba = Prinsipper

seg-82b8ed15bbe6 = Mottak er produktet, og sending er aldri en del av den åpne koden.

seg-63c000eccfc2 = Hver maskinvareøkt gir en bevispakke med hasher av inndataene, forholdene og terskelene som ble brukt.

seg-63cc5d9513ff = En attest om ledningsbundet eller skjermet oppsett registreres, og utledes aldri.

seg-da1e4f5da956 = Tall som kommer fra maskinvare forblir <b>MODELLED</b> til en uavhengig ekstern referanse stemmer (for eksempel en referansebane fra et laboratorium eller en referanseklokke). En terskel som er fastsatt på forhånd, løsnes ikke etter en kjøring.

seg-d8e445427d02 = Antenner med kontrollerte mønstre, treghetsenheter og atomklokker i brikkestørrelse behandles som datakilder (mønstre, logger, publiserte stabilitetskurver), ikke som enheter Kshana styrer.

seg-7a22a9591fa3 = Ordbruk: et resultat er «målt mot masken» eller «gir belegg for» et krav. Kshana sier ikke at et utstyr oppfyller en standard, og ingen har vurdert eller godkjent det.

seg-913509e5d6b2 = Juridiske merknader (juridisk gjennomgang hos eieren venter)

seg-c18b68936406 = Å motta GNSS-signaler er lovlig nesten overalt. Å sende i GNSS-bånd er det ikke.

seg-070d8a8d5494 = <b>USA.</b> Forsettlig forstyrrelse av radiokommunikasjon er forbudt etter { "47" } U.S.C. §{ "333" }, og FCC håndhever mot jammere (<a1>https://www.fcc.gov/general/jammer-enforcement</a1>). En sending fra en benk kan nå utenfor benken.

seg-336b48c6f5f2 = <b>Andre steder.</b> Vedlikeholderne har ikke gjennomgått andre lands lovgivning. Fellesskapet rundt gps-sdr-sim oppgir at det er forbudt ved lov i de fleste land å sende utdataene fra den; behandle det som arbeidsantakelsen overalt hvor en advokat ikke har sagt noe annet.

seg-8d31cbd38718 = <b>Et skjermet eller ledningsbundet oppsett er en sikring, ikke en tillatelse.</b> Attesten nedenfor registrerer sikringen operatøren sier var på plass. Den gjør ikke en utsendelse lovlig.

seg-7373bfd21035 = <b>Opptak.</b> Å ta opp radiosignaler kan reise spørsmål om personvern og lovlighet enkelte steder. <c1/> og enhver opptaksoppskrift er kun for mottak, og operatøren er ansvarlig for hvor og hva de tar opp.

seg-2edf9b14e62c = <b>Eksportkontroll.</b> Programvare for hardware-in-the-loop som styrer signalgeneratorer, kan falle inn under eksportkontrollregler. Derfor ligger trinn { "3" } utenfor den åpne motoren.

seg-bcd59f201022 = <b>Ingenting her er en anbefaling eller en avtale.</b> Ingen reguleringsmyndighet, testbane, noe laboratorium eller leverandør er konsultert om dette dokumentet eller har gått med på noe i det.

seg-81091020e648 = Feltet <c1/>

seg-64918fd6895d = For trinn { "2" } og høyere har en kjøring som involverte laboratorieutstyr et <c1/>-objekt, registrert i bevispakken ved siden av hashene av inndataene. Det er en erklæring fra en navngitt operatør, ikke en måling, og Kshana verifiserer den ikke.

seg-3bf153c63fa3 = Hva som er implementert i { "0.38" }:

seg-bf212e141046 = <c1/> validerer filen og registrerer attesten i pakkens <c2/>. Manifestet dekkes av pakkens Ed25519-signatur, så registreringen kan ikke redigeres uten å bryte verifiseringen. Det samme er tilgjengelig som argumentet <c3/> i Python-funksjonen <c4/> og argumentet <c5/> i MCP-verktøyet <c6/> (nettleserbygget oppretter ikke pakker).

seg-431036f13a37 = En pakke laget uten en attest er byte for byte det den var før.

seg-4360b8fbdafb = <c1/> rapporterer attesten og sier at den er «attested by the named operator; not verified by Kshana».

seg-438bbe788314 = En attest som er ufullstendig, eller hvis <c1/> verken er <c2/> eller <c3/> (et oppsett over luften godtas ikke som en laboratoriekjøring), avvises, og ingen pakke lages.

seg-c8c40ed88dde = Hva som <b>ikke</b> er implementert ennå: regelen i trinn { "2" } om at Kshana nekter å <em>score</em> en laboratoriekjøring som mangler attest. Ingen kommando tar et flagg for laboratoriekjøring i { "0.38" }, så det er ingenting å avvise; regelen kommer med kommandoene for laboratorieorkestrering. En attest registrerer operatørens erklæring om en sikring. Den gjør ingen utsendelse lovlig, og den endrer ikke et resultats merking: en scoret laboratoriekjøring er MODELLED med mindre en ekstern referanse stemmer.

seg-b0db377bce58 = Hva dette betyr for en bidragsyter

seg-c2e215edd86c = Ikke legg til en sendebane, en sendeavhengighet eller et sendeeksempel i den åpne motoren.

seg-452b44a9ca8a = Ikke legg til en bølgeformgenerator hvis utdata er et jamming- eller spoofing-signal ment for avspilling.

seg-4df4d15a5f1c = Nye maskinvareinndata er skrivebeskyttet som standard; skriving krever et uttrykkelig flagg og en linje i denne filen.

seg-ee5f1fa9b822 = En ny kommando som berører maskinvare kommer på hver flate eller merkes N/A med en begrunnelse i <a1><c1/></a1>, og oppgir trinnet sitt her.

seg-7d65c3565acd = <s1>Forrige</s1>Formater for klokkelogger

seg-82eb53d4efbd = <s1>Neste</s1>Integritet og sikkerhet

seg-8a78e520fc9e = Feltet lab-attestation
