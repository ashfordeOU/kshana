# docs--spectrum: translations (da)

seg-6cb7a787ac67 = Referencer

seg-cbf0f9bcd2d8 = Uafhængig reference

seg-6e0cb6acc073 = VALIDATED

seg-33f4c7af9c53 = Bærebølge

seg-c5ce76c91ff7 = Mærkat

seg-a86ce24d81de = Bånd

seg-ea152d84aabc = { "465" } MHz

seg-278d0b375f6f = { "20.46" } MHz

seg-39e207bee75b = { "2492.028" } MHz

seg-48fabff33863 = { "5020" } MHz

seg-72f051e2d7e1 = Signal

seg-47408d30d095 = Nominel C/N₀

seg-995748f9c74c = { "49.41" } dB-Hz

seg-5393b075ff7f = { "43.48" } dB-Hz

seg-4321ccaeeca5 = { "46.73" } dB-Hz

seg-59fd1427d61b = { "54.51" } dB-Hz

seg-0f47178201ca = { "49.23" } dB-Hz

seg-f8e6beeceedd = { "47.41" } dB-Hz

seg-53a7343c076e = Påstand

seg-430edd66bda0 = Ikke modelleret

seg-64509c048541 = Hvad der modelleres

seg-f07519ff8071 = Kilde: <c1/>

seg-901c3e032de7 = Spektrummodel og vandfaldsdiagram

seg-eac92092dd34 = Scenarietypen <c1/> bygger L-båndet i Global Navigation Satellite System (GNSS), og ethvert andet bånd, et udformet signal optager (ultrahøj frekvens (UHF), S-bånd, C-bånd), som én effektspektraltæthed (PSD), lader det ændre sig over en scriptet jammer-tidslinje og reducerer det til det, en sporingssløjfe interesserer sig for: forholdet mellem jammer og signal (J/S) og det effektive forhold mellem bærebølge og støjtæthed (C/N₀) for hvert bånd. Den tegner resultatet som et vandfaldsdiagram (frekvens på tværs, tid nedad, farve for effekt) ved siden af C/N₀-søjler for hvert bånd, og den læser og skriver optagelser i Signal Metadata Format (SigMF), så en virkelig optagelse kan estimeres og plottes ved siden af modellen.

seg-0007b6ba97ca = Skriv det medfølgende eksempel til en fil og kør det:

seg-5e205b189b26 = I et checkout kører <c1/> den samme fil.

seg-261deb22b4fa = Kode: <c1/> (modellen, typen, Welch-estimatoren), <c2/> (optagelseskodeken), <c3/> (signalspektrene med enhedsareal og den spektrale separationskoefficient) og <c4/> (de signaludformningsforudindstillinger, et bånd kan navngive).

seg-bb1153873209 = Modulation

seg-9758b36b554c = Standard for modtaget effekt

seg-a1a68286b809 = Standard for modtagerbåndbredde

seg-27a2cdc8183f = { "1575.42" } MHz

seg-66a103496266 = binær faseskiftkodning, BPSK({ "1" })

seg-f386c2e2e352 = −{ "158.5" } dBW (IS-GPS-200)

seg-50112ba8867d = { "2.046" } MHz

seg-b7755cb9a384 = multiplekset binær offset-bærebølge, MBOC(6,1,1/11), eller binær offset-bærebølge BOC({ "1,1" })

seg-6043a4ef45ca = −{ "157.25" } dBW (Galileo OS SIS ICD Issue { "2.1" }, tabel { "12" })

seg-6dc5e3668a78 = { "14.322" } MHz

seg-f03380403a2a = { "1227.60" } MHz

seg-06c245582533 = BPSK({ "1" }) (CM- og CL-koder tidsmultiplekset)

seg-fa56c0085dbc = −{ "160.0" } dBW (IS-GPS-200)

seg-1982a811e1ef = { "1176.45" } MHz

seg-dd074e33242e = BPSK({ "10" })

seg-f30f2e48a3bf = −{ "157.9" } dBW (IS-GPS-705)

seg-898ae19a946b = −{ "155.25" } dBW (Galileo OS SIS ICD Issue { "2.1" }, tabel { "12" })

seg-3216d5cd918d = GPS (Global Positioning System) L1 C/A er coarse/acquisition-koden; L2C er det civile L2-signal; IS-GPS-200 og IS-GPS-705 er GPS-grænsefladespecifikationerne; Galileo OS SIS ICD er Galileo Open Service Signal-in-Space Interface Control Document. De modtagne effekter er specifikationernes minimumsværdier; båndbredderne er modelleringsvalg. Begge kan tilsidesættes for hvert bånd. Uden en tabel <c1/> bruger kørslen disse fem. GLONASS G1/G2, BeiDou B1/B2 og Galileo E6 er <b>ikke</b> blandt de navngivne bånd.

