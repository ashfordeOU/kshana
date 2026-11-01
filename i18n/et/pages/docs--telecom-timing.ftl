# docs--telecom-timing: translations (et)

# text
seg-04ece0eb7bd2 = Maski id

# attr:aria-label, text
seg-a13eab564243 = MTIE

# attr:aria-label, text
seg-f155b7ceef1f = TDEV

# text
seg-42cdb8e987e6 = Bilanss

# text
seg-88372b30ed79 = Piir

# text
seg-50fffd444946 = { "100" } ns

# text
seg-79e6a31245f2 = { "400" } ns

# text
seg-f63dd3d7aad4 = Allikas

# text
seg-587beeccaa11 = Eelseade

# text
seg-edb7b16b6c0e = Valideerimine

# text
seg-3c513ef2fd3b = Suurus

# text
# c1: docs/TELECOM-TIMING.md
seg-62b6e83a9145 = Source: <c1/>

# text
seg-95222c3659cd = Telekommunikatsiooni ajastus: maskid, allikad ja eelseadistused

# text
# c1: telecom-timing
# c2: src/telecom_timing.rs
# c3: scenarios/telecom-prtc-holdover-24h.toml
# c4: scenarios/telecom-synce-eec.toml
# c5: scenarios/telecom-tie-ingest.toml
seg-5a604e063370 = See leht loetleb kõik piirangud, mida stsenaariumi liik <c1/> kontrollib, kust igaüks pärineb ja mis on välja jäetud. Kood on <c2/>. Võrdlusstsenaarium on <c3/>, sageduse sünkroniseerimise oma <c4/> ja sisselugemise näide <c5/>.

# text
seg-f078828b2325 = <b>Lühendid.</b> ITU-T on Rahvusvahelise Telekommunikatsiooniliidu telekommunikatsiooni standardimise sektor (International Telecommunication Union Telecommunication Standardization Sector). GNSS on ülemaailmne satelliitnavigatsioonisüsteem. TE on ajaviga, kella aja ja etalonaja vahe. max|TE| on suurim absoluutne ajaviga. MTIE on maksimaalne ajavahemikuviga: suurim tipp-tipp-ajaviga mis tahes pikkusega τ (tau) vaatlusaknas. TDEV on ajahälve, ajaliste triivide ruutkeskmine mõõt keskmistamisajal τ. cTE on püsiv ajaviga (keskmine nihe). dTE on dünaamiline ajaviga (liikuv osa). TE_L ja dTE_L on ajaviga pärast esimest järku madalpääsfiltrit ribalaiusega { "0.1" } herts (Hz); dTE_H on selle filtri kohal olev osa. TE_HO on ajaviga holdover-is. PRTC on primaarne etalonaja kell (primary reference time clock). ePRTC on täiustatud PRTC. T-BC on telekommunikatsiooni piirikell (telecom boundary clock) ja T-TSC on telekommunikatsiooni orjakell (telecom time slave clock). PTP on täppisajaprotokoll (Precision Time Protocol). PPS on impulss sekundis. OCXO on termostaadiga kvartsostsillaator. CSAC on kiibimõõtmeline aatomkell. CSV on komadega eraldatud väärtused. ADEV on Alani hälve (σ_y), sageduse stabiilsuse standardmõõt. ns on nanosekundid ja µs on mikrosekundid. ppb on miljardikosa (suhteline sagedus { "1e-9" }) ja MHz on megaherts. Amd. on soovituse muudatus ning Y.1367 jms on sama soovituse number ITU-T Y-sarjas.

# text
# c1: allantools
seg-a7746845eb05 = <b>Mis see on.</b> Hinnangufunktsioonid (MTIE ja TDEV) on kontrollitud kolmanda osapoole paketi <c1/> vastu ja on selles osas VALIDATED. Maskitabelid on allpool toodud soovituste ärakirjad. Sünteetiline holdover on avaandmete andmelehtede arvudest ehitatud mudel. Liik tervikuna on MODELLED. See ei ole standardi järgimise test ning PASS ei ole siin sertifikaat.

# text
seg-e4adedc8e36d = Loetud allikad

# text
seg-44f6d9a7906c = Kõik ITU-T tekstid laaditi alla aadressilt itu.int 2026-09-25. Kasutati uusimat väljaannet, mida sai täielikult lugeda.

# text
seg-28d4cebb747f = Soovitus

# text
seg-ef3644f3af9c = Loetud väljaanne

# text
seg-82dcf7b71cdb = Olek aadressil itu.int

# text
seg-149a5b44ddfd = ITU-T G.8272/Y.1367, <em>Timing characteristics of primary reference time clocks</em>

# text
seg-f65ca7286466 = kehtib

# text
seg-5dd73fad1c6b = ITU-T G.8272.1/Y.1367.1, <em>Timing characteristics of enhanced primary reference time clocks</em>

