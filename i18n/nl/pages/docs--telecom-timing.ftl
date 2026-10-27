# docs--telecom-timing: translations (nl)

seg-04ece0eb7bd2 = Masker-id

seg-a13eab564243 = MTIE

seg-f155b7ceef1f = TDEV

seg-42cdb8e987e6 = Budget

seg-88372b30ed79 = Limiet

seg-50fffd444946 = { "100" } ns

seg-79e6a31245f2 = { "400" } ns

seg-f63dd3d7aad4 = Bron

seg-587beeccaa11 = Voorinstelling

seg-edb7b16b6c0e = Validatie

seg-3c513ef2fd3b = Grootheid

seg-62b6e83a9145 = Bron: <c1/>

seg-95222c3659cd = Telecomtijdsynchronisatie: maskers, bronnen en voorinstellingen

seg-5a604e063370 = Deze pagina vermeldt elke limiet die de scenariosoort <c1/> controleert, waar elke vandaan komt en wat is weggelaten. De code is <c2/>. Het referentiescenario is <c3/>, dat voor frequentiesynchronisatie is <c4/> en het voorbeeld voor inlezen is <c5/>.

seg-f078828b2325 = <b>Afkortingen.</b> ITU-T is de International Telecommunication Union Telecommunication Standardization Sector. GNSS is Global Navigation Satellite System. TE is tijdfout, het verschil tussen de tijd van een klok en de referentietijd. max|TE| is de grootste absolute tijdfout. MTIE is maximum time interval error: de grootste piek-tot-piekwaarde van de tijdfout binnen een willekeurig waarnemingsvenster met lengte τ (tau). TDEV is time deviation, een kwadratisch gemiddelde maat voor tijdwandeling bij middelingstijd τ. cTE is constante tijdfout (de gemiddelde afwijking). dTE is dynamische tijdfout (het deel dat beweegt). TE_L en dTE_L zijn de tijdfout na een eersteorde laagdoorlaatfilter met een bandbreedte van { "0.1" } hertz (Hz); dTE_H is het deel boven dat filter. TE_HO is tijdfout in holdover. PRTC is primary reference time clock. ePRTC is enhanced PRTC. T-BC is telecom boundary clock en T-TSC is telecom time slave clock. PTP is het Precision Time Protocol. PPS is puls per seconde. OCXO is oven-controlled crystal oscillator. CSAC is chip-scale atomic clock. CSV is comma-separated values. ADEV is Allan-deviatie (σ_y), de standaardmaat voor frequentiestabiliteit. ns is nanoseconden en µs is microseconden. ppb is parts per billion (een fractionele frequentie van { "1e-9" }), en MHz is megahertz. Amd. is een amendement op een Aanbeveling, en Y.1367 en dergelijke zijn het nummer van dezelfde Aanbeveling in de ITU-T Y-reeks.

seg-a7746845eb05 = <b>Wat dit is.</b> De schatters (MTIE en TDEV) zijn gecontroleerd tegen het pakket <c1/> van een derde partij en zijn daarvoor VALIDATED. De masktabellen zijn transcripties van de onderstaande Aanbevelingen. Een synthetische holdover is een model dat is opgebouwd uit cijfers van openbare datasheets. De soort is over het geheel MODELLED. Het is geen conformiteitstest, en een PASS hier is geen certificaat.

seg-e4adedc8e36d = Gelezen bronnen

seg-44f6d9a7906c = Alle ITU-T-teksten zijn op 2026-09-25 gedownload van itu.int. Er is de nieuwste editie gebruikt die volledig kon worden gelezen.

seg-28d4cebb747f = Aanbeveling

seg-ef3644f3af9c = Gelezen editie

seg-82dcf7b71cdb = Status op itu.int

seg-149a5b44ddfd = ITU-T G.8272/Y.1367, <em>Timing characteristics of primary reference time clocks</em>

seg-f65ca7286466 = van kracht

seg-5dd73fad1c6b = ITU-T G.8272.1/Y.1367.1, <em>Timing characteristics of enhanced primary reference time clocks</em>

seg-efdb7451b140 = { "2024" } Amd. { "1" } (07/2025), een publicatie met volledige tekst

