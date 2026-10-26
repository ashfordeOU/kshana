# docs--campaigns: translations (nb)

seg-f917e7fcac09 = Hva det er

seg-cae10fb9bff8 = Scenario

seg-7603033b1c87 = Kilde: <c1/>

seg-699c946d7d09 = Et enkelt scenario svarer på ett spørsmål om én situasjon. Et oppdrag er en sekvens av situasjoner, og en utformingsstudie er en familie av dem. Scenariotypen <c1/> setter de eksisterende typene sammen i én kjøring uten å implementere noen av dem på nytt: hvert medlem er en vanlig scenariotabell med sin egen <c2/>, sendt gjennom <c3/> nøyaktig slik <c4/> ville kjørt det, og kampanjen leser bare tall ut av resultatdokumentene.

seg-cb4f48673970 = En kampanje er <b>MODELLED</b>. Sammensetningsidentitetene er testet (nedenfor), men å lenke faser sammen er et modellvalg, og hver fase er bare så god som typen som kjørte den.

seg-80e367fbc391 = Kjør en som alle andre scenarioer:

seg-9f9995ebc904 = En kampanje kan inneholde en hvilken som helst kombinasjon av fire seksjoner. En uten noen kjører, og oppsummeringen sier at den ikke satte sammen noe.

seg-002ddd72b3a2 = <c1/>: et lenket oppdrag på én tidslinje

seg-e99c4453b79d = Hver fase kjører ett eller flere scenarioer over et vindu av en felles oppdragstidslinje, for eksempel en klokke i holdover og et treghetsnavigasjonssystem (INS) som går på tomgang samtidig. Utdataene fra hver kjøring leses inn i navngitte <b>kanaler</b>, plasseres ved fasens starttid og resamples på et felles rutenett (<c1/>) med nulte ordens holdt verdi: et rutenetttidspunkt får siste sample fra den eide fasens kjøring ved eller før det, og er null der ingen kjøring i den fasen gir kanalen.

seg-842b77a21c5f = Kanal

seg-b2eb598fab2a = Kilde for forhåndsinnstilling

seg-f42465f7d066 = ns

seg-fdb4600bf100 = klokkens tidsfeil

seg-aef6b877191d = vakt for tidsfeil

seg-cc989ca58f1d = kjøringens egen <c1/>

seg-5e9f7cd33017 = gjennomsnittlig effektivt forhold mellom bærebølge og støytetthet (C/N0) over de synlige satellittene

seg-af6f07319f2d = <c1/>: gjennomsnitt av <c2/>

seg-f6b4ea158327 = gulv for tapt sporing

seg-126535297c32 = <c1/>: scenarioets <c2/>, når det oppgir en

seg-f8f430695a88 = satellitter som fortsatt spores

seg-3f9a9f33010b = vertikalt beskyttelsesnivå

seg-2cfc68fa1c15 = vertikal alarmgrense

seg-d165177a255c = posisjonsfeil

seg-29651ae6be6f = terskel for posisjonsfeil

seg-c893c5e3ace5 = { "1" } så lenge en overvåker i fasen gir alarm

seg-ade1d7072512 = se nedenfor

seg-e8c7ac7d117f = <c1/> er <c2/> med mindre kjøringen setter <c3/>. Alle andre størrelser leses med en eksplisitt oppføring <c4/>: en tidsbane med én <c5/> som navngir radene (<c6/>), en verdibane som deler disse radene eller en skalar som kringkastes til hver rad (prefikset <c7/> leser kjøringens scenario i stedet for resultatet), en valgfri reduksjon (<c8/>, <c9/>, <c10/>, <c11/>) for flere verdier under én rad, en skala og en enhet for en kanal som kampanjen ikke kjenner.

seg-7d7bc5d19a61 = <b>Alarmer</b> kommer fra tre steder, kombinert med logisk ELLER innenfor en fase:

seg-74a10f5283ec = forhåndsinnstilte flagg som leses fra kjøringen: <c1/> gir alarm så lenge færre enn fire satellitter spores (typens egen definisjon av tilgjengelighet), og <c2/> gir alarm ved epoker den markerer som utilgjengelige;

