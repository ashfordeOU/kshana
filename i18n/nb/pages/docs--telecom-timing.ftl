# docs--telecom-timing: translations (nb)

seg-04ece0eb7bd2 = Maske-id

seg-a13eab564243 = MTIE

seg-f155b7ceef1f = TDEV

seg-42cdb8e987e6 = Budsjett

seg-88372b30ed79 = Grense

seg-50fffd444946 = { "100" } ns

seg-79e6a31245f2 = { "400" } ns

seg-f63dd3d7aad4 = Kilde

seg-587beeccaa11 = Forhåndsinnstilling

seg-edb7b16b6c0e = Validering

seg-3c513ef2fd3b = Størrelse

seg-62b6e83a9145 = Kilde: <c1/>

seg-95222c3659cd = Telekomtidssynkronisering: masker, kilder og forhåndsinnstillinger

seg-5a604e063370 = Denne siden lister hver grense scenariotypen <c1/> kontrollerer, hvor hver av dem kommer fra, og hva som er utelatt. Koden er <c2/>. Referansescenarioet er <c3/>, det for frekvenssynkronisering er <c4/>, og innlesingseksempelet er <c5/>.

seg-f078828b2325 = <b>Forkortelser.</b> ITU-T er International Telecommunication Union Telecommunication Standardization Sector. GNSS er Global Navigation Satellite System. TE er tidsfeil, forskjellen mellom en klokkes tid og referansetiden. max|TE| er den største absolutte tidsfeilen. MTIE er maksimal tidsintervallfeil: den største topp-til-topp-tidsfeilen innenfor et hvilket som helst observasjonsvindu med lengde τ (tau). TDEV er tidsavvik, et rotmiddelkvadratmål for tidsvandring ved midlingstid τ. cTE er konstant tidsfeil (gjennomsnittlig forskyvning). dTE er dynamisk tidsfeil (den delen som beveger seg). TE_L og dTE_L er tidsfeilen etter et førsteordens lavpassfilter med { "0.1" } hertz (Hz) båndbredde; dTE_H er delen over det filteret. TE_HO er tidsfeil i holdover. PRTC er primær referansetidsklokke. ePRTC er forbedret PRTC. T-BC er telekom-grenseklokke og T-TSC er telekom-tidsslaveklokke. PTP er Precision Time Protocol. PPS er puls per sekund. OCXO er ovnsstyrt krystalloscillator. CSAC er atomklokke i brikkeformat. CSV er kommaseparerte verdier. ADEV er Allan-avvik (σ_y), standardmålet for frekvensstabilitet. ns er nanosekunder og µs er mikrosekunder. ppb er deler per milliard (en brøkfrekvens på { "1e-9" }), og MHz er megahertz. Amd. er et tillegg til en anbefaling, og Y.1367 og lignende er den samme anbefalingens nummer i ITU-T Y-serien.

seg-a7746845eb05 = <b>Hva dette er.</b> Estimatorene (MTIE og TDEV) er kontrollert mot tredjepartspakken <c1/> og er VALIDATED for det. Masketabellene er transkripsjoner av anbefalingene nedenfor. En syntetisk holdover er en modell bygd på tall fra offentlige datablader. Typen er MODELLED samlet sett. Den er ikke en overensstemmelsestest, og en PASS her er ikke et sertifikat.

seg-e4adedc8e36d = Kilder som er lest

seg-44f6d9a7906c = Alle ITU-T-tekstene ble lastet ned fra itu.int 2026-09-25. Den nyeste utgaven som kunne leses i sin helhet ble brukt.

seg-28d4cebb747f = Anbefaling

seg-ef3644f3af9c = Utgave lest

seg-82dcf7b71cdb = Status på itu.int

seg-149a5b44ddfd = ITU-T G.8272/Y.1367, <em>Timing characteristics of primary reference time clocks</em>

seg-f65ca7286466 = gjeldende

seg-5dd73fad1c6b = ITU-T G.8272.1/Y.1367.1, <em>Timing characteristics of enhanced primary reference time clocks</em>

seg-efdb7451b140 = { "2024" } Amd. { "1" } (07/2025), en publikasjon med fullstendig tekst

