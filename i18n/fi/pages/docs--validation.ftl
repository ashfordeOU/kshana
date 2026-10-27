# docs--validation: translations (fi)

seg-70860389903a = Kello

seg-583dc9ff6178 = Kirjasto

seg-d01db1c2710a = Hakuteos

seg-619f89bf160c = Kuun koordinaatiston toteutus

seg-2db69c58f694 = Kuun differentiaalinen PNT

seg-2eb6d1b0483d = RAIM / ARAIM

seg-da3532b1444d = SBAS / DO-229E

seg-d3af26f389f5 = IONEX / Klobuchar

seg-d6476863f862 = Ominaisuus

seg-ad856ad710eb = Tila

seg-d12d4565b01d = Kuun geodeettinen VLBI, ydinpolku

seg-5ed34a5b402e = Kuun yhteinen monitekniikka-OD + kello

seg-4bcec6e2dd9f = Kuun navigointipalvelun tilavuus

seg-c04a3591074c = Kuun yhteentoimivuusvienti

seg-20fee61b3107 = Kvanttilaitteiden virhemallikirjasto

seg-eaf341ff4522 = GNSS-vapaa kvanttinavigointi

seg-75636f9419b2 = Tunnetut rajoitukset

seg-9c0eb89a2fbe = Paketti

seg-f63dd3d7aad4 = Lähde

seg-638b8d451550 = Anturi

seg-04f69a0edb2f = tyyppi

seg-b03d56f501c3 = Tyyppi

seg-35bf9a48e566 = Termi

seg-f3526b0d95f8 = Mitattu

seg-7634c6f4b32c = Yhteys

seg-b966dd26caa6 = Aineisto

seg-4fe4920a3fa1 = Standardi

seg-84430d202cd4 = Lähde: <c1/>

seg-028f26d1374e = <b>Toleransseista.</b> ”Validoitu” tarkoittaa alla, että kalibrointitesti varmistaa simuloidun tilaston vastaavan viiterelaatiota <b>pakotetun rajan</b> sisällä, joka on tällä hetkellä <b>{ "20" }–{ "25" } % suhteellinen virhe</b> (siemenkeskiarvoistettu) Allan-/kohinabudjettirelaatioille. Mediaanina havaittu yhtäpitävyys on usein paljon tiukempi (muutama prosentti), mutta <em>taattu</em> raja on raja, ei mediaani. Missä esiintyy luku kuten ”~{ "2" } %”, se on tyypillinen havainto, ei pakotettu toleranssi. Katso <a1>Väitteet vs. todellisuus</a1>.

seg-94a480ed9ccb = Ylennyssääntö

seg-a550784412a6 = Koneellisesti tarkistetun varmennusmatriisin rivi (<c1/>) on VALIDATED vain, kun oraakkeli, joka on <b>riippumaton Kshana-ohjelmistosta</b>, on yhtä mieltä toteutuksen kanssa <b>ennen vertailun ajoa ilmoitetun toleranssin sisällä</b> portissa ajettavassa testissä. Tämä osio on ainoa paikka, jossa sääntö on kirjoitettu auki; matriisi, rivikohtainen proosa ja julkaisutiedotteet noudattavat sitä.

seg-5e14faed9f05 = Hyväksytyt oraakkelityypit

seg-4297b6a1b385 = Mikä kelpaa

seg-a42c0c36b37f = Matriisissa jo olevia esimerkkejä

seg-e39aeb132e03 = Todellista mitattua dataa suureesta, jota rivi väittää: havainto fyysisestä maailmasta, ei mallin tuloste.

seg-e77977db9de1 = Todellisen cesiumkellotallenteen sinetöidyt kaksi kolmasosaa; arkistoidut Kuun laseretäisyysmittauksen normaalipisteet; BIPM:n (International Bureau of Weights and Measures) Circular T UTC(k) -sarja; SRTM:n (Shuttle Radar Topography Mission) maastolaatta.

seg-6325fe1fafaf = Riippumaton kolmannen osapuolen kirjasto tai työkalu, joka laskee <b>yksikäsitteisesti määritellyn</b> suureen samoilla syötteillä, kun kirjasto toteuttaa alan laskennan itse. Kirjastojen välinen yhtäpitävyys on aito tarkistus vain siksi, että suureella on yksi oikea vastaus.

seg-a9cd35495601 = allantools, Orekit, ANISE, RTKLIB, gnss_lib_py, lamberthub, pymcdm, scikit-learn, SciPy-kirjaston tilastolliset jakaumat.

seg-056adffae706 = Julkaistuja viitevektoreita, -taulukoita tai varmennusesimerkkejä: lukuja, jotka standardi, virasto tai viiteteksti painaa, jotta toteutuksia voi verrata niihin.

seg-991fb822e99c = SOFA/ERFA (Standards of Fundamental Astronomy) -vektorit, AIAA:n (American Institute of Aeronautics and Astronautics) SGP4-varmennusvektorit, ITU-R:n (International Telecommunication Union, Radiocommunication Sector) validointiesimerkit, Working Group C:n ARAIM-läpikäyty esimerkki, JPL:n (Jet Propulsion Laboratory) Horizons.

seg-2a774e48055a = Kaksi muuta standardia ratkaisee rajatapaukset. Molemmat on otettu käyttöön julkaisussa { "0.30" }.

seg-f5c6cf536ba1 = <b>P1, julkaistu laskettu arvo.</b> Julkaistu laskettu arvo, joka on laskettu samasta suljetusta muodosta, jonka rivi toteuttaa, lasketaan julkaistuksi viitevektoriksi, kun julkaisu on riippumaton Kshana-ohjelmistosta ja vertailu kiinnittää ilmoitetun toleranssin. Arvon on oltava painettu lukuna julkaisussa (kuvaajasta luettu arvo kelpaa vain, jos lukuepävarmuus on ilmoitetun toleranssin sisällä), ja testin on laskettava se Kshana-ohjelmistolla julkaisun syötteistä; vakion vertaaminen asiakirjaan, josta se kopioitiin, on transkriptiotarkistus, ei P1.

seg-0b043b552e76 = <b>P2, riippumaton numeerinen kirjasto.</b> Riippumaton numeerinen kirjasto, kuten numpy tai LAPACK (Linear Algebra PACKage), joka laskee uudelleen yksikäsitteisesti määritellyn lineaarialgebrasuureen ilmoitetuilla syötteillä, lasketaan riippumattomaksi kirjastoksi. Kirjaston on suoritettava hajotelma-, käänteis-, ratkaisu- tai pienimmän neliösumman vaihe omalla algoritmillaan, syötteillä, jotka on tallennettu fikstuurin mukana; validoitu väite on tällöin lineaarialgebra näillä syötteillä, ei edustavan skenaarion fysikaaliset suuruudet. Skripti, joka arvioi skalaarisen suljetun muodon uudelleen numpy-aritmetiikalla, on meidän oman toteutuksemme toinen toteutus, ei P2.

seg-b7911d589f7a = Kaikkiin tyyppeihin sovellettavat ehdot: oraakkelia ei ole kirjoittanut, ajanut tai julkaissut tämä projekti (tämän repositorion oma julkaisusarja ei siis ole siitä riippumaton); toleranssi on testissä ja oli lukittu ennen ensimmäistä vertailua; dataan sidottu testi, joka ohitetaan, kun sen julkinen data puuttuu, kertoo siitä ohittaessaan.

seg-7e6057a2cad7 = Mikä ei kelpaa

seg-80cfbb204767 = <b>Oma toinen toteutuksemme</b>: toinen koodipolku tässä crate-paketissa (<c1/>) tai tämän repositorion skripti, joka arvioi saman suljetun muodon uudelleen.

seg-d6efaf8399f9 = <b>Yhtäpitävyys oman aiemman tulosteemme kanssa</b>: golden-tiedostot, regressiolukitukset, tilannekuvat tai taulukko tämän projektin omista julkaisuista.

seg-4d0365b383e5 = <b>Viitteen vakioiden transkriptio</b>: kertoimen, esiasetuksen, datalehden luvun tai parametrilehden tarkistaminen asiakirjaa vasten, josta se kopioitiin.

seg-3bf8025077fb = <b>Suunnitteluvalinta</b>: allokaatio, painotus, kynnys, hälytysraja tai edustava skenaario. Valinnalle ei ole ulkoista totuutta.

seg-4f0aafd7166e = <b>Sisäinen identiteetti</b>: numeerinen integraali omaa analyyttistä muotoaan vasten, edestakainen muunnos, inversio, ominaisuus- tai monotonisuustesti.

seg-4f4408e4ebab = <b>Integraatioajo oikeaa isäntää vasten</b> (<c1/>): liitännäisen lataaminen oikeaan Signal K -palvelimeen tai OpenCPN:ään, tai oikean portin tulosteen syöttäminen TCP-kuluttajalle ja sen tarkistaminen, että isäntä hyväksyy syötteen ja näyttää odotetun tilan. Se osoittaa, että putkisto toimii. Isäntä ei ole oraakkeli millekään arvolle, jota integraatio kuljettaa, joten ei ole mitään ulkoista vertailukohtaa, ja tällainen rivi (meriliikenneintegraatioiden rivi) on MODELLED, ei VALIDATED. Tyyppi <c2/> on oma oraakkelityyppinsä, sallittu vain riveillä, joiden taso on MODELLED: testi <c3/> tiedostossa <c4/> epäonnistuu, jos rivillä, jonka taso on VALIDATED, on se, ja <c5/> vaatii jo, että jokaisen rivin, jonka taso on VALIDATED, tyyppi on <c6/>.

seg-a39a87c56a16 = <b>Uskottavuus todellisilla syötteillä</b>: todellista dataa käytetään vain syötteenä, väittämillä suuruusluokasta eikä vertailulla ulkoiseen arvoon.

seg-db6f5d98b4ef = Toleranssi, joka on valittu vertailun näkemisen jälkeen.

seg-f4f18b7549df = Kuinka sääntöä valvotaan

seg-19a62c7e0aee = Jokainen rivi, jonka taso on VALIDATED, ilmoittaa funktiossa <c1/> tiedostossa <c2/>, mihin tyyppiin se perustuu (Measured, Library, Reference, P1 tai P2), riippumattoman lähteen (lainattu rivin oman oraakkelitekstin mukaan) ja yhden testin, joka kantaa vertailun. Taulukon vieressä olevat yksikkötestit epäonnistuvat, kun rivi, jonka taso on VALIDATED, on ilmoittamatta tai ilmoitettu kahdesti, kun ilmoitus nimeää rivin, jonka taso ei ole VALIDATED, kun ilmoitettu lähde ei ole se, jonka rivin oma oraakkeliteksti nimeää, tai on Kshana itse, kun ilmoitettu testi ei ole sellainen, jonka rivi siteeraa, tai kun P2-rivi ei nimeä riippumatonta numeerista kirjastoa. Tiedosto <c3/> vaatii sitten, että ilmoitettu testi on olemassa levyllä todellisena testinä (<c4/>), jota ei ohiteta. Konetta ei voi tarkistaa sitä, vertaako nimetty testi ilmoitettua lähdettä vasten; se jää ihmisen luettavaksi. Tyyppikohtaisia lukumääriä ei kirjata tähän: taulukko on lähde.

seg-e8ae3e380f40 = Olemassa olevat rivit, joiden taso on VALIDATED, tarkasteltuna uudelleen säännön alla

seg-1dd44545a67a = Sääntöä sovellettiin olemassa oleviin riveihin sekä tuleviin ylennyksiin.

seg-38db7b6e7053 = <b>Validointitutkimuksen { "0.30" } nimeämät P1-rivit, kukin tuettu:</b> Yhdensuuntainen linkkibudjetti (JPL Pub 82-76 Galileo X-kaistan suunnittelun ohjaustaulukko, koottu uudelleen rivikohdistaan { "4.6e-3" } dB:n vapaan tilan vaimennukseen asti); Kaistarajoitetut suljetut muodot mille tahansa etäisyysmittaussignaalille ({ "90.3" } prosenttia pääkeilatehosta ja julkaistu koherentti early-late-jitter); Matalan Maan kiertoradan navigointisatelliitin suurin Doppler (julkaistut Xona Pulsar X1- ja Iridium-luvut); LEO- tai MEO-radalta staattisen käyttäjän näkemä suurin Doppler (Pulsar-julkaisun taulukko { "1" }, { "20" } arvoa); Doppler, jota maavastaanottimen on käsiteltävä LEO-navigointisatelliitilta (samat julkaistut luvut lennetyltä radalta). Jokainen julkaisu on riippumaton Kshana-ohjelmistosta, painaa lukunsa, ja testi ilmoittaa toleranssinsa.

seg-8e38103d05d6 = <b>Uudelleentarkastelussa löydetyt muut P1:een perustuvat rivit, kukin tuettu:</b> Etäisyysmittauskoodin suunnittelukompromissi (julkaistu −{ "23.9" } dB:n Gold-ristikorrelaatio); Kuun koordinaattiaika (Ashby ja Patla { "2024" }, jonka Kuun nopeuden ristiintarkistus DE440:aa vasten on kirjastotarkistus); Suljetun muodon L-kaistan signaalin tehospektritiheydet (Kaplanin ja Hegartyn Q-arvot); Ensimmäisen kertaluvun ionosfäärin viive kaistaa kohti (IS-GPS-200:n ryhmäviiveen suhde); Maailmanlaajuisen keskiarvon signal-in-space-etäisyysvirheen painot (Montenbruckin, Steigenbergerin ja Hauschildin { "2018" } taulukko).

seg-0014c53752ac = <b>Tutkimuksen nimeämät P2-rivit, kukin tuettu:</b> Fisher-informaatio ja Cramér–Rao-havaittavuus (numpy-funktiot <c1/>/<c2/>); Kuun datumin tunnistettavuus; Kytketty Kuun koordinaatiston ja aikaskaalan gauge; Autonominen vapaan verkon vian havaittavuuden putki (numpy/SciPy SVD, singulaariarvohajotelma). Kukin laskee yksikäsitteisesti määritellyn lineaarialgebrasuureen uudelleen kommitoiduilla syötteillä eri algoritmilla kuin Kshana-ohjelmiston Jacobi-ominaisarvoratkaisija.

seg-e9d01633d002 = <b>Uudelleentarkastelussa löydetyt muut P2:een perustuvat rivit, kukin tuettu:</b> MCDA (monikriteeripäätösanalyysi) -prioriteettien johtaminen (AHP, analyyttinen hierarkiaprosessi, ominaisvektori SciPy/LAPACK-kirjastoilla; myös toistettu Random Index -taulukko on transkriptio eikä sitä lasketa); Kellon holdover-ajautumisen varianssi (SciPy-funktio <c1/> Van Loan -laajennetusta matriisista); Kuun koordinaatiston realisointi (numpy SVD Umeyama-ratkaisu); CRPA (hallitun vastaanottokuvion antenni) -keilanmuodostus (LAPACK-kirjaston kompleksiratkaisu); Kuun ARAIM-suojaustasoydin (RTKLIB:n LU-käänteismatriisi SciPy-kvantiileilla); Palveluntarjoajien välinen Kuun koordinaatisto-/dynamiikkajohdonmukaisuus (kolmen julkaistun efemeridin numpy SVD -pienimmän neliösumman sovitus).

seg-1fd94e94e89d = <b>Ensimmäisellä läpikäynnillä liputettu, uudelleen perusteltu kierroksella { "2" } ajossa { "0.30" }.</b> Kolme riviä liputettiin kirjoitetun säännön tukemattomina. Kukin perustuu nyt vertailuun, joka ennakkorekisteröitiin ennen fikstuurin hakemista, joten yhtään riviä ei ole liputettu; yksikkötesti kohdan <c1/> vieressä lukitsee (nyt tyhjän) luettelon.

seg-3ef9479dea55 = <b>Eheys (RAIM/ARAIM/SBAS).</b> Siteeratut testit väittivät ennen vain uskottavuutta todellisella IGS:n (International GNSS Service) geometrialla. Rivi perustuu nyt kolmeen kirjasto-oraakkeliin: Airborne Design Document v4.2:n ARAIM-monihypoteesiratkaisuerotus Stanford MAAST -työkalua vasten ARAIM { "2" } varten ({ "270" } todellista tapausta, pahin VPL-ero { "2.2e-3" } m vs. { "0.05" } m); snapshot-RAIM:n havaitseminen ja poissulkeminen RTKLIB:n <c1/> vasten ({ "2016" } päätöstä, yhteensä { "2016" }, identtistä) kaltevuussuojaustasolla; ja SBAS DO-229E L1 -suojaustasot Stanford MAAST -työkalua vasten todellisilla WAAS-lähetyksillä ({ "2868" } paria { "1.6e-5" } m sisällä). Rivi sanoo suoraan, että tasasigma-funktiot <c2/> ja <c3/> eivät ole ADD:n vaatimusten mukaisia ja että kaksitaajuisen L5 SBAS -vertailun tulos on havainto.

seg-16a4261c77ec = <b>Planeettojen sijainnit aurinkokunnassa JPL:n Standishin Kepler-elementeistä.</b> Jälkikäteinen kynnys, kaksinkertainen nimellinen virhe, on korvattu ennakkorekisteröidyllä kynnyksellä: RMS enintään Explanatory Supplement -taulukon { "8.10.1" } luku planeettaa ja komponenttia kohti, JPL Horizons DE441:tä vasten, Maan jako ja ICRF-kierto mukaan lukien.

seg-8d5b51a942e0 = <b>Valoaika aurinkokunnan kappaleiden välillä.</b> Valoaikaratkaisija verrataan nyt Horizonsin valoaikoihin { "1e-6" } s sisällä DE441-sijainneilla, ennakkorekisteröity kynnys, joka ei peri sijaintikynnystä.

seg-e96900bc322f = <b>Rivit, joiden taso on MODELLED ja jotka kaksi käytäntöä tekevät ylennettäviksi</b> (vain rivi riviltä etenevän ajon { "0.30" } kautta, ei koskaan tämän tekstin perusteella): P1:n alla lähettimen TDOA/FDOA (time and frequency difference of arrival) -paikannusraja, relativistinen kellotaajuuden ja koordinaatiston kytkentä, ITU-T:n (Telecommunication Standardization Sector) synkronointimaskit (vain maskiarvoille, jotka suositukset painavat lukuina; itseään vasten tarkistetut transkriboidut taitepisteet eivät lasketa) ja 5G:n ei-maanpäällisen verkon paikannusraja (vain jos julkaistu laskettu luku löytyy); P2:n alla yhteismoodisen eheyden sokeus, skalaarinen MHSS:n (multiple-hypothesis solution separation) ajoituksen suojaustaso ja GLS:n (generalised least squares) valkaisu. Kaksi ajoituseheyden benchmark-riviä (Stanford-eheysdiagrammin luokittelija ja eheyskattavuuden pisteyttäjä) ovat sääntöpohjaista luokittelua, ei lineaarialgebraa, joten P2 ei ulotu niihin; ne tarvitsevat riippumattoman työkalun, ja ainoa löydetty (gLAB) on ei-kaupallisella lisenssillä.

seg-50a08fe5918b = <b>Yhdenmukaisuus aiempien hylkäysten kanssa.</b> Laukaisuikkunan rivin Vallado-tarkistus kelpaisi nyt P1:n alla, jos sen testi laskee painetun esimerkin; suunnitelma { "0.30" } ylentää sen Orekit-kirjaston kautta. Kellolajikohtainen Kuun aikojen ristikkäisyystaulukko pysyy MODELLED: taulukko, jonka se toistaa, on peräisin tämän projektin omasta julkaisusta, joka ei ole riippumaton.

seg-02423542480f = Kohinatermi

seg-2bd49b92f14b = Allan-estimaattorin pariteetti (ADEV/MDEV/TDEV/OHDEV (ADEV: Allanin poikkeama; MDEV: modifioitu Allanin poikkeama; OHDEV: limittäinen Hadamard-poikkeama))

seg-c429a25d17ae = Kaksi ensisijaisen lähteen tarkistusta <b>NIST:n (National Institute of Standards and Technology) SP:tä (Special Publication) { "1065" }</b> vasten (Riley, <em>Handbook of Frequency Stability Analysis</em>, { "2008" }), molemmat <b>{ "1e-4" }</b> suhteelliseen toleranssiin. ({ "1" }) <c1/>: limittäinen ADEV, modifioitu ADEV, aikapoikkeama ja limittäiset Hadamard-estimaattorit toistavat poikkeamat kanonisella 10-pisteisellä <b>NBS14</b>-aineistolla (<b>SP { "1065" } taulukko 29/30, s. { "107" }</b>) arvoilla tau = { "1" }, { "2" } — yhtäpitävyys on todellisuudessa ~{ "1e-6" } (esim. limittäinen ADEV (OADEV) arvolla τ = { "2" }: { "85.952868" } vs { "85.95287" }). ({ "2" }) <c2/>: samat neljä estimaattoria toistavat <b>SP { "1065" } §{ "12.4" } 1000-pisteisen aineiston</b> (<b>taulukko { "31" }, s. { "108" }</b>) keskiarvotuskertoimilla { "1" } / { "10" } / { "100" }, missä aineisto generoidaan koodissa uudelleen SP { "1065" } LCG:stä (yhtälö { "73" }) — hermeettinen, ei fikstuuria. Sama aineisto ja taulukon 31 luvut ovat regressiotavoite aewallin/allantools-kirjastossa (<c3/>), toistettuna tässä ilman kolmannen osapuolen koodia. Tämä lukitsee <em>estimaattorin matematiikan</em> viitettä vasten, erillään alla olevista kohinan <em>kalibrointiriveistä</em>.

seg-79e6f7d1e7f0 = Allan-estimaattorin pariteetti <b>todellisella mitatulla laitteistolla</b>

seg-8c72a9df2547 = <c1/>: limittäinen Allan- ja limittäinen Hadamard-estimaattori toistavat <b>Stable32</b>-viitepoikkeamat <b>todelliselle 5071A-cesium-primäärinormaalille, joka on mitattu vetymaseria vasten</b> ({ "556 990" } vaihenäytettä arvolla τ₀ = { "1" } s; { "1" } PPS (pulssi sekunnissa) 53230A-laskuriin, helmikuu { "2014" }; kerännyt A. Wallin, jaettu paketin <c2/> mukana). Tarkistettu <b>koko dekadi-τ-tikkaiden yli ({ "16" } keskiarvotuskerrointa, τ = { "1" } s … { "4" }×10⁴ s)</b>: hyvin näytteistetyt kertoimet <b>{ "1e-3" }</b> suhteelliseen rajaan (havaittu yhtäpitävyys on todellisuudessa ≤ { "3e-5" }, esim. OADEV({ "1" } s) { "3.317111e-10" } vs Stable32 { "3.3171e-10" }), pitkän τ:n harvat kertoimet vaadittiin osumaan Stable32:n painaman { "1" }‑σ-luottamusvyöhykkeen sisään. Tämä täydentää yllä olevaa synteettistä NBS14-pariteettia mitatun kellon tarkistuksella. Raakavaihetiedosto on kolmannen osapuolen dataa ilman uudelleenjakolisenssiä, joten se on git-ignoroitu; <c3/> tuottaa sen ja testi tulostaa ohitusilmoituksen (CI (jatkuva integrointi) pysyy vihreänä), kun se puuttuu. Vain julkiset Stable32-viitenumerot on kommitoitu (<c4/>); kolmannen osapuolen koodia ei käytetä.

seg-1a7f0e741913 = Allan-estimaattorin pariteetti <b>kanonisella Stable32 PHASE.DAT -aineistolla</b>

seg-00e382874a00 = <c1/>: limittäinen Allan-, modifioitu Allan- ja aikapoikkeama-estimaattori toistavat <b>Stable32</b>-viitepoikkeamat aineistolle <b>PHASE.DAT</b> — Stable32:n mukana jaettu 1001-pisteen sarja, jota riippumattomat työkalut (esim. <c2/>) käyttävät vakioregressiotavoitteenaan — <b>koko keskiarvotuskerroinvalikoiman ({ "139" } kerrointa)</b> yli <b>{ "1e-3" }</b> suhteelliseen rajaan (havaittu ≤ { "5e-5" }). Toinen, riippumaton todellinen viitesarja yllä olevan mitatun cesium-tarkistuksen rinnalla. PHASE.DAT toimitetaan kaupallisen Stable32-työkalun mukana, joten raakasarja on git-ignoroitu; <c3/> tuottaa sen ja testi ohitetaan vihreänä (CI pysyy vihreänä), kun se puuttuu. Vain julkiset Stable32-viitenumerot on kommitoitu (<c4/>); kolmannen osapuolen koodia ei käytetä.

seg-9dde9e0c8055 = Optisen kellon vakaus <b>todellisella mitatulla käyrällä</b>

seg-ea908ba3a79f = <c1/>: kellokohinan parametrien inversio (<c2/>) toistaa <b>Norcia et al., <em>Science</em> { "366" }:{ "93" } ({ "2019" }) julkaisun ⁸⁸Sr-optisen hilakellon σ_y(τ)</b> (Zenodo 10.5281/zenodo.3382347, <b>CC-BY-4.0</b> (Creative Commons Attribution { "4.0" }), käyrä toimitettu mukana polussa <c3/>): palautettu valkoisen taajuuden kerroin √q_wf ≈ { "4.33e-16" } vastaa artikkelin ≈4.7e-16/√τ lyhytaikaista vakautta (~{ "10" } % RMS (neliökeskiarvo) käyrän yli) ja sovite havaitsee nollasta poikkeavan mitatun lattian (q_rw > { "0" }). Tämä lukitsee <b>mitatun ADEV:n → kohinaparametrien inversion todellista optista kelloa vasten</b>; sen päälle rakennettu kynnykseen asti kestävän holdoverin hyöty pysyy MODELLED.

seg-e1e930dcd0a1 = Poikkeamien havaitsemisen ROC (vastaanottimen toimintakäyrä) AUC (käyrän alle jäävä pinta-ala) <b>todellisella ESA:n (European Space Agency) OPS-SAT-telemetrialla</b>

seg-2b637daa985c = <c1/> (toistaa merkinnät)

seg-c667434b580d = <c1/>: <b>OPSSAT-AD</b>-aineistolla (Ruszczak et al. { "2025" }, Zenodo 10.5281/zenodo.12588359, <b>CC BY { "4.0" }</b>) — todellisia OPS-SATin huoltosegmenttejä totuusarvoisilla poikkeamamerkinnöillä — Kshana-ohjelmiston Mann–Whitney-ROC-AUC (<c2/>) toistaa <b>scikit-learn-kirjaston funktion <c3/></b> tuloksen <b>< { "1e-9" }</b> sisällä pidätetyllä testijaolla ({ "529" } segmenttiä, { "113" } poikkeamaa), kahdelle deterministiselle pisteelle: läpinäkyvä yhden piirteen ilmaisin (segmentin huippujen lukumäärä, <b>AUC ≈ { "0.851" }</b>) ja 8 piirteen diagonaalinen Mahalanobis-piste, joka on sovitettu normaaleille harjoitussegmenteille (AUC ≈ { "0.556" }); <c4/> ympäröi pistearvion luottamusvälillä, jonka alaraja ylittää sattuman. Tämä validoi <b>AUC-laskennan todellisella ESA-datalla</b> ja läpinäkyvän ilmaisimen <b>merkityn erottelun</b> — se <b>ei</b> toista OPSSAT-AD-artikkelin parasta julkaistua mittaria (ohjattu FCNN (täysin kytketty neuroverkko), F1 ≈ { "0.95" }), joka vaatii heidän koulutetun mallinsa. CC-BY-data mukana (<c5/>, hermeettinen); oraakkeli generoitu uudelleen tiedostolla <c6/>.

seg-5f2d41617fb2 = Gravitaatiokentän funktionaalien synteesi (gravitaatioavusteinen / GNSS-vapaa (GNSS: maailmanlaajuinen satelliittinavigointijärjestelmä) navigointikartta)

seg-4c1126137428 = <c1/>: pallofunktiopohjainen gravitaatiofunktionaaliydin (<c2/> / <c3/>) — ”kartanlukija”, jota vasten gravitaatioavusteinen navigaattori täsmää — on validoitu <b>GRS80:n (Geodetic Reference System { "1980" }) normaalipainovoimastandardia</b> vasten (Moritz { "1980" }, IAG:n hyväksymä (IAG: International Association of Geodesy)). GRS80-normaalikentän rakentaminen sen julkaistuista parillisista vyöhykeharmonisista J₂…J₈ ja painovoiman (gravitaatio + keskipakoisvoima) synteesi ellipsoidilla toistaa suljetun muodon <b>Somigliana</b>-normaalipainovoiman sekä julkaistut päiväntasaajan/napojen arvot γ_e = { "9.7803267715" } / γ_p = { "9.8321863685" } m/s² suhteellisella tarkkuudella <b>{ "3.5e-12" }</b> kaikilla leveysasteilla (raja { "1e-9" }). Sama ydin lataa lippulaivan <b>todellisen ICGEM:n (International Centre for Global Earth Models) Maa-mallin EGM2008 (Earth Gravitational Model { "2008" })</b> (NGA:n (National Geospatial-Intelligence Agency) julkinen aineisto ICGEM:n kautta; lukijaa (<c4/>) harjoitetaan myös GRAILin (Gravity Recovery and Interior Laboratory) Kuun kentällä tiedostossa <c5/>) ja tuottaa fysikaalisesti rajatun gravitaatiohäiriökartan (RMS ≈ { "26" } mGal, maks. ≈ { "89" } mGal asteluvulla/kertaluvulla { "70" }). Validoi <b>synteesikoodin oikeellisuuden</b>; gravitaatioavusteisen <em>navigointiratkaisun tarkkuus</em> pysyy MODELLED (ei julkista gravimetri-alustalla -rataa totuusdatalla).

seg-7dc3ff4c6eea = Kohinatyyppikohtainen edf (luottamusvälit)

seg-7e8a93fb2eea = <c1/>: kunkin limittäisen ADEV-pisteen χ²-luottamusvyöhyke käyttää kohinatyyppikohtaisia efektiivisiä vapausasteita (NIST SP { "1065" } taulukon { "5" } suljetut muodot valkoiselle ja välkyntävaihemodulaatiolle, valkoiselle ja välkyntätaajuusmodulaatiolle sekä satunnaiskävelytaajuusmodulaatiolle (WPM/FPM/WFM/FFM/RWFM) — Stable32:n yksinkertainen joukko), ja tallenteen potenssilakityyppi tunnistetaan sen MDEV-log-log-kulmakertoimesta. Kolme riippumatonta tarkistusta: (a) viisi kaavaa toistavat käsin lasketut arvot kohdissa N={ "64" },m={ "4" } tarkkuudella { "1e-12" }; (b) <b>Monte Carlo -valkoisen FM:n (FM: taajuusmodulaatio) joukko</b> ({ "4 000" } tallennetta) mittaa estimaattorin todellisen khiin neliö -edf:n = { "2" }·mean²/Var(σ²) ja täsmää kaavaan { "20" } %:n sisällä (ja voittaa selvästi konservatiivisen ei-limittäisen lukumäärän); (c) <c2/> toistaa painetun <b>SP { "1065" } taulukko { "32" } (s. { "109" })</b> edf = { "146.177" } 1000-pisteiselle aineistolle arvolla m={ "10" } (valkoinen FM) tarkkuudella { "5e-3" } ja taulukon { "95" } %:n luottamusrajat ({ "8.223942e-2" } / { "1.035201e-1" }) tarkkuudella <{ "0.2" } % (pieni jäännös on Wilson–Hilferty-χ²-approksimaatio vs NIST:n tarkka χ²). Viety ADEV-käyrä sisältää tunnistetun kohinatyypin, edf:n ja { "95" } %:n vyöhykkeen kullakin τ:lla.

seg-7048ac695b99 = Valkoinen FM (lyhytaikainen)

seg-b6982cb2ca25 = <c1/>: simuloitu limittäinen ADEV toistaa julkaistun sigma_y({ "1" } s) — tyypillisesti muutaman prosentin sisällä, <b>pakotettu raja { "20" } %</b> (CSAC ja optisen hilan tavoite) — ja valkoisen FM:n käyrän sigma_y(tau)=sigma_y(1s)/sqrt(tau) arvoilla tau = { "1" }, { "10" }, { "100" } s <b>{ "25" } %:n rajan</b> sisällä (vastaa CSAC:n (sirutason atomikello) datalehden arvoja { "3e-10" } / { "1e-10" } / { "3e-11" }).

seg-11fc7c4b61ff = Satunnaiskävely-FM (pitkäaikainen)

seg-1e211f342e79 = <c1/>: simuloitu ADEV vastaa kaavaa sigma_y^{ "2" }(tau)=q_rw*tau/3 (Riley NIST SP { "1065" }) noin { "20" } %:n tarkkuudella (siemenkeskiarvoistettu).