seg-f22be2880015 = forhåndsinnstilte regler på fasens kanaler, evaluert <b>etter</b> <c1/>: <c2/> gir alarm så lenge den absolutte tidsfeilen overstiger <c3/>, og <c4/> så lenge posisjonsfeilen overstiger <c5/>. Eksplisitte regler settes i <c6/>;

seg-ccd94a7cb652 = alarmerende hendelser: <c1/> utløser én ved sin klokkestøttede overvåkers <c2/>, og <c3/> utløser én ved fasens start når dens fusjonerte beslutning gir alarm.

seg-f88b8ad5672f = <b>Tilstand overleveres</b> mellom faser på tre eksplisitte måter:

seg-0e3a0ee8e172 = <c1/> legger kanalens verdi ved slutten av forrige fase til denne fasens verdier for den. Klokkefasen en spoofer trakk bort, er der holdoveren starter. Å legge til forskyvningen er eksakt for klokkefase, som integrerer frekvens. For en posisjonsfeil forutsetter det at de to feilene er kollineære, som er det pessimistiske tilfellet.

seg-4db8b11391a5 = <c1/> skriver et tall fra forrige fase (<c2/> for en kanals sluttverdi, eller en hvilken som helst resultatbane fra en tidligere kjøring) inn i en punktdelt nøkkel i denne fasens scenario før det kjøres, med valgfri skala og forskyvning.

seg-fdd5aa8b9627 = <c1/> avslutter fasen ved et tidspunkt en kjøring har beregnet, begrenset til <c2/>. Det medfølgende oppdraget avslutter spoofingfasen ved <c3/>.

seg-cdd64676f509 = <c1/> dropper de første sekundene av en kjørings egen tidslinje (en oppvarming) før fasetid null.

seg-d48bcd9890d3 = Det medfølgende oppdraget

seg-52fc5abca41f = <c1/> kjører { "18" } medlemsscenarioer over seks faser på et rutenett med { "10" } s:

seg-baea4e05ad26 = Fase

seg-9d3ee6a5613e = Kjøringer

seg-87fbeeb9abb9 = Hva tidslinjen viser

seg-82bebc2bb038 = nominell, { "600" } s

seg-cf54dae64cb7 = <c1/>, <c2/> (ingen jammer), <c3/>

seg-5cb80e4a7d4d = tidsfeil { "0" } ns; C/N0 { "43.0" } dB-Hz mot et gulv på { "25" } dB-Hz; vertikalt beskyttelsesnivå { "9.1" } til { "21.6" } m mot en alarmgrense på { "50" } m

seg-13c92a72544a = jamming, { "600" } s

seg-f9c01304734d = det samme, jammer på -30 dBW, { "1" } km

seg-27d3b65152b0 = C/N0 faller til { "27.7" } dB-Hz, alle { "8" } satellitter spores fortsatt

seg-6a052db03815 = spoofing, avsluttet ved { "370" } s av <c1/>

seg-89856c1f83f8 = <c1/> (tidsrampe på { "0.1" } ns/s), <c2/>, <c3/>

seg-cfcdd96b1132 = tidsfeilen øker gradvis til { "36" } ns. Radiofrekvensdetektoren gir alarm ved fasens start, den klokkestøttede overvåkeren ved { "370" } s

seg-92c8a76b84c2 = holdover, { "1800" } s

seg-8a6e0b2898d1 = <c1/> (nektet, bærer med seg { "37.0" } ns), <c2/> (taktisk enhet på tomgang), <c3/> ved { "10" } dBW

seg-1948491e25ec = alle satellitter tapt (C/N0 omtrent -12 dB-Hz); tidsfeil { "36.4" } til { "62.7" } ns mot vakten på { "50" } ns; posisjonsfeil opptil { "24" } km

seg-93e59087dd44 = integrity-alarm, { "600" } s

seg-f28f37baf8fe = <c1/> (bærer med seg { "59.6" } ns), <c2/> og <c3/> med en maske på { "25" } deg

seg-83d890c819f8 = { "5" } satellitter spores; beskyttelsesnivå { "19" } til { "135" } m, mangler ved { "18" } av { "60" } rutenetttidspunkter; den overførte tidsfeilen, { "52.1" } til { "61.7" } ns, ligger fortsatt over vakten på { "50" } ns, så alarmen er oppe gjennom hele fasen

seg-1ab40b7893db = recovery, { "600" } s

