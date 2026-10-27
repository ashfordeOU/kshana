# docs--kind-quantum-trade: translations (fi)

seg-debc2f07db78 = true

seg-98151954f217 = false

seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" }: <a1>varmennusmatriisin</a1> rivit, jotka nimeävät tämän tyypin.

seg-7b2721b7588d = Moottorin v{ $version } skenaariotyyppi, perhe <a1>Inertia-, fuusio- ja kvanttianturit</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva merkintä on moottorin tai varmennusmatriisin oma; tyyppi on MODELLED, ellei matriisi toisin sano (miten merkintä ansaitaan: README-tiedoston osio Evidence).

seg-f7f12029e0ec = Perhesivu: <a1>Inertia-, fuusio- ja kvanttianturit</a1>

seg-496b17a8d3b9 = Aihesivu: <a1>QUANTUM-MODELS.md</a1>

seg-bb07c8ee153f = <b>PARTNER</b> Ei tarjota — vain suorituskykymalleja; kylmäatomi-/kellolaitteisto on kumppanin. Oraakkeli (NoneKind): ei mitään: kumppanin omistama ala, tarkoituksella ilman moduulia ja testiä

seg-51cac2f918e0 = Aihesivu: <a1>POSITIONING.md</a1>

seg-3a8c76a2396f = Lähde: <c1/>

seg-f9af2813532e = <c1/> (skenaariotyyppi)

seg-eb55d253dd11 = Kvantti-vs.-klassinen PNT-kauppa ({ "13503" }): ehdokaskellon ajoitus-holdover- ja inertia-holdover-hyöty (mitattu ADEV-käyrä — puolustettavuuden ratkaiseva tekijä — tai kvanttikelloluokka) vs. klassinen lähtötasoluokka, pitkän tau:n lattiaoletuksen varauma mukana artefaktissa, sekä GNSS-estetty kestävyys–aika-verhokäyrä. MODELLED; kvantifioi (ei koskaan validoi) kumppanin laitetta. Ehdokaskello on mitattu käyrä (<c1/> + <c2/>, yhtä pitkät, vähintään { "2" } pistettä; se voittaa, kun molemmat muodot on annettu) tai <c3/>.

seg-4f470bc1d82c = Skenaarion <c1/> yksi ajo tiivistyy seuraavasti: quantum-trade | ehdokas measured-ADEV | ajoitus-holdover 2621947s vs. 203s (12943.62x) | inertia 14108s vs. 378s (37.34x) | kestävyys, vapaaliike 14108s | MODELLED [lattia oletettu -varauma]

seg-2639560aeff2 = Pakolliset kentät: <c1/>, <c2/>, <c3/>, <c4/>

seg-d66f1ef84201 = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>

seg-f2cc0830b53f = Esimerkki <c1/> asettaa muun muassa:

seg-ee5bcbbe0167 = csac

seg-a6551a61cf69 = klassinen lähtötaso

seg-f5fa445702c6 = Tuloksen nimike (moottorin oma): MODELLED — kvantifioi (ei koskaan validoi) kumppanin kelloa/anturia; ei osoitettu lennolla

seg-c74c63ffd859 = Moottorin kirjoittama kaavio skenaariolle scenarios/quantum-trade.toml, tyyppi quantum-trade

seg-93310aaa6ead = <b>VALIDATED</b> Potenssilain (valkoinen FM + punaisen kohinan lattia) NNLS-palautus julkaistusta mitatusta ⁸⁸Sr-optisen kellosiirtymän Allanin poikkeamasta — toistaa σ_y(τ):n ja otsikkoluvun 4.7e-16/√τ lyhyen τ:n skaalauksen aidolla mitatulla pitkän τ:n lattialla, sen sijaan että Testit: <a1>optical_clock_adev_reference.rs</a1>.

seg-fc46e95688ba = <b>VALIDATED</b> Mitattu ADEV NNLS-sovitus, NEES/NIS χ²-johdonmukaisuuskaistat ja kellon van Loan -diskreetti prosessikohinan (holdover-vapaaliikkeen) kovarianssi — kauppamoottorin laskennallinen selkäranka Testit: <a1>scipy_reference.rs</a1>.

