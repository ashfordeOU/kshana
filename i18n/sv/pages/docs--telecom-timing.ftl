# docs--telecom-timing: translations (sv)

seg-04ece0eb7bd2 = Mask-id

seg-a13eab564243 = MTIE

seg-f155b7ceef1f = TDEV

seg-42cdb8e987e6 = Budget

seg-88372b30ed79 = Gräns

seg-50fffd444946 = { "100" } ns

seg-79e6a31245f2 = { "400" } ns

seg-f63dd3d7aad4 = Källa

seg-587beeccaa11 = Förinställning

seg-edb7b16b6c0e = Validering

seg-3c513ef2fd3b = Storhet

seg-62b6e83a9145 = Källa: <c1/>

seg-95222c3659cd = Telekomtidssynkronisering: masker, källor och förinställningar

seg-5a604e063370 = Den här sidan listar varje gräns som scenariotypen <c1/> kontrollerar, varifrån var och en kommer och vad som lämnats utanför. Koden finns i <c2/>. Referensscenariot är <c3/>, frekvenssynkroniseringsscenariot är <c4/> och inläsningsexemplet är <c5/>.

seg-f078828b2325 = <b>Förkortningar.</b> ITU-T är den internationella teleunionens sektor för telekommunikationsstandardisering (International Telecommunication Union Telecommunication Standardization Sector). GNSS är Global Navigation Satellite System. TE är tidsfel (time error), skillnaden mellan en klockas tid och referenstiden. max|TE| är det största absoluta tidsfelet. MTIE är maximalt tidsintervallfel (maximum time interval error): det största topp-till-topp-tidsfelet inom ett observationsfönster av längd τ (tau). TDEV är tidsdeviation (time deviation), ett kvadratiskt medelvärdesmått på tidsvandring vid medelvärdestiden τ. cTE är konstant tidsfel (genomsnittligt offset). dTE är dynamiskt tidsfel (den del som rör sig). TE_L och dTE_L är tidsfelet efter ett lågpassfilter av första ordningen med bandbredden { "0.1" } hertz (Hz); dTE_H är den del som ligger över det filtret. TE_HO är tidsfel i holdover. PRTC är primär referenstidsklocka (primary reference time clock). ePRTC är förbättrad PRTC. T-BC är telekom-gränsklocka (telecom boundary clock) och T-TSC är telekom-tidsslavklocka (telecom time slave clock). PTP är Precision Time Protocol. PPS är pulser per sekund. OCXO är ugnsstyrd kristalloscillator. CSAC är atomklocka i chipskala. CSV är kommaseparerade värden. ADEV är Allan-deviation (σ_y), standardmåttet på frekvensstabilitet. ns är nanosekunder och µs är mikrosekunder. ppb är miljarddelar (en relativ frekvens på { "1e-9" }), och MHz är megahertz. Amd. är ett tillägg till en rekommendation, och Y.1367 och liknande är samma rekommendations nummer i ITU-T:s Y-serie.

seg-a7746845eb05 = <b>Vad det här är.</b> Estimatorerna (MTIE och TDEV) är kontrollerade mot paketet <c1/> från tredje part och är VALIDATED för det. Masktabellerna är avskrifter av rekommendationerna nedan. En syntetisk holdover är en modell byggd på offentliga datablads siffror. Typen är MODELLED i sin helhet. Det är inte ett test av överensstämmelse, och ett PASS här är inget intyg.

seg-e4adedc8e36d = Lästa källor

seg-44f6d9a7906c = Alla ITU-T-texter laddades ner från itu.int den 2026-09-25. Den nyaste utgåvan som kunde läsas i sin helhet användes.

seg-28d4cebb747f = Rekommendation

seg-ef3644f3af9c = Läst utgåva

seg-82dcf7b71cdb = Status på itu.int

seg-149a5b44ddfd = ITU-T G.8272/Y.1367, <em>Timing characteristics of primary reference time clocks</em>

seg-f65ca7286466 = gällande

