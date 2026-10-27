# docs--resilience-crosswalk: translations (fi)

seg-88372b30ed79 = Raja

seg-aab745a65e76 = Moduuli

seg-ad856ad710eb = Tila

seg-b03d56f501c3 = Tyyppi

seg-4dbf41c0ec3b = Funktio

seg-f472e43c1100 = Mitä se osoittaa

seg-fa4468d4cb80 = Saatavuus

seg-fe4d868448ef = Lähde: <c1/>

seg-d745715d5332 = PNT-kestävyyskehysten vastaavuustaulukko

seg-aa1c24d63df5 = <b>Linjattu, ei arvioitu eikä hyväksytty.</b> Tämä kuvaa Kshanan simuloidut ominaisuudet julkaistuihin PNT-kestävyyskehyksiin (PNT: paikannus, navigointi ja ajanmääritys). Se on <em>simulaatiosta johdettu itsearviointi, joka on linjattu</em> DHS/CISA:n (DHS: Department of Homeland Security; CISA: Cybersecurity and Infrastructure Security Agency) Resilient PNT Conformance Framework (RPCF) v2.0 -kehykseen, RethinkPNT/Firesmith Resist-Detect-Respond-Recover (RDRR) -malliin ja Yang Yuanxin kestävän PNT:n kriteereihin. Se <b>ei</b> ole luokitus, hyväksyntä, akkreditointi eikä compliance-lausunto, eikä se sisällä DHS:n, IEEE:n (Institute of Electrical and Electronics Engineers) eikä minkään viranomaisen tukea. Jokaiselle riville on merkitty sen rehellinen varmennustila (<c1/> ulkoista oraakkelia vasten tai <c2/> ensiperiaatteista testein); kestävyyspisteytyskerros itse on <b>MODELLED</b>. Kaksi sen ytimistä kantaa omat VALIDATED-rivinsä varmennusmatriisissa, käänteis-Simpson-monimuotoisuusydin (<c3/>) ja järjestystilastoydin (<c4/>); se validoi aritmetiikan, ei sen päälle rakennettuja pisteitä.

seg-652fcf3ec12d = Pisteytysmoottori (<c1/>) käyttää näitä ominaisuuksia ja tuottaa ulottuvuuskohtaisia osapisteitä, ei koskaan yhtä haamulukua. Koneellisesti tarkistetut tilainvariantit: katso <c2/>.

seg-7a71de89a9fd = DHS RPCF v2.0: mitä kehys määrittelee, ja Kshanan omat osapisteluokat

seg-1985dbfe351d = Julkaistu kehys (Resilient PNT Conformance Framework, versio { "2.0" }, { "26" }. huhtikuuta { "2022" }, DHS Science and Technology Directorate yhdessä CISA:n kanssa) määrittelee kolme <b>ydintoimintoa</b> (kohta { "5.2" }: Prevent, Respond, Recover), <b>kestävyystasot { "0" }–{ "4" }</b> (kohta { "5.3" }) ja <b>kahdeksan numeroitua vähimmäisvaatimusta</b>, jotka jakautuvat tasoille { "1" }–{ "4" } (kohta { "5.3" }, toistettu kohdassa { "5.5" }), sekä arviointimenettelyn (kohta { "8" }). Se <b>ei</b> määrittele luetteloa seitsemästä tekniikkaluokasta. Sivun aiempi versio ja kestävyysmoduulin kommentit kuvasivat seitsemää ”RPCF technique categories” -luokkaa; sanoja Obfuscate ja Diversify ei esiinny versiossa v2.0. Asiakirjan teksti luettiin uudelleen 2026-10-09, eikä tällaista luetteloa löytynyt.

seg-178d1e119dce = Kshanan pisteytysmoottorin tuottamat seitsemän osapistenimeä (Obfuscate, Limit, Verify, Isolate, Diversify, Mitigate, Recover; ”OLVIDMR” on oma muistisääntömme) ovat siksi <b>Kshanan omia pisteytysluokkia</b>, jotka on säilytetty tulosteen vakauden vuoksi. Ne eivät ole DHS:n termejä, eivätkä alla olevat rivit sano, että DHS vaatii niitä. Kun luokka vastaa kehyksen vaatimusta, viimeinen sarake sanoo niin; kun ei vastaa, siinä lukee ”ei mitään”.

