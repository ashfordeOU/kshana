# docs--telecom-timing: translations (da)

seg-04ece0eb7bd2 = Maske-id

seg-a13eab564243 = MTIE

seg-f155b7ceef1f = TDEV

seg-42cdb8e987e6 = Budget

seg-88372b30ed79 = Grænse

seg-50fffd444946 = { "100" } ns

seg-79e6a31245f2 = { "400" } ns

seg-f63dd3d7aad4 = Kilde

seg-587beeccaa11 = Forudindstilling

seg-edb7b16b6c0e = Validering

seg-3c513ef2fd3b = Størrelse

seg-62b6e83a9145 = Kilde: <c1/>

seg-95222c3659cd = Telecom-timing: masker, kilder og forudindstillinger

seg-5a604e063370 = Denne side opregner hver grænse, som scenarietypen <c1/> kontrollerer, hvor hver af dem kommer fra, og hvad der er udeladt. Koden er <c2/>. Referencescenariet er <c3/>, frekvenssynkroniseringsscenariet er <c4/>, og indlæsningseksemplet er <c5/>.

seg-f078828b2325 = <b>Forkortelser.</b> ITU-T er International Telecommunication Union Telecommunication Standardization Sector. GNSS er Global Navigation Satellite System. TE er tidsfejl (time error), forskellen mellem et urs tid og referencetiden. max|TE| er den største absolutte tidsfejl. MTIE er maksimal tidsintervalfejl (maximum time interval error): den største spids-til-spids-tidsfejl inden for ethvert observationsvindue af længden τ (tau). TDEV er tidsdeviation (time deviation), et rod-middelkvadrat-mål for tidsvandring ved middelværditiden τ. cTE er konstant tidsfejl (den gennemsnitlige forskydning). dTE er dynamisk tidsfejl (den del, der bevæger sig). TE_L og dTE_L er tidsfejlen efter et førsteordens lavpasfilter med en båndbredde på { "0.1" } hertz (Hz); dTE_H er den del, der ligger over det filter. TE_HO er tidsfejl i holdover. PRTC er primært referencetidsur (primary reference time clock). ePRTC er forbedret PRTC. T-BC er telecom-grænseur (telecom boundary clock), og T-TSC er telecom-tidsslaveur (telecom time slave clock). PTP er Precision Time Protocol. PPS er puls pr. sekund. OCXO er ovnstyret krystaloscillator. CSAC er atomur i chipstørrelse. CSV er kommaseparerede værdier. ADEV er Allan-deviation (σ_y), det almindelige mål for frekvensstabilitet. ns er nanosekunder og µs er mikrosekunder. ppb er dele pr. milliard (en brøkdelsfrekvens på { "1e-9" }), og MHz er megahertz. Amd. er et tillæg til en anbefaling, og Y.1367 og lignende er den samme anbefalings nummer i ITU-T Y-serien.

seg-a7746845eb05 = <b>Hvad dette er.</b> Estimatorerne (MTIE og TDEV) er kontrolleret mod tredjepartspakken <c1/> og er VALIDATED for det. Masketabellerne er afskrifter af anbefalingerne nedenfor. En syntetisk holdover er en model bygget på offentlige datablads tal. Typen er MODELLED som helhed. Den er ikke en overensstemmelsestest, og en PASS her er ikke et certifikat.

seg-e4adedc8e36d = Læste kilder

seg-44f6d9a7906c = Alle ITU-T-tekster blev hentet fra itu.int den 2026-09-25. Den nyeste udgave, der kunne læses i sin helhed, blev brugt.

seg-28d4cebb747f = Anbefaling

seg-ef3644f3af9c = Læst udgave

seg-82dcf7b71cdb = Status på itu.int

seg-149a5b44ddfd = ITU-T G.8272/Y.1367, <em>Timing characteristics of primary reference time clocks</em>

seg-f65ca7286466 = gældende

seg-5dd73fad1c6b = ITU-T G.8272.1/Y.1367.1, <em>Timing characteristics of enhanced primary reference time clocks</em>

seg-efdb7451b140 = { "2024" } Amd. { "1" } (07/2025), en publikation med fuld tekst

seg-fff491f6efc6 = ITU-T G.8273.2/Y.1368.2, <em>Timing characteristics of telecom boundary clocks and telecom time synchronous clocks for use with full timing support from the network</em>