seg-5dd73fad1c6b = ITU-T G.8272.1/Y.1367.1, <em>Timing characteristics of enhanced primary reference time clocks</em>

seg-efdb7451b140 = { "2024" } Amd. { "1" } (07/2025), en publikation med fullständig text

seg-fff491f6efc6 = ITU-T G.8273.2/Y.1368.2, <em>Timing characteristics of telecom boundary clocks and telecom time synchronous clocks for use with full timing support from the network</em>

seg-6dacd7a4b068 = { "2023" } Amd. { "2" } (11/2025), fullständig text

seg-266cb2ce6e7f = ITU-T G.8271.1/Y.1366.1, <em>Network limits for time synchronization in packet networks with full timing support from the network</em>

seg-55fed85e64bc = { "2022" } Amd. { "3" } (05/2025), fullständig text

seg-a2e1e37c4219 = ITU-T G.8271/Y.1366, <em>Time and phase synchronization aspects of telecommunication networks</em>

seg-63c64d128cc6 = 03/2020 och dess Amd. { "1" } (08/2024)

seg-66209db00349 = Två nyare tillägg finns men kunde inte läsas: G.8272 ({ "2025" }) Amd. { "1" } (08/2026) och G.8272.1 ({ "2024" }) Amd. { "2" } (08/2026). Båda är förpublicerade och begränsade till ITU-medlemmar (konton i Telecommunication Information Exchange Service, TIES). Om de ändrar någon siffra nedan återspeglar varken den här sidan eller koden det ännu.

seg-25d639be3a1b = <b>Hur siffrorna kontrollerades.</b> Textutvinning ur dessa PDF-filer (Portable Document Format) tappar den grekiska bokstaven τ och mikrotecknet µ, så "{ "0.275" } × { "10" }⁻³τ" blir "{ "0.275" } × { "10" }⁻³". Varje rad i G.8272 tabellerna { "1" } till { "4" }, G.8272.1 tabellerna { "1" } till { "5" }, G.8271 tabell { "1" } och G.8271.1 tabell 7-1 lästes därför på nytt från den renderade sidbilden. G.8273.2 tabellerna 7-1 till 7-5 och G.8271.1 tabellerna 7-2 och 7-3 lästes från utvunnen text där τ fanns kvar. Där en tabell innebär kontinuitet vid en brytpunkt kontrollerar ett enhetstest det.

seg-33b5f44c513b = Implementerade gränser

seg-3ce6da7e3e99 = τ är i sekunder. Ett intervall skrivet "{ "0.1" } < τ ≤ { "273" }" är öppet vid { "0.1" } s och slutet vid { "273" } s, precis som i tabellen, och koden behåller varje ände på samma sätt.

seg-1efb6779348a = ITU-T G.8272 (07/2025): PRTC-A och PRTC-B, låst läge

seg-c54e45baa463 = max|TE|

seg-25887373a479 = { "40" } ns

seg-0e18047889c1 = avsnitt { "6.1" }

seg-4ce06948bf3f = MTIE (avsnitt { "6.2" }):

seg-f1e336517976 = Mask

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

seg-d18148049b1e = TDEV (avsnitt { "6.2" }):

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

seg-9b8478f86b44 = Avsnitt { "6.2" } anger också att den minsta mätperioden för TDEV är tolv gånger integrationsperioden (T = 12τ). Typen tillämpar den regeln på varje TDEV den rapporterar, så TDEV ges bara för τ upp till en tolftedel av registreringen. G.8272 anger inget holdover-krav för en PRTC.

seg-392ca772c712 = ITU-T G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025): ePRTC

seg-42c76f7b90ac = Låst läge:

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

seg-ca9cb946c8f4 = ePRTC-A holdover, tidsfel (avsnitt { "8.2.1" }, tabell { "3" }). L är den tid ePRTC var låst före förlusten, i dygn, och t är tiden sedan holdover startade, i sekunder. Gränsen stiger linjärt från { "30" } ns till { "100" } ns över holdover-perioden H.

seg-fa700160348e = Låst varaktighet L