seg-79cc2ed8195b = En post <c1/> har en af tre former:

seg-67d0591c69d8 = et navn fra tabellen ovenfor, med valgfri <c1/>, <c2/> og, for <c3/>, <c4/>;

seg-8596194c81f2 = <c1/>: en signaludformning for lav jordbane (LEO) eller et repræsentativt signal fra forudindstillingsbiblioteket for typen <c2/> (<a1>LEO-SIGNAL.md</a1>), i ethvert bånd, tegnet med hver komponent (acquisition, data, pilot, frekvensdelte underbærebølger) og båndbegrænset til sin sendebåndbredde; C/N₀ og J/S henføres til den sporede komponent, og <c3/> mærker den blot. Forudindstillingerne er <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/> og <c15/>;

seg-2ca46a7f2949 = et brugerdefineret bånd: enhver <c1/> med <c2/>, <c3/> (<c4/>, <c5/> eller <c6/>) og <c7/>.

seg-fcb0f9fcffbf = Jammere (<c1/>) tager en <c2/>:

seg-457e5e95c677 = <c1/> — en kontinuert bølge (CW)-tone ved <c2/>;

seg-3120ac4f6710 = <c1/> — flad støj over <c2/>;

seg-7d975838a2e6 = <c1/> — flad støj over en bred <c2/> (en barrage-jammer): den samme tæthed som <c3/>, navngivet for sig, fordi typen <c4/> scorer den som bredbåndet;

seg-d13b177946d2 = <c1/> — et lineært savtandssvep på <c2/> hvert <c3/>;

seg-675fb74a89e4 = <c1/> — bredbåndsstøj, hvis spektrum er båndet <c2/>s egen modulation.

seg-64d7a14a198e = Hver angiver enten <c1/> eller en effektiv isotropisk udstrålet effekt <c2/> med en <c3/> (og eventuelt <c4/>), som går gennem typen <c5/>s frirumsdæmpning. <c6/> og <c7/> scripter tidslinjen.

seg-8e718c09f7d8 = Modtageren (<c1/>) fastlægger støjgulvet, <c2/> med <c3/> for antennetemperatur <c4/> og støjtal <c5/>, og sporingstærsklen.

seg-9b8078bd0df3 = Det primære vandfaldsdiagram dækker <c1/> (standard { "1160" } til { "1590" } MHz i { "430" } intervaller). Hver post <c2/> (<c3/>, <c4/>, <c5/>, <c6/>, standard { "200" } intervaller) tilføjer endnu et vandfaldsdiagram over sit eget frekvensområde på den samme tidslinje, for et spektrum, der spænder over flere bånd.

seg-a550e89c2907 = Interferenskæden

seg-12a2c08191c0 = For et signal med enhedsarealspektrum <c1/> og en jammer med enhedseffektspektrum <c2/> er den spektrale separationskoefficient (SSC) over modtagerbåndet <c3/> lig <c4/>, og den effektive bærebølge-til-støjtæthed med flere jammere er

seg-5c556163af62 = (Betz { "2001" }; Kaplan & Hegarty, <em>Understanding GPS/GNSS</em>, 3. udg., §{ "9.4" }). For én jammer er dette nøjagtigt anti-jam-ligningen for typen <c1/> med <c2/>; rapportens blok <c3/> kører typen <c4/>s egne funktioner på de samme linkinput og udskriver forskellen, som er nul op til afrunding.

seg-c11d0cb8e670 = Rapporten udskriver også den C/N₀, som typen <c1/> giver med sin Q-tabel. Tabellen indeholder lærebogsværdierne, fastholdt i testene til de lukkede former:

seg-5c21df11e35b = <b>CW og smalbånd: <c1/>.</b> En CW-tone på C/A-bærebølgen har <c2/>, så <c3/>, og tabellen og spektrene stemmer overens. I det medfølgende eksempel giver tonen { "17.98" } dB-Hz fra begge (tabellen gav { "19.74" }, da den indeholdt { "1.5" }).

seg-647e209b1efc = <b>Bredbånd og svep: <c1/>, siden { "0.36" }.</b> Det er hvid støj over hovedloben med signaleffekten i båndet normaliseret til én, <c2/>. Tabellen indeholdt { "1" } indtil { "0.36" }, omkring { "3" } dB pessimistisk (<c3/>).