seg-5a9eb11bb965 = Kshanan osapisteluokka

seg-e117e6f71845 = Ajurina käytetty Kshanan ominaisuus

seg-7677dafa7016 = Lähin RPCF v2.0 -viite

seg-27e0f6b39605 = Obfuscate

seg-7327b9cbc106 = Ilmoitettu tekniikka × lähteen laatu (ei suoraa käyttäytymisajuria)

seg-b63e61fa5fa2 = ei mitään (ehkäisytekniikka; kohta { "5.2" }, Prevent)

seg-7ed4f2e21189 = Ilmoitettu tekniikka × lähteen laatu

seg-8579207ae2e5 = Verify

seg-30b8cb030965 = Häiriöilmaisimen AUC (käyrän alla oleva pinta-ala) skenaariossa (harhautus-, häirintä- ja meacon-monitorit)

seg-3d358c029f50 = Taso { "2" } vaatimus { "4" }; taso { "3" } vaatimus { "7" }

seg-fcb8cb7d4c97 = Isolate

seg-b3cd355743da = Taso { "3" } vaatimus { "6" }

seg-ffa87d149a20 = Diversify

seg-1282685a888b = Riippumattomien ryhmien lukumäärä → käänteis-Simpson-tehollinen monimuotoisuus

seg-f0dd4c4ef1c5 = Taso { "4" } vaatimus { "8" }; kohta { "5.5" } (yhteinen moodi)

seg-2d91b12a9e56 = Mitigate

seg-d183b552df76 = Saatavuus eston aikana

seg-c337df73e231 = kohta { "5.2" }, Respond

seg-2da4df22d35d = Recover

seg-85d7e3292549 = Holdover-ylläpito × rajatun heikkenemisen portti

seg-3aec9f076902 = Taso { "2" } vaatimus { "5" }; kohta { "5.2" }, Recover

seg-36958650abc0 = Vaatimuskohtainen vastaavuus todelliseen kehykseen, eli mitä Kshanan tulosteet tukevat todisteita (supports evidence for) ja mitä jää jäljelle, on tiedostossa <a1>compliance/dhs-rpcf.md</a1>.

seg-a085dd81c769 = RethinkPNT / Firesmith RDRR -toiminnot

seg-1b972717180b = Ajuri

seg-6eaf161f8871 = Resist

seg-6046a8914dc7 = Obfuscate/Limit/Isolate/Diversify-osapisteiden keskiarvo

seg-242e2c01ebc2 = Detect

seg-45c8da13581f = Verify-osapiste (ilmaisimen AUC)

seg-d29232baaaa6 = Respond

seg-36ab7ce187e6 = Mitigate-osapiste (saatavuus)

seg-f98dc190541c = Holdover × rajattu portti; kestävyysaikajanan keskeiset suorituskykymittarit (KPI: havaitseminen/reagointi/palautuminen/menetys)

seg-e7190928bed6 = Yang Yuanxin kriteerit (osajoukko, jota ajoitus- ja havaitsemislaatumittarit koskevat)

seg-52836e247425 = Kriteeri

seg-cbbe4c0baf3f = Luotettavuus

seg-32d64f865b21 = Suodattimen eheysosuus

seg-214372f29bd1 = Jatkuvuus

seg-ad5e76a596b8 = Holdover × rajattu portti

seg-d92fb15e6dfa = Tarkkuus

seg-0de1f9119e0f = Ajoitus-/laatuvastine — <b>paikka-alueen tarkkuus ei ole osa pisteytystä</b>. Funktio <c1/> muuttaa annetun paikkakovarianssin ja HPL:n (horisontaalinen suojaustaso) arvoiksi CEP/SEP/2DRMS (ympyrän virhetodennäköisyys, pallon virhetodennäköisyys, kaksinkertainen etäisyyden neliökeskiarvo), mutta mikään skenaario ei syötä sitä kestävyyspisteeseen

seg-0aa925a09499 = MODELLED (vain ajoitusalue)

seg-6b661e6e4399 = Mitä tämä vastaavuustaulukko ei väitä

seg-51a48d0c718d = Ei myönnettyä RPCF-tasoa. Annettu taso on <em>alustava, simulaatiosta johdettu</em> luenta, jossa on selkeä rajatun heikkenemisen portti, ei myönnetty kypsyystaso.

