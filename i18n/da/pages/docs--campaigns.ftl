# docs--campaigns: translations (da)

seg-f917e7fcac09 = Hvad det er

seg-cae10fb9bff8 = Scenarie

seg-7603033b1c87 = Kilde: <c1/>

seg-699c946d7d09 = Et enkelt scenarie besvarer ét spørgsmål om én situation. En mission er en række af situationer, og et designstudie er en familie af dem. Scenarietypen <c1/> sammensætter de eksisterende typer i én kørsel uden at genimplementere nogen af dem: hvert medlem er en almindelig scenarietabel med sit eget <c2/>, sendt gennem <c3/> præcis som <c4/> ville køre den, og kampagnen læser kun tal tilbage fra resultatdokumenterne.

seg-cb4f48673970 = En kampagne er <b>MODELLED</b>. Dens sammensætningsidentiteter er testet (nedenfor), men at kæde faser sammen er et modelvalg, og hver fase er kun så god som den type, der kørte den.

seg-80e367fbc391 = Kør en som et hvilket som helst andet scenarie:

seg-9f9995ebc904 = En kampagne kan indeholde en vilkårlig kombination af fire sektioner; en uden nogen kører, og dens oversigt siger, at den intet sammensatte.

seg-002ddd72b3a2 = <c1/>: en kædet mission på én tidslinje

seg-e99c4453b79d = Hver fase kører ét eller flere scenarier over et vindue af en fælles missionstidslinje, for eksempel et ur i holdover og et inertinavigationssystem (INS) i frit løb samtidig. Outputtet fra hver kørsel læses ind i navngivne <b>kanaler</b>, placeres på fasens starttidspunkt og resamples på et fælles gitter (<c1/>) med nulte ordens hold: et gittertidspunkt tager den seneste sample fra den ejende fases kørsel på eller før det, og er null, hvor ingen kørsel i den fase leverer kanalen.

seg-842b77a21c5f = Kanal

seg-b2eb598fab2a = Forudindstillet kilde

seg-f42465f7d066 = ns

seg-fdb4600bf100 = urets tidsfejl

seg-aef6b877191d = vagt for tidsfejl

seg-cc989ca58f1d = kørslens eget <c1/>

seg-5e9f7cd33017 = gennemsnitligt effektivt forhold mellem bærebølge og støjtæthed (C/N0) over de synlige satellitter

seg-af6f07319f2d = <c1/>: gennemsnit af <c2/>

seg-f6b4ea158327 = grænse for tab af tracking

seg-126535297c32 = <c1/>: scenariets <c2/>, når det angiver en

seg-f8f430695a88 = satellitter, der stadig trackes

seg-3f9a9f33010b = vertikalt beskyttelsesniveau

seg-2cfc68fa1c15 = vertikal alarmgrænse

seg-d165177a255c = positionsfejl

seg-29651ae6be6f = tærskel for positionsfejl

seg-c893c5e3ace5 = { "1" }, så længe en monitor i fasen alarmerer

seg-ade1d7072512 = se nedenfor

seg-e8c7ac7d117f = <c1/> er <c2/>, medmindre kørslen sætter <c3/>. Enhver anden størrelse læses med en eksplicit post <c4/>: en tidssti med ét <c5/>, der navngiver rækkerne (<c6/>), en værdisti, der deler disse rækker, eller en skalar, der udsendes til hver række (præfikset <c7/> læser kørslens scenarie i stedet for dens resultat), en valgfri reduktion (<c8/>, <c9/>, <c10/>, <c11/>) for flere værdier under én række, en skala og en enhed til en kanal, som kampagnen ikke kender.

seg-7d7bc5d19a61 = <b>Alarmer</b> kommer fra tre steder, kombineret med logisk OR inden for en fase:

seg-74a10f5283ec = forudindstillede flag aflæst fra kørslen: <c1/> alarmerer, mens færre end fire satellitter trackes (dens egen definition af tilgængelighed); <c2/> alarmerer i epoker, den markerer som utilgængelige;

seg-f22be2880015 = forudindstillede regler på fasens kanaler, evalueret <b>efter</b> <c1/>: <c2/> alarmerer, mens den absolutte tidsfejl overstiger <c3/>; <c4/>, mens positionsfejlen overstiger <c5/>; eksplicitte regler står i <c6/>;

