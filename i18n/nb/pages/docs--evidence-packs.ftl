# docs--evidence-packs: translations (nb)

seg-2247a2344710 = Betydning

seg-ade1d7072512 = se nedenfor

seg-245fe1f87b08 = Fil

seg-802d8b6f3afd = Kilde: <c1/>

seg-710e7e630acb = Bevispakker: en signert registrering av en GNSS-tillitshendelse

seg-dbc796deac2a = <b>En pakke er en teknisk registrering, ikke en juridisk vurdering.</b> Den oppgir hva motoren i { -brand } beregnet fra en oppgitt mottakerlogg under en oppgitt konfigurasjon, og lar hvem som helst kontrollere at ingenting i den ble endret i ettertid. Den sier ikke hva som forårsaket en hendelse, hvem som hadde ansvaret, om noen forpliktelse ble oppfylt, eller at loggen viser det mottakeren faktisk mottok. Manifestet og sammendraget sier begge dette.

seg-d99cb540310c = En bevispakke er til en hendelsesrapport, en forsikringsgiver eller et spørsmål fra en regulator: «hva sa systemet deres om GNSS-signalet mellom disse to tidspunktene, og kan vi stole på den registreringen?»

seg-2fa31fe443b4 = Lag en pakke

seg-983924cb2eea = For en pakke laget fra en laboratorieøkt registrerer <c1/> operatørens utsagn om oppsettet (ledningsbundet eller skjermet, demping eller kapsling, hva som sendte ut eventuell RF) i det signerte manifestet; se <a1><c2/></a1>. Det registreres som oppgitt og verifiseres aldri.

seg-f01e59c876a3 = <c1/> og <c2/> er sekunder siden første epoke i loggen, eller et ISO-8601 UTC-tidspunkt når loggen oppgir sitt eget starttidspunkt. <c3/> må ikke allerede inneholde filer. <c4/> tar et virkelig UTC-tidspunkt som <c5/> (alt annet avvises) eller <c6/>, som utelater opprettelsestidspunktet og gjør pakken byte for byte reproduserbar. Opprettelsestidspunktet er det signereren oppgir; ingenting kontrollerer det mot en klokke, og det er det det valgfrie tidsstempeltokenet er til for.

seg-c72ddd97ad0b = Nøkkelfilen inneholder et Ed25519-seed på 32 byte som { "64" } heksadesimale sifre; oppgi ditt eget (for eksempel et du har i nøkkelforvaltningssystemet ditt) eller la <c1/> lage ett. <c2/> advarer hvis filen kan leses av andre brukere. <c3/> utelater <c4/>; gi nøkkelen din et slikt navn hvis den ligger i en utsjekk.

seg-077cbd944c5d = Hva som er i en pakke

seg-7cf2608b2b2f = Strukturen til en bevispakke. En mottakerlogg (NMEA, u-blox UBX, RINEX { "3" } eller en Android-logg) og et tidsvindu går inn i kshana receiver-trust evidence, som skriver sju filer: log-slice.bin, config.json, epochs.json, summary.html, manifest.json, manifest.sig og en valgfri timestamp.tsr. Manifestet registrerer SHA-256 av hele loggen og av hver fil og en hashkjede over filene; signaturen dekker manifestet. kshana evidence verify kontrollerer signaturen, hver fils hash, kjeden og at ingen ulistet fil finnes, og avslutter med { "0" } når den er bekreftet, { "1" } når noe feilet og { "3" } når signereren ikke var festet. En pakke er en teknisk registrering, ikke en juridisk vurdering.

seg-e305279d5b11 = Innhold

seg-05107c0bd3c8 = de rå bytene fra mottakerloggen for vinduet

seg-b19ce12544a5 = scenarioet slik det ble kjørt (hver monitorterskel, hendelse og sammenligningsregel), monitorene som kjørte, kalibreringsgrunnlinjen og scenariohashen; for et fartøy også den veiledende uttalelsen alle utdata fra fartøy bærer (veiledende programvare, ikke typegodkjent navigasjonsutstyr); fra { "0.36" } også <c1/> (tabellen <c2/> som faktisk ble brukt, vekten til geometrimonitoren, hver proveniens og klassereglene). Katalognavn og innebygde nyttelaster fjernes.