# text
seg-efdb7451b140 = { "2024" } Amd. { "1" } (07/2025), täistekstiväljaanne

# text
seg-fff491f6efc6 = ITU-T G.8273.2/Y.1368.2, <em>Timing characteristics of telecom boundary clocks and telecom time synchronous clocks for use with full timing support from the network</em>

# text
seg-6dacd7a4b068 = { "2023" } Amd. { "2" } (11/2025), täistekst

# text
seg-266cb2ce6e7f = ITU-T G.8271.1/Y.1366.1, <em>Network limits for time synchronization in packet networks with full timing support from the network</em>

# text
seg-55fed85e64bc = { "2022" } Amd. { "3" } (05/2025), täistekst

# text
seg-a2e1e37c4219 = ITU-T G.8271/Y.1366, <em>Time and phase synchronization aspects of telecommunication networks</em>

# text
seg-63c64d128cc6 = 03/2020 ja selle Amd. { "1" } (08/2024)

# text
seg-66209db00349 = Kaks uuemat muudatust on olemas, kuid neid ei saanud lugeda: G.8272 ({ "2025" }) Amd. { "1" } (08/2026) ja G.8272.1 ({ "2024" }) Amd. { "2" } (08/2026). Mõlemad on eelavaldatud ja piiratud ITU liikmetega (Telecommunication Information Exchange Service, TIES, kontod). Kui need muudavad mõnda allpool toodud arvu, siis see leht ja kood seda veel ei kajasta.

# text
seg-25d639be3a1b = <b>Kuidas arvud kontrolliti.</b> Nendest Portable Document Format (PDF) failidest teksti väljavõtmisel kaovad kreeka täht τ ja mikromärk µ, nii et „{ "0.275" } × { "10" }⁻³τ“ tuleb välja kujul „{ "0.275" } × { "10" }⁻³“. Seetõttu loeti G.8272 tabelite { "1" } kuni { "4" }, G.8272.1 tabelite { "1" } kuni { "5" }, G.8271 tabeli { "1" } ja G.8271.1 tabeli 7-1 iga rida uuesti renderdatud lehepildilt. G.8273.2 tabelid 7-1 kuni 7-5 ja G.8271.1 tabelid 7-2 ja 7-3 loeti eraldatud tekstist, milles τ säilis. Kui tabel eeldab murdepunktis pidevust, kontrollib seda ühiktest.

# text
seg-33b5f44c513b = Realiseeritud piirangud

# text
seg-3ce6da7e3e99 = τ on sekundites. Intervall, mis on kirjutatud „{ "0.1" } < τ ≤ { "273" }“, on avatud punktis { "0.1" } s ja suletud punktis { "273" } s, täpselt nagu tabelis, ja kood käsitleb kumbagi otsa samamoodi.

# text
seg-1efb6779348a = ITU-T G.8272 (07/2025): PRTC-A ja PRTC-B, lukustatud režiim

# text
seg-c54e45baa463 = max|TE|

# text
seg-25887373a479 = { "40" } ns

# text
seg-0e18047889c1 = punkt { "6.1" }

# text
seg-4ce06948bf3f = MTIE (punkt { "6.2" }):

# text
seg-f1e336517976 = Mask

# text
seg-7c40080fe799 = Intervall

# text
seg-039493f144b8 = { "0.275" } × { "10" }⁻³ τ + { "0.025" } µs

# text
seg-ca1cf5e6c558 = { "0.1" } < τ ≤ { "273" }

# text
seg-a2ae8d8ad68a = Tabel { "1" }

# text
seg-d1b301281575 = { "0.10" } µs

# text
seg-22afd1138a6a = τ > { "273" }

# text
seg-9691c1cfa143 = { "0.1" } < τ ≤ { "54.5" }

# text
seg-95049bb8aaa1 = Tabel { "2" }

# text
seg-f2562bdf8fd5 = { "0.04" } µs

# text
seg-72ef2a66af58 = τ > { "54.5" }

# text
seg-d18148049b1e = TDEV (punkt { "6.2" }):

# text
seg-f492a7e39046 = { "3" } ns

# text
seg-4f658870d55d = { "0.1" } < τ ≤ { "100" }

# text
seg-7334c58cd44b = Tabel { "3" }

# text
seg-3bf4d8b009d5 = { "0.03" } τ ns

# text
seg-2969d84226e6 = { "100" } < τ ≤ { "1 000" }

# text
seg-02bacda97914 = { "30" } ns

# text
seg-e28777641ebe = { "1 000" } < τ < { "10 000" }

# text
seg-1c0341aaa919 = { "1" } ns

# text
seg-70c7899bf805 = Tabel { "4" }

# text
seg-8ec1f8c65e4f = { "0.01" } τ ns