seg-fff491f6efc6 = ITU-T G.8273.2/Y.1368.2, <em>Timing characteristics of telecom boundary clocks and telecom time synchronous clocks for use with full timing support from the network</em>

seg-6dacd7a4b068 = { "2023" } Amd. { "2" } (11/2025), volledige tekst

seg-266cb2ce6e7f = ITU-T G.8271.1/Y.1366.1, <em>Network limits for time synchronization in packet networks with full timing support from the network</em>

seg-55fed85e64bc = { "2022" } Amd. { "3" } (05/2025), volledige tekst

seg-a2e1e37c4219 = ITU-T G.8271/Y.1366, <em>Time and phase synchronization aspects of telecommunication networks</em>

seg-63c64d128cc6 = 03/2020 en haar Amd. { "1" } (08/2024)

seg-66209db00349 = Er bestaan twee nieuwere amendementen die niet konden worden gelezen: G.8272 ({ "2025" }) Amd. { "1" } (08/2026) en G.8272.1 ({ "2024" }) Amd. { "2" } (08/2026). Beide zijn vooraf gepubliceerd en beperkt tot leden van de ITU (accounts van de Telecommunication Information Exchange Service, TIES). Als ze een van de onderstaande cijfers wijzigen, weerspiegelen deze pagina en de code dat nog niet.

seg-25d639be3a1b = <b>Hoe de getallen zijn gecontroleerd.</b> Bij tekstextractie uit deze Portable Document Format-bestanden (PDF) verdwijnen de Griekse letter τ en het microteken µ, zodat "{ "0.275" } × { "10" }⁻³τ" als "{ "0.275" } × { "10" }⁻³" uitkomt. Daarom is elke rij van G.8272 Tabellen { "1" } tot en met { "4" }, G.8272.1 Tabellen { "1" } tot en met { "5" }, G.8271 Tabel { "1" } en G.8271.1 Tabel 7-1 opnieuw gelezen van het weergegeven paginabeeld. G.8273.2 Tabellen 7-1 tot en met 7-5 en G.8271.1 Tabellen 7-2 en 7-3 zijn gelezen uit geëxtraheerde tekst waarin τ bewaard bleef. Waar een tabel continuïteit bij een knikpunt impliceert, controleert een unittest dat.

seg-33b5f44c513b = Geïmplementeerde limieten

seg-3ce6da7e3e99 = τ is in seconden. Een interval geschreven als "{ "0.1" } < τ ≤ { "273" }" is open bij { "0.1" } s en gesloten bij { "273" } s, precies zoals in de tabel, en de code houdt elk uiteinde op dezelfde manier aan.

seg-1efb6779348a = ITU-T G.8272 (07/2025): PRTC-A en PRTC-B, vergrendelde modus

seg-c54e45baa463 = max|TE|

seg-25887373a479 = { "40" } ns

seg-0e18047889c1 = clausule { "6.1" }

seg-4ce06948bf3f = MTIE (clausule { "6.2" }):

seg-f1e336517976 = Masker

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

seg-d18148049b1e = TDEV (clausule { "6.2" }):

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

seg-9b8478f86b44 = Clausule { "6.2" } stelt ook dat de minimale meetperiode voor TDEV twaalf keer de integratieperiode is (T = 12τ). De soort past die regel toe op elke TDEV die hij rapporteert, dus TDEV wordt alleen gegeven voor τ tot een twaalfde van de opname. G.8272 stelt geen holdover-eis voor een PRTC.

seg-392ca772c712 = ITU-T G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025): ePRTC

seg-42c76f7b90ac = Vergrendelde modus:

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

seg-ca9cb946c8f4 = ePRTC-A-holdover, tijdfout (clausule { "8.2.1" }, Tabel { "3" }). L is de tijd in dagen dat de ePRTC vergrendeld was vóór het verlies, en t is de tijd in seconden sinds het begin van de holdover. De limiet stijgt lineair van { "30" } ns tot { "100" } ns over de holdoverperiode H.

seg-fa700160348e = Vergrendelde duur L

seg-61f9dec111cb = Holdoverperiode H

seg-f6a6df18839c = Limiet op |Δx(t)|

