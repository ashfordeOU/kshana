# docs--telecom-timing: translations (fi)

seg-04ece0eb7bd2 = Maskin tunniste

seg-a13eab564243 = MTIE

seg-f155b7ceef1f = TDEV

seg-42cdb8e987e6 = Budjetti

seg-88372b30ed79 = Raja

seg-50fffd444946 = { "100" } ns

seg-79e6a31245f2 = { "400" } ns

seg-f63dd3d7aad4 = Lähde

seg-587beeccaa11 = Esiasetus

seg-edb7b16b6c0e = Validointi

seg-3c513ef2fd3b = Suure

seg-62b6e83a9145 = Lähde: <c1/>

seg-95222c3659cd = Telekommunikaation ajoitus: maskit, lähteet ja esiasetukset

seg-5a604e063370 = Tämä sivu luettelee jokaisen rajan, jonka skenaariotyyppi <c1/> tarkistaa, mistä kukin tulee ja mitä on jätetty pois. Koodi on <c2/>. Viiteskenaario on <c3/>, taajuussynkronoinnin skenaario on <c4/> ja syöttöesimerkki on <c5/>.

seg-f078828b2325 = <b>Lyhenteet.</b> ITU-T on Kansainvälisen televiestintäliiton telekommunikaation standardointisektori. GNSS on maailmanlaajuinen satelliittinavigointijärjestelmä. TE on aikavirhe, kellon ajan ja vertausajan erotus. max|TE| on suurin absoluuttinen aikavirhe. MTIE on suurin aikavälivirhe (maximum time interval error): suurin huipusta huippuun -aikavirhe missä tahansa pituuden τ (tau) havaintoikkunassa. TDEV on aikapoikkeama (time deviation), aikavaeltelun neliöllinen keskiarvomitta keskiarvoistusajalla τ. cTE on vakioaikavirhe (keskimääräinen siirtymä). dTE on dynaaminen aikavirhe (liikkuva osa). TE_L ja dTE_L ovat aikavirhe ensimmäisen kertaluvun alipäästösuodattimen jälkeen, jonka kaistanleveys on { "0.1" } hertsiä (Hz); dTE_H on tämän suodattimen yläpuolinen osa. TE_HO on aikavirhe holdoverissa. PRTC on ensisijainen vertausaikakello (primary reference time clock). ePRTC on parannettu PRTC. T-BC on telekommunikaation rajakello ja T-TSC on telekommunikaation aika-orjakello. PTP on Precision Time Protocol. PPS on pulssi sekunnissa. OCXO on uunistabiloitu kideoskillaattori. CSAC on sirukokoinen atomikello. CSV on pilkuilla erotetut arvot. ADEV on Allanin poikkeama (σ_y), taajuusvakauden vakiomitta. ns on nanosekuntia ja µs mikrosekuntia. ppb on miljardisosa (suhteellinen taajuus { "1e-9" }) ja MHz on megahertsi. Amd. on suosituksen muutos (amendment), ja Y.1367 ja vastaavat ovat saman suosituksen numero ITU-T:n Y-sarjassa.

seg-a7746845eb05 = <b>Mitä tämä on.</b> Estimaattorit (MTIE ja TDEV) on tarkistettu kolmannen osapuolen pakettia <c1/> vastaan ja ne ovat siltä osin VALIDATED. Maskitaulukot ovat jäljennöksiä alla luetelluista suosituksista. Synteettinen holdover on malli, joka on rakennettu julkisista datalehtiluvuista. Tyyppi on kokonaisuutena MODELLED. Se ei ole vaatimustenmukaisuustesti, eikä PASS tässä ole sertifikaatti.

seg-e4adedc8e36d = Luetut lähteet

seg-44f6d9a7906c = Kaikki ITU-T-tekstit ladattiin osoitteesta itu.int 2026-09-25. Käytettiin uusinta painosta, joka voitiin lukea kokonaan.

seg-28d4cebb747f = Suositus

seg-ef3644f3af9c = Luettu painos

seg-82dcf7b71cdb = Tila osoitteessa itu.int

seg-149a5b44ddfd = ITU-T G.8272/Y.1367, <em>Timing characteristics of primary reference time clocks</em>

seg-f65ca7286466 = voimassa

seg-5dd73fad1c6b = ITU-T G.8272.1/Y.1367.1, <em>Timing characteristics of enhanced primary reference time clocks</em>

seg-efdb7451b140 = { "2024" } Amd. { "1" } (07/2025), kokotekstijulkaisu

seg-fff491f6efc6 = ITU-T G.8273.2/Y.1368.2, <em>Timing characteristics of telecom boundary clocks and telecom time synchronous clocks for use with full timing support from the network</em>