# text
seg-e3bdc7a40432 = { "100" } < τ ≤ { "500" }

# text
seg-2851f795541f = { "5" } ns

# text
seg-f1d7d80685aa = { "500" } < τ < { "100 000" }

# text
seg-9b8478f86b44 = Punkt { "6.2" } ütleb ka, et TDEV minimaalne mõõteperiood on kaksteist korda integreerimisperiood (T = 12τ). Liik rakendab seda reeglit igale TDEV-ile, mida ta esitab, nii et TDEV antakse ainult τ jaoks kuni ühe kaheteistkümnendikuni salvestusest. G.8272 ei sea PRTC-le holdover-i nõuet.

# text
seg-392ca772c712 = ITU-T G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025): ePRTC

# text
seg-42c76f7b90ac = Lukustatud režiim:

# text
seg-160dced77932 = { "4" } ns

# text
seg-88e8948869fc = { "0.1" } < τ ≤ { "1" }

# text
seg-c89d5cf52ad3 = { "0.11114" } τ + { "3.89" } ns

# text
seg-fad294d3be39 = { "1" } < τ ≤ { "100" }

# text
seg-e18d635df164 = { "0.0375" } × { "10" }⁻³ τ + { "15" } ns

# text
seg-273d60d5cd4a = { "100" } < τ ≤ { "400 000" }

# text
seg-4d971fea7954 = τ > { "400 000" }

# text
seg-4e9052bb688f = { "0.1" } < τ ≤ { "30 000" }

# text
seg-2401257610c6 = { "3.33333" } × { "10" }⁻⁵ τ ns

# text
seg-560ef6f53bf7 = { "30 000" } < τ ≤ { "300 000" }

# text
seg-727399dbf061 = { "10" } ns

# text
seg-3f5b5d8a1ea9 = { "300 000" } < τ < { "1 000 000" }

# text
seg-ca9cb946c8f4 = ePRTC-A holdover, ajaviga (punkt { "8.2.1" }, tabel { "3" }). L on aeg, mille ePRTC oli enne kadu lukustatud, päevades, ja t on aeg holdover-i algusest, sekundites. Piir kasvab lineaarselt väärtusest { "30" } ns väärtuseni { "100" } ns holdover-i perioodi H jooksul.

# text
seg-fa700160348e = Lukustusaeg L

# text
seg-61f9dec111cb = Holdover-i periood H

# text
seg-f6a6df18839c = Piir suurusele |Δx(t)|

# text
seg-9229068d7534 = L < { "6" } päeva

# text
seg-5bd5193f213c = { "0" } < t ≤ { "70 000" } s ({ "0.81" } päeva)

# text
seg-df5ffdf7245b = { "30" } + { "1.000" } × { "10" }⁻³ t ns

# text
seg-1af75c2d666f = { "6" } päeva ≤ L ≤ { "40" } päeva

# text
seg-51754e29cb46 = { "0" } < t ≤ L · { "86 400" } s

# text
seg-dacdb2a00c6a = { "30" } + { "70" } t / (L · { "86 400" }) ns

# text
seg-71a6238f1e29 = L > { "40" } päeva

# text
seg-5a0e39fa8dc3 = { "0" } < t ≤ { "3 456 000" } s ({ "40" } päeva)

# text
seg-b0a167d378cb = { "30" } + { "2.025463" } × { "10" }⁻⁵ t ns

# text
seg-3262966b5eab = ePRTC-A holdover, triiv (punkt { "8.2.2" }):

# text
seg-2c09e57675a7 = { "100" } < τ ≤ { "10 000" }

# text
seg-9afccb4dbf30 = { "0.1" } < τ ≤ { "10 000" }

# text
seg-a4a813c38ef6 = Tabel { "5" }

# text
seg-5d56fb7889b2 = Punkt { "8.3.1" } määrab holdover-i suurima vaikimisi ajavea max|TE_HO| suuruseks { "100" } ns. Liik kasutab seda vaikimisi ületamisaja eelarvena.

# text
seg-3702a44d3ff1 = ITU-T G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025): T-BC ja T-TSC

# text
seg-96b5072f792f = Klass A

# text
seg-7737bc0444b1 = Klass B

# text
seg-cd92242017a8 = Klass C

# text
seg-0689443dfc12 = Klass D

# text
seg-54163aca5d46 = max|TE| (filtreerimata)

# text
seg-b36412e1acfb = { "70" } ns

# text
seg-ed79e6cdac25 = edasiseks uurimiseks

# text
seg-5c2985d408e3 = Tabel 7-1

# text
seg-067c7c90c1e1 = max|TE_L| ({ "0.1" } Hz madalpääs)

# text
seg-1c5ac746d16b = Tabel 7-2

# text
seg-9802166ed2e2 = cTE vahemik

# text
seg-b94484db77ab = ±{ "50" } ns