seg-6dacd7a4b068 = { "2023" } Amd. { "2" } (11/2025), fuld tekst

seg-266cb2ce6e7f = ITU-T G.8271.1/Y.1366.1, <em>Network limits for time synchronization in packet networks with full timing support from the network</em>

seg-55fed85e64bc = { "2022" } Amd. { "3" } (05/2025), fuld tekst

seg-a2e1e37c4219 = ITU-T G.8271/Y.1366, <em>Time and phase synchronization aspects of telecommunication networks</em>

seg-63c64d128cc6 = 03/2020 og dens Amd. { "1" } (08/2024)

seg-66209db00349 = To nyere tillæg findes, men kunne ikke læses: G.8272 ({ "2025" }) Amd. { "1" } (08/2026) og G.8272.1 ({ "2024" }) Amd. { "2" } (08/2026). Begge er præpubliceret og forbeholdt ITU-medlemmer (konti til Telecommunication Information Exchange Service, TIES). Hvis de ændrer noget af tallene nedenfor, afspejler denne side og koden det endnu ikke.

seg-25d639be3a1b = <b>Hvordan tallene blev kontrolleret.</b> Tekstudtræk fra disse PDF-filer (Portable Document Format) taber det græske bogstav τ og mikrotegnet µ, så "{ "0.275" } × { "10" }⁻³τ" kommer ud som "{ "0.275" } × { "10" }⁻³". Hver række i G.8272 Tabel { "1" } til { "4" }, G.8272.1 Tabel { "1" } til { "5" }, G.8271 Tabel { "1" } og G.8271.1 Tabel 7-1 blev derfor læst igen fra det gengivne sidebillede. G.8273.2 Tabel 7-1 til 7-5 og G.8271.1 Tabel 7-2 og 7-3 blev læst fra udtrukket tekst, hvor τ var bevaret. Hvor en tabel indebærer kontinuitet ved et knækpunkt, kontrollerer en enhedstest det.

seg-33b5f44c513b = Implementerede grænser

seg-3ce6da7e3e99 = τ er i sekunder. Et interval skrevet "{ "0.1" } < τ ≤ { "273" }" er åbent ved { "0.1" } s og lukket ved { "273" } s, præcis som i tabellen, og koden holder hver ende på samme måde.

seg-1efb6779348a = ITU-T G.8272 (07/2025): PRTC-A og PRTC-B, låst tilstand

seg-c54e45baa463 = max|TE|

seg-25887373a479 = { "40" } ns

seg-0e18047889c1 = afsnit { "6.1" }

seg-4ce06948bf3f = MTIE (afsnit { "6.2" }):

seg-f1e336517976 = Maske

seg-7c40080fe799 = Interval

seg-039493f144b8 = { "0.275" } × { "10" }⁻³ τ + { "0.025" } µs

seg-ca1cf5e6c558 = { "0.1" } < τ ≤ { "273" }

seg-a2ae8d8ad68a = Tabel { "1" }

seg-d1b301281575 = { "0.10" } µs

seg-22afd1138a6a = τ > { "273" }

seg-9691c1cfa143 = { "0.1" } < τ ≤ { "54.5" }

seg-95049bb8aaa1 = Tabel { "2" }

seg-f2562bdf8fd5 = { "0.04" } µs

seg-72ef2a66af58 = τ > { "54.5" }

seg-d18148049b1e = TDEV (afsnit { "6.2" }):

seg-f492a7e39046 = { "3" } ns

seg-4f658870d55d = { "0.1" } < τ ≤ { "100" }

seg-7334c58cd44b = Tabel { "3" }

seg-3bf4d8b009d5 = { "0.03" } τ ns

seg-2969d84226e6 = { "100" } < τ ≤ { "1 000" }

seg-02bacda97914 = { "30" } ns

seg-e28777641ebe = { "1 000" } < τ < { "10 000" }

seg-1c0341aaa919 = { "1" } ns

seg-70c7899bf805 = Tabel { "4" }

seg-8ec1f8c65e4f = { "0.01" } τ ns

seg-e3bdc7a40432 = { "100" } < τ ≤ { "500" }

seg-2851f795541f = { "5" } ns

seg-f1d7d80685aa = { "500" } < τ < { "100 000" }