seg-6dacd7a4b068 = { "2023" } Amd. { "2" } (11/2025), kokoteksti

seg-266cb2ce6e7f = ITU-T G.8271.1/Y.1366.1, <em>Network limits for time synchronization in packet networks with full timing support from the network</em>

seg-55fed85e64bc = { "2022" } Amd. { "3" } (05/2025), kokoteksti

seg-a2e1e37c4219 = ITU-T G.8271/Y.1366, <em>Time and phase synchronization aspects of telecommunication networks</em>

seg-63c64d128cc6 = 03/2020 ja sen Amd. { "1" } (08/2024)

seg-66209db00349 = Kaksi uudempaa muutosta on olemassa, mutta niitä ei voitu lukea: G.8272 ({ "2025" }) Amd. { "1" } (08/2026) ja G.8272.1 ({ "2024" }) Amd. { "2" } (08/2026). Molemmat on esijulkaistu ja rajattu ITU:n jäsenille (Telecommunication Information Exchange Service, TIES, -tilit). Jos ne muuttavat jotakin alla olevaa lukua, tämä sivu ja koodi eivät vielä heijasta sitä.

seg-25d639be3a1b = <b>Miten luvut tarkistettiin.</b> Tekstin poiminta näistä Portable Document Format (PDF) -tiedostoista pudottaa pois kreikkalaisen kirjaimen τ ja mikron merkin µ, joten ”{ "0.275" } × { "10" }⁻³τ” tulee muotoon ”{ "0.275" } × { "10" }⁻³”. Siksi jokainen G.8272:n taulukkojen { "1" }-{ "4" } rivi, G.8272.1:n taulukkojen { "1" }-{ "5" } rivi, G.8271:n taulukon { "1" } rivi ja G.8271.1:n taulukon 7-1 rivi luettiin uudelleen renderöidystä sivukuvasta. G.8273.2:n taulukot 7-1-7-5 ja G.8271.1:n taulukot 7-2 ja 7-3 luettiin poimitusta tekstistä, jossa τ säilyi. Kun taulukko edellyttää jatkuvuutta taitepisteessä, yksikkötesti tarkistaa sen.

seg-33b5f44c513b = Toteutetut rajat

seg-3ce6da7e3e99 = τ on sekunteina. Väli, joka on kirjoitettu ”{ "0.1" } < τ ≤ { "273" }”, on avoin kohdassa { "0.1" } s ja suljettu kohdassa { "273" } s täsmälleen kuten taulukossa, ja koodi säilyttää kummankin pään samalla tavalla.

seg-1efb6779348a = ITU-T G.8272 (07/2025): PRTC-A ja PRTC-B, lukittu tila

seg-c54e45baa463 = max|TE|

seg-25887373a479 = { "40" } ns

seg-0e18047889c1 = kohta { "6.1" }

seg-4ce06948bf3f = MTIE (kohta { "6.2" }):

seg-f1e336517976 = Maski

seg-7c40080fe799 = Väli

seg-039493f144b8 = { "0.275" } × { "10" }⁻³ τ + { "0.025" } µs

seg-ca1cf5e6c558 = { "0.1" } < τ ≤ { "273" }

seg-a2ae8d8ad68a = Taulukko { "1" }

seg-d1b301281575 = { "0.10" } µs

seg-22afd1138a6a = τ > { "273" }

seg-9691c1cfa143 = { "0.1" } < τ ≤ { "54.5" }

seg-95049bb8aaa1 = Taulukko { "2" }

seg-f2562bdf8fd5 = { "0.04" } µs

seg-72ef2a66af58 = τ > { "54.5" }

seg-d18148049b1e = TDEV (kohta { "6.2" }):

seg-f492a7e39046 = { "3" } ns

seg-4f658870d55d = { "0.1" } < τ ≤ { "100" }

seg-7334c58cd44b = Taulukko { "3" }

seg-3bf4d8b009d5 = { "0.03" } τ ns

seg-2969d84226e6 = { "100" } < τ ≤ { "1 000" }

seg-02bacda97914 = { "30" } ns

seg-e28777641ebe = { "1 000" } < τ < { "10 000" }

seg-1c0341aaa919 = { "1" } ns

seg-70c7899bf805 = Taulukko { "4" }

seg-8ec1f8c65e4f = { "0.01" } τ ns

seg-e3bdc7a40432 = { "100" } < τ ≤ { "500" }

seg-2851f795541f = { "5" } ns

seg-f1d7d80685aa = { "500" } < τ < { "100 000" }