seg-df73b7c76ae5 = Pisteytyksessä ei ole paikka-alueen tarkkuutta. Kestävyysosapisteet on rakennettu ajoitusalueen ja havaitsemisen mittareista. Moottori laskee kyllä paikkoja muualla (tyypit <c1/>, <c2/> ja <c3/>) ja suojaustasoja (tyyppi <c4/>), mutta pisteytyskerros ei käytä niitä.

seg-30a1b1a4dfea = Ei kenttävalidointia. Vertailupaneeli ja uhkajoukko ovat synteettisiä, parametreihin perustuvia supistuksia (<c1/>), ja tämä on ilmoitettu ensisijaisena rajoituksena.

seg-83c465cd78b0 = Täydentävä tutkimus (<c1/>) on olemassa nimenomaan osoittaakseen, että näiden ulottuvuuksien romahduttaminen yhdeksi yhdistelmäpisteeksi tai yhdeksi tasoksi tuottaa luokituksen, jonka arkkitehtuurijärjestys on epävakaa puolustettavissa olevien painotus- ja uhkavalintojen alla — joten tämä vastaavuustaulukko on ulottuvuuskohtaisesti luettava mittauskerros, ei yksi arvosana, jota vasten tuote luokiteltaisiin.

seg-32bd45dc031d = Kestävyys- ja toimialaskenaariot, jotka harjoittavat näitä kerroksia

seg-4e36adba1c55 = Alla olevat mukana toimitetut skenaariot ajavat uhka- ja palautumiskoneiston, johon vastaavuustaulukon rivit viittaavat. Jokainen on nimetyn tyypin todellinen ajo; jokainen on <b>MODELLED</b> (ei kenttädataa).

seg-44664e49d449 = Skenaario (<c1/>)

seg-44b8d7435bfd = Kerroksellinen PNT jaetun häirinnän/harhautuksen uhan alla: siemenellä tehty Monte Carlo kerrosten estosta, eloonjääneiden käänteisvarianssifuusio, yksikerroksen ja kerroksellisen kokonaismenetyksen suhde sekä se, miten korreloitunut esto romahduttaa tämän suhteen. Sen Monte Carlo–suljettu muoto- ja fuusioidentiteetit tarkistetaan paketin sisäisillä testeillä; tyypillä ei ole varmennusmatriisin riviä, joten se arvioidaan tässä tasolle MODELLED.

seg-1734506ad287 = GNSS (maailmanlaajuinen satelliittinavigointijärjestelmä) häiritty, matalan Maan kiertoradan (LEO) PNT-kerros kantaa käyttäjää, eheys säilyy (kolme vaihetta yhdellä aikajanalla).

seg-ff8cc090bdce = Yksi häirintälähetin neljän kaistan vastaanotinta vastaan; mikä harhautuksen monitori näkee minkä harhauttajan.

seg-0a93502a4a19 = Häirintä-signaali-marginaali (J/S) vastaanotetusta tehosta.

seg-f2230253bdff = Harhautuksen havaitseminen Dopplerin ja ohitusgeometrian johdonmukaisuuden avulla.

seg-d8ca900a8c14 = Tukiasema- ja kriittisen infrastruktuurin ajoitus holdover-tilassa, LEO-ajan kanssa.

seg-2a61d07bf177 = Tie-, rautatie-, meri-, napa- ja esineiden internetin (IoT) käyttäjät LEO-kerroksen kanssa.

seg-8723073167ad = GNSS/INS (inertiaalinavigointijärjestelmä) -dead reckoning kaupunkikanjonin läpi ja häirinnän läpi pienellä miehittämättömällä ilma-aluksella.

seg-6ee1ef707b20 = Kuinka kauan INS pitää aluksen tai junan rajansa sisällä, kun GNSS on estetty.

seg-7ca913e1729b = Meriliikenteen häirintälähetin; aluksen ilmoitettua paikkaa vetävän harhauttajan havaitseminen.

seg-c49548e8393b = <s1>Edellinen</s1>DO-316 / DO-229E -kartta

seg-dedf3b53d31f = <s1>Seuraava</s1>Vastaanottimen luottamus