seg-dcfca4041429 = Vanheneminen / lineaarinen ajautuminen

seg-2d5c6a44cbdb = <c1/> + kalibroitu pois

seg-492f91ba2f79 = Deterministinen; holdover-estimaattori poistaa offsetin ja vanhenemisen neliöllisellä ennustajalla, joten jäännös on stokastinen raja. Testattu tiedostoissa <c1/> / <c2/>.

seg-2ea6a14cac1c = Kalman-estimaattori + eheysraja

seg-8c8f8a5eba5a = <c1/>: kaksitilainen (vaihe, taajuus) suodatin, jonka tarkka van Loan -prosessikohina vastaa totuusmallia; ajautuminen toistaa analyyttisen holdover-varianssin <c2/> tarkkuudella { "1e-9" }. Kovarianssipäivitys on <b>Joseph-stabiloidussa muodossa</b> <c3/>, joka pysyy positiivisesti semidefiniittinä (Cholesky-tarkistettu) { "500" } ennuste-/päivitysaskeleen läpi äärimmäisellä suhteella <c4/>, ja on samaa mieltä naiivin muodon kanssa { "1e-9" } tarkkuudella siellä, missä jälkimmäinen on hyvin ehdollistettu. Ajokerros raportoi eheyden (Integrity) katko-näytteiden osuutena 3-sigma-suojausrajan sisällä (<c5/>).

seg-f332f06e80f9 = Suodattimen itsejohdonmukaisuus (NIS (normalisoitu innovaationeliö) / NEES (normalisoitu estimointivirheneliö))

seg-333e1701b6d0 = <c1/> (malli)

seg-c1304de95180 = <c1/>: Monte Carlo -johdonmukaisuusarviointi (Bar-Shalom §{ "5.4" }). Sovitetun suodattimen yhdistetty <b>NIS → { "1" }</b> ja <b>NEES → { "2" }</b> asettuvat { "95" } %:n χ²-vyöhykkeidensä sisään (NIS-vyöhyke käyttää yhdistettyä valkoisten innovaatioiden lukumäärää; NEES-vyöhyke riippumattomien ajojen lukumäärää, koska estimointivirheet ovat ajallisesti korreloituneita). <b>Q/R-epäsuhtapyyhkäisy</b>-testi varmistaa, että valvonta raportoi <c2/> vain yksikköviritystä käytettäessä ja <c3/> väärissä viritysarvoissa ×0.1/×0.5/×2/×{ "10" }, NIS skaalautuen ≈1/q_factor johdetusti. Näkyy kenttänä <c4/> kellotuloksen JSON-tiedostossa (JavaScript Object Notation) ja leikkikenttäkortissa. χ²-vyöhykkeet käyttävät Wilson–Hilferty-kvantiilia (<c5/>, taulukkotarkistettu).

seg-078c4009b24f = Kaksisuuntainen ajansiirtomalli

seg-22f8cdeda335 = <c1/>: vastavuoroinen yhteismuotoinen viive kumoutuu täsmälleen estimaatissa <c2/> (käsin johdettu, tarkka) ja kaksi yhdensuuntaista mittausta keskiarvoistuu arvoon <c3/> (siemenkeskiarvoistettu); ei-vastavuoroinen differentiaaliviive on värillinen valkoinen-FM + satunnaiskävely-FM -prosessi, jonka Allanin poikkeama noudattaa lauseketta <c4/> (siemenkeskiarvoistettu, ~{ "20" } %, linkin oman funktion <c5/> kautta). <em>Parametrit</em> (linkkikohtaiset <c6/>, <c7/>) ovat edustavia TWSTFT- tai optisia lukuja (TWSTFT: kaksisuuntainen satelliittiaika- ja taajuussiirto), ei sovitettu tiettyyn päätteeseen.

seg-6ab219622143 = Tietoturva (harhautuksen havaitsemispiste)

seg-29dd10011ed1 = <c1/>: valvonnan 1-sigma-alaraja <c2/>, siitä seuraava pienin havaittava poikkeama (<c3/> sigmaa) ja pistemäärä välillä <c4/> on johdettu käsin ja yksikkötestattu. Malli (innovaatio / RAIM-tyylinen (RAIM: vastaanottimen autonominen eheyden valvonta) kelloavusteinen havaitseminen) on pätevä; <em>parametrit</em> (valvontaikkuna <c5/>, havaitsemiskerroin <c6/>, mittauskohina <c7/>) ovat edustavia, ei sovitettu tiettyyn vastaanottimeen.

seg-ca51e4f1e19c = Harhautushyökkäyksen havaitseminen

seg-e991f5b2fdb2 = <c1/>: kasvava väärä aikaharhautus liputetaan, kun sen poikkeama ylittää kellon havaitsemisrajan; havaitsemisaika vastaa käsin johdettua arvoa <c2/> yhden ruudukkoaskeleen tarkkuudella, ja kello, jonka raja ylittää määrittelyn, päästää harhautuksen kynnykseen havaitsematta. Sama varaus (<c3/>) koskee tietoturvapistettä.

seg-3d2f6d2b7722 = Välkyntä-FM (lattia)

seg-55697d598918 = <c1/> (oletuksena pois)

seg-55000870c060 = Synteettisesti muodostettu logaritmisesti jaettujen Ornstein-Uhlenbeck (OU) -prosessien summana, kalibroituna konfiguroitavaan tasaiseen ADEV-lattiaan; testi <c1/> validoi, että lattia on tasainen keskiarvotusajan yli ja on konfiguroidulla tasolla (siemenkeskiarvoistettu). Otetaan käyttöön kellokohtaisesti kentällä <c2/>. Siteeratut viiteskenaariot jättävät sen pois: CSAC on valkoisen FM:n hallitsema koko datalehden alueellaan (1-1000 s) ja optisen kellon systemaattinen lattia (~{ "5e-17" }) esitetään sen tarkkuusluvulla.

seg-e2e3de9a61a4 = Monte Carlo -joukon tilastot

seg-9785d05ec5a7 = <c1/> (aggregointi)

seg-cc6c6bb5eb83 = <c1/>: lähimmän sijan prosenttipisteet ja keskiarvo yli kentän <c2/> mukaisen määrän toistettavia realisaatioita; yksittäinen ajo romahduttaa hajonnan, aika-askelkohtainen vyöhyke on järjestetty <c3/>, ja uusintaajot ovat bitilleen identtisiä. Tämä on tilastollista aggregointia jo validoidun yksittäisen ajon yli, ei uusi fysikaalinen malli.

seg-72a9d5de61f5 = sigma_y({ "1" } s)

seg-ebbe708d9cbc = csac-sa45s (CSAC)

seg-c43fe67d4200 = Microchip SA65 / SA.45s datalehti

seg-e3bde4355d78 = optical-sr-lattice (Sr-hila)

seg-87793f684233 = strontium-optinen hilakello, avaruuteen suuntautuva tavoite, arXiv:{ "1503.08457" }

seg-b03f5856d451 = Tila: valkoinen FM ja satunnaiskävely-FM validoitu; vanheneminen mallinnettu ja kalibroitu pois; välkyntä-FM mallinnettu ja validoitu (oletuksena pois siteeratuissa skenaarioissa).

seg-c5ff448dcb88 = Kypsyys: optisen kellon luvut ovat <em>avaruuteen suuntautuva tavoite</em> maalaitteistolla -- yhtään strontium-optista kelloa ei ole lennetty. Laboratorion Sr-kellot saavuttavat { "4.8e-17" } (Oelker et al. { "2019" }, Nature Photonics). CSAC-luvut ovat käyttöön otetusta kaupallisesta osasta.

seg-b59a4b8e6d88 = Relaatiot: Riley, NIST SP { "1065" }, yhtälö { "67" } -- valkoinen FM sigma_y^{ "2" }(tau)=h0/({ "2" } tau); satunnaiskävely-FM sigma_y^{ "2" }(tau)=({ "2" } pi^2/3) h_-2 tau, vastaavasti q_rw*tau/3 taajuuden Wiener-prosessille, jonka diffuusio on q_rw.

seg-dca7ee671d91 = Paketti { "2" } — inertiapaikannus (dead-reckoning) (kvantti-inertiamittausyksikkö)

seg-98452a081241 = Vakio-/jäännösharha -> sijainti

seg-6aa386251acf = sijaintivirheen perhe { "0.5" }<em>b</em>T^{ "2" } (Groves AESS (Aerospace and Electronic Systems Society) Tutorial); käsin johdettu diskreetti testi tiedostossa <c1/>.

seg-c60c0b54c485 = Nopeuden satunnaiskävely (valkoinen kiihtyvyys)

seg-7ce1f40566cf = <c1/>: simuloitu sijaintivirheen keskihajonta (SD) vastaa kaavaa sigma_x(T)=sqrt(S_a*T^3/3) (Groves yht. 54) noin { "12" } %:n havaitulla tarkkuudella (siemenkeskiarvoistettu; pakotettu raja { "20" } %).

seg-8ac776795d40 = Kylmäatomi-interferometrin (CAI) kiihtyvyysmittarin fysiikka (ensiperiaatteista)

seg-4eafc81873ed = <c1/>: kolmipulssinen Mach–Zehnder-kylmäatomi-interferometri. Käsin varmennettu oppikirjageometriaa vasten — Rb-87 <c2/>; <c3/> arvolla { "1" } g, <c4/>; projektiokohina <c5/> arvoilla <c6/>, <c7/>; laukausta kohti <c8/>; skaalauslait <c9/> ja <c10/>; eksponentiaalinen kontrastin vaimeneminen. Funktio <c11/> <b>johtaa</b> valkoisen kiihtyvyyden PSD:n (tehospektritiheys), jota klassinen malli <c12/> käyttää. Rehellinen rajaus: vain <b>kvanttiprojektiokohinan lattia</b> (~{ "0.09" } ug/sqrtHz tässä) — selvästi alle todellisten, tärinän rajoittamien laitteiden (1-50 ug/sqrtHz); tärinätensoria, Coriolis- ja valosiirtymäsysteemaattisia virheitä ei vielä mallinneta (katso <a1><c13/></a1>).

seg-ed78f40a8d80 = Gyron harha + kulmasatunnaiskävely (ARW) -> kallistus -> painovoimakytkentä

seg-a73e97ac4a0e = Jäännösgyroharha ja ARW aiheuttavat asennevirheen; kallistus kytkee painovoiman (<c1/>) vaakasuuntaiseen ominaisvoimavirheeseen. Tiedoston <c2/> testit validoivat puhtaan harhan kuutiollisen sijaintikasvun täsmällisesti ja ARW:n asennekasvun Wiener-prosessina (siemenkeskiarvoistettu). Otetaan käyttöön anturikohtaisesti kentillä <c3/> ja <c4/>; pois käytöstä siteeratuissa vain kiihtyvyysmittarin skenaarioissa.

seg-e68d093e952a = Harhan epävakaus (1/f-välkyntälattia)

seg-5ad1e7d55d07 = <c1/>: 1/f-välkyntäprosessi (sama OU-synteesi, joka on validoitu kellolle), jonka tasainen Allanin poikkeaman lattia on harhan epävakauskertoimen tasolla; nolla ei tee mitään, nollasta poikkeava lattia muuttaa kulkurataa, molemmat toistettavia. Otetaan käyttöön anturikohtaisesti kentällä <c2/>.

seg-b631c1bfce05 = Kiihtyvyyden satunnaiskävely (muutosnopeuden satunnaiskävely)

seg-4a4a70363412 = <c1/>: harha on Wiener-prosessi, jolle pätee <c2/>, tarkistettu siemenkeskiarvoistettuna noin { "20" } %:n tarkkuudella. Otetaan käyttöön anturikohtaisesti kentällä <c3/>.

seg-49c4a2532dca = NaveGo-ristiinvalidointi (IMU (inertiamittausyksikkö) kohinakertoimet)

seg-e558aa705560 = <c1/>: ulkoinen ristiintarkistus työkalua <b>NaveGo</b> vasten (R. Gonzalez, avoimen lähdekoodin INS/GNSS (INS: inertianavigointijärjestelmä) -työkalupakki, <c2/>). Toistaa työkalun NaveGo tiedoston <c3/> synteettisen edestakaisen kierron sen <b>julkaistulla Microstrain 3DM-GX3-35 -viiteprofiililla</b>: kun (NBS14/Stable32-validoitua) limittäistä ADEV-estimaattoriamme ajetaan valkoisella anturikohinalla NaveGon 1-σ-tasoilla, se palauttaa nopeus- ja kulmasatunnaiskävelykertoimet (VRW, ARW) (<c4/>) tarkkuudella <c5/> (todellinen ~{ "0.4" } %), valkoisen kohinan haaran ollessa kulmakertoimella −1/2. Vahvistaa, että Allan-putkemme ja työkalun NaveGo VRW/ARW-määritelmät ovat yhtäpitäviä. { "40" } MB:n tallennettu STIM300-loki (<c6/>) ei ole sisäänluettu (binäärimuotoon sidottu).

seg-171b215f0526 = Asteikkokerroin, hienommat ristiakselitermit

seg-b690ed87f493 = <c1/> tässä 1-DOF (yhden vapausasteen) -paketissa

seg-c1bd4e24c091 = Vanhassa yksiakselisessa paketissa ei ole asteikkokerroin- tai ristikytkentävirhettä. Kolmiakselinen strapdown-kirjasto ja paketti <c1/> mallintavat asteikkokertoimen, kohdistusvirheen, g-herkkyyden, kvantisoinnin ja kulmanopeusramppivirheen (<c2/>; katso väitetaulukko alla).

seg-ce2b3237acfe = harhan vakaus

seg-129dc6af8f10 = kohinan juuri-PSD

seg-7109e60b8c9b = cold-atom-quat (kvantti)

seg-5f5690d74918 = { "5.88e-7" } m/s^{ "2" } ({ "60" } ng, { "24" } h)

seg-8e83c799fb03 = { "22" } ug/sqrtHz = { "2.16e-4" } (m/s^{ "2" })/sqrtHz

seg-b52686064c43 = Templier et al. { "2022" }, Science Advances (arXiv:{ "2209.13209" })

seg-09b42bed82c9 = nav-grade-quartz (klassinen)

seg-fa9adbe58c2f = { "1.57e-3" } m/s^{ "2" } (~{ "160" } ug)

seg-63f64f576abc = ~{ "20" } ug/sqrtHz = { "1.96e-4" } (m/s^{ "2" })/sqrtHz

seg-8714c547449a = Honeywell QA-2000 / Groves AESS Tutorial

seg-79fc524162b5 = Rehellinen kehystys: kylmäatomin etu on <b>pitkäaikainen harhan vakaus</b> (~2600x pienempi), joka hallitsee pitkää GNSS-katkoa kaavan { "0.5" }<em>b</em>T^{ "2" } kautta. Lyhytaikainen kohina on verrattavissa (kvantti ~{ "22" } vs. klassinen ~{ "20" } ug/sqrtHz) — kvanttianturi voittaa maratonin, ei pikajuoksua. Kypsyys: kylmäatomikiihtyvyysmittarit ovat laboratorio-/varhaisvaiheessa (JRC122785), navigointiluokan kvartsi on käytössä.

seg-e02e93f4f30a = Paketti { "3" } — ajansiirto (optinen vs. radiotaajuus (RF), optinen satelliittien välinen linkki)

seg-2b87e5f0ba7e = Valkoinen ajoitusjitter -> synkronoinnin toistotarkkuus

seg-229295aa1f70 = <c1/>: simuloitu synkronoinnin RMS toistaa linkin jitterin sigma_j; otoskeskiarvo keskiarvoistuu kuten sigma/sqrt(N) tarkkuudella <{ "20" } % (siemenkeskiarvoistettu).

seg-4325ec478bca = Ajoitus -> yksisuuntainen etäisyysmittaus

seg-aa7a1f463683 = etäisyys = c * dt, c={ "299792458" } m/s; { "1" } ps = { "0.299792458" } mm (tarkka, käsin johdettu testi).

seg-7ad8bb95bf35 = Välkyntä-/TDEV-lattia, kaksisuuntaisen vastavuoroisuuden jäännös

seg-5bf72778b6c2 = <c1/> (tyyppi <c2/>): välkyntävaihekohina (Kasdin–Walter, tasainen TDEV), vuorokausivaihtelun ei-vastavuoroisuus ja vakio vastavuoroisuusjäännös kaksisuuntaisessa sarjassa; valkoisen jitterin paketti <c3/> on ennallaan.

seg-dae3fa0375fe = yksittäisnäytteen jitter

seg-4a141a45a8ff = lähde

seg-ee136a1d0051 = { "1" } ps ({ "1e-12" } s)

seg-c78abd60ec97 = kiertoradalla uskottava tavoite

seg-9dfc1d4334a3 = optinen satelliittien välinen linkki, pikosekunnin synkronointitavoite; laboratorion O-TWTFT (TWTFT: kaksisuuntainen aika- ja taajuussiirto) ~{ "1" } fs (Giorgetta { "2013" } / Deschenes { "2016" })

seg-4f3d23d83190 = { "0.5" } ns ({ "5e-10" } s)

seg-0e730e8e2237 = mitattu yksittäisistunto

seg-b9faad47d802 = BIPM/PTB/NIST (BIPM: International Bureau of Weights and Measures; PTB: Physikalisch-Technische Bundesanstalt, Saksan kansallinen metrologian laitos) TWSTFT

seg-51e2e5782c96 = Rehellinen kehystys: optinen luku on pikosekuntitason synkronointitavoite kiertoradalla (ei lennetty). Maanpäällinen optinen laboratoriolattia on ~{ "1" } fs (paljon parempi); hyvin suunniteltu mikroaaltolinkki (ACES (Atomic Clock Ensemble in Space) -mikroaaltolinkki (MWL), ~{ "0.3" } ps) voi kilpailla optisen kanssa, joten lähtötaso ”RF = { "0.5" } ns” tarkoittaa nimenomaan tavallista TWSTFT:ää. Etäisyysmuunnos on yksisuuntainen (etäisyys = c<em>dt); kaksisuuntainen/edestakainen puolittaa sen (etäisyys = c</em>dt/2).

seg-5fa72f18f983 = Paketti { "4" } — hybridifuusio (päätösosa)

seg-3de12b094504 = Yhdistää paketin { "1" } (kello), paketin { "2" } (inertia) ja paketin { "3" } (ajansiirto) yhdeksi PNT-paketiksi (paikannus, navigointi ja ajanmääritys). Paketin on pidettävä SEKÄ ajoitus (< ajoitusmäärittely) ETTÄ sijainti (< sijaintimäärittely) rajoissa; <c1/> on aika, kunnes jompikumpi ylittyy. Valinnainen optinen satelliittien välinen (ISL) ajansiirto synkronoi kellon uudelleen katkon aikana (vain aika-avusteisuus — sijaintia ei synkronoida uudelleen, koska ajansiirto antaa ajan, ei sijaintia).

seg-4f7cd8f86565 = Näkökohta

seg-19deb2a3537c = Yhdistetty PNT-pisteytys (ajoitus JA sijainti)

seg-77a7595ffad7 = Tiedoston <c1/> käsin johdettu testi <c2/> (pnt_holdover = ensimmäinen ajoituksen/sijainnin ylittäjistä).

seg-d0e39bf123d8 = Eheys + Tietoturva hybridipaketille

seg-3fb63eb2b6b8 = <c1/>: Kalman-ajoitusestimaattori, joka on ohjattu totuuteen (nimellinen) ja ankkuroitu uudelleen jokaisessa optisessa uudelleensynkronoinnissa; Eheys on suojausrajan sisällä pysyminen (raja sisältää linkin jitterilattian), Tietoturva harhautuksen havaitsemispiste. Testattu molemmille paketeille linkkiavusteinen tapaus mukaan lukien.

seg-c3be96b7cb41 = Yhteisfuusioestimaattori

seg-e9d5448ea06c = <c1/>: yksi yhteinen Kalman-suodatin ([phase, freq] ⊕ [pos, vel]) on navigaattori, jota GNSS ohjaa (oppien poikkeamat nollasta poikkeavasta alkukovarianssista) ja ajansiirto avustaa; yhteinen kovarianssi antaa yhteisen eheyden, joka on testattu luotettavaksi (≥{ "0.9" }) molemmille paketeille kohinajohdonmukaisilla antureilla. Paketti havainnoi sijaintia ja aikaa <b>erikseen</b>, mihin optimaalinen suodatin on lohkodiagonaalinen; laajennetun tilan vakioharhan estimointi ja dynaaminen ristiinavustus ovat tulevaa työtä.

seg-915ec766439f = Kytketty kello+sijainti-suodatin (ristilohkokovarianssi)

seg-fd718a51859a = <c1/>: yksittäinen pinottu Kalman-suodatin <c2/> (Joseph-muotoiset päivitykset), jonka mittaus <c3/> (<b>pseudoetäisyys</b>) kytkee sijainti- ja kellolohkot. Testit: jaettu pseudoetäisyys tekee arvosta <c4/> nollasta poikkeavan (erilliset suodattimet pitävät sen täsmälleen { "0" }); kaksi erilaista geometriaa ratkaisevat yhdessä syötetyt sijainti- ja kellopoikkeamat, joita yksittäinen etäisyys ei erota; <b>vain kelloon perustuva</b> ratkaisu terävöittää <b>sijaintia</b> ristikovarianssin kautta (hyöty, jonka kytkentä antaa ja erilliset suodattimet eivät); ja Monte Carlo -ajon <b>NEES on χ²({ "4" })-johdonmukainen</b> (Bar-Shalom §{ "5.4" }, ajopohjainen vyöhyke). 1-DOF (paketin dimensio); ei vielä kytketty ajettavaan pakettiin, ja 3-D 8-tilan laajennus on tulevaa työtä.

seg-31ecf062b941 = Validoitujen alimallien koostaminen

seg-9b849cb4fe8d = perii

seg-4e1c8b6791f3 = kello-/inertia-/ajansiirtotermit on validoitu omissa paketeissaan.

seg-b672e5499976 = Löyhästi kytketty GNSS/INS (paketti <c1/>)

seg-277425f2cbcf = <c1/>: 15-tilainen virhetilan EKF (δp, δv, ψ, kiihtyvyys-/gyroharha; Groves §{ "14" }) ohjaa kolmiakselista strapdown-navigaattoria takaisinkytkennällä. Testit: syötetty sijaintivirhe nollautuu täydellisellä totuusavustuksella; avustettu ratkaisu pysyy metrirajoissa, kun vapaasti ajettava INS hajaantuu yli { "100" } m; ja yhdistetty sijainnin RMS { "60" } s:n katkon yli voittaa avustamattoman inertiapaikannuksen (dead-reckoning) joukkotestin rajan (~{ "4" }×, kun mitattiin ennen versiota { "0.27.3" }; marginaali on suurempi alla olevan korjauksen jälkeen). Gyroharhan kytkentä tarkistetaan strapdownia itseään vasten: tunnetun jäännösgyroharhan on tuotettava suodattimen ennustama asennevirhe (<c2/>), ja leveän priorin on opittava lentokontrollerin luokan gyroharha pysyen rajoissa; molemmat epäonnistuvat version 0.27.3 edeltävällä etumerkillä. <b>Tarkistettu versiossa { "0.27.3" }:</b> kytkennällä oli väärä etumerkki, joten gyroharha-arviot työnsivät väärään suuntaan ja vain tiukka priori piti paketin vakaana; julkaistut katkoluvut muuttuivat (CHANGELOG, Fixed). Rehellinen raja: löyhästi kytketty kiihtyvyysharha/kallistus ovat heikosti erotettavissa, joten harhakohtaista kalibrointia ei väitetä.

seg-1c9a9f76a432 = Tiukasti kytketty GNSS/INS (pseudoetäisyys)

seg-b4ccc12229c4 = <c1/> + <c2/> <c3/>: innovaatio muodostetaan etäisyysalueella (näkölinjan Jacobin matriisi suureelle δp). Testit: neljä satelliittia nollaa syötetyn { "8" } m/−{ "5" } m vaakavirheen arvoon < { "0.1" } m; <b>kaksi satelliittia</b> (PVT-ratkaisu (sijainti, nopeus ja aika) ei mahdollinen) leikkaa silti vaakavirheen yli { "5" }×; yksittäinen yläpuolinen satelliitti havaitsee vain näkölinjan suuntaisen (pystysuuntaisen) komponentin ja jättää vaakasuuntaisen koskemattomaksi; virheelliset syötteet hylätään. Vain pseudoetäisyys — kantoaallon vaihe ja eksplisiittinen vastaanottimen kellotila ovat tiekartalla.

seg-240b681b6021 = Anturien ristiinavustuksen tarkkuus (täysi Kalman-/tekijäkaaviofuusio)

seg-efe7e288276b = <c1/> paketissa <c2/>

seg-e5371874c57d = Hybridipaketti on järjestelmätason koostumus + aika-avusteisuus, ei optimaalinen estimaattori. Suodattimia on muualla: paketin <c1/> löyhästi ja tiukasti kytketty EKF (laajennettu Kalman-suodatin) (yllä olevat rivit) ja tyypin <c2/> 17-tilainen UKF (unscented Kalman -suodatin). Tekijäkaaviotasoitinta (factor-graph smoother) ei ole mallinnettu.

seg-189758709fd2 = Tulos: täysin kvanttipaketti pitää täyden PNT:n { "1.8" } h:n katkon läpi; täysin klassinen paketti on <b>sijainnin rajoittama</b> (navigointiluokan IMU ylittää ensin). Optinen ISL-ajansiirto pitää jopa klassisen KELLON lukittuna, eristäen inertia-anturin klassisen paketin heikoksi lenkiksi — kvantti-inertian ja optisen ajoituksen yhteisen käytön ydinargumentti.

seg-a4c5b45ea8a5 = Geometria — GNSS-saatavuus radoista

seg-d347bb63c1fd = Ympyräkiertoradan kahden kappaleen ratalaskenta

seg-60c369fbbd97 = <c1/>: kiertoaika <c2/> (mu = { "3.986004418e14" }), sijainti palaa yhden kiertoajan jälkeen, päiväntasaajan/napaisen tason tasomaisuus — käsin johdetut testit.

seg-1260a2fef95f = Eksentrinen (Kepler) ratalaskenta

seg-49df9d526f9c = <c1/>: Keplerin yhtälö <c2/> ratkaistu Newtonilla (jäännös < { "1e-12" }); perigeumin/apogeumin säteet <c3/>; ympyräkiertoradan tapaus täsmää suljetun muodon polkuun { "1e-9" } tarkkuudella.

seg-958f03424508 = J2:n sekulaarinen solmu-/apsidiajautuma

seg-336b9581c47c = <c1/>: <c2/>, <c3/> (Vallado); solmu taantuu (myötäkulkuinen) / etenee (vastakulkuinen) / on paikallaan (napakiertorata), ja apsidit jäätyvät kriittisellä inklinaatiolla { "63.4" } astetta — käsin johdetut etumerkki-/nollatestit. Vain kahden kappaleen + sekulaarinen, ei oskuloiva.

seg-dcba8d368326 = Näkölinjan näkyvyys (Maan peitto + korkeuskulmamaski)

seg-2eee9a8f894b = Vastakkaisella puolella oleva satelliitti peittyy, säteittäisesti ulospäin oleva satelliitti { "90" } asteen korkeuskulmalla, tangentiaalinen satelliitti horisontissa — täsmälliset käsin johdetut testit.

seg-f251c75eb367 = Näkyvyys -> GNSS-tila -> aikajana

seg-70fbb9f3cc2b = Kun näkyviä on <c1/>: nominaali; 1-3: heikentynyt; { "0" }: estetty. Walker-delta-generaattori; integraatiotesti ajaa kellon holdover-ajon johdetusta aikajanasta.

seg-988d3fedb7f5 = Satelliittitähdistön suunnitteluoptimoija + kattavuuskaistojen geometria (streets of coverage)

seg-2a636487a4e6 = <c1/>: <c2/> hakee ruudukosta <c3/> ja palauttaa solun, joka parhaiten täyttää tavoitteen <c4/> (pienin määrä satelliitteja kattavuustavoitteelle / suurin kattavuus / pienin huonoin PDOP (PDOP: sijainnin tarkkuuden heikkenemiskerroin)) — testi varmistaa, että valinta on sama kuin saman pyyhkäisyn riippumaton raakavoimahaku, ja läpikäyty esimerkki vahvistaa, että GPS (Global Positioning System) Walker 24/6/1 -suunnitelma kattaa vähintään yhtä hyvin kuin harvennettu 18 satelliitin suunnitelma. Analyyttiset <b>streets-of-coverage</b>-suljetut muodot (<c5/> <c6/>; <c7/> <c8/>, Rider/Beste) on varmennettu käsin oppikirjageometriaa vasten (GPS { "5" }° maskilla: λ ≈ { "71.16" }°, 4 satelliitin kaistan puolileveys ≈ { "62.83" }°) ja havaitsevat alipopulaatioaukon (<c9/>). Täyttä Riderin pienimmän satelliittimäärän <em>globaalin</em> kattavuuden ratkaisijaa (saumaherkkä tasomäärä) ei ole vielä toteutettu.

seg-a1c1364cc45a = Tarkkuuden heikkenemiskerroin (GDOP/PDOP/HDOP/VDOP/TDOP (GDOP: geometrinen tarkkuuden heikkenemiskerroin; HDOP: vaakasuuntainen tarkkuuden heikkenemiskerroin; VDOP: pystysuuntainen tarkkuuden heikkenemiskerroin; TDOP: aikaan liittyvä tarkkuuden heikkenemiskerroin)) -> sijaintitarkkuus

seg-a1706d47f895 = <c1/>: <c2/> näkölinjan suunnittelumatriisista. <b>Ulkoinen oraakkeli</b> (<c3/>): viisi DOP-tekijää toistavat sen, mitä laskee <b>gnss_lib_py { "1.0.4" }</b> (Stanford NAV Lab — riippumaton, vertaisarvioitu GNSS-kirjasto, jota käytetään tässä kuten ERFA-kirjastoa (Essential Routines for Fundamental Astronomy) koordinaatistoille) <b>{ "8" } geometrian</b> yli, jotka ulottuvat hyvin ehdollistetusta lähes singulaariseen (DOP satoja), <b>{ "1e-6" }</b> suhteelliseen tarkkuuteen; alkuperä + uudelleentuotto kohdassa <c4/>. Lisäksi suljetun muodon tarkistuksena säännöllinen tetraedrigeometria toistaa analyyttiset DOP-arvot (PDOP { "1.5" }, TDOP { "0.5" }, GDOP √{ "2.5" }, HDOP √{ "1.5" }, VDOP √{ "0.75" }) tarkkuudella { "1e-9" }. Sijainti-sigma = PDOP × käyttäjän ekvivalentti etäisyysvirhe.

seg-504d5aa92cbc = Sijaintivirhe = σ_UERE × DOP moottorin omalle pienimmän neliösumman ratkaisulle

seg-fc3443210358 = <c1/>, <c2/>: siemenluvulla toistettu Monte Carlo (N = { "20,000" } epookkia geometriaa kohti, σ = { "1.5" } m, ChaCha8-siemenluku { "36" } + i) funktiosta <c3/> yksikköpainoilla, ratkaistuna todellisesta sijainnista, <b>tiedoston <c4/> { "8" } geometrialla</b> (ne, joiden DOP on täsmätty gnss_lib_py-kirjastoon), σ²·Q vasten, missä Q on ytimen <c5/> oma kovarianssitekijä (<c6/>, sama aritmetiikka). <b>Toleranssit ennakkorekisteröity</b> (commit e50c88d2, ennen ensimmäistä ajoa, geometriasuunnittelumuistion { "0.36" } osion { "5.2" } mukaan), kukin keskivirheiden lukumääränä: itä-, pohjois-, ylös- ja kellovarianssit { "5" } %:n sisällä; H/V/P RMS { "2.5" } %:n sisällä; itä-pohjois-korrelaatio { "0.035" } sisällä; keskiarvot { "5" } keskivirheen sisällä; { "95" } %:n vaakaellipsin osuus { "0.95" } ± { "0.0077" } sisällä. Ensimmäinen ajo: kaikki { "104" } tarkistusta läpäisevät (huonoin varianssi { "3.2" } %, RMS { "1.6" } %, korrelaatio { "0.012" }, keskiarvo { "2.2" } keskivirhettä, ellipsi { "0.0039" }). <b>Negatiiviset kontrollit</b> epäonnistuvat vaaditusti: kaksinkertaistettu PDOP epäonnistuu jokaisella geometrialla; virheet, jotka kasvavat kuten 1/sin(korkeuskulma) painottamatonta Q:ta vasten, epäonnistuvat varianssitarkistuksessa jokaisella geometrialla, jonka matalin satelliitti on alle { "20" }°. <b>Miten se yhdistyy yllä olevaan riviin:</b> tuo rivi validoi näiden geometrioiden DOP:n gnss_lib_py-kirjastoa vasten; tämä lisää askeleen näistä tekijöistä metreihin moottorin ratkaisijan kautta. <b>Ensimmäinen, erillinen tarkistus säilytetään sen rinnalla</b> (<c7/>, <c8/>, ajettu ennen ennakkorekisteröintiä ja raportoitu sellaisena): neljä käsin valittua taivasta (avoin, ryhmittynyt, kuilu, puolitaivas; σ { "1" } m) khiin neliö -luottamusväleillä, joiden kokonaisvirhe on { "1e-6" } { "20" } tarkistuksen yli; suhteet { "0.987" } – { "1.009" }, ja sen omat negatiiviset kontrollit ({ "10" } %:n DOP-virhe, 1/sin(korkeuskulma)-virheet) epäonnistuvat vaaditusti. <b>Miksi MODELLED:</b> ei ulkoista aineistoa; se ei osoita, että todellisen vastaanottimen virhe noudattaa mallia, ja σ_UERE on syöte.