seg-fff491f6efc6 = ITU-T G.8273.2/Y.1368.2, <em>Timing characteristics of telecom boundary clocks and telecom time synchronous clocks for use with full timing support from the network</em>

seg-6dacd7a4b068 = { "2023" } Amd. { "2" } (11/2025), fullstendig tekst

seg-266cb2ce6e7f = ITU-T G.8271.1/Y.1366.1, <em>Network limits for time synchronization in packet networks with full timing support from the network</em>

seg-55fed85e64bc = { "2022" } Amd. { "3" } (05/2025), fullstendig tekst

seg-a2e1e37c4219 = ITU-T G.8271/Y.1366, <em>Time and phase synchronization aspects of telecommunication networks</em>

seg-63c64d128cc6 = 03/2020 og dets Amd. { "1" } (08/2024)

seg-66209db00349 = To nyere tillegg finnes, men kunne ikke leses: G.8272 ({ "2025" }) Amd. { "1" } (08/2026) og G.8272.1 ({ "2024" }) Amd. { "2" } (08/2026). Begge er forhåndspublisert og begrenset til ITU-medlemmer (kontoer i Telecommunication Information Exchange Service, TIES). Hvis de endrer noe tall nedenfor, gjenspeiler ikke denne siden og koden det ennå.

seg-25d639be3a1b = <b>Hvordan tallene ble kontrollert.</b> Tekstuttrekk fra disse PDF-filene (Portable Document Format) mister den greske bokstaven τ og mikrotegnet µ, så «{ "0.275" } × { "10" }⁻³τ» kommer ut som «{ "0.275" } × { "10" }⁻³». Hver rad i G.8272 tabell { "1" } til { "4" }, G.8272.1 tabell { "1" } til { "5" }, G.8271 tabell { "1" } og G.8271.1 tabell 7-1 ble derfor lest på nytt fra det gjengitte sidebildet. G.8273.2 tabell 7-1 til 7-5 og G.8271.1 tabell 7-2 og 7-3 ble lest fra uttrukket tekst der τ overlevde. Der en tabell innebærer kontinuitet ved et knekkpunkt, kontrollerer en enhetstest det.

seg-33b5f44c513b = Implementerte grenser

seg-3ce6da7e3e99 = τ er i sekunder. Et intervall skrevet «{ "0.1" } < τ ≤ { "273" }» er åpent ved { "0.1" } s og lukket ved { "273" } s, nøyaktig som i tabellen, og koden beholder hver ende på samme måte.

seg-1efb6779348a = ITU-T G.8272 (07/2025): PRTC-A og PRTC-B, låst modus

seg-c54e45baa463 = max|TE|

seg-25887373a479 = { "40" } ns

seg-0e18047889c1 = punkt { "6.1" }

seg-4ce06948bf3f = MTIE (punkt { "6.2" }):

seg-f1e336517976 = Maske

seg-7c40080fe799 = Intervall

seg-039493f144b8 = { "0.275" } × { "10" }⁻³ τ + { "0.025" } µs

seg-ca1cf5e6c558 = { "0.1" } < τ ≤ { "273" }

seg-a2ae8d8ad68a = Tabell { "1" }

seg-d1b301281575 = { "0.10" } µs

seg-22afd1138a6a = τ > { "273" }

seg-9691c1cfa143 = { "0.1" } < τ ≤ { "54.5" }

seg-95049bb8aaa1 = Tabell { "2" }

seg-f2562bdf8fd5 = { "0.04" } µs

seg-72ef2a66af58 = τ > { "54.5" }

seg-d18148049b1e = TDEV (punkt { "6.2" }):

seg-f492a7e39046 = { "3" } ns

seg-4f658870d55d = { "0.1" } < τ ≤ { "100" }

seg-7334c58cd44b = Tabell { "3" }

seg-3bf4d8b009d5 = { "0.03" } τ ns

seg-2969d84226e6 = { "100" } < τ ≤ { "1 000" }

seg-02bacda97914 = { "30" } ns

seg-e28777641ebe = { "1 000" } < τ < { "10 000" }

seg-1c0341aaa919 = { "1" } ns

seg-70c7899bf805 = Tabell { "4" }

seg-8ec1f8c65e4f = { "0.01" } τ ns

seg-e3bdc7a40432 = { "100" } < τ ≤ { "500" }