# text
seg-17d4f5817950 = ±{ "20" } ns

# text
seg-1399281b7ce6 = ±{ "10" } ns

# text
seg-a694039549c8 = Tabel 7-3

# text
seg-d8799ba27fc3 = dTE_L MTIE, konstantne temperatuur

# text
seg-c332ee79beaf = Tabel 7-4, m ≤ τ ≤ { "1 000" }

# text
seg-2bd284168318 = dTE_L TDEV, konstantne temperatuur

# text
seg-8358cf8c4e50 = { "2" } ns

# text
seg-6a1cc65603b3 = Tabel 7-5

# text
seg-de739a499521 = Tabelis 7-5 on klassid A ja B kirjutatud m < τ ≤ { "1 000" } ning klass C on kirjutatud m ≤ τ ≤ { "1 000" }. m on 1/16 s PTP voo puhul { "16" } paketiga sekundis ja { "1" } s väljundi { "1" } PPS puhul. Liik käsitleb sisendit kui { "1" } PPS ajaintervalli viga, seega m = { "1" } s. Tabeli 7-3 märkus { "1" } ütleb, et cTE hinnatakse ajavea keskmistamisega { "1 000" } s jooksul. Liik esitab järjestikuste { "1 000" } s plokkide halvima absoluutse keskmise.

# text
seg-0a4b66fe5535 = ITU-T G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025): võrgupiirangud etalonpunktis C

# text
seg-8c2b01661011 = Kõik kolm on juurutusjuhtum { "1" } ja kehtivad pärast esimest järku { "0.1" } Hz madalpääsfiltrit.

# text
seg-b3f93a59a8eb = Punkt

# text
seg-23e44eab6e8b = max|TE_L|

# text
seg-cb1a66f62f8e = MTIE piir

# text
seg-4aa99615d914 = { "7.3.1" } (klassi { "4" } rakendused)

# text
seg-eacfcd0a9ea5 = { "1 100" } ns

# text
seg-dc2351580120 = { "100" } + { "75" } τ ns

# text
seg-b2c519d30bc8 = { "1.3" } < τ ≤ { "2.4" }

# text
seg-3c9bd014a192 = { "277" } + { "1.1" } τ ns

# text
seg-abad3634a83e = { "2.4" } < τ ≤ { "275" }

# text
seg-884708f2736f = { "580" } ns

# text
seg-22bf4721fe97 = { "275" } < τ ≤ { "10 000" }

# text
seg-17c12885b0d1 = { "7.3.2" } (täiustatud võrk)

# text
seg-fcd7cb03855f = { "600" } ns

# text
seg-9df58e5be8fc = { "37.39" } + { "9.7" } τ ns

# text
seg-8e4e29bb36ac = { "55.27" } + { "2.25" } τ ns

# text
seg-1d92062202d8 = { "2.4" } < τ ≤ { "20.2" }

# text
seg-6ab02b4db41e = { "90.22" } + { "0.52" } τ ns

# text
seg-81785e02523f = { "20.2" } < τ ≤ { "211.11" }

# text
seg-f7fda527feed = { "200" } ns

# text
seg-cab0e877b11b = { "211.11" } < τ ≤ { "10 000" }

# text
seg-1f0b651381ea = { "7.3.3" } (PRTC pöörduskeskkonnas)

# text
seg-5a5405483174 = { "0.0475" } τ + { "25" } ns

# text
seg-3aacef0066a0 = { "1" } < τ < { "400" }

# text
seg-f34cbd5ce7e4 = { "44" } ns

# text
seg-76f436fd7664 = { "400" } < τ ≤ { "10 000" }

# text
seg-b0987b4e2e07 = Tabel 7-3 jätab τ = { "400" } s enda ilma piirita (üks rida lõpeb „< { "400" }“, järgmine algab „{ "400" } <“). Liik ei esita seal piiri, selle asemel et ühe valida. Etalonpunkt A (punkt { "7.1" }) võtab oma piirid standardist G.8272, mistõttu ülaltoodud PRTC maskid katavad selle.

# text
seg-915182a7500e = Sageduse sünkroniseerimine: G.811, G.812, G.8262 ja G.8262.1 triivi tekkimine ({ "0.36" })

# text
# c1: scenarios/telecom-synce-eec.toml
seg-fb1342b76953 = Seitse maski, millest igaüks on konstantse temperatuuri (±{ "1" } K piires) MTIE ja TDEV triivi tekkimise piir, defineeritud punktides nimetatud samaväärse { "10" } Hz esimest järku madalpääsmõõtefiltri kaudu. See filter toimib enne diskreetimist, mistõttu liik võtab salvestuse juba selle kaudu mõõdetuna ega rakenda midagi. PRC mask on autonoomse kella jaoks (G.810 joonis 2a sõltumatu kella konfiguratsioon); teised on lukustatud režiimi piirid kellale, mis on sünkroniseeritud triivivaba etaloniga. Võrdlusstsenaarium on <c1/>: vabalt töötav OCXO kolme EEC maski vastu, mis ülehindab ostsillaatori panust vaatlusintervallidel, mis on pikad iga ahela ajakonstandi suhtes.