seg-94bffbd8385b = Usean satelliittitähdistön saatavuus

seg-a40eab03bbbe = <c1/>: lisätyt <c2/> yhdistetään yhdeksi satelliittijoukoksi näkyvyyttä/DOP:ta varten; yhdistetyn lukumäärän testi vahvistaa yhdisteen.

seg-0b905100d91c = Lähetetty ionosfääri (Klobuchar, IS-GPS-200 (IS: Interface Specification)) → L1-vinoviive

seg-05e278f04770 = <c1/>: <c2/>, kahdeksankertoiminen lähetetty yksitaajuusmalli. <b>Ulkoinen oraakkeli</b> (<c3/>): vino L1-viive toistaa <b>RTKLIB-kirjaston (avoimen lähdekoodin reaaliaikainen kinemaattinen paikannuskirjasto) funktion <c4/></b> tuloksen (tomojitakasu/RTKLIB, <c5/> — de facto avoin GNSS-viite, käännetty lähdekoodista ja ajettu riippumattomasti) <b>{ "10" } tapauksessa</b>, jotka kattavat korkeuskulman, atsimuutin, paikallisajan ja kaksi kerroinjoukkoa (Kshana-ohjelmiston oletus + RTKLIB:n), arvoon <b>< { "1e-4" } m</b>. IONEX-lukija (IONosphere map EXchange format) GIM-tiedostojen (GIM: globaali ionosfäärikartta) TEC-kartoille (TEC: kokonaiselektronipitoisuus) on nyt olemassa (<c6/>, <c7/> bilineaarisella spatiaalisella ja ajallisella interpolaatiolla sekä vinomuunnoksella, yksikkötestattu paketin sisällä); tämän interpolaation ristiintarkistus todellista CODE (Center for Orbit Determination in Europe) GIM-tuotetta vasten on yhä jatkotehtävä. Lähetetty malli itsessään on validoitu ulkoisesti.

seg-39e235557ecc = RAIM/ARAIM (ARAIM: kehittynyt vastaanottimen autonominen eheyden valvonta) -havaitsemisydin (χ² / ei-keskeinen χ² / normaali) → kynnykset ja kertoimet

seg-8906f922b9b9 = <c1/>: snapshot- / ratkaisuerotus- / ARAIM-havaitsemiskynnys (<c2/>), havaitsematta jäämisen ei-keskeisyys <c3/> (<c4/>) ja kertoimet K_fa/K_md/K_V (<c5/>) arvioidaan kaikki riippuvuudettomasta regularisoidusta epätäydellisestä gammafunktiosta. <b>Ulkoinen oraakkeli</b> (<c6/>): <b>{ "171" } tapausta</b> toistavat <b>SciPy { "1.17.0" }</b> -tulokset (<c7/>/<c8/>/<c9/> + <c10/> — riippumaton Cephes/Boost-toteutus, eri algoritmi) P_fa / P_md / redundanssin toiminta-alueiden yli, <b>≤ { "1e-6" } suhteellisella tarkkuudella</b>. Ytimen ympärillä oleva geometria (kaltevuus/kovarianssi suureesta <c11/>) on gnss_lib_py-validoitu DOP-ydin. <b>Rajaus:</b> tämä rivi lukitsee <em>tilastollisen ytimen</em>. ARAIM MHSS:n (multiple-hypothesis solution separation) allokaation suojaustason <em>arvo</em> on lukittu erikseen WG-C:n (Working Group C) ARAIM Technical Subgroupin julkaistua läpikäytyä esimerkkiä vasten (<c12/>, VPL (pystysuuntainen suojaustaso) { "18.2926" } m vs { "18.3" } m, HPL (vaakasuuntainen suojaustaso) { "13.4063" } m vs { "13.45" } m, viitteen oman { "0.05" } m toleranssin sisällä; katso alla oleva standardihuomautus ja <a1><c13/></a1>).

seg-b17f1501a267 = SBAS (satelliittipohjainen täydennysjärjestelmä) -suojaustaso (DO-229E Appendix J) → vaaka-/pystysuuntainen suojaustaso (HPL / VPL)

seg-abe00b67e4cb = <c1/>: <c2/>, painotettu pienimmän neliösumman (LS) <c3/> → vaakavirhe-ellipsin pääakseli + pystysuuntainen σ, skaalattu DO-229E:n K-tekijöillä. <b>Ulkoinen oraakkeli</b> (<c4/>): HPL, jonka Kshana-ohjelmisto laskee, toistaa <b>RTKLIB SBAS-PL -haarukan</b> (<c5/> <c6/>, Sikin ja Takácsin { "2017" } ”DO-229D Appendix J” -toteutus), ajettuna komennolla <c7/> <b>todellisella EGNOS-datalla</b> (European Geostationary Navigation Overlay Service) (GEO (geostationaarinen rata) PRN120 -lähetysviestit + todellinen BUTE/Budapest RINEX (Receiver Independent Exchange Format), 2017-02-19), <b>{ "6" } epookin</b> yli arvoon <b>< { "2e-3" } m</b>. Satelliittikohtainen σ on oraakkelin oma täysi SBAS-budjetti (UDRE (user differential range error) + GIVE (grid ionospheric vertical error) iono + tropo + ilma-alus). ESA:n gLAB { "v6.0.0" } (<c8/>) käännettiin ja vahvistettiin käyttävän identtistä käytäntöä. <b>K_V-huomautus:</b> molemmat oraakkelit pyöristävät MOPS:n (minimum operational performance standards) K_V → { "5.33" }; Kshana-ohjelmisto käyttää tarkkaa arvoa <c9/> (~{ "0.06" } % pienempi VPL), joten pystysuunta validoidaan K-tekijästä vapaana suureena <c10/> (= oraakkelin VPL / { "5.33" }). HPL täsmätään suoraan (K_H = { "6.0" } molemmin puolin).

seg-fd16d642cafd = Todellinen satelliittitähdistön geometria TLE:istä (rivi 2 / Kepler)

seg-1311ef1cb4bb = <c1/> (jäsennys)

seg-5117debbce89 = <c1/>: jäsentää rivin 2 keskimääräiset Kepler-elementit (isoakselin puolikas keskiliikkeestä); tunnettu ISS:n (International Space Station) elementtijoukko kiertää edestakaisin oikeiksi elementeiksi ja kiertoajaksi. Vain rivin 2 lohkolla ratalaskenta on moottorin kahden kappaleen (+ valinnainen J2) ratalaskenta <em>keskimääräisistä</em> elementeistä — pätevä yhteisen epookin tilannekuvalle, ajautuu SGP4:stä (Simplified General Perturbations { "4" }) ajan myötä.

seg-26d22e76e28d = SGP4 / SDP4 (Simplified Deep-space Perturbations { "4" }) -ratalaskenta (täydet TLE:t)