seg-9b8478f86b44 = Afsnit { "6.2" } angiver også, at den mindste måleperiode for TDEV er tolv gange integrationsperioden (T = 12τ). Typen anvender den regel på al TDEV, den rapporterer, så TDEV gives kun for τ op til en tolvtedel af optegnelsen. G.8272 angiver intet holdover-krav til en PRTC.

seg-392ca772c712 = ITU-T G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025): ePRTC

seg-42c76f7b90ac = Låst tilstand:

seg-160dced77932 = { "4" } ns

seg-88e8948869fc = { "0.1" } < τ ≤ { "1" }

seg-c89d5cf52ad3 = { "0.11114" } τ + { "3.89" } ns

seg-fad294d3be39 = { "1" } < τ ≤ { "100" }

seg-e18d635df164 = { "0.0375" } × { "10" }⁻³ τ + { "15" } ns

seg-273d60d5cd4a = { "100" } < τ ≤ { "400 000" }

seg-4d971fea7954 = τ > { "400 000" }

seg-4e9052bb688f = { "0.1" } < τ ≤ { "30 000" }

seg-2401257610c6 = { "3.33333" } × { "10" }⁻⁵ τ ns

seg-560ef6f53bf7 = { "30 000" } < τ ≤ { "300 000" }

seg-727399dbf061 = { "10" } ns

seg-3f5b5d8a1ea9 = { "300 000" } < τ < { "1 000 000" }

seg-ca9cb946c8f4 = ePRTC-A holdover, tidsfejl (afsnit { "8.2.1" }, Tabel { "3" }). L er den tid, ePRTC var låst før tabet, i dage, og t er tiden siden holdoverperiodens start, i sekunder. Grænsen stiger lineært fra { "30" } ns til { "100" } ns over holdoverperioden H.

seg-fa700160348e = Låst varighed L

seg-61f9dec111cb = Holdoverperiode H

seg-f6a6df18839c = Grænse for |Δx(t)|

seg-9229068d7534 = L < { "6" } dage

seg-5bd5193f213c = { "0" } < t ≤ { "70 000" } s ({ "0.81" } dage)

seg-df5ffdf7245b = { "30" } + { "1.000" } × { "10" }⁻³ t ns

seg-1af75c2d666f = { "6" } dage ≤ L ≤ { "40" } dage

seg-51754e29cb46 = { "0" } < t ≤ L · { "86 400" } s

seg-dacdb2a00c6a = { "30" } + { "70" } t / (L · { "86 400" }) ns

seg-71a6238f1e29 = L > { "40" } dage

seg-5a0e39fa8dc3 = { "0" } < t ≤ { "3 456 000" } s ({ "40" } dage)

seg-b0a167d378cb = { "30" } + { "2.025463" } × { "10" }⁻⁵ t ns

seg-3262966b5eab = ePRTC-A holdover, vandring (afsnit { "8.2.2" }):

seg-2c09e57675a7 = { "100" } < τ ≤ { "10 000" }

seg-9afccb4dbf30 = { "0.1" } < τ ≤ { "10 000" }

seg-a4a813c38ef6 = Tabel { "5" }

seg-5d56fb7889b2 = Afsnit { "8.3.1" } fastsætter den standardmæssige maksimale tidsfejl i holdover, max|TE_HO|, til { "100" } ns. Typen bruger den som et standardbudget for tid til overskridelse.

seg-3702a44d3ff1 = ITU-T G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025): T-BC og T-TSC

seg-96b5072f792f = Klasse A

seg-7737bc0444b1 = Klasse B

seg-cd92242017a8 = Klasse C

seg-0689443dfc12 = Klasse D

seg-54163aca5d46 = max|TE| (ufiltreret)

seg-b36412e1acfb = { "70" } ns

seg-ed79e6cdac25 = til videre undersøgelse

seg-5c2985d408e3 = Tabel 7-1

seg-067c7c90c1e1 = max|TE_L| ({ "0.1" } Hz lavpas)

seg-1c5ac746d16b = Tabel 7-2

seg-9802166ed2e2 = cTE-område

seg-b94484db77ab = ±{ "50" } ns

seg-17d4f5817950 = ±{ "20" } ns

seg-1399281b7ce6 = ±{ "10" } ns

seg-a694039549c8 = Tabel 7-3

seg-d8799ba27fc3 = dTE_L MTIE, konstant temperatur

seg-c332ee79beaf = Tabel 7-4, m ≤ τ ≤ { "1 000" }