seg-9229068d7534 = L < { "6" } dagen

seg-5bd5193f213c = { "0" } < t ≤ { "70 000" } s ({ "0.81" } dagen)

seg-df5ffdf7245b = { "30" } + { "1.000" } × { "10" }⁻³ t ns

seg-1af75c2d666f = { "6" } dagen ≤ L ≤ { "40" } dagen

seg-51754e29cb46 = { "0" } < t ≤ L · { "86 400" } s

seg-dacdb2a00c6a = { "30" } + { "70" } t / (L · { "86 400" }) ns

seg-71a6238f1e29 = L > { "40" } dagen

seg-5a0e39fa8dc3 = { "0" } < t ≤ { "3 456 000" } s ({ "40" } dagen)

seg-b0a167d378cb = { "30" } + { "2.025463" } × { "10" }⁻⁵ t ns

seg-3262966b5eab = ePRTC-A-holdover, wandeling (clausule { "8.2.2" }):

seg-2c09e57675a7 = { "100" } < τ ≤ { "10 000" }

seg-9afccb4dbf30 = { "0.1" } < τ ≤ { "10 000" }

seg-a4a813c38ef6 = Tabel { "5" }

seg-5d56fb7889b2 = Clausule { "8.3.1" } stelt de standaard maximale tijdfout in holdover, max|TE_HO|, op { "100" } ns. De soort gebruikt die als standaardbudget voor de tijd tot overschrijding.

seg-3702a44d3ff1 = ITU-T G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025): T-BC en T-TSC

seg-96b5072f792f = Klasse A

seg-7737bc0444b1 = Klasse B

seg-cd92242017a8 = Klasse C

seg-0689443dfc12 = Klasse D

seg-54163aca5d46 = max|TE| (ongefilterd)

seg-b36412e1acfb = { "70" } ns

seg-ed79e6cdac25 = voor nadere studie

seg-5c2985d408e3 = Tabel 7-1

seg-067c7c90c1e1 = max|TE_L| ({ "0.1" } Hz laagdoorlaat)

seg-1c5ac746d16b = Tabel 7-2

seg-9802166ed2e2 = bereik van cTE

seg-b94484db77ab = ±{ "50" } ns

seg-17d4f5817950 = ±{ "20" } ns

seg-1399281b7ce6 = ±{ "10" } ns

seg-a694039549c8 = Tabel 7-3

seg-d8799ba27fc3 = dTE_L MTIE, constante temperatuur

seg-c332ee79beaf = Tabel 7-4, m ≤ τ ≤ { "1 000" }

seg-2bd284168318 = dTE_L TDEV, constante temperatuur

seg-8358cf8c4e50 = { "2" } ns

seg-6a1cc65603b3 = Tabel 7-5

seg-de739a499521 = In Tabel 7-5 zijn de klassen A en B geschreven als m < τ ≤ { "1 000" } en klasse C als m ≤ τ ≤ { "1 000" }. m is 1/16 s voor een PTP-stroom van { "16" } pakketten per seconde en { "1" } s voor een uitvoer van { "1" } PPS. De soort behandelt de invoer als een tijdintervalfout van { "1" } PPS, dus m = { "1" } s. Tabel 7-3 Noot { "1" } zegt dat cTE wordt geschat door de tijdfout te middelen over { "1 000" } s. De soort rapporteert het slechtste absolute gemiddelde van opeenvolgende blokken van { "1 000" } s.

seg-0a4b66fe5535 = ITU-T G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025): netwerklimieten bij referentiepunt C

seg-8c2b01661011 = Alle drie zijn implementatiegeval { "1" } en gelden na een eersteorde laagdoorlaatfilter van { "0.1" } Hz.

seg-b3f93a59a8eb = Clausule

seg-23e44eab6e8b = max|TE_L|

seg-cb1a66f62f8e = MTIE-limiet

seg-4aa99615d914 = { "7.3.1" } (toepassingen van klasse { "4" })

seg-eacfcd0a9ea5 = { "1 100" } ns

seg-dc2351580120 = { "100" } + { "75" } τ ns

seg-b2c519d30bc8 = { "1.3" } < τ ≤ { "2.4" }

