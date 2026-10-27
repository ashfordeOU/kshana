# docs--spectrum: translations (fi)

seg-a86ce24d81de = Kaista

seg-ea152d84aabc = { "465" } MHz

seg-278d0b375f6f = { "20.46" } MHz

seg-39e207bee75b = { "2492.028" } MHz

seg-48fabff33863 = { "5020" } MHz

seg-6cb7a787ac67 = Lähteet

seg-cbf0f9bcd2d8 = Oraakkeli

seg-6e0cb6acc073 = VALIDATED

seg-33f4c7af9c53 = Kantoaalto

seg-c5ce76c91ff7 = Merkintä

seg-72f051e2d7e1 = Signaali

seg-47408d30d095 = Nimellinen C/N₀

seg-995748f9c74c = { "49.41" } dB-Hz

seg-5393b075ff7f = { "43.48" } dB-Hz

seg-4321ccaeeca5 = { "46.73" } dB-Hz

seg-59fd1427d61b = { "54.51" } dB-Hz

seg-0f47178201ca = { "49.23" } dB-Hz

seg-f8e6beeceedd = { "47.41" } dB-Hz

seg-53a7343c076e = Väite

seg-430edd66bda0 = Ei mallinnettu

seg-64509c048541 = Mitä mallinnetaan

seg-f07519ff8071 = Lähde: <c1/>

seg-901c3e032de7 = Spektrimalli ja vesiputouskaavio

seg-eac92092dd34 = Skenaariotyyppi <c1/> rakentaa GNSS:n (Global Navigation Satellite System) L-kaistan ja minkä tahansa muun kaistan, jonka suunniteltu signaali varaa (UHF eli ultrakorkea taajuus, S-kaista, C-kaista), yhdeksi tehotiheysspektriksi (PSD), antaa sen muuttua skriptatun häirintälähetinaikajanan mukaan ja redusoi sen siihen, mikä seurantasilmukkaa kiinnostaa: häirintälähettimen ja signaalin suhteeseen (J/S) ja kunkin kaistan tehokkaaseen kantoaalto–kohinatiheyssuhteeseen (C/N₀). Se piirtää tuloksen vesiputouskaaviona (taajuus vaakaan, aika alas, väri tehoon) kaistakohtaisten C/N₀-pylväiden rinnalle, ja se lukee ja kirjoittaa Signal Metadata Format (SigMF) -tallenteita, jotta todellinen tallenne voidaan estimoida ja piirtää mallin rinnalle.

seg-0007b6ba97ca = Kirjoita mukana toimitettu esimerkki tiedostoon ja aja se:

seg-5e205b189b26 = Kloonatussa työkopiossa <c1/> ajaa saman tiedoston.

seg-261deb22b4fa = Koodi: <c1/> (malli, tyyppi, Welch-estimaattori), <c2/> (tallennekoodekki), <c3/> (yksikköpinta-alaiset signaalispektrit ja spektrierotuskerroin) ja <c4/> (signaalisuunnittelun esiasetukset, joihin kaista voi viitata).

seg-bb1153873209 = Modulaatio

seg-9758b36b554c = Oletusvastaanottoteho

seg-a1a68286b809 = Oletusvastaanottimen kaistanleveys

seg-27a2cdc8183f = { "1575.42" } MHz

seg-66a103496266 = binäärinen vaihesiirtoavainnus, BPSK({ "1" })

seg-f386c2e2e352 = −{ "158.5" } dBW (IS-GPS-200)

seg-50112ba8867d = { "2.046" } MHz

seg-b7755cb9a384 = multipleksattu binäärinen siirtokantoaalto, MBOC(6,1,1/11), tai binäärinen siirtokantoaalto BOC({ "1,1" })

seg-6043a4ef45ca = −{ "157.25" } dBW (Galileo OS SIS ICD Issue { "2.1" }, Taulukko { "12" })

seg-6dc5e3668a78 = { "14.322" } MHz

seg-f03380403a2a = { "1227.60" } MHz

seg-06c245582533 = BPSK({ "1" }) (CM- ja CL-koodit aikajakoisesti multipleksattuina)

seg-fa56c0085dbc = −{ "160.0" } dBW (IS-GPS-200)

seg-1982a811e1ef = { "1176.45" } MHz

seg-dd074e33242e = BPSK({ "10" })

