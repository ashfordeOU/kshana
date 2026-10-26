# docs--spectrum: translations (nb)

seg-6cb7a787ac67 = Referanser

seg-cbf0f9bcd2d8 = Uavhengig referanse

seg-6e0cb6acc073 = VALIDATED

seg-33f4c7af9c53 = Bærebølge

seg-c5ce76c91ff7 = Merkelapp

seg-a86ce24d81de = Bånd

seg-ea152d84aabc = { "465" } MHz

seg-278d0b375f6f = { "20.46" } MHz

seg-39e207bee75b = { "2492.028" } MHz

seg-48fabff33863 = { "5020" } MHz

seg-72f051e2d7e1 = Signal

seg-47408d30d095 = Nominell C/N₀

seg-995748f9c74c = { "49.41" } dB-Hz

seg-5393b075ff7f = { "43.48" } dB-Hz

seg-4321ccaeeca5 = { "46.73" } dB-Hz

seg-59fd1427d61b = { "54.51" } dB-Hz

seg-0f47178201ca = { "49.23" } dB-Hz

seg-f8e6beeceedd = { "47.41" } dB-Hz

seg-53a7343c076e = Påstand

seg-430edd66bda0 = Ikke modellert

seg-64509c048541 = Hva som er modellert

seg-f07519ff8071 = Kilde: <c1/>

seg-901c3e032de7 = Spektrummodell og fossefall

seg-eac92092dd34 = Scenariotypen <c1/> bygger GNSS-L-båndet (Global Navigation Satellite System), og ethvert annet bånd et utformet signal opptar (ultrahøyfrekvens (UHF), S-bånd, C-bånd), som én effekttetthetsspektrum (PSD), lar det endre seg over en skriptet jammer-tidslinje, og reduserer det til det en sporingssløyfe bryr seg om: forholdet mellom jammer og signal (J/S) og det effektive forholdet mellom bærebølge og støytetthet (C/N₀) for hvert bånd. Resultatet tegnes som et fossefall (frekvens på tvers, tid nedover, farge for effekt) ved siden av C/N₀-søyler per bånd, og det leser og skriver SigMF-opptak (Signal Metadata Format), slik at et ekte opptak kan estimeres og plottes ved siden av modellen.

seg-0007b6ba97ca = Skriv det medfølgende eksempelet til en fil og kjør det:

seg-5e205b189b26 = I en utsjekking kjører <c1/> den samme filen.

seg-261deb22b4fa = Kode: <c1/> (modellen, scenariotypen og Welch-estimatoren), <c2/> (opptakskodeken), <c3/> (signalspektrene med enhetsareal og den spektrale separasjonskoeffisienten) og <c4/> (forhåndsinnstillingene for signalutforming som et bånd kan navngi).

seg-bb1153873209 = Modulasjon

seg-9758b36b554c = Standard mottatt effekt

seg-a1a68286b809 = Standard mottakerbåndbredde

seg-27a2cdc8183f = { "1575.42" } MHz

seg-66a103496266 = binær faseskiftmodulasjon, BPSK({ "1" })

seg-f386c2e2e352 = −{ "158.5" } dBW (IS-GPS-200)

seg-50112ba8867d = { "2.046" } MHz

seg-b7755cb9a384 = multiplekset binær offset-bærebølge, MBOC(6,1,1/11), eller binær offset-bærebølge BOC({ "1,1" })

seg-6043a4ef45ca = −{ "157.25" } dBW (Galileo OS SIS ICD Issue { "2.1" }, Table { "12" })

seg-6dc5e3668a78 = { "14.322" } MHz

seg-f03380403a2a = { "1227.60" } MHz

seg-06c245582533 = BPSK({ "1" }) (CM- og CL-kodene tidsmultiplekset)

seg-fa56c0085dbc = −{ "160.0" } dBW (IS-GPS-200)

seg-1982a811e1ef = { "1176.45" } MHz

seg-dd074e33242e = BPSK({ "10" })

seg-f30f2e48a3bf = −{ "157.9" } dBW (IS-GPS-705)

seg-898ae19a946b = −{ "155.25" } dBW (Galileo OS SIS ICD Issue { "2.1" }, Table { "12" })

seg-3216d5cd918d = GPS (Global Positioning System) L1 C/A er grov-/innhentingskoden (coarse/acquisition); L2C er det sivile L2-signalet; IS-GPS-200 og IS-GPS-705 er GPS-grensesnittspesifikasjonene; Galileo OS SIS ICD er Galileo Open Service Signal-in-Space Interface Control Document. De mottatte effektene er spesifikasjonenes minimumsverdier; båndbreddene er modelleringsvalg. Begge kan overstyres per bånd. Uten en <c1/>-tabell bruker kjøringen disse fem. GLONASS G1/G2, BeiDou B1/B2 og Galileo E6 er <b>ikke</b> blant de navngitte båndene.