seg-cd03b9c900e1 = Spektrummodellen udleder sine egne værdier af spektrene:

seg-b1327e66260b = <c1/> for støj tilpasset til C/A (<c2/>);

seg-45b2cf032a11 = <c1/> for flad støj fra nulpunkt til nulpunkt uden normaliseringen (<c2/>).

seg-6c2187f0e32b = For de jammere afviger de to udskrevne C/N₀-værdier altså stadig fra hinanden, med vilje.

seg-73dfbeabcac2 = Hver celle i vandfaldsdiagrammet er PSD'en middelværdidannet over sit frekvensinterval og sin række. Et chirp middelværdidannes nøjagtigt over rækken, hele svep plus det delvise; en jammer, der tændes eller slukkes midt i en række, vægtes efter sin driftscyklus. C/N₀-tidslinjen bruger de samme middelværdier, så billedet og tallene stemmer overens. For hvert bånd rapporterer tidslinjen J/S i båndet (jammereffekt inden for modtagerbåndbredden over signaleffekten). For hver jammer og hvert bånd angiver rapporten SSC, <c1/>, samlet J/S, J/S i båndet og den stabile C/N₀.

seg-2c214a0a30be = Det medfølgende eksempel

seg-4adc00a3ca10 = <c1/>: en tidslinje på { "60" } s, én række pr. sekund, en antenne på { "290" } K og et støjtal på { "2" } dB (gulv −{ "201.98" } dBW/Hz).

seg-94d1cebc134d = { "10" } s til { "40" } s: et chirp på { "16" } MHz omkring L1, svep på { "9" } µs, { "50" } mW ved { "100" } m.

seg-b85319af4f85 = Fra { "30" } s: en CW-tone på L1-bærebølgen, { "10" } mW ved { "1" } km.

seg-21e2b4e76832 = Fra { "45" } s: flad støj på { "2" } MHz på L2, modtaget ved −{ "135" } dBW.

seg-45dd378c692c = Hvad kørslen beregner:

seg-eecd7d7530bf = Mindste C/N₀

seg-1ead35e1aad5 = Første tab

seg-bfb55a322ece = Rækker med sporing

seg-863ea3f1fbe9 = { "3.23" } dB-Hz

seg-9aa0239a3a0c = { "10" } s

seg-9979940d2359 = { "44.73" } dB-Hz

seg-25364ef39455 = { "4.44" } dB-Hz

seg-c8d0bc71cccd = { "41.98" } dB-Hz

seg-c945914c444c = { "36.86" } dB-Hz

seg-9ff066fb53a6 = aldrig

seg-63d4f00f622d = { "44.08" } dB-Hz

seg-58b097691919 = CW-tonen er grunden til, at de to L1-signaler skilles ved { "40" } s. Den lander på toppen af C/A-spektret og holder C/A på { "17.98" } dB-Hz, under tærsklen på { "25" } dB-Hz. Den lander i nulpunktet af MBOC-spektret, så Galileo E1 vender tilbage til sin nominelle C/N₀, når chirpet stopper.

seg-064579d5fbac = Selve signalerne ligger omkring { "20" } dB under støjgulvet, så vandfaldsdiagrammet viser gulvet og jammerne; C/N₀-søjlerne viser, hvad afspredningen genvinder.

seg-023a7f163106 = De samme jammere driver en kædet mission i <c1/> (se <a1>CAMPAIGNS.md</a1>): uret kører i holdover, mens chirpet er tændt, og modtageren falder tilbage til Galileo E1 under CW-tonen.

seg-6b0edbfca134 = Ud over L-båndet

seg-63d1fd8043ed = <c1/> placerer LEO-signaler til positionering, navigation og tidssynkronisering (PNT) i fire bånd ved siden af GPS L1 C/A og Galileo E5a, hvert bånd med sin egen jammer, på en tidslinje på { "60" } s. Vandfaldsdiagrammet <c2/> er L-båndet; tre <c3/> tilføjer UHF ({ "455" } til { "475" } MHz), S ({ "2482" } til { "2502" } MHz) og C ({ "5005" } til { "5035" } MHz).

seg-6818247b5863 = { "10" } s: en CW-tone ved UHF-bærebølgen, modtaget ved −{ "120" } dBW.

seg-02de8390de31 = { "20" } s: chirpet fra L-bånd-eksemplet ({ "16" } MHz omkring L1, svep på { "9" } µs, { "50" } mW ved { "100" } m).

seg-47e55dfd4e0d = { "30" } s: bredbåndsstøj, { "40" } MHz omkring { "1185" } MHz, −{ "118" } dBW.