# text
seg-3faf039b0ed9 = MTIE (ns)

# text
seg-ca33cbe4fd07 = TDEV (ns)

# text
seg-769e7fed4cd2 = { "0.275" } τ + { "25" } ({ "0.1" } < τ ≤ { "1 000" }); { "0.01" } τ + { "290" } (τ > { "1 000" })

# text
seg-73dcf463ea29 = { "3" } ({ "0.1" } < τ ≤ { "100" }); { "0.03" } τ ({ "100" } < τ ≤ { "1 000" }); { "30" } ({ "1 000" } < τ < { "10 000" })

# text
seg-cb38d6327e5c = G.811 (09/1997) punkt { "6.1" }

# text
seg-1d9621af8091 = { "24" } ({ "0.1" } < τ ≤ { "9" }); { "8" } τ^{ "0.5" } ({ "9" } < τ ≤ { "400" }); { "160" } ({ "400" } < τ ≤ { "10 000" })

# text
seg-bc8e3aa24bfe = { "3" } ({ "0.1" } < τ ≤ { "25" }); { "0.12" } τ ({ "25" } < τ ≤ { "100" }); { "12" } ({ "100" } < τ ≤ { "10 000" })

# text
seg-5e048893f25e = G.812 (06/2004) tabelid { "3" } ja { "6" }

# text
seg-45d290d9640a = { "3.2" } τ^−{ "0.5" } ({ "0.1" } < τ ≤ { "2.5" }); { "2" } ({ "2.5" } < τ ≤ { "40" }); { "0.32" } τ^{ "0.5" } ({ "40" } < τ ≤ { "1 000" }); { "10" } (τ > { "1 000" })

# text
seg-ae92888ca436 = G.812 (06/2004) tabelid { "4" } ja { "7" }

# text
seg-860b31153778 = { "40" } ({ "0.1" } < τ ≤ { "1" }); { "40" } τ^{ "0.1" } ({ "1" } < τ ≤ { "100" }); { "25.25" } τ^{ "0.2" } ({ "100" } < τ ≤ { "1 000" })

# text
seg-854159374e79 = { "3.2" } ({ "0.1" } < τ ≤ { "25" }); { "0.64" } τ^{ "0.5" } ({ "25" } < τ ≤ { "100" }); { "6.4" } ({ "100" } < τ ≤ { "1 000" })

# text
seg-8e825000b58e = G.8262 (10/2024) tabelid { "1" } ja { "3" }

# text
seg-50fd3bf139a4 = { "20" } ({ "0.1" } < τ ≤ { "1" }); { "20" } τ^{ "0.48" } ({ "1" } < τ ≤ { "10" }); { "60" } ({ "10" } < τ ≤ { "1 000" })

# text
seg-9ef5ff04e1d4 = nagu G.812 tabel { "7" }, suletud punktis { "10 000" } s

# text
seg-3ecb8d9128d0 = G.8262 (10/2024) tabelid { "4" } ja { "5" }

# text
seg-ef3156b68064 = { "10" } τ^{ "0.155" } ({ "0.1" } ≤ τ ≤ { "1" }); { "10" } τ^{ "0.1" } ({ "1" } < τ ≤ { "100" }); { "6.3" } τ^{ "0.2" } ({ "100" } < τ ≤ { "1 000" })

# text
seg-28f7a98f132e = { "0.64" } ({ "0.1" } ≤ τ ≤ { "25" }); { "0.128" } τ^{ "0.5" } ({ "25" } < τ ≤ { "100" }); { "1.28" } ({ "100" } < τ ≤ { "1 000" })

# text
seg-47d0f50aa906 = G.8262.1 (11/2025) tabelid { "1" } ja { "3" }

# text
seg-45e4ed8fa6ea = Iga rida kontrolliti aadressilt itu.int 2026-10-13 alla laaditud teksti vastu: G.8262 (10/2024), G.8262.1 (11/2025), G.812 (06/2004) ja G.811 (09/1997). G.812 (06/2004) on märgitud asendatuks eelavaldatud 08/2026 väljaandega ja G.811-l on Amd. { "1" } (04/2016); ühtegi neist ei saanud alla laadida, nii et kui need muudavad mõnda ülaltoodud arvu, siis see leht ja kood seda ei kajasta. Kui trükitud koefitsiendid teevad murdepunkti katkevaks (näiteks { "40" } · { "10" }^{ "0.4" } = { "100.48" } ns versus G.812 tabeli { "4" } { "100" } ns platoo), jäetakse tabelid sellisena, nagu need on trükitud, ja ühiktestid piiravad astet. Realiseerimata: muutuva temperatuuri lubatud hälbed (G.812 tabel { "5" }, G.8262 tabel { "2" }, G.8262.1 tabel { "2" }), holdover-i ja siirdeprotsesside nõuded, värin ning G.811 sageduse täpsus punktist { "5" }.