seg-6e2b62136cef = <b>MODELLED</b> Mitatun ADEV:n sisäänotto (NNLS), kauppataulukko (ajoitus-/inertia-holdover + hyöty), kestävyys–aika-verhokäyrä; lattiavarauma mukana artefaktissa.

seg-b577b8464cf7 = <b>VALIDATED</b> Mitattu ADEV NNLS-sovitus, NEES/NIS χ²-johdonmukaisuuskaistat ja kellon van Loan -diskreetti prosessikohinan (holdover-vapaaliikkeen) kovarianssi — kauppamoottorin laskennallinen. Oraakkeli (ExternalDataset): scipy { "1.17.1" } — optimize.nnls / stats.chi2.ppf / linalg.expm; NNLS+Q täsmälleen, χ² <{ "5e-4" } toimintapisteen vapausasteilla. Vain ytimet — laitteen suorituskykyluvut pysyvät mallinnettuina (seuraava rivi)

seg-6b8aa8cd6d3e = <b>MODELLED</b> Mitatun ADEV:n sisäänotto (NNLS), kauppataulukko (ajoitus-/inertia-holdover + hyöty), kestävyys–aika-verhokäyrä; lattiavarauma mukana artefaktissa. Ajettavissa. Oraakkeli (ExternalDataset): Mitattu ADEV→PSD-sovituksen (NNLS) ydin täsmää funktioon scipy.optimize.nnls (tests/scipy_reference.rs / tests/quantum_vs_classical_pnt_trade_reference.rs) — riippumaton ulkoinen ydin; mutta kauppaluvut kvantifioivat (eivät koskaan validoi) kumppanin kelloa/CAI:ta, joten itse kauppa pysyy tasolla MODELLED, ei validointisädekehää

seg-3d678f64e41c = MODELLED — kvantifioi (ei koskaan validoi) kumppanin kelloa/anturia; ei osoitettu lennolla (tulos <c1/>)

seg-20ba66ae9518 = Kvantti-vs.-klassinen PNT-kauppa ({ "13503" }): ehdokaskellon ajoitus-holdover- ja inertia-holdover-hyöty (mitattu ADEV-käyrä — puolustettavuuden ratkaiseva tekijä — tai kvanttikelloluokka) vs. klassinen lähtötasoluokka, pitkän tau:n lattiaoletuksen varauma mukana artefaktissa, sekä GNSS-estetty kestävyys–aika-verhokäyrä. (tyyppiluettelo (<c1/>))

seg-45a1d84eef18 = MODELLED; kvantifioi (ei koskaan validoi) kumppanin laitetta. (tyyppiluettelo (<c1/>))

seg-15275d27252a = Laskee EHDOKASKELLON ajoitus-holdover- ja inertia-holdover-hyödyn KLASSISEEN lähtötasoon nähden sekä GNSS-estetyn kestävyys–aika-verhokäyrän. Ehdokkaan lattiaa ohjaa kumppanin kellon MEASURED limittäinen ADEV-käyrä (puolustettavuuden ratkaiseva tekijä), sovitettuna ei-negatiivisella pienimmän neliösumman menetelmällä — joten holdover-budjetti nojaa todelliseen dataan eikä oletettuun pitkän tau:n lattiaan. (skenaariotiedoston kommentti, rivit { "3" } - { "7" })

seg-ecbdbc9b163e = RAJAUS TOTUUDENMUKAISESTI: MODELLED — se KVANTIFIOI kumppanin kvanttikellon hyödyn; se EI validoi laitetta eikä koskaan lainaa SGP4/Allan/IGS-validointisaarekkeita. Kun minkä tahansa rivin lattia on oletettu luokkaoletus, lattiavarauma näkyy artefaktissa. Ajo: kshana scenarios/quantum-trade.toml (skenaariotiedoston kommentti, rivit { "9" } - { "12" })

seg-4b59ac409819 = Kvantti-vs.-klassinen PNT-kauppa ja GNSS-estetty kestävyys ({ "13503" }) on MODELLED, ei validoitu: osaväite tarkistetaan ulkoisesti, mutta koko ominaisuus yhdistää mallinnettuja osia, joten ominaisuus pysyy mallinnettuna. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-e6498fae3ba7 = <s1>Edellinen</s1>quantum-time-transfer

seg-50d4bbb7486b = <s1>Seuraava</s1>realtime-frame-eop