seg-3c9bd014a192 = { "277" } + { "1.1" } τ ns

seg-abad3634a83e = { "2.4" } < τ ≤ { "275" }

seg-884708f2736f = { "580" } ns

seg-22bf4721fe97 = { "275" } < τ ≤ { "10 000" }

seg-17c12885b0d1 = { "7.3.2" } (verbeterd netwerk)

seg-fcd7cb03855f = { "600" } ns

seg-9df58e5be8fc = { "37.39" } + { "9.7" } τ ns

seg-8e4e29bb36ac = { "55.27" } + { "2.25" } τ ns

seg-1d92062202d8 = { "2.4" } < τ ≤ { "20.2" }

seg-6ab02b4db41e = { "90.22" } + { "0.52" } τ ns

seg-81785e02523f = { "20.2" } < τ ≤ { "211.11" }

seg-f7fda527feed = { "200" } ns

seg-cab0e877b11b = { "211.11" } < τ ≤ { "10 000" }

seg-1f0b651381ea = { "7.3.3" } (PRTC in het toegangsnetwerk)

seg-5a5405483174 = { "0.0475" } τ + { "25" } ns

seg-3aacef0066a0 = { "1" } < τ < { "400" }

seg-f34cbd5ce7e4 = { "44" } ns

seg-76f436fd7664 = { "400" } < τ ≤ { "10 000" }

seg-b0987b4e2e07 = Tabel 7-3 laat τ = { "400" } s zelf zonder limiet (één rij eindigt op "< { "400" }", de volgende begint met "{ "400" } <"). De soort rapporteert daar geen limiet in plaats van er een te kiezen. Referentiepunt A (clausule { "7.1" }) ontleent zijn limieten aan G.8272, dus de PRTC-maskers hierboven dekken het.

seg-915182a7500e = Frequentiesynchronisatie: wandelingsgeneratie volgens G.811, G.812, G.8262 en G.8262.1 ({ "0.36" })

seg-fb1342b76953 = Zeven maskers, elk de limiet voor wandelingsgeneratie van MTIE en TDEV bij constante temperatuur (binnen ±{ "1" } K), gedefinieerd via het equivalente eersteorde laagdoorlaat-meetfilter van { "10" } Hz dat de clausules vermelden. Dat filter werkt vóór het bemonsteren, dus de soort neemt de opname als reeds daardoor gemeten en past niets toe. Het PRC-masker is voor een autonome klok (G.810 Figure 2a, configuratie met onafhankelijke klok); de andere zijn limieten voor de vergrendelde modus van een klok die is gesynchroniseerd op een referentie zonder wandeling. Het referentiescenario is <c1/>: een vrij lopende OCXO tegenover de drie EEC-maskers, wat de bijdrage van de oscillator overschat bij observatie-intervallen die lang zijn ten opzichte van de tijdconstante van enige lus.

seg-3faf039b0ed9 = MTIE (ns)

seg-ca33cbe4fd07 = TDEV (ns)

seg-769e7fed4cd2 = { "0.275" } τ + { "25" } ({ "0.1" } < τ ≤ { "1 000" }); { "0.01" } τ + { "290" } (τ > { "1 000" })

seg-73dcf463ea29 = { "3" } ({ "0.1" } < τ ≤ { "100" }); { "0.03" } τ ({ "100" } < τ ≤ { "1 000" }); { "30" } ({ "1 000" } < τ < { "10 000" })

seg-cb38d6327e5c = G.811 (09/1997) clausule { "6.1" }

seg-1d9621af8091 = { "24" } ({ "0.1" } < τ ≤ { "9" }); { "8" } τ^{ "0.5" } ({ "9" } < τ ≤ { "400" }); { "160" } ({ "400" } < τ ≤ { "10 000" })

seg-bc8e3aa24bfe = { "3" } ({ "0.1" } < τ ≤ { "25" }); { "0.12" } τ ({ "25" } < τ ≤ { "100" }); { "12" } ({ "100" } < τ ≤ { "10 000" })

seg-5e048893f25e = G.812 (06/2004) Tabellen { "3" } en { "6" }