seg-e3c2457161bc = hver epoke i vinduet med motorens statistikk, alarmene (årsakene) og tillitstilstanden; fra { "0.36" } også satellitt-<c1/> (god, forringet med årsaker, eller ukjent der loggen ikke gir noen satellittgeometri) og en <c2/> på hver slutning (<c3/>, <c4/>, <c5/>)

seg-2e309765271f = et selvstendig, skriptfritt sammendrag: identifikasjon, hasher, resultater, årsaker, en geometrifelt (epoker etter geometristatus) atskilt fra klassene til slutningene ({ "0.36" }), hver terskel, tabellen per epoke og begrensningene til registreringen

seg-467277f816d2 = motorversjon, vindu, opprettelsestidspunkt, loggens format og navn, <b>SHA-256 av hele loggen</b>, utsnittets område og SHA-256, signererens offentlige nøkkel og fingeravtrykk, hver fils størrelse og SHA-256, og en hashkjede over filene

seg-7a92ff70ed7f = Ed25519-signatur over de eksakte bytene i <c1/>

seg-b517814b077d = valgfritt tidsstempeltoken etter RFC { "3161" }

seg-6ad4c5f3afbe = <b>Loggutsnitt.</b> Leseren rapporterer kildens byteområde for hver epoke, så utsnittet er det minste byteområdet som rommer hver epoke i vinduet (<c1/>): NMEA, u-blox UBX, RINEX { "3" }-observasjoner og Android-logger. Det hashes som rå bytes, aldri som dekodet tekst. For en direktestrøm eller RINEX { "2" } finnes det ikke noe område; hele loggen legges da ved og manifestet sier <c2/> (vinduet begrenser hvilke epoker som rapporteres, ikke hvilke bytes som tas med). Sammendraget sier hvilket som gjelder. Et utsnitt er en registrering av vinduets bytes, ikke en selvstendig logg: for eksempel har et RINEX-utsnitt ingen filhode.

seg-c4c81cbd4981 = <b>Hashkjede.</b> Manifestet lister filene i en fast rekkefølge. <c1/>; for hver fil, <c2/> (lengde som { "4" } bytes, big-endian). Det siste leddet er <c3/>. Å omordne, fjerne eller bytte ut en fil endrer kjeden; signaturen dekker kjeden.

seg-1147c5b0d348 = Kontroller en pakke

seg-e716ddf7bcc9 = Avslutningsstatus { "0" } betyr bekreftet; { "1" } betyr at noe feilet; { "2" } betyr en bruksfeil; { "3" } betyr at pakken er intakt, men signereren ikke var festet (se nedenfor). Hver kontroll rapporterer bestått, feilet eller hoppet over, og hver feil navngis:

seg-f6f2cebd9cb0 = Feilkode

seg-312a5d784f42 = manifestet kan ikke leses

seg-6f1b5d9d6711 = ingen signatur, ikke en heksadesimal signatur med små bokstaver på 64 byte, eller den lar seg ikke bekrefte over <c1/>

seg-129b78f142f1 = nøkkelen er ikke gyldig, eller er ulik den du oppga

seg-c86b25543d55 = en oppført fil mangler eller er ulik manifestet; filen navngis

seg-f98d26abf045 = en fil er i pakken, men ikke i manifestet

seg-842bac6a9e69 = et ledd er ikke det inndataene gir; filen navngis

seg-413034467a64 = manifestet motsier seg selv eller <c1/>

seg-ef4bfbedca33 = med <c1/>: loggen du har, er ikke den som ble registrert, eller utsnittet er ikke det området av den

seg-dcd686ac77f7 = Å endre én byte i en hvilken som helst fil gjør at kontrollen feiler med tilsvarende årsak: en endret artefakt rapporteres som at hashen til den filen ikke stemmer, og ingenting annet; et endret manifest feiler signaturen. Å beregne hasher og kjeden på nytt etter å ha redigert en fil hjelper ikke uten signeringsnøkkelen; da feiler bare signaturen.