seg-9b8478f86b44 = Kohta { "6.2" } toteaa myös, että TDEV:n lyhin mittausjakso on kaksitoistakertainen integrointijaksoon nähden (T = 12τ). Tyyppi soveltaa tätä sääntöä jokaiseen raportoimaansa TDEV:iin, joten TDEV annetaan vain, kun τ on enintään kahdestoistaosa tallenteesta. G.8272 ei aseta holdover-vaatimusta PRTC:lle.

seg-392ca772c712 = ITU-T G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025): ePRTC

seg-42c76f7b90ac = Lukittu tila:

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

seg-ca9cb946c8f4 = ePRTC-A holdover, aikavirhe (kohta { "8.2.1" }, taulukko { "3" }). L on aika päivinä, jonka ePRTC oli lukittuna ennen menetystä, ja t on aika holdoverin alusta sekunteina. Raja nousee lineaarisesti arvosta { "30" } ns arvoon { "100" } ns holdover-jakson H aikana.

seg-fa700160348e = Lukitusaika L

seg-61f9dec111cb = Holdover-jakso H

seg-f6a6df18839c = Raja arvolle |Δx(t)|

seg-9229068d7534 = L < { "6" } päivää

seg-5bd5193f213c = { "0" } < t ≤ { "70 000" } s ({ "0.81" } päivää)

seg-df5ffdf7245b = { "30" } + { "1.000" } × { "10" }⁻³ t ns

seg-1af75c2d666f = { "6" } päivää ≤ L ≤ { "40" } päivää

seg-51754e29cb46 = { "0" } < t ≤ L · { "86 400" } s

seg-dacdb2a00c6a = { "30" } + { "70" } t / (L · { "86 400" }) ns

seg-71a6238f1e29 = L > { "40" } päivää

seg-5a0e39fa8dc3 = { "0" } < t ≤ { "3 456 000" } s ({ "40" } päivää)

seg-b0a167d378cb = { "30" } + { "2.025463" } × { "10" }⁻⁵ t ns

seg-3262966b5eab = ePRTC-A holdover, vaellus (kohta { "8.2.2" }):

seg-2c09e57675a7 = { "100" } < τ ≤ { "10 000" }

seg-9afccb4dbf30 = { "0.1" } < τ ≤ { "10 000" }

seg-a4a813c38ef6 = Taulukko { "5" }

seg-5d56fb7889b2 = Kohta { "8.3.1" } asettaa holdoverin oletusarvoiseksi enimmäisaikavirheeksi, max|TE_HO|, arvon { "100" } ns. Tyyppi käyttää sitä oletuksena ylitysaikabudjettina.

seg-3702a44d3ff1 = ITU-T G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025): T-BC ja T-TSC

seg-96b5072f792f = Luokka A

seg-7737bc0444b1 = Luokka B

seg-cd92242017a8 = Luokka C

seg-0689443dfc12 = Luokka D

seg-54163aca5d46 = max|TE| (suodattamaton)

seg-b36412e1acfb = { "70" } ns

seg-ed79e6cdac25 = jatkotutkimuksen kohteena

seg-5c2985d408e3 = Taulukko 7-1

seg-067c7c90c1e1 = max|TE_L| ({ "0.1" } Hz alipäästö)

seg-1c5ac746d16b = Taulukko 7-2

seg-9802166ed2e2 = cTE-vaihteluväli

seg-b94484db77ab = ±{ "50" } ns

seg-17d4f5817950 = ±{ "20" } ns

seg-1399281b7ce6 = ±{ "10" } ns

seg-a694039549c8 = Taulukko 7-3

seg-d8799ba27fc3 = dTE_L MTIE, vakiolämpötila

seg-c332ee79beaf = Taulukko 7-4, m ≤ τ ≤ { "1 000" }

seg-2bd284168318 = dTE_L TDEV, vakiolämpötila

seg-8358cf8c4e50 = { "2" } ns

seg-6a1cc65603b3 = Taulukko 7-5

seg-de739a499521 = Taulukossa 7-5 luokat A ja B on kirjoitettu m < τ ≤ { "1 000" } ja luokka C on kirjoitettu m ≤ τ ≤ { "1 000" }. m on 1/16 s PTP-virralle, jossa on { "16" } pakettia sekunnissa, ja { "1" } s { "1" } PPS -lähdölle. Tyyppi käsittelee syötettä { "1" } PPS -aikaväli-virheenä, joten m = { "1" } s. Taulukon 7-3 huomautus { "1" } sanoo, että cTE estimoidaan keskiarvoistamalla aikavirhe { "1 000" } s:n ajalta. Tyyppi raportoi peräkkäisten { "1 000" } s:n lohkojen pahimman absoluuttisen keskiarvon.