seg-181d2a2f800b = tidsfeilen er tilbake til { "0" } ns; alarmen er stille

seg-26ef3dc422ff = Integritetskjøringene bruker eksempelet <c1/> sitt eget brukerspor (et sirkulært spor i { "0.4" } km høyde), ikke jammingmottakerens faste sted, og masken på { "25" } deg står for den delvise himmelen til en mottaker som gjenfanger signaler. Dette er scenariovalg, oppgitt i filen.

seg-03ae98f17988 = Et oppdrag drevet av L-båndspekteret

seg-5daf8c8fdd83 = <c1/> kjører { "8" } medlemsscenarioer over tre faser på et rutenett med { "1" } s, der C/N0 for GPS L1 C/A og Galileo E1 leses fra typen <c2/> (se <a1>SPECTRUM.md</a1>) i stedet for fra typen <c3/> sin tabell per satellitt. Jammerne er de i <c4/>.

seg-7f34a00af961 = onset, avsluttet ved { "10" } s av <c1/>

seg-471ec0d86f76 = <c1/>, <c2/> (chirp fra { "10" } s), <c3/>

seg-00b032242ebc = L1 C/A { "43.48" } og E1 { "44.73" } dB-Hz; fasen slutter ved spektrumkjøringens eget første tap av L1 C/A (<c1/>); beskyttelsesnivå { "21.6" } m mot { "50" } m

seg-50220d719d5d = holdover, { "600" } s

seg-50de7cd69ac0 = <c1/> (nektet, bærer med seg onset-feilen, her { "0" } ns), <c2/> (chirp på)

seg-1d59e94d94e5 = L1 C/A { "3.38" } og E1 { "4.44" } dB-Hz, begge under gulvet på { "25" } dB-Hz; tidsfeil -0.07 til { "5.06" } ns mot vakten på { "50" } ns; alarmen er oppe

seg-6c56497d74fb = galileo-fallback, { "300" } s

seg-62bcfd3e8732 = <c1/> (resynkronisert), <c2/> (CW-tone på L1-bærebølgen), <c3/> på en Galileo-lignende Walker 24/3/1

seg-d455f0c06ee6 = L1 C/A holdt ved { "17.98" } dB-Hz, E1 tilbake til { "44.73" } dB-Hz; beskyttelsesnivå { "6.1" } til { "17.7" } m; alarmen er stille

seg-2db37e292efe = At E1 kommer seg under CW-tonen, hviler på behandlingen av kontinuerlig spektrum i typen spectrum: tonen ligger i nullpunktet til MBOC-spekteret og kobler ikke inn noe. En ekte tone ville koblet inn gjennom kodens spektrallinjer. Dette er oppgitt i filen og i SPECTRUM.md.

seg-fb8d8636c554 = <c1/>: et parameterrutenett over en hvilken som helst type

seg-b14a11d60e9f = En til tre punktdelte scenarionøkler, hver over et lineært eller logaritmisk område, på de samme akseverdiene som typen <c1/> bruker. Hver akse har et navn og en enhet. Hver metrikk har et navn og en resultatbane, og enheten leses fra enhetsblokken til den feide typen, med mindre kampanjen deklarerer en. Med <c2/> er hver node et seedet Monte Carlo-ensemble (realisering <c3/> ved nodens seed pluss <c4/>), rapportert med statistikken nedenfor. <c5/> sveiper en jammer { "1" } km fra mottakeren fra -50 til +{ "10" } dBW. Det gjennomsnittlige forholdet mellom jammer og signal endrer seg nøyaktig { "1" } dB per dB ({ "12.2" } til { "72.2" } dB), og tilgjengeligheten faller fra { "1" } til { "0" } mellom -30 og -25 dBW.

seg-c1931e311cca = En punktdelt nøkkel kan indeksere en tabellrekke etter posisjon: <c1/> er <c2/> i den tredje tabellen <c3/>, og <c4/> går tre nivåer ned.

seg-e774c578906d = <c1/>: et seedet ensemble

