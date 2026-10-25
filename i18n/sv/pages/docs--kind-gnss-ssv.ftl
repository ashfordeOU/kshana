# docs--kind-gnss-ssv: translations (sv)

seg-37d29d8303fe = km

seg-834408a40783 = min

seg-1b94e5a24a2d = Källa: <c1/>

seg-ee3ecc6e0330 = <c1/> (scenario kind)

seg-d07af7221334 = Scenariotyp i motorn v{ $version }, familj <a1>Navigering för rymdanvändare</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en tjänst för skydd av människoliv. Varje etikett här är motorns eller verifieringsmatrisens; en kind är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidence i README).

seg-d6d7bca305dc = MODELLED GNSS-tillgänglighet och länkstyrka i Space Service Volume och bortom den: för en användare på en sfär (ICG-häftets globala skal) eller på en keplersk bana (LEO till månöverföring) räknar den, per konstellation (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) och för alla tillsammans, de signaler som är användbara över en C/N0-tröskel - tillgänglighet för minst en och för fyra signaler, maximal bortfallstid, mottagen C/N0, DOP (dilution of precision), länkar via huvudlob mot sidolob - med ett sändningsdiagram från häftet, parametriskt eller användarlevererat, valfria effekter av limbstråle-jonosfär, plasmasfär och atmosfär och en valfri utformning av en svagsignalmottagare; också ett GNSS-EKF ombord för HEO- och månöverföringsfarkoster (banmekanik, solstrålningstryck, tredje kroppar, klocka) och relativ navigering för en formation av flera farkoster med enkeldifferentierade pseudoavstånd. Kontrollerad mot tabellerna i ICG SSV-häftet under en förhandsregistrering (xval/gnss-ssv)

seg-d739ae994bf0 = En körning av <c1/> sammanfattas som: gnss-ssv trajectory { "497" } to { "58622" } km altitude: l1 combined { "1" }+ { "100.0" }% { "4" }+ { "97.4" }% (max outage { "0" } min); l5 combined { "1" }+ { "100.0" }% { "4" }+ { "100.0" }% (max outage { "0" } min)

seg-79d2e350ed73 = Obligatoriska fält: <c1/>

seg-7fc75803140d = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-cebc76420d69 = Exemplet <c1/> anger bland annat:

seg-ce3b64e8c1f4 = [l1, l5]

seg-8b8f5598c9d7 = [gps, glonass, galileo, bds]

seg-b02a3ef32d54 = HEO, high-gain nadir and patch zenith antennas, parametric s

seg-666a68730eaa = [booklet-high-gain-nadir, booklet-patch-zenith]

seg-3421a66993bd = heo

seg-8974ff39f695 = parametric

seg-1d65b71c5de0 = { "5" } medföljande scenarier använder denna kind; de övriga finns i <a1><c1/></a1>.

seg-8ac8f00f6c77 = 1/m^{ "3" }

seg-15ca016a7a4f = Resultatetikett (motorns egen): MODELLED: en geometrisk svep- och länkbudgetberäkning. Häftets diagram är en huvudlob med konstant effekt, det parametriska diagrammet en representativ ersättning och limbstrålens medium en enkel angiven modell; ingenting här är en mätning av en signal i rymden. Tillgänglighets- och bortfallssiffrorna följer metoden i

seg-7dae5e291c8b = Diagrammet som motorn skriver för scenarios/gnss-ssv-heo.toml, kind gnss-ssv

seg-0aae0574c5e6 = <b>MODELLED</b> Tillgänglighetssvepen i kind <c1/>: per konstellation (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) och kombinerat, andelen (användare, epok)-par med minst en och minst fyra signaler samt det längsta bortfallet, för en användare på en sfär

seg-07c94d5ad15c = <b>MODELLED</b> Läget <c2/> i kind <c1/>: ett utvidgat Kalman-filter med nio tillstånd (position, hastighet, mottagarklockans bias och drift, en skala för solstrålningstryck) på pseudoavstånd vars tillgänglighet, brus och C/N0 kommer från samma länk

seg-41bfe74c6f6f = <b>MODELLED</b> Läget <c2/> i kind <c1/>: en chief och deputies kör var och en det absoluta filtret; deputyns position relativt chief skattas genom att subtrahera de absoluta skattningarna och med ett relativt filter på enkeldifferentierade pseudo

seg-de9a2a5b5f04 = <b>MODELLED</b> Tillgänglighetssvepen i kind <c1/>: per konstellation (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) och kombinerat, andelen (användare, epok)-par med minst en. Oracle (ExternalDataset): ICG Space Service Volume-häftet (UN OOSA ST/SPACE/75, { "2018" }), självt en simulering, jämfört under en förhandsregistrering som fastställdes före körningen (xval/gnss-ssv/PREREGISTRATION.md; resultat i xval/gnss-ssv/RESULTS.md, fastlåsta av tests/ssv_booklet_results.rs, inklusive missar). Körning { "1" } på den förhandsregistrerade tolkningen: konstanterna för minsta utstrålade effekt och månens tröskel stämmer (S0, S6 met); övre och nedre SSV, RF-tröskel