seg-0a4b66fe5535 = ITU-T G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025): verkon rajat vertauspisteessä C

seg-8c2b01661011 = Kaikki kolme ovat käyttöönottotapaus { "1" } ja soveltuvat ensimmäisen kertaluvun { "0.1" } Hz:n alipäästösuodatuksen jälkeen.

seg-b3f93a59a8eb = Kohta

seg-23e44eab6e8b = max|TE_L|

seg-cb1a66f62f8e = MTIE-raja

seg-4aa99615d914 = { "7.3.1" } (luokan { "4" } sovellukset)

seg-eacfcd0a9ea5 = { "1 100" } ns

seg-dc2351580120 = { "100" } + { "75" } τ ns

seg-b2c519d30bc8 = { "1.3" } < τ ≤ { "2.4" }

seg-3c9bd014a192 = { "277" } + { "1.1" } τ ns

seg-abad3634a83e = { "2.4" } < τ ≤ { "275" }

seg-884708f2736f = { "580" } ns

seg-22bf4721fe97 = { "275" } < τ ≤ { "10 000" }

seg-17c12885b0d1 = { "7.3.2" } (parannettu verkko)

seg-fcd7cb03855f = { "600" } ns

seg-9df58e5be8fc = { "37.39" } + { "9.7" } τ ns

seg-8e4e29bb36ac = { "55.27" } + { "2.25" } τ ns

seg-1d92062202d8 = { "2.4" } < τ ≤ { "20.2" }

seg-6ab02b4db41e = { "90.22" } + { "0.52" } τ ns

seg-81785e02523f = { "20.2" } < τ ≤ { "211.11" }

seg-f7fda527feed = { "200" } ns

seg-cab0e877b11b = { "211.11" } < τ ≤ { "10 000" }

seg-1f0b651381ea = { "7.3.3" } (PRTC liityntäverkossa)

seg-5a5405483174 = { "0.0475" } τ + { "25" } ns

seg-3aacef0066a0 = { "1" } < τ < { "400" }

seg-f34cbd5ce7e4 = { "44" } ns

seg-76f436fd7664 = { "400" } < τ ≤ { "10 000" }

seg-b0987b4e2e07 = Taulukko 7-3 jättää arvon τ = { "400" } s itsessään ilman rajaa (yksi rivi päättyy ”< { "400" }”, seuraava alkaa ”{ "400" } <”). Tyyppi ei raportoi rajaa siinä kohdassa sen sijaan, että valitsisi sellaisen. Vertauspiste A (kohta { "7.1" }) ottaa rajansa G.8272:sta, joten yllä olevat PRTC-maskit kattavat sen.

seg-915182a7500e = Taajuussynkronointi: G.811, G.812, G.8262 ja G.8262.1 vaelluksen tuottaminen ({ "0.36" })

seg-fb1342b76953 = Seitsemän maskia, kukin vakiolämpötilan (±{ "1" } K:n sisällä) MTIE- ja TDEV-vaelluksen tuottamisraja, määritelty kohtien ilmoittaman vastaavan { "10" } Hz:n ensimmäisen kertaluvun alipäästömittaussuodattimen kautta. Tuo suodatin vaikuttaa ennen näytteistystä, joten tyyppi ottaa tallenteen jo sen läpi mitattuna eikä sovella mitään. PRC-maski on autonomiselle kellolle (G.810 kuva 2a, riippumaton kelloasetelma); muut ovat lukitun tilan rajoja kellolle, joka on synkronoitu vaelluksettomaan vertaukseen. Viiteskenaario on <c1/>: vapaasti käyvä OCXO kolmea EEC-maskia vastaan, mikä liioittelee oskillaattorin osuutta havaintoväleillä, jotka ovat pitkiä minkä tahansa silmukan aikavakioon nähden.

seg-3faf039b0ed9 = MTIE (ns)

seg-ca33cbe4fd07 = TDEV (ns)

seg-769e7fed4cd2 = { "0.275" } τ + { "25" } ({ "0.1" } < τ ≤ { "1 000" }); { "0.01" } τ + { "290" } (τ > { "1 000" })

seg-73dcf463ea29 = { "3" } ({ "0.1" } < τ ≤ { "100" }); { "0.03" } τ ({ "100" } < τ ≤ { "1 000" }); { "30" } ({ "1 000" } < τ < { "10 000" })

seg-cb38d6327e5c = G.811 (09/1997) kohta { "6.1" }