seg-ccd94a7cb652 = alarmerende hændelser: <c1/> rejser én ved sin ur-støttede monitors <c2/>; <c3/> rejser én ved fasens start, når dens fusionerede beslutning alarmerer.

seg-f88b8ad5672f = <b>Tilstand overdrages</b> mellem faser på tre eksplicitte måder:

seg-0e3a0ee8e172 = <c1/> lægger kanalens værdi ved slutningen af den forrige fase til denne fases værdier for den. Den urfase, en spoofer trak, er det sted, holdover starter fra. At lægge forskydningen til er nøjagtigt for urfase, som integrerer frekvens; for en positionsfejl antager det, at de to fejl er kollineære, det pessimistiske tilfælde.

seg-4db8b11391a5 = <c1/> skriver et tal fra den forrige fase (<c2/> for en kanals slutværdi, eller en hvilken som helst resultatsti fra en tidligere kørsel) ind i en punkteret nøgle i denne fases scenarie, før det kører, med en valgfri skala og forskydning.

seg-fdd5aa8b9627 = <c1/> afslutter fasen på et tidspunkt, en kørsel har beregnet, begrænset til <c2/>. Den medfølgende mission afslutter sin spoofingfase ved <c3/>.

seg-cdd64676f509 = <c1/> dropper de første sekunder af en kørsels egen tidslinje (en opvarmning) før fasetid nul.

seg-d48bcd9890d3 = Den medfølgende mission

seg-52fc5abca41f = <c1/> kører { "18" } medlemsscenarier over seks faser på et gitter på { "10" } s:

seg-baea4e05ad26 = Fase

seg-9d3ee6a5613e = Kørsler

seg-87fbeeb9abb9 = Hvad tidslinjen viser

seg-82bebc2bb038 = nominel, { "600" } s

seg-cf54dae64cb7 = <c1/>, <c2/> (ingen jammer), <c3/>

seg-5cb80e4a7d4d = tidsfejl { "0" } ns; C/N0 { "43.0" } dB-Hz mod en grænse på { "25" } dB-Hz; vertikalt beskyttelsesniveau { "9.1" } til { "21.6" } m mod en alarmgrænse på { "50" } m

seg-13c92a72544a = jamming, { "600" } s

seg-f9c01304734d = det samme, jammer ved -30 dBW, { "1" } km

seg-27d3b65152b0 = C/N0 falder til { "27.7" } dB-Hz, alle { "8" } satellitter trackes stadig

seg-6a052db03815 = spoofing, afsluttet ved { "370" } s af <c1/>

seg-89856c1f83f8 = <c1/> (tidsrampe på { "0.1" } ns/s), <c2/>, <c3/>

seg-cfcdd96b1132 = tidsfejlen vokser til { "36" } ns; radiofrekvensdetektoren alarmerer ved fasens start, den ur-støttede monitor ved { "370" } s

seg-92c8a76b84c2 = holdover, { "1800" } s

seg-8a6e0b2898d1 = <c1/> (nægtet, bærer { "37.0" } ns), <c2/> (taktisk enhed i frit løb), <c3/> ved { "10" } dBW

seg-1948491e25ec = hver satellit tabt (C/N0 omkring -12 dB-Hz); tidsfejl { "36.4" } til { "62.7" } ns mod vagten på { "50" } ns; positionsfejl op til { "24" } km

seg-93e59087dd44 = integrity-alarm, { "600" } s

seg-f28f37baf8fe = <c1/> (bærer { "59.6" } ns), <c2/> og <c3/> med en maske på { "25" } deg

seg-83d890c819f8 = { "5" } satellitter trackes; beskyttelsesniveau { "19" } til { "135" } m, mangler ved { "18" } af { "60" } gittertidspunkter; den medbragte tidsfejl, { "52.1" } til { "61.7" } ns, ligger fortsat over vagten på { "50" } ns, så alarmen er oppe i hele fasen

seg-1ab40b7893db = recovery, { "600" } s

seg-181d2a2f800b = tidsfejl tilbage på { "0" } ns; alarmen er stille

