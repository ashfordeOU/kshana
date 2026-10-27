# docs--compliance-dhs-rpcf: translations (fi)

seg-d01db1c2710a = Hakuteos

seg-fdbb9db68f1d = ei mitään

seg-dbec6a166e56 = Lähde: <c1/>

seg-6e9b601864df = US DHS Resilient PNT Conformance Framework: mille vaatimuksille Kshana tukee todisteita

seg-cef4181edf29 = Viitekehys kuvaa kestävyystasot { "0" }–{ "4" }, jotka muodostuvat kahdeksasta numeroidusta vaatimuksesta, sekä arviointitavan, joka yhdistää staattisen analyysin dynaamiseen analyysiin, jossa testivektorit edustavat uhkia. Siinä ei ole omaa vaatimustunnisteiden järjestelmää, joten alla olevat viittaukset ovat sen taso- ja vaatimusnumeroita sekä jaksonumeroita. Se on tulosperusteinen eikä luettele uhkia.

seg-ff0e00610721 = Jokainen rivi kertoo, mitkä Kshana-tuotokset <b>tukevat todisteita</b> vaatimukselle ja mitä jää jäljelle. Mikään tässä ei sano, että viitekehys täyttyy tai että kukaan olisi luokitellut tai hyväksynyt jotakin tuotetta. Aja <c1/> omilla tulostiedostoillasi nähdäksesi, mitä rivejä ajosi todella tukevat todisteilla; katso <a1>README.md</a1>.

seg-30c8cabb6e90 = Lähdeasiakirjat

seg-2261e4292865 = <b>Resilient Positioning, Navigation, and Timing (PNT) Conformance Framework</b>: versio { "2.0" }, { "26" }. huhtikuuta { "2022" } (DHS Science and Technology Directorate yhdessä CISA:n kanssa). <a1>https://www.dhs.gov/sites/default/files/2022-05/22_0531_st_resilient_pnt_conformance_framework_v2.0.pdf</a1>. Luettu 2026-10-09: asiakirja luettu kokonaan; julkaisun aloitussivua ei haettu.

seg-955191e0baab = Vastaavuus

seg-6ba8f74126ee = Mitä se vaatii (parafraasi)

seg-0438151025da = Kshana-tuotokset, jotka tukevat sille todisteita

seg-3f265e18f56c = Aukko

seg-4263435e702a = Jakso { "5.2" } (Prevent, Respond, Recover)

seg-e7b721f6e216 = Kestävyys kuvataan kolmena toimintona: haitan ehkäisy, reagointi (havaitse, ilmoita, lievennä, rajaa) ja palautuminen. Havaitseminen on todennäköisyyspohjaista, joten sekä väärät hälytykset että havaitsematta jääneet tapahtumat ovat tärkeitä.

seg-3447d3b53fe8 = Vastaanottimen lokin luottamusarviointi; Harhautuksen ja meaconingin havaitseminen; Holdover ja coasting

seg-ab055a50e16e = Ehkäisy on tuotesuunnittelun ominaisuus, jota mikään simulaation tuloste ei osoita. Synteettisen tai yhden istunnon ajon havaitsemistilastot eivät ole käyttöön otetun tuotteen mitattu väärän hälytyksen tai havaitsematta jäämisen osuus.

seg-501badd6a436 = Taso { "1" }, vaatimus { "1" }

seg-e8cfbe121084 = Tarkista, että ulkoisista lähteistä saapuva tallennettu data vastaa asiaankuuluvien standardien formaatteja ja arvoalueita.

seg-7d7196aefa05 = Testattavan tuotteen ohjelmistovarmistus- ja syötteenvalidointiominaisuus. Kshana ei tarkasta tuotteen syötteenkäsittelyä.

seg-6085030de980 = Taso { "1" }, vaatimus { "2" }

seg-e8cd6fb732ad = Salli täysi manuaalinen palautus tyhjentämällä tai nollaamalla muisti, jolloin järjestelmä palaa määriteltyyn suorituskykyyn uhan poistuttua.

seg-8d216d42c776 = Vastaanottimen lokin luottamusarviointi

seg-e3ca721d9d2e = Vastaanottimen loki näyttää, milloin paikkaratkaisusta tuli epäluotettava ja milloin se palautui; se ei osoita, että manuaalinen nollaus tyhjentää jokaisen tallennetun tilan.

seg-2c78c15cea96 = Taso { "1" }, vaatimus { "3" }

seg-ab9458f8b8fc = Lataa laiteohjelmisto uudelleen tai päivitä se turvallisesti.

seg-3a50eceb47f5 = Laiteohjelmistopäivityksen turvallisuus on sen ulkopuolella, mitä mikään Kshana-tuloste havainnoi.

seg-752a194674f6 = Taso { "2" }, vaatimus { "4" }

seg-a5f263a083c7 = Tunnista vaarantuneet PNT-lähteet ja estä niitä turmelemasta ratkaisua.

seg-4e7034acccc0 = Harhautuksen ja meaconingin havaitseminen; Vastaanottimen lokin luottamusarviointi; Eheyden valvonta ja suojaustasot

