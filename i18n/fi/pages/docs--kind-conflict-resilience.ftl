# docs--kind-conflict-resilience: translations (fi)

seg-c4ed27a559df = Aihesivu: <a1>RESILIENCE-CROSSWALK.md</a1>

seg-216efc4e6fba = Moottorin v{ $version } skenaariotyyppi, perhe <a1>Vaihtoehtoinen PNT GPS:n estyessä</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva merkintä on moottorin tai varmennusmatriisin oma; tyyppi on MODELLED, ellei matriisi toisin sano (miten merkintä ansaitaan: README-tiedoston osio Evidence).

seg-619127334cf3 = Yksikään matriisin rivi ei nimeä tätä tyyppiä nimellä; sen tuloksen merkintä on moottorin oma, yllä.

seg-98133e74f88a = Perhesivu: <a1>Vaihtoehtoinen PNT GPS:n estyessä</a1>

seg-34f14aa2ee0b = Lähde: <c1/>

seg-a80556cfe1a9 = <c1/> (skenaariotyyppi)

seg-c8f93431680a = MODELLED kerrostetun PNT:n konfliktinkestävyys (P7): kiistellyssä ympäristössä toimiva käyttäjä käyttää useita PNT-kerroksia (avoimen palvelun GNSS, laajakaista-GNSS, autentikoitu tähdistö, täydennysrele), joilla kullakin on perusasaatavuus, tarkkuus (1σ) ja vektorikohtainen estoalttius yhteiselle häirintä-/harhautusuhalle. Voimakkuuden mukaan pyyhkäisty SIEMENLUVULLINEN Monte Carlo estää jokaisen kerroksen todennäköisyydellä clamp(vulnerability·intensity·vector_weight,{ "0,1" }), yhdistää selviytyneet suljetun muodon käänteisvarianssisäännöllä σ_fused=(Σ 1/σ_i²)^(−1/2) ja raportoi kokonaismenetyksen todennäköisyyden (kaikki kerrokset estetty), yhdistetyn virheen mediaanin ja kerroskohtaiset käytettävyys-/estotilastot voimakkuuden funktiona. Keskeinen kestävyyssuhde (yksikerroksisen ja kerrostetun kokonaismenetyksen todennäköisyys) asettuu noin ~7x RIIPPUMATTOMUUSoletuksella; yksitekijäinen Gaussin kopulan korreloitu estopyyhkäisy osoittaa sitten, että tämä ~7x romahtaa kohti arvoa { "1" }, kun eston korrelaatio kasvaa (korrelaatio kumoaa kerrostamisen). Priorisensitiivisyyslohko vaihtelee keskeistä lukua LÄHTEISTETTYJEN alttiuspriorien yli mcda-tornadon + Dirichlet-uhkapanostuksen uudelleenjaon + persentiililuottamusvälien avulla. VALIDATED ydin: Monte Carlo -kokonaismenetys suppenee suljetun muodon riippumattomaan tuloon Π_i p_deny_i (MC-keskivirheen sisällä kiinteällä siemenluvulla ja suurella N:llä); käänteisvarianssiyhdistys on suljetun muodon identiteetti; kun ρ={ "0" }, kopula redusoituu riippumattomaksi malliksi ja jokainen ρ säilyttää kunkin kerroksen reunaestoasteen. MODELLED: kerroskohtaiset alttius-/saatavuus-/tarkkuusmagnitudit ovat lähteistettyjä mutta mallinnettuja syötteitä (JammerTest { "2024" }, TEXBAT, EASA SIB, RTCA DO-229, LunaNet/IOAG — ks. conflict_threat_params), ja tietty ~7x suuruus sekä suhde–korrelaatio-käyrän muoto seuraavat tästä parametrisoinnista. Sitten §{ "4.2" } vektorikohtainen selviytymisjaottelu purkaa yhteisen RF-uhan neljäksi nimetyksi vektoriksi (jamming/spoofing/kinetic/cyber) ja raportoi kunkin vektorin käytettävän PNT:n asteittaisen heikkenemisen käyrän S_v(x)=1-Prod_i(1-a_i(1-clamp(susceptibility_i,v·x,{ "0,1" }))) — VALIDATED: siemenluvullinen kerroskohtainen Monte Carlo suppenee tähän suljettuun muotoon; häirintä on terävin vektori korreloituneelle RF-lähtötasolle, ja RF-immuuni inertiakerros on ratkaiseva selviytyjä. Ei sertifioitu navigoinnin saatavuustuote.

seg-dd10a00edc2f = Yksi ajo tiedostolla <c1/> tiivistyy seuraavasti: conflict-resilience | { "4" } layers ({ "0" } baseline) | reference intensity { "1.00" } | resilience ratio closed-form 6.73x MC 6.19x (layered vs single-layer) | correlation defeats layering: ratio 7.50x @ rho { "0.00" } -> 1.21x @ rho { "0.95" } | prior CI [5.51-8.48]x | per-vector survival @ ref jam { "26" }% spoof { "80" }% kinetic { "100" }% cyber { "99" }% (sharpest jamming) | ~7x headline MODELLED, VALIDATED MC->closed-form / fuse-identity / copula-marginals / per-vector-survival

seg-674bafccbaf7 = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-71fcff68edaf = Esimerkki <c1/> asettaa muun muassa seuraavat:

seg-4e3b5bb5a5e7 = GNSS L1 C/A (avoin palvelu)