seg-2851f795541f = { "5" } ns

seg-f1d7d80685aa = { "500" } < τ < { "100 000" }

seg-9b8478f86b44 = Punkt { "6.2" } sier også at minste målperiode for TDEV er tolv ganger integrasjonsperioden (T = 12τ). Typen bruker den regelen på hver TDEV den rapporterer, så TDEV oppgis bare for τ opp til en tolvtedel av registreringen. G.8272 oppgir ikke noe holdover-krav for en PRTC.

seg-392ca772c712 = ITU-T G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025): ePRTC

seg-42c76f7b90ac = Låst modus:

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

seg-ca9cb946c8f4 = ePRTC-A holdover, tidsfeil (punkt { "8.2.1" }, tabell { "3" }). L er tiden ePRTC var låst før tapet, i døgn, og t er tiden siden holdover startet, i sekunder. Grensen stiger lineært fra { "30" } ns til { "100" } ns over holdover-perioden H.

seg-fa700160348e = Låst varighet L

seg-61f9dec111cb = Holdover-periode H

seg-f6a6df18839c = Grense for |Δx(t)|

seg-9229068d7534 = L < { "6" } døgn

seg-5bd5193f213c = { "0" } < t ≤ { "70 000" } s ({ "0.81" } døgn)

seg-df5ffdf7245b = { "30" } + { "1.000" } × { "10" }⁻³ t ns

seg-1af75c2d666f = { "6" } døgn ≤ L ≤ { "40" } døgn

seg-51754e29cb46 = { "0" } < t ≤ L · { "86 400" } s

seg-dacdb2a00c6a = { "30" } + { "70" } t / (L · { "86 400" }) ns

seg-71a6238f1e29 = L > { "40" } døgn

seg-5a0e39fa8dc3 = { "0" } < t ≤ { "3 456 000" } s ({ "40" } døgn)

seg-b0a167d378cb = { "30" } + { "2.025463" } × { "10" }⁻⁵ t ns

seg-3262966b5eab = ePRTC-A holdover, tidsvandring (punkt { "8.2.2" }):

seg-2c09e57675a7 = { "100" } < τ ≤ { "10 000" }

seg-9afccb4dbf30 = { "0.1" } < τ ≤ { "10 000" }

seg-a4a813c38ef6 = Tabell { "5" }

seg-5d56fb7889b2 = Punkt { "8.3.1" } setter standard maksimal tidsfeil i holdover, max|TE_HO|, til { "100" } ns. Typen bruker den som et standard budsjett for tid til overskridelse.

seg-3702a44d3ff1 = ITU-T G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025): T-BC og T-TSC

seg-96b5072f792f = Klasse A

seg-7737bc0444b1 = Klasse B

seg-cd92242017a8 = Klasse C

seg-0689443dfc12 = Klasse D

seg-54163aca5d46 = max|TE| (ufiltrert)

seg-b36412e1acfb = { "70" } ns

seg-ed79e6cdac25 = til videre studium

seg-5c2985d408e3 = Tabell 7-1

seg-067c7c90c1e1 = max|TE_L| ({ "0.1" } Hz lavpass)

seg-1c5ac746d16b = Tabell 7-2

seg-9802166ed2e2 = cTE-område

seg-b94484db77ab = ±{ "50" } ns

seg-17d4f5817950 = ±{ "20" } ns

seg-1399281b7ce6 = ±{ "10" } ns

seg-a694039549c8 = Tabell 7-3

seg-d8799ba27fc3 = dTE_L MTIE, konstant temperatur

seg-c332ee79beaf = Tabell 7-4, m ≤ τ ≤ { "1 000" }

seg-2bd284168318 = dTE_L TDEV, konstant temperatur

seg-8358cf8c4e50 = { "2" } ns

seg-6a1cc65603b3 = Tabell 7-5

seg-de739a499521 = I tabell 7-5 er klasse A og B skrevet m < τ ≤ { "1 000" } og klasse C er skrevet m ≤ τ ≤ { "1 000" }. m er 1/16 s for en PTP-strøm med { "16" } pakker per sekund og { "1" } s for en utgang med { "1" } PPS. Typen behandler inndataene som en tidsintervallfeil for { "1" } PPS, så m = { "1" } s. Tabell 7-3 merknad { "1" } sier at cTE estimeres ved å midle tidsfeilen over { "1 000" } s. Typen rapporterer det verste absolutte gjennomsnittet av påfølgende blokker på { "1 000" } s.

