# docs--kind-lunar-frame-realisation: translations (fi)

seg-98151954f217 = false

seg-1f17ef6a853e = Moottorin v{ $version } skenaariolaji, perhe <a1>Kuu ja kuunläheinen avaruus</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva nimike on moottorin tai varmennusmatriisin; laji on MODELLED, ellei matriisi toisin sano (miten nimike ansaitaan: README:n Evidence-osio).

seg-1c1eeb2dcaa0 = Perhesivu: <a1>Kuu ja kuunläheinen avaruus</a1>

seg-619127334cf3 = Yksikään matriisin rivi ei nimeä tätä tyyppiä nimellä; sen tuloksen merkintä on moottorin oma, yllä.

seg-49f323360dc3 = <b>VALIDATED</b> 7-parametrinen Helmert-datumin sovitus + ICRF-orientaatiositominen pisteverkosta. Oraakkeli (ExternalDataset): Riippumaton suljetun muodon painotettu Umeyama (Horn) -similariteettimuunnosratkaisija (numpy/scipy SVD-pohjainen; Umeyama { "1991" } IEEE TPAMI, Horn { "1987" } JOSA A) — eri algoritmi kuin kshanan iteratiivinen Gauss–Newton-sovitus, joka saavuttaa saman yksikäsitteisesti määritellyn painotetun pienimmän neliösumman optimin tavutarkasti identtisillä pisteverkoilla

seg-0225ace73ba8 = Lähde: <c1/>

seg-a092c5795651 = <c1/> (skenaariotyyppi)

seg-0c4c119abfca = Mallinnettu Kuun koordinaatiston realisaatio: 7-parametrinen Helmert-datumin (similariteetti) sovitus — { "3" } translaatiota, { "3" } pienen kulman rotaatiota, { "1" } skaala — joka sitoo estimoidun selenografisista johdettujen MCMF-pistekoordinaattien joukon datumiin painotetulla pienimmän neliösumman menetelmällä (crate::batch_ls::gauss_newton), sekä yksinkertaisen orientaatiositomisen, joka ilmaisee realisoidun pienen rotaation ICRF-akselien ympäri suhteessa IAU { "2015" } WGCCRE -kappaleen orientaatioon. Skenaario lisää tunnetun pienen muunnoksen (translaatio ~kymmeniä m, rotaatio ~µrad, skaala ~{ "1e-7" }) hyvin hajautettuun synteettiseen pisteverkkoon, lisää siemenluvulla alustettua Gaussin kohinaa, palauttaa datumin ja raportoi palautetun muunnoksen, parametrikohtaisen palautusvirheen suhteessa lisättyyn totuuteen sekä sovituksen jälkeisen RMS-jäännöksen. MODELLED itsejohdonmukaisuus — palauttaa lisätyn similariteettimuunnoksen (kohinaton konetarkkuuteen asti), EI realisaatio oikeaa seuranta-/VLBI-dataa vastaan; deterministinen (siemenluku); ei TRL:ää/lentoperintöä/virastosuositusta.

seg-32d5e2749e64 = Yksi tiedoston <c1/> ajo tiivistyy seuraavasti: lunar-frame-realisation | { "8" } pistettä | translaatiovirhe { "3.125e-1" } m, rotaatiovirhe { "3.418e-7" } rad, skaalavirhe -5.891e2 ppb | rms-jäännös { "0.887" } m | konvergoitui false

seg-e732d2c2ab91 = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>

seg-29f85024974b = Esimerkki <c1/> asettaa muun muassa seuraavat:

seg-49baab4910f3 = ppb

seg-a7d59ba6e225 = rad

seg-f3a6d69d0225 = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/lunar-frame-realisation.toml, tyyppi lunar-frame-realisation

seg-f99a78efa965 = MODELLED itsejohdonmukaisuus — palauttaa lisätyn similariteettimuunnoksen (kohinaton konetarkkuuteen asti), EI realisaatio oikeaa seuranta-/VLBI-dataa vastaan; deterministinen (siemenluku); ei TRL:ää/lentoperintöä/virastosuositusta. (tyyppiluettelo (<c1/>))

seg-238cea087ae0 = Rehellisyys: MODELLED itsejohdonmukaisuus. Oraakkeli on lisätyn 7-parametrisen similariteettimuunnoksen palautus (kohinaton konetarkkuuteen asti) sekä apply_helmert-funktion algebrallinen edestakaisen kierron identiteetti. Tämä EI ole Kuun koordinaatiston realisaatio oikeaa seuranta- / VLBI-dataa vastaan, eikä se väitä mitään absoluuttista koordinaatiston tarkkuutta. Deterministinen (siemenluku). Ei väitetä TRL:ää, lentoperintöä eikä virastosuositusta. (skenaariotiedoston kommentti, rivit { "23" }–{ "27" })

seg-07550d3d9610 = <s1>Edellinen</s1>lunar-frame-campaign

seg-5a3a7120aae2 = <s1>Seuraava</s1>lunar-infrastructure