seg-1d9621af8091 = { "24" } ({ "0.1" } < τ ≤ { "9" }); { "8" } τ^{ "0.5" } ({ "9" } < τ ≤ { "400" }); { "160" } ({ "400" } < τ ≤ { "10 000" })

seg-bc8e3aa24bfe = { "3" } ({ "0.1" } < τ ≤ { "25" }); { "0.12" } τ ({ "25" } < τ ≤ { "100" }); { "12" } ({ "100" } < τ ≤ { "10 000" })

seg-5e048893f25e = G.812 (06/2004) taulukot { "3" } ja { "6" }

seg-45d290d9640a = { "3.2" } τ^−{ "0.5" } ({ "0.1" } < τ ≤ { "2.5" }); { "2" } ({ "2.5" } < τ ≤ { "40" }); { "0.32" } τ^{ "0.5" } ({ "40" } < τ ≤ { "1 000" }); { "10" } (τ > { "1 000" })

seg-ae92888ca436 = G.812 (06/2004) taulukot { "4" } ja { "7" }

seg-860b31153778 = { "40" } ({ "0.1" } < τ ≤ { "1" }); { "40" } τ^{ "0.1" } ({ "1" } < τ ≤ { "100" }); { "25.25" } τ^{ "0.2" } ({ "100" } < τ ≤ { "1 000" })

seg-854159374e79 = { "3.2" } ({ "0.1" } < τ ≤ { "25" }); { "0.64" } τ^{ "0.5" } ({ "25" } < τ ≤ { "100" }); { "6.4" } ({ "100" } < τ ≤ { "1 000" })

seg-8e825000b58e = G.8262 (10/2024) taulukot { "1" } ja { "3" }

seg-50fd3bf139a4 = { "20" } ({ "0.1" } < τ ≤ { "1" }); { "20" } τ^{ "0.48" } ({ "1" } < τ ≤ { "10" }); { "60" } ({ "10" } < τ ≤ { "1 000" })

seg-9ef5ff04e1d4 = kuten G.812 taulukko { "7" }, suljettu kohdassa { "10 000" } s

seg-3ecb8d9128d0 = G.8262 (10/2024) taulukot { "4" } ja { "5" }

seg-ef3156b68064 = { "10" } τ^{ "0.155" } ({ "0.1" } ≤ τ ≤ { "1" }); { "10" } τ^{ "0.1" } ({ "1" } < τ ≤ { "100" }); { "6.3" } τ^{ "0.2" } ({ "100" } < τ ≤ { "1 000" })

seg-28f7a98f132e = { "0.64" } ({ "0.1" } ≤ τ ≤ { "25" }); { "0.128" } τ^{ "0.5" } ({ "25" } < τ ≤ { "100" }); { "1.28" } ({ "100" } < τ ≤ { "1 000" })

seg-47d0f50aa906 = G.8262.1 (11/2025) taulukot { "1" } ja { "3" }

seg-45e4ed8fa6ea = Jokainen rivi tarkistettiin osoitteesta itu.int ladattua tekstiä vastaan 2026-10-13: G.8262 (10/2024), G.8262.1 (11/2025), G.812 (06/2004) ja G.811 (09/1997). G.812 (06/2004) on merkitty korvatuksi esijulkaistulla painoksella 08/2026, ja G.811:llä on Amd. { "1" } (04/2016); kumpaakaan ei voitu ladata, joten jos ne muuttavat jotakin yllä olevaa lukua, tämä sivu ja koodi eivät heijasta sitä. Kun painetut kertoimet tekevät taitepisteestä epäjatkuvan (esimerkiksi { "40" } · { "10" }^{ "0.4" } = { "100.48" } ns verrattuna G.812:n taulukon { "4" } { "100" } ns:n tasanteeseen), taulukot pidetään sellaisina kuin ne on painettu ja yksikkötestit rajaavat askeleen. Ei toteutettu: vaihtelevan lämpötilan sallitut arvot (G.812 taulukko { "5" }, G.8262 taulukko { "2" }, G.8262.1 taulukko { "2" }), holdover- ja transienttivaatimukset, värinä sekä G.811:n taajuustarkkuus kohdasta { "5" }.

seg-4f6666854cf7 = Budjetit (ylitysaika)

seg-1f3322a94bbb = ePRTC:n oletus max|TE_HO|

seg-26fd4be0d5ca = G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) kohta { "8.3.1" }

seg-0d5433d85c88 = Verkon holdover-varaus, lyhyt GNSS-katko

seg-b74c5284d584 = G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) taulukko V.1, vikaskenaario (b), ”uudelleenjärjestelyt ja holdover verkossa”. Esimerkkivaraus, ei vaatimus.

