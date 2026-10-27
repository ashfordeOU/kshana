# docs--observatory-results: translations (fi)

# text
# c1: docs/observatory/RESULTS.md
seg-69304b8b186b = Lähde: <c1/>

# text
seg-df5b53307f50 = Observatorion tulokset: 30 päivän Itämeren takautuva katalogi ja herkkyystutkimus

# text
# c1: kshana-observatory/adsb/v1
# c2: kshana-interference-map/adsb/v2
seg-072bdea11014 = Versio <c1/> pohjalla <c2/> (parametrit ennakkorekisteröity perusmenetelmässä, ennallaan). MODELLED: ulkoista oraakkelia, maastototuutta tai syyn osoitusta ei ole. Heikentynyt solu tarkoittaa, että suuri osuus siellä otokseen kuuluneista ilma-aluksista ilmoitti sinä päivänä heikkoa navigointitarkkuutta; se ei kerro miksi. Solua, joka ei ole havaittu tai puuttuu, ei arvioitu, mikä ei ole sama asia kuin selvä.

# text
seg-0d1eeedcab3a = Mitä ajettiin

# text
# c1: v<YYYY>.<MM>.<DD>-planes-readsb-prod-0
# c2: adsblol/globe_history_2026
# c3: scripts/fetch_adsblol_day.sh
# c4: back-catalogue/fetch/<tag>.parts.json
seg-df6ddf801a25 = <b>Lähde:</b> adsb.lol readsb -historia (ODbL { "1.0" }), GitHub-julkaisu <c1/> arkistossa <c2/>, haettu skriptillä <c3/> yksi osa kerrallaan (noin { "3.4" } GB päivässä, { "2" } osaa). Julkaisija ei ilmoita tarkistussummia, joten jokaisen osan SHA-256 kirjataan tiedostoon <c4/>.

# text
# c1: scripts/observatory_backcatalogue.sh
seg-9fa2d2319ed3 = <b>Alue ja päivät:</b> laatikko { "53.5" }, { "9.0" }, { "66.0" }, { "31.0" } (etelä, länsi, pohjoinen, itä: Itämeri ja sen rannikot), { "30" } UTC-päivää välillä 2026-09-15–2026-10-14, { "0.5" } asteen solut, skriptillä <c1/> (yksi päivä kerrallaan, raakatiedostot poistetaan kunkin päivän jälkeen).

# text
# c1: method.scope
seg-8b65d148bbd8 = <b>Julkaisusäännöt:</b> uusin päivä (2026-10-14) oli tuotettaessa yli { "24" } h päivän lopun jälkeen; komento hylkää muuten. Alueajot laskevat laitteiston lähtötason ja päivän taustan vain laatikon raporteista (<c1/>).

# text
# c1: back-catalogue/MANIFEST.json
seg-64581554e84a = <b>Tiedostot:</b> { "120" } tuotetiedostoa (GeoJSON, PNG, tapaus-JSON, manifesti päivää kohden) <b>eivät ole gitissä</b>. Jokaisen tiedoston tiiviste on tiedostossa <c1/>, ja päivä voidaan rakentaa uudelleen arkistostaan ja verrata.

# text
# c1: manifest.json
seg-c89b88dc3d3b = Esimerkki siitä, mitä päivä sisältää: 2026-09-15 arkistossa oli { "110,619,797" } paikkariviä { "79,826" } jälkitiedostossa; { "103.0" } miljoonaa oli laatikon ulkopuolella, { "5.6" } miljoonaa ei ollut ADS-B:tä, { "1.2" } miljoonaa oli maassa tai alle { "5,000" } ft:n korkeudessa, { "0.6" } miljoonaa ei sisältänyt tarkkuuskenttää, ja { "212,426" } aggregoitiin (tiedoston <c1/> syötelaskurit).

# text
seg-cc590aa74075 = Kolme päivää (2026-09-18, 2026-09-26, 2026-10-03) haettiin uudelleen arkistosta ja ajettiin toisen kerran: GeoJSON, PNG ja tapaustiedosto ovat <b>tavutasolla identtisiä</b> ensimmäisen ajon kanssa (SHA-256 yhtäpitävä), joten tuote on deterministinen, vaikka tunnisteen tiivistesuola on satunnainen ajoa kohden.

# text
seg-3532be519183 = Takautuvan katalogin yhteenveto

# text
seg-56aae646318e = UTC-päivä

# text
seg-42784010b115 = julkaistut solut

# text
seg-2672b7f55371 = heikentynyt

# text
seg-378ee89e4bd3 = ei heikentynyt

# text
seg-14783d89f2fe = ei havaittu (julkaistu)

# text
seg-711d143678ae = tapaukset

# text
# c1: not_observed
seg-0f1ffe21d381 = { "30" } päivää: yhteensä { "96" } heikentynyttä solua, { "28" } päivänä { "30" }:stä vähintään yksi, { "70" } tapausta (toisiinsa koskettavien heikentyneiden solujen ryhmiä), ei yhtään päivää koko päivän vaikutuksella. Vaikutuksen alaisten ilma-alusten solun mediaaniosuus (päivän tausta) on { "0" } { "29" } päivänä ja { "0.006" } yhtenä päivänä, joten taustasuoja (solun on ylitettävä tausta arvolla { "0.15" }) ei koskaan muuttanut arviota tällä alueella. Heikentyneiden solujen määrä päivässä vaihtelee välillä { "0" }–{ "8" } (keskiarvo { "3.2" }). Noin kolmasosa kunkin päivän julkaistuista soluista on <c1/> (liian vähän ilma-aluksia otoksessa): kattavuus on tämän tuotteen raja, ei taivas.