seg-066fe7c07bf6 = <b>Fest nøkkelen.</b> Uten <c1/> beviser en pakke bare at den er intakt mot nøkkelen den selv navngir, som hvem som helst kan generere. Kontrollen avslutter da med { "3" } og sier «INTACT, BUT THE SIGNER IS NOT PINNED» i stedet for «VERIFIED»; <c2/> godtar pakkens egen nøkkel bevisst og skriver ut «VERIFIED against the key the pack names itself (signer NOT pinned; pass --pubkey)». Hent signererens offentlige nøkkel fra signereren via en vei du stoler på (ikke fra pakken) og oppgi den med <c3/>: { "64" } heksadesimale sifre eller filen <c4/>. Å oppgi den private nøkkelen ved en feiltakelse gjenkjennes og avvises. Fingeravtrykket (de første { "128" } bitene av nøkkelens SHA-256, { "32" } heksadesimale sifre) skrives ut for sammenligning med øyet; å feste hele nøkkelen er den pålitelige veien.

seg-a01c7ba606c9 = Pakkeformat og kontrollprosedyre (normativ)

seg-fa43e16b6aba = Dette avsnittet er spesifikasjonen en uavhengig kontrollør skrives fra. Ord med store bokstaver er krav. En pakke er en katalog (eller et hvilket som helst kart fra filnavn til bytes) med filer som heter nøyaktig som nedenfor; en kontrollør arbeider på bytene i hver fil slik de er lagret og serialiserer aldri noe på nytt.

seg-1fbabb3f1092 = <b>Filer.</b> Artefaktfilene, i denne faste rekkefølgen, er <c1/>, <c2/>, <c3/>, <c4/>. En pakke har også <c5/> og <c6/>, og KAN ha <c7/>. Ethvert annet navn er en <em>ulistet fil</em>.

seg-3ed6e38ad2ee = <b>Hex.</b> Hver heksadesimale streng er bare små bokstaver <c1/>, uten mellomrom; store bokstaver godtas ikke. SHA-256-verdier er { "64" } sifre, den offentlige nøkkelen er { "64" } sifre, signaturen er { "128" } sifre.

seg-6609210d003a = <b><c1/>.</b> 128-sifret heksadesimal med små bokstaver for Ed25519-signaturen på 64 byte (RFC { "8032" }, den rene Ed25519-ordningen) over de eksakte bytene i <c2/>, etterfulgt av nøyaktig én <c3/> og ingenting annet. Signaturen SKAL kontrolleres strengt: en signatur der S-verdien ikke er mindre enn gruppeordenen L, er ugyldig.

seg-b163e9f5db66 = <b><c1/>.</b> Et UTF-8 JSON-objekt. Medlemmene (en kontrollør SKAL finne hvert med den oppgitte JSON-typen; ytterligere medlemmer ignoreres):

seg-ace92bcbfd8a = medlem

seg-04f69a0edb2f = type

seg-45425f378b61 = betydning

seg-6940543aa3c0 = streng

seg-48d303baac62 = SKAL være lik <c1/>

seg-6e57561e7f01 = beskrivende

seg-abec93a4a488 = streng eller null

seg-7d059c0b6372 = opprettelsestidspunkt, beskrivende

seg-507d53a53380 = objekt <c1/>

seg-bb2bcbbf404a = tall, sekunder

seg-64572c65426f = ikke-negativt heltall

seg-14d421e391dd = antallet oppføringer i JSON-matrisen i <c1/>

seg-f5e7215e6835 = objekt

seg-a4117217030c = <c1/> streng, <c2/> streng, <c3/> hex, <c4/> ikke-negativt heltall, <c5/> streng eller null, og <c6/>

seg-02389e71a339 = <c1/> (nøyaktig <c2/> eller <c3/>; enhver annen verdi gjør manifestet misdannet), <c4/> og <c5/> ikke-negative heltall (byteforskyvninger, slutt eksklusiv), <c6/> hex