seg-45d290d9640a = { "3.2" } τ^−{ "0.5" } ({ "0.1" } < τ ≤ { "2.5" }); { "2" } ({ "2.5" } < τ ≤ { "40" }); { "0.32" } τ^{ "0.5" } ({ "40" } < τ ≤ { "1 000" }); { "10" } (τ > { "1 000" })

seg-ae92888ca436 = G.812 (06/2004) Tabellen { "4" } en { "7" }

seg-860b31153778 = { "40" } ({ "0.1" } < τ ≤ { "1" }); { "40" } τ^{ "0.1" } ({ "1" } < τ ≤ { "100" }); { "25.25" } τ^{ "0.2" } ({ "100" } < τ ≤ { "1 000" })

seg-854159374e79 = { "3.2" } ({ "0.1" } < τ ≤ { "25" }); { "0.64" } τ^{ "0.5" } ({ "25" } < τ ≤ { "100" }); { "6.4" } ({ "100" } < τ ≤ { "1 000" })

seg-8e825000b58e = G.8262 (10/2024) Tabellen { "1" } en { "3" }

seg-50fd3bf139a4 = { "20" } ({ "0.1" } < τ ≤ { "1" }); { "20" } τ^{ "0.48" } ({ "1" } < τ ≤ { "10" }); { "60" } ({ "10" } < τ ≤ { "1 000" })

seg-9ef5ff04e1d4 = als G.812 Tabel { "7" }, gesloten bij { "10 000" } s

seg-3ecb8d9128d0 = G.8262 (10/2024) Tabellen { "4" } en { "5" }

seg-ef3156b68064 = { "10" } τ^{ "0.155" } ({ "0.1" } ≤ τ ≤ { "1" }); { "10" } τ^{ "0.1" } ({ "1" } < τ ≤ { "100" }); { "6.3" } τ^{ "0.2" } ({ "100" } < τ ≤ { "1 000" })

seg-28f7a98f132e = { "0.64" } ({ "0.1" } ≤ τ ≤ { "25" }); { "0.128" } τ^{ "0.5" } ({ "25" } < τ ≤ { "100" }); { "1.28" } ({ "100" } < τ ≤ { "1 000" })

seg-47d0f50aa906 = G.8262.1 (11/2025) Tabellen { "1" } en { "3" }

seg-45e4ed8fa6ea = Elke rij is gecontroleerd tegen de tekst die op 2026-10-13 van itu.int is gedownload: G.8262 (10/2024), G.8262.1 (11/2025), G.812 (06/2004) en G.811 (09/1997). G.812 (06/2004) staat vermeld als vervangen door een vooraf gepubliceerde editie van 08/2026, en G.811 heeft een Amd. { "1" } (04/2016); geen van beide kon worden gedownload, dus als ze een van de bovenstaande cijfers wijzigen, weerspiegelen deze pagina en de code dat niet. Waar gedrukte coëfficiënten een knikpunt discontinu maken (bijvoorbeeld { "40" } · { "10" }^{ "0.4" } = { "100.48" } ns tegenover het plateau van { "100" } ns van G.812 Tabel { "4" }), blijven de tabellen zoals gedrukt en begrenzen de unittests de stap. Niet geïmplementeerd: de toegestane waarden bij variabele temperatuur (G.812 Tabel { "5" }, G.8262 Tabel { "2" }, G.8262.1 Tabel { "2" }), eisen voor holdover en transiënten, jitter, en de frequentienauwkeurigheid van G.811 in clausule { "5" }.

seg-4f6666854cf7 = Budgetten (tijd tot overschrijding)

seg-1f3322a94bbb = Standaard max|TE_HO| van ePRTC

seg-26fd4be0d5ca = G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) clausule { "8.3.1" }

seg-0d5433d85c88 = Holdovertoewijzing in het netwerk, korte GNSS-onderbreking

seg-b74c5284d584 = G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) Tabel V.1, faalscenario (b), "re-arrangements and holdover in the network". Een voorbeeldtoewijzing, geen eis.

seg-afe6c9903ada = Netwerklimiet bij referentiepunt C

seg-0c261b05c3cf = G.8271.1 clausule { "7.3.1" }. Dit is een gefilterde grootheid; als budget wordt ze ongefilterd vergeleken.