seg-bbacb9c66f92 = Realisering <c1/> kjører scenarioet med seed-nøkkelen satt til <c2/>, konvensjonen som klokkeensemblet allerede bruker, slik at ensemblet kan reproduseres eksakt. Hver metrikk rapporterer gjennomsnittet, populasjonens standardavvik, 5., 50. og 95. persentil etter nærmeste rang, et persentil-bootstrap-konfidensintervall på { "95" } % med fast seed for gjennomsnittet ({ "2000" } resamplinger) og, som standard, hvert sample i seed-rekkefølge. Resultatbaner kan indeksere tabeller: <c3/> er det siste samplet.

seg-ed182d15151d = <c1/>: flere scenarioer under felles betingelser

seg-26fab14de534 = Navngitte felles verdier (et tall eller en tabell med tall, med en enhet) skrives inn i hvert medlem på nøklene det binder dem til, slik at medlemmene ikke kan være uenige om den felles betingelsen. Hvert medlem kjøres, og for hver metrikk gir den samlede oppsummeringen den minste, største og gjennomsnittlige verdien på tvers av medlemmene og navngir den beste og den verste. <c1/> setter én jammer på { "8" } dBW mellom et skip i Finskebukta (omtrent { "30" } km unna) og en bil på en kystvei i Helsingfors (omtrent { "50" } km unna). Skipet mister alle satellitter (gjennomsnittlig forhold mellom jammer og signal { "39.0" } dB), mens bilen beholder minst fire ({ "34.6" } dB).

seg-c888630c92d7 = <c1/>: den beste verdien for én metrikk

seg-b54f0deedd0f = En til tre punktdelte scenarionøkler, hver avgrenset til <c1/> på en <c2/>- eller <c3/>-skala, søkes etter den beste verdien for én metrikk (<c4/>, <c5/> eller <c6/>, som minimerer avstanden fra <c7/>).

seg-b57ec5e5168a = Det finnes to metoder:

seg-8fba07ce0cde = <c1/> kjører hver node i et rutenett med <c2/> per nøkkel, på sveipets akseverdier.

seg-844a7c1e3578 = <c1/> (standard) kjører en deterministisk Nelder–Mead-simpleks i koordinater normalisert til [{ "0" }, { "1" }] per nøkkel. Prøvepunkter projiseres på boksen. Seksjonen tar <c2/>, et startsteg <c3/> og stopptoleransene <c4/> og <c5/>.

seg-2b1159b467f8 = En kjøring der metrikken mangler eller ikke er endelig, skårer dårligst og beholdes i sporet. Med <c1/> er metrikken gjennomsnittet over de samme seedene ved hver evaluering. Resultatet gir <c2/>, <c3/>, <c4/>, <c5/>, <c6/> og hver evaluering i <c7/>.

seg-778a40736e7b = <c1/> søker etter rekkevidde og datarate for en lenkemargin på { "3" } dB. Optimum er lokalt for boksen og starten. Det er MODELLED, aldri en global påstand.

seg-b94ab5e6dad4 = Protokollen og terskelene som ble fastsatt på forhånd, står i <c1/>. Testen er <c2/>. Resultatene:

seg-232c68472fa4 = en 1-D-målløsning stemmer med den lukkede formen til { "6e-15" };

seg-22f7abf70fc4 = rutenettmetoden stemmer bit for bit med en uavhengig brute-force-løkke;

seg-faea43f01e37 = simpleksen gjør det minst like bra som rutenettet på { "41" } × { "41" }, på omtrent en tiendedel av kjøringene.

seg-df1533fe6b95 = Terskelen for 1-D i runde { "1" } er registrert som NOT MET: boksen som ble fastsatt på forhånd, utelot løsningen.

seg-0862a4e9aa61 = Hvert kampanjeresultat har <c1/>, SHA-256 (Secure Hash Algorithm { "2" }, 256-bits digest) av den kanoniske JavaScript Object Notation-formen (JSON) til kampanjedokumentet (rekkefølgen på nøklene og formateringen endrer den ikke), og en blokk <c2/> med antall medlemskjøringer og <c3/>, en SHA-256 over digesten til hvert medlemsresultat i utsendelsesrekkefølge. To kjøringer med samme digest ga byte-identiske medlemsresultater. Hver fasekjøring registrerer også sin type, sin egen <c4/> der typen har en, og SHA-256 av resultatdokumentet sitt. Hvert tall i dokumentet har en oppføring i enhetsblokken.

seg-2eeddb87e889 = Kjernen er sekvensiell og leser ingen filer, så en kampanje kjører uendret i WebAssembly-bygget. Kampanjer kan ikke inneholde kampanjer.