seg-26ef3dc422ff = Integritetskørslerne bruger eksemplet <c1/>s egen brugerbane (en cirkulær bane i { "0.4" } km højde), ikke jamming-modtagerens faste placering, og masken på { "25" } deg står for den delvise himmel hos en modtager, der genfinder signalet. Det er scenarievalg, angivet i filen.

seg-03ae98f17988 = En mission styret af L-båndets spektrum

seg-5daf8c8fdd83 = <c1/> kører { "8" } medlemsscenarier over tre faser på et gitter på { "1" } s, med C/N0 for GPS L1 C/A og Galileo E1 læst fra typen <c2/> (se <a1>SPECTRUM.md</a1>) frem for fra typen <c3/>s tabel pr. satellit. Jammerne er dem i <c4/>.

seg-7f34a00af961 = onset, afsluttet ved { "10" } s af <c1/>

seg-471ec0d86f76 = <c1/>, <c2/> (chirp fra { "10" } s), <c3/>

seg-00b032242ebc = L1 C/A { "43.48" } og E1 { "44.73" } dB-Hz; fasen slutter ved spektrumkørslens eget første tab af L1 C/A (<c1/>); beskyttelsesniveau { "21.6" } m mod { "50" } m

seg-50220d719d5d = holdover, { "600" } s

seg-50de7cd69ac0 = <c1/> (nægtet, bærer onset-fejlen, her { "0" } ns), <c2/> (chirp tændt)

seg-1d59e94d94e5 = L1 C/A { "3.38" } og E1 { "4.44" } dB-Hz, begge under grænsen på { "25" } dB-Hz; tidsfejl -0.07 til { "5.06" } ns mod vagten på { "50" } ns; alarm oppe

seg-6c56497d74fb = galileo-fallback, { "300" } s

seg-62bcfd3e8732 = <c1/> (resynkroniseret), <c2/> (CW-tone på L1-bærebølgen), <c3/> på en Galileo-lignende Walker 24/3/1

seg-d455f0c06ee6 = L1 C/A holdt på { "17.98" } dB-Hz, E1 tilbage på { "44.73" } dB-Hz; beskyttelsesniveau { "6.1" } til { "17.7" } m; alarmen er stille

seg-2db37e292efe = At E1 kommer sig under CW-tonen hviler på spektrumtypens behandling af kontinuerligt spektrum: tonen ligger i nulpunktet af MBOC-spektret og kobler intet. En rigtig tone ville koble gennem kodens spektrallinjer; det er angivet i filen og i SPECTRUM.md.

seg-fb8d8636c554 = <c1/>: et parametergitter over en vilkårlig type

seg-b14a11d60e9f = Fra én til tre punkterede scenarienøgler, hver over et lineært eller logaritmisk område, på de samme akseværdier som typen <c1/> bruger. Hver akse har et navn og en enhed; hver metrik har et navn og en resultatsti, og dens enhed læses fra den fejede types egen enhedsblok, medmindre kampagnen erklærer en. Med <c2/> er hver knude et seedet Monte Carlo-ensemble (realisering <c3/> ved knudens seed plus <c4/>), rapporteret med statistikken nedenfor. <c5/> fejer en jammer { "1" } km fra modtageren fra -50 til +{ "10" } dBW: det gennemsnitlige forhold mellem jammer og signal flytter sig præcis { "1" } dB pr. dB ({ "12.2" } til { "72.2" } dB), og tilgængeligheden falder fra { "1" } til { "0" } mellem -30 og -25 dBW.

seg-c1931e311cca = En punkteret nøgle kan indeksere et array af tabeller efter position: <c1/> er <c2/> i den tredje tabel <c3/>, og <c4/> når tre niveauer ned.

seg-e774c578906d = <c1/>: et seedet ensemble

seg-bbacb9c66f92 = Realisering <c1/> kører scenariet med dets seed-nøgle sat til <c2/>, den konvention som urensemblet allerede bruger, så ensemblet gengives nøjagtigt. Hver metrik rapporterer middelværdien, populationens standardafvigelse, 5., 50. og 95. percentil efter nærmeste rang, et percentil-bootstrap-konfidensinterval på { "95" } % med fast seed for middelværdien ({ "2000" } resamplinger) og som standard hver sample i seed-rækkefølge. Resultatstier kan indeksere arrays: <c3/> er den sidste sample.