seg-2bd284168318 = dTE_L TDEV, konstant temperatur

seg-8358cf8c4e50 = { "2" } ns

seg-6a1cc65603b3 = Tabel 7-5

seg-de739a499521 = I Tabel 7-5 er klasse A og B skrevet m < τ ≤ { "1 000" }, og klasse C er skrevet m ≤ τ ≤ { "1 000" }. m er 1/16 s for en PTP-strøm med { "16" } pakker i sekundet og { "1" } s for et { "1" } PPS-output. Typen behandler inputtet som en tidsintervalfejl for { "1" } PPS, så m = { "1" } s. Tabel 7-3 Note { "1" } siger, at cTE estimeres ved at tage gennemsnittet af tidsfejlen over { "1 000" } s. Typen rapporterer det værste absolutte gennemsnit af på hinanden følgende blokke på { "1 000" } s.

seg-0a4b66fe5535 = ITU-T G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025): netværksgrænser ved referencepunkt C

seg-8c2b01661011 = Alle tre er implementeringstilfælde { "1" } og gælder efter et førsteordens lavpasfilter på { "0.1" } Hz.

seg-b3f93a59a8eb = Afsnit

seg-23e44eab6e8b = max|TE_L|

seg-cb1a66f62f8e = MTIE-grænse

seg-4aa99615d914 = { "7.3.1" } (applikationer i klasse { "4" })

seg-eacfcd0a9ea5 = { "1 100" } ns

seg-dc2351580120 = { "100" } + { "75" } τ ns

seg-b2c519d30bc8 = { "1.3" } < τ ≤ { "2.4" }

seg-3c9bd014a192 = { "277" } + { "1.1" } τ ns

seg-abad3634a83e = { "2.4" } < τ ≤ { "275" }

seg-884708f2736f = { "580" } ns

seg-22bf4721fe97 = { "275" } < τ ≤ { "10 000" }

seg-17c12885b0d1 = { "7.3.2" } (forbedret netværk)

seg-fcd7cb03855f = { "600" } ns

seg-9df58e5be8fc = { "37.39" } + { "9.7" } τ ns

seg-8e4e29bb36ac = { "55.27" } + { "2.25" } τ ns

seg-1d92062202d8 = { "2.4" } < τ ≤ { "20.2" }

seg-6ab02b4db41e = { "90.22" } + { "0.52" } τ ns

seg-81785e02523f = { "20.2" } < τ ≤ { "211.11" }

seg-f7fda527feed = { "200" } ns

seg-cab0e877b11b = { "211.11" } < τ ≤ { "10 000" }

seg-1f0b651381ea = { "7.3.3" } (PRTC i adgangsnetværket)

seg-5a5405483174 = { "0.0475" } τ + { "25" } ns

seg-3aacef0066a0 = { "1" } < τ < { "400" }

seg-f34cbd5ce7e4 = { "44" } ns

seg-76f436fd7664 = { "400" } < τ ≤ { "10 000" }

seg-b0987b4e2e07 = Tabel 7-3 lader selve τ = { "400" } s stå uden grænse (en række ender på "< { "400" }", den næste starter med "{ "400" } <"). Typen rapporterer ingen grænse dér i stedet for at vælge en. Referencepunkt A (afsnit { "7.1" }) henter sine grænser fra G.8272, så PRTC-maskerne ovenfor dækker det.

seg-915182a7500e = Frekvenssynkronisering: vandringsgenerering i G.811, G.812, G.8262 og G.8262.1 ({ "0.36" })

seg-fb1342b76953 = Syv masker, hver især grænsen for vandringsgenerering i MTIE og TDEV ved konstant temperatur (inden for ±{ "1" } K), defineret gennem det tilsvarende førsteordens lavpasmålefilter på { "10" } Hz, som afsnittene angiver. Det filter virker før sampling, så typen tager optegnelsen som allerede målt gennem det og anvender intet. PRC-masken gælder for et autonomt ur (G.810 Figur 2a, konfiguration med uafhængigt ur); de øvrige er grænser for låst tilstand for et ur, der er synkroniseret til en reference uden vandring. Referencescenariet er <c1/>: en frit løbende OCXO mod de tre EEC-masker, hvilket overdriver oscillatorens bidrag ved observationsintervaller, der er lange i forhold til en hvilken som helst løkkes tidskonstant.