seg-dfa416032770 = { "40" } s: smalbåndsstøj, { "2" } MHz ved S-bærebølgen, −{ "128" } dBW.

seg-1d119727a749 = { "50" } s: støj tilpasset C-bånd-signalets eget spektrum, −{ "124" } dBW.

seg-abacb60b16a3 = Hvad kørslen beregner (de udformede signalers C/N₀ er den for den sporede komponent, så den nominelle værdi ligger under den samlede modtagne effekt med den sporede andel):

seg-1c921b6299e4 = repræsentativ, BPSK({ "5" }), −{ "150" } dBW

seg-5331cde832fb = { "34.38" } dB-Hz

seg-35588b19fd72 = specifikationens minimum

seg-7d3639369444 = { "3.38" } dB-Hz

seg-9eef1ec7858f = { "38.51" } dB-Hz

seg-c6743d980e6b = publiceret udformning, −{ "144.9" } dBW

seg-245bf7d080b3 = { "1190.51625" } MHz

seg-f2aed7e062bf = { "46.29" } dB-Hz

seg-c6a19eb8e0b9 = { "41.69" } dB-Hz

seg-a6f2bb955ca2 = repræsentativ, BPSK({ "10" }), −{ "152" } dBW

seg-b9312cc881d2 = { "40.35" } dB-Hz

seg-03bb124d45d2 = Kun chirpet tager et signal væk (GPS L1 C/A, fra { "20" } s). Hver anden jammer forringer kun det bånd, dens spektrum når: den tilpassede støj i C-båndet har for eksempel en SSC på −{ "71.87" } dB/Hz med C-bånd-signalet og under −{ "133" } dB/Hz med hvert andet bånd.

seg-a8bea652a85d = Det samme maskineri driver scenarierne for LEO-PNT-robusthed (<a1>LEO-PNT.md</a1>):

seg-cf7bc2f52cad = <c1/> trinvis hæver en barrage-jammer på { "40" } MHz ved { "1185" } MHz med { "5" } dB hvert { "10" } s fra −{ "125" } dBW. GPS L5 mistes ved trinnet på −{ "105" } dBW, Galileo E5a ved −{ "100" } dBW og Xona X5 ved −{ "95" } dBW, mens et repræsentativt LEO-L-bånd-signal modtaget ved −{ "135" } dBW stadig spores ved −{ "90" } dBW: modtaget effekt køber J/S-margin dB for dB.

seg-94b65c0e6087 = <c1/> er et kampagnesvep af en kørsel af <c2/> over effekten af en barrage i L5-båndet (<a1>CAMPAIGNS.md</a1>).

seg-67279a0780e4 = <c1/> er en kædet kampagne, hvis faser læser GNSS- og LEO-C/N₀ fra kørsler af <c2/>, med paneler for S- og C-bånd.

seg-42b00ae14ffe = IQ, SigMF og Welch

seg-3418c31c4318 = <c1/> tegner modellen på ét tidspunkt som komplekse in-fase- og kvadratursampler (IQ), skriver dem som en SigMF-optagelse (<c2/> eller <c3/>), læser optagelsen tilbage og estimerer dens PSD med Welchs metode (Hann-vindue, { "50" } % overlap, middelværdidannede periodogrammer, skaleret til tæthed). Termisk støj, signaler og støjlignende jammere tegnes interval for interval ud fra modellens egen tæthed; en tone og et chirp tegnes som virkelige bølgeformer. Med kun støjlignende jammere ligger Welch-estimatet inden for { "0.1" } dB af modellen (median). Et periodisk chirp er et linjespektrum ved sin svephastighed, med krusninger og haler uden for sine båndkanter, som den glatte model udelader: i det medfølgende eksempel stemmer den samlede effekt inden for { "0.02" } %, og det mediane interval afviger med { "0.5" } dB. Snapshottet er en fil skrevet til analyse; intet udsendes, og ingen radiohardware styres.

seg-a3b0a61b5efe = <c1/> (kun native builds) læser en virkelig SigMF-optagelse fra <c2/> (datafilen har som standard den samme stamme med <c3/>), estimerer dens PSD og udskriver den ved siden af modellen ved optagelsens frekvenser. En SigMF-fil har ingen absolut effektkalibrering, så rapporten angiver den mediane forskydning og formen, ikke et niveau.

seg-04b08e06811d = I WebAssembly-buildet er filaflæsninger ikke tilgængelige; <c1/> og <c2/> arbejder på de bytes, siden leverer.

seg-69b384afe05d = Signal-PSD'er og SSC'er

