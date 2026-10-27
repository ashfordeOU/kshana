# docs--kind-lunar-time-offset: translations (fi)

seg-1f17ef6a853e = Moottorin v{ $version } skenaariolaji, perhe <a1>Kuu ja kuunläheinen avaruus</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva nimike on moottorin tai varmennusmatriisin; laji on MODELLED, ellei matriisi toisin sano (miten nimike ansaitaan: README:n Evidence-osio).

seg-1c1eeb2dcaa0 = Perhesivu: <a1>Kuu ja kuunläheinen avaruus</a1>

seg-619127334cf3 = Yksikään matriisin rivi ei nimeä tätä tyyppiä nimellä; sen tuloksen merkintä on moottorin oma, yllä.

seg-4d208b6c0eb8 = day

seg-64813e3da228 = Lähde: <c1/>

seg-000bb13909f1 = <c1/> (skenaariotyyppi)

seg-7f3e13712f10 = Mallinnettu relativistinen Maa–Kuu-kellonopeus (Lunar Coordinate Time, LTC/TCL): maallinen LTC−TT-nopeus itsepotentiaalin erosta ja kuun kineettisestä termistä, raportoituna julkaistun { "56" }–{ "59" } µs/vrk vaihteluvälin kanssa, sekä kertynyt poikkeama horisontin yli.

seg-9efcf3e1be04 = Skenaarion <c1/> yksi ajo tiivistyy seuraavasti: lunar-time-offset | maallinen LTC−TT-nopeus { "57.04" } µs/vrk (vaihteluväli { "56" }–{ "59" }) | itsepotentiaali { "57.50" } kineettinen -0.46 | poikkeama @ { "1.00" } vrk = { "57.04" } µs

seg-9367773c4889 = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>

seg-4731141e6aac = Esimerkki <c1/> asettaa muun muassa:

seg-3843825d0733 = us

seg-e9deb6ed41c1 = Moottorin kirjoittama kaavio skenaariolle scenarios/lunar-time-offset.toml, tyyppi lunar-time-offset

seg-982426693747 = <b>VALIDATED</b> Relativistinen Maa–Kuu-kellonopeus (LTC/TCL) + TT/TAI/UTC-ketjutus + ensemble. Oraakkeli (ExternalDataset): Ashby & Patla { "2024" }, 'A Relativistic Framework to Estimate Clock Rates on the Moon', Astronomical Journal { "167" }:{ "149" } (NIST; IAU/IAG LunaNet LTC:n perusta): Kuun pinnan itsepotentiaali L_m = { "3.13881e-11" } ja maallinen kokonaisuus { "56.02" } µs/vrk täsmäävät julkaistuihin lukuarvoihin; geosentrinen Kuun nopeus ristiintarkistettu JPL DE440:tä vasten (de440s.bsp SPICEn kautta)

seg-96b65f604cc2 = Rehellisyys: MODELLED, ei sertifioitu. Otsikkoluku us/vrk riippuu vertailusta (Maan geoidi W0 vs. kuun selenoidi, keskiarvoistusikkuna, laiminlyödyt alle us/vrk:n keskipakoiskorjaukset ja J2-korjaukset) -> rehellinen tuloste on vaihteluväli, ei yksittäinen luku. Mitään tässä ei ole validoitu alle nanosekunnin absoluuttiseen tarkkuuteen eikä sertifioitu operatiiviseen ajanpitoon. Raportti antaa myös kertyneen LTC-TT-poikkeaman hori (skenaariotiedoston kommentti, rivit { "11" } - { "16" })

seg-e4552368a6a7 = <s1>Edellinen</s1>lunar-time-budget

seg-777dc23bac6a = <s1>Seuraava</s1>lunar-vlbi-fim