seg-ed182d15151d = <c1/>: flere scenarier under fælles betingelser

seg-26fab14de534 = Navngivne fælles værdier (et tal eller et array af tal, med en enhed) skrives ind i hvert medlem ved de nøgler, det binder dem til, så medlemmerne ikke kan være uenige om den fælles betingelse. Hvert medlem kører, og for hver metrik angiver den samlede oversigt den mindste, største og gennemsnitlige værdi på tværs af medlemmerne og nævner den bedste og den værste. <c1/> placerer én jammer på { "8" } dBW mellem et skib i Finske Bugt (omkring { "30" } km væk) og en bil på en kystvej i Helsinki (omkring { "50" } km): skibet mister hver satellit (gennemsnitligt forhold mellem jammer og signal { "39.0" } dB), mens bilen beholder mindst fire ({ "34.6" } dB).

seg-c888630c92d7 = <c1/>: den bedste værdi af én metrik

seg-b54f0deedd0f = Fra én til tre punkterede scenarienøgler, hver afgrænset til <c1/> på en skala <c2/> eller <c3/>, gennemsøges for den bedste værdi af én metrik (<c4/>, <c5/> eller <c6/>, som minimerer afstanden fra <c7/>).

seg-b57ec5e5168a = Der er to metoder:

seg-8fba07ce0cde = <c1/> kører hver knude i et gitter med <c2/> pr. nøgle, på sweepets akseværdier.

seg-844a7c1e3578 = <c1/> (standard) kører et deterministisk Nelder–Mead-simpleks i koordinater normaliseret til [{ "0" }, { "1" }] pr. nøgle. Prøvepunkter projiceres ind på boksen. Sektionen tager <c2/>, en indledende <c3/> og stoptolerancerne <c4/> og <c5/>.

seg-2b1159b467f8 = En kørsel, hvis metrik mangler eller ikke er endelig, scorer værst og bevares i sporet. Med <c1/> er metrikken middelværdien over de samme seeds ved hver evaluering. Resultatet angiver <c2/>, <c3/>, <c4/>, <c5/>, <c6/> og hver evaluering i <c7/>.

seg-778a40736e7b = <c1/> søger efter rækkevidde og datarate for en linkmargin på { "3" } dB. Optimum er lokalt for boksen og startpunktet. Det er MODELLED, aldrig en global påstand.

seg-b94ab5e6dad4 = Protokollen og dens tærskler, fastsat på forhånd, står i <c1/>. Testen er <c2/>. Resultaterne:

seg-232c68472fa4 = en 1-D-målløsning stemmer med den lukkede form til { "6e-15" };

seg-22f7abf70fc4 = gittermetoden stemmer bit for bit med en uafhængig brute-force-løkke;

seg-faea43f01e37 = simpleks klarer sig mindst lige så godt som gitteret på { "41" } × { "41" }, på omkring en tiendedel af dets kørsler.

seg-df1533fe6b95 = Runde { "1" }s 1-D-tærskel er registreret som NOT MET: den boks, der blev fastsat på forhånd, udelukkede løsningen.

seg-0862a4e9aa61 = Hvert kampagneresultat bærer <c1/>, SHA-256 (Secure Hash Algorithm { "2" }, 256-bit digest) af kampagnedokumentets kanoniske JavaScript Object Notation-form (JSON) (nøglerækkefølge og formatering ændrer den ikke), og en blok <c2/> med antallet af medlemskørsler og <c3/>, en SHA-256 over hvert medlemsresultats digest i dispatch-rækkefølge. To kørsler med samme digest gav medlemsresultater, der er identiske byte for byte. Hver fasekørsel registrerer også sin type, sin egen <c4/>, hvor typen har en, og SHA-256 af sit resultatdokument. Hvert tal i dokumentet har en post i enhedsblokken.

seg-2eeddb87e889 = Kernen er sekventiel og læser ingen filer, så en kampagne kører uændret i WebAssembly-bygget. Kampagner må ikke indeholde kampagner.