seg-6c9176965aae = <c1/> streng (<c2/>), <c3/> hex ({ "32" } bytes), <c4/> streng

seg-dcba59304030 = matrise av objekter

seg-e42ed5e07430 = ett per artefaktfil, i den faste rekkefølgen: <c1/> streng, <c2/> streng, <c3/> ikke-negativt heltall, <c4/> hex, <c5/> hex

seg-b79c9500b744 = hex

seg-697592bd3757 = det siste leddet

seg-9da5d92757bd = objekt, valgfritt

seg-2032c208038d = finnes bare i en pakke laget fra en laboratorieøkt (<c1/>): operatørens utsagn <c2/>, <c3/>, <c4/>, <c5/> (<c6/> eller <c7/>), <c8/> eller <c9/>, <c10/>, <c11/> og eventuelt <c12/>, registrert som oppgitt. Det dekkes av manifestsignaturen og verifiseres aldri; en kontrollør rapporterer det som «attested by the named operator; not verified by Kshana». Fraværende ellers, og en pakke uten det er uendret

seg-9411be425a80 = <c1/> er de første { "32" } heksadesimale sifrene i SHA-256 over de { "32" } bytene i den offentlige nøkkelen.

seg-80e55f2d3496 = Hashkjede.

seg-9346fe50efac = <c1/> er SHA-256 av de { "23" } ASCII-bytene <c2/>. For hver artefakt i rekkefølge, <c3/>, der <c4/> tas fra manifestets registrerte <c5/> for den artefakten (så kjeden er en egenskap ved manifestet og kontrolleres mot det, ikke mot filene).

seg-9dd985d8cb03 = <b>Prosedyre.</b> En kontrollør utfører disse trinnene i rekkefølge og samler hver feil; resultatet er <em>mengden</em> av feil, hver en <c1/> og, der det er oppgitt, filen <c2/>. Den SKAL IKKE stoppe ved den første feilen unntatt der det er oppgitt. <c3/> er den offentlige nøkkelen kontrolløren ble bedt om å stole på, hvis noen.

seg-abb1d2635143 = Ingen <c1/>: feil <c2/>; stopp.

seg-73a4aeb463e8 = Hvis <c1/> ikke er et JSON-objekt med hvert medlem ovenfor i de oppgitte typene (inkludert <c2/>-oppføringer med hvert medlem, og <c3/>): feil <c4/>. Ellers, hvis <c5/> ikke er verdien ovenfor: <c6/>.

seg-36c9df2abf34 = Signaturfase. Denne fasen utføres uansett om manifestet var lesbart. Hvis manifestet var lesbart, er den <em>navngitte nøkkelen</em> <c1/>; hvis den ikke er { "64" } heksadesimale sifre med små bokstaver, feil <c2/> (ingen navngitt nøkkel); ellers, hvis <c3/> ikke er fingeravtrykket av den, feil <c4/> (nøkkelen forblir brukbar). Hvis både en <c5/> og en navngitt nøkkel finnes og er ulike: feil <c6/>. <em>Kontrollnøkkelen</em> er <c7/> hvis en ble oppgitt, ellers den navngitte nøkkelen hvis det finnes en; med ingen av dem finnes ingen kontrollnøkkel (dette gjelder også alle tilfeller der manifestet ikke var lesbart og ingen <c8/> ble oppgitt). Hvis det ikke finnes noen <c9/>: <c10/>. Ellers, hvis filen ikke er nøyaktig { "128" } heksadesimale sifre med små bokstaver pluss én <c11/>: <c12/>. Ellers, hvis det finnes en kontrollnøkkel som ikke er en gyldig Ed25519-koding av en offentlig nøkkel: <c13/>. Ellers, hvis det finnes en kontrollnøkkel og signaturen ikke lar seg bekrefte strengt over bytene i <c14/> (uansett hva de er): <c15/>. (Uten kontrollnøkkel kontrolleres ikke signaturen, og ingen feil heves for det.)

seg-3dbe07af8fa8 = Hvis manifestet ikke var lesbart (trinn { "2" } ga <c1/>): stopp her.