# text
seg-4f6666854cf7 = Eelarved (ületamiseni kuluv aeg)

# text
seg-1f3322a94bbb = ePRTC vaikimisi max|TE_HO|

# text
seg-26fd4be0d5ca = G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) punkt { "8.3.1" }

# text
seg-0d5433d85c88 = Võrgu holdover-i jaotus, lühike GNSS-i katkestus

# text
seg-b74c5284d584 = G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) tabel V.1, rikkestsenaarium (b), „re-arrangements and holdover in the network“. Näidisjaotus, mitte nõue.

# text
seg-afe6c9903ada = Võrgupiir etalonpunktis C

# text
seg-0c261b05c3cf = G.8271.1 punkt { "7.3.1" }. See on filtreeritud suurus; eelarvena võrreldakse seda filtreerimata kujul.

# text
seg-4b5a9718d008 = Lõpprakendus, täpsusklass { "4" }

# text
seg-2a38e45e7008 = { "1.5" } µs

# text
seg-41c6dd43e313 = G.8271 (03/2020) Amd. { "1" } (08/2024) tabel { "1" }, klass { "4" }

# text
seg-ded846b5a4bc = <b>Klassikaline „{ "1.5" } µs otsast lõpuni“ arv.</b> See on standardi G.8271 tabeli { "1" } klassi { "4" } ajavea nõue, esitatud ühise etaloni suhtes lõpprakenduses. G.8271.1 tabel V.1 näitab, kuidas võrk saab seda tavatöös jaotada: { "100" } ns PRTC-le/telekommunikatsiooni grandmaster-kellale, { "200" } ns ahela dünaamilisele ajaveale, püsiv ajaviga kelladele ja linkidele, kokku { "1 100" } ns etalonpunktis C, seejärel { "250" } ns ümberkorraldusteks ja lühikeseks holdover-iks lõpprakenduses ning { "150" } ns lõpprakenduse enda müra jaoks, { "1 500" } ns etalonpunktis E. Sama tabeli rikkestsenaarium (c), „long holdover periods, e.g., { "1" } day“, annab { "3 350" } ns punktis C ja { "3 500" } ns punktis E (selle märkus { "5" } ütleb, et { "1 500" } ns ületamine võib teenust halvendada). Seega ei esita kumbki soovitus nõuet „{ "1.5" } µs { "24" } tunni holdover-i jooksul“ ja liik seda ei realiseeri.

# text
seg-76cab595673a = Kinnitamata või realiseerimata

# text
seg-175c282ddce2 = Midagi allolevast ei ole realiseeritud maskina. Midagi sellest ei ole hinnanguga täidetud.

# text
seg-3c74e4ba9579 = <b>Soovitustes märgitud „for further study“ (edasiseks uurimiseks):</b> G.8273.2 klassi D max|TE|, cTE, dTE_L MTIE ja TDEV, dTE_H ning holdover; ePRTC-B holdover (G.8272.1 punkt { "8.2.1" }); ePRTC-A holdover-i MTIE ja TDEV väljaspool { "10 000" } s (tabeli { "4" } märkus { "1" }, tabeli { "5" } märkus { "2" }); ePRTC faasikatkestus (punkt { "7" }); T-BC/T-TSC faasi-/ajaholdover, kui nii PTP kui ka füüsikalise kihi sisendid on kadunud (G.8273.2 punkt { "7.4.2.1" }); TDEV võrgupiir etalonpunktis C (G.8271.1 punktid { "7.3.1" } kuni { "7.3.3" }); juurutusjuhtumi { "2" } võrgupiirid punktis C.

# text
seg-93c60d44788e = <b>Ärakirjastatud, kuid selles versioonis realiseerimata:</b> G.8273.2 tabel 7-6 (MTIE muutuva temperatuuriga: { "40" } / { "40" } / { "10" } ns kuni { "10 000" } s), tabel 7-7 (dTE_H tipp tipuni: { "70" } / { "70" } / { "30" } ns, mis vajab { "0.1" } Hz kõrgpääsfiltrit), tabel 7-10 (holdover-i MTIE füüsikalise kihi sageduse abiga), suhteline ajaviga (tabelid 7-8 ja 7-9) ning G.8271.1 punktide { "7.3.2" } ({ "50" } ns) ja { "7.3.3" } ({ "70" } ns) dTE_H piirid.