# text
seg-606aed861c95 = Mitä tämä ei kerro: päivät, joilla on enemmän heikentyneitä soluja, eivät ole "pahempia" missään fysikaalisessa mielessä, pysyvä vaikutusalue aliarvioitaisiin (ilma-alukset, jotka lentävät vain sen sisällä koko päivän, eivät saa lähtötasoa sen ulkopuolelta eikä niitä lasketa), eikä mikään täällä kerro, kuka tai mikä aiheutti heikon tarkkuuden.

# text
seg-ef37626a4c47 = Herkkyystutkimus (kolme päivää)

# text
# c1: kshana interference-map sensitivity
# c2: sensitivity/<day>.json
seg-aacbb761ee19 = <c1/> toistaa yhden päivän tallennetut raportit muuttaen yhtä rekisteröityä parametria kerrallaan (kaksi arvoa kullekin sekä { "1.0" } asteen ruudukko). Päivät: 2026-09-18 (eniten heikentyneitä soluja, { "8" }), 2026-09-26 ({ "1" } heikentynyt solu) ja 2026-10-03 ({ "0" }). Täydet raportit: <c2/> ({ "23" } varianttia kullekin; toistettu { "2.2" }, { "1.7" } ja { "1.7" } miljoonaa riviä). Heikentyneet solut kussakin variantissa (rekisteröity arvo sulkeissa; rekisteröity tulos on { "8" }, { "1" } ja { "0" } heikentynyttä solua):

# text
seg-dfced7e594d2 = parametri (rekisteröity)

# text
seg-2ac3e771679d = arvo

# text
seg-0953dbfd76db = ruudukko { "0.5" } astetta

# text
seg-bf5746d1a110 = { "2" } (karkeammat solut)

# text
seg-e4016df2fcd3 = Luettuna ilman voittajan valintaa:

# text
seg-81cfcbf0de89 = Arviot ovat herkkiä tarkkuuskoodien kynnyksille ja otantasäännöille, ja pienet määrät liikkuvat paljon.

# text
# c1: low_nic_max
# c2: degraded_share
# c3: min_reports_per_aircraft_in_cell
# c4: low_nic_max
# c5: degraded_share
seg-097ed1aa1504 = <c1/>, <c2/> ja <c3/> muuttavat kukin heikentyneiden solujen määrää kertoimella kaksi tai enemmän jokaisena päivänä; kun <c4/> höllennetään arvoon { "6" }, { "1" } heikentynyt solu muuttuu { "12" }:ksi päivänä 09-26 (Jaccard rekisteröidyn joukon kanssa { "0.08" }). Päivänä 09-18 arvon <c5/> nostaminen arvoon { "0.4" } säilyttää { "1" } { "8" }:sta (Jaccard { "0.125" }). Solun arvio kynnysten lähellä kertoo kynnyksistä yhtä paljon kuin datasta.

# text
# c1: min_aircraft_sampled
seg-0d0c96099d30 = <b><c1/> siirtää soluja enimmäkseen tilojen ei heikentynyt ja ei havaittu välillä</b>: päivänä 09-18 se jättää heikentyneiden määrän arvoon { "8" }, kun { "21" }–{ "56" } solua vaihtaa tilaa.

# text
# c1: background_margin
# c2: min_baseline_good_reports
# c3: day_confound_background
seg-04cc05318a5d = <b>Kolme suojaa on tässä toimettomina</b>: <c1/>, <c2/> ja <c3/> eivät muuta mitään yhtenäkään kolmesta päivästä (taustaosuus on { "0" }), joten tämä alue ja jakso eivät kerro, kuinka hyvin ne toimivat. Ne olisivat merkityksellisiä siellä, missä alueellinen vaikutus nostaa taustaa.

# text
seg-7ba403b84fbd = <b>Karkeampi ruudukko ({ "1.0" } astetta) muuttaa kuvaa</b> ({ "2" }, { "3" } ja { "1" } heikentynyttä solua; julkaistut solut putoavat noin kolmasosaan, { "226" } vastaan { "694" } päivänä 09-18, koska jokainen solu on nelinkertainen): solun koko on menetelmävalinta, ja observatorio kiinnittää sen arvoon { "0.5" } astetta.

# text
# c1: low_nic_max
seg-4db2f5313410 = Päivällä, jolla ei ole rekisteröityä heikentynyttä solua (10-03), on heikentyneitä soluja { "9" }:ssä { "22" }:sta ruudukottomasta variantista (enintään { "8" } kun <c1/> on { "6" }): "ei heikentynyttä solua" on myös kynnysriippuvainen toteamus.

# text
seg-a818be844f3a = Mikään variantti ei ole validoitu vaihtoehto, eikä tämä tutkimus muuta rekisteröityä sääntöä. Tutkimus ei kerro, mitkä parametriarvot ovat oikeat.

# text
seg-98c799bfbc25 = <s1>Edellinen</s1>Häiriöobservatorio: menetelmä

# text
seg-5d0c003e73dc = <s1>Seuraava</s1>kshana-bench