seg-f9b8b78dd64a = Eksport

seg-c4443bf160f7 = <c1/> på en kampagne skriver hvert medlemsscenarie, der har geometri, som sit eget filsæt, med medlemmets label indsat før formatsuffikset: hver fasekørsel (<c2/>, eller <c3/>, når fasen har flere kørsler), sweepets basisscenarie (<c4/>), Monte Carlo-scenariet (<c5/>) og hvert sammensat medlem (med sin egen label og de fælles værdier, det binder, skrevet ind). Et medlem, der er identisk med et tidligere, skrives én gang; overdragelser og sweep- eller seed-værdier, der anvendes under kørslen, er ikke med i de eksporterede scenarier.

seg-0ba270495309 = Et format, som ingen af medlemmerne kan beskrive, afvises med den begrundelse. Tabellen pr. scenarie står i <a1>INTEROP.md</a1>.

seg-c20904c9d3b5 = LEO-PNT-kampagner

seg-a598e2c06f51 = Femten medfølgende kampagner rammesætter spørgsmål om positionering, navigation og tidssynkronisering (PNT) fra lav jordbane (LEO); <a1>LEO-PNT.md</a1> beskriver, hvad hver af dem viser. Hvad hver kører, som kommandolinjen opsummerer det:

seg-f65b1f2b4182 = Tilstand

seg-e7d7defa7e71 = Spørgsmål

seg-08ab59acfe62 = compose, { "4" } medlemmer

seg-a21e4db0fda9 = servicedata i navigationsmeddelelsen mod rammelængde

seg-6c29f4690d2c = sweep af <c1/>, { "7" } knuder

seg-97fba77aa2ec = fusioneret MEO- og LEO-positionering mod LEO-signalets afstandsfejl i rummet (SISRE)

seg-7b9fbe34d38c = compose, { "2" } medlemmer

seg-28352bd0c9e3 = LEO-PNT indendørs efter bånd og bygningsklasse

seg-a447c56022ec = sweep af <c1/>, { "9" } knuder

seg-5b3cbfced221 = Internet of Things (IoT), energi pr. positionsbestemmelse mod LEO UHF-sendeeffekten

seg-3ebd95e5933a = sweep af <c1/>, { "9" } knuder

seg-cfbac004ff64 = positionering i ikke-terrestriske net (NTN) mod referencesignalets båndbredde

seg-07e8765975d1 = sweep af <c1/>, { "3" } knuder

seg-db872d35033e = konvergens for præcis punktpositionering (PPP) mod højden af et LEO-lag med 192 satellitter

seg-a4ec677dc4e6 = chain, { "3" } faser over { "2100" } s

seg-2d91ecf8455d = Global Navigation Satellite System (GNSS) jammet, LEO-laget bærer brugeren, integriteten opretholdes

seg-c44991a2a24e = sweep af <c1/>, { "13" } knuder

seg-4b6e292d88f5 = LEO-båndmangfoldighed mod en L-bånds-barrage-jammer

seg-30d86b528bee = spoofingmonitorerne mod fire spoofere

seg-1690baf3a1b8 = chain, { "1" } fase over { "86 400" } s

seg-4d5b507c04de = tidssynkronisering af 5G-basestationer: holdover og LEO-tid

seg-d32a80c40470 = chain, { "3" } faser over { "1440" } s

seg-c38f9d3bd54e = containersporing med LEO UHF: energi pr. positionsbestemmelse undervejs på en rejse

seg-9bf38e403696 = chain, { "2" } faser over { "1500" } s

seg-dea7117552f4 = et autonomt køretøj i en bykløft med et LEO-lag

seg-dbbd9ffcbfb4 = chain, { "2" } faser over { "1800" } s

seg-37c0c3570023 = den samme bykløft som en flad afskæring på { "35" } deg og som en skyline af typen <c1/>

seg-ccaa34122145 = chain, { "2" } faser over { "87 000" } s

seg-d16d8b2e9089 = tidssynkronisering af kritisk infrastruktur: holdover med LEO-tid

seg-4ee0b3036f4a = chain, { "3" } faser over { "10 800" } s

seg-157c5bec7f5f = polare og arktiske brugere med et polart LEO-lag