seg-0a4b66fe5535 = ITU-T G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025): nettverksgrenser ved referansepunkt C

seg-8c2b01661011 = Alle tre er utrullingstilfelle { "1" } og gjelder etter et førsteordens lavpassfilter på { "0.1" } Hz.

seg-b3f93a59a8eb = Punkt

seg-23e44eab6e8b = max|TE_L|

seg-cb1a66f62f8e = MTIE-grense

seg-4aa99615d914 = { "7.3.1" } (klasse { "4" }-applikasjoner)

seg-eacfcd0a9ea5 = { "1 100" } ns

seg-dc2351580120 = { "100" } + { "75" } τ ns

seg-b2c519d30bc8 = { "1.3" } < τ ≤ { "2.4" }

seg-3c9bd014a192 = { "277" } + { "1.1" } τ ns

seg-abad3634a83e = { "2.4" } < τ ≤ { "275" }

seg-884708f2736f = { "580" } ns

seg-22bf4721fe97 = { "275" } < τ ≤ { "10 000" }

seg-17c12885b0d1 = { "7.3.2" } (forbedret nettverk)

seg-fcd7cb03855f = { "600" } ns

seg-9df58e5be8fc = { "37.39" } + { "9.7" } τ ns

seg-8e4e29bb36ac = { "55.27" } + { "2.25" } τ ns

seg-1d92062202d8 = { "2.4" } < τ ≤ { "20.2" }

seg-6ab02b4db41e = { "90.22" } + { "0.52" } τ ns

seg-81785e02523f = { "20.2" } < τ ≤ { "211.11" }

seg-f7fda527feed = { "200" } ns

seg-cab0e877b11b = { "211.11" } < τ ≤ { "10 000" }

seg-1f0b651381ea = { "7.3.3" } (PRTC i aksessnettet)

seg-5a5405483174= { "0.0475" } τ + { "25" } ns

seg-3aacef0066a0 = { "1" } < τ < { "400" }

seg-f34cbd5ce7e4 = { "44" } ns

seg-76f436fd7664 = { "400" } < τ ≤ { "10 000" }

seg-b0987b4e2e07 = Tabell 7-3 lar selve τ = { "400" } s stå uten grense (en rad slutter på «< { "400" }», den neste begynner på «{ "400" } <»). Typen rapporterer ingen grense der i stedet for å velge en. Referansepunkt A (punkt { "7.1" }) henter grensene sine fra G.8272, så PRTC-maskene ovenfor dekker det.

seg-915182a7500e = Frekvenssynkronisering: tidsvandringsgenerering i G.811, G.812, G.8262 og G.8262.1 ({ "0.36" })

seg-fb1342b76953 = Sju masker, hver av dem MTIE- og TDEV-grensen for tidsvandringsgenerering ved konstant temperatur (innenfor ±{ "1" } K), definert gjennom det tilsvarende førsteordens lavpassmålefilteret på { "10" } Hz som punktene oppgir. Det filteret virker før sampling, så typen tar registreringen som allerede målt gjennom det og bruker ingenting. PRC-masken gjelder en autonom klokke (G.810 figur 2a uavhengig klokkekonfigurasjon); de andre er grenser i låst modus for en klokke synkronisert til en referanse uten tidsvandring. Referansescenarioet er <c1/>: en fritt løpende OCXO mot de tre EEC-maskene, som overdriver oscillatorens bidrag ved observasjonsintervaller som er lange i forhold til en hvilken som helst sløyfes tidskonstant.

seg-3faf039b0ed9 = MTIE (ns)

seg-ca33cbe4fd07 = TDEV (ns)

seg-769e7fed4cd2 = { "0.275" } τ + { "25" } ({ "0.1" } < τ ≤ { "1 000" }); { "0.01" } τ + { "290" } (τ > { "1 000" })

seg-73dcf463ea29 = { "3" } ({ "0.1" } < τ ≤ { "100" }); { "0.03" } τ ({ "100" } < τ ≤ { "1 000" }); { "30" } ({ "1 000" } < τ < { "10 000" })