seg-bd3832c8215d = Tulosmerkintä (moottorin oma): MODELLED kerrostetun PNT:n konfliktinkestävyys (P7). VALIDATED ydin: Monte Carlo -kokonaismenetyksen todennäköisyys suppenee suljetun muodon riippumattomaan tuloon Pi_i p_deny_i (varmistettu MC-keskivirheen sisällä kiinteällä siemenluvulla ja suurella N:llä); käänteisvarianssipaikkayhdistys sigma_fused = (sum_i 1/sig

seg-4dd2bcc206db = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/conflict-resilience.toml, skenaariotyyppi conflict-resilience

seg-c0e69524f05d = <b>MODELLED</b> Osadimensiokohtaiset osapisteet Kshana-ohjelman omissa seitsemässä kestävyysluokassa (ei DHS-termejä), RethinkPNT RDRR -funktioissa ja Yangin kriteereissä, kukin merkitty mallinnetuksi kun i. Oraakkeli (InternalConsistency): Käsin johdetut mittarikohtaiset kaavat: käänteinen Simpsonin monimuotoisuus, painotettu keskiarvokomposiitti, rajatut/rajaamattomat aikajanojen kestot, heikoimman lenkin tasoportaikko

seg-2ca37a78e899 = MODELLED kerrostetun PNT:n konfliktinkestävyys (P7). VALIDATED ydin: Monte Carlo -kokonaismenetyksen todennäköisyys suppenee suljetun muodon riippumattomaan tuloon Pi_i p_deny_i (varmistettu MC-keskivirheen sisällä kiinteällä siemenluvulla ja suurella N:llä); käänteisvarianssipaikkayhdistys sigma_fused = (sum_i 1/sigma_i^{ "2" })^(-1/2) on suljetun muodon identiteetti; kun korrelaatio rho={ "0" }, Gaussin kopula redusoituu täsmälleen riippumattomaan mo (tulos <c1/>)

seg-d0d834e377ee = MODELLED kerrostetun PNT:n konfliktinkestävyys (P7): kiistellyssä ympäristössä toimiva käyttäjä käyttää useita PNT-kerroksia (avoimen palvelun GNSS, laajakaista-GNSS, autentikoitu tähdistö, täydennysrele), joilla kullakin on perusasaatavuus, tarkkuus (1σ) ja vektorikohtainen estoalttius yhteiselle häirintä-/harhautusuhalle. (tyyppiluettelo (<c1/>))

seg-3ca12700b54c = Keskeinen kestävyyssuhde (yksikerroksisen ja kerrostetun kokonaismenetyksen todennäköisyys) asettuu noin ~7x RIIPPUMATTOMUUSoletuksella; yksitekijäinen Gaussin kopulan korreloitu estopyyhkäisy osoittaa sitten, että tämä ~7x romahtaa kohti arvoa { "1" }, kun eston korrelaatio kasvaa (korrelaatio kumoaa kerrostamisen). (tyyppiluettelo (<c1/>))

seg-70e4fdff099f = MODELLED: kerroskohtaiset alttius-/saatavuus-/tarkkuusmagnitudit ovat lähteistettyjä mutta mallinnettuja syötteitä (JammerTest { "2024" }, TEXBAT, EASA SIB, RTCA DO-229, LunaNet/IOAG — ks. conflict_threat_params), ja tietty ~7x suuruus sekä suhde–korrelaatio-käyrän muoto seuraavat tästä parametrisoinnista. (tyyppiluettelo (<c1/>))

seg-33541cca61b6 = Kiistellyssä ympäristössä toimiva käyttäjä käyttää neljää RF-PNT-kerrosta, jotka kaikki kulkevat samalla kaistalla ja jakavat siksi häirintä-/harhautusestovektorin — hauras, korreloitunut tapaus. Skenaario raportoi: * kokonaismenetyksen todennäköisyyden uhan voimakkuuden funktiona (Monte Carlo suhteessa suljetun muodon riippumattomaan tuloon, johon se suppenee), * ~7x kerrostetun ja yksikerroksisen kestävyyssuhteen riippumattomuusoletuksella, * miten tämä ~7x romahtaa (skenaariotiedoston kommentti, rivit { "3" }–{ "15" })

seg-83badfe4784d = Jokainen kerroskohtainen suuruus on MODELLED-syöte, jolla on alkuperä; katso src/conflict_threat_params.rs lähteistetyille [min, nominal, max] -prioreille ja vektorikohtaisille alttiusprofiileille (JammerTest { "2024" }, TEXBAT, EASA SIB 2022-02, RTCA DO-229, LunaNet/IOAG). Kun <c1/> jätetään pois, ajetaan sama lähteistetty nelikerroksinen lähtötaso; se on kirjoitettu tähän auki — myös kunkin kerroksen vector_profile — läpinäkyvyyden vuoksi. (skenaariotiedoston kommentti, rivit { "17" }–{ "22" })

seg-bb182ed41520 = PNT-kestävyyskehykseen kohdistettu pisteytys on MODELLED, ei validoitu: se on tarkistettu sen omaa suljetun muodon / analyyttistä identiteettiä vasten — se havaitsee kirjoitus- ja kerroinvirheet, mutta ei ole ulkoinen oraakkeli. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-6a42653a8a0f = <s1>Edellinen</s1>combined-altpnt

seg-2bd3e9d1505c = <s1>Seuraava</s1>constellation-design