seg-3faf039b0ed9 = MTIE (ns)

seg-ca33cbe4fd07 = TDEV (ns)

seg-769e7fed4cd2 = { "0.275" } τ + { "25" } ({ "0.1" } < τ ≤ { "1 000" }); { "0.01" } τ + { "290" } (τ > { "1 000" })

seg-73dcf463ea29 = { "3" } ({ "0.1" } < τ ≤ { "100" }); { "0.03" } τ ({ "100" } < τ ≤ { "1 000" }); { "30" } ({ "1 000" } < τ < { "10 000" })

seg-cb38d6327e5c = G.811 (09/1997) afsnit { "6.1" }

seg-1d9621af8091 = { "24" } ({ "0.1" } < τ ≤ { "9" }); { "8" } τ^{ "0.5" } ({ "9" } < τ ≤ { "400" }); { "160" } ({ "400" } < τ ≤ { "10 000" })

seg-bc8e3aa24bfe = { "3" } ({ "0.1" } < τ ≤ { "25" }); { "0.12" } τ ({ "25" } < τ ≤ { "100" }); { "12" } ({ "100" } < τ ≤ { "10 000" })

seg-5e048893f25e = G.812 (06/2004) Tabel { "3" } og { "6" }

seg-45d290d9640a = { "3.2" } τ^−{ "0.5" } ({ "0.1" } < τ ≤ { "2.5" }); { "2" } ({ "2.5" } < τ ≤ { "40" }); { "0.32" } τ^{ "0.5" } ({ "40" } < τ ≤ { "1 000" }); { "10" } (τ > { "1 000" })

seg-ae92888ca436 = G.812 (06/2004) Tabel { "4" } og { "7" }

seg-860b31153778 = { "40" } ({ "0.1" } < τ ≤ { "1" }); { "40" } τ^{ "0.1" } ({ "1" } < τ ≤ { "100" }); { "25.25" } τ^{ "0.2" } ({ "100" } < τ ≤ { "1 000" })

seg-854159374e79 = { "3.2" } ({ "0.1" } < τ ≤ { "25" }); { "0.64" } τ^{ "0.5" } ({ "25" } < τ ≤ { "100" }); { "6.4" } ({ "100" } < τ ≤ { "1 000" })

seg-8e825000b58e = G.8262 (10/2024) Tabel { "1" } og { "3" }

seg-50fd3bf139a4 = { "20" } ({ "0.1" } < τ ≤ { "1" }); { "20" } τ^{ "0.48" } ({ "1" } < τ ≤ { "10" }); { "60" } ({ "10" } < τ ≤ { "1 000" })

seg-9ef5ff04e1d4 = som G.812 Tabel { "7" }, lukket ved { "10 000" } s

seg-3ecb8d9128d0 = G.8262 (10/2024) Tabel { "4" } og { "5" }

seg-ef3156b68064 = { "10" } τ^{ "0.155" } ({ "0.1" } ≤ τ ≤ { "1" }); { "10" } τ^{ "0.1" } ({ "1" } < τ ≤ { "100" }); { "6.3" } τ^{ "0.2" } ({ "100" } < τ ≤ { "1 000" })

seg-28f7a98f132e = { "0.64" } ({ "0.1" } ≤ τ ≤ { "25" }); { "0.128" } τ^{ "0.5" } ({ "25" } < τ ≤ { "100" }); { "1.28" } ({ "100" } < τ ≤ { "1 000" })

seg-47d0f50aa906 = G.8262.1 (11/2025) Tabel { "1" } og { "3" }

seg-45e4ed8fa6ea = Hver række blev kontrolleret mod teksten, der blev hentet fra itu.int den 2026-10-13: G.8262 (10/2024), G.8262.1 (11/2025), G.812 (06/2004) og G.811 (09/1997). G.812 (06/2004) er opført som afløst af en præpubliceret udgave 08/2026, og G.811 har et Amd. { "1" } (04/2016); ingen af dem kunne hentes, så hvis de ændrer noget af tallene ovenfor, afspejler denne side og koden det ikke. Hvor trykte koefficienter gør et knækpunkt diskontinuert (for eksempel { "40" } · { "10" }^{ "0.4" } = { "100.48" } ns mod plateauet på { "100" } ns i G.812 Tabel { "4" }), er tabellerne bevaret, som de er trykt, og enhedstestene afgrænser trinnet. Ikke implementeret: tilladelserne for variabel temperatur (G.812 Tabel { "5" }, G.8262 Tabel { "2" }, G.8262.1 Tabel { "2" }), krav til holdover og transienter, jitter og frekvensnøjagtigheden i G.811 i afsnit { "5" }.