seg-cb38d6327e5c = G.811 (09/1997) punkt { "6.1" }

seg-1d9621af8091 = { "24" } ({ "0.1" } < τ ≤ { "9" }); { "8" } τ^{ "0.5" } ({ "9" } < τ ≤ { "400" }); { "160" } ({ "400" } < τ ≤ { "10 000" })

seg-bc8e3aa24bfe = { "3" } ({ "0.1" } < τ ≤ { "25" }); { "0.12" } τ ({ "25" } < τ ≤ { "100" }); { "12" } ({ "100" } < τ ≤ { "10 000" })

seg-5e048893f25e = G.812 (06/2004) tabell { "3" } og { "6" }

seg-45d290d9640a = { "3.2" } τ^−{ "0.5" } ({ "0.1" } < τ ≤ { "2.5" }); { "2" } ({ "2.5" } < τ ≤ { "40" }); { "0.32" } τ^{ "0.5" } ({ "40" } < τ ≤ { "1 000" }); { "10" } (τ > { "1 000" })

seg-ae92888ca436 = G.812 (06/2004) tabell { "4" } og { "7" }

seg-860b31153778 = { "40" } ({ "0.1" } < τ ≤ { "1" }); { "40" } τ^{ "0.1" } ({ "1" } < τ ≤ { "100" }); { "25.25" } τ^{ "0.2" } ({ "100" } < τ ≤ { "1 000" })

seg-854159374e79 = { "3.2" } ({ "0.1" } < τ ≤ { "25" }); { "0.64" } τ^{ "0.5" } ({ "25" } < τ ≤ { "100" }); { "6.4" } ({ "100" } < τ ≤ { "1 000" })

seg-8e825000b58e = G.8262 (10/2024) tabell { "1" } og { "3" }

seg-50fd3bf139a4 = { "20" } ({ "0.1" } < τ ≤ { "1" }); { "20" } τ^{ "0.48" } ({ "1" } < τ ≤ { "10" }); { "60" } ({ "10" } < τ ≤ { "1 000" })

seg-9ef5ff04e1d4 = som G.812 tabell { "7" }, lukket ved { "10 000" } s

seg-3ecb8d9128d0 = G.8262 (10/2024) tabell { "4" } og { "5" }

seg-ef3156b68064 = { "10" } τ^{ "0.155" } ({ "0.1" } ≤ τ ≤ { "1" }); { "10" } τ^{ "0.1" } ({ "1" } < τ ≤ { "100" }); { "6.3" } τ^{ "0.2" } ({ "100" } < τ ≤ { "1 000" })

seg-28f7a98f132e = { "0.64" } ({ "0.1" } ≤ τ ≤ { "25" }); { "0.128" } τ^{ "0.5" } ({ "25" } < τ ≤ { "100" }); { "1.28" } ({ "100" } < τ ≤ { "1 000" })

seg-47d0f50aa906 = G.8262.1 (11/2025) tabell { "1" } og { "3" }

seg-45e4ed8fa6ea = Hver rad ble kontrollert mot teksten lastet ned fra itu.int 2026-10-13: G.8262 (10/2024), G.8262.1 (11/2025), G.812 (06/2004) og G.811 (09/1997). G.812 (06/2004) er oppført som erstattet av en forhåndspublisert utgave 08/2026, og G.811 har et Amd. { "1" } (04/2016); ingen av dem kunne lastes ned, så hvis de endrer noe tall ovenfor, gjenspeiler ikke denne siden og koden det. Der trykte koeffisienter gjør et knekkpunkt diskontinuerlig (for eksempel { "40" } · { "10" }^{ "0.4" } = { "100.48" } ns mot platået på { "100" } ns i G.812 tabell { "4" }), beholdes tabellene som trykt og enhetstestene begrenser trinnet. Ikke implementert: tilleggene for variabel temperatur (G.812 tabell { "5" }, G.8262 tabell { "2" }, G.8262.1 tabell { "2" }), krav til holdover og transienter, jitter og G.811-frekvensnøyaktigheten i punkt { "5" }.

seg-4f6666854cf7 = Budsjetter (tid til overskridelse)