seg-f30f2e48a3bf = −{ "157.9" } dBW (IS-GPS-705)

seg-898ae19a946b = −{ "155.25" } dBW (Galileo OS SIS ICD Issue { "2.1" }, Taulukko { "12" })

seg-3216d5cd918d = GPS (Global Positioning System) L1 C/A on karkea hankintakoodi (coarse/acquisition); L2C on L2-siviilisignaali; IS-GPS-200 ja IS-GPS-705 ovat GPS:n rajapintamäärittelyjä; Galileo OS SIS ICD on Galileon Open Service Signal-in-Space Interface Control Document. Vastaanotetut tehot ovat määrittelyn minimiarvoja; kaistanleveydet ovat mallinnusvalintoja. Molemmat voi ohittaa kaistakohtaisesti. Ilman taulukkoa <c1/> ajo käyttää näitä viittä. GLONASS G1/G2, BeiDou B1/B2 ja Galileo E6 <b>eivät</b> ole nimettyjen kaistojen joukossa.

seg-79cc2ed8195b = Merkintä <c1/> ottaa yhden kolmesta muodosta:

seg-67d0591c69d8 = nimi yllä olevasta taulukosta, valinnaisilla <c1/>, <c2/> ja kohteelle <c3/> lisäksi <c4/>;

seg-8596194c81f2 = <c1/>: matalan Maan kiertoradan (LEO) tai edustava signaalisuunnittelu tyypin <c2/> esiasetuskirjastosta (<a1>LEO-SIGNAL.md</a1>), millä tahansa kaistalla, piirretty kaikkine komponentteineen (hankinta, data, pilotti, taajuusjakoiset alikantoaallot) ja rajattu lähetyskaistanleveyteensä; C/N₀ ja J/S viittaavat seurattuun komponenttiin, ja <c3/> vain nimeää sen. Esiasetukset ovat <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/> ja <c15/>;

seg-2ca46a7f2949 = oma kaista: mikä tahansa <c1/> kentillä <c2/>, <c3/> (<c4/>, <c5/> tai <c6/>) ja <c7/>.

seg-fcb0f9fcffbf = Häirintälähettimet (<c1/>) ottavat kentän <c2/>:

seg-457e5e95c677 = <c1/> — jatkuva-aaltoinen (CW) sävel taajuudella <c2/>;

seg-3120ac4f6710 = <c1/> — tasainen kohina kaistanleveydellä <c2/>;

seg-7d975838a2e6 = <c1/> — tasainen kohina leveällä kaistalla <c2/> (laajakaistainen peittohäirintälähetin): sama tiheys kuin <c3/>, nimetty erikseen, koska tyyppi <c4/> pisteyttää sen laajakaistaiseksi;

seg-d13b177946d2 = <c1/> — lineaarinen sahalaitapyyhkäisy, leveys <c2/>, pyyhkäisyjaksolla <c3/>;

seg-675fb74a89e4 = <c1/> — laajakaistainen kohina, jonka spektri on kaistan <c2/> oma modulaatio.

seg-64d7a14a198e = Kukin antaa joko <c1/>, tai efektiivisen isotrooppisesti säteilevän tehon <c2/> ja etäisyyden <c3/> (ja valinnaisesti <c4/>), joka kulkee tyypin <c5/> vapaan tilan etenemishäviön kautta. <c6/> ja <c7/> skriptaavat aikajanan.

seg-8e718c09f7d8 = Vastaanotin (<c1/>) asettaa kohinapohjan, <c2/>, kun <c3/> antennilämpötilalla <c4/> ja kohinaluvulla <c5/>, sekä seurantakynnyksen.

seg-9b8078bd0df3 = Pääasiallinen vesiputouskaavio kattaa <c1/> (oletus { "1160" }–{ "1590" } MHz { "430" } lokerolla). Jokainen merkintä <c2/> (<c3/>, <c4/>, <c5/>, <c6/>, oletus { "200" } lokeroa) lisää toisen vesiputouskaavion omalla taajuusalueellaan samalla aikajanalla, spektrille, joka kattaa useita kaistoja.

seg-a550e89c2907 = Häiriöketju

seg-12a2c08191c0 = Signaalille, jonka yksikköpinta-alaspektri on <c1/>, ja häirintälähettimelle, jonka yksikkötehospektri on <c2/>, spektrierotuskerroin (SSC) vastaanottimen kaistalla <c3/> on <c4/>, ja tehokas kantoaalto–kohinatiheys usealla häirintälähettimellä on