seg-f9b8b78dd64a = Eksport

seg-c4443bf160f7 = <c1/> på en kampanje skriver hvert medlemsscenario som har geometri, som sitt eget filsett, med medlemmets etikett satt inn før formatsuffikset: hver fasekjøring (<c2/>, eller <c3/> når fasen har flere kjøringer), sveipets basisscenario (<c4/>), Monte Carlo-scenarioet (<c5/>) og hvert sammensatte medlem (med sin egen etikett, og med de felles verdiene det binder skrevet inn). Et medlem som er identisk med et tidligere, skrives én gang. Overleveringer og sveip- eller seed-verdier som er brukt under kjøring, er ikke med i de eksporterte scenarioene.

seg-0ba270495309 = Et format som ingen av medlemmene kan beskrive, avvises med den begrunnelsen. Tabellen per scenario står i <a1>INTEROP.md</a1>.

seg-c20904c9d3b5 = LEO-PNT-kampanjer

seg-a598e2c06f51 = Femten medfølgende kampanjer tar for seg spørsmål om posisjonering, navigasjon og tidssynkronisering (PNT) fra lav jordbane (LEO). <a1>LEO-PNT.md</a1> beskriver hva hver av dem viser. Hva hver av dem kjører, slik kommandolinjen oppsummerer det:

seg-f65b1f2b4182 = Modus

seg-e7d7defa7e71 = Spørsmål

seg-08ab59acfe62 = compose, { "4" } medlemmer

seg-a21e4db0fda9 = tjenestedata i navigasjonsmeldingen mot rammelengde

seg-6c29f4690d2c = sveip av <c1/>, { "7" } noder

seg-97fba77aa2ec = fusjonert MEO- og LEO-posisjonering mot LEO-signalets avstandsfeil i signalrommet (SISRE)

seg-7b9fbe34d38c = compose, { "2" } medlemmer

seg-28352bd0c9e3 = LEO-PNT innendørs etter bånd og bygningsklasse

seg-a447c56022ec = sveip av <c1/>, { "9" } noder

seg-5b3cbfced221 = energi per posisjonsbestemmelse for tingenes internett (IoT) mot LEO-UHF-senderens effekt

seg-3ebd95e5933a = sveip av <c1/>, { "9" } noder

seg-cfbac004ff64 = posisjonering i ikke-terrestriske nett (NTN) mot referansesignalets båndbredde

seg-07e8765975d1 = sveip av <c1/>, { "3" } noder

seg-db872d35033e = konvergens for presis punktposisjonering (PPP) mot høyden til et LEO-lag med 192 satellitter

seg-a4ec677dc4e6 = chain, { "3" } faser over { "2100" } s

seg-2d91ecf8455d = globalt navigasjonssatellittsystem (GNSS) jammet, LEO-laget bærer brukeren, integriteten opprettholdt

seg-c44991a2a24e = sveip av <c1/>, { "13" } noder

seg-4b6e292d88f5 = LEO-båndmangfold mot en L-bånds barrage-jammer

seg-30d86b528bee = spoofingovervåkerne mot fire spoofere

seg-1690baf3a1b8 = chain, { "1" } fase over { "86 400" } s

seg-4d5b507c04de = tidssynkronisering av 5G-basestasjoner: holdover og LEO-tid

seg-d32a80c40470 = chain, { "3" } faser over { "1440" } s

seg-c38f9d3bd54e = containersporing med LEO-UHF: energi per posisjonsbestemmelse langs en reise

seg-9bf38e403696 = chain, { "2" } faser over { "1500" } s

seg-dea7117552f4 = et autonomt kjøretøy i en bykløft med et LEO-lag

seg-dbbd9ffcbfb4 = chain, { "2" } faser over { "1800" } s

seg-37c0c3570023 = den samme bykløften som en flat avskjæringsvinkel på { "35" } deg og som en <c1/>-silhuett

seg-ccaa34122145 = chain, { "2" } faser over { "87 000" } s

seg-d16d8b2e9089 = tidssynkronisering for kritisk infrastruktur: holdover med LEO-tid

seg-4ee0b3036f4a = chain, { "3" } faser over { "10 800" } s

seg-157c5bec7f5f = brukere i polare strøk og Arktis med et polart LEO-lag