seg-79cc2ed8195b = En <c1/>-oppføring har en av tre former:

seg-67d0591c69d8 = et navn fra tabellen ovenfor, med valgfri <c1/>, <c2/> og, for <c3/>, <c4/>;

seg-8596194c81f2 = <c1/>: en signalutforming for lav jordbane (LEO) eller en representativ en fra forhåndsinnstillingsbiblioteket til <c2/>-typen (<a1>LEO-SIGNAL.md</a1>), i et hvilket som helst bånd, tegnet med alle komponenter (innhenting, data, pilot, frekvensdelte underbærebølger) og båndbegrenset til sendebåndbredden; C/N₀ og J/S refereres til den sporede komponenten, og <c3/> bare merker den. Forhåndsinnstillingene er <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/> og <c15/>;

seg-2ca46a7f2949 = et tilpasset bånd: en hvilken som helst <c1/> med <c2/>, <c3/> (<c4/>, <c5/> eller <c6/>) og <c7/>.

seg-fcb0f9fcffbf = Jammere (<c1/>) tar en <c2/>:

seg-457e5e95c677 = <c1/> — en tone med kontinuerlig bølge (CW) ved <c2/>;

seg-3120ac4f6710 = <c1/> — flat støy over <c2/>;

seg-7d975838a2e6 = <c1/> — flat støy over en bred <c2/> (en bredbåndsjammer): samme tetthet som <c3/>, navngitt separat fordi <c4/>-typen skårer den som bredbånd;

seg-d13b177946d2 = <c1/> — et lineært sagtannsveip på <c2/> hver <c3/>;

seg-675fb74a89e4 = <c1/> — bredbåndsstøy der spekteret er båndets <c2/> egen modulasjon.

seg-64d7a14a198e = Hver av dem oppgir enten <c1/>, eller en effektiv isotropisk utstrålt effekt <c2/> med en <c3/> (og eventuelt <c4/>), som går gjennom friromstapet til <c5/>-typen. <c6/> og <c7/> skripter tidslinjen.

seg-8e718c09f7d8 = Mottakeren (<c1/>) setter støygulvet, <c2/> med <c3/> for antennetemperatur <c4/> og støytall <c5/>, og sporingsterskelen.

seg-9b8078bd0df3 = Hovedfossefallet dekker <c1/> (standard { "1160" } til { "1590" } MHz i { "430" } bins). Hver <c2/>-oppføring (<c3/>, <c4/>, <c5/>, <c6/>, standard { "200" } bins) legger til et nytt fossefall over sitt eget frekvensområde på samme tidslinje, for et spektrum som spenner over flere bånd.

seg-a550e89c2907 = Interferenskjeden

seg-12a2c08191c0 = For et signal med enhetsarealspektrum <c1/> og en jammer med enhetseffektspektrum <c2/> er den spektrale separasjonskoeffisienten (SSC) over mottakerbåndet <c3/> lik <c4/>, og den effektive bærebølge-til-støytettheten med flere jammere er

seg-5c556163af62 = (Betz { "2001" }; Kaplan & Hegarty, <em>Understanding GPS/GNSS</em>, 3. utg., §{ "9.4" }). For én jammer er dette nøyaktig anti-jam-ligningen til <c1/>-typen med <c2/>; rapportens <c3/>-blokk kjører <c4/>-typens egne funksjoner på de samme koblingsinndataene og skriver ut differansen, som er null innenfor avrunding.

seg-c11d0cb8e670 = Rapporten skriver også ut C/N₀ som <c1/>-typen gir med Q-tabellen sin. Tabellen inneholder lærebokverdiene, festet i testene til de lukkede formene:

seg-5c21df11e35b = <b>CW og smalbånd: <c1/>.</b> En CW-tone på C/A-bærebølgen har <c2/>, altså <c3/>, og tabellen og spektrene stemmer overens. I det medfølgende eksempelet gir tonen { "17.98" } dB-Hz fra begge (tabellen ga { "19.74" } da den inneholdt { "1.5" }).

seg-647e209b1efc = <b>Bredbånd og feid: <c1/>, siden { "0.36" }.</b> Det er hvit støy over hovedloben med signaleffekten i båndet normalisert til én, <c2/>. Tabellen inneholdt { "1" } fram til { "0.36" }, omtrent { "3" } dB pessimistisk (<c3/>).