seg-61f9dec111cb = Holdover-period H

seg-f6a6df18839c = Gräns för |Δx(t)|

seg-9229068d7534 = L < { "6" } dygn

seg-5bd5193f213c = { "0" } < t ≤ { "70 000" } s ({ "0.81" } dygn)

seg-df5ffdf7245b = { "30" } + { "1.000" } × { "10" }⁻³ t ns

seg-1af75c2d666f = { "6" } dygn ≤ L ≤ { "40" } dygn

seg-51754e29cb46 = { "0" } < t ≤ L · { "86 400" } s

seg-dacdb2a00c6a = { "30" } + { "70" } t / (L · { "86 400" }) ns

seg-71a6238f1e29 = L > { "40" } dygn

seg-5a0e39fa8dc3 = { "0" } < t ≤ { "3 456 000" } s ({ "40" } dygn)

seg-b0a167d378cb = { "30" } + { "2.025463" } × { "10" }⁻⁵ t ns

seg-3262966b5eab = ePRTC-A holdover, vandring (avsnitt { "8.2.2" }):

seg-2c09e57675a7 = { "100" } < τ ≤ { "10 000" }

seg-9afccb4dbf30 = { "0.1" } < τ ≤ { "10 000" }

seg-a4a813c38ef6 = Tabell { "5" }

seg-5d56fb7889b2 = Avsnitt { "8.3.1" } sätter det förvalda högsta holdover-tidsfelet, max|TE_HO|, till { "100" } ns. Typen använder det som en förvald budget för tid till överskridande.

seg-3702a44d3ff1 = ITU-T G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025): T-BC och T-TSC

seg-96b5072f792f = Klass A

seg-7737bc0444b1 = Klass B

seg-cd92242017a8 = Klass C

seg-0689443dfc12 = Klass D

seg-54163aca5d46 = max|TE| (ofiltrerat)

seg-b36412e1acfb = { "70" } ns

seg-ed79e6cdac25 = för vidare studier

seg-5c2985d408e3 = Tabell 7-1

seg-067c7c90c1e1 = max|TE_L| ({ "0.1" } Hz lågpass)

seg-1c5ac746d16b = Tabell 7-2

seg-9802166ed2e2 = cTE-intervall

seg-b94484db77ab = ±{ "50" } ns

seg-17d4f5817950 = ±{ "20" } ns

seg-1399281b7ce6 = ±{ "10" } ns

seg-a694039549c8 = Tabell 7-3

seg-d8799ba27fc3 = dTE_L MTIE, konstant temperatur

seg-c332ee79beaf = Tabell 7-4, m ≤ τ ≤ { "1 000" }

seg-2bd284168318 = dTE_L TDEV, konstant temperatur

seg-8358cf8c4e50 = { "2" } ns

seg-6a1cc65603b3 = Tabell 7-5

seg-de739a499521 = I tabell 7-5 skrivs klasserna A och B som m < τ ≤ { "1 000" } och klass C som m ≤ τ ≤ { "1 000" }. m är 1/16 s för en PTP-ström med { "16" } paket per sekund och { "1" } s för en utsignal på { "1" } PPS. Typen behandlar indata som ett tidsintervallfel på { "1" } PPS, så m = { "1" } s. Tabell 7-3 not { "1" } säger att cTE skattas genom att medelvärdesbilda tidsfelet över { "1 000" } s. Typen rapporterar det värsta absoluta medelvärdet av på varandra följande block om { "1 000" } s.

seg-0a4b66fe5535 = ITU-T G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025): nätgränser vid referenspunkt C

seg-8c2b01661011 = Alla tre är driftsättningsfall { "1" } och gäller efter ett lågpassfilter av första ordningen på { "0.1" } Hz.

seg-b3f93a59a8eb = Avsnitt

seg-23e44eab6e8b = max|TE_L|

seg-cb1a66f62f8e = MTIE-gräns

seg-4aa99615d914 = { "7.3.1" } (tillämpningar i klass { "4" })