# text
seg-f5fcd3b0f8a5 = <b>Rakendamata:</b> vähemalt { "100" } näidisega libisev keskmistav filter, mille G.8272 ja G.8272.1 sätestavad PTP liideste jaoks. Sisendit käsitletakse kui { "1" } PPS ajaintervalli viga, mida need soovitused mõõdavad ilma filtrita.

# text
seg-74fe057a4392 = <b>Loetamatu:</b> kaks piiratud { "2026" } muudatust, mis on nimetatud jaotises „Loetud allikad“.

# text
seg-bd4ec59cc872 = <b>Toimetuslik veidrus:</b> G.8272.1 Amd. { "1" } tabeli { "3" } päises on muudatuse märgistuses lisatud rida „TDEV limit [ns] { "1" } / { "0.1" } < τ ≤ { "10 000" }“, ajavea veergude kohal. Seda ei käsitleta ajavea ümbrise osana. Sama { "1" } ns TDEV on tabelis { "5" } ja on seal realiseeritud.

# text
seg-511db1219de1 = Mõõtefilter

# text
seg-5fc683308b31 = G.8273.2 ja G.8271.1 defineerivad oma filtreeritud piirid esimest järku madalpääsfiltri kaudu ribalaiusega { "0.1" } Hz. Liik rakendab diskreetset silurit y_k = y_{ "{" }k−{ "1" }{ "}" } + α (x_k − y_{ "{" }k−{ "1" }{ "}" }), α = { "1" } − exp(−2π · { "0.1" } · Δt), mis algab esimesest näidisest. See on katseseadmete lähendus, mitte ühegi instrumendi koopia. Seda rakendatakse ainult siis, kui näidiste intervall Δt on { "1" } s või lühem. Jämedamat salvestust esitatakse filtreeritud maski vastu kui NOT-EVALUATED, selle asemel et seda halvasti filtreerida.

# text
seg-218e5ad620af = Ostsillaatorite eelseadistused (MODELLED)

# text
seg-28bb7b8ad89f = Iga arv on andmelehe enda arv, loetud 2026-09-25.

# text
seg-b4207b682560 = Seade ja dokument

# text
seg-13f9ba96c063 = Kasutatud ADEV maksimumid (τ: σ_y)

# text
seg-d719167df981 = Vananemine

# text
seg-f30740907f6a = Temperatuur

# text
seg-c789847129bd = Microchip (Vectron) OX-208, { "10" } MHz; andmeleht Rev 12-1-2021

# text
seg-cefcf7025826 = { "1" } s: { "5e-12" }; { "10" } s: { "8e-12" }; { "100" } s: { "1e-11" }; { "1 000" } s: { "5e-11" }

# text
seg-85f8b8fbbae6 = ±{ "0.15" } ppb/päev pärast { "72" } h (f ≤ { "10" } MHz)

# text
seg-0c6d3ae4e409 = ±{ "0.4" } ppb, { "0" } °C kuni +{ "70" } °C, vastavusse viidud +{ "25" } °C-ga

# text
seg-53ac4dcaf8b1 = Microchip 8040C Rubidium Frequency Standard, standardne jõudlus; DS00003047A (2/20)

# text
seg-ccb8b3a41af4 = { "1" } s: { "3.0e-11" }; { "100" } s: { "3.0e-12" }

# text
seg-ae0f630aba4b = <5e-11/kuus pärast { "30" } päeva

# text
seg-dbb2a780ceb9 = temperatuurikoefitsient <{ "3E-10" }, { "0" } °C kuni { "50" } °C

# text
seg-79d5b7a3a453 = Microchip 5071A, suure jõudlusega toru; DS00002980D (5/25)

# text
seg-62572a695878 = { "1" } s: { "5.0e-12" }; { "10" } s: { "3.5e-12" }; { "100" } s: { "8.5e-13" }; { "1 000" } s: { "2.7e-13" }; 10⁴ s: { "8.5e-14" }; 10⁵ s: { "2.7e-14" }; { "5" } päeva: { "1.0e-14" }; { "30" } päeva: { "1.0e-14" }

# text
seg-1fbdd6edc376 = kiirust pole avaldatud; eluaegne muutus ≤{ "5.0e-14" }

# text
seg-bb485faf403a = ±{ "8.0e-14" } keskkonna suhtes ({ "0" } °C kuni { "50" } °C, niiskus, magnetväli, löök)

# text
seg-889f4dc6cafc = Microchip SA.45s CSAC, valikud { "001" } ja { "003" }; DS00002985D (5/23)

# text
seg-ecee1cb2a670 = { "1" } s: { "3e-10" }; { "10" } s: { "1e-10" }; { "100" } s: { "3e-11" }; { "1 000" } s: { "1e-11" }

# text
seg-c90e2f590297 = <9e-10/kuus pärast { "30" } päeva

