# docs--kind-aocs: translations (fi)

seg-99ef7c1d552c = Moottorin v{ $version } skenaariolaji, perhe <a1>Tehtäväanalyysi, linkit ja avaruusoperaatiot</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva nimike on moottorin tai varmennusmatriisin; laji on MODELLED, ellei matriisi toisin sano (miten nimike ansaitaan: README:n Evidence-osio).

seg-8f1e7d3f5a07 = Perhesivu: <a1>Tehtäväanalyysi, linkit ja avaruusoperaatiot</a1>

seg-5cd8b3d8c098 = Lähde: <c1/>

seg-7f2ade997df5 = <c1/> (skenaariolaji)

seg-7eff466eb018 = Avaruusaluksen asennonhallinta: jäykän rungon inertiaalisuuntainen käännös kolmella tai useammalla tasapainotetulla reaktiopyörällä MRP-takaisinkytkennällä (L = -K sigma - P omega), miniminormin pyörämomentit rajattuna kunkin moottorin rajaan, RK4 nollannen kertaluvun pidolla; valinnaisesti suljettuna multiplikatiiviseen EKF:ään simuloidusta gyrosta (kulma- ja nopeussatunnaiskävely) ja tähtikamerasta. Raportoi asettumisajan, lopullisen ja huippuosoitusvirheen, pyörän huippunopeuden ja -momentin, kyllästyneen osuuden, liikemäärämomentin ajautuman ja estimaattorin kanssa sen asentovirheen ja NEES:n. Todellisen tilan silmukka on VALIDATED vertailussa Basilisk { "2.9.1" }; estimaattori on MODELLED.

seg-a499721d08b1 = Yksi ajo tiedostosta <c1/> tiivistyy näin: aocs: { "4" } pyörää, { "600" } s:n käännös { "82.06" } deg -> asettuu alle { "0.1" } deg:n ajassa { "481.0" } s | lopullinen { "2.37e-2" } deg | pyörän huippu { "1797" } rpm | todellisen tilan silmukka

seg-2ad4d3f07a6a = Pakolliset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

seg-ed0c5c6266d9 = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-a09eb69b36d7 = Esimerkki <c1/> asettaa muun muassa:

seg-8b51cfcf5bd5 = N m

seg-6876b0214e4c = N m s

seg-8e4dea0df19e = kg m^{ "2" }

seg-51362910dcb7 = { "2" } mukana toimitettua skenaariota käyttää tätä lajia; muut ovat kohteessa <a1><c1/></a1>.

seg-b054c73f22e5 = ei arvoa

seg-6e22c97374b0 = Tulosnimike (moottorin oma): VALIDATED ohjauslaki ja pyöräympäristön dynamiikka (vertailu: Basilisk { "2.9.1" } todellisen tilan silmukassa); tämän ajon syötteet ovat skenaarion omat — reaktiopyöräasennonhallinta MRP-takaisinkytkennällä, inertiaalinen suuntaus, ei anturikohinaa, ei kitkaa

seg-08c624d5324d = Moottorin kirjoittama kaavio skenaariolle scenarios/aocs-slew.toml, laji aocs

seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" }: <a1>varmennusmatriisin</a1> rivit, jotka nimeävät tämän lajin.

seg-d69a588facf1 = <b>VALIDATED</b> Jäykän rungon inertiaalisuuntainen asennonhallinta kolmella tai useammalla tasapainotetulla reaktiopyörällä: MRP-takaisinkytkentälaki L_r = -K sigma_BR - P omega_BR (Schaub ja Junkins), miniminormin pyörämoottorin momentit G_s u = -L_r rajattuna kunkin pyörän l Testit: <a1>aocs_basilisk_oracle.rs</a1>.

seg-7bc495b05d9a = <b>MODELLED</b> Lefferts–Markley–Shuster-multiplikatiivinen EKF: runkokoordinaatiston asentovirhe- ja gyroharhatilat, propagointi gyron nopeudella vähennettynä harhaestimaatilla ja Farrenkopfin diskreetillä prosessikohinalla (kulma- ja nopeussatunnaiskävely), tähtikameran päivitys

seg-7e3e0dcc936f = <b>VALIDATED</b> Jäykän rungon inertiaalisuuntainen asennonhallinta kolmella tai useammalla tasapainotetulla reaktiopyörällä: MRP-takaisinkytkentälaki L_r = -K sigma_BR - P omega_BR (Schaub ja J. Oraakkeli (ExternalDataset): Basilisk { "2.9.1" } (AVSLab, ISC; bsk-pyöräajo erillisenä työkaluna, ei koskaan linkitettynä tai sisällytettynä): avaruusaluksen runko, reactionWheelStateEffector (BalancedWheels, momenttiraja päällä), simpleNav, inertial3D, attTrackingError, mrpFeedback (ei integraalitermiä) ja rwMotorTorque, dt = { "0.1" } s ja sen RK4, verrattuna Kshanan omaan toteutukseen kolmessa tapauksessa (kolme ortogonaalista pyörää; nelipyöräinen pyramidi; kyllästävä nelipyöräinen tapaus),

seg-d7889856073b = <b>MODELLED</b> Lefferts–Markley–Shuster-multiplikatiivinen EKF: runkokoordinaatiston asentovirhe- ja gyroharhatilat, propagointi gyron nopeudella vähennettynä harhaestimaatilla ja Farre. Oraakkeli (InternalConsistency): Sisäinen johdonmukaisuus: suodattimen normalisoitu estimointivirheen neliö verrattuna samoista anturimalleista simuloituun totuuteen Monte Carlo -siemenluvuilla sekä asento- ja harhaestimaattien suppeneminen. MITÄ EI: ulkoista estimaattoria tai lentodataa ei ole verrattu (Basiliskissa { "2.9.1" } ei ole MEKF-moduulia); anturimallit ovat oppikirjamalleja ilman virhesuuntausta, mittakerrointa tai tähtikameran näkökentän vaikutuksia.

seg-3b71575e0c23 = Todellisen tilan silmukka on VALIDATED vertailussa Basilisk { "2.9.1" }; estimaattori on MODELLED. (lajiluettelo (<c1/>))

seg-c7ff0ddbd040 = Multiplikatiivinen EKF-asentoestimointi gyrosta ja tähtikamerasta on MODELLED, ei validoitu: tarkistettu omaa suljetun muodon / analyyttistä identiteettiään vastaan — havaitsee kirjoitus- ja kerroinvirheet, mutta ei ole ulkoinen oraakkeli. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-cc4e7274d409 = Aihesivu: <a1>AOCS.md</a1>

seg-b022bad77259 = <s1>Edellinen</s1>acm-link

seg-1fb6e680fd4a = <s1>Seuraava</s1>aperture-duty-cycle