seg-64404160d0e7 = chain, { "3" } faser over { "2520" } s

seg-a35e1603ba32 = jernbane- og søfartsbrugere med et LEO-lag

seg-3d819fa3fd1c = MEO er medium Earth orbit (middelhøj jordbane), UHF ultra-high frequency og 5G femte generation af mobilnet.

seg-490920844143 = Hvad der kontrolleres

seg-483b1d4efb20 = <c1/> fastlåser sammensætningsidentiteterne:

seg-881d97a3fa2b = <b>En kampagne med én fase gengiver den selvstændige kørsel bit for bit.</b> For <c1/>, <c2/> og <c3/> er medlemmets resultatdokument identisk byte for byte med <c4/> på scenariefilen, dets digest er den, kampagnen rapporterer, og med gitteret ved kørslens eget trin er hver tilpasset værdi lig med værdien i den selvstændige serie (jamming-C/N0 er lig med gennemsnittet beregnet uafhængigt ud fra det selvstændige dokument).

seg-1a9e1ed5b18c = <b>Et sweep med én knude og en sammensætning med ét medlem</b> læser nøjagtigt det selvstændige tal.

seg-883bb72e1239 = <b>Et ensemble med fast seed er byte-stabilt</b>, og realisering <c1/> er nøjagtigt den selvstændige kørsel ved <c2/>; kampagnens hash ignorerer nøglerækkefølgen.

seg-170bc86059fa = Et analytisk tilfælde.

seg-0fd27291d6f4 = <c1/> kører { "200" } seeds af et chipskala-atomur med kun hvid frekvensstøj (q_wf = { "9e-20" } s^2/s, Microchip SA.45s sigma_y({ "1" } s) = { "3e-10" }), synkroniseret til { "590" } s og i frit løb til { "3600" } s. Den endelige tidsfejl er gaussisk med middelværdi { "0" } og standardafvigelse sqrt(q_wf * { "3010" } s) = { "16.459" } ns (fasens random walk under hvid frekvensstøj, National Institute of Standards and Technology (NIST) Technical Note { "1337" }). Det rapporterede interval, [-2.52, { "1.59" }] ns, indeholder den sande middelværdi { "0" }; stikprøvens standardafvigelse, { "14.93" } ns, giver en chi-i-anden-statistik på { "164.5" } med { "199" } frihedsgrader, inden for det tosidede interval på { "99" } % [{ "151.37" }, { "254.14" }]. Ved { "3000" } seeds giver det samme scenarie { "16.31" } ns.

seg-61b54a16243f = <b>Den spektrumdrevne kæde</b> læser de selvstændige tal: onset-fasen varer nøjagtigt spektrumkørslens tid til første tab, og hver L1 C/A- og E1-værdi på tidslinjen er, til { "1e-9" } dB, lig med den selvstændige waterfall-eksempelkørsels række for den samme jammertilstand (nominel, chirp alene, CW-tone alene).

seg-5ebc02a24ce1 = <b>Kæden</b> overdrager tilstand som dokumenteret: spoofingfasen varer nøjagtigt spoofkørslens detektionstid, holdover bærer nøjagtigt spoofkørslens forskydning ved detektion, recovery bærer intet, og alarmen er oppe, hvor beskyttelsesniveauet mangler eller overstiger alarmgrænsen.

seg-153e28bcb38a = Disse kontroller sikrer, at sammensætning ikke ændrer noget, den ikke bør. De validerer ikke en kædet mission mod en målt, og derfor er de tre kampagnerækker i <a1>VERIFICATION-MATRIX.md</a1> MODELLED.

seg-e82860f2d902 = <s1>Forrige</s1>Brug af rigtige TLE'er

seg-e40757a0b4cb = <s1>Næste</s1>Kørselsrapporter

seg-e65edbaca6bf = [[phases]]: en kædet mission på én tidslinje

seg-a433ddf74e55 = [sweep]: et parametergitter over en vilkårlig type

seg-7ca90ac531bf = [monte_carlo]: et seedet ensemble

seg-03d764a4cb56 = [compose]: flere scenarier under fælles betingelser

seg-61a0db2550ba = [optimize]: den bedste værdi af én metrik
