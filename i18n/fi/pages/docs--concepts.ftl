# docs--concepts: translations (fi)

seg-501402fc366f = Kellon holdover

seg-9c0eb89a2fbe = Paketti

seg-41b3740e1db9 = Lähde: <c1/>

seg-8ab3fd09812d = Käsitteet — yleiskielinen johdanto

seg-0f86d0a815d2 = Tämä sivu selittää, <em>mitä Kshana tekee ja miksi</em>, lähtien tyhjästä ja edeten fysiikkaan. Ensimmäinen osa ei edellytä esitietoja; myöhemmät osiot lisäävät tarkat suhteet asiantuntijoille. Sanakohtaisia määritelmiä varten katso <a1>sanasto</a1>.

seg-34f76bad58cb = { "1" }. Ongelma yhdessä kappaleessa

seg-45c0199e2224 = Lähes kaikki, minkä on tiedettävä, <em>missä se on</em> tai <em>paljonko kello on</em> — puhelimet, ilma-alukset, alukset, satelliitit, sähköverkot, rahoitusjärjestelmät — nojaa navigointisatelliittien signaaleihin (GPS (Global Positioning System) ja sen sisarjärjestelmät, yhteisnimeltään <b>GNSS</b> (maailmanlaajuinen satelliittinavigointijärjestelmä)). Nämä signaalit ovat heikkoja ja katoavat helposti: ne häiritään, estetään tai ovat avaruudessa yksinkertaisesti poissa näkyvistä. Kun näin käy, järjestelmän on <b>jatkettava omillaan</b> käyttäen aluksella olevia antureita — kelloa ajan pitämiseen ja inertia-antureita liikkeen seuraamiseen. Kysymys, johon Kshana vastaa, on helppo esittää ja vaikea mitata: <b>kuinka kauan ja kuinka hyvin se voi jatkaa?</b>

seg-ea1895772e76 = { "2" }. Miksi ”kvantti”?

seg-dd6871645f37 = Aluksella olevat anturit ajautuvat. Kello menettää hitaasti aikaa; inertia-anturi menettää hitaasti paikan seurannan. <b>Kvanttikellot</b> ja kvantti-inertia-anturit ajautuvat <em>paljon hitaammin</em> kuin nykyisin käytössä olevat klassiset osat — joten ajoneuvo voisi rullata paljon pidemmän GNSS-katkon yli pysyen tarkkuusrajoissaan. Tämä etu on kvantti-PNT:n (paikannus, navigointi ja ajanmääritys) koko lupaus. Mutta ”paljon hitaammin” täytyy muuttaa <b>luvuiksi</b>: kuinka monta lisäminuuttia holdoveria? kuinka monta metriä vähemmän ajautumaa? Nämä luvut ratkaisevat, onko kvanttikuorma kustannuksensa, massansa ja tehonsa arvoinen.

seg-a5d9dc0fb159 = { "3" }. Mitä Kshana todella tekee

seg-cb3a35ba696f = Kshana on <b>simulaattori</b>, ei laitteisto eikä laitteistosuunnitelma. Se:

seg-cb7fdaf6738b = Ottaa <b>skenaarion</b> — aikajanan, jossa on GNSS-katko, ja anturin julkaistut suorituskykyluvut.

seg-701c8c6d0e55 = Ajaa <b>anturin virhemallin</b> tämän aikajanan läpi: kun GNSS on saatavilla, malli kurinalaistetaan totuuteen; katkon aikana se käy vapaasti ja kerryttää virhettä täsmälleen niin kuin fysiikka edellyttää.

seg-bc68e3d54e4c = <b>Pisteyttää</b> tuloksen toiminnallisia laatumittareita vastaan (kuinka suureksi virhe kasvaa, kuinka kauan se pysyy spesifikaatiossa, kuinka luotettava estimaatti on).

seg-32d31a9beb71 = Anturipaketeille tämä tehdään <b>kahdesti</b> — kerran kvanttianturille, kerran sen klassiselle vastineelle — <em>samalla</em> skenaariolla, joten vertailu on vertailukelpoinen.

seg-07d8c6eb84e9 = Ratkaisevaa on, että moottori ei tiedä mitään ”kvantista” vs. ”klassisesta”. Molemmat ovat vain virhemalleja, joilla on eri (julkaistut, viitatut) parametrit. Tulosteessa näkyvä ero on julkaistun fysiikan ero — mitään ei ole viritetty käsin yhden puolen eduksi.

seg-e20a7d3f32dc = { "4" }. Neljä rakennuspalikkaa (”paketit”)

seg-638b8d451550 = Anturi