seg-afe6c9903ada = Verkon raja vertauspisteessä C

seg-0c261b05c3cf = G.8271.1 kohta { "7.3.1" }. Tämä on suodatettu suure; budjettina sitä verrataan suodattamattomana.

seg-4b5a9718d008 = Loppusovellus, tarkkuusluokka { "4" }

seg-2a38e45e7008 = { "1.5" } µs

seg-41c6dd43e313 = G.8271 (03/2020) Amd. { "1" } (08/2024) taulukko { "1" }, luokka { "4" }

seg-ded846b5a4bc = <b>Klassinen ”{ "1.5" } µs päästä päähän” -luku.</b> Se on G.8271:n taulukon { "1" } luokan { "4" } aikavirhevaatimus, ilmoitettuna yhteistä vertausta vastaan loppusovelluksessa. G.8271.1:n taulukko V.1 näyttää, miten verkko voi varata sen normaalikäytössä: { "100" } ns PRTC:lle/telekommunikaation grandmasterille, { "200" } ns ketjun dynaamiselle aikavirheelle, vakioaikavirhe kelloille ja linkeille, yhteensä { "1 100" } ns vertauspisteessä C, sitten { "250" } ns uudelleenjärjestelyille ja lyhyelle holdoverille loppusovelluksessa ja { "150" } ns loppusovelluksen omalle kohinalle, { "1 500" } ns vertauspisteessä E. Saman taulukon vikaskenaario (c), ”pitkät holdover-jaksot, esim. { "1" } vuorokausi”, antaa { "3 350" } ns pisteessä C ja { "3 500" } ns pisteessä E (sen huomautus { "5" } sanoo, että { "1 500" } ns:n ylittäminen voi heikentää palvelua). Kumpikaan suositus ei siis aseta vaatimusta ”{ "1.5" } µs { "24" } tunnin holdoverin yli”, eikä tyyppi toteuta sellaista.

seg-76cab595673a = Ei vahvistettu tai ei toteutettu

seg-175c282ddce2 = Mitään alla olevaa ei ole toteutettu maskina. Mitään siitä ei ole täytetty arvauksella.

seg-3c74e4ba9579 = <b>Suosituksissa merkitty ”jatkotutkimuksen kohteeksi”:</b> G.8273.2:n luokan D max|TE|, cTE, dTE_L MTIE ja TDEV, dTE_H ja holdover; ePRTC-B:n holdover (G.8272.1 kohta { "8.2.1" }); ePRTC-A:n holdover-MTIE ja -TDEV yli { "10 000" } s (taulukon { "4" } huomautus { "1" }, taulukon { "5" } huomautus { "2" }); ePRTC:n vaiheen epäjatkuvuus (kohta { "7" }); T-BC/T-TSC:n vaihe-/aikaholdover, kun sekä PTP- että fyysisen kerroksen syötteet on menetetty (G.8273.2 kohta { "7.4.2.1" }); TDEV-verkkoraja vertauspisteessä C (G.8271.1 kohdat { "7.3.1" }-{ "7.3.3" }); käyttöönottotapauksen { "2" } verkkorajat pisteessä C.

seg-93c60d44788e = <b>Jäljennetty mutta ei toteutettu tässä versiossa:</b> G.8273.2 taulukko 7-6 (MTIE vaihtelevalla lämpötilalla: { "40" } / { "40" } / { "10" } ns enintään { "10 000" } s), taulukko 7-7 (dTE_H huipusta huippuun: { "70" } / { "70" } / { "30" } ns, mikä vaatii { "0.1" } Hz:n ylipäästösuodattimen), taulukko 7-10 (holdover-MTIE fyysisen kerroksen taajuusavustuksella), suhteellinen aikavirhe (taulukot 7-8 ja 7-9) sekä G.8271.1:n kohtien { "7.3.2" } ({ "50" } ns) ja { "7.3.3" } ({ "70" } ns) dTE_H-rajat.

seg-f5fcd3b0f8a5 = <b>Ei sovellettu:</b> vähintään { "100" } näytteen liukuvan keskiarvon suodatin, jonka G.8272 ja G.8272.1 asettavat PTP-liitynnöille. Syötettä käsitellään { "1" } PPS -aikaväli-virheenä, jonka nuo suositukset mittaavat ilman suodatinta.

seg-74fe057a4392 = <b>Lukukelvoton:</b> kaksi rajattua { "2026" } muutosta, jotka mainitaan otsikon ”Luetut lähteet” alla.