seg-1f3322a94bbb = ePRTC standard max|TE_HO|

seg-26fd4be0d5ca = G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) punkt { "8.3.1" }

seg-0d5433d85c88 = Nettverkets holdover-tildeling, kort GNSS-avbrudd

seg-b74c5284d584 = G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) tabell V.1, feilscenario (b), «re-arrangements and holdover in the network». Et eksempel på en tildeling, ikke et krav.

seg-afe6c9903ada = Nettverksgrense ved referansepunkt C

seg-0c261b05c3cf = G.8271.1 punkt { "7.3.1" }. Dette er en filtrert størrelse; som budsjett sammenlignes den ufiltrert.

seg-4b5a9718d008 = Sluttapplikasjon, nøyaktighetsklasse { "4" }

seg-2a38e45e7008 = { "1.5" } µs

seg-41c6dd43e313 = G.8271 (03/2020) Amd. { "1" } (08/2024) tabell { "1" }, klasse { "4" }

seg-ded846b5a4bc = <b>Det klassiske tallet «{ "1.5" } µs ende til ende».</b> Det er kravet til tidsfeil for klasse { "4" } i G.8271 tabell { "1" }, oppgitt mot en felles referanse ved sluttapplikasjonen. G.8271.1 tabell V.1 viser hvordan et nettverk kan fordele det i normal drift: { "100" } ns for PRTC/telekom-grandmasteren, { "200" } ns for dynamisk tidsfeil i kjeden, en konstant tidsfeil for klokkene og lenkene, { "1 100" } ns til sammen ved referansepunkt C, deretter { "250" } ns for omarrangeringer og kort holdover i sluttapplikasjonen og { "150" } ns for sluttapplikasjonens egen støy, { "1 500" } ns ved referansepunkt E. Feilscenario (c) i den samme tabellen, «long holdover periods, e.g., { "1" } day», gir { "3 350" } ns ved C og { "3 500" } ns ved E (merknad { "5" } sier at overskridelse av { "1 500" } ns kan svekke tjenesten). Ingen av anbefalingene oppgir altså et krav om «{ "1.5" } µs over { "24" } timer med holdover», og typen implementerer ikke noe slikt.

seg-76cab595673a = Ikke bekreftet eller ikke implementert

seg-175c282ddce2 = Ingenting nedenfor er implementert som maske. Ingenting av det er fylt inn ved skjønn.

seg-3c74e4ba9579 = <b>Merket «for further study» i anbefalingene:</b> G.8273.2 klasse D maks|TE|, cTE, dTE_L MTIE og TDEV, dTE_H og holdover; ePRTC-B-holdover (G.8272.1 punkt { "8.2.1" }); ePRTC-A-holdover MTIE og TDEV utover { "10 000" } s (tabell { "4" } merknad { "1" }, tabell { "5" } merknad { "2" }); ePRTC-fasediskontinuitet (punkt { "7" }); T-BC/T-TSC-fase-/tidsholdover når både PTP- og fysisklagsinngangene er tapt (G.8273.2 punkt { "7.4.2.1" }); nettverksgrensen for TDEV ved referansepunkt C (G.8271.1 punkt { "7.3.1" } til { "7.3.3" }); nettverksgrenser for installasjonstilfelle { "2" } ved punkt C.

seg-93c60d44788e = <b>Overført, men ikke implementert i denne versjonen:</b> G.8273.2 tabell 7-6 (MTIE ved variabel temperatur: { "40" } / { "40" } / { "10" } ns opptil { "10 000" } s), tabell 7-7 (dTE_H topp til topp: { "70" } / { "70" } / { "30" } ns, som krever et høypassfilter på { "0.1" } Hz), tabell 7-10 (holdover-MTIE med frekvensassistanse i fysisk lag), relativ tidsfeil (tabell 7-8 og 7-9) og dTE_H-grensene i G.8271.1 punkt { "7.3.2" } ({ "50" } ns) og { "7.3.3" } ({ "70" } ns).

seg-f5fcd3b0f8a5 = <b>Ikke brukt:</b> glidende gjennomsnittsfilter på minst { "100" } sampler som G.8272 og G.8272.1 angir for PTP-grensesnitt. Inngangen behandles som en tidsintervallfeil for { "1" } PPS, som disse anbefalingene måler uten filter.