seg-5c556163af62 = (Betz { "2001" }; Kaplan & Hegarty, <em>Understanding GPS/GNSS</em>, 3. painos, §{ "9.4" }). Yhdelle häirintälähettimelle tämä on täsmälleen tyypin <c1/> häirinnänestoyhtälö kertoimella <c2/>; raportin lohko <c3/> ajaa tyypin <c4/> omat funktiot samoilla linkkisyötteillä ja tulostaa eron, joka on nolla pyöristyksen tarkkuudella.

seg-c11d0cb8e670 = Raportti tulostaa myös C/N₀-arvon, jonka tyyppi <c1/> antaa Q-taulukollaan. Taulukko sisältää oppikirja-arvot, jotka on lukittu testeissä suljettuihin muotoihin:

seg-5c21df11e35b = <b>CW ja kapeakaistainen: <c1/>.</b> C/A-kantoaallolla olevalla CW-sävelellä on <c2/>, joten <c3/>, ja taulukko ja spektrit ovat yhtä mieltä. Mukana toimitetussa esimerkissä sävel antaa { "17.98" } dB-Hz molemmista (taulukko antoi { "19.74" }, kun siinä oli { "1.5" }).

seg-647e209b1efc = <b>Laajakaistainen ja pyyhkäisty: <c1/>, versiosta { "0.36" } lähtien.</b> Se on valkoista kohinaa pääkeilan yli kaistan sisäisen signaalitehon normalisoituna yhteen, <c2/>. Taulukossa oli { "1" } versioon { "0.36" } asti, noin { "3" } dB pessimistinen (<c3/>).

seg-cd03b9c900e1 = Spektrimalli johtaa omat arvonsa spektreistä:

seg-b1327e66260b = <c1/> kohinalle, joka on sovitettu C/A:han (<c2/>);

seg-45b2cf032a11 = <c1/> tasaiselle kohinalle nollasta nollaan ilman normalisointia (<c2/>).

seg-6c2187f0e32b = Joten näille häirintälähettimille kaksi tulostettua C/N₀-arvoa eroavat edelleen, tarkoituksella.

seg-73dfbeabcac2 = Jokainen vesiputouskaavion solu on PSD keskiarvoistettuna taajuuslokeronsa ja rivinsä yli. Chirp keskiarvoistetaan täsmälleen rivin yli, kokonaiset pyyhkäisyt plus osittainen; rivin keskellä päälle tai pois kytkeytyvä häirintälähetin painotetaan sen käyttösuhteella. C/N₀-aikajana käyttää samoja keskiarvoja, joten kuva ja luvut ovat yhtä mieltä. Kaistaa kohti aikajana raportoi kaistan sisäisen J/S:n (vastaanottimen kaistanleveyden sisällä oleva häirintäteho jaettuna signaalitehoon). Häirintälähetintä ja kaistaa kohti raportti antaa SSC:n, <c1/>, kokonais-J/S:n, kaistan sisäisen J/S:n ja vakaan C/N₀-arvon.

seg-2c214a0a30be = Mukana toimitettu esimerkki

seg-4adc00a3ca10 = <c1/>: { "60" } s aikajana, yksi rivi sekunnissa, { "290" } K antenni ja { "2" } dB kohinaluku (pohja −{ "201.98" } dBW/Hz).

seg-94d1cebc134d = { "10" } s – { "40" } s: { "16" } MHz chirp L1:n ympärillä, { "9" } µs pyyhkäisyt, { "50" } mW etäisyydellä { "100" } m.

seg-b85319af4f85 = Alkaen hetkestä { "30" } s: CW-sävel L1-kantoaallolla, { "10" } mW etäisyydellä { "1" } km.

seg-21e2b4e76832 = Alkaen hetkestä { "45" } s: tasainen { "2" } MHz kohina L2:lla vastaanotettuna tasolla −{ "135" } dBW.

seg-45dd378c692c = Mitä ajo laskee:

seg-eecd7d7530bf = Pienin C/N₀

seg-1ead35e1aad5 = Ensimmäinen menetys

seg-bfb55a322ece = Seurannassa olevat rivit

seg-863ea3f1fbe9 = { "3.23" } dB-Hz

seg-9aa0239a3a0c = { "10" } s