seg-4f6666854cf7 = Budgetter (tid til overskridelse)

seg-1f3322a94bbb = ePRTC-standard max|TE_HO|

seg-26fd4be0d5ca = G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) afsnit { "8.3.1" }

seg-0d5433d85c88 = Netværkets holdover-tildeling, kort GNSS-afbrydelse

seg-b74c5284d584 = G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) Tabel V.1, fejlscenarie (b), "re-arrangements and holdover in the network". Et eksempel på en tildeling, ikke et krav.

seg-afe6c9903ada = Netværksgrænse ved referencepunkt C

seg-0c261b05c3cf = G.8271.1 afsnit { "7.3.1" }. Det er en filtreret størrelse; som budget sammenlignes den ufiltreret.

seg-4b5a9718d008 = Slutapplikation, nøjagtighedsklasse { "4" }

seg-2a38e45e7008 = { "1.5" } µs

seg-41c6dd43e313 = G.8271 (03/2020) Amd. { "1" } (08/2024) Tabel { "1" }, klasse { "4" }

seg-ded846b5a4bc = <b>Det klassiske tal "{ "1.5" } µs fra ende til ende".</b> Det er kravet til tidsfejl for klasse { "4" } i G.8271 Tabel { "1" }, angivet over for en fælles reference ved slutapplikationen. G.8271.1 Tabel V.1 viser, hvordan et netværk kan tildele det i normal drift: { "100" } ns til PRTC/telecom-grandmasteren, { "200" } ns til kædens dynamiske tidsfejl, en konstant tidsfejl for urene og linkene, i alt { "1 100" } ns ved referencepunkt C, derefter { "250" } ns til omlægninger og kort holdover i slutapplikationen og { "150" } ns til slutapplikationens egen støj, { "1 500" } ns ved referencepunkt E. Samme tabels fejlscenarie (c), "long holdover periods, e.g., { "1" } day", giver { "3 350" } ns ved C og { "3 500" } ns ved E (dens Note { "5" } siger, at en overskridelse af { "1 500" } ns kan forringe tjenesten). Så ingen af anbefalingerne angiver et krav om "{ "1.5" } µs over { "24" } timers holdover", og typen implementerer ikke et sådant.

seg-76cab595673a = Ikke bekræftet eller ikke implementeret

seg-175c282ddce2 = Intet nedenfor er implementeret som en maske. Intet af det er udfyldt ved et skøn.

seg-3c74e4ba9579 = <b>Markeret "for further study" i anbefalingerne:</b> G.8273.2 klasse D max|TE|, cTE, dTE_L MTIE og TDEV, dTE_H og holdover; ePRTC-B-holdover (G.8272.1 afsnit { "8.2.1" }); ePRTC-A-holdover MTIE og TDEV ud over { "10 000" } s (Tabel { "4" } Note { "1" }, Tabel { "5" } Note { "2" }); ePRTC-fasediskontinuitet (afsnit { "7" }); T-BC/T-TSC fase-/tidsholdover, når både PTP- og det fysiske lags input er tabt (G.8273.2 afsnit { "7.4.2.1" }); TDEV-netværksgrænsen ved referencepunkt C (G.8271.1 afsnit { "7.3.1" } til { "7.3.3" }); netværksgrænser for implementeringstilfælde { "2" } ved punkt C.

seg-93c60d44788e = <b>Afskrevet, men ikke implementeret i denne version:</b> G.8273.2 Tabel 7-6 (MTIE med variabel temperatur: { "40" } / { "40" } / { "10" } ns op til { "10 000" } s), Tabel 7-7 (dTE_H spids til spids: { "70" } / { "70" } / { "30" } ns, hvilket kræver et højpasfilter på { "0.1" } Hz), Tabel 7-10 (holdover-MTIE med frekvensassistance fra det fysiske lag), relativ tidsfejl (Tabel 7-8 og 7-9) og dTE_H-grænserne i G.8271.1 afsnit { "7.3.2" } ({ "50" } ns) og { "7.3.3" } ({ "70" } ns).