seg-bd4ec59cc872 = <b>Toimituksellinen outous:</b> G.8272.1 Amd. { "1" }:ssä taulukon { "3" } alussa on muutosmerkinnöin lisätty rivi ”TDEV limit [ns] { "1" } / { "0.1" } < τ ≤ { "10 000" }” aikavirhesarakkeiden yläpuolella. Sitä ei käsitellä osana aikavirheen verhokäyrää. Sama { "1" } ns:n TDEV on taulukossa { "5" } ja se on toteutettu siellä.

seg-511db1219de1 = Mittaussuodatin

seg-5fc683308b31 = G.8273.2 ja G.8271.1 määrittelevät suodatetut rajansa ensimmäisen kertaluvun alipäästösuodattimen kautta, jonka kaistanleveys on { "0.1" } Hz. Tyyppi käyttää diskreettiä tasoitinta y_k = y_{ "{" }k−{ "1" }{ "}" } + α (x_k − y_{ "{" }k−{ "1" }{ "}" }), α = { "1" } − exp(−2π · { "0.1" } · Δt), joka aloitetaan ensimmäisestä näytteestä. Se on testilaitteiston approksimaatio, ei minkään yksittäisen mittarin kopio. Sitä sovelletaan vain, kun näyteväli Δt on enintään { "1" } s. Karkeampi tallenne raportoidaan suodatettua maskia vastaan tilassa NOT-EVALUATED sen sijaan, että se suodatettaisiin huonosti.

seg-218e5ad620af = Oskillaattorien esiasetukset (MODELLED)

seg-28bb7b8ad89f = Jokainen luku on datalehden oma, luettu 2026-09-25.

seg-b4207b682560 = Laite ja dokumentti

seg-13f9ba96c063 = Käytetyt ADEV-maksimit (τ: σ_y)

seg-d719167df981 = Ikääntyminen

seg-f30740907f6a = Lämpötila

seg-c789847129bd = Microchip (Vectron) OX-208, { "10" } MHz; datalehti Rev 12-1-2021

seg-cefcf7025826 = { "1" } s: { "5e-12" }; { "10" } s: { "8e-12" }; { "100" } s: { "1e-11" }; { "1 000" } s: { "5e-11" }

seg-85f8b8fbbae6 = ±{ "0.15" } ppb/vrk { "72" } h:n jälkeen (f ≤ { "10" } MHz)

seg-0c6d3ae4e409 = ±{ "0.4" } ppb, { "0" } °C - +{ "70" } °C, vertausarvona +{ "25" } °C

seg-53ac4dcaf8b1 = Microchip 8040C Rubidium Frequency Standard, vakiosuorituskyky; DS00003047A (2/20)

seg-ccb8b3a41af4 = { "1" } s: { "3.0e-11" }; { "100" } s: { "3.0e-12" }

seg-ae0f630aba4b = <5e-11/kk { "30" } vrk:n jälkeen

seg-dbb2a780ceb9 = lämpötilakerroin <{ "3E-10" }, { "0" } °C - { "50" } °C

seg-79d5b7a3a453 = Microchip 5071A, suorituskykyinen putki; DS00002980D (5/25)

seg-62572a695878 = { "1" } s: { "5.0e-12" }; { "10" } s: { "3.5e-12" }; { "100" } s: { "8.5e-13" }; { "1 000" } s: { "2.7e-13" }; 10⁴ s: { "8.5e-14" }; 10⁵ s: { "2.7e-14" }; { "5" } vrk: { "1.0e-14" }; { "30" } vrk: { "1.0e-14" }

seg-1fbdd6edc376 = nopeutta ei julkaistu; elinikäinen muutos ≤{ "5.0e-14" }

seg-bb485faf403a = ±{ "8.0e-14" } ympäristön suhteen ({ "0" } °C - { "50" } °C, kosteus, magneettikenttä, isku)

seg-889f4dc6cafc = Microchip SA.45s CSAC, vaihtoehdot { "001" } ja { "003" }; DS00002985D (5/23)

seg-ecee1cb2a670 = { "1" } s: { "3e-10" }; { "10" } s: { "1e-10" }; { "100" } s: { "3e-11" }; { "1 000" } s: { "1e-11" }

seg-c90e2f590297 = <9e-10/kk { "30" } vrk:n jälkeen

seg-5b1bd12aea0f = ±{ "5e-10" }, −{ "10" } °C - { "70" } °C

seg-63ba00e95bbc = Dokumenttilinkit: <a1>OX-208</a1>, <a2>8040C</a2>, <a3>5071A</a3>, <a4>SA.45s</a4>.