seg-f891ee876b96 = Mihin se vastaa

seg-d1b122c389d4 = atomikello

seg-768230c2eb02 = Kuinka kauan <em>aika</em> pysyy tarkkana ilman GNSS:ää?

seg-029de6b99be0 = Inertiapaikannus (dead-reckoning)

seg-f66f2d7b1d6d = kiihtyvyysanturi (+ gyro)

seg-e067a035f656 = Kuinka nopeasti <em>paikka</em> ajautuu ilman GNSS:ää?

seg-9ef8f99ca6e4 = Ajansiirto

seg-1267f82791f9 = optinen / RF (radiotaajuus) -linkki

seg-6f240700790d = Kuinka tarkasti kaksi alusta voi jakaa ajan?

seg-90be2a6a29b1 = Hybridifuusio

seg-780cf1f1127e = kaikki yllä olevat

seg-6080a05ace19 = Pitääkö <em>yhdistetty</em> PNT-ratkaisu?

seg-3f74a708a746 = Hybridipaketti on huipennus: navigointiratkaisu tarvitsee <em>sekä</em> hyvän ajan <em>että</em> hyvän paikan. Se osoittaa, että optinen ajoituslinkki voi pitää jopa vaatimattoman kellon lukittuna — mikä tarkoittaa, että <b>inertia</b>-anturista tulee heikoin lenkki, ja juuri siinä kvanttikiihtyvyysanturi tuottaa hyötyä.

seg-5f55bb0fd7c5 = Neljän paketin ulkopuolella

seg-60191a2cd150 = Sama moottori ajaa paljon useampia <em>skenaariolajeja</em>; <c1/> listaa ne kaikki. Ne ulottuvat antureiden ulkopuolelle signaaleihin ja geometriaan, joista anturit riippuvat:

seg-995ed414d83d = <b>Missä satelliitit ovat</b> — ratalaskenta, tähdistösuunnittelu Maan, Kuun tai muun kappaleen ympärille sekä aurinkokunnan kappaleiden paikat.

seg-bc8abce2a748 = <b>Mitä vastaanotin näkee</b> — atsimuutista riippuva horisonttiprofiili (katu, laituri, vuono) korkeuskulmamaskin päällä sekä taivasgeometria, jonka se jättää: näkyvissä olevat satelliitit, niiden tarkkuuden heikkenemiskerroin ja virhe-ellipsi.

seg-b7a2c252c41c = <b>Mitä vastaanotin kuulee</b> — L-kaistan spektri häirintälähettimen alla, häirintä ja harhautus sekä seurantasilmukan lukituksen menetys.

seg-f354743045c4 = <b>Voiko vastaukseen luottaa</b> — eheyden valvonta (RAIM, vastaanottimen autonominen eheyden valvonta, ja sen kehittynyt muoto ARAIM) suojaustasoineen.

seg-69aa01a29a49 = <b>GNSS:n vaihtoehdot</b> — painovoima- ja maastokarttasovitus sekä paikannus, navigointi ja ajanmääritys matalan Maan kiertoradan (LEO) satelliiteista, signaalisuunnittelusta linkkibudjetin ja navigointiviestin kautta paikkaratkaisuun.

seg-297c98214b5b = <b>Ajoitus verkoille</b> — telealan holdover kansainvälisiä maskeja vasten tarkistettuna sekä aikaindeksoitujen aikataulujen slottiajoitus.

seg-7eba216a9bf2 = <b>Maan ulkopuolella</b> — kuun aika ja koordinaatistot, kuun palvelutilavuudet ja Marsin releenavigointi.

seg-b796f49570ed = <b>Monta ajoa kerralla</b> — kampanjat ketjuttavat lajeja yhdelle aikajanalle, pyyhkäisevät parametrin tai ajavat Monte Carlo -ensemblen.

seg-ef7f4e025018 = { "5" }. Rehellisyys rakenteena

seg-65fb8703baf9 = Simulaattori on hyödyllinen vain, jos siihen voi luottaa. Kshana on rakennettu niin, että voit:

seg-de8fd160db6d = <b>Jokainen parametri on viitattu.</b> Jokaisen anturiluvun mukana on merkkijono <c1/>, joka nimeää tietolehden tai artikkelin, josta se on peräisin. Ei anonyymejä vakioita.