seg-74fe057a4392 = <b>Uleselig:</b> de to begrensede endringsdokumentene fra { "2026" } som er nevnt under «Sources read».

seg-bd4ec59cc872 = <b>Redaksjonell merkelighet:</b> i G.8272.1 Amd. { "1" } har toppen av tabell { "3" } en innsatt rad «TDEV limit [ns] { "1" } / { "0.1" } < τ ≤ { "10 000" }» i endringsmarkering, over tidsfeilkolonnene. Den behandles ikke som en del av tidsfeilens omhyllingskurve. Den samme TDEV-grensen på { "1" } ns står i tabell { "5" } og er implementert der.

seg-511db1219de1 = Målefilteret

seg-5fc683308b31 = G.8273.2 og G.8271.1 definerer de filtrerte grensene sine gjennom et førsteordens lavpassfilter med { "0.1" } Hz båndbredde. Typen bruker den diskrete glatteren y_k = y_{ "{" }k−{ "1" }{ "}" } + α (x_k − y_{ "{" }k−{ "1" }{ "}" }), α = { "1" } − exp(−2π · { "0.1" } · Δt), startet ved det første sampelet. Det er en tilnærming til testutstyr, ikke en kopi av noe bestemt instrument. Det brukes bare når sampleintervallet Δt er { "1" } s eller mindre. En grovere registrering rapporteres som NOT-EVALUATED mot en filtrert maske i stedet for å bli filtrert dårlig.

seg-218e5ad620af = Oscillator-forhåndsinnstillinger (MODELLED)

seg-28bb7b8ad89f = Alle tall er databladets egne, lest 2026-09-25.

seg-b4207b682560 = Enhet og dokument

seg-13f9ba96c063 = ADEV-maksima som er brukt (τ: σ_y)

seg-d719167df981 = Aldring

seg-f30740907f6a = Temperatur

seg-c789847129bd = Microchip (Vectron) OX-208, { "10" } MHz; datablad Rev 12-1-2021

seg-cefcf7025826 = { "1" } s: { "5e-12" }; { "10" } s: { "8e-12" }; { "100" } s: { "1e-11" }; { "1 000" } s: { "5e-11" }

seg-85f8b8fbbae6 = ±{ "0.15" } ppb/døgn etter { "72" } h (f ≤ { "10" } MHz)

seg-0c6d3ae4e409 = ±{ "0.4" } ppb, { "0" } °C til +{ "70" } °C, med +{ "25" } °C som referanse

seg-53ac4dcaf8b1 = Microchip 8040C Rubidium Frequency Standard, standardytelse; DS00003047A (2/20)

seg-ccb8b3a41af4 = { "1" } s: { "3.0e-11" }; { "100" } s: { "3.0e-12" }

seg-ae0f630aba4b = <5e-11/måned etter { "30" } dager

seg-dbb2a780ceb9 = temperaturkoeffisient <{ "3E-10" }, { "0" } °C til { "50" } °C

seg-79d5b7a3a453 = Microchip 5071A, høyytelsesrør; DS00002980D (5/25)

seg-62572a695878 = { "1" } s: { "5.0e-12" }; { "10" } s: { "3.5e-12" }; { "100" } s: { "8.5e-13" }; { "1 000" } s: { "2.7e-13" }; 10⁴ s: { "8.5e-14" }; 10⁵ s: { "2.7e-14" }; { "5" } dager: { "1.0e-14" }; { "30" } dager: { "1.0e-14" }

seg-1fbdd6edc376 = ingen rate oppgitt; endring over levetiden ≤{ "5.0e-14" }

seg-bb485faf403a = ±{ "8.0e-14" } mot omgivelsene ({ "0" } °C til { "50" } °C, fuktighet, magnetfelt, støt)

seg-889f4dc6cafc = Microchip SA.45s CSAC, alternativ { "001" } og { "003" }; DS00002985D (5/23)

seg-ecee1cb2a670 = { "1" } s: { "3e-10" }; { "10" } s: { "1e-10" }; { "100" } s: { "3e-11" }; { "1 000" } s: { "1e-11" }

seg-c90e2f590297 = <9e-10/måned etter { "30" } dager