seg-4b5a9718d008 = Eindtoepassing, nauwkeurigheidsklasse { "4" }

seg-2a38e45e7008 = { "1.5" } µs

seg-41c6dd43e313 = G.8271 (03/2020) Amd. { "1" } (08/2024) Tabel { "1" }, klasse { "4" }

seg-ded846b5a4bc = <b>Het klassieke cijfer "{ "1.5" } µs van begin tot eind".</b> Het is de eis aan de tijdfout van klasse { "4" } in G.8271 Tabel { "1" }, gesteld tegenover een gemeenschappelijke referentie bij de eindtoepassing. G.8271.1 Tabel V.1 laat zien hoe een netwerk die in normaal bedrijf kan toewijzen: { "100" } ns voor de PRTC/telecom-grandmaster, { "200" } ns voor de dynamische tijdfout van de keten, een constante tijdfout voor de klokken en verbindingen, in totaal { "1 100" } ns bij referentiepunt C, dan { "250" } ns voor herschikkingen en korte holdover in de eindtoepassing en { "150" } ns voor de eigen ruis van de eindtoepassing, { "1 500" } ns bij referentiepunt E. Het faalscenario (c) van dezelfde tabel, "long holdover periods, e.g., { "1" } day", geeft { "3 350" } ns bij C en { "3 500" } ns bij E (Noot { "5" } ervan zegt dat overschrijding van { "1 500" } ns de dienst kan verslechteren). Geen van beide Aanbevelingen stelt dus een eis van "{ "1.5" } µs over { "24" } uur holdover", en de soort implementeert er geen.

seg-76cab595673a = Niet bevestigd of niet geïmplementeerd

seg-175c282ddce2 = Niets hieronder is als masker geïmplementeerd. Niets ervan is op schatting ingevuld.

seg-3c74e4ba9579 = <b>In de Aanbevelingen gemarkeerd als "for further study":</b> G.8273.2 klasse D max|TE|, cTE, dTE_L MTIE en TDEV, dTE_H en holdover; ePRTC-B-holdover (G.8272.1 clausule { "8.2.1" }); ePRTC-A-holdover MTIE en TDEV voorbij { "10 000" } s (Tabel { "4" } Noot { "1" }, Tabel { "5" } Noot { "2" }); ePRTC-fasediscontinuïteit (clausule { "7" }); T-BC/T-TSC-fase-/tijdholdover waarbij zowel de PTP-invoer als de invoer van de fysieke laag verloren is (G.8273.2 clausule { "7.4.2.1" }); de TDEV-netwerklimiet bij referentiepunt C (G.8271.1 clausules { "7.3.1" } tot en met { "7.3.3" }); netwerklimieten voor implementatiegeval { "2" } bij punt C.

seg-93c60d44788e = <b>Getranscribeerd maar in deze versie niet geïmplementeerd:</b> G.8273.2 Tabel 7-6 (MTIE met variabele temperatuur: { "40" } / { "40" } / { "10" } ns tot { "10 000" } s), Tabel 7-7 (dTE_H piek-tot-piek: { "70" } / { "70" } / { "30" } ns, wat een hoogdoorlaatfilter van { "0.1" } Hz vereist), Tabel 7-10 (holdover-MTIE met frequentieondersteuning van de fysieke laag), relatieve tijdfout (Tabellen 7-8 en 7-9), en de dTE_H-limieten van G.8271.1 clausules { "7.3.2" } ({ "50" } ns) en { "7.3.3" } ({ "70" } ns).

seg-f5fcd3b0f8a5 = <b>Niet toegepast:</b> het voortschrijdend-gemiddeldefilter van minstens { "100" } samples dat G.8272 en G.8272.1 voor PTP-interfaces vermelden. De invoer wordt behandeld als een tijdintervalfout van { "1" } PPS, die die Aanbevelingen zonder filter meten.

seg-74fe057a4392 = <b>Onleesbaar:</b> de twee beperkte amendementen van { "2026" } die onder "Gelezen bronnen" zijn genoemd.