seg-eacfcd0a9ea5 = { "1 100" } ns

seg-dc2351580120 = { "100" } + { "75" } τ ns

seg-b2c519d30bc8 = { "1.3" } < τ ≤ { "2.4" }

seg-3c9bd014a192 = { "277" } + { "1.1" } τ ns

seg-abad3634a83e = { "2.4" } < τ ≤ { "275" }

seg-884708f2736f = { "580" } ns

seg-22bf4721fe97 = { "275" } < τ ≤ { "10 000" }

seg-17c12885b0d1 = { "7.3.2" } (förbättrat nät)

seg-fcd7cb03855f = { "600" } ns

seg-9df58e5be8fc = { "37.39" } + { "9.7" } τ ns

seg-8e4e29bb36ac = { "55.27" } + { "2.25" } τ ns

seg-1d92062202d8 = { "2.4" } < τ ≤ { "20.2" }

seg-6ab02b4db41e = { "90.22" } + { "0.52" } τ ns

seg-81785e02523f = { "20.2" } < τ ≤ { "211.11" }

seg-f7fda527feed = { "200" } ns

seg-cab0e877b11b = { "211.11" } < τ ≤ { "10 000" }

seg-1f0b651381ea = { "7.3.3" } (PRTC i accessnätet)

seg-5a5405483174 = { "0.0475" } τ + { "25" } ns

seg-3aacef0066a0 = { "1" } < τ < { "400" }

seg-f34cbd5ce7e4 = { "44" } ns

seg-76f436fd7664 = { "400" } < τ ≤ { "10 000" }

seg-b0987b4e2e07 = Tabell 7-3 lämnar själva τ = { "400" } s utan gräns (en rad slutar på "< { "400" }", nästa börjar på "{ "400" } <"). Typen rapporterar ingen gräns där i stället för att välja en. Referenspunkt A (avsnitt { "7.1" }) hämtar sina gränser från G.8272, så PRTC-maskerna ovan täcker den.

seg-915182a7500e = Frekvenssynkronisering: vandringsgenerering enligt G.811, G.812, G.8262 och G.8262.1 ({ "0.36" })

seg-fb1342b76953 = Sju masker, var och en gränsen för MTIE och TDEV vid vandringsgenerering vid konstant temperatur (inom ±{ "1" } K), definierad genom det motsvarande första ordningens lågpassmätfilter på { "10" } Hz som avsnitten anger. Det filtret verkar före samplingen, så typen tar registreringen som redan uppmätt genom det och tillämpar inget. PRC-masken gäller för en självständig klocka (G.810 figur 2a, konfiguration med oberoende klocka); de andra är gränser i låst läge för en klocka synkroniserad mot en vandringsfri referens. Referensscenariot är <c1/>: en fritt gående OCXO mot de tre EEC-maskerna, vilket överskattar oscillatorns bidrag vid observationsintervall som är långa i förhållande till en slingas tidskonstant.

seg-3faf039b0ed9 = MTIE (ns)

seg-ca33cbe4fd07 = TDEV (ns)

seg-769e7fed4cd2 = { "0.275" } τ + { "25" } ({ "0.1" } < τ ≤ { "1 000" }); { "0.01" } τ + { "290" } (τ > { "1 000" })

seg-73dcf463ea29 = { "3" } ({ "0.1" } < τ ≤ { "100" }); { "0.03" } τ ({ "100" } < τ ≤ { "1 000" }); { "30" } ({ "1 000" } < τ < { "10 000" })

seg-cb38d6327e5c = G.811 (09/1997) avsnitt { "6.1" }

seg-1d9621af8091 = { "24" } ({ "0.1" } < τ ≤ { "9" }); { "8" } τ^{ "0.5" } ({ "9" } < τ ≤ { "400" }); { "160" } ({ "400" } < τ ≤ { "10 000" })

seg-bc8e3aa24bfe = { "3" } ({ "0.1" } < τ ≤ { "25" }); { "0.12" } τ ({ "25" } < τ ≤ { "100" }); { "12" } ({ "100" } < τ ≤ { "10 000" })