seg-5b1bd12aea0f = ±{ "5e-10" }, −{ "10" } °C til { "70" } °C

seg-63ba00e95bbc = Lenker til dokumentene: <a1>OX-208</a1>, <a2>8040C</a2>, <a3>5071A</a3>, <a4>SA.45s</a4>.

seg-31ad29d092ee = Utelatt med vilje: 8040C-ens rad for { "10" } s, som databladet skriver som «<{ "1.0" } x { "10" }^{ "11" }» (en feiltrykt eksponent), og 5071A-ens rader under { "1" } s. OX-049 ble vurdert for OCXO-en og ikke brukt, fordi aldringsraden ikke kan leses entydig fra den forskjøvede tabellen.

seg-8d4a915bc7fc = <b>Hvordan tallene blir til en modell.</b> Dette er valg som denne motoren har gjort, og hvert av dem rapporteres i kjøringens utdata:

seg-f1e6ea28601c = <b>Støytilpasning.</b> Nivåene for hvit, flicker- og random-walk-frekvensstøy er en ikke-negativ minste kvadraters tilpasning til ADEV-maksimaene, deretter skalert opp til modellen ligger på eller over hvert punkt. Databladtallene er maksima, så modellen omslutter dem.

seg-0e5ab055094a = <b>Flicker-gulv.</b> Gulvet ligger aldri under ADEV ved den lengste oppførte τ. Et datablad slutter å oppføre verdier der produsenten slutter å love forbedring, så modellen lar ikke klokken bli bedre enn det. Dette kan bare gjøre en holdover dårligere.

seg-ebefbd6f119b = <b>Aldring.</b> Et månedlig tall regnes om med { "30" } dager per måned og brukes som en lineær frekvensdrift fra det øyeblikket signalet gikk tapt. Cesium-forhåndsinnstillingen har ingen aldring.

seg-bb08c7b5baf5 = <b>Temperatur.</b> Den oppgitte grensen leses lineært over halve driftsområdet (for eksempel gir ±{ "5e-10" } over −{ "10" } °C til { "70" } °C { "1.25e-11" } per kelvin), og drives deretter av en sinusformet temperaturprofil der amplitude og periode er scenarioinndata. Ingenting i et datablad sier at avhengigheten er lineær; dette er en verste-tilfelle-tolkning.

seg-47a256757cfc = <b>Før tapet</b> er klokken disiplinert, og tidsfeilen er hvit fasestøy med en oppgitt 1-sigma-verdi.

seg-3ef60b128bb7 = <b>Hva referansescenarioet viser.</b> Med de innsjekkede inndataene (rubidium, ±{ "2" } K daglig temperatursvingning, { "24" } h holdover etter { "1" } h låst) når registreringen en største absolutte tidsfeil på { "603.2" } ns. Den passerer ePRTC-budsjettet på { "100" } ns { "8 206" } s etter tapet og tildelingen på { "400" } ns etter { "25 713" } s, og holder seg innenfor { "1 100" } ns og { "1.5" } µs hele døgnet. Den bryter ePRTC-A-holdover-omhyllingskurven { "3 627" } s etter tapet, noe som er forventet: det kravet forutsetter en referanse i cesiumklassen. Temperaturleddet alene kan nå { "660" } ns, så ved disse inndataene betyr det mer enn aldring ({ "72" } ns ved slutten av døgnet).

seg-ba87d450423c = <c1/> kontrollerer typens MTIE og TDEV mot <c2/> { "2024.06" } på <c3/>, en CSAC-holdover-serie med { "2" } 048 sampler med aldring, flicker og temperatur. Ved { "17" } MTIE- og { "12" } TDEV-midlingsfaktorer stemmer MTIE nøyaktig, og TDEV stemmer til { "1.1e-15" } relativt. De samme kurvene leses tilbake fra en full kjøring som leser inn CSV-filen. Dette validerer estimatorene på den registreringen. Det validerer ikke den syntetiske holdoveren, maskene eller forhåndsinnstillingene, som er MODELLED-rader i <c4/>.

seg-6fdc3cc32a2f = <s1>Forrige</s1>Slot-tidssynkronisering

seg-1108b114de88 = <s1>Neste</s1>Bedratt tid