seg-b7e03ef2dea5 = Artefakter. Hvis navnene i <c1/> ikke er nøyaktig de fire ovenfor i rekkefølge: <c2/>. Deretter, for hver manifestoppføring i rekkefølge: hvis pakken ikke har noen fil med det navnet, <c3/> (navn); ellers, hvis lengden er ulik <c4/>, <c5/> (navn); og, uavhengig av det, hvis SHA-256 av filen er ulik <c6/>, <c7/> (navn).

seg-24cda5a1d9d8 = Ulistede filer: for hver fil i pakken bortsett fra <c1/>, <c2/>, <c3/> og navnene i manifestets <c4/>: <c5/> (navn).

seg-d103ade9a7c7 = Kjede. Gå gjennom manifestets <c1/> i rekkefølge fra <c2/>. Hvis en oppførings <c3/> ikke er { "64" } heksadesimale sifre med små bokstaver: <c4/> og kjeden forlates (ingen kontroll av toppen). Ellers beregnes leddet; hvis det er ulikt oppførings <c5/>: <c6/> (navn). Etter gjennomgangen, hvis kjeden ikke ble forlatt og det siste leddet er ulikt <c7/>: <c8/>.

seg-be9fade3f879 = Utsnitt og epoker. Heve <c1/> (høyst én gang per årsak, og en kontrollør rapporterer koden én gang uansett hvor mange årsaker som gjelder) hvis noe av følgende: <c2/>; <c3/>; oppføringen <c4/> har <c5/> ulik <c6/>; den oppføringens <c7/> er ulik <c8/>; eller <c9/> er <c10/> og noe av <c11/>, <c12/>, <c13/>. Hvis <c14/> finnes og tolkes som en JSON-matrise med lengde ulik <c15/>: <c16/>.

seg-0dc49ed14c1f = Full logg. Bare hvis kontrolløren fikk de opprinnelige logbytene: hvis SHA-256 av dem er ulik <c1/>, <c2/>; ellers, hvis området <c3/> ikke ligger innenfor loggen eller loggens bytes der er ulike <c4/>, <c5/>.

seg-a7f787d6e6df = Tidsstempel. Uten <c1/>: hvis kontrolløren ble bedt om å kreve ett, <c2/>; ellers ingenting. Med ett: hvis det ikke kan leses som et token eller svar etter RFC { "3161" } (se nedenfor), <c3/>; ellers, hvis meldingsavtrykket ikke er hashen, i avtrykkets egen algoritme (SHA-256, SHA-384 eller SHA-512), av bytene i <c4/>: <c5/>.

seg-f7d908c6bf38 = Pakken er bekreftet nøyaktig når feilmengden er tom. Om signereren var festet, rapporteres separat og endrer ikke feilmengden.

seg-b0d74519122d = <b>Tidsstempeltoken.</b> Et token er en DER <c1/> der innholdstypen er CMS SignedData ({ "1.2.840.113549.1.7.2" }) og den innkapslede innholdstypen er <c2/> ({ "1.2.840.113549.1.9.16.1.4" }); et svar er en DER <c3/> (en <c4/> etterfulgt av tokenet) med status { "0" } eller { "1" }. Algoritmen for meldingsavtrykket i <c5/> må være SHA-256, SHA-384 eller SHA-512 med en digest av den algoritmens lengde, og <c6/> må være et virkelig UTC-kalendertidspunkt. BER med ubestemt lengde godtas ikke. Myndighetens signatur og sertifikatkjede kontrolleres bare når betrodde ankre er oppgitt (<c7/>, nedenfor).

seg-2156bf4dabb3 = Tidsstempel etter RFC { "3161" } (valgfritt)

seg-27a71ea73d7d = Et tidsstempeltoken fra en tidsstempelmyndighet viser at manifestet fantes på et tidspunkt myndigheten bekrefter. Tokenet er over <c1/>, så det etterspørres etter at pakken er laget (det finnes ingen måte å oppgi et når pakken opprettes, og <c2/> avviser et token som ikke er over nøyaktig det manifestet):