seg-cd03b9c900e1 = Spektrummodellen utleder sine egne verdier fra spektrene:

seg-b1327e66260b = <c1/> for støy tilpasset C/A (<c2/>);

seg-45b2cf032a11 = <c1/> for flat støy fra null til null uten normaliseringen (<c2/>).

seg-6c2187f0e32b = For disse jammerne avviker altså de to utskrevne C/N₀-verdiene fortsatt fra hverandre, med hensikt.

seg-73dfbeabcac2 = Hver fossefallscelle er PSD-en gjennomsnittet over sin frekvensbin og sin rad. Et chirp midles nøyaktig over raden, hele sveip pluss det delvise; en jammer som slås på eller av midt i en rad vektes etter driftssyklusen sin. C/N₀-tidslinjen bruker de samme gjennomsnittene, slik at bildet og tallene stemmer overens. Per bånd rapporterer tidslinjen J/S i båndet (jammereffekt innenfor mottakerbåndbredden over signaleffekten). Per jammer og bånd oppgir rapporten SSC, <c1/>, total J/S, J/S i båndet og stabil C/N₀.

seg-2c214a0a30be = Det medfølgende eksempelet

seg-4adc00a3ca10 = <c1/>: en tidslinje på { "60" } s, én rad per sekund, en antenne på { "290" } K og et støytall på { "2" } dB (gulv −{ "201.98" } dBW/Hz).

seg-94d1cebc134d = { "10" } s til { "40" } s: et chirp på { "16" } MHz rundt L1, sveip på { "9" } µs, { "50" } mW på { "100" } m.

seg-b85319af4f85 = Fra { "30" } s: en CW-tone på L1-bærebølgen, { "10" } mW på { "1" } km.

seg-21e2b4e76832 = Fra { "45" } s: flat støy på { "2" } MHz på L2 mottatt ved −{ "135" } dBW.

seg-45dd378c692c = Dette beregner kjøringen:

seg-eecd7d7530bf = Minimum C/N₀

seg-1ead35e1aad5 = Første tap

seg-bfb55a322ece = Rader med sporing

seg-863ea3f1fbe9 = { "3.23" } dB-Hz

seg-9aa0239a3a0c = { "10" } s

seg-9979940d2359 = { "44.73" } dB-Hz

seg-25364ef39455 = { "4.44" } dB-Hz

seg-c8d0bc71cccd = { "41.98" } dB-Hz

seg-c945914c444c = { "36.86" } dB-Hz

seg-9ff066fb53a6 = aldri

seg-63d4f00f622d = { "44.08" } dB-Hz

seg-58b097691919 = CW-tonen er grunnen til at de to L1-signalene skilles lag ved { "40" } s. Den treffer toppen av C/A-spekteret og holder C/A på { "17.98" } dB-Hz, under terskelen på { "25" } dB-Hz. Den treffer nullpunktet i MBOC-spekteret, så Galileo E1 går tilbake til nominell C/N₀ når chirpet stopper.

seg-064579d5fbac = Selve signalene ligger omtrent { "20" } dB under støygulvet, så fossefallet viser gulvet og jammerne; C/N₀-søylene viser hva avspredningen gjenvinner.

seg-023a7f163106 = De samme jammerne driver et lenket oppdrag i <c1/> (se <a1>CAMPAIGNS.md</a1>): klokken går i holdover mens chirpet er på, og mottakeren faller tilbake til Galileo E1 under CW-tonen.

seg-6b0edbfca134 = Utover L-båndet

seg-63d1fd8043ed = <c1/> legger LEO-signaler for posisjonering, navigasjon og tidssynkronisering (PNT) i fire bånd ved siden av GPS L1 C/A og Galileo E5a, hvert bånd med sin egen jammer, på en tidslinje på { "60" } s. Fossefallet <c2/> er L-båndet; tre <c3/> legger til UHF ({ "455" } til { "475" } MHz), S ({ "2482" } til { "2502" } MHz) og C ({ "5005" } til { "5035" } MHz).

seg-6818247b5863 = { "10" } s: en CW-tone ved UHF-bærebølgen, −{ "120" } dBW mottatt.

seg-02de8390de31 = { "20" } s: chirpet fra L-bånd-eksempelet ({ "16" } MHz rundt L1, sveip på { "9" } µs, { "50" } mW på { "100" } m).

seg-47e55dfd4e0d = { "30" } s: bredbåndsstøy, { "40" } MHz rundt { "1185" } MHz, −{ "118" } dBW.