seg-5e048893f25e = G.812 (06/2004) tabellerna { "3" } och { "6" }

seg-45d290d9640a = { "3.2" } τ^−{ "0.5" } ({ "0.1" } < τ ≤ { "2.5" }); { "2" } ({ "2.5" } < τ ≤ { "40" }); { "0.32" } τ^{ "0.5" } ({ "40" } < τ ≤ { "1 000" }); { "10" } (τ > { "1 000" })

seg-ae92888ca436 = G.812 (06/2004) tabellerna { "4" } och { "7" }

seg-860b31153778 = { "40" } ({ "0.1" } < τ ≤ { "1" }); { "40" } τ^{ "0.1" } ({ "1" } < τ ≤ { "100" }); { "25.25" } τ^{ "0.2" } ({ "100" } < τ ≤ { "1 000" })

seg-854159374e79 = { "3.2" } ({ "0.1" } < τ ≤ { "25" }); { "0.64" } τ^{ "0.5" } ({ "25" } < τ ≤ { "100" }); { "6.4" } ({ "100" } < τ ≤ { "1 000" })

seg-8e825000b58e = G.8262 (10/2024) tabellerna { "1" } och { "3" }

seg-50fd3bf139a4 = { "20" } ({ "0.1" } < τ ≤ { "1" }); { "20" } τ^{ "0.48" } ({ "1" } < τ ≤ { "10" }); { "60" } ({ "10" } < τ ≤ { "1 000" })

seg-9ef5ff04e1d4 = som G.812 tabell { "7" }, slutet vid { "10 000" } s

seg-3ecb8d9128d0 = G.8262 (10/2024) tabellerna { "4" } och { "5" }

seg-ef3156b68064 = { "10" } τ^{ "0.155" } ({ "0.1" } ≤ τ ≤ { "1" }); { "10" } τ^{ "0.1" } ({ "1" } < τ ≤ { "100" }); { "6.3" } τ^{ "0.2" } ({ "100" } < τ ≤ { "1 000" })

seg-28f7a98f132e = { "0.64" } ({ "0.1" } ≤ τ ≤ { "25" }); { "0.128" } τ^{ "0.5" } ({ "25" } < τ ≤ { "100" }); { "1.28" } ({ "100" } < τ ≤ { "1 000" })

seg-47d0f50aa906 = G.8262.1 (11/2025) tabellerna { "1" } och { "3" }

seg-45e4ed8fa6ea = Varje rad kontrollerades mot texten som laddades ner från itu.int den 2026-10-13: G.8262 (10/2024), G.8262.1 (11/2025), G.812 (06/2004) och G.811 (09/1997). G.812 (06/2004) anges som ersatt av en förpublicerad utgåva från 08/2026, och G.811 har en Amd. { "1" } (04/2016); ingen av dem kunde laddas ner, så om de ändrar någon siffra ovan återspeglar varken den här sidan eller koden det. Där tryckta koefficienter gör en brytpunkt diskontinuerlig (till exempel { "40" } · { "10" }^{ "0.4" } = { "100.48" } ns mot platån på { "100" } ns i G.812 tabell { "4" }) behålls tabellerna som tryckta och enhetstesterna begränsar steget. Inte implementerat: tilläggen för varierande temperatur (G.812 tabell { "5" }, G.8262 tabell { "2" }, G.8262.1 tabell { "2" }), krav på holdover och transienter, jitter samt frekvensnoggrannheten i G.811 avsnitt { "5" }.

seg-4f6666854cf7 = Budgetar (tid till överskridande)

seg-1f3322a94bbb = Förvald max|TE_HO| för ePRTC

seg-26fd4be0d5ca = G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) avsnitt { "8.3.1" }

seg-0d5433d85c88 = Nätets holdover-tilldelning, kort GNSS-avbrott

seg-b74c5284d584 = G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) tabell V.1, felscenario (b), "re-arrangements and holdover in the network". Ett exempel på tilldelning, inte ett krav.