seg-a65b87c51f05 = BPSK(n)-hovedlobe 2n × { "1.023" } MHz nulpunkt til nulpunkt; BOC({ "1,1" })-lober centreret ved ±{ "1.023" } MHz (Betz { "2001" }); SSC'er −{ "61.86" } / −{ "64.87" } / −{ "67.88" } dB/Hz for C/A×C/A, BOC({ "1,1" })×BOC({ "1,1" }), C/A×BOC({ "1,1" }) ud fra deres lukkede Parseval-former, værdierne bag de publicerede −{ "61.8" } / −{ "64.8" } / −{ "67.8" } dB/Hz; Q = { "1" } (CW) og { "1.5" } (tilpasset) (Kaplan & Hegarty §{ "9.4" }); tabelposterne for typen <c1/> er lig de lukkede former: CW og smalbånd Q = { "1" }, bredbånd og svep Q = { "2" } (hvid støj over hovedloben, effekt i båndet normaliseret; { "1" } indtil { "0.36" })

seg-d2afc6e05969 = Vandfaldsdiagram, J/S og C/N₀-tidslinje

seg-c44413d5a060 = Reduceres nøjagtigt til kæden for typen <c1/>; jammereffekter, tidslinje og båndbredder er input

seg-304f4aeaf4cb = SigMF-kodek og Welch-estimat

seg-7a642dd02e5c = Rundture, en direkte diskret Fouriertransformation, identiteter for hvid støj og Parseval; ingen tredjepartsoptagelse findes i repositoriet

seg-1138c9e62a21 = Vandfaldsdiagram for flere bånd med udformede signaler og jammere for hvert bånd

seg-ac38681004e9 = Reduceres til L-bånd-kæden (et bånd med én komponent giver de samme tal som før udvidelsen) og til de validerede signalspektre; de udformede signaler, jammere og båndbredder er input

seg-0c0c625a8ff5 = En rettelse til en udbredt forkortelse: BOC({ "1,1" })-spektrets lober er <em>centreret</em> ved ±{ "1.023" } MHz (mellem bærebølgens nulpunkt og nulpunktet ved { "2.046" } MHz), men PSD'ens maksimum ligger ved ±{ "0.759" } MHz, hvor <c1/> med <c2/>. Testene fastholder begge.

seg-6ab6e241f7e5 = Linjestrukturen i spredekoden (linjerne på { "1" } kHz i C/A): en tone scores mod den glatte omhylling, ikke mod den nærmeste kodelinje.

seg-4be08100a707 = Automatisk forstærkningsregulering, kvantisering, pulsblanking og notchfiltrering.

seg-0f195ea4126e = Modtageantennens mønster mod jammeren ud over ét forstærkningstal.

seg-d3d03da9c962 = Flerbrugerinterferens mellem satellitter i ét bånd.

seg-db5c7566f49e = Et udformet signals emissioner uden for dets sendebåndbredde: dets spektrum afkortes dér, så ingen emission uden for båndet når et nabobånd.

seg-9cbea7151036 = Et chirps virkning på sløjfen ved svephastigheder, der kan sammenlignes med sløjfebåndbredden: dets C/N₀ bruger det rækkemiddelværdidannede spektrum.

seg-d19ed16f451c = J. W. Betz, "Binary Offset Carrier Modulations for Radionavigation," <em>NAVIGATION</em> { "48" }({ "4" }), { "2001" }.

seg-e2225151c10b = E. D. Kaplan og C. J. Hegarty (red.), <em>Understanding GPS/GNSS: Principles and Applications</em>, 3. udg., Artech House, { "2017" }, §{ "9.4" }.

seg-85b2d251a221 = G. W. Hein et al., "MBOC: The New Optimized Spreading Modulation Recommended for Galileo L1 OS and GPS L1C," <em>Inside GNSS</em>, maj/juni { "2006" }.

seg-b091f7c36ab9 = P. D. Welch, "The Use of Fast Fourier Transform for the Estimation of Power Spectra," <em>IEEE Transactions on Audio and Electroacoustics</em> { "15" }({ "2" }), { "1967" }.

seg-b65142371229 = IS-GPS-200, IS-GPS-705; Galileo OS SIS ICD.

seg-d28b74d8c755 = SigMF-specifikationen, <a1>https://sigmf.org/</a1> (kilde: <a2>https://github.com/sigmf/SigMF</a2>).

seg-a9b968473b2a = <s1>Forrige</s1>Integritet og sikkerhed

seg-d5264da8bf65 = <s1>Næste</s1>ARAIM-reference