seg-1099f1bffa01 = <c1/>: täysi lähellä Maata -SGP4 + syväavaruus-SDP4 (Kuu-Aurinko sekulaarinen/jaksollinen + { "12" } h / { "24" } h geopotentiaaliresonanssi). Validoitu tiedostossa <c2/> virallisia AIAA:n (American Institute of Aeronautics and Astronautics) 2006-6753 (”Revisiting Spacetrack Report #3”) vektoreita vasten — kaikki { "666" } viitetilaa (lähellä Maata, syväavaruus, resonantti, virhekooditapaukset) täsmäävät pahimman tapauksen sijaintivirheellä ≈ { "4.1" } mm. Täysi kaksirivinen joukko (rivi { "1" } + rivi { "2" }) ratalasketaan SGP4:llä; vain rivin 2 joukko pysyy Kepler-tasolla; kaksi voi sekoittaa. Koordinaatisto on TEME (true equator, mean equinox), käytetty johdonmukaisesti käyttäjälle ja satelliiteille (ei TEME→ECEF (ECEF: Maan keskipisteeseen sidottu, Maan mukana pyörivä) -redukointia — riittävä saatavuus-/DOP-geometrialle).

seg-c8fc6a49d249 = IAU:n (International Astronomical Union) 2000A / 2000B -nutaatio + TEME→GCRS (GCRS: Geocentric Celestial Reference System) -redukointi

seg-b31c49596100 = <c1/>: <b>täysi IAU 2000A</b> -sarja ({ "678" } kuu-aurinko- + { "687" } planeettatermiä, <c2/>) ja 77-termiinen 2000B-typistys (<c3/>) on kumpikin validoitu <b>bitilleen</b> julkaistuja SOFA/ERFA (SOFA: Standards of Fundamental Astronomy) -viitevektoreita vasten hetkellä JD_TT { "2453736.5" } — <c4/> antaa Δψ = −{ "0.9630909107115518e-5" }, Δε = { "0.4063239174001679e-4" }; <c5/> antaa Δψ = −{ "0.9632552291148363e-5" }, Δε = { "0.4063197106621160e-4" } — molemmat tarkkuudella <b>{ "1e-13" } rad</b>. 2000A-taulukko on koneellisesti generoitu ERFA:n <c6/>-lähteestä funktiolla <c7/> (toistaa tallennetun tiedoston <c8/> bitilleen). Nutaatiomatriisi (<c9/>), päiväntasausten yhtälö ja koko TEME→TOD→MOD→GCRS (TOD: true of date; MOD: mean of date) -ketju (<c10/>, Vallado AIAA-2006-6980) on testattu aito kierto-/edestakainen/prekessio-plus-nutaatio-ominaisuuksien osalta, nutaatiomatriisi ERFA:n <c11/> vasten alkio alkiolta { "1e-14" } tarkkuudella, ja koko TEME→GCRS-ketju Valladon julkaistua TEME→GCRF-esimerkkiä (AIAA 2006-6753, 2004-04-06) vasten tarkkuudella <b>{ "0.11" } m</b> (<c12/>); kunnes tämä päästä päähän -tarkistus lisättiin, nutaatiomatriisissa oli Δψ väärällä etumerkillä, { "2" }·Δψ:n (noin { "25" }″) kierto, jota ominaisuustestit eivät nähneet (katso CHANGELOG, Unreleased, Fixed); 2000A vs 2000B täsmäävät alle { "1" } mas vaaditusti. Ketju perustuu päiväntasaukseen/GMST:ään (GMST: Greenwichin keskimääräinen tähtiaika); päiväntasauksesta vapaa CIO (X,Y,s) -redukointi ja sen riippumaton ANISE/SPICE (ANISE: Attitude, Navigation, Instrument, Spacecraft, Ephemeris — puhdas Rust-planeettageometriatyökalupakki; SPICE: Spacecraft, Planet, Instrument, C-matrix, Events) -numeerinen ristiintarkistus (≤ { "3.6" } m GNSS-radalla, selvästi tavoitteen < { "10" } m sisällä) ovat alla olevalla CIO-rivillä.

seg-0be3c40cc81a = IGRF-14 (IGRF: International Geomagnetic Reference Field) geomagneettinen pääkenttämalli

seg-9dbb3b1b18a1 = <c1/>: IAGA:n (International Association of Geomagnetism and Aeronomy) Schmidt-normalisoitu pallofunktiokenttä (aste/kertaluku { "13" }, { "2025.0" } + sekulaarinen vaihtelu; kertoimet koneellisesti generoitu virallisesta tiedostosta <c2/> funktiolla <c3/>, toistaen tiedoston <c4/> bitilleen). Validoitu viidellä riippumattomalla rintamalla: ({ "1" }) täsmälliset kerroinpistokokeet IAGA-tiedostoa vasten (g₁⁰=−{ "29350.0" }, g₁¹=−{ "1410.3" }, h₁¹={ "4545.5" } nT); ({ "2" }) asteen 1 synteesi toistaa <b>täsmällisen suljetun muodon kallistetun dipolin</b> kentän <c5/> tarkkuudella { "1e-6" }; ({ "3" }) <b>täysi asteen 13 analyyttinen kenttä on yhtä suuri kuin −∇V</b> skalaaripotentiaalista (differenssi, { "1e-4" } asti) — harjoittaen Legendren derivaatat ja 1/sinθ-termin päästä päähän; ({ "4" }) dipoliakseli toistaa tunnetun <b>geomagneettisen pohjoisnavan</b> (~{ "80.7" }°N, −{ "72.7" }°E) ja <b>dipolin voimakkuuden</b> (~{ "29.7" } µT), ja globaali kenttä on fysikaalisella { "22" }–{ "67" } µT:n kaistalla oikealla pallonpuoliskon inklinaatioetumerkillä; ja ({ "5" }) <b>ulkoinen oraakkeli</b> — täysi synteesi toistaa viralliset <b>British Geological Surveyn IGRF-14-verkkopalvelun</b> arvot hetkellä { "2025.0" } (geodeettinen, WGS-84 (WGS: World Geodetic System) -korkeus) tarkkuudella <b>< { "2" } nT</b> komponenteille X/Y/Z/F ja <c6/> komponenteille D/I neljässä pisteessä { "400" } km:n korkeus mukaan lukien (<c7/>).

seg-c1027d5ffc44 = CIO-pohjainen IAU 2006/2000A GCRS↔ITRS (ITRS: International Terrestrial Reference System) -redukointi

seg-aad81285e8cf = <c1/>: päiväntasauksesta vapaa taivaankoordinaatiston ja maakoordinaatiston välinen ketju. CIP:n (Celestial Intermediate Pole) koordinaatit <c2/> ja 66-termiinen CIO-paikannin <c3/> -sarja on validoitu <b>bitilleen</b> julkaistua SOFA/ERFA-vektoria <c4/> vasten hetkellä JD_TT { "2453736.5" } — X={ "0.5791308482835292617e-3" } ({ "1e-14" }), Y={ "0.4020580099454020310e-4" } ({ "1e-15" }), s=-0.1220032294164579896e-7 ({ "1e-18" }); GCRS→CIRS (CIRS: Celestial Intermediate Reference System) -matriisi vasten <c5/> (kaikki yhdeksän alkiota { "1e-12" } tarkkuudella); Maan pyörimiskulma (ERA) vasten <c6/> = { "0.4022837240028158102" } ({ "1e-12" }). Taulukko <c7/> on koneellisesti generoitu ERFA:n <c8/>-viitteestä funktiolla <c9/> (toistaa tiedoston <c10/> bitilleen). Koko matriisi <c11/> (CIO <c12/> = napaliike · ERA · GCRS→CIRS) on testattu aidon kierron + edestakaisen kierron osalta, ja sen on osoitettu olevan johdonmukainen vanhan päiväntasaus-/GMST-1982-TEME-redukoinnin kanssa { "1" } m:n sisällä { "7 000" } km:n säteellä (käytännöt eroavat siellä noin { "5" } cm). <b>Riippumaton kolmannen osapuolen ristiintarkistus (<c13/>):</b> sama <c14/> verrataan työkaluun <b>ANISE</b> (puhdas Rust-NAIF/SPICE (NAIF: Navigation and Ancillary Information Facility) -uudelleentoteutus), joka kiertää GCRF→ITRF93 (GCRF: Geocentric Celestial Reference Frame; ITRF93: International Terrestrial Reference Frame { "1993" }) JPL:n (Jet Propulsion Laboratory) tiedostosta <c15/>, <b>identtisillä IERS:n (International Earth Rotation and Reference Systems Service) <c16/> Maan orientaatioparametreilla molemmille puolille syötettynä</b>, kahdeksan neljännesvuosittaisen epookin { "2020" }–{ "2023" } yli. Kaksi riippumatonta koordinaatistorealisaatiota täsmäävät <b>suurimmalla suhteellisella kierrolla { "0.028" }″ — ≤ { "0.86" } m maanpinnalla, ≤ { "0.93" } m LEO:ssa (matala Maan kiertorata), ≤ { "3.6" } m GNSS-radalla</b> (keskikulma { "0.023" }″). Tämä on ROADMAPin ”< { "10" } m” -koordinaatiston ristiintarkistus, <b>toimitettu</b>; jäännös on odotettu ITRF93:n ja IERS-2010-CIO:n malli-/datumero, ei vika (bitilleen-ankkuri pysyy yllä olevat SOFA/ERFA-vektorit). ANISE on MPL-2.0 (MPL: Mozilla Public License) / edition-2024 -crate, joten tarkistus sijaitsee erillisessä, työtilasta poissuljetussa alicratessa, joka ei koskaan kosketa julkaistun paketin <c17/> riippuvuuskaaviota tai mitään oletus-CI-porttia.

seg-fa5889f379d2 = SP3 (Standard Product { "3" }, tarkka rataformaatti) -viennin edestakainen kierto (satelliittitähdistö → SP3-c → uudelleenjäsennys)

seg-cd53434eba3a = <c1/>: todellinen Celestrak-tilannekuva (<c2/>, { "30" } GPS-satelliittia) ratalasketaan SGP4:llä, viedään SP3-c-muotoon (<c3/> → <c4/>), jäsennetään uudelleen (<c5/>), ja palautettuja ECEF-sijainteja verrataan SGP4-totuuteen jokaisella epookilla { "24" } h:n yli — huonoin jäännös <b>< { "0.5" } m</b> (kirjoittajan millimetrin sarjallistus; virstanpylvään { "10" } m:n TLE-luokan (TLE: kaksirivinen elementtijoukko) toleranssi täyttyy reilulla marginaalilla). CLI-polku (komentorivikäyttöliittymä), <c6/>, on katettu myös: mukana toimitettu kiertorata-skenaario vie uudelleenjäsennettävän 30 satelliitin SP3:n, ja ei-kiertorata-skenaario hylätään.

seg-fa5ee52e59aa = Todellinen GPS-satelliittitähdistön geometria TLE:istä (SGP4 → ECEF)

seg-1329a53ca94c = <c1/>: aito <b>Celestrak-tilannekuva (<c2/>)</b> (2021-07-28, { "30" } toimivaa GPS-satelliittia; alkuperä tiedostossa <c3/>) jäsennetään ja jokainen satelliitti ratalasketaan validoidun SGP4-ytimen läpi yhteiseen hetkeen, kierretään TEME→ECEF. Varmistaa, että koko satelliittitähdistö asettuu GPS:n MEO-kuoreen (keskikorkea Maan kiertorata) { "1" } %:n sisällä ja että keskileveysasteen avoimen taivaan paikasta todellinen kaikki-näkyvissä (yhdeksän satelliittia) antaa PDOP-arvon { "1.64" } pystysuuntaisen heikkenemiskertoimen ylittäessä vaakasuuntaisen (kuten maakäyttäjällä pitääkin). Tämä harjoittaa SGP4:ää todellisella satelliittitähdistöllä SP3 (tarkka)- ja RINEX (lähetetty) -todellisen datan polkujen rinnalla.

seg-a1b7d74bbe02 = SGP4:n keskimääräisten elementtien Walker-generaattori

seg-01f1635b75e4 = <c1/>: suunniteltu Walker-delta-kuvio tuotetaan SGP4:n keskimääräisinä elementteinä (Kozain keskiliike valittu niin, että SGP4:n isoakselin puolikas osuu tavoitekuoreen) ja ratalasketaan validoidun ytimen läpi. Testit: 24 satelliitin GPS-kaltainen Walker on MEO-kuoressa { "1" } %:n sisällä, tasot ovat täsmälleen { "90" }° välein RAAN:ssa (nousevan solmun rektaskensio) radan normaaleista palautettuna, ja keskiliike toistaa ~{ "718" } min GPS-kuoren kiertoajan.

seg-6e8c472ec9fa = Satelliittitähdistön PDOP-pyyhkäisy + kattavuus-/uudelleenvierailun laatumittarit

seg-dcdbf9c78ca5 = <c1/> (monotonisuus)

seg-5a70f090db45 = <c1/>: <c2/> taulukoi kattavuuden ja mediaani-/huonoimman PDOP:n ruudukossa <c3/>; <c4/> raportoi kattavuusosuuden ja uudelleenvierailuvälit maapisteessä. Validoitu fysikaalisilla monotonisuuksilla, joita suunnittelukompromissin on noudatettava: satelliittien lisääminen ei koskaan laske kattavuutta ja laskee tiukasti mediaani-PDOP:ta (täysi 24 satelliitin suunnitelma kattaa jatkuvasti PDOP:lla ~{ "1.7" }), ja harvennetun satelliittitähdistön tihentäminen kutistaa tiukasti huonointa uudelleenvierailuväliä. Keskimääräinen uudelleenvierailuväli ei koskaan ylitä maksimia. Nämä ovat geometrian kompromissitaulukoita, eivät sertifioitu linkki-/kattavuusbudjetti.

seg-9f0747d71ecc = Rehellinen kehystys: tämä on deterministinen geometriakerros (ympyräradat, pallomainen Maa keskisäteellä { "6371" } km, puhdas näköyhteys). Se määrittää <em>saatavuuden</em> ja <em>geometrisen</em> sijaintitarkkuuden (tarkkuuden heikkenemiskerroin × edustava etäisyysvirhebudjetti) todellisesta geometriasta, ei tarkkaan efemeridiin perustuvaa navigointiratkaisua. Viiteskenaario <c1/> sijoittaa avaruusaluksen GNSS-kuoren sisään: se pitää paikkaratkaisun vain ~{ "59" } % vuorokaudesta, kvanttikello pitää { "5" } ns:n ajoitusratkaisun jokaisen aukon läpi (saatavuus { "1.0" }) ja sirutason kello pitää ~{ "0.73" }.

seg-e2c433c35ba8 = Numeerinen (Cowell) ratalaskuri ja voimamalli

seg-20ace4e0a710 = Numeerinen ratalaskuri (<c1/>) integroi hierarkkisen voimamallin (<c2/>) adaptiivisilla integraattoreilla (<c3/>). Jokainen alla oleva termi on validoitu analyyttistä totuutta tai käsin johdettua suljettua muotoa vasten; häiriöt ovat <b>oletuksena pois</b>, joten julkaistut golden-tiedostot ovat koskemattomia. Koostettu malli on myös ristiintarkistettu toista työkalua vasten: <c4/> ajaa { "11" } LEO- ja GTO (geostationaarinen siirtorata) -tapausta, { "275" } tuntiepookkia, Orekit-työkalun versiota { "12.2" } (DormandPrince853-ratalaskuri) vasten, ja konservatiiviset tasot (kaksi kappaletta → J2–J6 → Aurinko/Kuu → kanuunankuula-SRP) täsmäävät huonoimmillaan { "0.08" } m { "24" } h:n yli (taso VALIDATED matriisissa); vetotaso on vain karakterisoitu ({ "333" } m) ja pysyy MODELLED.

seg-ec74e57ff801 = Cowell-ratalaskuri vs. analyyttinen Kepler-totuus

seg-8d773778ff0e = <c1/>: häiriötön (kahden kappaleen) rata toistaa <b>täsmällisen universaalimuuttujaisen Kepler-ratkaisun metrin alle { "24" } h:n LEO-radalla</b> (tiukempi raja kuin ”numeeriseen viitteeseen verrattuna < { "10" } m”); ominaisenergia ja liikemäärämomentti säilyvät suhteellisella tarkkuudella ~{ "1e-9" }; J2-solmun taantuma toistaa suljetun muodon <c2/> ensimmäisen kertaluvun teoriaan (alle { "2" } %:n sisällä, O(J2²)-jäännös). Funktio <c3/> palauttaa arvon <c4/> sen sijaan että antaisi hiljaa väärän vastauksen, kun Newton ei konvergoi (periapsisin lähellä e = { "0.999" }). Robusti <c5/> (Markley { "1995" } -aloitus, <c6/>) konvergoi siellä ja alueella { "0" } ≤ e ≤ { "0.999999" }, { "0.9" } ε·|E| sisällä 50 numeron mpmath-juurista (<c7/>).

seg-549d15780f79 = Adaptiiviset integraattorit (RK4 (neljännen kertaluvun Runge–Kutta) askelkaksinkertaistus + Dormand–Prince RK5({ "4" }) -upotettu pari, DP5({ "4" }) alla)

seg-1fcc7553c627 = <c1/>: RK4 integroi <c2/> tarkkuuteen < { "1e-9" }, näyttää ~{ "16" }× virheen pienenemisen puolitettua askelta kohti (4. kertaluvun konvergenssi) ja säilyttää harmonisen oskillaattorin jakson yli. DP5({ "4" }) upotettu virhearvio on <b>O(h⁵)</b> (askeleen puolitus pienentää sitä ~{ "32" }×), integroi oskillaattorin { "50" } jakson yli energian säilyessä tarkkuudella < { "1e-6" } ja saavuttaa saman loppupisteen samalla toleranssilla <b>vähemmillä funktiokutsuilla</b> kuin askelkaksinkertaistus; <c3/> täyttää saman alle metrin Kepler-rajan ja on RK4-polun kanssa samaa mieltä < { "1" } m J2..J6-radalla. <b>DOP853</b> (<c4/>): Hairerin { "8" }({ "5,3" }) -pari tiheällä ulostulolla toistaa SciPy-kirjaston version { "1.18.1" } DOP853-toteutuksen askel askeleelta (yksittäinen askel { "5.6e-15" } sisällä; identtiset askelmäärät ajoissa e = { "0.7" } ja Arenstorf, yksi hyväksy/hylkää-vaihto { "501" } askeleessa LEO-ajossa; lopputilat { "1.6e-12" } sisällä) ja vastaa täsmällistä Kepler-ratkaisua yhtä tarkasti kuin SciPy (<c5/>).

seg-345ae1eb05ec = J2–J6-vyöhykeharmoninen kenttä

seg-a88e67186e69 = <c1/>: <c2/> tarkistetaan kolmella tavalla — se <b>palautuu 666 vektorilla validoituun funktioon <c3/> koneen tarkkuudella</b>, kun se rajataan muotoon <c4/>; se <b>vastaa oman vyöhykepotentiaalinsa numeerista gradienttia</b> koko J2..J6-kentän läpi (konservatiivisen kentän kultastandardi); ja parittomat <c5/> vs parilliset <c6/>/<c7/> termit näyttävät tyypillisen pohjois-etelä(anti)symmetrian muunnoksessa <c8/>. Ratalaskettu J2..J6-rata säilyttää kokonaisenergian noin { "1e-8" } tarkkuudella vuorokauden yli.

seg-5536986d9c8f = Kolmannen kappaleen (Aurinko ja Kuu) gravitaatio

seg-04388d03e696 = <c1/> + <c2/>: funktio <c3/> <b>vastaa häiritsevän potentiaalinsa täsmällistä gradienttia</b>, häviää geokeskipisteessä ja osuu oppikirjan LEO-suuruusluokkiin (~{ "5e-7" } m/s² Aurinko, ~{ "1.1e-6" } m/s² Kuu). Matalan tarkkuuden Montenbruck–Gill-Auringon efemeridi osuu käsin johdettuihin J2000-ankkureihin (periheliin etäisyys ≈ { "1.471e11" } m, ~−{ "23" }° päivänseisauksen deklinaatio, ~{ "1" }°/vrk liike); Kuun efemeridi pysyy perigeumin/apogeumin vyöhykkeensä sisällä, palauttaa ~{ "384 400" } km:n keskietäisyyden, ei koskaan ylitä { "5.3" }° inklinaatiota ja palaa { "1" }° sisään yhden sideerisen kuukauden jälkeen. Epookkiohjattu RHS:n (right-hand side, oikea puoli) johdotus on <b>bittitarkka</b> (RHS-termi on yhtä suuri kuin <c4/> näytteistetyssä sijainnissa hetkillä t = { "0" } ja t = { "1" } vrk), ja neljänneksen vuoden epookkisiirto tuottaa erilaisen radan.

seg-9c8756f9d534 = Aurinkopaine (SRP) + kartiomainen varjo

seg-e6110e015204 = <c1/>: funktio <c2/> (kanuunankuula <c3/>) on <b>bitti-identtinen</b> suljetun muodon kanssa täydessä auringossa, lukitsee <b>1 AU:n (AU: astronominen yksikkö) säteilypaineen arvoon ≈ { "4.5398e-6" } N/m²</b>, on ~{ "1.36e-7" } m/s² LEO-kaistalla työntäen poispäin Auringosta, neljännesyy, kun Auringon etäisyys kaksinkertaistuu (käänteisneliö), ja on <b>täsmälleen nolla</b> syvällä umbrassa (täysi varjo). Funktio <c4/> antaa arvon <c5/> täydessä auringossa ja <c6/> täydessä umbrassa (täsmällinen), tasainen monotoninen penumbra nousee { "0" } → { "1" } kaistan <c7/> yli, joka <b>ulottuu umbrasylinterin ulkopuolelle</b>.

seg-17b48db4038b = Ilmakehän vastus (ensimmäinen nopeudesta riippuva termi)

seg-4e6c2d0fff55 = <c1/>: <c2/> (Vallado Table 8-4, paloittain eksponentiaalinen) <b>ankkuroituu arvoon { "1.225" } kg/m³ merenpinnan tasolla</b>, rajautuu pinnan alapuolella, pienenee monotonisesti LEO-alueen läpi, asettuu ~{ "1e-12" } kg/m³ -vyöhykkeeseen korkeudella { "400" } km ja antaa fysikaalisen, takaisin saadun ~{ "58" } km skaalakorkeuden; <c3/> vastustaa mukana pyörivää suhteellista nopeutta LEO-alueen suuruusluokassa ~{ "2e-6" } m/s². Tunnusmerkkitarkistus: { "300" } km:n rata menettää ominaisenergiaa <b>monotonisesti</b> ja sen isoakseli lyhenee rajattua ~km/vrk, kun taas tyhjiön lähtötaso säilyttää energian tarkkuudella < { "1e-9" }.

seg-133eed361425 = Post-Newtonin (Schwarzschild) suhteellisuusteoreettinen korjaus

seg-c8e26480f148 = <c1/>: <c2/> (IERS:n muoto <c3/> <c4/>) palautuu ympyräradalla suljettuun muotoon <c5/> (säteittäinen, <b>ulospäin</b>, akselin ulkopuoliset komponentit täsmälleen nolla), antaa oppikirjan <b>LEO-suhteen <c6/> kaksikappaleprobleemaan nähden</b>, vastaa käsin sievennettyä säteisnopeusmuotoa <c7/> tarkkuudella < { "1e-12" } ja <b>häiritsee rataa propagaattorissa pitäen isoakselin alle metrin vuorokaudessa</b> — konservatiivinen vastakohta vastuksen aiheuttamalle pienenemiselle.

seg-d39e75019595 = Rehellinen rajaus: <c1/>: julkaistut oletusarvot integroivat vyöhykekentän. Korkea-asteinen EGM2008-<b>tesseraalikenttä</b> (<c2/>, aste/kertaluku { "70" }), kiinteän Maan, valtamerten ja ilmakehän <b>vuorovedet</b> (<c3/>) sekä <b>Lense–Thirring</b>-kehysvetotermi on nyt toteutettu ja yhdistetty tarkkaan efemeridinsovitukseen käytettävään voimamalliin (<c4/> — katso alla). Tesseraalikenttä on myös Cowellin menetelmän valinnainen termi (rakenne <c5/>, <c6/>, oletuksena pois päältä), validoitu Orekit { "12.2" } -ohjelmaa <c7/> vasten asteeseen/kertalukuun { "70" } asti ({ "6" } tapausta { "24" } tunnin ajalta, huonoin |Δr| { "0.036" } m; <c8/>). Kenttää arvioivia laskijoita on kaksi: historiallinen <c9/> (pallomaiset osittaisderivaatat; kelvollinen asteeseen ~{ "180" } asti napojen ulkopuolella; tulosteet kiinnitetty) ja <c10/> (Holmes–Featherstone { "2002" } muokattu eteenpäinsarake, gradientti ilman termiä 1/cos φ; kelvollinen asteeseen { "2190" } asti jokaisella leveysasteella). EGM2008 asteeseen { "2190" } asti ladataan ajon aikana (<c11/>, <c12/>, ei mukana paketissa). <c13/> vastaa Orekit { "12.2" } -ohjelmaa tarkkuudella { "7.3e-17" } m/s² kahdeksassa pisteessä asteeseen { "2190" } asti; se pysyy tilassa MODELLED, koska pyshtools ei täyttänyt ennakkorekisteröityä napojen läheisyyden kynnystä (mpmath-tarkistus sijoittaa virheen pyshtoolsiin; <c14/>). { "24" } tunnin { "200" }×{ "200" } -rata vastaa Orekitia tarkkuudella { "0.13" } m, mutta sen ennakkorekisteröity asteen 70 herkkyyskontrolli ei täyttänyt kynnystä ({ "0.73" } m < { "1" } m), joten asteet { "71" }–{ "200" } on radalla luonnehdittu, ei validoitu (<c15/>). NRLMSISE-00-termosfäärin tiheys (NRLMSISE: Naval Research Laboratory Mass Spectrometer and Incoherent Scatter Radar Extended atmosphere model) on porttattu (<c16/>: bitilleen identtinen julkisen alueen C-portin kanssa { "720" } pisteessä, pymsisin suhteen { "1.9e-6" } suhteellisella tarkkuudella, { "17" } julkaistua testitapausta toistettu; <c17/>) ja se on valinnainen vastuksen tiheystaso (<c18/>, <c19/>; oletuksena pysyy staattinen Vallado-malli). Tämä validoi portin, ei mallin tarkkuutta mitattuun tiheyteen nähden. DE440 (DE: Development Ephemeris) Aurinko ja Kuu ovat valinnainen efemeridin taso (<c20/>). WGS-84-litteän Maan SRP-varjo on valinnainen (<c21/>), ja se vastaa Orekit { "12.2" } -ohjelman valaistussuhdetta { "7.4e-9" } sisällä { "2400" } geometriassa (<c22/>); sen reunatummennettulla variantilla ei ole ulkoista oraakkelia (MODELLED). NRLMSISE-00-vastustaso vastaa Orekit { "12.2" } -ohjelman omaa NRLMSISE-00-vastusta { "24" } tunnin aikana tarkkuudella { "0.03" } m, kun vastuksen siirtymä on enimmillään { "142" } km (<c23/>, VALIDATED jaetuin sopimuksin). GMAT-ristiintarkistus (General Mission Analysis Tool) on edelleen jatkotyö.

seg-46d06796e0e4 = Geopotentiaalin vuorovedet (<c1/>)

seg-81b18c4caad3 = Stokesin kertoimien aikariippuvat korjaukset ΔC̄_nm, ΔS̄_nm (IERS Conventions { "2010" }, luku { "6" }), validoitu sopimusten omia julkaistuja lukuja vasten — ei toista työkalua vasten.

seg-78dc5baf4d9d = Osuus

seg-7c6c910bbf89 = Kiinteän Maan vuorovesi (IERS Eq. { "6.6" } / 6.8b / { "6.14" })

seg-ac1dbcc895f0 = <c1/>: pysyvä (nollataajuinen) vuorovesi ΔC̄₂₀ osuu { "1" } %:n sisään IERS:n julkaisemasta arvosta −{ "4.1736" }×{ "10" }⁻⁹ (anelastiset Love-luvut); <b>vaiheen 2 K1-laskuesimerkki toistuu bitilleen</b> (sin/cos-amplitudit { "470.9" } / −{ "30.2" } ×{ "10" }⁻¹² tarkkuudella { "0.1" }×{ "10" }⁻¹²); normalisoitu Legendre-polku on kiinnitetty rekursiosta riippumattomilla suljetun muodon käsinlasketuilla arvoilla.

seg-f2e2c5334721 = Valtameren vuorovesi (IERS Eq. { "6.15" }, FES2004 (Finite Element Solution { "2004" } -vuorovesiatlas), { "8" } komponenttia)

seg-0369f153806f = Mukana toimitettu FES2004-osajoukko (<c1/> → <c2/>, Doodson→kerroin-jäsennys) toistaa lähteen M2-kertoimet ({ "2,2" }) täsmälleen; K1:n Doodson-vaihe on θ_g + π; asteen 2 sektoriaalinen suuruus on fysikaalinen ja suuruusluokkaa pienempi kuin kiinteän Maan vuoroveden.

seg-52a19a291a41 = Ilmakehän S2-ilmavuorovesi (Ray { "2001" }, NASA (National Aeronautics and Space Administration) GSFC (Goddard Space Flight Center))

seg-86b3d3a39bc7 = Mukana toimitetut Rayn harmoniset muunnetaan pintakuormasuhteen (Eq. { "6.21" }) kautta huippuarvoon ΔC̄₂₂ ≈ { "4" }×{ "10" }⁻¹¹ (~{ "10" } % valtameren M2-termistä). Rehellinen varaus: <b>ilmavuorovedelle ei ole olemassa julkaistua geopotentiaalikertoimen oraakkelia</b>, joten se validoidaan lähteen eheyden ja suuruusluokan perusteella, mikä on heikompi kynnys kuin kiinteän Maan ja valtamerten vuorovesillä.

seg-63ac45ba51dc = Ohjailut ja lentoradan suunnittelu (<c1/>)

seg-a2ff4b0619d4 = Impulsiivinen ΔV ja kovarianssin eteenpäinvienti

seg-12f469864d28 = Nopeuden epäjatkuvuus, jonka { "6" }×{ "6" } kovarianssi viedään eteenpäin (deterministinen poltto ⇒ identiteetti-STM (tilasiirtymämatriisi); suorituksen virhekovarianssi kiertyy polttokehyksestä — ECI (Earth-centred inertial) tai LVLH (local vertical, local horizontal) — nopeuslohkoon).

seg-f3f0e4a7ec05 = Äärellisen polton integrointi vs Tsiolkovski

seg-f7b35b7acdba = Vakiotyöntöinen integrointi polttokaaren yli (massa tilana), jonka saavutettu ΔV vastaa suljetun muodon <b>Tsiolkovskin</b> rakettiyhtälöä <b>paremmin kuin { "0.01" } %</b>.

seg-46ae334a0604 = Lambert-ratkaisija (Izzo { "2015" }), edestakainen kierto

seg-3e2b483cd1b7 = Yhden kierroksen Lambert-tulos (<c1/>, <c2/>, lentoaika ⇒ <c3/>, <c4/>) <b>viedään edestakaisin tarkan universaalimuuttuja-Kepler-propagaattorin läpi</b> — sen on päädyttävä takaisin pisteeseen <c5/>.

seg-04d69337acb3 = Porkchop-pyyhkäisy vs Hohmannin alaraja

seg-fb5298b7983c = Lähtö × saapuminen C3 / saapumis-V∞ -ruudukon minimiä verrattaan kahden samatasoisen ympyräradan <b>analyyttiseen Hohmann-siirtymän C3-alarajaan</b>.

seg-bf2eb36e3eb6 = Lambert-ratkaisija vs riippumaton kirjasto

seg-40511ea76e12 = <c1/>: { "13" } yhden kierroksen siirtymää LEO:sta GEO:on ja heliosentriseen, myötäkulkuisia ja vastakulkuisia, lamberthub { "1.0.0" } -kirjastoa <c2/> vasten; huonoin reunanopeuden ero { "7e-12" } m/s.

seg-164d7ea14d4e = Rehellinen rajaus: ei lentoradan optimoijaa, ei usean kierroksen Lambert-haaroja, ja synteettinen samatasoinen ympyrämäinen heliosentrinen malli (ei planeettojen DE-efemeridiä, joten GMAT-ristiintarkistusta Maa–Mars-C3:lle ei ole ajettu).

seg-9d2d78ad22c4 = Radanmääritys (OD) (<c1/>, <c2/>)

seg-95d5ac7f6c29 = Gauss–Newton-eräkorjain

seg-3fe29c4621b2 = Yleinen <c1/>-ratkaisija saavuttaa tarkan painotetun pienimmän neliösumman ratkaisun lineaarisessa sovituksessa, palauttaa todelliset parametrit epälineaarisessa <c2/>-sovituksessa ja ratkaisee 3D-etäisyysmultilateraation kohinattomista etäisyyksistä.

seg-b31d1ffa99b1 = Eräradanmääritys etäisyyksistä

seg-0b37139dffa9 = <c1/> palauttaa tilan <c2/> maa-aseman etäisyysseurannasta (propagoituna kaksikappale- ja J2-voimamallilla) <b>metrin alle / mm·s⁻¹ kohinattomista etäisyyksistä</b> ja <b>~{ "2" } m tarkkuudella, kun sovituksen jälkeinen residuaali on { "5" } m:n kohinalattialla</b> — johdonmukaisen pienimmän neliösumman sovituksen tunnusmerkki.

seg-fb29199bf8bd = Sekventiaalinen (unscented-suodatin) OD

seg-3c1f33052d48 = <c1/> palauttaa tilan rekursiivisesti kymmenien metrien tarkkuudella samalla dynamiikalla ja etäisyysmallilla.

seg-7a636cc9eef0 = Erä- ja sekventiaalinen OD vs riippumaton estimaattori

seg-68bf6e73c582 = <c1/>: { "8" } skenaariota ({ "6" } kohinatonta LEO/MEO/eksentristä { "3" }–{ "4" } asemalla, { "2" } tasolla σ = { "5" } m) Orekit { "12.2" } -ohjelman erä-pienimmän neliösumman ja Kalman-estimaattoreita vasten täsmäytetyllä voimamallilla; huonoin erä { "1e-3" } m / { "1e-6" } m/s, sekventiaalinen { "0.9" } m.

seg-55a86bc79831 = | Etäisyysnopeuden / atsimuutti-korkeuskulman eräradanmääritys korkeuskulmamaskilla | <c1/> (ulkoinen vertailu, yksi ennakkorekisteröity kynnys ei täyttynyt) | <c2/>: { "8" } skenaariota Orekit { "12.2" } -ohjelman erä-pienimmän neliösumman menetelmää vasten mukautetuilla hetkellisillä geometrisilla mittauksilla; näkyvät joukot identtiset, mittausarvot { "5.8e-8" } m / { "6.3e-10" } m/s / { "1.4e-13" } rad sisällä, tilasiirtymämatriisi { "1.2e-14" } sisällä, kohinaiset tilat { "1.74" } cm sisällä ja tyyppikohtainen RMS { "2.7e-4" } sisällä; ennakkorekisteröity kohinattoman tilan kynnys ≤ { "1" } cm jää saavuttamatta { "2" } skenaariossa { "4" }:stä ({ "1.46" } ja { "1.74" } cm; Orekitin oma estimaatti on näin kaukana simuloidusta totuudestaan, kshanan { "1e-8" } m:n sisällä). Katso <c3/>. |

seg-35a85fb744cd = Rehellinen rajaus: opetuskäyttöinen OD käyttää kiinteitä inertiaaliasemia, pallomaista Maata vastaavaa topocentristä kehystä ja hetkellisiä geometrisia mittauksia (ei valoaikaa, aberraatiota, refraktiota eikä Maan pyörimistä); etäisyysnopeus- ja kulmapolun tilasiirtymämatriisi on variaatiollinen (RK4-integroitu analyyttisillä kaksikappale- ja J2-osittaisderivaatoilla), ei suljetussa muodossa; etäisyysnopeudelle tai kulmille ei ole sekventiaalista suodatinta. Pelkän etäisyyden polku säilyttää äärellisen eron Jacobin matriisinsa. (Alla oleva täysvoimainen efemeridinsovitusmoottori kantaa oman variaatiollisen tilasiirtymämatriisinsa.)

seg-8f425e278f7c = Voimamallin validointi efemeridinsovituksella (<c1/>)

seg-9207d7139b87 = Tarkka, täysvoimainen paikkahavaintojen pienimmän neliösumman eräestimaattori: EGM2008-tesseraalinen geopotentiaali (arvioituna Maahan kiinnitetyssä kehyksessä CIO-redusoinnin kautta) yhdistettynä Auringon ja Kuun kolmannen kappaleen vaikutukseen, SRP:hen, ilmakehän vastukseen, Schwarzschildin/Lense–Thirringin GR:ään (yleinen suhteellisuusteoria) ja yllä oleviin vuorovesiin, sovitettuna inertiaalisten paikkahavaintojen sarjaan variaatiollisella tilasiirtymämatriisi-Jacobilla. Validoitu <b>synteettisellä</b> datalla, jossa totuus on Kshanan oma integraattori, joten jokainen residuaali kuuluu estimaattorille eikä dynamiikalle.

seg-fc676106563e = Tarkan voimamallin koostaminen

seg-57726d970436 = <c1/>: asteen 0 kenttä on täsmälleen pistemassa jokaisella epookilla (keskustermi on kiertoinvariantti); aste 8 lisää J2-vyöhykkeen litistyneisyyden; Auringon kolmannen kappaleen termi ja vuorovesitermi kytkeytyvät bittitarkasti; vakio säteittäinen empiirinen kiihtyvyys on puhtaasti säteittäinen RTN-kehyksessä (radial, transverse, normal).

seg-98b036354077 = Variaatiollinen tilasiirtymämatriisi

seg-71787d9334db = Jokainen Φ:n sarake puolen LEO-kierroksen yli (asteen 8 geopotentiaali + Aurinko + Kuu) vastaa riippumatonta <b>koko kaaren keskeisdifferenssi (FD)</b> -uudelleenpropagointia <b>suhteellisella tarkkuudella < { "1" }×{ "10" }⁻⁶</b> sekä paikka- että nopeusvasteessa — dokumentoitu STM↔FD-ristiintarkistus. Φ({ "0" }) = I; laajennettu ja tavallinen propagaattori vastaavat toisiaan millimetrin murto-osan tarkkuudella.

seg-0b453776136b = Eräsovituksen itsepalautus

seg-c651db308332 = Kohinattomasti havaittu 1 tunnin Kshana-kaari (aste 6 + Aurinko + Kuu) palautetaan { "150" } m / { "0.1" } m·s⁻¹ -poikkeamasta <b>epookin tilaan { "1" }×{ "10" }⁻² m:n sisällä</b> lähes nollan sovituksen jälkeisellä RMS:llä; kun mukana on { "5" } m valkoista kohinaa, sovituksen jälkeinen 3D-RMS asettuu <b>~σ-kohinalattialle</b>, harhattomana. SRP:n <b>C_R palautuu arvosta { "1.0" } { "1" } %:n sisään</b> totuudesta { "1.4" }.

seg-06bd2857f832 = Poikkeavien havaintojen muokkaus ja RTN-raportointi

seg-8b9dea5c0727 = { "500" } m:n törkeä virhe hylätään 5-σ-sovituksenjälkeisellä muokkauksella (täsmälleen yksi havainto), jolloin jää puhdas millimetritason sovitus; residuaalit raportoidaan hajotettuina säteittäiseen, poikittaiseen ja normaalikomponenttiin sekä 3D-muodossa.

seg-e3969a15df96 = Empiirisen kiihtyvyyden taso (RTN-vakio + 1-CPR (CPR: cycle-per-revolution, sykli kierrosta kohti))

seg-c46af7926511 = Yhdeksän a priori -rajoitettua empiiristä parametria pysyvät alle { "1" }×{ "10" }⁻⁸ m·s⁻² empiriattomalla totuudella häiritsemättä sovitusta; totuuteen lisätty vakio { "3" }×{ "10" }⁻⁸ m·s⁻² poikittainen kiihtyvyys palautuu { "20" } %:n sisään.

seg-fd79199b52d1 = Rehellinen rajaus: synteettinen aalto käyttää nimellisiä Maan orientaatioparametreja (EOP: UT1 (Universal Time { "1" }, Maan pyörimisaika) ≈ TT (Terrestrial Time), ei napaliikettä) — tarkka itsepalautukselle, koska sama malli tuottaa ja sovittaa kaaren. Virastojen aineistovalidoinnit asettavat <b>todelliset</b> finals2000A EOP- ja SP3/SPK-totuudet (SPK: planeettaefemeridiydin) tämän moottorin päälle CIO-kehysketjun kautta (<c1/>, <c2/>, <c3/>, <c4/>).

seg-934f0f8e4f5f = Todelliset virastojen tarkat radat (<c1/>, <c2/>, <c3/>)

seg-721a27294813 = Galileo MEO — < { "5" } m GREEN

seg-14a2999d0739 = Kshanan täysvoimainen moottori sovitettuna sanatarkkaan otteeseen <b>ESA/ESOC:n (ESOC: European Space Operations Centre) omasta lopullisesta radasta</b> (<c1/>, ITRF (International Terrestrial Reference Frame)) Galileo-satelliitille <b>E11</b> { "8" } tunnin ajalta, jokainen ITRF-havainto kierrettynä GCRS:ään todellisilla finals2000A EOP -arvoilla: sovituksen jälkeinen <b>3D-RMS { "0.133" } m</b> puhtaalla voimalla ja <c2/> (RTN 0.105/0.067/0.047 m, <c3/> { "1.174" }), <b>{ "0.070" } m</b> empiirisen tason kanssa, { "78.7" } km:n raakapäällekkäisyydestä. Koko { "24" } tunnin kaari on <b>{ "0.611" } m</b>. Kaikki selvästi { "5" } m:n kynnyksen sisällä. Kenttä gravitaatiokonvergoitunut asteella/kertaluvulla 8 (identtinen asteilla/kertaluvuilla 8/10/12); työ <c4/> ajaa koko asteen/kertaluvun 70. Alkuperä ja SHA-256 (SHA: Secure Hash Algorithm) tiedostossa <c5/>; täysi tallenne tiedostossa <c6/>.

seg-d5ed0783432e = Swarm-A LEO — < { "5" } m GREEN

seg-403b15ec1b9b = Täysvoimainen moottori (+ ilmakehän vastus) sovitettuna sanatarkkaan otteeseen <b>ESA:n omasta Swarm-A:n redusoidun dynamiikan tarkasta radasta</b> (<c1/>, L47, ITRF, ~{ "430" } km, ~{ "2" } cm) { "3" } tunnin ajalta asteella/kertaluvulla 70, todelliset finals2000A EOP CIO-ketjun kautta: <b>dynaaminen</b> taso (vain tila, staattinen tiheys, <c2/>={ "1" }) sovituksen jälkeinen <b>3D-RMS { "2.687" } m</b> (RTN 0.925/<c3/>/0.045 m — residuaali ≈ puhdas rataa pitkin vaikuttava vastus), <b>redusoidun dynamiikan</b> taso (+ empiiriset CPR-kiihtyvyydet) <b>{ "0.098" } m</b> (RTN 0.026/0.092/0.025 m) — ~{ "10" } cm ESA:n ~{ "2" } cm:n rataan nähden. Alkuperä ja SHA-256 tiedostossa <c4/>; täysi tallenne tiedostossa <c5/>.

seg-3be5a6bee187 = LRO (Lunar Reconnaissance Orbiter) kuu — validoitu, yli { "5" } m (rehellisesti)

seg-d2be90186a89 = <b>Kuukeskinen</b> voimamallin sovitus (<c1/>): GRAILin <b>GRGM660PRIM</b>-gravitaatiokenttä (aste/kertaluku { "100" }) kuun kappaleeseen kiinnitetyssä pääakselikehyksessä (<c2/>, IAU { "2015" } keski-Maa sekä kiinteä DE421:n (Development Ephemeris { "421" }) keski-Maa → pääakseli (ME→PA) -poikkeama, sovellettuna niin kuin SPICE sen määrittelee versiosta { "0.36" } alkaen: sitä ennen se sovellettiin väärään suuntaan, noin { "208" }″ pielessä) + Maan ja Auringon kolmannen kappaleen vaikutus, sovitettuna <em>samalla</em> yleisellä Gauss–Newton-estimaattorilla kuin Maan aineistot todelliseen <b>JPL Horizons LRO</b> (NAIF −{ "85" }) -rekonstruoituun rataan, { "4" } h / { "241" } epookkia, ~{ "98" } km. Rehellinen sovituksen jälkeinen tulos ({ "0.36" }): <b>dynaaminen { "12.05" } m</b> (RTN 2.91/10.11/5.88), <b>redusoitu dynaaminen { "6.67" } m</b> (RTN 3.41/4.58/3.44, { "1" }+2 kierrosta kohti empiirinen), { "39.9" } m:n raakapäällekkäisyydestä (ennen ME→PA-korjausta: { "12.6" } m, { "6.65" } m, { "53.8" } m) — <b>yli</b> kynnyksen < { "5" } m, ei estimaattori (identtinen asteilla/kertaluvuilla 100/150 ja <c3/> 1e-6/1e-9). <b>DE-luokan ristiinvalidointi</b> (<c4/>: DE440 (Development Ephemeris { "440" }) kuun PA-orientaatio + DE440-efemeridi ANISEn kautta) <b>korjasi</b> rajoittavaa tekijää koskevan väitteen — se antoi { "12.0" } m dynaamisena ja { "6.67" } m redusoituna dynaamisena, ja korjattu analyyttinen pino vastaa nyt molempia tasoja (aiempi dynaaminen ero, { "12.6" } → { "12.0" } m, oli ME→PA-poikkeaman virhe), joten operatiivinen lattia <b>ei</b> ole analyyttinen orientaatio tai efemeridi vaan empiirisellä tasolla pienenemätön residuaali (yhteensopivin mallintamattoman LRO:n ei-gravitaatiodynamiikan kanssa lyhyellä kaarella); kevyt analyyttinen pino vastaa jo DE-luokkaa redusoidun dynaamisen radan osalta. Alkuperä ja SHA-256 tiedostossa <c5/>; täysi tallenne tiedostossa <c6/>. <b>Validoitu todellista virastojen totuutta vasten: { "3" } / { "3" }; kynnys < { "5" } m täyttyy: { "2" } / { "3" }.</b>

seg-3d3cbf5f043d = Painovoimakartta / alt-PNT-navigointi (<c1/>, <c2/>, <c3/>, <c4/>)

seg-89f2cbf55842 = Pallofunktiokehitelmän painovoima-anomaliakenttä

seg-76cae5c530f2 = <c1/>: matala-asteinen, täysin normalisoitu kenttä, tarkistettu suljetun muodon Legendre-funktioita (<c2/>, <c3/>, <c4/>) ja käsin johdettua yhden termin anomaliaa { "1.897" } mGal vasten.

seg-f00f82b70e6e = Kylmäatomigravimetrin mittausmalli

seg-49090598c525 = Valkoisen kohinan lattia johdetaan CAI-kiihtyvyysmittarin ASD:stä (<c1/>) ja syötetään deterministisenä siemenlukujonona (täsmääjälle ei koskaan anneta kohinatonta totuutta, mutta ajo on silti bittitarkasti toistettava).

seg-0556db62c45f = Sekventiaalinen tärkeysotantaan perustuva uudelleenotantahiukkassuodatin

seg-3df4251aedbd = <c1/>: deterministinen ydin on kiinnitetty täsmälleen — ESS (tehollinen otoskoko) ulottuu arvoihin { "1" }…N, systemaattinen uudelleenotanta valitsee indeksit painoon suhteutettuna, painotettu keskiarvo on konveksi yhdistelmä, Gaussin uskottavuus vetää estimaatin mittaukseen, ja siemenluvun ohjaama ennustus on deterministinen.

seg-7dca80b16a00 = Karttasovituksen uskottavuus ja palautus

seg-eb40ab2607ae = <c1/>: <c2/> saavuttaa huippunsa (= { "1" }) täydellisessä osumassa ja laskee arvoon <c3/> yhden sigman kohdalla; hiukkassuodatin erottuvan synteettisen maaston laikun yli palauttaa todellisen sijainnin { "0.1" } sisään.

seg-446d9f03a860 = 60 minuutin GPS-estetty benchmark

seg-ed29fb24d9d5 = <c1/> (<c2/>): ~{ "700" } km / yhden tunnin katko, jossa inertiaaliratkaisu ajautuu <b>≈ { "70" } km</b> päähän, palautetaan <b>≈ { "145" } m</b> tarkkuuteen (< { "500" } m) hierarkkisella karkeasta hienoon etenevällä täsmääjällä — bittitarkasti toistettava, vakaa kohinatoteutumien yli ja todistettavasti hienonnuksen rajoittama (yksittäinen karkea ruudukko jumittuu ~{ "2" } km:iin).

seg-81a2963c26cc = SRTM (Shuttle Radar Topography Mission) <c1/> DEM (digitaalinen korkeusmalli) -lataaja ja bilineaarinen näyte (ORAAKKELI A)

seg-5e7bbf951faf = <c1/> / <c2/>: käsin rakennettu { "2" }×{ "2" } <c3/>-puskuri, jonka kulmat ovat [{ "100,200" };{ "300,400" }], interpoloituu bilineaarisesti <b>täsmälleen arvoon { "250.0" }</b> solun keskellä (suljetun muodon oraakkeli), 16-bittinen big-endian-edestakainen kierto on tarkka, ja rivin kääntö sijoittaa tiedoston pohjoisimman rivin suurimmalle tallennetulle leveysasteelle — kaikki <b>GDAL:n (Geospatial Data Abstraction Library) SRTMHGT-ajurin (Shuttle Radar Topography Mission height-file format) määrittelyä</b> vasten (16-bittinen etumerkillinen big-endian, riveittäin, pohjoinen rivi ensin, tyhjä -32768, <a1>https://gdal.org/en/stable/drivers/raster/srtmhgt.html</a1>). Versionhallintaan tallennettu { "11" }×{ "11" } testiaineisto (<c4/>) harjoittaa jäsennintä CI:ssä; ja <b>versionhallintaan tallennettu todellinen julkisen alueen NASA/USGS (USGS: United States Geological Survey) SRTM v3 -laatta</b> (N36W117, Kuolemanlaakso, harvennettu 6 kaarisekuntiin, { "722" } KB, <c5/>) luetaan CI:ssä (ei ohitettu, <c6/>), ja se sijoittaa <b>Badwater Basinin tasolle ≈ −{ "78" } m dokumentoidun [−{ "95" },−{ "70" }] m:n vyöhykkeen sisällä</b> (NGS/NOAA (NGS: National Geodetic Survey; NOAA: National Oceanic and Atmospheric Administration) -mittaus ≈ −{ "86" } m), laatan maksimin ollessa ≈ { "2161" } m — totuuden lähde on mittaus, testattavana on DEM (ei kehämäinen). Suuremmat julkaistut korkeuspisteet (Mount Whitney { "4421" } m) pysyvät koko laatan testeissä, jotka on rajattu <c7/>-merkinnällä.

seg-80f985ea3e11 = Maastoon viittaava navigointi (TERCOM/SITAN (TERCOM: terrain contour matching; SITAN: Sandia Inertial Terrain-Aided Navigation)) -konvergenssi (ORAAKKELI B)

seg-9ad7bf3a8c3e = <c1/> (<c2/>): <b>käsin johdettu</b> lisätty INS-ajautuma ({ "0.5" }°N, −{ "0.4" }°E ≈ { "70" } km leveysasteella ~{ "12" }°, laskettuna kaavalla ajautuma° × M_per_deg × cos lat) palautetaan tarkkuuteen <b>< { "500" } m</b> (ruudukon erottelukyvyn lattian <c3/> sisällä), yli { "100" }-kertainen vähennys vapaaseen inertiaaliin nähden — tarkistettu <em>lisättyä</em> lukua vasten, ei koskaan DEM:iä (ei kehämäinen), bittitarkasti toistettava ja vakaa kohinasiemenluvuilla.

seg-5b7c1dc72436 = Painovoima-, magneetti- ja maastoyhdistelmän fuusiohyöty (ORAAKKELI C)

seg-7e3818f2ee2b = <c1/> (<c2/>): kolme skalaarikanavaa (Δg · |B| kuoren anomalia · korkeus) yhdistettynä tulouskottavuutena antavat <b>rajatun < { "500" } m</b> residuaalin 60 minuutin katkon yli, joka siemenluvuilla keskiarvoistettuna on <b>ei huonompi kuin paras yksittäinen kanava</b> (informaation additiivisuus / pienempi CRLB (Cramér–Rao lower bound)). Asettuu julkaistuun TERCOM- / maastoon viittaavan navigoinnin (TRN) "kymmenien metrien" CEP-alueeseen (circular error probable) (<a1>https://en.wikipedia.org/wiki/TERCOM</a1>; PeerJ { "2024" } ESKF-TERCOM (ESKF: error-state Kalman filter), <a2>https://peerj.com/articles/cs-3118/</a2>).

seg-fe23ff839bce = Rehellinen rajaus: painovoimakenttä on matala-asteinen ja synteettisiä massakeskittymiä (mascon), <b>ei</b> täysi EGM2008/EIGEN (EIGEN: European Improved Gravity model of the Earth by New techniques) -kerroinjoukko; magneettikanava nojaa tasaiseen IGRF-pääkenttään ja <b>synteettisiin</b> kuoren anomalian massakeskittymiin (todellinen korkeataajuinen kuorikartta on jatkotyö); <em>navigointipäivitys</em>-benchmarkien CI-maastokenttä on itsenäinen synteettinen DEM, kun taas <c1/>-lukija itse on nyt validoitu CI:ssä versionhallintaan tallennettua todellista SRTM v3 -laattaa vasten (yllä); täyden resoluution todelliset laatat pysyvät rajattuina merkinnällä <c2/>. Karttaesitysvirheen Monte Carlo on edelleen jatkotyö. Kaikki kolme navigaattoria on nyt kytketty skenaariomoottorin <c3/>-tyyppeihin (<c4/>, <c5/>, <c6/>).

seg-d9f7e199e5d0 = INS / IMU -virhemalli — datalehtiin viittaava validointi (<c1/>)

seg-48266c2faaed = IMU:n stokastinen virhemalli validoidaan <b>julkaistuja valmistajan datalehti- ja aineistomäärittelyjä</b> vasten — ei koskaan arvoa vasten, jonka Kshana itse on tuottanut. Silta kenttäyksiköisestä määrittelystä SI-kohinamalliin (International System of Units) on tavallinen Allanin poikkeaman tunnistus (Riley, NIST SP { "1065" } §{ "5" }; IEEE (Institute of Electrical and Electronics Engineers) Std { "952" }): satunnaiskävelykerroin <c1/> on päällekkäinen ADEV luettuna kohdassa τ = { "1" } s kulmakertoimella τ⁻¹ᐟ², ja bias-epävakauden kerroin on Allanin tasanne (<c2/>, hermeettinen — ei latausta).

seg-702de63000d2 = Todiste / oraakkeli

seg-c3fed48b98b1 = Yksikönmuunnoskerros (#1 ei-kehämäisyysriski)

seg-6cdc88d36bfd = Käsin tarkistettu: { "0.15" } deg/√hr = { "4.3633e-5" } rad/√s; { "3.6" } µg = { "3.5304e-5" } m/s²; { "2.0" } deg/hr = { "9.6963e-6" } rad/s.

seg-75afa5abcd08 = Gyron kulman satunnaiskävely

seg-d5fd60857e4d = ADIS16465 ARW { "0.15" } deg/√hr (Analog Devices -datalehti) palautettu ADEV({ "1" } s) -arvosta tarkkuudella < { "5" }%.

seg-c5e2d361b83f = Kiihtyvyysmittarin nopeuden satunnaiskävely

seg-4413d3bb39b4 = ADIS16465 VRW { "0.1" } m/s/√hr palautettu tarkkuudella < { "5" }%.

seg-ebeb0bb0e0fb = Valkoisen kohinan Allan-kulmakerroin

seg-f674ce82dc2c = ADIS16460:n valkoisen haaran log-log-kulmakerroin −{ "0.5" } ± { "0.05" }.

seg-40afd130f31d = Ajonaikaisen bias-epävakauden tasanne

seg-94acb18a94cb = ADIS16465:n gyron bias-epävakaus (BI) { "2.0" } deg/hr palautettu Allanin tasaisena minimina tarkkuudella < { "15" }%.

seg-b359e0e92e20 = Toinen IMU-profiili

seg-1a304949bcf9 = NaveGo ADIS16488 (ARW { "0.3" } deg/√hr, VRW { "0.029" } m/s/√hr) molemmat palautettu tarkkuudella < { "5" }%.

seg-fea9287d6533 = Rehellinen rajaus: tämä validoi <b>stokastisen virhemallin</b> datalehtien Allan-kertoimia vasten. i2Nav-WHU (WHU: Wuhan University) <b>KF-GINS</b> -ajoneuvoaineistoa käytetään erillisenä, aineistoon sidottuna tarkistuksena: löyhästi kytketty suljetun silmukan virhetila-EKF GNSS-vipuvarsimallilla on <a1>varmennusmatriisin</a1> VALIDATED-rivi (<em>Loosely coupled GNSS/INS EKF with lever arm on the KF-GINS dataset</em>), ja sitä verrataan KF-GINS C++ -referenssilentorataan ennen ajoa rekisteröidyillä kynnyksillä. Se ajetaan vain, kun aineisto on annettu (<c1/>); ilman sitä ajetaan synteettinen lataaja ja vipuvarsitestit. Tiukasti kytkettyjä ja kantoaallon vaiheen variantteja tämä rivi ei kata (kantoaallon vaiheen tiukasti kytketty GNSS/INS-rivi on MODELLED).

seg-f0ab98c1a79d = Syväavaruus ja Mars PNT — D0-perusta (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>)

seg-bd222b27949c = Syväavaruusnavigointimoottorin ensimmäinen välitavoite: Maahan kovakoodatun ytimen yleistäminen mielivaltaiselle keskuskappaleelle, Marsin dynamiikan lisääminen, efemeridintarjoajan rajapinta, alle mikrosekunnin aika sekä valoajan ja relativistisen viiveen perusosat. <b>Jokainen olemassa oleva Maa-skenaario on tavuittain identtinen</b> — alustojen välisen toistettavuuden golden-tiedostot (<c1/>, <c2/>) läpäisevät muuttumattomina ilman uudelleengenerointia, mikä varmistetaan jokaisessa commitissa.

seg-e0cdbfcbb28a = Keskuskappaleen abstraktio (Maa tavuittain identtinen)

seg-7d20649189fa = <c1/>: <c2/> ja <c3/>. <c4/> varmistaa, että <c5/> ja <c6/> ovat yhtä kuin vanhat Maa-funktiot <b>täsmälleen bittitasolla</b> (<c7/>), ja oletusarvoisella <c8/>-rakenteella laskettu Maa-kaari on tavuittain identtinen — toistettavuuden golden-tiedostot ovat muuttumattomia (sama SHA, ei uudelleengenerointia).

seg-658acc8112e3 = Marsin painovoima (GMM-3 (GMM: Goddard Mars Model) tesseraalinen, kappaleeseen kiinnitetty)

seg-9b058665cf4b = <c1/>: vyöhykekertoimet C̄20/C̄30/C̄{ "40" } MRO110:n (Mars Reconnaissance Orbiter -painovoimaratkaisu) J2/J3/J4-arvoista (<c2/>, J2 palautuu edestakaisin arvoon { "1.9604e-3" }) sekä MRO110B2:n sektoriaaliset ja tesseraaliset C̄22/S̄{ "22" }, C̄32/S̄{ "32" } (Konopliv ym. { "2011" }; taulukoitu julkaisussa Liu, Baoyin & Ma { "2012" }), arvioituna IAU:n Marsiin kiinnitetyssä kehyksessä. <c3/> tarkistaa edestakaisen kierron, J2-mittakaavan poikkeaman pistemassasta ja sen, että kenttä on aidosti kappaleeseen kiinnitetty (neljänneksen Marsin vuorokauden uudelleensuuntautuminen muuttaa inertiaalista kiihtyvyyttä). Korkeampi aste/kertaluku ladataan mukana toimitetusta tiedostosta <c4/> funktiolla <c5/>.

seg-1dcbee768418 = Marsiin kiinnitetty kehys (IAU:n napa)

seg-0708e5b37d69 = <c1/>: IAU:n 3-1-3-kierto <c2/> (WGCCRE/NAIF (WGCCRE: Working Group on Cartographic Coordinates and Rotational Elements) -käytäntö, sama kuin <c3/>). Testit: ortonormaali tarkkuudella { "1e-12" } determinantilla +{ "1" }, edestakainen identiteetti, nollameridiaani etenee nopeudella <c4/> vuorokaudessa.

seg-5b6355a143c7 = Marsin / Aurinko-keskinen propagointi

seg-4ab87f666765 = <c1/> (sisäinen johdonmukaisuus)

seg-12e3d173340b = <c1/>: matala Mars-rata palaa lähtöpisteeseensä yhden Kepler-jakson jälkeen (sulkeutuminen); ominaisenergia ε=v²/2−μ/r ajautuu < { "1e-9" } kaaren yli; Marsin J2:n maallinen solmun regressio vastaa analyyttistä Vallado-nopeutta (laskettu riippumattomasti ≈ −{ "5.15" } °/vrk inklinaatiolla { "60" }°) { "3" } %:n tarkkuudella; heliosentrinen rata palauttaa ~687 vuorokauden Marsin vuoden (vis-viva ja riippumaton jakson palautus kaaresta). Ei ulkoista dataa.

seg-acff4c016089 = DE440-ristiinvalidointi (heliosentrinen Mars)

seg-ed164e298754 = <c1/> (työtilan ULKOPUOLELLA; MPL-2.0-lisensoitu ANISE rajattu omaan Cargo.lock-tiedostoonsa; peilaa kohdetta <c2/>): vertaa Kshanan Aurinko-keskistä Marsin propagointia JPL DE440:een (ANISEn kautta), Horizonsin totuus siteerattu sanatarkasti (alkuperä ja SHA-256). <b>Toistettu tulos</b> (siemen JD (Julian date) { "2459580.5" } TDB (Barycentric Dynamical Time), <c3/> SHA-256 <c4/>): paikkaresiduaali <b>{ "137" } m 1 vuorokauden kaarella</b> ({ "5.97" }×{ "10" }⁻¹⁰ heliosentrisestä etäisyydestä { "2.299" }×10¹¹ m), kasvaen arvoon { "3.3" } km kohdassa { "5" } vrk, { "87.9" } km kohdassa { "30" } vrk, { "1.71" } Mm kohdassa { "90" } vrk — residuaali <em>kasvaa</em> kaaren pituuden mukana, koska Aurinko-keskinen kaksikappalemalli jättää tarkoituksella pois planeettojen häiriöt (pääasiassa Jupiter) ja Mars-järjestelmän sisäisen liikkeen, jotka DE440:n barycenter-efemeridi sisältää, joten kasvu on rehellinen tunnusmerkki mallintamattomasta n-kappaledynamiikasta eikä integraattorin virhe; lyhyt kaari, joka pysyy pienenä murto-osana heliosentrisestä etäisyydestä, vahvistaa Aurinko-keskisen koneiston oikeaksi. Ajetaan vain, kun DE440-ydin on käytettävissä (<c5/>, tai noudetaan automaattisesti ~{ "32" } MB) — manuaalinen / <c6/> DE-luokan tarkistus, <b>ei</b> oletusarvoinen CI-portti, joten julkaistu crate ja jokainen oletusportti pysyvät tavu tavulta koskemattomina.

seg-a7d79066a53b = Valoaika ja Shapiro-viive

seg-798148171dab = <c1/>: iteratiivinen viivästetyn epookin valoaikaratkaisu (konvergoituu |Δτ| < { "1e-12" } s, rajattu) ja Shapiro-viive Δt=(2μ/c³)·ln[(r1+r2+r12)/(r1+r2−r12)]. Testit: Maa–Aurinko ≈ { "499" } s ja Maa–Kuu ≈ { "1.28" } s sisäänrakennetulla efemeridillä; synteettinen vakionopeuksinen lähettäjä palauttaa analyyttisen viivästetyn ratkaisun tarkkuudella < { "1e-9" } s (ratkaisija todistettu riippumattomaksi mistään todellisesta efemeridistä); Shapiro vastaa käsin laskettua arvoa täsmälleen ja antaa ~{ "100" }–{ "250" } µs Maa–Mars-yläkonjunktion sivuavalle säteelle.

seg-1bc28f6bdc8f = Efemeridintarjoajan rajapinta

seg-34d6a07ad252 = <c1/>: <c2/> ja ytimetön <c3/> (Montenbruck–Gill Aurinko/Kuu, geosentrinen); palauttaa arvon <c4/> kappaleille, joille sillä ei ole sarjaa (esim. Mars), ja niille polku on DE-luokan ANISE-tarjoaja — sama sisäänrakennettu vs ANISE -jako kuin <c5/>/<c6/>.

seg-5e1fed7a98c0 = Kaksiosainen aika ja TT↔TDB

seg-5ebca9b5f2db = <c1/>: <c2/> Knuthin kahden summan kertymällä palauttaa alle mikrosekunnin välit, jotka yksittäinen f64-JD menettää J2000:n lähellä (>{ "1000" }× parempi, testattu); <c3/>/<c4/> käyttävät hallitsevaa Fairhead–Bretagnon jaksollista sarjaa (|TDB−TT|≲{ "1.7" } ms, käsin varmennettu hetkellä J2000). Lisäävä — nykyinen yhden f64:n aikapolku ei muutu.

seg-d2da2e1d1711 = Syväavaruuden radiometriset suureet ja CCSDS Tracking Data Message — D1 (<c1/>, <c2/>)

seg-b98f508f2375 = Syväavaruusnavigointimoottorin toinen välitavoite: <b>havaintosuuremalli</b>, joka muuntaa D0:n valoaika- ja relativistisen viiveen ytimen niiksi suureiksi, jotka Deep Space Networkin (DSN) tai ESTRACKin (European Space Tracking network) seurantakierros raportoi — etäisyys, yksi-, kaksi- ja kolmitieinen Doppler, koherentti transponderin käännös, regeneratiivinen / PN (PN: pseudo-noise) -etäisyysmittaus, Δ-DOR (DOR: differential one-way ranging) ja etenemisväliaineet — sekä <b>CCSDS (Consultative Committee for Space Data Systems) 503.0-B Tracking Data Message (TDM)</b> -syöttö ja -tuloste, joka lukee ja kirjoittaa standardin viraston seurantatiedoston. <b>Rehellinen rajaus:</b> nämä ovat Moyerin / CCSDS:n käytäntöjä noudattavia <b>tarkkoja geometrisia malleja</b>; <em>mittauskohina</em> on kutsujan antama havaintokohtainen <c1/>, ei mallin sisään rakennettu. <em>Tietyn todellisen seurantakierroksen</em> toistaminen vaatii todellista TDM-dataa ja syväavaruuden radanmääritysratkaisijan — se on <b>D2</b>, ei D1. Kaikki alla oleva on lisäävää (toistettavuuden golden-tiedostot ovat muuttumattomia; sama SHA, ei uudelleengenerointia).

seg-d1d2dc7906c8 = Etäisyys ja 1/2/3-tieinen Doppler (Moyerin kahden osuuden ratkaisu)

seg-e2176b844df8 = <c1/>: <c2/>/<c3/> yhdistävät D0:n viivästetyn (alasuunnan) ja etenevän (ylösuunnan) valoaikaratkaisun; koko edestakaisen matkan käytäntö on <c4/> (m), dokumentoitu ja johdonmukainen. <c5/>/<c6/>/<c7/> muodostavat kantoaallon siirtymän <c8/> (Hz) näkölinjan etäisyysnopeudesta, <b>merkkikäytäntö: lähestyvä avaruusalus antaa positiivisen (sinisen) siirtymän</b>. Testit: kaksitieinen etäisyys = osuuksien summa tarkkuudella < { "1" } mm (~{ "2" } AU Maa–Aurinko-edestakainen matka); yksitieinen etäisyys = <c9/> täsmälleen; yksitieinen Doppler vastaa analyyttistä <c10/> säteittäiselle vakionopeuksiselle lähettäjälle ppt-tarkkuudella; kolmitieinen samassa paikassa olevilla asemilla romahtaa tavu tavulta kaksitieiseksi.

seg-638697be5b5b = Koherentti transponderin käännös (tarkat DSN-suhteet)

seg-781aa4041c58 = <c1/>: tarkat rationaaliset DSN/CCSDS-käännösluvut <c2/> (Moyer §{ "13" }; DSN 810-005 module 201/214) — S/S 240/221, S/X 880/221, X/S 240/749, X/X 880/749, X/Ka 3344/749, Ka/Ka 3360/3599. Testattu täsmälliselle yhtäsuuruudelle; määrittelemätön kaistapari <b>paniikkaa</b> (kaatuu äänekkäästi, ei koskaan keksi suhdetta). <c3/> soveltaa kaistan kantoaaltoa ja suhdetta päästä päähän ja on yhtä kuin eksplisiittinen <c4/> koneen tarkkuudella.

seg-f24f9da1570c = Regeneratiivinen / PN-etäisyysmittaus (CCSDS { "414" }; ambiguiteetti)

seg-1abd8c221e8d = <c1/>: <c2/> = <c3/> (chip-kohtaisen erottelun mittakaavan yksiselitteinen etäisyys) ja <c4/> = se kerrottuna koodin pituudella (koko PN-koodin yksiselitteinen etäisyys <c5/>), CCSDS 414.1-B:n mukaan. Testattu: { "1" } MHz:n etäisyyskello antaa ~{ "149.9" } m; CCSDS-414.1:n painotetun äänestyksen PN-koodi ({ "1 009 470" } chippiä) nopeudella { "1" } Mchip/s antaa suunnitellun ~{ "151 000" } km:n yksiselitteisen etäisyyden; chip-nopeuden kaksinkertaistaminen puolittaa chip-kohtaisen ambiguiteetin.

seg-16b9fdd916a7 = Δ-DOR (CCSDS { "506" } taivaantason)

seg-93055e944306 = <c1/>: differentiaalinen taivaantason viive <c2/> (s) interferometrin kantaviivalle <c3/> (CCSDS 506.1-B). Testattu: vastaa tarkkaa analyyttistä projektiota <c4/> tunnetulle kantaviivan suuntaiselle poikkeamalle tarkkuudella { "1e-15" } s, pienen kulman suuruutta <c5/> ja <b>nollaa</b> (kvasaarin kanssa samaan suuntaan osoittava avaruusalus antaa täsmälleen nollan differentiaalisen viiveen).

seg-4e5258bb04d5 = Plasman 1/f²-kaksoistaajuuskalibrointi

seg-e3b340103825 = <c1/>: <c2/> = <c3/> (dispersiivinen <c4/>-varattujen hiukkasten ryhmäviive, <c5/>); <c6/> Cassini-luokan <c7/> koronan pylväs (analyyttinen sijaisarvo, ei kalibroitu korona); <c8/> <c9/> -dispersioinversio, jota DSN käyttää plasman poistamiseen. Testattu: 1/f²-laki <c10/>; korona kasvaa konjunktiota kohti; ja <b>lisätty TEC palautuu tarkkuudella < { "1" } %</b> (itse asiassa ≪ { "1e-9" } kohinattomana) — <c11/>.

seg-e1e265ab499a = Tropo- / ionovälineet (GNSS-mallien uudelleenkäyttö)

seg-2d9aa52f318b = <c1/>/<c2/>: syväavaruuden maa-asemasegmentti läpäisee saman Maan ilmakehän, jonka GNSS-paketti jo mallintaa, joten nämä delegoivat funktioille <c3/> (Saastamoinen-zenith + Niell-kuvaus, ei-dispersiivinen) ja <c4/> (lähetetty iono). Testattu kytkettynä ja fysikaalisesti oikealla merkillä: tropo positiivinen ja suurempi matalalla korkeuskulmalla kuin zenitissä; iono ei-negatiivinen vinoviive (numeerinen tarkkuus on GNSS-paketin omien datalehtiin viittaavien testien asia).

seg-44ba6e0411fd = CCSDS-TDM { "503" } -jäsennys / -tuloste ja radiometrinen silta

seg-18eafe936dcb = <c1/>: CCSDS 503.0-B-2 KVN (keyword-value notation) -lukija <b>ja</b> -kirjoittaja (otsikko + <c2/> / <c3/> -segmentit; <c4/>/<c5/>/<c6/>/<c7/> -tietueet). Testit (<c8/> + <c9/>): referenssitestiaineisto jäsentyy odotetuiksi nimetyiksi kentiksi; <b>jäsennys→tuloste→jäsennys on yhtä suuri rakenne</b> (semanttinen edestakainen kierto); silta <c10/> kuvaa yksiselitteiset <c11/>/<c12/>-tietueet rakenteeksi <c13/> (tie kentästä <c14/> <c15/>/<c16/>/<c17/>, kaista kentästä <c18/>, km→m); usean segmentin tiedosto nollaa tilakoneen. <b>Rehellinen ohita, älä arvaa:</b> kulmat ja taajuudet, tuntemattomat kaistat, vuorokauden järjestysnumeroon perustuvat epookit ja tunnistamattomat aikajärjestelmät <b>ohitetaan</b>, niitä ei koskaan kuvata väärin, ja <c19/> jätetään arvoon <c20/> kutsujan painotettavaksi.

seg-e8ca55dd29b1 = DSN/ESTRACK-benchmark (mallin toistotarkkuus ≫ julkaistu lattia)

seg-247b9e7b2be8 = <c1/>: havaintosuureet ovat tarkkoja geometrisia laskuja, joten rehellinen benchmark on, että <b>mallin oma numeerinen virhe on selvästi julkaistun DSN/ESTRACK-mittauslattian alapuolella</b> — malli ei ole tarkkuuden pullonkaula, kutsujan antama σ on. Jokainen testi laskee havaintosuureen kahdella riippumattomalla tavalla (tai palauttaa lisätyn totuuden) ja varmistaa, että residuaali on lattian alapuolella: <b>etäisyys</b> palautuu edestakaisin tarkkuudella < { "1" } mm ≪ ~{ "1" } m PN-etäisyysmittauksen lattia (DSN 810-005 mod. { "214" } / CCSDS 414.1-B); <b>Doppler</b> vastaa tarkkaa suljetun muodon viivästettyä etäisyysnopeutta <c2/> tarkkuudella ~{ "10" }⁻⁶ m/s, useita kertoja alle ~{ "0.05" } mm/s X-kaistan lattian (DSN 810-005 mod. { "203" } / Moyer) — residuaali on f64:n etäisyyserotuksen lattia kohdassa ~{ "1" } AU, numeerinen ominaisuus eikä mallinnusvirhe; <b>Δ-DOR</b> toistaa suljetun muodon projektion vastaavalla taivaantason kulmalla ≪ { "1" } nrad ≪ ~{ "1" }–{ "10" } nrad:n lattia (DSN 810-005 mod. { "210" } / CCSDS 506.1-B); <b>plasman</b> kaksoistaajuus palauttaa lisätyn viiveen tarkkuudella ≪ { "1" } %; ja <b>Shapiro</b>-viive asettuu julkaistuun ~{ "100" }–{ "250" } µs:n Maa–Mars-konjunktion vyöhykkeeseen. Julkaistut luvut esitetään ja merkitään <b>suuruusluokkaa</b> kuvaaviksi DSN-määrittelyiksi, ei keksityiksi tarkoiksi luvuiksi, ja moduulin dokumentaatio toteaa selvästi, että tämä vertailee MALLIN TOISTOTARKKUUTTA, ei todellisen kierroksen toistoa (se on D2 + todellinen TDM).

seg-2a25e6a8a5b1 = Syväavaruuden redusoidun dynamiikan OD — D2 (<c1/>, <c2/>, <c3/>)

seg-0d7a1b75a0ea = Syväavaruusnavigointimoottorin kolmas välitavoite: <b>estimaattori</b>, joka muuntaa D1:n radiometriset havaintosuureet palautetuksi lentoradaksi — numeerisesti vakaa neliöjuuri-informaatiosuodatin (Square-Root Information Filter, SRIF), jossa on redusoidun dynamiikan empiiriset kiihtyvyydet, kolmitilainen aluksen kello, Marsin ilmakehän vastusmalli ja radiometriset mittausosittaisderivaatat, jotka yhdistävät etäisyyden ja Dopplerin suodattimen tilaan, ja jonka päästä päähän sulkee synteettinen matalan Mars-radan (LMO) radanmäärityksen palautus. <b>Rehellinen rajaus:</b> palautus on <b>synteettinen suljettu silmukka</b> (totuus ja suodatin jakavat saman Marsin propagaattorin, ja havainnot ovat sama geometrinen havaintosuuremalli, jonka suodatin kääntää, sekä lisätty Gaussin kohina) — se validoi <b>estimaattorin koneiston</b>, ei Marsin voimamallin absoluuttista tarkkuutta; DE-luokan ulkoinen ristiintarkistus on ytimeen sidottu <c1/>-crate (D0.8b). Kaikki alla oleva on lisäävää (toistettavuuden golden-tiedostot ovat muuttumattomia; sama SHA, ei uudelleengenerointia).

seg-51f203291066 = SRIF-ydin (neliöjuuri-informaatiosuodatin)

seg-9d5fd8c1d37d = <c1/>: käsin toteutettu Biermanin neliöjuuri-informaatiosuodatin — yläkolmiomatriisi <c2/> ja <c3/>, informaatiovektori <c4/>, Householder-mittaus- ja aikapäivitykset, paljas <c5/>-aritmetiikka (ei nalgebraa). Testit: sekventiaalinen SRIF vastaa erä-painotetun pienimmän neliösumman (<c6/>) ratkaisua <b>sekä tilassa että kovarianssissa tarkkuudella { "1e-9" }</b> suunnitellussa lineaari-Gaussin ongelmassa (<c7/>); palautettu kovarianssi <c8/> on <b>symmetrinen ({ "1e-12" }) ja positiividefiniitti konstruktion perusteella</b> pitkän mittaus- ja aikapäivityssarjan jälkeen (<c9/>, Cholesky onnistuu); ja informaatio kertyy (<c10/>:n jälki pienenee monotonisesti, kun samalla geometrialla tehtyjä mittauksia lisätään).

seg-f9ffa1ef4688 = Redusoidun dynamiikan empiiriset kiihtyvyydet (matkalento↔LMO-viritys)

seg-b0612a7140c3 = <c1/>: yhdeksäntilainen <c2/>-suodatin, jossa RTN-empiiriset kiihtyvyydet ovat ensimmäisen asteen Gauss–Markov-prosessitiloja, JPL:n/ESOC:n redusoidun dynamiikan tekniikka esitettynä yhtenä <c3/>-säätimenä (lähes dynaaminen ⇒ tasoittaa kohinaa ballistisella kaarella; lähes kinemaattinen ⇒ empiirinen taso absorboi mallintamattoman ohjailun tai vastuksen). Testit: lähes kinemaattinen suodatin seuraa <b>portaittaista (potkurin) ohjailua</b> alle ½ residuaalilla verrattuna lähes dynaamiseen, kun taas lähes dynaaminen suodatin <b>tasoittaa kohinaista ballistista kaarta</b> paremmin (<c4/>); tiukkuuden pyyhkäisy siirtää sovituksen jälkeistä residuaalia <b>monotonisesti</b>, jatkumona eikä kytkimenä (<c5/>).

seg-9d5db4d63990 = 3-tilainen aluksen kello (vaihe/taajuus/ajautuma, van Loan Q, Allan)

seg-fe5beef74e24 = <c1/>: vaiheen, suhteellisen taajuuden ja taajuusajautuman virhetila <b>tarkalla van Loanin diskreetillä prosessikohinalla</b> ja Joseph-vakautetulla päivityksellä. Testit: diskretisoitu <c2/> vastaa käsin johdettua van Loanin polynomia <b>tarkkuudella { "1e-12" }</b> ja <b>palautuu täsmälleen kaksitilaiseen KalmanClock Q:hun, kun ajautuma = { "0" }</b> (aito ylijoukko); usean askeleen rannikkoliuku kasvattaa vaiheen varianssin analyyttiseen NIST SP { "1065" } holdover-suhteeseen termin <c3/> satunnaiskulkutermin kautta; ajautumatila <b>palauttaa todellisen ikääntymisrampin tarkkuudella < { "5" } %</b>; <b>USO-luokan Allan-profiili palautetaan</b> (päällekkäinen ADEV kohdassa τ={ "1" } s kalibrointiportin sisällä) ja estimaattori pysyy NEES-johdonmukaisena (>{ "95" } % 3σ:n sisällä) ja PSD:nä ankaran <c4/>-ajon läpi. <c5/> kantaa siteeratut CSAC/USO/DSAC (USO: ultra-stable oscillator; DSAC: Deep Space Atomic Clock) <c6/> -luvut ja Doppler-lattian <c7/>.

seg-8666d18daa2b = Marsin ilmakehän vastus (Mars-GRAM-lite (GRAM: Global Reference Atmospheric Model))

seg-6a64c2b9e553 = <c1/>: paloittain eksponentiaalinen Marsin neutraalitiheysprofiili (pinta ~{ "0.020" } kg/m³, pinnan lähellä skaalakorkeus ~{ "11" } km, Mars-GRAM { "2010" } / MCD (Mars Climate Database) matalan pölyn keskiarvo) ja <b>mukana pyörivään</b> Marsin ilmakehään nähden otettu neliöllinen vastuskiihtyvyys sekä <c2/>-variantti, jolla SRIF voi kertoa. Testit: tiheys pienenee monotonisesti ja jatkuvasti kaistojen yli, palautettu pinnan lähellä oleva skaalakorkeus on fysikaalinen ~{ "11" } km, vastus on <b>täsmälleen vastakkaissuuntainen suhteelliseen nopeuteen nähden</b> (ristitulo häviää tarkkuudella { "1e-12" }) järkevällä ~{ "3e-4" } m/s² LMO-suuruudella, ja se on lineaarinen ballistisen termin suhteen. <b>Rehellinen rajaus:</b> edustava insinööriilmakehä, ei lennolla validoitu Mars-GRAM/MCD pöly-, vuodenaika- ja paikallisaikariippuvuuksineen.

seg-452f32dace80 = Radiometriset mittausosittaisderivaatat (etäisyys/Doppler) SRIF:lle

seg-6661d241cdaf = <c1/> / <c2/>: näkölinjan etäisyys <c3/> (∂ρ/∂r = û, ∂ρ/∂v = { "0" }) ja etäisyysnopeus <c4/> (∂ρ̇/∂v = û, ∂ρ̇/∂r = (v_rel − ρ̇·û)/ρ) -osittaisderivaatat, jotka yhdistävät D1:n havaintosuureet suodattimen tilaan, sekä yksitieisen Dopplerin kellotaajuuden osittaisderivaatta <c5/>. Testit: molemmat osittaisderivaatat vastaavat <b>havaintosuureen keskeisdifferenssiä tarkkuudella { "1e-6" }</b> (<c6/>, <c7/>); yksittäinen etäisyyspäivitys <b>kutistaa kovarianssin havaitussa (näkölinjan, LOS) suunnassa ≫{ "1000" }×</b> ja pitää sen positiividefiniittinä (PD), ja Doppler-päivitys kutistaa LOS-<b>nopeuden</b> varianssia (<c8/>, <c9/>).

seg-9a2cb6292477 = Mars-LMO:n päästä päähän -OD radiometrisestä datasta

seg-6318968b683a = <c1/>: totuuden mukainen matalan Mars-radan kaari, propagoituna painovoimalla <c2/>, tuottaa kohinaisen kaksitieisen <b>etäisyyden (σ={ "1" } m) + Dopplerin (σ={ "0.1" } mm/s)</b> kahdelle sela-asemalle; redusoidun dynamiikan SRIF palauttaa radan <b>~{ "2.7" } km:n häiritystä</b> alkutilasta. Saavutettu: konvergoitu paikan <b>RMS ≈ { "0.2" } m</b> (alle metrin, selvästi metrien ja kymmenien metrien valmiuskriteerin sisällä) 3 kierroksen, { "30" } s:n näytteenottovälin kaarella, ja <b>tekijöihin jaettu kovarianssi on positiividefiniitti jokaisella epookilla</b> (SRIF:n takuu, varmistettu koko ajan). <b>Matkalento→LMO-virityksen jatkumo</b> harjoitetaan päästä päähän: kun totuudessa on mallintamaton vastus, jota suodatinmallipohjassa ei ole, redusoidun dynamiikan säädin (tiukkuus { "1" }) palauttaa ~{ "14" } m verrattuna lähes dynaamisen (tiukkuus { "0" }) ajon ~{ "677" } m:iin — { "48" }-kertainen parannus, kun empiirinen taso absorboi vastuksen. <b>Rehellinen rajaus:</b> synteettinen suljettu silmukka (totuus = sama propagaattori, jota suodatin käyttää); DE-luokan ulkoinen ristiintarkistus on ytimeen sidottu <c3/> (D0.8b), jota ei koskaan ajeta täällä, ei verkkoa.

seg-559176eb1a82 = Syväavaruuden PNT-skenaario ja yksi- ja kaksitieinen fuusio — D3 (<c1/>, <c2/>)

seg-bdb5da496071 = Syväavaruusnavigointimoottorin neljäs välitavoite: ajettava <b>Mars-PNT-tuoteskenaario</b>, joka sitoo D0:n Marsin kappaleen ja kehyksen, D1:n radiometriset havaintosuureet ja D2:n redusoidun dynamiikan OD:n yhdeksi skenaariotyypiksi <c1/>. Se mallintaa pientä <b>MARCONI-tyyppistä välitystähdistöä</b>, joka lähettää yksitieisen (kellokytketyn) signaalin avaruudessa ja välittää kaksitieisen (koherentin, kellosta vapaan) linkin syväavaruusasemalle, ja navigoi kolme referenssikäyttäjää (Marsin siirtorata, matalan Mars-radan kiertäjä, kiinteä pintapiste) <b>D3.1:n yhteisellä yksi- ja kaksitieisellä fuusioestimaattorilla</b> — kahdentoistatilainen SRIF, joka laajentaa D2:n redusoidun dynamiikan rata- ja empiirisen lohkon kolmitilaisella aluksen kellolla. <b>Rehellinen rajaus:</b> jokainen laatumittari on estimaattorin <b>muodollinen kovarianssiraja</b> (epookkikohtainen 1σ / 3σ paikka) ja saavutettu RMS <b>synteettistä suljettua silmukkaa</b> vasten (totuus ja suodatin jakavat saman Marsin dynamiikan ja saman geometrisen havaintosuuremallin, sekä lisätty Gaussin kohina) — simuloitu navigoinnin laatumittari, <b>EI</b> ilmailun sertifioima suojaustaso ja <b>EI</b> lentoväite (ei sertifioitua vikamallia, ei eheysvalvontaa, ei todellista seurantadataa). Kaikki alla oleva on lisäävää (toistettavuuden golden-tiedostot ovat muuttumattomia; sama SHA, ei uudelleengenerointia).

seg-b81920d2df82 = Yhteinen yksi- ja kaksitieinen radiometrinen fuusio (fuusio päihittää kumman tahansa yksin)

seg-cd9d2a7dd08f = <c1/>: D2.2:n redusoidun dynamiikan SRIF laajennettuna kolmella aluksen kellotilalla (<c2/>), joka ottaa sisään <b>kaksitieisen</b> (kellosta vapaa, radan kiinnittävä — nolla kellosarakkeita osittaisderivaatassa) ja <b>yksitieisen</b> (kellokytketty — taajuusosittaisderivaatta <c3/>) etäisyyden ja Dopplerin sekaisen aikasarjan funktion <c4/> kautta. Kalibroi ja liu'u -rakenne: kaksitieiset kierrokset kiinnittävät radan, yksitieinen data kalibroi sitten kellon ja liu'uttaa rataa kierrosten välillä virheellä, jota rajaa kellon Allan-vakaus. Testattu tiedostossa <c5/> <c6/>: <b>fuusioitu</b> ratkaisu päihittää <b>kumman tahansa linkkityypin yksin</b>; pelkän yksitieisen ajon liukuvirhe kasvaa kaksitieisten kierrosten välisen aukon mukana johdonmukaisesti kelloluokan Allan-rajan kanssa; yhteinen kovarianssi pysyy SPD:nä (symmetrinen positiividefiniitti) koko ajan.

seg-26a4bfa8e6ad = MARCONI-tähdistö (areostationäärinen säde, peittyminen)

seg-f2c2e1b83411 = <c1/>: viiden välittimen joukko — kolme <b>areostationääristä</b> välitintä säteellä <c2/> (Marsin synkroninen säde julkaistuista μ:stä ja pyörimisnopeudesta; testattu <b>{ "20 400" }–{ "20 500" } km</b> -vyöhykkeessä) tasavälein { "120" }° pituuspiirillä ja { "5" }° inklinaatiolla, sekä kaksi välitintä korkeammalla ({ "1.4" }× areostationäärinen) { "60" }°:n inklinaation ympyräradalla taivaantason peittoa varten. Epookkikohtaiset välittimien tilat integroidaan eteenpäin painovoimalla <c3/>; <b>Marsin peittymisen</b> näkyvyystesti on jänne-ohittaa-pallo-geometria (<c4/>, testattu: halkaisijaltaan vastakkainen välitin on peitossa, yläpuolella oleva välitin näkyy). <b>Rehellinen rajaus:</b> pienin edustava lähetys- ja välitysgeometria, rakennettu julkaistuista Marsin vakioista — ei tietty lentotähdistösuunnitelma.

seg-b53ea4dd9f7d = Skenaario <c1/> käytettävissä CLI:stä / Pythonista / WASM:sta (WebAssembly) / MCP:stä (Model Context Protocol)

seg-3a01d13ad2e7 = <c1/> / <c2/> on kytketty skenaariona <c3/> kaikille pinnoille (D3.3): CLI-ajaja, Python-sidos, WASM/playground-käännös ja MCP-palvelimen jakelu reitittävät kaikki siihen (<c4/> edestakaisen kierron testi <c5/>). Toimitetut referenssiskenaariot: <c6/>, <c7/>, <c8/>. Tulos kantaa eksplisiittistä <c9/>-merkintää, joka nimeää laatumittarin kovarianssirajaksi (ei sertifioiduksi suojaustasoksi), ja tulosteet <c10/> / <c11/> toistavat rehellisyysmerkinnän.

seg-28a49a455a74 = MARCONI / LightShip -tavoitteet toistettu: <b>< { "100" } m kiertäjä</b>, <b>< { "15" } m kulkija</b>

seg-28da71940857 = <c1/>: julkaistut MARCONI / LightShip -ohjelman tavoitteet (kiertäjä < { "100" } m, pinta/kulkija < { "15" } m) toistettuna simulaatiossa. <b>Yhteiset oletukset:</b> viiden välittimen oletus-MARCONI-tähdistö; jokainen näkyvissä oleva välitin antaa yksitieisen etäisyyden ja Dopplerin epookkia kohti; koherentti kaksitieinen asemakierros <b>{ "30" } min</b> välein; DSN-luokan kohina (<b>etäisyyden σ = { "1" } m, Dopplerin σ = { "0.1" } mm/s</b>); yhteinen redusoidun dynamiikan rata- ja 3-tilaisen kellon fuusiosuodatin, joka käynnistetään <b>~{ "2.7" } km</b>:n verran häirityllä a priori -tilalla (tiukkuus { "0.1" }); laatumittari = konvergoitu kaaren takapuoliskon 3D-paikan RMS synteettistä totuutta vasten. <b>Kiertäjä</b> (LMO ~{ "400" } km / { "60" }° inkl., <b>USO</b>-kello, { "60" } s:n näytteenottoväli, ~{ "2" } h ≈ yhden kierroksen kaari): saavutettu konvergoitu RMS <b>≈ { "0.40" } m</b> ≪ { "100" } m:n tavoite (keskimäärin { "3.1" } välitintä näkyvissä, kovarianssi SPD koko ajan). <b>Kulkija</b> (kiinteä päiväntasaajan pintapiste, <b>USO</b>-kello, { "30" } s:n näytteenottoväli, ~{ "2" } h:n kaari): saavutettu konvergoitu RMS <b>≈ { "5.1" } m</b> < { "15" } m:n tavoite (keskimäärin { "3.0" } välitintä näkyvissä, kovarianssi SPD). <b>Molemmat tavoitteet saavutettiin höllentämättä mitään varmistusta</b> — USO on realistisista aluksen kelloluokista <em>vähemmän</em> kyvykäs (DSAC vain auttaisi) ja 30 minuutin kaksitieinen toistoväli on varovainen tavanomaiselle välitysverkon aikataululle, joten oletukset ovat fysikaalisesti kohtuullisia MARCONI-luokan järjestelmälle eikä niitä ole viritetty läpäisyä varten. <b>Rehellinen rajaus:</b> simuloitu toisto ilmoitetuilla oletuksilla, EI lentoväite eikä sertifioitu suojaustaso; synteettinen suljetun silmukan totuus jakaa suodattimen Marsin dynamiikan ja havaintosuuremallin.

seg-37b2bad62854 = Kuun koordinaattiaika — relativistinen Maa–Kuu-kellon nopeus (<c1/>)

seg-787705fa0fac = Kuun koordinaattiaika-asteikko (LTC/TCL (TCL: Temps-Coordonnée Lunaire, Kuun koordinaattiajan ranskankielinen nimi)) vaatii maallisen nopeuden, jolla Kuun pinnan kello kulkee suhteessa Maan geoidin (TT) kelloon. <c1/> laskee sen ensimmäisistä periaatteista: ensimmäisen post-Newtonin identiteetti, joka summaa <b>omapotentiaalin eron</b> (IAU:n <c2/> -sopimuksen mukainen geoidin potentiaali <c3/> miinus Kuun pinnan omapotentiaali <c4/>) ja <b>kineettisen (toisen asteen Doppler) termin</b> <c5/> geosentrisestä Kuun nopeudesta (äärellisin erotuksin tiedostossa <c6/> olevasta Montenbruck-Gill-kuusarjasta). Hallitseva omapotentiaalitermi antaa <b>≈ { "57.5" } µs/vrk</b>, kineettinen termi <b>≈ −{ "0.5" } µs/vrk</b>, yhteensä <b>≈ { "57" } µs/vrk</b>. Skenaario <c7/> raportoi tämän nopeuden, kertyneen LTC−TT-poikkeaman horisontin yli ja tukee minimaalista käänteisvarianssi-ensemblea (Kuun paperikello); TT↔LTC-muunnokset palautuvat edestakaisin tarkkuudella < { "1" } ns/vrk.

seg-beeb6561ef6b = Oraakkeli / rehellinen rajaus

seg-4500e65ede97 = Relativistinen Maa–Kuu-kellon nopeus (LTC/TCL)

seg-4c7a29bc3003 = <c1/>, <c2/>/<c3/>, <c4/>, <c5/>. <b>Oraakkeli: sisäinen suljetun muodon relativistinen identiteetti</b> (IAU:n <c6/> / IERS-sopimusten geopotentiaali ja GM/r (GM: gravitaatioparametri, G kertaa massa) -omapotentiaali), <b>ristiintarkistettu julkaistua Kuun kellon nopeuden vyöhykettä [{ "56" }, { "59" }] µs/vrk vasten</b>. Testit (<c7/>): omapotentiaalitermi ≈ { "57.5" } µs/vrk, Kuun nopeus ≈ { "1" } km/s, kineettinen termi pieni negatiivinen, kokonaisuus vyöhykkeessä ja nimetyt termit summautuvat siihen, 1 vuorokauden LTC−TT-poikkeama ≈ { "57" } µs ja TT↔LTC-edestakainen kierto < { "1" } ns/vrk. <b>Rehellinen rajaus:</b> keskeinen µs/vrk-luku on <b>vertailukohteesta riippuva</b> — se riippuu valituista vertailupinnoista (Maan geoidi <c8/> vs Kuun selenoidi), aikakeskiarvoistuksen ikkunasta ja laiminlyödyistä alle µs/vrk:n keskipakoisvoiman ja J₂:n korjauksista — minkä vuoksi julkaistu tulos on <b>vyöhyke</b>, ei yksittäinen sertifioitu luku. Tämä on <c9/> -tason sisäisen johdonmukaisuuden tarkistus, <b>EI</b> ulkoinen validointi, <b>EI</b> alle nanosekunnin absoluuttinen tarkkuus ja <b>EI</b> sertifioitu operatiiviseen ajanpitoon.

seg-b4e3228c84b8 = Kuun geodeettinen VLBI — lähikentän viive Maan kantaviivalle, joka havaitsee Kuun majakan (<c1/>)

seg-bbb634953ebf = Geodeettinen VLBI (very-long-baseline interferometry) -havaintosuure kahdelle Maan maa-asemalle (kantaviiva), jotka havaitsevat yksitieisen signaalin Kuun pinnalla olevalta NovaMoon-luokan lähettimeltä. Kuu on <b>lähikentässä</b>, ei tasoaalto, joten geometrinen viive on tarkka kahden etäisyyden erotus <c1/> eikä taivaantason projektio. Täysi havaintosuure lisää asemien kellopoikkeamien eron ja eriytetyn Maan potentiaalin Shapiro-termin (käytetty uudelleen tiedostosta <c2/>). Asemat sijoitetaan geosentrisiin inertiaalisiin (GCRS) koordinaatteihin tiedostoilla <c3/> + <c4/>; majakka tiedostoilla <c5/> (geosentrinen Kuu) + <c6/> (selenografinen→MCMF (MCMF: Moon-centred, Moon-fixed)) + <c7/> (IAU-2015 ME kappaleeseen kiinnitetty→inertiaali). Skenaario <c8/> näytteistää viiveen, sen äärellisen eron nopeuden ja lähikentän korjauksen kierroksen yli.

seg-b2b758337ebc = <b>Oraakkeli</b> on saman koodikannan tasoaaltoinen Δ-DOR-havaintosuure <c1/> tiedostossa <c2/>: kaukokentän rajalla (synteettinen majakka etäisyydellä { "1e15" } m) geometrisen viiveen on romahdettava arvoon <c3/> koneen tarkkuudella; todellisella Kuun etäisyydellä aaltorintaman kaarevuuden lähikenttäkorjaus on nollasta poikkeava (kymmeniä tai satoja µs). Majakan osittaisderivaatat <c4/> (ja asemien osittaisderivaatat) varmennetaan keskeisdifferenssillä (suhteellinen virhe < { "1e-5" }).

seg-107b9d328f69 = Kuun geodeettinen VLBI-viive ja osittaisderivaatat

seg-acee0ad60cf4 = <c1/>, <c2/>, <c3/>/<c4/>/<c5/>, <c6/>, <c7/>. <b>Oraakkeli: <c8/></b> — saman koodikannan tasoaaltoinen <c9/> (<c10/>) kaukokentän rajalla sekä <b>äärellisen eron osittaisderivaatat</b>. Testit (<c11/>): aseman suuruus ≈ Maan säde, majakan etäisyys Kuun etäisyydellä ({ "356" }–{ "407" } Mm), kaukokentän geometrinen viive vastaa kohdetta <c12/> tarkkuudella < { "1e-9" } s, nollasta poikkeava lähikenttäkorjaus Kuun etäisyydellä, FD-majakka- ja asemaosittaisderivaatat { "1e-5" } suhteellisen tarkkuuden sisällä, tarkka kellotermi ja äärellinen skenaarioajo, joka jaetaan funktion <c13/> kautta. <b>Rehellinen rajaus:</b> <c14/>, <b>EI</b> validoitu todellista VLBI-dataa vasten. Napaliike jätetään pois (<c15/>), joten asemien inertiaalisissa paikoissa on muutaman metrin kehysvirhe; majakka yhdistää päivän keskitasaajan Kuu-sarjan ICRF (International Celestial Reference Frame) -kappalekiinnitteiseen poikkeamaan (<c16/>), kehysjohdonmukaisuuden ristiriita mallin tarkkuuden alapuolella mutta ei ankara; eikä mukana ole valoaikaiteraatiota, Maan pyörimistä valoajan aikana, väliaineita (tropo/iono/plasma) eikä aberraatiotermiä eriytetyn Shapiron lisäksi. TRL:ää (technology readiness level), lentoperintöä tai viraston hyväksyntää ei väitetä. { "0.30" }: ANISEn valoaikoja DE440:n kautta vasten yksikään tämän analyyttisen polun viive ei ole { "1" } ps:n sisällä (suurin ero { "24" } µs); havainto on kiinnitetty.

seg-d90c67f098f7 = <c1/> (DE440 Maa ja Kuu, DE440 Kuun pääakselit, ITRF93 Maan orientaatio, jokainen valoaika konvergoitu barycentric-kehyksessä), ajetaan skenaariolla <c2/>, kun kolme ydinpolkua on asetettu. <b>Oraakkeli: kirjasto</b> — NAIF SPICE Toolkit N0067 (spiceypy { "8.2.0" }) konvergoidut valoajat asemille DSS-14/43/63, ennakkorekisteröity: { "75" } viivettä { "1" } ps:n sisällä (huonoin { "0.06" } ps), majakan ja asemien osittaisderivaatat { "1e-6" } sisällä, { "25" } epookilla J2000:n lähellä (muutos sen jälkeen kun { "2024" } epookkia epäonnistui SPICEn oman kaksoistarkkuuden lähetysepookin takia, noin { "6" } ps, ilmoitettu ja kiinnitetty). Skenaarion eriytettyä Shapiro-termiä, viiveen nopeutta ja lähikenttäkorjausta ei verrata.

seg-8bed75c5402d = Kuun yhteinen usean tekniikan OD ja kello — simuloitu suljetun silmukan palautus (<c1/>)

seg-d518eead07c4 = Yhden epookin (tilannekuva) erä-pienimmän neliösumman sovitus (<c1/>, Householder-QR-askel versiosta { "0.30" } alkaen), joka <b>fuusioi geodeettisen VLBI:n, radiometrisen / Kuun paikallisen etäisyysmittauksen ja satelliittien välisen etäisyysmittauksen tekniikat</b> SIMULOIDUSSA Kuun verkossa ja palauttaa <em>yhdessä</em> Kuun pinta-aseman 3D-paikan, pienen tähdistön satelliittikohtaiset paikat ja jokaisen laitteen kellopoikkeaman. Havaintosuureet ovat: ({ "1" }) Maan kantaviivan geodeettiset VLBI-viiveet Kuun asemalle, jota käsitellään majakkana (käytetään uudelleen <c2/>, geosentrinen inertiaali) — keskeinen tekniikka; ({ "2" }) Maa-asema→satelliitti -geosentriset radiometriset etäisyydet (jotka multilateroivat tähdistön hyvin hajautetuilta Maan asemilta) ja asema↔satelliitti -Kuun paikalliset etäisyydet (MCI (Moon-centred inertial) euklidinen etäisyys sekä eriytetty kelloterm); ({ "3" }) satelliittien väliset etäisyydet (sama muoto); sekä yksittäinen aseman kellon synkronoinnin pseudohavainto, joka ankkuroi muuten havaitsemattoman yhteisen kellopoikkeaman. Tilavektori on <c3/>. Ratkaisijan sisällä ei ole <b>mitään voimamallin propagointia</b> — satelliitit ovat kiinteitä, erillisiä, havainnollistavia pisteitä edustavalla Kuun radalla; tämä on tarkoituksella siisti tilannekuvasovitus. Sisäisesti paikat skaalataan ja kellot estimoidaan etäisyyttä vastaavina metreinä, jotta normaalimatriisi pysyy hyvin ehdollistettuna f64:ssä; VLBI- ja Kuun etäisyysmittaukset poistetaan keskiarvolla nimellisen geometrian ympäriltä, jotta äärellisen eron Jacobi ei kärsi katastrofaalisesta kumoutumisesta. Skenaario <c4/> ajaa ratkaisun VLBI-osuuksien kanssa ja ilman niitä samalla siemenluvulla ja totuudella ja raportoi molemmat ratkaisut sekä aseman havaittavuuden parannuskertoimen.

seg-f634e976b583 = <b>Keskeinen rehellinen tulos</b>: Kuun paikallinen etäisyysmittaus napa-asemalta kourallisen satelliitteja suuntaan, jotka kaikki sijaitsevat taivaan samalla puolella, jättää aseman paikan <b>heikosti havaituksi yhdessä suunnassa</b>, joten pelkän etäisyyden ratkaisu on huonosti ehdollistettu ja palautettu aseman 3D-virhe on suuri (tai ratkaisu ei konvergoidu). <b>Maan kantaviivan VLBI-viiveiden lisääminen tekee aseman täyden 3D-paikan havaittavaksi</b>, ja palautettu aseman virhe romahtaa metritasolle. Testi <c1/> varmistaa, että VLBI:n kanssa laskettu aseman virhe on selvästi (≥{ "5" }×) pienempi kuin pelkän etäisyyden virhe samalla lisätyllä totuudella — VLBI palauttaa muuten havaitsemattoman aseman suunnan, ja se on vaiheen tarkoitus.

seg-d5feea2381b7 = <b>Oraakkeli</b> on sisäinen johdonmukaisuus: lisätty totuustila (asema ~{ "50" } m/akseli, satelliitit ~{ "30" } m/akseli, kellot ~{ "1e-7" } s, siemenluvun ohjaamalla komponenttikohtaisella häilynnällä) kuvataan synteettisiksi havaintosuureiksi <em>samalla</em> geometriamallilla, jonka ratkaisija kääntää, siemenluvun ohjaama Gaussin kohina lisätään (havainnollistavat oletukset: VLBI σ ≈ { "1e-11" } s, etäisyyden σ ≈ { "0.1" } m, ISL σ ≈ { "0.1" } m; painot <c1/>), ja estimaattorin on palautettava lisätty totuus kohinan rajoissa nollien alkuarvauksesta. Monte Carlo -keskiarvoinen NEES <c2/> siemenluvuilla (<c3/>) asettuu löyhään vyöhykkeeseen arvon <c4/> ympärille, kovarianssin realismin tarkistus.

seg-abc40f1f301a = <c1/> ({ "0.30" }, P2: ratkaisun lineaarialgebra)

seg-87de27c2421a = <c1/>, <c2/>, <c3/>. <b>{ "0.30" } -oraakkeli: P2</b> — numpy { "2.4.6" } (LAPACK gelsd ja inv) laskee uudelleen jokaisen Gauss–Newton-askeleen, konvergoituneen painotetun ratkaisun, muodolliset sigmat ja aseman virheen kuuden verkon versionhallintaan tallennetuilla Jacobin matriiseilla (<c4/>, askeleet { "2.4e-11" } sisällä, sigmat { "1.3e-11" } sisällä); fysikaaliset havaintomallit ja suuruusluokat pysyvät MODELLED. <b>Aiempi oraakkeli: <c5/></b> — lisätyn simuloidun totuuden palautus + NEES-kovarianssin johdonmukaisuus. Testit (<c6/>): täysi fuusio palauttaa totuuden (asema < { "5" } m, satelliittien RMS < { "5" } m, kellot < { "1e-8" } s, konvergoitu); VLBI palauttaa aseman 3D-havaittavuuden (aseman virhe ≥{ "5" }× pienempi VLBI:n kanssa kuin pelkällä etäisyydellä samalla totuudella); deterministinen (sama siemenluku → bittitarkasti sama ratkaisu, eri siemenluku → eri mutta palautettu); keskimääräinen NEES löyhässä vyöhykkeessä arvon <c7/> ympärillä; äärelliset / suojatut raportoidut luvut silloinkin, kun pelkkä etäisyys on huonosti ehdollistettu; skenaario jaetaan funktion <c8/> kautta. <b>Rehellinen rajaus:</b> tämä on <b>simuloitu suljetun silmukan palautus</b> — totuus jakaa havaintomallin — <b>EI</b> validointi todellista dataa vasten; ei voimamallin propagointia ratkaisijan sisällä; satelliittien paikat ja Maan ja Kuun aseman geometria ovat havainnollistavia. TRL:ää, lentoperintöä tai viraston hyväksyntää ei väitetä.

seg-7620f3a821f6 = Kuun koordinaatiston realisaatio — 7-parametrinen Helmert-datumsovitus (<c1/>)

seg-240271b9d7de = Missä <c1/> <em>soveltaa</em> IAU:n { "2015" } WGCCRE-kuun kappaleen orientaatiota (suoramalli), tämä moduuli <em>estimoi</em> (realisoi) Kuun koordinaatiston datumiin sidotun estimoitujen pistekoordinaattien verkosta. Estimoinnin ydin on klassinen <b>7-parametrinen yhdenmuotoisuus- (Helmert-) muunnos</b> — kolme translaatiota, kolme pienen kulman rotaatiota ja yksi skaalaparametri — joka kuvaa pisteet <c2/> (estimoitu kehys) pisteiksi <c3/> (datumkehys) muodossa <c4/>, jossa <c5/> on rakennettu funktioista <c6/>. Seitsemän parametria <c7/> estimoidaan ≥ { "3" } ei-kollineaarisesta pisteparista painotetulla pienimmän neliösumman menetelmällä funktion <c8/> kautta: suoramalli ennustaa jokaisen pisteen <c9/> pisteestä <c10/> ja litistää kaikkien pisteiden kaikki kolme komponenttia havaintovektoriin, havaitut datumkoordinaatit muodostavat vektorin <c11/>, painot ovat <c12/>, ja ratkaisu alkaa arvosta <c13/>. Kiertokulmat estimoidaan µrad:ssa ja skaala ppb:ssä, jotta äärellisen eron Jacobi pysyy hyvin skaalattuna Kuun pinnan koordinaattien suuruusluokassa (~{ "1.7e6" } m). Pieni <c14/> koostaa realisoidun pienen kierron IAU:n kappale→ICRF-orientaation kautta (<c15/>) ja palauttaa realisoidun kehyksen jäännöspienen kulman poikkeaman ICRF-akseleiden ympäri — tarkoituksella yksinkertainen ilmaisukehyksen muutos, <b>ei</b> riippumaton arvio Kuun navasta.

seg-75769fc9671c = <b>Oraakkeli</b> on sisäinen johdonmukaisuus: tunnettu Helmert-muunnos (translaatio ~kymmeniä m, rotaatio ~µrad, skaala ~{ "1e-7" }) <em>lisätään</em> hyvin hajautettuun synteettiseen pisteverkkoon (vaihtelevat selenografiset leveys- ja pituusasteet → MCMF, osa pisteistä korkeudessa), siemenluvun ohjaama Gaussin kohina lisätään, ja sovituksen on palautettava lisätyt parametrit. Kohinattomalla datalla palautus on ~koneen tarkkuudella (translaatio < { "1e-6" } m, rotaatio < { "1e-9" } rad, skaala < { "1e-12" }); metrin kohinalla palautetut parametrit asettuvat muutaman × muodollisen σ:n sisään ja sovituksen jälkeinen RMS-residuaali on lähellä kohinatasoa. Skenaario <c1/> raportoi palautetun datumin, parametrikohtaisen palautusvirheen lisättyyn totuuteen nähden, sovituksen jälkeisen RMS-residuaalin ja realisoidun kierron ICRF-orientaatiosidoksen.

seg-3768ce021e23 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>. <b>Oraakkeli: <c6/></b> — lisätyn 7-parametrisen yhdenmuotoisuusmuunnoksen palautus sekä funktion <c7/> algebrallinen edestakaisen kierron identiteetti. Testit (<c8/>): lisätyn muunnoksen kohinaton palautus (translaatio < { "1e-6" } m, rotaatio < { "1e-9" } rad, skaala < { "1e-12" }); kohinallinen palautus muutaman × σ:n sisällä ja RMS-residuaali lähellä kohinatasoa; sovella-ja-käännä edestakainen kierto; deterministinen (sama siemenluku → bittitarkasti sama, eri siemenluku → eri mutta palautettu); nollarotaation ICRF-sidos on nolla ja sidos säilyttää rotaation suuruuden; skenaario jaetaan funktion <c9/> kautta. <b>Rehellinen rajaus:</b> tämä on <b>itsejohdonmukaisuuden</b> tarkistus — se palauttaa <em>lisätyn</em> muunnoksen <em>synteettisessä</em> verkossa — <b>EI</b> Kuun koordinaatiston realisaatio todellista seuranta- / VLBI-dataa vasten, eikä se väitä absoluuttista kehystarkkuutta. ICRF-orientaatiosidos on yksinkertainen ilmaisun muutos, ei riippumaton napa-arvio. TRL:ää, lentoperintöä tai viraston hyväksyntää ei väitetä.

seg-f14930d33f47 = Kuun navigointipalvelun tilavuus — DOP / peitto / saatavuus ja yleistetty Kuun ARAIM PL (<c1/>)

seg-9b4f13e138e4 = Tämä moduuli <em>koostaa</em> jo rakennetut osat Kuun navigoinnin <b>palvelutilavuuden</b> analyysiksi: se pyyhkäisee selenografisen leveys- ja pituusasteen ruudukon aikahorisontin yli <b>havainnollistavaa, julkisiin lähteisiin perustuvaa Moonlight / LCNS-luokan</b> (LCNS: Lunar Communications and Navigation Services) Kuun kiertoratatähdistöä vasten ja raportoi DOP:n / peiton / saatavuuden sekä yleistetyn Kuun ARAIM-suojaustasojen verhokäyrän. Kaksi uudelleenkäyttöä on kantavia ja eksplisiittisiä. <b>DOP-geometria</b> on <b>VALIDATED</b> (vs gnss_lib_py) -ydin <c1/> — <c2/> on ohut korkeuskulmamaskin suodatin ja tuo ydin, ja testi varmistaa identiteetin (<c3/> on yhtä kuin suora <c4/> samoilla näkyvillä paikoilla). <b>Eheys</b> käyttää uudelleen LunaNet LNIS:n (LunaNet Interoperability Specification) Kuun ARAIM-koneistoa <c5/> (σ_URE ≈ { "30" } m, <c6/> ≈ { "1e-4" }); <c7/> yleistää olemassa olevan etelänavan suojaustason mielivaltaiselle pintapisteelle, ja testi varmistaa, että se <b>palautuu etelänavan tapaukseksi</b> (etelänavalla samalla geometrialla ja budjetilla se palauttaa täsmälleen olemassa olevan <c8/> -tuloksen tarkkuudella < { "1e-9" }).

seg-456bf257f689 = Tähdistön parametrit ovat <b>havainnollistava approksimaatio julkisista ESA:n kuvauksista</b> järjestelmäluokasta (≈ { "4" } satelliittia elliptisillä Kuun jäädytetyillä radoilla, jotka suosivat etelänavan peittoa — apolune eteläisen pallonpuoliskon yllä; { "4" } on kirjaston oletus, ja mukana toimitettu <c1/> asettaa { "8" }, koska suojaustaso vaatii vähintään { "6" } näkyvissä). Ne eivät ole <b>todellinen</b> Moonlight/LCNS-efemeridi eivätkä viittaa <b>mihinkään</b> yhteyteen, hyväksyntään, perintöön, sertifiointiin tai TRL:ään. Koostaminen (peitto / saatavuus / eheys) on <b>MODELLED</b>: ympyrä- tai ellipsi-Kepler-välitinjoukko (ei differentiaalikorjattu LCNS / { "9" }:{ "2" } NRHO (near-rectilinear halo orbit) -efemeridi), keskimääräisesti pyörivä Kuu (ei fysikaalista libraatiota / precessoivaa napaa) ja julkaistut LunaNet LNIS -eheysparametrit. Se havainnollistaa palvelutilavuuden <em>menetelmää</em>, ei operatiivista saatavuuslukua. Deterministinen (puhdas geometria; ei satunnaisuutta). Skenaario <c2/> raportoi peittoprosentin, näkyvien määrän ja PDOP:n verhokäyrät, HPL/VPL-verhokäyrän tilavuuden yli ja suojaustason saatavuuden hälytysrajaa vasten.

seg-c28e56391894 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. <b>DOP-geometria validoitu uudelleenkäytöllä</b> gnss_lib_py:llä validoidun <c7/> -ytimen osalta; eheys käyttää uudelleen julkaistua LunaNet/LNIS Kuun ARAIM:ia (<c8/>, σ_URE ≈ { "30" } m). Testit (<c9/>): <c10/> on identiteetti validoidulla ytimellä; <c11/> etelänavalla on yhtä kuin olemassa oleva <c12/> -PL tarkkuudella < { "1e-9" } (palautuu etelänavan tapaukseksi); peitto ei vähene tähdistön koon kasvaessa; näkyvyys noudattaa korkeuskulmamaskia; skenaario on deterministinen ja jaetaan funktion <c13/> kautta. <b>Rehellinen rajaus:</b> tähdistö on <b>havainnollistava, julkisiin lähteisiin perustuva, EI ole sidoksissa ESA:an</b> — ei todellinen Moonlight/LCNS-efemeridi; peiton / saatavuuden / eheyden koostaminen on <b>MODELLED</b> (ympyrä- tai ellipsi-Kepler-välittimet, keskimääräisesti pyörivä Kuu, julkaistut LNIS-parametrit), <b>EI</b> operatiivinen Moonlightin saatavuusluku. TRL:ää, lentoperintöä tai viraston hyväksyntää ei väitetä.

seg-4ff4929f71df = Kuun differentiaalinen PNT — yhteismoodin kumoutuminen + kantaviivan mukana kasvava residuaali + DGNSS-suojaustasot (<c1/>)

seg-8f94c4bf3fe6 = Kuun DGNSS (differentiaalinen satelliittinavigointi) / SBAS-analogia: <b>NovaMoon-luokan referenssiasema</b> <em>tunnetussa</em> selenografisessa paikassa laskee satelliittikohtaiset differentiaalikorjaukset <b>havainnollistavasta, julkisiin lähteisiin perustuvasta Moonlight / LCNS -luokan</b> tähdistöstä, ja siitä kantaviivan verran poikkeava liikkuva käyttäjä soveltaa niitä niin, että lähetettyjen efemeridien <b>yhteismoodin</b> virheet kumoutuvat. Jokaisella satelliitilla <c1/> on lisätty yhteinen 3D-ratavirhevektori <c2/> ja yhteinen kellovirhe <c3/>. Referenssiaseman pseudoetäisyysresiduaali on korjaus <c4/>; käyttäjän raaka virhe on <c5/>; korjattu käyttäjän virhe on niiden erotus <c6/>. <b>Kelloterm <c7/> kumoutuu täsmälleen</b> (se on identtinen molemmissa havainnoissa), ja <b>ratatermi romahtaa projektioksi kahden näkölinjan yksikkövektorin erolle</b>, joka → { "0" }, kun kantaviiva → { "0" } (avaruudellisen dekorrelaation lattia) ja kasvaa ≈ lineaarisesti kantaviivan mukana. Satelliittikohtaiset korjatut etäisyysvirheet kuvataan käyttäjän geometrian kautta pienellä, vähäriippuvuuksisella painotetun pienimmän neliösumman tilannekuvaratkaisulla (tila <c8/> funktion <c9/> kautta; vakioetäisyysharha absorboituu kellon tuntemattomaan sen sijaan, että se turmelisi sijainnin) käyttäjän <b>paikkavirheen</b> antamiseksi. Käyttäjän <b>suojaustaso käyttää uudelleen DO-229E SBAS -suojaustason koneistoa</b> (<c10/>, Precision-Approach K-kertoimet), jossa differentiaalinen residuaali σ on kunkin satelliitin 1-σ-virhebudjetti.

seg-06978cfaebe3 = NovaMoon mainitaan <b>vain järjestelmäluokkana</b> (julkinen kuvaus Kuun referenssiasemasta); tähdistö käyttää uudelleen havainnollistavaa, julkisiin lähteisiin perustuvaa <c1/>. Nämä ovat havainnollistavia parametreja differentiaalisen <em>menetelmän</em> harjoittamiseen, <b>ei</b> todellinen efemeridi, eivätkä viittaa <b>mihinkään</b> yhteyteen, hyväksyntään, perintöön, sertifiointiin tai TRL:ään. Skenaario <c2/> raportoi käyttäjän paikkavirheen korjausten kanssa ja ilman, pienennyskertoimen, virhe–kantaviiva-käyrän ja suojaustason. Oletuskonfiguraatiossa korjattu käyttäjän virhe { "50" } km:n kantaviivalla on ≈ { "0.008" } m verrattuna korjaamattomaan ≈ { "24" } m (~{ "3000" }-kertainen pienennys), ja ≈ { "0" } nollakantaviivalla.

seg-6bb4dbe998f9 = <b>Oraakkeli</b> on sisäinen johdonmukaisuus: yhteismoodin kumoutuminen on <b>tarkka algebrallinen identiteetti</b> (kun <c1/>, korjattu virhe < { "1e-6" } m nollakantaviivalla; kelloterm kumoutuu koneen tarkkuudella millä tahansa kantaviivalla), residuaali <b>kasvaa monotonisesti kantaviivan mukana</b>, ja suojaustaso on <b>sama DO-229E-algoritmi</b>, jota vasten SBAS-pino on kiinnitetty. Avaruudellisen dekorrelaation residuaali on <b>ensimmäisen kertaluvun</b> geometrinen malli, <b>ei</b> todellisesta Kuun seurannasta sovitettu dekorrelaatiomalli.

seg-fd282b10cc77 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>. <b>Oraakkeli: <c6/></b> — differentiaalisen virheenkumoamisen identiteetti sekä DO-229E SBAS -suojaustason koneiston uudelleenkäyttö (<c7/>). Testit (<c8/>): nollakantaviivalla korjattu käyttäjän virhe ja jokainen korjattu satelliittikohtainen etäisyysvirhe ovat ~{ "0" } (< { "1e-6" } m) ja ≪ korjaamaton virhe; kelloterm kumoutuu täsmälleen millä tahansa kantaviivalla (ratavirhe nolla -tapaus); korjattu virhe kasvaa monotonisesti kantaviivan mukana pysyen ≪ korjaamaton vaatimattomilla kantaviivoilla; differentiaalinen päihittää yksinäisen selvällä marginaalilla (> { "2" }×); suojaustaso on yhtä kuin suora <c9/> -kutsu ja skaalautuu residuaalin σ:n mukana; alimäärätty geometria palauttaa <c10/>; skenaario on deterministinen (siemenluvun ohjaama) ja jaetaan funktion <c11/> kautta. <b>Rehellinen rajaus:</b> <b>MODELLED</b> — yhteismoodin kumoutuminen on tarkka identiteetti, mutta avaruudellisen dekorrelaation residuaali on <b>ensimmäisen kertaluvun</b> geometrinen malli, <b>ei</b> todellisesta Kuun seurannasta sovitettu dekorrelaatiomalli, ja tämä <b>EI</b> ole validoitu todellisella datalla. NovaMoon mainitaan <b>vain järjestelmäluokkana</b> (havainnollistava, julkisiin lähteisiin perustuva, <b>ei ole sidoksissa ESA:an</b>). TRL:ää, lentoperintöä tai viraston hyväksyntää ei väitetä.

seg-08e8a73f3426 = Kuun yhteentoimivuusvienti — LunaNet/IOAG-linjattu CCSDS OEM + KIF edestakaisen kierron yhdenmukaisuudella (<c1/>)

seg-39b875078d27 = Kuun koordinaatisto, Kuun aika-asteikko ja Kuun efemeridi viedään <b>LunaNet/IOAG-linjattuina (IOAG: Interagency Operations Advisory Group), CCSDS-pohjaisina vaihtomuotoina</b>. Tämä vaihe <b>ei</b> keksi omaa siirtomuotoa: se <b>käyttää uudelleen</b> crate-kirjaston olemassa olevaa CCSDS OEM (Orbit Ephemeris Message) { "2.0" } -tuottajaa ja -jäsennintä (<c1/> / <c2/>) sekä Kshana Interchange Format -kuorta (<c3/>), uudelleenmerkittynä Kuun yhteyteen. <c4/> asettaa OEM:n kentän <c5/> arvoksi <b>IAU:n { "2015" } WGCCRE-kuun kappalekehys</b> (<c6/> keski-Maa tai <c7/> pääakseli), kentän <c8/> arvoksi <b>Kuun aika-asteikko</b> (<c9/> / <c10/> / <c11/>) ja kentän <c12/> arvoksi <c13/>, <b>havainnollistavan, julkisiin lähteisiin perustuvan LCNS-luokan</b> näyteefemeridin yli (paikat funktiosta <c14/>, nopeus keskeisdifferenssillä). <c15/> tuottaa LunaNet/IOAG-linjatun Kuun ajan kuvaajan (asteikon tunniste, maallinen nopeus µs/vrk funktiosta <c16/>, julkaistu { "56" }–{ "59" } µs/vrk -vyöhyke, vertailupinta), joka kiertää edestakaisin serde_jsonin läpi. <c17/> kääntää OEM:n, kuvaajan ja kehysmerkinnän olemassa olevaan KIF-kuoreen MODELLED-rehellisyysmerkinnällä.

seg-bbfce5323abb = <b>Oraakkeli</b> on edestakainen kierto / kenttien yhdenmukaisuus. Koska <c1/> sisältää <em>molemmat</em> suunnat, OEM kierrätetään funktion <c2/> läpi (takaisin yhtä suureksi segmentiksi, Kuun kehys/aika ja tilojen määrä säilyneinä) <b>ja</b> tarkistetaan riippumattomasti funktiolla <c3/>, joka varmistaa, että jokainen vaadittu CCSDS/LunaNet-otsikon avainsana on läsnä, että <c4/> sisältää Kuun <c5/> -tunnuksen ja <c6/> on ei-tyhjä, että <c7/> -kehystys pitää ja että paikka- ja nopeusdatarivit ovat hyvin muodostettuja — palauttaen jäsennellyn läpäisyn sekä läsnä olevien / puuttuvien kenttien luettelon, jotta rikkinäinen vienti (esim. pudotettu <c8/>) havaitaan ja nimetään. Aikametadata kiertää edestakaisin funktion <c9/> läpi, ja KIF-kuori kiertää funktion <c10/> läpi yhtä suuriksi artefakteiksi, jotka kantavat MODELLED-merkintää.

seg-cb9dfbed826d = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. <b>Oraakkeli: <c7/></b> — deterministinen edestakainen kierto (CCSDS OEM funktion <c8/> kautta; KIF funktion <c9/> kautta; aikametadata serde_jsonin kautta) sekä kenttänimien yhdenmukaisuus julkaistuun CCSDS OEM + LunaNet/IOAG -kenttäsemantiikkaan nähden. Testit (<c10/>): viety OEM sisältää Kuun <c11/> (<c12/>/<c13/>) ja <c14/> (<c15/>/<c16/>) -tunnukset, <c17/>, kohteen ja hyvin muodostetut datarivit; Kuun ajan metadata kiertää edestakaisin (nopeus/vyöhyke/vertailu) ja hylkää roskan; KIF-kuori serialisoituu ja deserialisoituu yhtä suureksi arvoksi MODELLED-rehellisyysmerkinnän ollessa läsnä; tarkoituksella rikottu OEM (puuttuva <c18/>) epäonnistuu testissä <c19/> ja raportoidaan puuttuvaksi; skenaario jaetaan funktion <c20/> kautta. <b>Rehellinen rajaus:</b> kenttien <b>nimet ja yksiköt</b> on linjattu <b>julkisiin</b> standardeihin (CCSDS 502.0-B OEM, IAU WGCCRE { "2015" } Kuun kehykset, LunaNet Interoperability Specification / IOAG:n Kuun arkkitehtuuri); vienti on <b>MODELLED</b> — deterministinen edestakainen kierto ja kenttänimien yhdenmukaisuus on oraakkeli, tämä <b>EI</b> ole sertifioitu yhteentoimivuuden yhdenmukaisuustesti, efemeridi on <b>havainnollistava, julkisiin lähteisiin perustuva, ei ole sidoksissa ESA:an</b>, eikä TRL:ää, lentoperintöä tai viraston hyväksyntää väitetä.

seg-69a214b7236d = Ennakkorekisteröidyt ennusteet

seg-343fe86f6a50 = Ennakkorekisteröity ennuste on MODELLED-tulos, joka jäädytetään ennen kuin mitään sen pisteyttämiseen tarvittavaa dataa on olemassa, ja pisteytysprotokolla kiinnitetään samalla hetkellä. Se ei ole validointi eikä lisää kirjanpidon (ledger) riviä. Jokainen sijaitsee hakemistossa <c1/> kiinteine syötteineen, tuloksineen ja niiden SHA-256-tiivisteineen, ja <c2/> epäonnistuu, jos mikään jäädytetty tavu liikkuu; muuttunut oletus ratkaistaan uudella, päivätyllä ennusteella vanhan rinnalle, ei koskaan muokkaamalla vanhaa.

seg-e65d79893e2c = Ennuste

seg-f9e2d4b52b79 = Jäädytetty

seg-dd68891f75e2 = Arvioinnin vertailukohde

seg-d5a09f26a028 = Kuun referenssiaseman peitto

seg-c68f124a16e7 = c05dac1d, 2026-10-12

seg-293404a9cb92 = Kuun etelänavan differentiaaliaseman minkä tahansa tahon julkaisema tarkkuus, saatavuus, peitto ja suojaustasot

seg-4e7d9449a880 = ei vielä pisteytetty (julkaistuja tuloksia ei ole)

seg-ad1995b3ed17 = Demonstraation edustavuus ja polku lentoon -aukkojen kirjanpito (ledger) (<c1/>)

seg-86b70551c37f = Simulaatiotulos on hyödyllinen todisteena vain, jos se ilmoittaa julkisivullaan, mihin se on ankkuroitu, mitä se olettaa ja mikä sen vielä erottaa lentojärjestelmästä. Edustavuuskirjanpito (ledger) tekee tästä ensiluokkaisen, koneellisesti tarkistetun tuloksen: tietue <c1/> kantaa demonstraation ulkoiset ankkurit (<c2/>), mallinnetut oletukset, aukot lentoon (<c3/>, kukin sen vaiheen tai toiminnan kanssa, joka sulkisi sen) ja TRL-vyöhykkeen, jolle se on edustava. Se on tuloskohtainen kumppani ominaisuustason varmennusmatriisille (<c4/>).

seg-ccd039d5e6a4 = <b>Oraakkeli</b> on joukko suljetun muodon invariantteja, joita valvoo <c1/>: tietueen <c2/> on lueteltava vähintään yksi ulkoinen aineistoankkuri <c3/> (simulaatiota ei voi validoida itseään vasten); tietueen <c4/> on lueteltava vähintään yksi aukko lentoon eikä se voi väittää edustavaa TRL-vyöhykettä, joka on yli { "4" } (sitä pidemmälle kypsyttäminen vaatii laitteisto- tai lentotodisteita, mikä on aukko, ei simulaation tuloste); TRL-vyöhykkeen on oltava hyvin muodostettu; ja tietue <c5/> ei saa väittää mitään. Nämä invariantit toteuttavat käytännössä "edustavuus perusteltu + jäljellä olevat aukot kohti lentoa selvästi tunnistettu" -kurin.

seg-6b29111096ca = Edustavuuden ja aukkojen lentoon kirjanpito (ledger)

seg-f6b9a2c22ae6 = <c1/>/<c2/>/<c3/>, <c4/>/<c5/>/<c6/>/<c7/>. <b>Oraakkeli: <c8/></b> — suljetun muodon rehellisyysinvariantit sidottuina rajaan <c9/> tila/oraakkelityyppi. Testit (<c10/>): Validated-tietue ilman ulkoista ankkuria epäonnistuu; sisäinen (ReferenceImpl) ankkuri ei täytä Validated-ehtoa; Modelled-tietue ilman aukkoa epäonnistuu; Modelled-tietue TRL:n { "4" } yläpuolella epäonnistuu; virheelliset TRL-vyöhykkeet havaitaan; tietue serialisoituu JSON:iin odotetuin kentin ja tuottaa luettavan raportin. <b>Rehellinen rajaus:</b> kirjanpito (ledger) tarkistaa tuloksen todisteiden <em>luokittelun</em> — se ei todista, että nimetyt ankkurit johtavat eläviin testeihin (ne on kuratoitu, aivan kuten matriisi <c11/>); "koneellisesti tarkistettu" -väite on rajattu tila-, ankkuri-, aukko- ja TRL-invariantteihin.

seg-7e9190395eb6 = Yhtenäinen kvantti vs klassinen -kauppatodiste (<c1/>)

seg-534e48755e2c = Jokainen kvantti-PNT-sovellusalue vastaa samaan kysymykseen samalla tavalla: kiinnitä yksi vertailukehys (skenaario + siemenluku + moottorin versio), reititä kvanttiehdokas ja klassinen lähtötaso yhden neutraalin koodipolun läpi, pisteytä ne yhteisillä laatumittareilla ja raportoi — luottamusvälin ja rehellisen validoitu/mallinnettu-merkinnän kanssa — missä kvantti voittaa ja missä ei. <c1/> antaa tälle vastaukselle yhden muodon, jotta ajoitus-, navigointi- ja poikkeamantunnistusalat tuottavat <b>saman</b> toistettavan, rehellisesti merkityn olion. Se ei toteuta uudelleen yhtäkään kauppavertailua: laatumittarikohtaiset luvut tulevat olemassa olevista moottoreista (<c2/>, <c3/> ja alakohtaiset moduulit); tämä on sopimus sekä toistettavuuden ja edustavuuden kääre, joka on rakennettu edustavuuskirjanpidon (ledger) ja varmennusmerkintöjen päälle.

seg-5a52fb6670d1 = <b>Oraakkeli</b> on suljetun muodon hyöty- ja voittajaidentiteetit sekä olemassa olevan kauppatulosteen uskollinen kääre. <c1/>: hyötysuhde on napaisuudeltaan oikea (suunnattu niin, että <c2/> tarkoittaa aina kvanttipuolen olevan parempi, sekä korkeampi-on-parempi holdover- että matalampi-on-parempi virhelaatumittareille); todellisesta <c3/> rakennettu todisteolio toistaa hyötysuhteensa; epärehelliset todisteet hylätään (Modelled-edustavuus ilman aukkoa tai <c4/> -laatumittari, jonka kauppatietueella ei ole ulkoista ankkuria); JSON on deterministinen ja kantaa kehys-, siemenluku-, moottori-, laatumittari- ja edustavuuskentät.

seg-ae87cea429ba = Kvantti vs klassinen -kauppatodiste

seg-6622ae19989c = <c1/>/<c2/>/<c3/>/<c4/>. <b>Oraakkeli: <c5/></b> — suljetun muodon hyöty- ja voittajaidentiteetit sekä tuloksen <c6/> uskollinen kääre; rehellisyys sidottu edustavuuskirjanpitoon (ledger) ja varmennuksen tila/oraakkelityyppi -rajaan. Testit (<c7/>) kuten yllä. <b>Rehellinen rajaus:</b> harness standardoi, <em>miten</em> kauppavertailu raportoidaan ja toistetaan; alla oleva laatumittarikohtainen fysiikka on se, minkä osallistuva moottori tarjoaa, ja se kantaa omaa validoitu/mallinnettu-merkintäänsä — <c8/> ei päivitä mallinnettua laatumittaria validoiduksi.

seg-ce13223e04d0 = Kvanttilaitteiden virhemallikirjasto (<c1/>)

seg-c206fc7d58d6 = Yksi paikka, joka tarjoaa kvantti-PNT-laitteet, joilla demonstraattori käy kauppaa — optiset / loukutettujen ionien / elohopeaionikellot, klassiset referenssikellot, kylmäatomi-interferometri ja ajansiirtolinkit — kukin tietueena <c1/>, joka kantaa tärkeimmän määrittelynsä ja edustavuustietueen. Suurin osa laitefysiikasta <b>käytetään uudelleen</b> (kellojen vakaudet funktioista <c2/> ja <c3/>; kylmäatomi-interferometri funktioista <c4/>/<c5/>; klassiset optiset/RF-linkit funktiosta <c6/>). Ainoa aidosti uusi malli on <b>lomittuneisuus- / yksittäisfotoniajansiirtolinkki</b>, jonka ajoitustoistotarkkuus on laukauskohinan rajoittama: <c7/> havaitussa yhteensattumanopeudessa <c8/> ja integroinnissa <c9/>, heikennettynä pimeälaskentarangaistuksella <c10/> ja alarajattuna palautumattomalla systemaattisella virheellä.

seg-7e8f4f3a5442 = <b>Oraakkeli</b> on uudelleenkäytetyt, julkaistut kello/CAI-kertoimet sekä suljetun muodon laukauskohina- ja häviöidentiteetit. <c1/>: uudelleenkäytetty kellovakauksien järjestys on järkevä (optinen hila < elohopeaioni < CSAC arvossa σ_y({ "1" } s)); lomittuneisuuden toistotarkkuus paranee muodossa <c2/> ({ "4" }× integrointi puolittaa σ:n), kun se on laukauskohinan rajoittama; havaittu yhteensattumanopeus laskee { "10" }× jokaista { "10" } dB linkin häviötä kohti; pimeät laskennat heikentävät toistotarkkuutta monotonisesti; systemaattinen lattia rajaa toistotarkkuutta alhaalta; jokainen laitekortti on kelvollinen Modelled-edustavuustietue.

seg-24dd5c3725b9 = <c1/>, <c2/>/<c3/>, <c4/>. <b>Oraakkeli: <c5/></b> — uudelleenkäytetyt julkaistut kello/CAI-kertoimet + suljetun muodon laukauskohina- ja häviöidentiteetit lomittuneisuuslinkille. Testit (<c6/>) kuten yllä. <b>Rehellinen rajaus:</b> kellojen ja CAI:n laiteparametrit käytetään uudelleen moottorin olemassa olevista julkaistujen kertoimien malleista; lomittuneisuuslinkin malli on MODELLED julkaistusta kvanttikellosynkronoinnin käyttäytymisestä havainnollistavilla, julkisiin lähteisiin perustuvilla parinopeus-, hyötysuhde- ja häviöarvoilla — sitä <b>ei</b> ole validoitu mitattua linkkiä vasten, ja todellinen lähde-, kanava- ja ilmaisinlaitteisto on ilmoitettu aukko lentoon.

seg-f6d8e7ad6bec = Luotettu kvanttiajoitus — päästä päähän -ketju, turvallinen jakelu, poikkeama ja kauppavertailu (<c1/>)

seg-3160cfec0d1f = Skenaario <c1/> koostaa ajoitusketjun, jonka kvantti-PNT-demonstraattori tarvitsee: päästä päähän -käyttäjäaikabudjetti (referenssikellon liukuvirhe ja linkin ajoitustoistotarkkuus yhdistettynä neliöllisesti) <b>kvanttiketjulle</b> (optinen hilakello + lomittuneisuus- / yksittäisfotonilinkki) verrattuna <b>klassiseen</b> ketjuun (CSAC + RF-kaksisuuntainen linkki); <b>ajoituksen suojaustaso</b> (TPL, käytetty uudelleen kohteesta <c2/>), joka rajaa havaitsemattoman aikavirheen; <b>viive/toisto-hyökkäyksen turvallisuuslaatumittari</b> <c3/> ilmoitetulla väärän hälytyksen nopeudella (käytetty uudelleen kohteesta <c4/>); <b>kellopoikkeaman havaitsemistodennäköisyys + CUSUM (cumulative sum) -muutoksen havaitsemisviive</b>; ja kvantti vs klassinen -vertailu rehellisenä <c5/>-oliona, joka kantaa edustavuus- ja aukot lentoon -tietueen.

seg-6fa095264bdc = <b>Oraakkeli</b> on suljetun muodon neliöllinen budjetti uudelleenkäytettyjen, erikseen validoitujen ytimien yli (ADEV vs Stable32/NIST; TPL-raja; <c1/>/<c2/>). <c3/>: kvanttitoistotarkkuus paranee integrointiajan mukana; kvanttiketju voi voittaa <em>ja</em> voi hävitä toistotarkkuuden laatumittarin (rehellistä — ei yleinen voitto; hyvin häviöllinen linkki kääntää tuloksen); suojaustaso on äärellinen ja positiivinen; turvallisuuslaatumittari on välillä [{ "0,1" }] ja kasvaa hyökkäysviiveen mukana; poikkeaman havaitsemistodennäköisyys on monotoninen vian suuruuden suhteen; ja kauppatodiste on sisäisesti rehellinen (<c4/>).

seg-42a7d1170cc3 = Luotettu kvanttiajoitus (ketju + turvallinen jakelu + poikkeama + kauppavertailu)

seg-44855d0cec4f = <c1/>/<c2/>, <c3/>; <c4/>. <b>Oraakkeli: <c5/></b> — suljetun muodon neliöllinen budjetti uudelleenkäytettyjen validoitujen ytimien yli (ADEV/Stable32-NIST, TPL-raja, havaitsemisen analyyttinen Pd/Pmd); rehellisyys sidottu edustavuuskirjanpitoon (ledger). Testit (<c6/>) kuten yllä. <b>Rehellinen rajaus:</b> kello- ja linkkiparametrit ovat havainnollistavia, julkisiin lähteisiin perustuvia; lomittuneisuuslinkki on MODELLED laukauskohinan rajoittama malli kohteesta <c7/>; tämä mallintaa luotettujen ajoitusjärjestelmien <em>luokkaa</em> — sitä <b>ei</b> ole validoitu mitattua päästä päähän -linkkiä vasten, ja todellinen kello-, linkki- ja avaruuskanavalaitteisto on ilmoitettu aukko lentoon; TRL:ää, lentoperintöä tai sertifiointia ei väitetä.

seg-c6ae292a6331 = GNSS-vapaa kvanttinavigointi (<c1/>)

seg-f34f784e928c = Skenaario <c1/> vertaa suunnistuslaskentaa GNSS-katkon aikana <b>kvantti</b>-inertiabudjettiin (kylmäatomi-interferometrikiihtyvyysmittari, käytetty uudelleen kohteista <c2/>/<c3/>, jonka CAI:n valkoisen kohinan lattia on validoitu ~{ "2" } suuruusluokan tarkkuudella Freier ym. { "2016" } -työhön nähden) <b>klassiseen</b> navigointiluokan INS:ään. Se raportoi paikkavirheen kasvun liukuvaiheen yli, holdover-ajan paikkakynnykseen ja kvantti vs klassinen -kauppavertailun rehellisenä <c4/>-oliona. Havaittavuus todetaan rehellisesti: ilman ulkoista paikannusta katkon aikana kiihtyvyysmittarin harha on havaitsematon, joten paikkavirhe kasvaa rajattomasti (≈ ½·harha·t² sekä nopeuden satunnaiskävelytermi); pienempiharhainen kvanttianturi <em>hidastaa</em> tätä kasvua mutta ei sulje eroa — vain ulkoinen paikannus sulkee.

seg-4cfde3de8f94 = <b>Oraakkeli</b> on uudelleenkäytetyt inertiabudjetit (<c1/>/<c2/>, jotka kumpikin toteuttavat piirteen <c3/>) sekä suljetun muodon ajautumaidentiteetit. <c4/>: kvanttibudjetti päihittää klassisen pitkän katkon yli (pienempi virhe, pidempi holdover); virhe kasvaa katkon keston mukana molemmilla (havaittavuusaukko); etu riippuu katkosta, ei ole vakio voittokerroin (kvanttikäyrä on kohinadominoitu lyhyellä liu'ulla, harhadominoitu pitkällä); kauppatodiste on sisäisesti rehellinen.

seg-0488b6ec9982 = <c1/>/<c2/>, <c3/>; <c4/>. <b>Oraakkeli: <c5/></b> — uudelleenkäytetyt inertiabudjetit (CAI validoitu uudelleenkäytöllä ~{ "2" } suuruusluokkaa vs Freier { "2016" }; klassinen suljetun muodon ajautuma); rehellisyys sidottu edustavuuskirjanpitoon (ledger). Testit (<c6/>) kuten yllä. <b>Rehellinen rajaus:</b> staattinen suunnistuslaskennan budjettivertailu, ei dynaaminen suodatin todellisilla lentoradoilla; harha on havaitsematon ilman paikannusta, mikä todetaan; laiteparametrit ovat havainnollistavia, julkisiin lähteisiin perustuvia; mallintaa GNSS-vapaan kvanttinavigoinnin <em>luokkaa</em> — todellinen kylmäatomi-IMU-laitteisto, dynaaminen alusta ja lentoympäristö ovat ilmoitettuja aukkoja lentoon; TRL:ää, lentoa tai sertifiointia ei väitetä.

seg-e23e583ecf21 = Kvantti-PNT-järjestelmien vika- ja poikkeamantunnistus (<c1/>)

seg-6e6df91ae779 = Skenaario <c1/> määrittelee merkityn luettelon kvantti-PNT-vioista (kellotaajuuden hyppy, ajautuma, lukkiutumisen menetys; anturin harha-askel, katko), pisteyttää havaitsemistunnusluvun nimellisissä ja vikaantuneissa ikkunoissa ja raportoi ilmaisimen erottelukyvyn ROC AUC:na sekä pienimmän havaittavan vian kiinteällä väärän hälytyksen nopeudella. Kvantti vs klassinen -näkökulma: vakaampi kvanttikellon referenssi pienentää valvonnan kohinaa σ, joten se havaitsee pienempiä vikoja — tuotettuna rehellisenä <c2/>-oliona edustavuustietueen kanssa.

seg-eeb3c7d1f507 = <b>Oraakkeli</b> on suljetun muodon AUC Gaussin havaitsemistunnusluvulle (nimellinen <c1/>, vika <c2/> ⇒ <c3/>), ristiintarkistettuna ulkoisesti validoitua <c4/> (validoitu vs scikit-learn) ja kohteen <c5/> analyyttisiä kynnyksiä vasten. <c6/>: analyyttinen AUC vastaa tunnettuja arvoja ({ "0.5" } kun μ={ "0" }, →{ "1" } suurella μ/σ, monotoninen); empiirinen bootstrap-AUC:n luottamusväli ympäröi suljetun muodon arvon; kvanttivalvonnalla on korkeampi AUC ja pienempi pienin havaittava vika; etu katoaa valtavilla vioilla (molemmat havaitsevat täydellisesti — ei yleinen marginaali); luettelossa on viisi merkittyä luokkaa; kauppavertailu on sisäisesti rehellinen.

seg-9dda4ab0647a = Kvantti-PNT:n vika- ja poikkeamantunnistus

seg-cfa7a5c43d14 = <c1/>, <c2/>/<c3/>, <c4/>, <c5/>; <c6/>. <b>Oraakkeli: <c7/></b> — suljetun muodon Gaussin AUC ristiintarkistettuna ulkoisesti validoitua <c8/> -bootstrap-AUC:ta (vs scikit-learn) ja kohteen <c9/> analyyttisiä kynnyksiä vasten. Testit (<c10/>) kuten yllä. <b>Rehellinen rajaus:</b> havaitsemistunnusluku on Gaussin malli, ei todellista telemetriaa; vikaluettelo on merkitty synteettiseksi; kvantti- ja klassisen valvonnan kohinatasot ovat havainnollistavia, julkisiin lähteisiin perustuvia; mallintaa kvantti-PNT:n poikkeamantunnistuksen <em>luokkaa</em> — todellinen laitteistotelemetria totuusmerkinnöin on ilmoitettu aukko lentoon; TRL:ää, lentoa tai sertifiointia ei väitetä.

seg-24ad75143bed = Standardien yhdenmukaisuus — vaihtomuodot, linkkibudjetti ja eheys (ulkoisen oraakkelin tarkistukset)

seg-9d31773e0ecd = Nämä standardit validoidaan palauttamalla <b>standardeissa itsessään (tai riippumattomassa referenssitoteutuksessa) julkaistut sanatarkat laskuesimerkit / vertailuarvot</b>, ei Kshanan omalla edestakaisella kierrolla. Standardin oman liite-esimerkin palauttaminen on vahvin saatavilla oleva yhdenmukaisuustarkistus vaihtomuodon jäsentimelle.

seg-7ec3d508c64f = Ulkoinen oraakkeli

seg-e06aa022e7e9 = <b>CCSDS OEM</b> (502.0-B Orbit Data Messages)

seg-65de0a1335d6 = <c1/>: <c2/> palauttaa täsmälleen epookit ja X/Y/Z/Ẋ/Ẏ/Ż-tilavektorit KVN OEM -esimerkistä kohdassa <b>CCSDS 502.0-B-3, Annex G §G6, Figure G-11</b> ("OEM Example with No Acceleration, No Covariance", s. G-10) — molemmat efemeridisegmentit, mukaan lukien etunollalliset lähdearvot (<c3/>). Testiaineisto <c4/> on toistettu merkki merkiltä virallisesta Blue Bookista (toimituksellisia "< intervening data records omitted here >" -merkintöjä, jotka eivät ole kelvollisia OEM-tietueita, ei ole mukana).

seg-54cff1deebc7 = <b>CCSDS TDM</b> (503.0-B Tracking Data Message)

seg-a5c6b58e0053 = <c1/>: <c2/> palauttaa kaikki { "41" } RANGE-tietuetta (ensimmäinen { "3198.03679519614" } km, viimeinen { "3270.46440460551" } km) ja metadatan KVN TDM -esimerkistä kohdassa <b>CCSDS 503.0-B-2, Annex E, Figure E-9</b> ("Range Data with TIMETAG_REF=TRANSMIT", s. E-9). Testiaineisto <c3/> on sanatarkasti Blue Bookista. (Tämä on julkaistu Blue Book -oraakkeli aiemmin olemassa olleen käsin kirjoitetun <c4/> -edestakaisen kierron rinnalla tiedostossa <c5/>.)

seg-c9a23ec7956b = <b>CCSDS { "133.0" }</b> (Space Packet Protocol)

seg-aaffd3d25c5f = <c1/>: koodain toistaa riippumattoman <b><c2/> -kirjaston</b> (us-irs/spacepackets-py, <c3/>) tavutason ensisijaisen otsikon testivektorit — esim. <c4/> ja kaiken maksimin <c5/> — sekä kanonisen kaikki-ykköset-telemetriatapauksen (TM), kukin kierrätettynä edestakaisin dekoodauksen läpi. Bittikenttien leveydet ja järjestys <b>CCSDS 133.0-B-2 §{ "4.1.3" }</b> mukaan.

seg-e48472df251a = <b>CCSDS { "401" } / DSN</b> (linkkibudjetti, DSN 810-005)

seg-c6caa639e1c6 = <c1/>: FSPL (free-space path loss) ja C/N₀-ketju toistavat julkaistun syväavaruustelemetrian suunnittelun ohjaustaulukon julkaisusta <b>J. H. Yuen (toim.), <em>Deep Space Telecommunications Systems Engineering</em> (DESCANSO/JPL (DESCANSO: Deep Space Communications and Navigation Systems Center of Excellence) Pub. 82-76), Table 1-1</b> — Galileon X-kaistan ({ "8420.43" } MHz) alalinkki etäisyydellä { "6.37" } AU: vapaan tilan häviö <b>{ "290.54" } dB</b> (<{ "0.05" } dB) ja vastaanotettu <b>Pr/N₀ = { "54.6" } dB-Hz</b> (<{ "0.2" } dB). Kaistakeskukset sijaitsevat DSN/CCSDS-401 syväavaruuden alalinkkivarausten sisällä (DSN 810-005 Module { "201" }). <em>Oletustehtäväparametrit</em> pysyvät edustavina (ei kalibroitu transponderi); tässä kiinnitetään <em>linkkiyhtälö</em>.

seg-c2cee7d5c7b1 = GNSS-standardit — ulkoisen oraakkelin tila ja rehellisesti jäljellä olevat aukot:

seg-d8f653b3c955 = Tila ja rehellinen varaus

seg-fff735bd32a1 = <b>Ydin, geometria ja ARAIM-suojaustaso ulkoisesti validoitu.</b> Havaitsemisen <em>ydin</em> — χ²-vikahavaitsemiskynnys, ei-keskeisen χ²:n havaitsematta jäämisen ei-keskeisyys ja normaalijakauman K-kertoimet — toistaa <b>SciPyn</b> (<c1/>, { "171" } tapausta, ≤ { "1e-6" } suht.), ja ympäröivä geometria toistaa <b>gnss_lib_py</b>:n (DOP). ARAIM-suojaustason (PL) <em>arvo</em> on nyt myös kiinnitetty: WG-C (WG: Working Group) ARAIM Reference ADD (Algorithm Description Document) v3.1 "LPV-200 (LPV: localizer performance with vertical guidance) numerical example" -esimerkkiä vasten <c2/> / <c3/> antavat VPL { "18.2926" } m vs { "18.3" } m, HPL { "13.4063" } m vs { "13.45" } m ja σ_v,acc { "1.3694" } m vs { "1.3694" } m, referenssin oman <c4/> = { "0.05" } m:n sisällä (<c5/> -tyyppi). Laajuus: vikatilat yhteen satelliittiin tai yhteen tähdistöön asti (<c6/>); usean tapahtuman vika-aliryhmiä ja poissulkemista ei ole toteutettu, ja klassisella RAIM:illa ei edelleenkään ole <b>kanonista julkaistua syöte→HPL-testivektoria</b>. Katso <a1><c7/></a1>.

seg-e6a47dfb7e54 = <b>Suojaustason algoritmi nyt ulkoisesti validoitu.</b> Kun satelliittikohtaiset (el, az, σ) on annettu, kshanan <c1/> toistaa <b>RTKLIB SBAS-PL-haarukan</b> (<c2/> <c3/>, Siki & Takács { "2017" }, "DO-229D Appendix J") — syötettynä kyseisen työkalun <b>omalla</b> σ:lla, joka on laskettu <b>todellisista EGNOS</b>-lähetysviesteistä + todellisesta BUTE RINEX:stä — tarkkuudella <b>< { "2e-3" } m HPL</b> { "6" } epookin yli (<c4/>); ESA gLAB { "v6.0.0" } (<c5/>) vahvisti identtisen käytännön. K-kertoimet (<c6/>, <c7/>, <c8/>) vastaavat DO-229E Appendix J:tä. <b>Mikä on validoitu ja mikä ei:</b> tämä kiinnittää PL-<em>algoritmin</em> (σ sisään → HPL/VPL ulos); ylävirran σ-<em>mallinnus</em> raakaviesteistä UDRE/GIVE on kshanan laajuuden ulkopuolella — siinä riippumattomat <em>koko putken</em> työkalut ovat edelleen metrien päässä toisistaan todellisella datalla. K_V täsmäytettiin oraakkelin pyöristettyyn arvoon { "5.33" } (kshanan tarkka <c9/> → VPL ~{ "0.06" } % pienempi; vertikaali validoidaan K-kertoimettomana muodossa <c10/>).

seg-4ef39e8ea75c = <b>Lähetysmalli ulkoisesti validoitu.</b> Klobuchar L1 -malli toistaa <b>RTKLIB:n <c1/></b> (<c2/>, < { "1e-4" } m) — <em>toteutuksen pariteetti</em> tosiasiallisen avoimen referenssin kanssa, koska virallista <em>mitattuun totuuteen</em> perustuvaa laskuesimerkkiä ei ole. IONEX TEC -kartan lukija on nyt olemassa (<c3/>, yksikkötestattu); jäljellä oleva aukko on sen ristiintarkistus todellista GIM-tuotetta vasten, ei lähetysmalli. Katso Klobuchar-rivit kohdasta <a1>Väitteet vs. todellisuus</a1>.

seg-fa3058dffb2a = GPS L1 C/A -hajotuskoodi (IS-GPS-200)

seg-53ac231770fb = Koodin generointi on validoitu ulkoisesti.

seg-04db7c613bd5 = <c1/> (<c2/>): G1/G2 LFSR (lineaarinen takaisinkytketty siirtorekisteri) C/A-koodigeneraattori toistaa <b>julkaistut koodivaihemääritykset (IS-GPS-200, taulukko 3-Ia)</b> täsmälleen — ensimmäisten kymmenen sirun oktaaliluvut PRN-koodeille (pseudosatunnaiskohina) { "1" }–{ "9" } ({ "{" }{ "1440" }, { "1620" }, { "1710" }, { "1744" }, { "1133" }, { "1455" }, { "1131" }, { "1454" }, { "1626" }{ "}" }). Tämä sitoo <b>levityskoodin sirusarjan</b> GPS-rajapintamäärittelyyn; ympäröivä modulaatio, spektrierotus ja DLL-koodinseuranta (delay-locked loop, <c3/>) ovat edelleen tasolla MODELLED.

seg-e5f1b960777a = Verkkojen, spektrin, aurinkokunnan, satelliittitähdistöjen, kampanjoiden ja LEO-PNT:n ajoitus

seg-c5bf3b23d688 = Versiolinjalla { "0.28" } lisätyt ominaisuudet arvioidaan rivi riviltä generoidussa tiedostossa <a1><c1/></a1>; tämä osio tiivistää, millä niistä on ulkoinen oraakkeli. Rivi on VALIDATED vain riippumattoman ulkoisen oraakkelin kanssa; kaikki muu on MODELLED.

seg-d791a48b3895 = Ominaisuus (laji)

seg-d4779be2efd8 = Ulkoinen oraakkeli tai syy, miksi rivi pysyy mallinnettuna

seg-0d7bb0fc1c5e = Telekommunikaation MTIE (suurin aikavälivirhe) ja TDEV (aikapoikkeama) holdover-sarjasta (<c1/>)

seg-18894b55b6c1 = <c1/>: { "17" } MTIE- ja { "12" } TDEV-keskiarvoistuskerrointa tallennetulla { "2" } 048 näytteen sirumittakaavan kellon holdover-sarjalla verrattuna allantools-ohjelmaan { "2024.06" }, suhteellinen ero < { "1e-12" } / < { "1e-9" }. ITU-T:n (Kansainvälisen televiestintäliiton telealan standardointisektori) maskien PASS/FAIL-tuomiot ja datalehtien oskillaattoriesiasetukset ovat edelleen tasolla MODELLED. Katso <a1><c2/></a1>.

seg-ff9cb967ae08 = Holdover-ennuste mitatusta kellotallenteesta (<c1/>)

seg-7821227795d8 = <c1/>: sovitus oikean 5071A-cesiumtallenteen ensimmäiseen kolmannekseen, yhden sigman ylitysajan ennuste kuudella kynnysarvolla, mittaus pidätetystä kahdesta kolmanneksesta; kynnyksenä kerroin { "1.5" } kumpaankin suuntaan, havaitut suhteet { "0.84" }–{ "1.03" }. Sen päälle rakennettu aikavälin suojabudjetti ja paikannuspäivitysten tahti ovat edelleen tasolla MODELLED.

seg-2667e3ddf829 = Suljetun muodon L-kaistan tehospektritiheydet ja spektrierotus (<c1/>)

seg-1a0c6ef49f98 = <c1/> suljetut muodot verrattuina julkaistuihin arvoihin (matriisirivi ”Closed-form L-band signal power spectral densities…”). Vesiputouskaavio kaistakohtaisella J/S (häirintälähettimen ja signaalin suhde) ja efektiivisellä C/N0 (kantoaallon ja kohinatiheyden suhde) sekä SigMF-syöttö (Signal Metadata Format) ja -tuloste ovat edelleen tasolla MODELLED.

seg-46278e9c03c1 = Planeettojen paikat JPL:n (Jet Propulsion Laboratory) Standish-elementeistä ja kappaleiden välinen valoaika (<c1/>)

seg-43cfeb9f2403 = { "0.30" }, ennakkorekisteröity JPL Horizonsia (DE441) vastaan: <c1/> ja <c2/>, RMS planeettaa ja komponenttia kohti enintään Explanatory Supplement -teoksen taulukon { "8.10.1" } luku (huonoin { "0.778" }), Maan jako ja ICRF-kierto mukaan lukien; <c3/>, valoaikaratkaisin DE441-paikoilla, ero Horizonsin valoaikaan enintään { "1e-6" } s (huonoin { "6.7e-9" } s). Aiempi kaksinkertaisen nimellisarvon vertailu (<c4/>), jonka kynnys asetettiin ensimmäisen vertailun jälkeen, säilytetään ei-portittavana regressiotestinä. Uranus/Neptunus taulukosta { "1" }, Pluto, kuut, kappaleiden vakiot ja <c5/> ovat edelleen tasolla MODELLED.

seg-b96d8ea13c87 = Walker-geometria ja julkaistut GPS-, Galileo- ja GLONASS-rataslotit (GLObal NAvigation Satellite System); globaali GPS-DOP (tarkkuuden heikkenemiskerroin) (<c1/>)

seg-85c293b8d235 = <c1/>: Walker 24/3/1 toistaa Galileon avoimen palvelun määritystaulukon tarkkuudella { "1e-9" }°, GLONASSin rajapintakuvauksen slottikaavan ja GPS:n päiväntasaajan ylitykset; GPS-lähtötason HDOP:n mediaani { "0.940" } verrattuna Standard Positioning Service -suorituskykystandardin arvoon { "0.94" }. Mielivaltaiset usean satelliittitähdistön kattavuuskartat minkä tahansa kappaleen ympärillä ovat edelleen tasolla MODELLED.

seg-f0187be4b97f = Kampanjat: ketjutetut tehtävät, pyyhkäisyt, Monte Carlo -ensemblet, yhteisten ehtojen ajot (<c1/>)

seg-b5c45fc12e5f = <c1/> ({ "11" } testiä): yhden vaiheen kampanja toistaa itsenäisen ajon tavu tavulta, yhden solmun pyyhkäisy lukee saman luvun, siemenluvulla ajettu ensemble on tavutasolla vakaa. Koostamisidentiteettejä, ei ulkoinen oraakkeli.

seg-bc25d20125e7 = LEO (matala Maan kiertorata) -linkkifysiikka: ITU-R (ITU Radiocommunication Sector) P.838 -sadekertoimet, P.618 sadevaimennus ja tuikinta, P.2109 rakennuksen läpäisyvaimennus, ensimmäisen kertaluvun ionosfääri, suurin Doppler

seg-b1f3bd37d169 = <c1/>, <c2/>: ITU-R-suositusten omat taulukot ja tutkimusryhmän { "3" } validointiesimerkit (tallennettu lähteineen ja noutopäivineen), IS-GPS-200:n ryhmäviiveen suhde ionosfäärille sekä julkaistu suurimman Dopplerin taulukko (Leclere, Marathe ja Reid, ION GNSS+ { "2025" }, arXiv { "2509.19551" }).

seg-492917f11386 = LEO-navigointiviesti: Galileon ICD:n (rajapintakuvaus) lähetetyn efemeridin käyttäjäalgoritmi, CRC-24Q (24-bittinen syklinen redundanssitarkistus), globaalin keskiarvon SISRE-painot (signal-in-space range error) (<c1/>)

seg-514a7da01582 = <c1/>: Galileon käyttäjäalgoritmi toistaa RTKLIBin (avoimen lähdekoodin reaaliaikaisen kinemaattisen paikannuksen kirjasto) tuloksen tarkkuudella { "1" } mm neljällä oikealla Galileon lähetetyllä efemeridillä; CRC-24Q antaa luettelon tarkistusarvon 0xCDE703 ja RTCM:n (Radio Technical Commission for Maritime Services) esimerkkikehyksen { "1005" } tarkistustavut; SISRE-painot toistavat julkaistun MEO/GEO-taulukon. Sovitin, ylilennon aikainen päivitys, binäärikoodaus, RINEX-4-tyylinen/CSV-teksti (pilkuin erotetut arvot) ja valittavat efemeridimallit ovat edelleen tasolla MODELLED.

seg-94bbcd43e03a = LEO-signaalisuunnittelu, ylilento ja linkkibudjetti, Doppler ja yhteinen GNSS+LEO-paikannus, PPP:n (tarkka pistepaikannus) konvergenssi, 5G NTN -paikannus (ei-maanpäällinen verkko), LEO-ajansiirto (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>)

seg-4c37a8cfac87 = <c1/>, <c2/>: suljetut muodot, suodattimen johdonmukaisuus (esimerkiksi PPP-suodattimen ajoilla keskiarvoistettu NEES omalla kaistallaan { "95" }%) ja julkaistujen trendien vertailut; ei kenttädataa.

seg-91cf4e399f0a = Yksi LEO-PNT-järjestelmä päästä päähän (<c1/>)

seg-fb947da2e8b4 = <c1/>: jokainen eteenpäin välitetty arvo on yhtä suuri kuin ylävirran vaiheen oma tuloste, ja ylävirran syötteen muuttaminen siirtää kaikkia siitä riippuvia loppupään lukuja.

seg-7e230aa73770 = LEO-kestävyys ja vertikaalit (harhautus Dopplerilla ja kaistojen välisellä johdonmukaisuudella, ionosfäärin luotaus)

seg-ab2542cfc295 = <c1/> ({ "10" } testiä). Kestävyys- ja vertikaaliskenaariot on lueteltu tiedostossa <a1><c2/></a1>.

seg-2d3ead293658 = Tuotokset, jotka ovat esityksiä eivätkä todisteita, on testattu, mutta niillä ei ole matriisiriviä: tiedonvaihtoviennit (CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, STK:n (Systems Tool Kit) efemeridi, SigMF (Signal Metadata Format)), jotka kukin jäsennetään takaisin formaatin määrityksestä kirjoitetulla validaattorilla (<c1/>, { "13" } testiä; katso <a1><c2/></a1>); animaatiot (<c3/>: tavutasolla identtiset uusinta-ajot, täsmälliset kuvamäärät, hyvin muodostettu SVG (Scalable Vector Graphics), ei ulkoista osoitetta HTML-soittimessa (HyperText Markup Language)); sekä ajoraportti (<c4/>, <c5/>: jokainen mukana toimitettu skenaario raportoi ilman tyhjää osiota tai paikkamerkkiarvoa, nimikkeet vastaavat matriisia, ja tallennettu komento toistaa tiedoston <c6/> ja raportin tavu tavulta).

seg-903e4e51dda1 = Toiminta-alue

seg-e226ad523a3d = Jokaista pakettia harjoitetaan ilmoitetulla syöttöalueellaan testillä <c1/>, joka varmistaa, että jokainen numeerinen tulos on äärellinen (ei NaN/Inf (NaN: ei luku)) ja rajattu. Taulukossa on pakettikohtainen testattu syöttöalue, odotettu tulostekäyttäytyminen ja kattava testi.

seg-8bd4f586f3c7 = Pyyhkäisty syöte

seg-3ebc1201a545 = Testattu alue

seg-a1198518d667 = Odotettu tulos

seg-7bf563f5420a = Kattava testi

seg-4906c027a805 = <c1/> (ajoitusspesifikaatio)

seg-d91e18ce3773 = { "1" } – { "500" } ns

seg-10cf765fdd75 = äärelliset holdover-, ajoitus- ja turvallisuuslaatumittarit

seg-fe640e9c3c1e = { "1e-7" } – { "1e-2" } m/s² (kylmäatomi → karkea MEMS (mikrosähkömekaaniset järjestelmät))

seg-456c32a126a2 = äärellinen, rajattu paikan RMS/p95

seg-dae96fd3a01b = <c1/> (korkeuskulmamaski)

seg-a54c3c8933c6 = äärellinen DOP/saatavuus; rajattu

seg-bf506e17cf81 = { "0.1" } – { "50" } ns/s

seg-b6d0d587046e = äärellinen P_md / turvallisuus, rajattu

seg-fda0b32d7784 = { "10" } – { "1000" } m

seg-132fdea2270f = äärellinen ajoituksen/paikan holdover

seg-c9099375b99f = rata (oikea)

seg-952b94eda0ff = oikeat Celestrak-TLE:t ryhmästä <c1/>

seg-60009932477c = 30 satelliitin tilannekuva, tiukka tarkistussumma

seg-deb16d50741e = latautuu vain kelvollisilla tarkistussummilla; rajattu geometria

seg-c46d726e35b3 = kello (flicker)

seg-15939085bf3a = <c1/> päällä/pois

seg-504a95f55b88 = { "0" } vs. { "1e-12" }

seg-e1cce0c2028e = 1/f-pohjan käyttöönotto <b>huonontaa</b> ajoituksen p95-vapaata etenemistä

seg-bdd4e56bdef9 = fuusio (realismi)

seg-09af9dd78fe3 = <c1/> { "0" } vs. { "5.88e-7" } m/s²

seg-a9eb04be2b9f = suodatin konvergoituu yhä, enintään { "3" }× nollaharhan virhe

seg-2a839953aa6a = Flicker-FM- ja fuusioharhariveillä suljetaan kaksi tiettyä realismiaukkoa: kohinatermit ovat <b>oletuksena pois päältä, mutta vaikuttavat osoitettavasti tulosteeseen, kun ne otetaan käyttöön</b>, ja yhteinen fuusiosuodatin <b>ei ole riippuvainen siitä, että harhat nollataan</b> — se konvergoituu myös realistisella kylmäatomiluokan jäännösharhalla.

seg-4f0e9f9d4cdf = Kvantti- ja klassisissa ajoissa on nyt riippumattomat RNG (satunnaislukugeneraattori) -siemenluvut (klassinen siemenluku = siemenluku + 0x9e3779b97f4a7c15), joten niiden kohinatoteutumat ovat korreloimattomia — korjattu katselmoinnin jälkeen.

seg-3b6b785f401a = <c1/> on segmenttitietoinen: katkoaikajanat jaetaan yhtenäisiin segmentteihin GNSS:n uudelleenhankinnassa, ja raportoitu arvo on huonoimman tapauksen (lyhin) vapaa eteneminen niiden joukosta. Sitä rajaa edelleen aikaruudukon erotuskyky (alaraja).

seg-4a830113b13d = ISL-ajansiirron uudelleensynkronointi mallintaa jäännöslinkin epävarmuuden tuoreena nollakeskiarvoisena värinänä jokaisella mittausaskeleella sekä uudelleenankkuroinnilla asetetulla välillä.

seg-30c4d89aa433 = Väitteet vs. todellisuus — pikaopas

seg-27a22de7b8c0 = Vihamielisen arvioijan tarkistuslista. Jokaiselle termille, joka voitaisiin ymmärtää enemmäksi kuin mitä se on: mitä Kshana tekee tänään ja missä todellinen versio on tiekartalla.

seg-759eb0cfafe4 = Termi, jonka saatat nähdä

seg-6a2d3691d642 = Mitä se on todellisuudessa tänään

seg-bbd0145bfb95 = Mitä se <b>ei</b> ole (vielä)

seg-a6fdb038b003 = ”hybridi kvantti-/klassinen PNT-simulaattori”

seg-4421f8bd0967 = klassinen stokastinen simulaattori, jota ohjaavat julkaistut kvanttianturien Allan-/kohinakertoimet

seg-3885661aafff = ensimmäisten periaatteiden kvanttifysiikka (Mach–Zehnder-vaihe, projektiokohina, systemaattiset virheet) — katso <a1><c1/></a1>

seg-1d28debd0302 = ”yhteinen Kalman-fuusio” / fuusiopaketti

seg-d13beba21ba7 = ajettava paketti <c1/> havainnoi kelloa ja paikkaa <b>erikseen</b> (suora aikapaikannus ja suora paikannus), jolle optimaalinen estimaattori on aidosti lohkodiagonaalinen — kaksi kaksitilaista suodatinta yhteisellä laatumittarilla

seg-25c2fe6fa6d3 = <em>kytketty</em> suodatin <b>pseudoetäisyyden</b> tapaukselle <b>on</b> nyt olemassa muodossa <c1/> (4-tilainen pinottu <c2/>, nollasta poikkeava lohkojen välinen kovarianssi, NEES-validoitu), mutta se <b>ei ole vielä kytketty ajettavaan pakettiin</b>, ja paketti on <b>1-DOF (yksi vapausaste)</b> — 3D:n 8-tilainen laajennus on tulevaa työtä

seg-5cce1ca5b86f = Turvallisuuden laatumittari (laji <c1/>)

seg-d55c30f63023 = <b>stokastisen aikaharhautuksen ilmaisimen</b> suure <c1/>: kaksipuolinen χ²₁ / Neyman–Pearson -testi kelloavusteisella monitoritunnusluvulla, kynnys asetettu tavoitteesta <c2/>, <c3/> arvioitu <b>spesifikaation suuruudella</b> sekä suljetussa muodossa että Monte Carlolla (jotka täsmäävät muutaman ×1/√N sisällä)

seg-dbf2039a4a8e = usean satelliitin RAIM/ARAIM-ilmaisin — katso <a1><c1/></a1>; monitoritunnusluku on Gaussin malli kellon PSD-johdetulla σ:lla, ei signaalitason korrelaatio

seg-32bcb801e49c = ”kelloavusteinen harhautuksen havaitseminen”

seg-58e4d22075e9 = <b>yhden kellon</b> aikaeromonitori (Gaussin tunnusluku, σ kellon PSD:stä), EI usean SV:n (SV: avaruusalus eli satelliitti) RAIM

seg-f3f6f95bc559 = etäisyysalueen usean SV:n RAIM suojaustasoilla

seg-a5faedaab13e = harhautusilmaisimen P_md (suljettu muoto vs. Monte Carlo)

seg-0362489c341a = analyyttinen, funktioon <c1/> perustuva arvo <c2/> ja empiirinen arvio <c3/> kokeen perusteella täsmäävät otantavirheen sisällä (≈ 1/√N); validoitu testeissä <c4/> / <c5/> rasitetulla poikkeamalla (μ/σ = { "2" })

seg-8fa5c9468ff5 = mitattu ilmaisimen ROC tallennetusta harhautusdatasta

seg-8f895aa1c657 = pseudoetäisyysmalli (<c1/>)

seg-a5e5e1e7a0e9 = <b>eteenpäinsimulaatio</b>: <c1/>. Jokainen ilmakehämalli on yksikkötestattu käsin laskettuja arvoja vastaan (ZHD (zenith hydrostatic delay, zeniitin hydrostaattinen viive) ≈ { "2.3" } m, Niell = { "1" } zeniitissä, Klobucharin vinous), ja koko Klobucharin lähetysmalli on <b>ristiintarkistettu RTKLIBin viitetoteutusta <c2/> vastaan</b> alle millimetrin tarkkuudella (<c3/>, { "6.1278" } m RTKLIBin oletuskertoimien tapauksessa — virallista julkaistua Klobuchar-testivektoria ei ole, joten tämä on toteutusten pariteetti, ei mitattu totuus); <b>nollakohinaajo toistaa geometrian + korjaukset alle millimetrin tarkkuudella</b> (RAIM-jäännös ≈ { "0" })

seg-adc8a5d89cbd = <b>paikkaratkaisu</b> oikeista signaaleista (PPP/RTK (PPP: tarkka pistepaikannus)), kaksitaajuinen ionosfääritön yhdistelmä tai kantoaallon vaiheen kokonaislukuepävarmuuden ratkaisu — ei mallinnettu

seg-a56533528c6e = häirintämalli (laji <c1/>)

seg-0a4a28fcd53a = <b>linkkibudjetin</b> ketju: J/S vapaan tilan etenemisvaimennuksesta + suuntakohtaisesta antennivahvistuksesta → efektiivinen C/N₀ häirinnänestoyhtälön kautta (hajautusvahvistus × spektrierotus <c1/>) → lukituksen menetys kynnyksellä (Kaplan & Hegarty §{ "9.4" })

seg-b53e210487fb = monitie-eteneminen, AGC:n (automaattinen vahvistuksensäätö) dynamiikka ajassa, hankintahaku itse (valinnaisessa osiossa <c1/> hystereesi on kynnysten pari); valinnaisen osion <c2/> kvantisointihäviö on Gaussin syötteen häviö, ei päde CW-häirintälähettimelle; valinnaisen osion <c3/> ryhmä on kapeakaistainen ja ideaalinen (ei kytkentää eikä epäsovitusta), ja valinnaisen osion <c4/> varjostus on yksi veitsenterä yhdellä SRTM-ruudulla; <c5/> on edustava tyyppikohtainen vakio, ei johdettu häirintälähettimen mitatusta PSD:stä

seg-523d66d56f97 = Eheyden laatumittari (kello-/holdover-paketit)

seg-d0702ee52d37 = suodattimen <b>itseyhdenmukaisuus</b> (poistumanäytteiden osuus oman k·σ-rajansa sisällä)

seg-b4b68065e521 = HPL/VPL, eheysriski / P_HMI, hälytysrajat, DO-229E/316/ED-259A — ne raportoidaan erikseen lajin <c1/> (RAIM / ARAIM) ja SBAS-toimintojen kautta, eikä niitä koskaan yhdistetä tähän laatumittariin

seg-d5b1f858f0e3 = vanhan skenaarion <c1/> <b>paketin</b> laatumittari

seg-e9fe365d7318 = <b>yksiakselinen (1-DOF)</b> kiihtyvyysanturin/gyron virhebudjetti (VRW/ARW, harhan epästabiilius) totuuteen napsautettavalla nollauksella

seg-604e8d96c2c2 = <em>vanha</em> paketti on 1-DOF; <b>3-akselinen polku toimitetaan paketissa <c1/></b> (seuraava rivi)

seg-e2a4a1c47f2c = 3-akselinen strapdown-<b>kirjasto</b> + <b>paketti</b> <c1/> (<c2/>, <c3/>)

seg-01e5672a37a4 = varmennettu kvaternio/NED (NED: pohjoinen-itä-alas) -navigaattori deterministisellä IMU-virhemallilla — <b>mittakerroin, kohdistusvirhe, g-herkkyys, kvantisointi, kulmanopeuden ramppi</b> mallinnettu (IEEE Std 952-1997 §A.2; Groves { "2013" } §{ "4.3" }) — jota nyt <b>ajaa skenaariopaketti <c1/></b> ja joka on <b>määritettävissä anturikohtaisesti TOML:sta (Tom's Obvious Minimal Language, skenaarioformaatti)</b> (<c2/>)

seg-acecd6b81859 = <b>ei mallinnettu:</b> tärinän tasasuuntausvirhe, lämpötilagradientin ryömintä. Yhdistetyn vapaan etenemisen virhettä rajoittaa luovutuksen asentovirhe (kallistuma/kiihtyvyysanturin harha erottuvat heikosti), joten anturikohtaista harhan kalibrointia ei väitetä

seg-6b04fc376c0d = ”Hybridi-PNT-integrointi” (paketti <c1/>)

seg-cd3125081b5c = avoimen silmukan dead reckoning, jota rajaavat totuuteen napsautetut GNSS-nollaukset

seg-578c93c67ae7 = kytketty (löysä/tiukka) GNSS–INS-Kalman-yhdistelmä — se on erillinen paketti <c1/> (EKF) ja laji <c2/>

seg-57f603da0331 = ”Paikannussuorituskyky” (kellopaketit)

seg-278aafe7fadf = kellovaiheen <b>ajoituksen</b> RMS yksikössä ns (<c1/>)

seg-a6af364cbcdc = paikka-alueen RMS/CEP/SEP/DOP-painotettu (SEP: pallomainen todennäköinen virhe) tarkkuus

seg-b68c5a4363a5 = inertiaalinen paikan laatumittari (<c1/>)

seg-850e030bb5e3 = <b>yksiakselinen</b> paikan RMS/p95 metreinä yhdestä siemenluvusta, ellei asetus <c1/> pyydä ensemblea (silloin keskiarvo, hajonta ja bootstrap-luottamusväli { "95" }% mittaria kohti)

seg-be77929afa2c = ensemblen CEP / 2DRMS (kaksi kertaa etäisyyden RMS) -jakauma (tiekartta: Monte Carlo -CEP)

seg-75f239679dc2 = ”validoitu tarkkuuteen ~{ "2" }%”

seg-2d593a99a2b1 = <em>tyypillinen</em> havaittu yhteensopivuus; <b>valvottu portti on { "20" }–{ "25" }%</b> suhteellinen virhe

seg-34cfd0e08235 = taattu tarkkuusraja { "2" }%

seg-d3402cc1ebd5 = ”toistettava / bitti-identtinen”

seg-46ea210bcdad = bitti-identtinen uusinta-ajo <b>samassa käyttöjärjestelmässä (OS) + kiinnitetyllä työkaluketjulla</b>; Linuxin, macOS:n ja Windowsin välillä CI tarkistaa jokaisen tuloksen syötteen sormenjäljen ja muodon tallennetun SHA-256-tiivisteen (<c1/>) sekä numeeriset arvot tarkkuudella { "1e-6" } (<c2/>)

seg-38c6528122a8 = tavuidenmukaisesti identtinen koko tulos eri käyttöjärjestelmien välillä (libm:n viimeisen numeron erot)

seg-b0e21aea4ccd = SGP4 GPS -skenaario (<c1/>)

seg-1131aa869f1d = aito Celestrakin tilannekuva <c1/> (2021-07-28, { "30" } satelliittia, tiukat tarkistussummat), jokainen satelliitti propagoitu omasta TLE-epookistaan

seg-21c2f1b5d7e2 = ajantasainen satelliittitähdistö — päivitä tilannekuva komennolla <c1/> (katso <a1><c2/></a1>); NORAD:n (North American Aerospace Defense Command) luettelonumerot ovat oikeita

seg-6948bd06c7e5 = Kuun PNT -artikkelien ristiintarkistukset (regressiotodiste, ei matriisirivejä)

seg-9ee0faf0b359 = Kuun/kuunläheisen avaruuden sarja (README:n ominaisuudet ”Lunar & cislunar” ja ”Lunar PNT suite”) on riippumattomasti ristiintarkistettu julkaistujen artikkelien väitteiden osalta tiedostoissa <c1/>, kukin <em>eri</em> toteutuksesta peräisin olevaa oraakkelia vastaan:

seg-b4edbf832fe6 = <b>kiertoradalta lähetyksen/kaappauksen jalanjälki</b> vs. <c1/> (Cephesin Bessel J1);

seg-c856d319a46e = <b>pintamajakan geometrian DOP</b> vs. riippumaton NumPy-ratkaisu lausekkeelle <c1/>;

seg-33ee672d98d7 = <b>UT1/EOP-pysyvyysennusteen virheen kasvu</b> vs. samojen sanatarkkojen IERS-rivien (<c1/>) NumPy-uudelleenjäsennys;

seg-9b6e59789117 = <b>tasomainen kaukaisen vastakulkuisen radan perhe</b> vs. NASA/JPL:n kolmen kappaleen jaksollisten ratojen tietokanta;

seg-c77384abd1cc = <b>RF-etäisyysmittauksen toistotarkkuusbudjetti</b> vs. ensimmäisistä periaatteista johdettu viite.

seg-a451dbe09e10 = Testiaineistot ja oraakkelin generointiskriptit sijaitsevat hakemistossa <c1/>. Ne vahvistavat todistepohjaa ominaisuuksille, jotka pysyvät tasolla <b>MODELLED</b> koneellisesti tarkistetussa matriisissa (<c2/>); ne ovat regressiotarkistuksia, <b>eivät</b> uusia matriisirivejä tasolla VALIDATED, joten ne eivät itse muuta koneellisesti tarkistetun matriisin lukumäärää. Lukumäärää ei toisteta tässä, koska käsin kirjoitettu kopio siitä ajautuu pois: todellinen jako on tiedoston <a1><c3/></a1> generoidussa otsikossa, jonka <c4/> kirjoittaa funktiosta <c5/> ja jonka <c6/> kiinnittää.

seg-a353a63661de = <s1>Edellinen</s1>Yhteentoimivuuden viennit ja tuonnit

seg-fdae3b73ab67 = <s1>Seuraava</s1>Varmennusmatriisi

seg-59c12422e6e7 = Vuorovedet geopotentiaalissa (src/tides.rs)

seg-10f0b4616abe = Ohjailut ja lentoradan suunnittelu (src/maneuver.rs)

seg-56cdbd59ce5d = Radanmääritys (OD) (src/orbit_determination.rs, src/batch_ls.rs)

seg-3a2c69fcbb86 = Voimamallin validointi efemeridisovituksella (src/precise_od.rs)

seg-05a25c6ef750 = Oikeat viraston tarkat radat (tests/agency_galileo.rs, tests/agency_swarm.rs, tests/agency_lro.rs)

seg-279f4619bc2d = Painovoimakarttaan perustuva / vaihtoehtoinen PNT-navigointi (src/gravimeter.rs, src/mapmatch.rs, src/particle_filter.rs, src/altpnt/terrain.rs)

seg-7b512df70323 = INS/IMU-virhemalli — datalehtiin viitattu validointi (src/inertial/)

seg-b385e665cfff = Syvän avaruuden ja Marsin PNT — D0-perusta (src/body.rs, src/mars_frame.rs, src/ephem_provider.rs, src/radiometric.rs, src/timescales.rs)

seg-5887e7e1a218 = Syvän avaruuden radiometriset suureet ja CCSDS Tracking Data Message — D1 (src/radiometric.rs, src/ccsds_tdm.rs)

seg-a9cf84a14301 = Syvän avaruuden redusoidun dynamiikan OD — D2 (src/deepspace_od.rs, src/clock_state.rs, src/mars_atmos.rs)

seg-dc406cb825db = Syvän avaruuden PNT-skenaario ja yksisuuntaisen+kaksisuuntaisen mittauksen fuusio — D3 (src/mars_pnt.rs, src/deepspace_od.rs)

seg-7784f9436dd2 = Kuun koordinaattiaika — relativistinen Maa–Kuu-kellonopeus (src/lunar_time.rs)

seg-8a34cb900611 = Kuun geodeettinen VLBI — lähikentän viive Maa-peruslinjalle, joka havaitsee kuumajakan (src/lunar_vlbi.rs)

seg-d47906a347b3 = Kuun yhteinen usean tekniikan OD + kello — simuloitu suljetun silmukan palautus (src/lunar_combination.rs)

seg-17b9f0ae9dee = Kuun koordinaatiston realisointi — 7-parametrinen Helmertin datumisovitus (src/lunar_frame_realise.rs)

seg-3cfffa3eeb79 = Kuun navigointipalvelun tilavuus — DOP / kattavuus / saatavuus + yleistetty Kuun ARAIM-suojaustaso (PL) (src/lunar_service.rs)

seg-d80bf3320a15 = Kuun differentiaalinen PNT — yhteismuotoinen kumoutuminen + peruslinjan mukana kasvava jäännös + DGNSS-suojaustasot (src/lunar_dpnt.rs)

seg-23c3d8a79acf = Kuun yhteentoimivuusvienti — LunaNet/IOAG-linjattu CCSDS OEM + KIF edestakaisella yhteensopivuustarkistuksella (src/lunar_interop.rs)

seg-a697f4f424b8 = Demonstraation edustavuus ja lentoon johtavien aukkojen kirjanpito (ledger) (src/representativeness.rs)

seg-4c924153299d = Yhtenäinen kvantti vs. klassinen -vaihtoehtovertailun todiste (src/qtrade.rs)

seg-bd1a5835c5db = Kvanttilaitteiden virhemallikirjasto (src/quantum_devices.rs)

seg-6b1bb731f966 = Luotettu kvanttiajoitus — päästä päähän -ketju, turvallinen jakelu, poikkeama + vaihtoehtovertailu (src/timetransfer_chain.rs)

seg-3332c6c1ae86 = GNSS-vapaa kvanttinavigointi (src/quantum_nav_od.rs)

seg-9b46a5add4ab = Kvantti-PNT-järjestelmien vika-/poikkeamahavaitseminen (src/quantum_faults.rs)