seg-afe6c9903ada = Nätgräns vid referenspunkt C

seg-0c261b05c3cf = G.8271.1 avsnitt { "7.3.1" }. Det här är en filtrerad storhet; som budget jämförs den ofiltrerad.

seg-4b5a9718d008 = Slutanvändning, noggrannhetsklass { "4" }

seg-2a38e45e7008 = { "1.5" } µs

seg-41c6dd43e313 = G.8271 (03/2020) Amd. { "1" } (08/2024) tabell { "1" }, klass { "4" }

seg-ded846b5a4bc = <b>Den klassiska siffran "{ "1.5" } µs från ände till ände".</b> Det är tidsfelskravet för klass { "4" } i G.8271 tabell { "1" }, angivet mot en gemensam referens vid slutanvändningen. G.8271.1 tabell V.1 visar hur ett nät kan tilldela det vid normal drift: { "100" } ns för PRTC/telekom-grandmastern, { "200" } ns för kedjans dynamiska tidsfel, ett konstant tidsfel för klockorna och länkarna, totalt { "1 100" } ns vid referenspunkt C, därefter { "250" } ns för omläggningar och kort holdover i slutanvändningen och { "150" } ns för slutanvändningens eget brus, { "1 500" } ns vid referenspunkt E. Samma tabells felscenario (c), "long holdover periods, e.g., { "1" } day", ger { "3 350" } ns vid C och { "3 500" } ns vid E (dess not { "5" } säger att ett överskridande av { "1 500" } ns kan försämra tjänsten). Ingen av rekommendationerna anger alltså något krav på "{ "1.5" } µs under { "24" } timmars holdover", och typen implementerar inget sådant.

seg-76cab595673a = Inte bekräftat eller inte implementerat

seg-175c282ddce2 = Inget av nedanstående är implementerat som en mask. Inget av det har fyllts i med en uppskattning.

seg-3c74e4ba9579 = <b>Markerat "for further study" i rekommendationerna:</b> G.8273.2 klass D max|TE|, cTE, dTE_L MTIE och TDEV, dTE_H och holdover; ePRTC-B holdover (G.8272.1 avsnitt { "8.2.1" }); ePRTC-A holdover MTIE och TDEV bortom { "10 000" } s (tabell { "4" } not { "1" }, tabell { "5" } not { "2" }); ePRTC-fasdiskontinuitet (avsnitt { "7" }); T-BC/T-TSC fas-/tidsholdover när både PTP- och fysiskt lager-ingångarna är förlorade (G.8273.2 avsnitt { "7.4.2.1" }); nätgränsen för TDEV vid referenspunkt C (G.8271.1 avsnitt { "7.3.1" } till { "7.3.3" }); nätgränser för driftsättningsfall { "2" } vid punkt C.

seg-93c60d44788e = <b>Avskrivet men inte implementerat i den här versionen:</b> G.8273.2 tabell 7-6 (MTIE med varierande temperatur: { "40" } / { "40" } / { "10" } ns upp till { "10 000" } s), tabell 7-7 (dTE_H topp till topp: { "70" } / { "70" } / { "30" } ns, vilket kräver ett högpassfilter på { "0.1" } Hz), tabell 7-10 (holdover-MTIE med frekvenshjälp från fysiskt lager), relativt tidsfel (tabellerna 7-8 och 7-9) samt dTE_H-gränserna i G.8271.1 avsnitt { "7.3.2" } ({ "50" } ns) och { "7.3.3" } ({ "70" } ns).

seg-f5fcd3b0f8a5 = <b>Inte tillämpat:</b> glidande medelvärdesfiltret på minst { "100" } sampel som G.8272 och G.8272.1 anger för PTP-gränssnitt. Indata behandlas som ett tidsintervallfel på { "1" } PPS, vilket de rekommendationerna mäter utan filter.

seg-74fe057a4392 = <b>Oläsligt:</b> de två begränsade tilläggen från { "2026" } som nämns under "Lästa källor".