seg-9979940d2359 = { "44.73" } dB-Hz

seg-25364ef39455 = { "4.44" } dB-Hz

seg-c8d0bc71cccd = { "41.98" } dB-Hz

seg-c945914c444c = { "36.86" } dB-Hz

seg-9ff066fb53a6 = ei koskaan

seg-63d4f00f622d = { "44.08" } dB-Hz

seg-58b097691919 = CW-sävel on syy siihen, että kaksi L1-signaalia eroavat toisistaan hetkellä { "40" } s. Se osuu C/A-spektrin huippuun ja pitää C/A:n tasolla { "17.98" } dB-Hz, kynnyksen { "25" } dB-Hz alapuolella. Se osuu MBOC-spektrin nollaan, joten Galileo E1 palaa nimelliseen C/N₀-arvoonsa, kun chirp loppuu.

seg-064579d5fbac = Signaalit itse ovat noin { "20" } dB kohinapohjan alapuolella, joten vesiputouskaavio näyttää pohjan ja häirintälähettimet; C/N₀-pylväät näyttävät, mitä hajotuksen purku palauttaa.

seg-023a7f163106 = Samat häirintälähettimet ohjaavat ketjutettua tehtävää tiedostossa <c1/> (katso <a1>CAMPAIGNS.md</a1>): kello on holdover-tilassa, kun chirp on päällä, ja vastaanotin siirtyy Galileo E1:een CW-sävelen alla.

seg-6b0edbfca134 = L-kaistan ulkopuolella

seg-63d1fd8043ed = <c1/> asettaa LEO-paikannus-, navigointi- ja ajoitussignaalit (PNT) neljälle kaistalle GPS L1 C/A:n ja Galileo E5a:n rinnalle, kullakin kaistalla oma häirintälähetin, { "60" } s aikajanalla. Vesiputouskaavio <c2/> on L-kaista; kolme merkintää <c3/> lisää UHF ({ "455" }–{ "475" } MHz), S ({ "2482" }–{ "2502" } MHz) ja C ({ "5005" }–{ "5035" } MHz).

seg-6818247b5863 = Hetkellä { "10" } s: CW-sävel UHF-kantoaallolla, vastaanotettuna −{ "120" } dBW.

seg-02de8390de31 = Hetkellä { "20" } s: L-kaista-esimerkin chirp ({ "16" } MHz L1:n ympärillä, { "9" } µs pyyhkäisyt, { "50" } mW etäisyydellä { "100" } m).

seg-47e55dfd4e0d = Hetkellä { "30" } s: laajakaistakohina, { "40" } MHz taajuuden { "1185" } MHz ympärillä, −{ "118" } dBW.

seg-dfa416032770 = Hetkellä { "40" } s: kapeakaistakohina, { "2" } MHz S-kantoaallolla, −{ "128" } dBW.

seg-1d119727a749 = Hetkellä { "50" } s: C-kaistan signaalin omaan spektriin sovitettu kohina, −{ "124" } dBW.

seg-abacb60b16a3 = Mitä ajo laskee (suunniteltujen signaalien C/N₀ on seurattavan komponentin arvo, joten nimellisarvo on kokonaisvastaanottotehon alapuolella seurattavan osuuden verran):

seg-1c921b6299e4 = edustava, BPSK({ "5" }), −{ "150" } dBW

seg-5331cde832fb = { "34.38" } dB-Hz

seg-35588b19fd72 = määrittelyn minimi

seg-7d3639369444 = { "3.38" } dB-Hz

seg-9eef1ec7858f = { "38.51" } dB-Hz

seg-c6743d980e6b = julkaistu suunnitelma, −{ "144.9" } dBW

seg-245bf7d080b3 = { "1190.51625" } MHz

seg-f2aed7e062bf = { "46.29" } dB-Hz

seg-c6a19eb8e0b9 = { "41.69" } dB-Hz

seg-a6f2bb955ca2 = edustava, BPSK({ "10" }), −{ "152" } dBW

seg-b9312cc881d2 = { "40.35" } dB-Hz

seg-03bb124d45d2 = Vain chirp vie signaalin pois (GPS L1 C/A, hetkestä { "20" } s). Muut häirintälähettimet heikentävät vain kaistaa, jonka ne spektrinsä kautta tavoittavat: esimerkiksi C-kaistan sovitetun kohinan SSC on −{ "71.87" } dB/Hz C-kaistan signaalin kanssa ja alle −{ "133" } dB/Hz jokaisen muun kaistan kanssa.