seg-f5fcd3b0f8a5 = <b>Ikke anvendt:</b> glidende gennemsnitsfilter på mindst { "100" } sampler, som G.8272 og G.8272.1 angiver for PTP-grænseflader. Inputtet behandles som en tidsintervalfejl for { "1" } PPS, som disse anbefalinger måler uden filter.

seg-74fe057a4392 = <b>Ulæselige:</b> de to begrænsede tillæg fra { "2026" }, der er nævnt under "Læste kilder".

seg-bd4ec59cc872 = <b>Redaktionel besynderlighed:</b> i G.8272.1 Amd. { "1" } bærer hovedet af Tabel { "3" } en indsat række "TDEV limit [ns] { "1" } / { "0.1" } < τ ≤ { "10 000" }" i tillægsmarkering, over tidsfejlskolonnerne. Den behandles ikke som en del af tidsfejlens indhylling. Den samme TDEV på { "1" } ns er Tabel { "5" } og er implementeret dér.

seg-511db1219de1 = Målefilteret

seg-5fc683308b31 = G.8273.2 og G.8271.1 definerer deres filtrerede grænser gennem et førsteordens lavpasfilter med en båndbredde på { "0.1" } Hz. Typen anvender den diskrete udjævner y_k = y_{ "{" }k−{ "1" }{ "}" } + α (x_k − y_{ "{" }k−{ "1" }{ "}" }), α = { "1" } − exp(−2π · { "0.1" } · Δt), startet ved den første sample. Det er en tilnærmelse til testudstyr, ikke en kopi af noget instrument. Det anvendes kun, når sampleintervallet Δt er { "1" } s eller mindre. En grovere optegnelse rapporteres NOT-EVALUATED mod en filtreret maske i stedet for at blive filtreret dårligt.

seg-218e5ad620af = Oscillatorforudindstillinger (MODELLED)

seg-28bb7b8ad89f = Hvert tal er databladets eget, læst den 2026-09-25.

seg-b4207b682560 = Enhed og dokument

seg-13f9ba96c063 = Anvendte ADEV-maksima (τ: σ_y)

seg-d719167df981 = Ældning

seg-f30740907f6a = Temperatur

seg-c789847129bd = Microchip (Vectron) OX-208, { "10" } MHz; datablad Rev 12-1-2021

seg-cefcf7025826 = { "1" } s: { "5e-12" }; { "10" } s: { "8e-12" }; { "100" } s: { "1e-11" }; { "1 000" } s: { "5e-11" }

seg-85f8b8fbbae6 = ±{ "0.15" } ppb/dag efter { "72" } t (f ≤ { "10" } MHz)

seg-0c6d3ae4e409 = ±{ "0.4" } ppb, { "0" } °C til +{ "70" } °C, med reference til +{ "25" } °C

seg-53ac4dcaf8b1 = Microchip 8040C Rubidium Frequency Standard, standardydeevne; DS00003047A (2/20)

seg-ccb8b3a41af4 = { "1" } s: { "3.0e-11" }; { "100" } s: { "3.0e-12" }

seg-ae0f630aba4b = <5e-11/måned efter { "30" } dage

seg-dbb2a780ceb9 = temperaturkoefficient <{ "3E-10" }, { "0" } °C til { "50" } °C

seg-79d5b7a3a453 = Microchip 5071A, højtydende rør; DS00002980D (5/25)

seg-62572a695878 = { "1" } s: { "5.0e-12" }; { "10" } s: { "3.5e-12" }; { "100" } s: { "8.5e-13" }; { "1 000" } s: { "2.7e-13" }; 10⁴ s: { "8.5e-14" }; 10⁵ s: { "2.7e-14" }; { "5" } dage: { "1.0e-14" }; { "30" } dage: { "1.0e-14" }

seg-1fbdd6edc376 = ingen rate offentliggjort; ændring over levetiden ≤{ "5.0e-14" }

seg-bb485faf403a = ±{ "8.0e-14" } over for omgivelserne ({ "0" } °C til { "50" } °C, fugtighed, magnetfelt, stød)

seg-889f4dc6cafc = Microchip SA.45s CSAC, udgaver { "001" } og { "003" }; DS00002985D (5/23)