seg-bd4ec59cc872 = <b>Redaktionell egenhet:</b> i G.8272.1 Amd. { "1" } innehåller tabell { "3" } överst, ovanför tidsfelskolumnerna, en infogad rad "TDEV limit [ns] { "1" } / { "0.1" } < τ ≤ { "10 000" }" i tilläggets markering. Den behandlas inte som en del av tidsfelskurvan. Samma TDEV på { "1" } ns finns i tabell { "5" } och är implementerad där.

seg-511db1219de1 = Mätfiltret

seg-5fc683308b31 = G.8273.2 och G.8271.1 definierar sina filtrerade gränser genom ett lågpassfilter av första ordningen med bandbredden { "0.1" } Hz. Typen tillämpar den diskreta utjämnaren y_k = y_{ "{" }k−{ "1" }{ "}" } + α (x_k − y_{ "{" }k−{ "1" }{ "}" }), α = { "1" } − exp(−2π · { "0.1" } · Δt), som startar vid det första samplet. Det är en approximation av testutrustning, inte en kopia av något instrument. Den tillämpas bara när samplingsintervallet Δt är { "1" } s eller mindre. En grövre registrering rapporteras som NOT-EVALUATED mot en filtrerad mask i stället för att filtreras dåligt.

seg-218e5ad620af = Oscillatorförinställningar (MODELLED)

seg-28bb7b8ad89f = Varje siffra är databladets egen, läst den 2026-09-25.

seg-b4207b682560 = Enhet och dokument

seg-13f9ba96c063 = Använda ADEV-maxvärden (τ: σ_y)

seg-d719167df981 = Åldring

seg-f30740907f6a = Temperatur

seg-c789847129bd = Microchip (Vectron) OX-208, { "10" } MHz; datablad Rev 12-1-2021

seg-cefcf7025826 = { "1" } s: { "5e-12" }; { "10" } s: { "8e-12" }; { "100" } s: { "1e-11" }; { "1 000" } s: { "5e-11" }

seg-85f8b8fbbae6 = ±{ "0.15" } ppb/dygn efter { "72" } h (f ≤ { "10" } MHz)

seg-0c6d3ae4e409 = ±{ "0.4" } ppb, { "0" } °C till +{ "70" } °C, med +{ "25" } °C som referens

seg-53ac4dcaf8b1 = Microchip 8040C Rubidium Frequency Standard, standardprestanda; DS00003047A (2/20)

seg-ccb8b3a41af4 = { "1" } s: { "3.0e-11" }; { "100" } s: { "3.0e-12" }

seg-ae0f630aba4b = <5e-11/månad efter { "30" } dygn

seg-dbb2a780ceb9 = temperaturkoefficient <{ "3E-10" }, { "0" } °C till { "50" } °C

seg-79d5b7a3a453 = Microchip 5071A, högpresterande rör; DS00002980D (5/25)

seg-62572a695878 = { "1" } s: { "5.0e-12" }; { "10" } s: { "3.5e-12" }; { "100" } s: { "8.5e-13" }; { "1 000" } s: { "2.7e-13" }; 10⁴ s: { "8.5e-14" }; 10⁵ s: { "2.7e-14" }; { "5" } dygn: { "1.0e-14" }; { "30" } dygn: { "1.0e-14" }

seg-1fbdd6edc376 = ingen takt angiven; förändring över livslängden ≤{ "5.0e-14" }

seg-bb485faf403a = ±{ "8.0e-14" } mot omgivningen ({ "0" } °C till { "50" } °C, fuktighet, magnetfält, stöt)

seg-889f4dc6cafc = Microchip SA.45s CSAC, alternativ { "001" } och { "003" }; DS00002985D (5/23)

seg-ecee1cb2a670 = { "1" } s: { "3e-10" }; { "10" } s: { "1e-10" }; { "100" } s: { "3e-11" }; { "1 000" } s: { "1e-11" }

seg-c90e2f590297 = <9e-10/månad efter { "30" } dygn