seg-a8bea652a85d = Sama koneisto ohjaa LEO-PNT-kestävyysskenaarioita (<a1>LEO-PNT.md</a1>):

seg-cf7bc2f52cad = <c1/> nostaa yhtä { "40" } MHz peittohäirintälähetintä taajuudella { "1185" } MHz { "5" } dB joka { "10" } s tasosta −{ "125" } dBW alkaen. GPS L5 menetetään askeleella −{ "105" } dBW, Galileo E5a tasolla −{ "100" } dBW ja Xona X5 tasolla −{ "95" } dBW, kun taas edustava LEO L-kaistan signaali, joka vastaanotetaan tasolla −{ "135" } dBW, seuraa yhä tasolla −{ "90" } dBW: vastaanotettu teho ostaa J/S-marginaalia desibeli desibeliltä.

seg-94b65c0e6087 = <c1/> on kampanjapyyhkäisy tyypin <c2/> ajosta L5-kaistan peittohäirinnän tehon yli (<a1>CAMPAIGNS.md</a1>).

seg-67279a0780e4 = <c1/> on ketjutettu kampanja, jonka vaiheet lukevat GNSS- ja LEO-C/N₀-arvot tyypin <c2/> ajoista S- ja C-kaistan paneeleilla.

seg-42b00ae14ffe = IQ, SigMF ja Welch

seg-3418c31c4318 = Osio <c1/> piirtää mallin yhdellä hetkellä kompleksisina vaihe- ja kvadratuurinäytteinä (IQ), kirjoittaa ne SigMF-tallenteeksi (<c2/> tai <c3/>), lukee tallenteen takaisin ja estimoi sen PSD:n Welchin menetelmällä (Hann-ikkuna, { "50" } % päällekkäisyys, keskiarvoistetut periodogrammit, tiheyteen skaalattu). Terminen kohina, signaalit ja kohinankaltaiset häirintälähettimet piirretään lokero kerrallaan mallin omasta tiheydestä; sävel ja chirp piirretään todellisina aaltomuotoina. Pelkillä kohinankaltaisilla häirintälähettimillä Welch-estimaatti on mallin lähellä, enintään { "0.1" } dB ero (mediaani). Jaksollinen chirp on viivaspektri pyyhkäisynopeudellaan, kaistareunojensa ohi ulottuvine väreineen ja häntineen, jotka tasainen malli jättää pois: mukana toimitetussa esimerkissä kokonaisteho täsmää { "0.02" } % sisällä, ja mediaanilokero eroaa { "0.5" } dB. Tilannekuva on analyysia varten kirjoitettu tiedosto; mitään ei lähetetä eikä radiolaitteistoa ohjata.

seg-a3b0a61b5efe = Osio <c1/> (vain natiivit koontiversiot) lukee todellisen SigMF-tallenteen polusta <c2/> (datatiedosto on oletuksena sama runko tunnisteella <c3/>), estimoi sen PSD:n ja tulostaa sen mallin rinnalle tallenteen taajuuksilla. SigMF-tiedostolla ei ole absoluuttista tehokalibrointia, joten raportti antaa mediaanipoikkeaman ja muodon, ei tasoa.

seg-04b08e06811d = WebAssembly-koontiversiossa tiedostojen luku ei ole käytettävissä; <c1/> ja <c2/> toimivat sivun antamilla tavuilla.

seg-69b384afe05d = Signaalien PSD:t ja SSC:t

seg-a65b87c51f05 = BPSK(n) pääkeila 2n × { "1.023" } MHz nollasta nollaan; BOC({ "1,1" }) -spektrin keilat keskitettyinä taajuuksille ±{ "1.023" } MHz (Betz { "2001" }); SSC:t −{ "61.86" } / −{ "64.87" } / −{ "67.88" } dB/Hz kohteille C/A×C/A, BOC({ "1,1" })×BOC({ "1,1" }), C/A×BOC({ "1,1" }) Parsevalin suljetuista muodoista, arvot julkaistujen −{ "61.8" } / −{ "64.8" } / −{ "67.8" } dB/Hz takana; Q = { "1" } (CW) ja { "1.5" } (sovitettu) (Kaplan & Hegarty §{ "9.4" }); tyypin <c1/> taulukon arvot ovat yhtä suuria kuin suljetut muodot: CW ja kapeakaistainen Q = { "1" }, laajakaistainen ja pyyhkäisty Q = { "2" } (valkoinen kohina pääkeilan yli, kaistan sisäinen teho normalisoitu; { "1" } versioon { "0.36" } asti)