seg-dfa416032770 = { "40" } s: smalbåndsstøy, { "2" } MHz ved S-bærebølgen, −{ "128" } dBW.

seg-1d119727a749 = { "50" } s: støy tilpasset C-bånd-signalets eget spektrum, −{ "124" } dBW.

seg-abacb60b16a3 = Dette beregner kjøringen (C/N₀ for de utformede signalene er den til den sporede komponenten, så nominell verdi ligger under total mottatt effekt med den sporede andelen):

seg-1c921b6299e4 = representativ, BPSK({ "5" }), −{ "150" } dBW

seg-5331cde832fb = { "34.38" } dB-Hz

seg-35588b19fd72 = spesifikasjonens minimum

seg-7d3639369444 = { "3.38" } dB-Hz

seg-9eef1ec7858f = { "38.51" } dB-Hz

seg-c6743d980e6b = publisert utforming, −{ "144.9" } dBW

seg-245bf7d080b3 = { "1190.51625" } MHz

seg-f2aed7e062bf = { "46.29" } dB-Hz

seg-c6a19eb8e0b9 = { "41.69" } dB-Hz

seg-a6f2bb955ca2 = representativ, BPSK({ "10" }), −{ "152" } dBW

seg-b9312cc881d2 = { "40.35" } dB-Hz

seg-03bb124d45d2 = Bare chirpet tar et signal bort (GPS L1 C/A, fra { "20" } s). Hver av de andre jammerne forringer bare båndet spekteret deres når: C-bånd-tilpasset støy har for eksempel en SSC på −{ "71.87" } dB/Hz med C-bånd-signalet og under −{ "133" } dB/Hz med alle andre bånd.

seg-a8bea652a85d = Det samme maskineriet driver LEO-PNT-robusthetsscenarioene (<a1>LEO-PNT.md</a1>):

seg-cf7bc2f52cad = <c1/> trinner én bredbåndsjammer på { "40" } MHz ved { "1185" } MHz opp med { "5" } dB hvert { "10" } s fra −{ "125" } dBW. GPS L5 går tapt ved trinnet på −{ "105" } dBW, Galileo E5a ved −{ "100" } dBW og Xona X5 ved −{ "95" } dBW, mens et representativt LEO L-bånd-signal mottatt ved −{ "135" } dBW fortsatt spores ved −{ "90" } dBW: mottatt effekt kjøper J/S-margin dB for dB.

seg-94b65c0e6087 = <c1/> er et kampanjesveip av en <c2/>-kjøring over effekten til en L5-bånd-bredbåndsjammer (<a1>CAMPAIGNS.md</a1>).

seg-67279a0780e4 = <c1/> er en lenket kampanje der fasene leser GNSS- og LEO-C/N₀ fra <c2/>-kjøringer, med S- og C-bånd-paneler.

seg-42b00ae14ffe = IQ, SigMF og Welch

seg-3418c31c4318 = <c1/> tegner modellen ved ett tidspunkt som komplekse IQ-sampler (in-phase og quadrature), skriver dem som et SigMF-opptak (<c2/> eller <c3/>), leser opptaket tilbake og estimerer PSD-en med Welchs metode (Hann-vindu, { "50" } % overlapp, midlede periodogrammer, tetthetsskalert). Termisk støy, signaler og støylignende jammere tegnes bin for bin fra modellens egen tetthet; en tone og et chirp tegnes som ekte bølgeformer. Med bare støylignende jammere ligger Welch-estimatet innenfor { "0.1" } dB av modellen (median). Et periodisk chirp er et linjespektrum ved sveiphastigheten, med rippel og haler forbi båndkantene som den glatte modellen utelater: i det medfølgende eksempelet stemmer total effekt innenfor { "0.02" } % og median-bin avviker med { "0.5" } dB. Øyeblikksbildet er en fil skrevet for analyse; ingenting sendes og ingen radiomaskinvare styres.

seg-a3b0a61b5efe = <c1/> (bare native bygg) leser et ekte SigMF-opptak fra <c2/> (datafilen får som standard samme stamme med <c3/>), estimerer PSD-en og skriver den ut ved siden av modellen ved opptakets frekvenser. En SigMF-fil har ingen absolutt effektkalibrering, så rapporten oppgir medianforskyvningen og formen, ikke et nivå.

seg-04b08e06811d = I WebAssembly-bygget er filleseing ikke tilgjengelig; <c1/> og <c2/> fungerer på bytes som siden leverer.