seg-7ae6e0326b65 = <c1/> leser tokenet (et bart token eller et fullt svar), kontrollerer at det ble innvilget og at meldingsavtrykket er lik hashen av <c2/>, og skriver ut tidspunktet det oppgir. Uten betrodde ankre legger den til «timestamp authority signature not verified by Kshana» og rapporterer <c3/>; kjør linjen <c4/> ovenfor for den delen. Et token med ulikt avtrykk, eller ett som ikke lar seg tolke, er en feil. Tokenets innholdstyper, avtrykkslengde og genereringstidspunkt kontrolleres for rimelighet.

seg-88359c107bf1 = Med <c1/> (ett eller flere PEM-sertifikater, alle betrodd) kontrollerer <c2/> også myndigheten, frakoblet, slik <c3/> gjør: meldingsdigesten i de signerte attributtene, signaturen (RSA PKCS#1 v1.5, RSA-PSS, ECDSA P-256 eller P-384), ESS-bindingen til signeringssertifikatet, signererens kritiske utvidede nøkkelbruk timeStamping, og kjeden til et selvutstedt anker, hvert sertifikat gyldig ved tokenets <c4/>. En feil rapporteres som <c5/> med den første kontrollen som feilet, og <c6/> er sann bare når alt bestod. Tilbakekalling (CRL eller OCSP) kontrolleres ikke. Denne kontrolløren stemmer overens med OpenSSL { "3.0.13" } på { "27" } selvgenererte tilfeller (<c7/>).

seg-f534ae37f10c = <b>Tokenet ligger ved siden av det signerte manifestet, ikke inni det.</b> Ingenting i signaturen eller kjeden dekker det, så et token kan fjernes, eller et annet gyldig token settes inn, uten at signaturen feiler. <c1/> merker derfor når en pakke ikke har noe, og <c2/> gjør et manglende token til en feil (<c3/>); et innsatt token fanges bare hvis det ikke passer til manifestet. <c4/> nekter å overskrive et eksisterende token med mindre du oppgir <c5/>. Hvis et tidsstempel har betydning for deg, behold tokenet og kontrollresultatet i dine egne arkiver, og krev det.

seg-b993ef559bd0 = Fra kode

seg-de24fd02c7c2 = <c1/> er det ene inngangspunktet kommandolinjen og alle andre flater kaller for å lage en pakke: et scenario, loggens bytes (og navigasjonsfilens, for RINEX), vinduet som tekst, en tittel og et valgfritt opprettelsestidspunkt, pluss signeringsseedet, inn; filene, antall epoker, utsnittet, manifesthashen og signererens fingeravtrykk ut. Den leser ingen filer og ingen klokke, så de samme inndataene gir de samme bytene. Under den er <c2/> og <c3/> rene funksjoner: bytes inn (<c4/>, et seed på 32 byte, et <c5/> av filer), serialiserbare resultater ut (<c6/>, <c7/>). De bruker ingen filer, klokke eller prosesstilstand, og bygges for <c8/>, så flatene for Python, WebAssembly og server kaller dem uendret. Kommandolinjen er en tynn innpakning rundt dem.

seg-292a5bc48548 = Hva en pakke ikke gjør

seg-852aca7fc407 = Den kjører ikke vurderingen på nytt. Alle med hele loggen og <c1/> kan kjøre <c2/> på nytt og sammenligne med <c3/>; pakken beviser hva som ble registrert, ikke at motoren hadde rett.

seg-91639deac47d = Den beviser ikke at loggen er ekte eller fullstendig. Hashen av hele loggen knytter registreringen til én fil; hvor den filen kom fra, må operatøren fastslå.

seg-0f721c314fa1 = Den bærer ingen påstand om ytelse ved deteksjon eller avvisning av interferens.

seg-9c361736bf27 = Den er en teknisk registrering og ikke en juridisk vurdering eller en sertifisering.

seg-68bcf43b4e27 = <s1>Forrige</s1>Linjedekning

seg-09c0b5fa6e52 = <s1>Neste</s1>Optiske linker gjennom atmosfæren