seg-f0b778c4922a = <b>MODELLED</b> En Chapman-jonosfär, en plasmasfär av Gallagher-typ och en neutral atmosfär (refraktivitetsböjning, syreabsorption, defokusering) integrerade längs den raka. Oracle (InternalConsistency): Slutna former och publicerade storleksordningar i testerna (en Chapman-skikts topp och böjningen vid ytans limb, några TECU plasmasfär på en GPS-till-GEO-stråle); mottagarutformningen återanvänder modellerna för förvärv och spårningsslinga och deras tester. Inga uppmätta data från limbsondering eller svagsignalmottagning jämförs med den

seg-77cef183420e = <b>MODELLED</b> Läget <c2/> i kind <c1/>: ett utvidgat Kalman-filter med nio tillstånd (position, hastighet, mottagarklockans bias och drift, en solstrålningstryck-sc. Oracle (InternalConsistency): Simulerad referens mot filtrets egen skattning (ett konsistent filters genomsnittliga normaliserade skattningsfelskvadrat är cirka { "3" } för positionen) och determinism för ett fast frö. Inga flygdata eller inspelade GNSS-data från höga banor jämförs; solen och månen är cirkulära ersättningar med låg precision

seg-429e154cd691 = <b>MODELLED</b> Läget <c2/> i kind <c1/>: en chief och deputies kör var och en det absoluta filtret; deputyns position relativt chief skattas genom att subtrahera. Oracle (InternalConsistency): Samma simulerade referens som för det absoluta filtret: det relativa filtrets fel mot det sanna relativa tillståndet, och kontrollen att det presterar minst lika bra som att subtrahera två oberoende absoluta positionsbestämningar. Inga flygdata från formationer jämförs

seg-1dd1beb01075 = MODELLED: en geometrisk svep- och länkbudgetberäkning. Häftets diagram är en huvudlob med konstant effekt, det parametriska diagrammet en representativ ersättning och limbstrålens medium en enkel angiven modell; ingenting här är en mätning av en signal i rymden. Tillgänglighets- och bortfallssiffrorna följer metoden i ICG Space Service Volume-häftet (UN ST/SPACE/75) och kontrolleras mot dess tabeller i xval/gnss-ssv/. (result <c1/>)

seg-e9c2dedbc971 = MODELLED GNSS-tillgänglighet och länkstyrka i Space Service Volume och bortom den: för en användare på en sfär (ICG-häftets globala skal) eller på en keplersk bana (LEO till månöverföring) räknar den, per konstellation (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) och för alla tillsammans, de signaler som är användbara över en C/N0-tröskel - tillgänglighet för minst en och för fyra signaler, maximal bortfallstid, mottagen C/N0, (kind catalogue (<c1/>))

seg-3add0e744c54 = MODELLED: diagrammet är representativt, inte uppmätt; mediet är en angiven enkel modell (docs/SSV.md). (scenario file comment, line { "14" })

seg-6b4655dd5270 = GNSS-signaltillgänglighet i Space Service Volume och bortom den, jämförd med ICG SSV-häftet, är MODELLED, inte validerad: ett delpåstående kontrolleras externt, men hela förmågan består av modellerade delar, så förmågan förblir Modelled. (verification matrix (docs/MODELLED-RATIONALE.md))

seg-a9e1798308df = Effekter av limbstråle-jonosfär, plasmasfär och atmosfär på tangerande GNSS-signaler, samt utformningen av svagsignalmottagaren, i kind <c1/> är MODELLED, inte validerade: kontrollerade mot sin egen slutna/analytiska identitet. Det fångar transkriptions- och koefficientfel men är ingen extern oberoende referens. (verification matrix (docs/MODELLED-RATIONALE.md))

seg-132be2813c10 = GNSS-navigeringsfilter ombord för rymdfarkoster i hög bana och månöverföring är MODELLED, inte validerat: kontrollerat mot sin egen slutna/analytiska identitet. Det fångar transkriptions- och koefficientfel men är ingen extern oberoende referens. (verification matrix (docs/MODELLED-RATIONALE.md))

seg-f9405de9adb8 = Relativ navigering för en formation av flera rymdfarkoster i en starkt elliptisk bana utifrån GNSS är MODELLED, inte validerad: kontrollerad mot sin egen slutna/analytiska identitet. Det fångar transkriptions- och koefficientfel men är ingen extern oberoende referens. (verification matrix (docs/MODELLED-RATIONALE.md))

seg-4881f925ea7f = Familjesida: <a1>Navigering för rymdanvändare</a1>

seg-4b72df59b3f9 = Ämnessida: <a1>SSV.md</a1>

seg-c9ac9a99bcbb = <s1>Föregående</s1>gnss-sim

seg-9df48482a140 = <s1>Nästa</s1>gravity-map