seg-5b1bd12aea0f = ±{ "5e-10" }, −{ "10" } °C till { "70" } °C

seg-63ba00e95bbc = Länkar till dokumenten: <a1>OX-208</a1>, <a2>8040C</a2>, <a3>5071A</a3>, <a4>SA.45s</a4>.

seg-31ad29d092ee = Utelämnat med avsikt: 8040C:s rad för { "10" } s, som databladet skriver ut som "<{ "1.0" } x { "10" }^{ "11" }" (en feltryckt exponent), och 5071A:s rader under { "1" } s. OX-049 övervägdes för OCXO:n men användes inte, eftersom dess åldringsrad inte kan läsas entydigt ur den förskjutna tabellen.

seg-8d4a915bc7fc = <b>Hur siffrorna blir en modell.</b> Det här är den här motorns val, och vart och ett redovisas i körningens utdata:

seg-f1e6ea28601c = <b>Brusanpassning.</b> Nivåerna för vitt, flicker- och slumpvandringsfrekvensbrus är en icke-negativ minsta kvadrat-anpassning till ADEV-maxvärdena, därefter uppskalad tills modellen ligger på eller över varje punkt. Databladets siffror är maxvärden, så modellen omsluter dem.

seg-0e5ab055094a = <b>Flicker-golv.</b> Golvet ligger aldrig under ADEV vid det längsta listade τ. Ett datablad slutar lista där tillverkaren slutar lova förbättring, så modellen låter inte klockan förbättras bortom det. Det kan bara göra en holdover sämre.

seg-ebefbd6f119b = <b>Åldring.</b> En månadssiffra omvandlas med { "30" } dygn per månad och tillämpas som en linjär frekvensdrift från förlustögonblicket. Cesiumförinställningen har ingen åldring.

seg-bb08c7b5baf5 = <b>Temperatur.</b> Den angivna gränsen läses linjärt över halva driftintervallet (till exempel ger ±{ "5e-10" } över −{ "10" } °C till { "70" } °C { "1.25e-11" } per kelvin), och drivs sedan av en sinusformad temperaturprofil vars amplitud och period är scenarioindata. Inget i ett datablad säger att beroendet är linjärt; det här är en värsta-fall-tolkning.

seg-47a256757cfc = <b>Före förlusten</b> är klockan disciplinerad och dess tidsfel är vitt fasbrus med ett angivet 1-sigma-värde.

seg-3ef60b128bb7 = <b>Vad referensscenariot visar.</b> Med de incheckade indata (rubidium, ±{ "2" } K daglig temperatursvängning, { "24" } h holdover efter { "1" } h låst) når registreringen ett största absolut tidsfel på { "603.2" } ns. Den passerar ePRTC-budgeten på { "100" } ns { "8 206" } s efter förlusten och tilldelningen på { "400" } ns efter { "25 713" } s, och håller sig inom { "1 100" } ns och { "1.5" } µs under hela dygnet. Den klarar inte ePRTC-A:s holdover-kurva { "3 627" } s efter förlusten, vilket är väntat: det kravet förutsätter en referens i cesiumklass. Enbart temperaturtermen kan nå { "660" } ns, så med dessa indata spelar den större roll än åldring ({ "72" } ns vid dygnets slut).

seg-ba87d450423c = <c1/> kontrollerar typens MTIE och TDEV mot <c2/> { "2024.06" } på <c3/>, en CSAC-holdover-serie med { "2" } 048 sampel med åldring, flicker och temperatur. Över { "17" } medelvärdesfaktorer för MTIE och { "12" } för TDEV stämmer MTIE exakt och TDEV på { "1.1e-15" } relativt. Samma kurvor läses tillbaka ur en fullständig körning som läser in CSV-filen. Det validerar estimatorerna på den registreringen. Det validerar inte den syntetiska holdovern, maskerna eller förinställningarna, som är MODELLED-rader i <c4/>.

seg-6fdc3cc32a2f = <s1>Föregående</s1>Slot timing

seg-1108b114de88 = <s1>Nästa</s1>Deceived time
