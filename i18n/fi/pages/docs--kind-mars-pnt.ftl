# docs--kind-mars-pnt: translations (fi)

seg-debc2f07db78 = true

seg-11e8c29ecb45 = Moottorin v{ $version } skenaariolaji, perhe <a1>Satelliittitähdistöt, kattavuus ja geometria</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva nimike on moottorin tai varmennusmatriisin; laji on MODELLED, ellei matriisi toisin sano (miten nimike ansaitaan: README:n Evidence-osio).

seg-45259ad33a01 = <b>MODELLED</b> Laji <c1/>: kiertäjä tai pintalaskeutuja nimellä valitun kappaleen ympärillä navigoi yhdensuuntaisilla pseudoetäisyyksillä Walker-navigointisatelliittitähdistöstä kappaleen ympärillä (kaksikappaleradat kappaleen J2-sekulaariajautumalla, tuntematon käyttäjän k

seg-a4f1e7d2041e = Perhesivu: <a1>Satelliittitähdistöt, kattavuus ja geometria</a1>

seg-670191cf797f = Aihesivu: <a1>SOLAR-SYSTEM.md</a1>

seg-3ea0aa9b3907 = <b>MODELLED</b> 3-tilainen (vaihe/taajuus/ajautuma) van Loan -Kalman-kello, Joseph-stabiloitu. Oraakkeli (ReferenceImpl): filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), jossa F on laskettu scipy.linalg.expm-funktiolla ja Q Van Loanin { "1978" } lohkomatriisilla — riippumaton viitetoteutus, joka toistaa koko Kshana-suodattimen liikeradan. Toteutusten välinen johdonmukaisuus: kellofysiikkaa / Allan-kalibrointia ei ole validoitu ulkoisesti, joten tämä jää tasolle MODELLED. { "0.30" } ulkoinen vertailu, havainto (jää tasolle MODELLED): IGS final { "30" } s -kelloilla, joita on { "11" } GPS Blo

seg-8de95b3a9229 = Onboard-kellon tilan estimointi on MODELLED, ei validoitu: se on tarkistettu erillistä toteutusta vasten samassa koodikannassa — riippumaton testattavasta yksiköstä, mutta ei ulkoisesti auktoritatiivinen. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-3bc1761c76ab = { "3" } mukana toimitettua skenaariota käyttää tätä tyyppiä; muut ovat kohdassa <a1><c1/></a1>.

seg-c68502b9d675 = Lähde: <c1/>

seg-46072326d616 = <c1/> (skenaariotyyppi)

seg-3f749aef8d89 = Syväavaruuden Mars-PNT: simuloitu MARCONI-releiden tähdistö (areostationaariset + kallistetut releet, jotka lähettävät yksisuuntaisesti + välittävät kaksisuuntaisesti syväavaruuden asemalle) navigoi viitekäyttäjän (transfer | lmo | surface) yhteisen yksi-/kaksisuuntaisen radiometrisen fuusioestimaattorin kautta. Raportoi epookkikohtaisen geometrian ja näkyvyyden, saavutetun RMS:n todellista tilaa vastaan sekä muodollisen kovarianssin (1σ / 3σ paikka) — rehellinen simuloitu laatumittari, EI sertifioitu suojaustaso.

seg-0254f9bd0ee6 = Skenaarion <c1/> yksi ajo tiivistyy seuraavasti: mars-pnt 5aad87fcc94a | lmo-käyttäjä, uso-kello | { "5" } relettä (keskimäärin { "3.1" } näkyvissä) | suppenneen paikan RMS { "0.25" } m, muodollinen 1σ { "0.31" } m (3σ { "0.93" } m — kovarianssin laatumittari, ei sertifioitu PL) | kellotaajuus σ { "3.71e-13" } | cov-PD true

seg-8eb513e7aeea = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

seg-5a9640a3f9b4 = Esimerkki <c1/> asettaa muun muassa:

seg-8e0fecea19fc = uso

seg-a16f2332397c = lmo

seg-c564dca90854 = Moottorin kirjoittama kaavio skenaariolle scenarios/mars-pnt-lmo.toml, tyyppi mars-pnt

seg-83c3a84f6b98 = <b>VALIDATED</b> Epookkitilan [r,v] palautus maa-aseman etäisyyksistä Gauss–Newton-eräkorjaimella ja sekventiaalisella suodattimella kahden kappaleen + J2 -voimamallin yli. Oraakkeli (ExternalDataset): Orekit { "12.2" } (CS GROUP, Apache-2.0) BatchLSEstimator (Levenberg–Marquardt) + KalmanEstimator (EKF) — riippumaton kolmannen osapuolen estimointikirjasto vastaavalla voimamallilla; palautettu epookkitila + jälkisovituksen residuaalin RMS täsmäävät tarkkuuteen <{ "1e-3" } m kohinattomana ja <{ "3" } m { "5" } m:n kohinalattialla

seg-4be479b81f39 = <s1>Edellinen</s1>lunar-vlbi

seg-2854e6a75833 = <s1>Seuraava</s1>moonlight-service-volume

seg-6d595f01ffcc = <s1>Seuraava</s1>mission-thread