# text
seg-5b1bd12aea0f = ±{ "5e-10" }, −{ "10" } °C kuni { "70" } °C

# text
seg-63ba00e95bbc = Dokumentide lingid: <a1>OX-208</a1>, <a2>8040C</a2>, <a3>5071A</a3>, <a4>SA.45s</a4>.

# text
seg-31ad29d092ee = Tahtlikult välja jäetud: 8040C { "10" } s rida, mille andmeleht trükib kujul „<{ "1.0" } x { "10" }^{ "11" }“ (valesti trükitud astendaja), ja 5071A read alla { "1" } s. OX-049 kaaluti OCXO jaoks ja jäeti kasutamata, sest selle vananemisrida ei ole nihkunud tabelist üheselt loetav.

# text
seg-8d4a915bc7fc = <b>Kuidas arvudest saab mudel.</b> Need on selle mootori valikud ja igaüks neist esitatakse käivituse väljundis:

# text
seg-f1e6ea28601c = <b>Müra sobitus.</b> Valge, flicker- ja juhusliku käidu sagedusmüra tasemed on ADEV maksimumidele sobitatud mittenegatiivse vähimruutude meetodiga ning seejärel skaleeritud üles, kuni mudel on igas punktis vähemalt sama suur. Andmelehe arvud on maksimumid, nii et mudel ümbritseb need.

# text
seg-0e5ab055094a = <b>Flicker-põhi.</b> Põhi ei ole kunagi väiksem kui ADEV pikima loetletud τ juures. Andmeleht lõpetab loetlemise seal, kus selle tootja lõpetab paranemise lubamise, seega ei lase mudel kellal sellest kaugemale paraneda. See saab holdover-it ainult halvendada.

# text
seg-ebefbd6f119b = <b>Vananemine.</b> Kuine arv teisendatakse { "30" } päevaga kuus ja rakendatakse lineaarse sageduse triivina kaotuse hetkest. Tseesiumi eelseadistusel vananemist ei ole.

# text
seg-bb08c7b5baf5 = <b>Temperatuur.</b> Esitatud piiri loetakse lineaarselt üle poole töövahemiku (näiteks ±{ "5e-10" } vahemikus −{ "10" } °C kuni { "70" } °C annab { "1.25e-11" } kelvini kohta), seejärel juhitakse siinuselise temperatuuriprofiiliga, mille amplituud ja periood on stsenaariumi sisendid. Andmelehel ei ütle miski, et sõltuvus on lineaarne; see on halvima juhu lugemine.

# text
seg-47a256757cfc = <b>Enne kaotust</b> on kell distsiplineeritud ja selle ajaviga on valge faasimüra esitatud 1-sigma väärtusega.

# text
seg-3ef60b128bb7 = <b>Mida võrdlusstsenaarium näitab.</b> Kinnitatud sisendite juures (rubiidium, ±{ "2" } K ööpäevane temperatuurikõikumine, { "24" } h holdover pärast { "1" } h lukustatud olekut) jõuab salvestus suurima absoluutse ajaveani { "603.2" } ns. See ületab { "100" } ns ePRTC eelarve { "8 206" } s pärast kaotust ja { "400" } ns jaotuse { "25 713" } s pärast ning jääb kogu päeva piiridesse { "1 100" } ns ja { "1.5" } µs. See ei täida ePRTC-A holdover-i ümbrist { "3 627" } s pärast kaotust, mis on oodatav: see nõue eeldab tseesiumiklassi etaloni. Ainuüksi temperatuuriliige võib ulatuda { "660" } ns-ni, seega on sellel nende sisendite juures suurem tähtsus kui vananemisel ({ "72" } ns päeva lõpus).

# text
# c1: tests/telecom_timing_reference.rs
# c2: allantools
# c3: tests/fixtures/telecom_timing/holdover_te_series.csv
# c4: docs/VERIFICATION-MATRIX.md
seg-ba87d450423c = <c1/> kontrollib liigi MTIE-d ja TDEV-d paketi <c2/> { "2024.06" } vastu failil <c3/>, { "2" } 048 näidisega CSAC holdover-i rida koos vananemise, flickeri ja temperatuuriga. { "17" } MTIE ja { "12" } TDEV keskmistamisteguri korral MTIE ühtib täpselt ja TDEV ühtib suhtelise täpsusega { "1.1e-15" }. Samad kõverad loetakse tagasi täielikust käivitusest, mis loeb CSV sisse. See valideerib hinnangufunktsioonid sellel salvestusel. See ei valideeri sünteetilist holdover-it, maske ega eelseadistusi, mis on MODELLED read failis <c4/>.

# text
seg-6fdc3cc32a2f = <s1>Eelmine</s1>Ajaluugi ajastus

# text
seg-1108b114de88 = <s1>Järgmine</s1>Petetud aeg