seg-ecee1cb2a670 = { "1" } s: { "3e-10" }; { "10" } s: { "1e-10" }; { "100" } s: { "3e-11" }; { "1 000" } s: { "1e-11" }

seg-c90e2f590297 = <9e-10/måned efter { "30" } dage

seg-5b1bd12aea0f = ±{ "5e-10" }, −{ "10" } °C til { "70" } °C

seg-63ba00e95bbc = Links til dokumenter: <a1>OX-208</a1>, <a2>8040C</a2>, <a3>5071A</a3>, <a4>SA.45s</a4>.

seg-31ad29d092ee = Udeladt med vilje: 8040C's række for { "10" } s, som databladet trykker som "<{ "1.0" } x { "10" }^{ "11" }" (en forkert trykt eksponent), og 5071A's rækker under { "1" } s. OX-049 blev overvejet til OCXO'en og ikke brugt, fordi dens ældningsrække ikke kan læses entydigt ud fra dens forskudte tabel.

seg-8d4a915bc7fc = <b>Hvordan tallene bliver til en model.</b> Det er denne motors valg, og hvert af dem rapporteres i kørslens output:

seg-f1e6ea28601c = <b>Støjtilpasning.</b> Niveauerne for hvid, flicker- og random-walk-frekvensstøj er en ikke-negativ mindste kvadraters tilpasning til ADEV-maksimaerne, derefter skaleret op, indtil modellen ligger ved eller over hvert punkt. Databladets tal er maksima, så modellen indhyller dem.

seg-0e5ab055094a = <b>Flicker-gulv.</b> Gulvet ligger aldrig under ADEV ved det længste opførte τ. Et datablad holder op med at opføre værdier, hvor producenten holder op med at love forbedring, så modellen lader ikke uret forbedres ud over det. Det kan kun gøre en holdover dårligere.

seg-ebefbd6f119b = <b>Ældning.</b> Et månedligt tal omregnes ved { "30" } dage pr. måned og anvendes som en lineær frekvensdrift fra tabsøjeblikket. Caesium-forudindstillingen har ingen ældning.

seg-bb08c7b5baf5 = <b>Temperatur.</b> Den angivne grænse læses lineært over halvdelen af driftsområdet (for eksempel giver ±{ "5e-10" } over −{ "10" } °C til { "70" } °C { "1.25e-11" } pr. kelvin), og påvirkes derefter af en sinusformet temperaturprofil, hvis amplitude og periode er scenarieinput. Intet på et datablad siger, at afhængigheden er lineær; det er en læsning i værste tilfælde.

seg-47a256757cfc = <b>Før tabet</b> er uret disciplineret, og dets tidsfejl er hvid fasestøj med en angivet standardafvigelse på 1 sigma.

seg-3ef60b128bb7 = <b>Hvad referencescenariet viser.</b> Ved de indcheckede input (rubidium, ±{ "2" } K daglig temperatursvingning, { "24" } timers holdover efter { "1" } time låst) når optegnelsen en største absolutte tidsfejl på { "603.2" } ns. Den krydser ePRTC-budgettet på { "100" } ns efter { "8 206" } s fra tabet og tildelingen på { "400" } ns efter { "25 713" } s, og forbliver inden for { "1 100" } ns og { "1.5" } µs hele dagen. Den består ikke ePRTC-A-holdover-indhyllingen { "3 627" } s efter tabet, hvilket er forventet: det krav forudsætter en reference af caesium-klassen. Temperaturleddet alene kan nå { "660" } ns, så ved disse input betyder det mere end ældning ({ "72" } ns ved dagens slutning).

seg-ba87d450423c = <c1/> kontrollerer typens MTIE og TDEV mod <c2/> { "2024.06" } på <c3/>, en CSAC-holdoverserie med { "2" } 048 sampler med ældning, flicker og temperatur. For { "17" } MTIE- og { "12" } TDEV-middelfaktorer stemmer MTIE nøjagtigt, og TDEV stemmer til { "1.1e-15" } relativt. De samme kurver læses tilbage fra en fuld kørsel, der indlæser CSV'en. Det validerer estimatorerne på den optegnelse. Det validerer ikke den syntetiske holdover, maskerne eller forudindstillingerne, som er MODELLED-rækker i <c4/>.

seg-6fdc3cc32a2f = <s1>Forrige</s1>Slottidssynkronisering

seg-1108b114de88 = <s1>Næste</s1>Vildledt tid