seg-31ad29d092ee = Tarkoituksella pois jätetty: 8040C:n { "10" } s:n rivi, jonka datalehti painaa muodossa ”<{ "1.0" } x { "10" }^{ "11" }” (väärin painettu eksponentti), ja 5071A:n rivit alle { "1" } s:n. OX-049:ää harkittiin OCXO:ksi, mutta sitä ei käytetty, koska sen ikääntymisriviä ei voi lukea yksiselitteisesti sen vinoutuneesta taulukosta.

seg-8d4a915bc7fc = <b>Miten luvuista tulee malli.</b> Nämä ovat tämän moottorin valintoja, ja jokainen raportoidaan ajon tulosteessa:

seg-f1e6ea28601c = <b>Kohinasovitus.</b> Valkoisen, flicker- ja satunnaiskulku-taajuuskohinan tasot ovat ei-negatiivinen pienimmän neliösumman sovitus ADEV-maksimeihin, minkä jälkeen niitä skaalataan ylöspäin, kunnes malli on vähintään jokaisen pisteen tasolla. Datalehden luvut ovat maksimeja, joten malli kattaa ne verhokäyränä.

seg-0e5ab055094a = <b>Flicker-lattia.</b> Lattia ei ole koskaan pienempi kuin ADEV pisimmällä luetellulla arvolla τ. Datalehti lopettaa luettelon siihen, mihin sen valmistaja lopettaa parannuksen lupaamisen, joten malli ei anna kellon parantua sen yli. Tämä voi vain huonontaa holdoveria.

seg-ebefbd6f119b = <b>Ikääntyminen.</b> Kuukausiluku muunnetaan { "30" } päivällä kuukautta kohti ja sitä sovelletaan lineaarisena taajuuden ajautumana menetyksen hetkestä alkaen. Cesium-esiasetuksessa ei ole ikääntymistä.

seg-bb08c7b5baf5 = <b>Lämpötila.</b> Ilmoitettu raja luetaan lineaarisesti puolen käyttöalueen yli (esimerkiksi ±{ "5e-10" } välillä −{ "10" } °C - { "70" } °C antaa { "1.25e-11" } kelviniä kohti), minkä jälkeen sitä ajetaan sinimuotoisella lämpötilaprofiililla, jonka amplitudi ja jakso ovat skenaarion syötteitä. Mikään datalehdessä ei sano, että riippuvuus on lineaarinen; tämä on pahimman tapauksen lukema.

seg-47a256757cfc = <b>Ennen menetystä</b> kello on ohjattu ja sen aikavirhe on valkoista vaihekohinaa ilmoitetulla 1-sigma-arvolla.

seg-3ef60b128bb7 = <b>Mitä viiteskenaario osoittaa.</b> Tallennetuilla syötteillä (rubidium, ±{ "2" } K:n vuorokautinen lämpötilavaihtelu, { "24" } h holdover { "1" } h:n lukituksen jälkeen) tallenteen suurin absoluuttinen aikavirhe on { "603.2" } ns. Se ylittää { "100" } ns:n ePRTC-budjetin { "8 206" } s menetyksen jälkeen ja { "400" } ns:n varauksen { "25 713" } s:n jälkeen, ja pysyy { "1 100" } ns:n ja { "1.5" } µs:n sisällä koko vuorokauden. Se rikkoo ePRTC-A:n holdover-verhokäyrän { "3 627" } s menetyksen jälkeen, mikä on odotettua: tuo vaatimus olettaa cesiumluokan vertauksen. Pelkkä lämpötilatermi voi nousta arvoon { "660" } ns, joten näillä syötteillä sillä on enemmän merkitystä kuin ikääntymisellä ({ "72" } ns vuorokauden lopussa).

seg-ba87d450423c = <c1/> tarkistaa tyypin MTIE:n ja TDEV:n paketin <c2/> { "2024.06" } vastaan tiedostolla <c3/>, { "2" } 048 näytteen CSAC-holdover-sarjalla, jossa on ikääntymistä, flicker-kohinaa ja lämpötilaa. { "17" } MTIE- ja { "12" } TDEV-keskiarvoistuskertoimella MTIE täsmää tarkasti ja TDEV täsmää suhteelliseen tarkkuuteen { "1.1e-15" }. Samat käyrät luetaan takaisin täydestä ajosta, joka ottaa CSV:n sisään. Tämä validoi estimaattorit sillä tallenteella. Se ei validoi synteettistä holdoveria, maskeja eikä esiasetuksia, jotka ovat MODELLED-rivejä tiedostossa <c4/>.

seg-6fdc3cc32a2f = <s1>Edellinen</s1>Aikavälin ajoitus

seg-1108b114de88 = <s1>Seuraava</s1>Harhautettu aika