seg-bd4ec59cc872 = <b>Redactionele eigenaardigheid:</b> in G.8272.1 Amd. { "1" } bevat de kop van Tabel { "3" } een ingevoegde rij "TDEV limit [ns] { "1" } / { "0.1" } < τ ≤ { "10 000" }" in amendementsopmaak, boven de kolommen met tijdfout. Ze wordt niet behandeld als onderdeel van de omhullende van de tijdfout. Dezelfde TDEV van { "1" } ns staat in Tabel { "5" } en is daar geïmplementeerd.

seg-511db1219de1 = Het meetfilter

seg-5fc683308b31 = G.8273.2 en G.8271.1 definiëren hun gefilterde limieten via een eersteorde laagdoorlaatfilter met een bandbreedte van { "0.1" } Hz. De soort past de discrete gladmaker y_k = y_{ "{" }k−{ "1" }{ "}" } + α (x_k − y_{ "{" }k−{ "1" }{ "}" }), α = { "1" } − exp(−2π · { "0.1" } · Δt) toe, gestart bij het eerste sample. Het is een benadering van testapparatuur, geen kopie van enig instrument. Het wordt alleen toegepast wanneer het sampleinterval Δt { "1" } s of minder is. Een grovere opname wordt tegenover een gefilterd masker als NOT-EVALUATED gerapporteerd in plaats van slecht gefilterd.

seg-218e5ad620af = Oscillatorvoorinstellingen (MODELLED)

seg-28bb7b8ad89f = Elk cijfer is dat van de datasheet zelf, gelezen op 2026-09-25.

seg-b4207b682560 = Apparaat en document

seg-13f9ba96c063 = Gebruikte maxima van ADEV (τ: σ_y)

seg-d719167df981 = Veroudering

seg-f30740907f6a = Temperatuur

seg-c789847129bd = Microchip (Vectron) OX-208, { "10" } MHz; datasheet Rev 12-1-2021

seg-cefcf7025826 = { "1" } s: { "5e-12" }; { "10" } s: { "8e-12" }; { "100" } s: { "1e-11" }; { "1 000" } s: { "5e-11" }

seg-85f8b8fbbae6 = ±{ "0.15" } ppb/dag na { "72" } h (f ≤ { "10" } MHz)

seg-0c6d3ae4e409 = ±{ "0.4" } ppb, { "0" } °C tot +{ "70" } °C, met +{ "25" } °C als referentie

seg-53ac4dcaf8b1 = Microchip 8040C Rubidium Frequency Standard, standaardprestaties; DS00003047A (2/20)

seg-ccb8b3a41af4 = { "1" } s: { "3.0e-11" }; { "100" } s: { "3.0e-12" }

seg-ae0f630aba4b = <5e-11/maand na { "30" } dagen

seg-dbb2a780ceb9 = temperatuurcoëfficiënt <{ "3E-10" }, { "0" } °C tot { "50" } °C

seg-79d5b7a3a453 = Microchip 5071A, buis met hoge prestaties; DS00002980D (5/25)

seg-62572a695878 = { "1" } s: { "5.0e-12" }; { "10" } s: { "3.5e-12" }; { "100" } s: { "8.5e-13" }; { "1 000" } s: { "2.7e-13" }; 10⁴ s: { "8.5e-14" }; 10⁵ s: { "2.7e-14" }; { "5" } dagen: { "1.0e-14" }; { "30" } dagen: { "1.0e-14" }

seg-1fbdd6edc376 = geen snelheid gepubliceerd; verandering over de levensduur ≤{ "5.0e-14" }

seg-bb485faf403a = ±{ "8.0e-14" } ten opzichte van de omgeving ({ "0" } °C tot { "50" } °C, vochtigheid, magnetisch veld, schok)

seg-889f4dc6cafc = Microchip SA.45s CSAC, opties { "001" } en { "003" }; DS00002985D (5/23)

seg-ecee1cb2a670 = { "1" } s: { "3e-10" }; { "10" } s: { "1e-10" }; { "100" } s: { "3e-11" }; { "1 000" } s: { "1e-11" }

seg-c90e2f590297 = <9e-10/maand na { "30" } dagen

seg-5b1bd12aea0f = ±{ "5e-10" }, −{ "10" } °C tot { "70" } °C