seg-d5fdef2a78f2 = Kshana pisteyttää ilmaisimet ja valvontaratkaisut, joita se mallintaa tai ajaa lokin yli; toimiiko tuotteen oma lähteiden poissulkeminen, vaatii tuotteen sisäisen tilan, ei vain sen lokia.

seg-e3ea1208fac9 = Taso { "2" }, vaatimus { "5" }

seg-c0219254fe8e = Palauta lähteet ja järjestelmä automaattisesti keskeyttämättä tulostetta; ratkaisu annetaan edelleen uhan aikana, mahdollisesti rajoittamattomalla heikkenemisellä.

seg-3dd48cb65cb4 = Holdover ja coasting; Vastaanottimen lokin luottamusarviointi

seg-0c36c4a3eb4e = Holdover-ajot rajaavat mallinnetun ajautumisen ilmoitetulle kello- tai inertiamallille, eivät tuotteen omaa palautumiskäyttäytymistä.

seg-befbf4b94876 = Taso { "3" }, vaatimus { "6" }

seg-45410d1675be = Yhden lähteen korruptoitunut data ei saa saastuttaa toista lähdettä.

seg-ff808ce8ec48 = Vaihtoehtoiset ja monimuotoiset PNT-lähteet

seg-ccf628643110 = Kshana ajaa lähteitä rinnakkain; lähteiden eristys tuotteen sisällä vaatii suunnittelukatselmuksen tai vikainjektion tuotteeseen.

seg-a1d5a3125697 = Taso { "3" }, vaatimus { "7" }

seg-db149ea618dd = Varmista kaikkien lähteiden ratkaisut ristiin ja pidä heikkeneminen uhan aikana rajattuna.

seg-4afa05ef42fa = Eheyden valvonta ja suojaustasot; Holdover ja coasting; Vaihtoehtoiset ja monimuotoiset PNT-lähteet

seg-8b1f938c0175 = Rajattu heikkeneminen osoitetaan mallinnetuille antureille; tuotteen omaa ristiintarkistusta ei havainnoida.

seg-772244881e5b = Taso { "4" }, vaatimus { "8" }

seg-aff5161e6363 = Käytä eri teknologioihin perustuvia lähteitä yhteismuotoisia uhkia vastaan, ilman heikkenemistä uhan aikana.

seg-587889f9881c = Vaihtoehtoiset ja monimuotoiset PNT-lähteet; Häirinnän linkkibudjettivaikutukset

seg-65b96caf8d6b = Yhteismuotoinen argumentti vaatii todellisen tuotteen lähdejoukon ja uhan, joka ulottuu niiden yli; skenaario esittää sellaisen, mutta ei todista, ettei tuotteella ole yhteistä heikkoutta.

seg-3c4cc0793454 = Jakso { "5.5" } (yhteismuoto)

seg-a87c9808dd99 = Monimuotoisilla mekanismeilla ei saa olla yhteistä heikkoutta: esimerkiksi kaksi kaistaa kattava häirintälähetin kumoaa kaistamonimuotoisuuden.

seg-c10ba3bb01be = Häirinnän linkkibudjettivaikutukset; Kestävyyspisteytys uhkaensemblien yli; Vaihtoehtoiset ja monimuotoiset PNT-lähteet

seg-843fe2fc9e33 = Pisteytys käyttää synteettistä uhkaensemblea, ja se ilmoitetaan sellaisena; se ei ole kenttädataa.

seg-3158e7efd1a5 = Jaksot { "8.1" }–{ "8.3" } (arviointi)

seg-3942d9cdc64b = Arviointi yhdistää staattisen analyysin dynaamiseen analyysiin, jossa testivektorit edustavat uhkia; testiluokat ovat lähteen vika, häiriö ja sisäiset viat. Simulaattorit mainitaan testimenetelmänä.

seg-9d5c297c1ab9 = Vastaanottimen lokin luottamusarviointi; Häirinnän linkkibudjettivaikutukset; Harhautuksen ja meaconingin havaitseminen

seg-bb02568e8f8f = Viety liike ja tapahtumat voivat ohjata laboratoriosimulaattoria (docs/TEST-BENCH.md). Kshana ei kirjoita signaalia, joten simulaattori ja sen valtuutettu käyttäjä tuottavat uhan.

seg-b81625e9e071 = Jakso { "8.6" } (testisuunnitelman osat)

seg-27d645a79672 = Testisuunnitelma ilmoittaa tason, vaatimuksen, syötteet, viitteet, tarvittavan datan käytön, menettelyn hyväksymis- tai hylkäyskriteereineen, tulokset ja huomautukset.

seg-1f2898855ccc = Toistettavan ajon alkuperätieto; Vastaanottimen lokin luottamusarviointi

seg-d8b08da48cb2 = Hyväksymis- tai hylkäyskriteerit valitsee arvioija; Kshana tallentaa syötteet, kynnykset ja tiivisteet, joilla se ajoi.

seg-ccfdf53a1e54 = <s1>Edellinen</s1>Compliance-kartoitus

seg-260ba950eb89 = <s1>Seuraava</s1>IMO-ohje aluksille