seg-64404160d0e7 = chain, { "3" } faser over { "2520" } s

seg-a35e1603ba32 = jernbane- og sjøfartsbrukere med et LEO-lag

seg-3d819fa3fd1c = MEO er middels høy jordbane, UHF ultrahøy frekvens og 5G femte generasjon av mobilnett.

seg-490920844143 = Hva som kontrolleres

seg-483b1d4efb20 = <c1/> fester sammensetningsidentitetene:

seg-881d97a3fa2b = <b>En kampanje med én fase reproduserer den frittstående kjøringen bit for bit.</b> For <c1/>, <c2/> og <c3/> er medlemmets resultatdokument byte-identisk med <c4/> på scenariofilen, digesten er den kampanjen rapporterer, og med rutenettet på kjøringens eget steg er hver justerte verdi lik verdien i den frittstående serien (jamming-C/N0 er lik gjennomsnittet som er beregnet uavhengig fra det frittstående dokumentet).

seg-1a9e1ed5b18c = <b>Et sveip med én node og en sammensetning med ett medlem</b> leser nøyaktig det frittstående tallet.

seg-883bb72e1239 = <b>Et ensemble med fast seed er byte-stabilt</b>, og realisering <c1/> er nøyaktig den frittstående kjøringen ved <c2/>. Kampanjens hash ignorerer rekkefølgen på nøklene.

seg-170bc86059fa = Et analytisk tilfelle.

seg-0fd27291d6f4 = <c1/> kjører { "200" } seed av en brikkeskala atomklokke med bare hvit frekvensstøy (q_wf = { "9e-20" } s^2/s, Microchip SA.45s sigma_y({ "1" } s) = { "3e-10" }), synkronisert til { "590" } s og på tomgang til { "3600" } s. Den endelige tidsfeilen er gaussisk med gjennomsnitt { "0" } og standardavvik sqrt(q_wf * { "3010" } s) = { "16.459" } ns (fasens tilfeldige gange under hvit frekvensstøy, National Institute of Standards and Technology (NIST) Technical Note { "1337" }). Det rapporterte intervallet, [-2.52, { "1.59" }] ns, inneholder det sanne gjennomsnittet { "0" }. Utvalgets standardavvik, { "14.93" } ns, gir en kjikvadratstatistikk på { "164.5" } med { "199" } frihetsgrader, innenfor det tosidige intervallet på { "99" } % [{ "151.37" }, { "254.14" }]. Med { "3000" } seed gir det samme scenarioet { "16.31" } ns.

seg-61b54a16243f = <b>Den spektrumdrevne kjeden</b> leser de frittstående tallene: onset-fasen varer nøyaktig like lenge som spektrumkjøringens tid til første tap, og hver L1 C/A- og E1-verdi på tidslinjen er, innenfor { "1e-9" } dB, lik raden i det frittstående vannfallseksempelet for den samme jammertilstanden (nominell, bare chirp, bare CW-tone).

seg-5ebc02a24ce1 = <b>Kjeden</b> overleverer tilstand slik det er dokumentert: spoofingfasen varer nøyaktig like lenge som spoofkjøringens deteksjonstid, holdoveren bærer nøyaktig spoofkjøringens forskyvning ved deteksjon, recovery bærer ingenting, og alarmen er oppe overalt der beskyttelsesnivået mangler eller overstiger alarmgrensen.

seg-153e28bcb38a = Disse kontrollerer at sammensetning ikke endrer noe det ikke skal. De validerer ikke et lenket oppdrag mot et målt, og det er derfor de tre kampanjeradene i <a1>VERIFICATION-MATRIX.md</a1> er MODELLED.

seg-e82860f2d902 = <s1>Forrige</s1>Å bruke ekte TLE-er

seg-e40757a0b4cb = <s1>Neste</s1>Kjøringsrapporter

seg-e65edbaca6bf = [[phases]]: et lenket oppdrag på én tidslinje

seg-a433ddf74e55 = [sweep]: et parameterrutenett over en hvilken som helst type

seg-7ca90ac531bf = [monte_carlo]: et seedet ensemble

seg-03d764a4cb56 = [compose]: flere scenarioer under felles betingelser

seg-61a0db2550ba = [optimize]: den beste verdien for én metrikk