seg-63ba00e95bbc = Documentlinks: <a1>OX-208</a1>, <a2>8040C</a2>, <a3>5071A</a3>, <a4>SA.45s</a4>.

seg-31ad29d092ee = Bewust weggelaten: de rij van { "10" } s van de 8040C, die de datasheet afdrukt als "<{ "1.0" } x { "10" }^{ "11" }" (een verkeerd gedrukte exponent), en de rijen van de 5071A onder { "1" } s. De OX-049 is overwogen voor de OCXO en niet gebruikt, omdat zijn verouderingsrij uit zijn scheefgelopen tabel niet ondubbelzinnig te lezen is.

seg-8d4a915bc7fc = <b>Hoe de cijfers een model worden.</b> Dit zijn keuzes van deze engine, en elk ervan wordt in de uitvoer van de run gerapporteerd:

seg-f1e6ea28601c = <b>Ruisfit.</b> De niveaus van witte, flicker- en random-walk-frequentieruis zijn een niet-negatieve kleinste-kwadratenfit aan de maxima van ADEV, daarna opgeschaald tot het model op of boven elk punt ligt. De cijfers van de datasheet zijn maxima, dus het model omhult ze.

seg-0e5ab055094a = <b>Flickerbodem.</b> De bodem ligt nooit onder de ADEV bij de langste vermelde τ. Een datasheet houdt op met vermelden waar de maker stopt met beloven dat het beter wordt, dus het model laat de klok niet daarbuiten verbeteren. Dit kan een holdover alleen slechter maken.

seg-ebefbd6f119b = <b>Veroudering.</b> Een maandelijks cijfer wordt omgerekend met { "30" } dagen per maand en toegepast als lineaire frequentiedrift vanaf het moment van verlies. De caesiumvoorinstelling kent geen veroudering.

seg-bb08c7b5baf5 = <b>Temperatuur.</b> De vermelde grens wordt lineair gelezen over de helft van het werkbereik (bijvoorbeeld ±{ "5e-10" } over −{ "10" } °C tot { "70" } °C geeft { "1.25e-11" } per kelvin), en daarna aangestuurd door een sinusvormig temperatuurprofiel waarvan amplitude en periode scenario-invoer zijn. Niets op een datasheet zegt dat de afhankelijkheid lineair is; dit is een lezing voor het slechtste geval.

seg-47a256757cfc = <b>Vóór het verlies</b> is de klok gedisciplineerd en is haar tijdfout witte fasenruis met een vermelde 1-sigmawaarde.

seg-3ef60b128bb7 = <b>Wat het referentiescenario laat zien.</b> Bij de vastgelegde invoer (rubidium, dagelijkse temperatuurzwaai van ±{ "2" } K, { "24" } h holdover na { "1" } h vergrendeld) bereikt de opname een grootste absolute tijdfout van { "603.2" } ns. Ze overschrijdt het ePRTC-budget van { "100" } ns { "8 206" } s na het verlies en de toewijzing van { "400" } ns na { "25 713" } s, en blijft de hele dag binnen { "1 100" } ns en { "1.5" } µs. Ze faalt voor de ePRTC-A-holdoveromhullende { "3 627" } s na het verlies, wat te verwachten is: die eis veronderstelt een referentie van caesiumklasse. De temperatuurterm alleen kan { "660" } ns bereiken, dus bij deze invoer weegt hij zwaarder dan veroudering ({ "72" } ns aan het einde van de dag).

seg-ba87d450423c = <c1/> controleert de MTIE en TDEV van de soort tegen <c2/> { "2024.06" } op <c3/>, een CSAC-holdoverreeks van { "2" } 048 samples met veroudering, flicker en temperatuur. Bij { "17" } middelingsfactoren voor MTIE en { "12" } voor TDEV komt MTIE exact overeen en komt TDEV overeen tot { "1.1e-15" } relatief. Dezelfde curven worden teruggelezen uit een volledige run die de CSV inleest. Dit toetst de schatters op die opname. Het toetst niet de synthetische holdover, de maskers of de voorinstellingen, die MODELLED rijen zijn in <c4/>.

seg-6fdc3cc32a2f = <s1>Vorige</s1>Slottiming

seg-1108b114de88 = <s1>Volgende</s1>Misleide tijd
