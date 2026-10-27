# docs--kind-leo-pnt-chain: translations (fi)

seg-f42465f7d066 = ns

seg-7f5ad6ab8c23 = GPS

seg-cd04f5662884 = MODELLED. (lajiluettelo (<c1/>))

seg-cb91473bfdda = Aihesivu: <a1>LEO-PNT.md</a1>

seg-3bc1761c76ab = { "3" } mukana toimitettua skenaariota käyttää tätä tyyppiä; muut ovat kohdassa <a1><c1/></a1>.

seg-49964654d5f4 = Moottorin v{ $version } skenaariotyyppi, perhe <a1>Matalan Maan kiertoradan navigointi</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva nimike on moottorin tai varmennusmatriisin; tyyppi on MODELLED, ellei matriisi toisin sano (miten nimike ansaitaan: README:n Evidence-osio).

seg-c5478f572d21 = Perhesivu: <a1>Matalan Maan kiertoradan navigointi</a1>

seg-771484572fa7 = <b>VALIDATED</b> ITU-R P.618-14 section { "2.4.1" } vaiheet { "3" } – { "9" } (vertailusigma N_wet-arvosta, tehollinen polun pituus, antennin keskiarvoistuskerroin, häipymäsyvyys ajalle { "0.01" } % – { "50" } % ajasta. Oraakkeli (ExternalDataset): ITU-R Study Group { "3" } -validointiesimerkit (CG-3M3J-13-ValEx-Rev8.3.0) P.618-14-tuikelle, kunkin paikan P.453-14 N_wet samoista esimerkeistä; tallennettuina tiedostoon tests/fixtures/leo_link/p618_14_scintillation.csv URL-osoitteineen ja noutopäivineen. Tämä rivi ei kata lämpötilasta ja kosteudesta johdettua märkärefraktiivisuuden lauseketta

seg-ab58ab4e7dc6 = <b>VALIDATED</b> Ryhmäviive { "40.3" } STEC/f^{ "2" } kaistaa kohden; ionosfääristä vapaat kertoimet f1^2/(f1^{ "2" } - f2^{ "2" }) ja -f2^2/(f1^{ "2" } - f2^{ "2" }) ja kohinan vahvistus sqrt(a1^{ "2" } s1^{ "2" } + a2^. Oraakkeli (ExternalDataset): IS-GPS-200 section { "20.3.3.3.3.2" }, joka ilmoittaa L1/L2-ryhmäviiveen suhteen gamma = (77/60)^{ "2" }, joka seuraa ensimmäisen kertaluvun 1/f^{ "2" } -skaalauksesta, sekä Friisin lähetyskaava (Proc. IRE, { "1946" }). Validoi skaalauslait, ei vinoa TEC:tä

seg-ae15d15bf151 = Aihesivu: <a1>LEO-PASS.md</a1>

seg-d24f2cccc926 = Lähde: <c1/>

seg-3a66efa79aa2 = <c1/> (skenaariotyyppi)

seg-81d1604171a5 = Yksi LEO-PNT-järjestelmä (paikannus, navigointi ja ajanmääritys matalalta Maan kiertoradalta) päästä päähän, mille tahansa tähdistölle ja signaalille: signal_design-kentän nimeämä leo-signal-suunnitelma (julkinen esiasetus tai sisäinen [signal]-suunnitelma) asettaa [pass]-kaistan keskitaajuuden, kaistanleveyden, sirunopeuden ja EIRP-jaon, leo-pass-linkkibudjetti antaa seuratun C/N0:n ja kaistarajoitetun koodijitterin ohituksen yli, C/N0-suora sin(korkeuskulma):n funktiona ja [navmsg]-viestin lähetetty SISRE (sovitettuna ohituksen satelliitin korkeudelle) syöttävät jokaisen [fusion] leo-pvt -yhteisratkaisun LEO-järjestelmän ja valinnaisesti [ppp] leo-ppp -tapaukset; jokainen luovutus listataan arvoineen ja yksikköineen. MODELLED.

seg-9dec9cd6fbfc = Yksi tiedoston <c1/> ajo tiivistyy seuraavasti: LEO-PNT päästä päähän, yleinen { "1080" } km tähdistö signaali generic-l (<a1>https://www.itu.int/pub/R-REG-RR</a1>), seurattu pilotti nopeudella { "10.230" } Mchip/s, C/N0-siirtymä -2.57 dB ohitus LEO-1 { "1080" } km: seurattu C/N0 huippu { "58.2" } dB-Hz, koodijitterin mediaani { "0.050" } m; C/N0-suora { "35.6" } + { "24.3" } sin(el) dB-Hz viesti kepler-rac { "300" } s sovitus / { "300" } s päivitys: esitys-SISRE { "0.907" } mm RMS (rata { "0.005" } mm), radanmäärityksellä { "0.250" } m: { "0.250" } m luovutettu eteenpäin yhdistetty ratkaisu: vain GNSS PDOP { "1.47" } RMS 3D { "1.60" } m -> GNSS + LEO PDOP { "1.06" } RMS 3D { "0.43" } m PPP-konvergenssi: vain GNSS { "11.5" } min, { "240" } LEO { "7.5" } min { "11" } arvoa luovutettu vaiheiden välillä. MODELLED.

seg-21babf07292a = Pakolliset kentät: <c1/>, <c2/>, <c3/>

seg-f7bd59312f9b = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-585a1b0d5950 = Esimerkki <c1/> asettaa muun muassa seuraavat:

seg-be21370c2446 = joint

seg-f9c560b3c318 = Galileo

seg-28b34c8ae7c5 = galileo

seg-0093705edf63 = Tuloksen nimike (moottorin oma): MODELLED — ketju luovuttaa kunkin vaiheen tuloksen seuraavalle; vaiheet säilyttävät omat nimikkeensä (varmennusmatriisin leo-signal-, leo-pass-, leo-navmsg-, leo-pvt- ja leo-ppp-rivit).

seg-abe0599498c9 = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/leo-pnt-end-to-end.toml, tyyppi leo-pnt-chain

seg-d8b7c2c82566 = <b>MODELLED</b> Tyyppi <c1/>: leo-signal-suunnitelma (julkinen esiasetus tai sisäinen) asettaa leo-pass-kaistan keskitaajuuden, kaistanleveyden, sirunopeuden ja EIRP-jaon; ohitus antaa seuratun komponentin C/N0:n ja kaistarajoitetun koodijitterin epookkia kohden; pienimmän neliösumman C/ Testit: <a1>leo_pnt_chain.rs</a1>.

seg-59b976838ef1 = <b>VALIDATED</b> navsignal: sini-integraali (sine_integral), BPSK-R:n tehon osuus kaksipuolisen kaistan sisällä suljetussa muodossa (bpsk_power_in_band_closed_form), kaistarajoitettu. Oraakkeli (ExternalDataset): Ulkoisesti lukittu: { "90.3" } prosenttia pääkeilan tehosta, koherentti early-late-jitter ilmoitetussa toimintapisteessä, sini-integraalin taulukka-arvot ja BPSK:n itse-spektrierotuskerroin 2/({ "3" } R_c) nollasiirtymällä. Vain sisäisiä ristiintarkistuksia, ei ulkoista validointia: kaistarajoitetun BPSK:n Gabor-kaistanleveyden suljettu muoto ja sen asymptootti sekä siirretyn BPSK:n spektrierotuskerroin nollasta poikkeavilla siirtymillä, molemmat

seg-faf2775f3003 = <b>MODELLED</b> Tyyppi <c1/>: parametrisoidut signaalisuunnitelmat (kaista, lähetyskaistanleveys, ITU-allokaatio; hankinta-, data- ja pilottikomponentit BPSK(n)-, BOC(m,n)-, MB. Oraakkeli (InternalConsistency): Yllä olevien kahden rivin validoidut suljetut muodot, neliölaki-väärän hälytyksen identiteetti P_d(snr = { "0" }) = P_fa ja Holmesin keskimääräinen hankinta-aika sekä palautuminen spectrum-tyypin omaan SSC-ketjuun (sama Jammer::ssc-koodi). Suunnitelmat itse ovat syötteitä: esiasetukset, jotka on merkitty REPRESENTATIVE tai WORKSHOP, eivät ole julkaistuja spesifikaatioita, parannettu Feher-QPSK, code shift keying ja OFDM-spektrit approksimoidaan, ja muoto

seg-752b6d88fc9c = Paikannusvaihe mallintaa C/N0:n suorana viivana korkeuskulman sinin funktiona maskin ja zeniitin välillä; ketju sovittaa tuon suoran ohituksen seuratulle C/N0:lle, joten ohituskohtainen muoto (isoflux-tasanne, keilan reuna) supistuu kahteen lukuun. (tulos <c1/>)

seg-f609a2991c7f = Paikannusvaiheille luovutettu SISRE on navigointiviestin esitysvirhe Kshanan integroimaa tosi rataa vastaan, plus skenaarion ilmoittama od_sisre_m neliösumman neliöjuurena; viestivaihe itse ei mallinna radanmääritystä eikä ennustetta. (tulos <c1/>)

seg-f75f874cdfaa = Paikannusvaihe laskee oman viivelukitun silmukan jitterinsä eteenpäin luovutetusta C/N0:sta rajoittamattoman kaistanleveyden kaavalla; ohitus raportoi sen rinnalla varsinaisen suunnitelman kaistarajoitetun jitterin. (tulos <c1/>)

seg-174ce18ade58 = Tarkan pistepaikannuksen vaihe ottaa viestin SISRE-arvon LEO:n rata- ja kellovirheeksi; sen koodi- ja vaihekohina pysyvät vaiheen omina syötteinä. (tulos <c1/>)

seg-0aaff940eacb = Yksi satelliitti, ensimmäinen, jonka kaista kantaa suunnitelman, edustaa koko LEO-järjestelmää ohitus- ja viestivaiheissa. (tulos <c1/>)

seg-65930be43134 = MODELLED — ketju luovuttaa kunkin vaiheen tuloksen seuraavalle; vaiheet säilyttävät omat nimikkeensä (varmennusmatriisin leo-signal-, leo-pass-, leo-navmsg-, leo-pvt- ja leo-ppp-rivit). (tulos <c1/>)

seg-bf452e9ae07f = MODELLED: jokainen vaihe säilyttää oman nimikkeensä; ketju ei lisää fysiikkaa. (skenaariotiedoston kommentti, rivi { "25" })

seg-0bff72185f12 = <s1>Edellinen</s1>leo-pass

seg-851e55b87d01 = <s1>Seuraava</s1>leo-ppp