seg-09d5cd11b127 = <b>Jokainen malli tarkistetaan oppikirjasuhteita vastaan,</b> ei vain itseään vastaan — esim. simuloidun kellon Allanin poikkeaman on vastattava julkaistua vakausarvoa, ja inertiaajautuman on vastattava standardia virheenkasvulakia. Ominaisuus kutsutaan <em>validoiduksi</em> vain, jos riippumaton ulkoinen oraakkeli (todellinen aineisto, riippumaton toteutus tai julkaistut viitevektorit) on samaa mieltä; loppu on <em>mallinnettua</em>, ja <a1>varmennusmatriisi</a1> kertoo, kumpi on kumpaa.

seg-ccb5b2fe93c4 = Kypsyys on merkitty.

seg-5a0ac98febed = <a1>VALIDATION.md</a1> merkitsee jokaisen ilmiön arvolla <c1/>, <c2/> tai <c3/> ja toteaa selvästi, että optisen kellon luvut ovat <em>laboratorio- / avaruustavoitelukuja</em> — mikään strontiumoptinen kello ei ole lentänyt.

seg-de463596fcdb = <b>Tulokset ovat toistettavissa bitintarkasti:</b> sama skenaario, siemenluku ja versio tuottavat aina identtisen vastauksen samalla alustalla; käyttöjärjestelmien välillä luvut täsmäävät suhteellisesti tarkkuudella { "1e-6" } (ks. <a1>REPRODUCIBILITY.md</a1>).

seg-f87dad1ffc98 = { "6" }. Fysiikka asiantuntijoille

seg-8fc6db9faf83 = Suhteet, jotka Kshana toteuttaa ja testaa (täydet yksityiskohdat ja toleranssit tiedostossa <a1>VALIDATION.md</a1>):

seg-ea61f869c266 = <b>Kellon holdover.</b> Kaksitilainen vaihe/taajuus-malli, jossa on valkoinen taajuusmodulaatio (white FM, tehotiheysspektri <c1/>), satunnaiskulku-FM (<c2/>), flicker-FM (log-välein asetettujen Ornstein–Uhlenbeck-prosessien summa, kalibroitu tasaiselle Allanin lattialle) ja deterministinen ikääntyminen. Validoitu limittäisellä Allanin poikkeamalla julkaistua <c3/> vastaan (Riley, NIST (National Institute of Standards and Technology) SP (Special Publication) { "1065" }).

seg-4f46754c399f = <b>Inertiapaikannus (dead-reckoning).</b> Kiihtyvyysanturin jäännösharha → <c1/>; nopeuden satunnaiskulku → <c2/>; valinnainen gyroharha ja kulman satunnaiskulku tuottavat kallistusvirheen, joka kytkee painovoiman (<c3/>) vaakakiihtyvyyteen (Groves).

seg-d59595d00f0a = <b>Ajansiirto.</b> Valkoinen ajoitusvärinä → synkronoinnin toistotarkkuus → yksisuuntainen etäisyysmittaus (<c1/>, { "1" } ps ≈ { "0.3" } mm); näytekeskiarvo keskiarvoistuu kuten <c2/>.

seg-0eb7a53fb4a6 = <b>Fuusio & eheys.</b> Kaksitilainen Kalman-suodatin, jonka prosessikohina vastaa totuusmallia; coastingissa sen vaihevirheen varianssi kasvaa täsmälleen arvoon <c1/> — analyyttinen holdover-suhde — ja sen 1-σ-raja syöttää eheyden laatumittaria.

seg-80daa7cb8641 = <b>Geometria.</b> Keplerilainen kahden kappaleen eteneminen (valinnaisesti sekulaarisella J2:lla) tai SGP4 (Simplified General Perturbations { "4" }) todellisista kaksirivisistä elementtijoukoista, Walker-tähdistöt ja näköyhteysnäkyvyys (Maan peitto + korkeuskulmamaski) johtavat GNSS-saatavuuden kiertoratageometriasta käsin kirjoitettujen ikkunoiden sijaan.

seg-4ce4c6b79b93 = { "7" }. Mihin seuraavaksi

seg-7c8344a26230 = Käy läpi: <a1>opetusohjelmat</a1> — kolme läpikäytyä esimerkkiä ja portaittaiset harjoitukset.

seg-277f1b435cf6 = Aja se: katso pikaopas tiedostossa <a1>README</a1>.

seg-c349981bd4f1 = Ymmärrä rakenne: <a1>ARCHITECTURE.md</a1>.

seg-f7acbf857c57 = Tarkista, mikä on ja mikä ei ole validoitua: <a1>VALIDATION.md</a1>.

seg-04a86ea674a5 = Etsi termi: <a1>GLOSSARY.md</a1>.

seg-4a73b906888b = <s1>Edellinen</s1>Yleiskatsaus

seg-2f14e84bfc99 = <s1>Seuraava</s1>Sanasto