seg-d2afc6e05969 = Vesiputouskaavio, J/S ja C/N₀-aikajana

seg-c44413d5a060 = Supistuu täsmälleen tyypin <c1/> ketjuun; häirintälähettimien tehot, aikajana ja kaistanleveydet ovat syötteitä

seg-304f4aeaf4cb = SigMF-koodekki ja Welch-estimaatti

seg-7a642dd02e5c = Edestakaiset ajot, suora diskreetti Fourier-muunnos, valkoisen kohinan ja Parsevalin identiteetit; repositoriossa ei ole kolmannen osapuolen tallennetta

seg-1138c9e62a21 = Monikaistainen vesiputouskaavio suunnitelluilla signaaleilla ja kaistakohtaisilla häirintälähettimillä

seg-ac38681004e9 = Supistuu L-kaistan ketjuun (yhden komponentin kaista antaa samat luvut kuin ennen laajennusta) ja validoituihin signaalispektreihin; suunnitellut signaalit, häirintälähettimet ja kaistanleveydet ovat syötteitä

seg-0c0c625a8ff5 = Yksi korjaus yleiseen oikopolkuun: BOC({ "1,1" }) -spektrin keilat ovat <em>keskitettyjä</em> taajuuksille ±{ "1.023" } MHz (kantoaallon nollan ja nollan { "2.046" } MHz välissä), mutta PSD:n maksimi on taajuudella ±{ "0.759" } MHz, jossa <c1/> kun <c2/>. Testit lukitsevat molemmat.

seg-6ab6e241f7e5 = Hajotuskoodin viivarakenne (C/A:n { "1" } kHz viivat): sävel pisteytetään tasaista verhokäyrää vasten, ei lähintä koodiviivaa vasten.

seg-4be08100a707 = Automaattinen vahvistuksen säätö, kvantisointi, pulssinsammutus ja lovisuodatus.

seg-0f195ea4126e = Vastaanottoantennin kuvio häirintälähettimen suuntaan yhtä vahvistuslukua tarkemmin.

seg-d3d03da9c962 = Monikäyttöhäiriö saman kaistan satelliittien välillä.

seg-db5c7566f49e = Suunnitellun signaalin päästöt sen lähetyskaistanleveyden ulkopuolella: sen spektri typistetään siellä, joten mikään kaistan ulkopuolinen päästö ei yllä naapurikaistalle.

seg-9cbea7151036 = Chirpin vaikutus silmukkaan pyyhkäisynopeuksilla, jotka ovat verrannollisia silmukan kaistanleveyteen: sen C/N₀ käyttää rivikeskiarvoistettua spektriä.

seg-d19ed16f451c = J. W. Betz, ”Binary Offset Carrier Modulations for Radionavigation,” <em>NAVIGATION</em> { "48" }({ "4" }), { "2001" }.

seg-e2225151c10b = E. D. Kaplan ja C. J. Hegarty (toim.), <em>Understanding GPS/GNSS: Principles and Applications</em>, 3. painos, Artech House, { "2017" }, §{ "9.4" }.

seg-85b2d251a221 = G. W. Hein ym., ”MBOC: The New Optimized Spreading Modulation Recommended for Galileo L1 OS and GPS L1C,” <em>Inside GNSS</em>, touko/kesäkuu { "2006" }.

seg-b091f7c36ab9 = P. D. Welch, ”The Use of Fast Fourier Transform for the Estimation of Power Spectra,” <em>IEEE Transactions on Audio and Electroacoustics</em> { "15" }({ "2" }), { "1967" }.

seg-b65142371229 = IS-GPS-200, IS-GPS-705; Galileo OS SIS ICD.

seg-d28b74d8c755 = SigMF-määrittely, <a1>https://sigmf.org/</a1> (lähde: <a2>https://github.com/sigmf/SigMF</a2>).

seg-a9b968473b2a = <s1>Edellinen</s1>Eheys ja tietoturva

seg-d5264da8bf65 = <s1>Seuraava</s1>ARAIM-viite