seg-69b384afe05d = Signal-PSD-er og SSC-er

seg-a65b87c51f05 = BPSK(n) hovedlobe 2n × { "1.023" } MHz fra null til null; BOC({ "1,1" })-lober sentrert ved ±{ "1.023" } MHz (Betz { "2001" }); SSC-er −{ "61.86" } / −{ "64.87" } / −{ "67.88" } dB/Hz for C/A×C/A, BOC({ "1,1" })×BOC({ "1,1" }), C/A×BOC({ "1,1" }) fra de lukkede Parseval-formene, verdiene bak de publiserte −{ "61.8" } / −{ "64.8" } / −{ "67.8" } dB/Hz; Q = { "1" } (CW) og { "1.5" } (tilpasset) (Kaplan & Hegarty §{ "9.4" }); tabelloppføringene til <c1/>-typen er lik de lukkede formene: CW og smalbånd Q = { "1" }, bredbånd og feid Q = { "2" } (hvit støy over hovedloben, effekt i båndet normalisert; { "1" } fram til { "0.36" })

seg-d2afc6e05969 = Fossefall, J/S og C/N₀-tidslinje

seg-c44413d5a060 = Reduseres nøyaktig til kjeden i <c1/>-typen; jammereffektene, tidslinjen og båndbreddene er inndata

seg-304f4aeaf4cb = SigMF-kodek og Welch-estimat

seg-7a642dd02e5c = Rundturer, en direkte diskret Fourier-transformasjon, hvitstøy- og Parseval-identiteter; ingen tredjepartsopptak ligger i repositoriet

seg-1138c9e62a21 = Flerbåndsfossefall med utformede signaler og jammere per bånd

seg-ac38681004e9 = Reduseres til L-bånd-kjeden (et bånd med én komponent gir de samme tallene som før utvidelsen) og til de validerte signalspektrene; de utformede signalene, jammerne og båndbreddene er inndata

seg-0c0c625a8ff5 = En rettelse til en vanlig forenkling: lobene i BOC({ "1,1" })-spekteret er <em>sentrert</em> ved ±{ "1.023" } MHz (mellom bærebølgenullet og nullet ved { "2.046" } MHz), men maksimum for PSD-en ligger ved ±{ "0.759" } MHz, der <c1/> med <c2/>. Testene fester begge.

seg-6ab6e241f7e5 = Linjestruktur i spredekoden ({ "1" } kHz-linjene i C/A): en tone skåres mot den glatte omhyllingen, ikke mot nærmeste kodelinje.

seg-4be08100a707 = Automatisk forsterkningsregulering, kvantisering, pulsblanking og hakkfiltrering.

seg-0f195ea4126e = Mottaksantennens mønster mot jammeren utover ett forsterkningstall.

seg-d3d03da9c962 = Flertilgangsinterferens mellom satellitter i ett bånd.

seg-db5c7566f49e = Et utformet signals utstråling utenfor sendebåndbredden: spekteret er avkortet der, så ingen utstråling utenfor båndet når et nabobånd.

seg-9cbea7151036 = Et chirps virkning på sløyfen ved sveiphastigheter som kan sammenlignes med sløyfebåndbredden: C/N₀ bruker det radmidlede spekteret.

seg-d19ed16f451c = J. W. Betz, "Binary Offset Carrier Modulations for Radionavigation," <em>NAVIGATION</em> { "48" }({ "4" }), { "2001" }.

seg-e2225151c10b = E. D. Kaplan and C. J. Hegarty (eds.), <em>Understanding GPS/GNSS: Principles and Applications</em>, 3rd ed., Artech House, { "2017" }, §{ "9.4" }.

seg-85b2d251a221 = G. W. Hein et al., "MBOC: The New Optimized Spreading Modulation Recommended for Galileo L1 OS and GPS L1C," <em>Inside GNSS</em>, May/June { "2006" }.

seg-b091f7c36ab9 = P. D. Welch, "The Use of Fast Fourier Transform for the Estimation of Power Spectra," <em>IEEE Transactions on Audio and Electroacoustics</em> { "15" }({ "2" }), { "1967" }.

seg-b65142371229 = IS-GPS-200, IS-GPS-705; Galileo OS SIS ICD.

seg-d28b74d8c755 = SigMF-spesifikasjonen, <a1>https://sigmf.org/</a1> (kilde: <a2>https://github.com/sigmf/SigMF</a2>).

seg-a9b968473b2a = <s1>Forrige</s1>Integritet og sikkerhet

seg-d5264da8bf65 = <s1>Neste</s1>ARAIM-referanse
