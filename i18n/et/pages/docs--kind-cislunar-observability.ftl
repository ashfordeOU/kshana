# docs--kind-cislunar-observability: translations (et)

# text
seg-1f17ef6a853e = Mootori v{ $version } stsenaariumi liik, perekond <a1>Kuu ja tsislunaarne ruum</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-6d584e86deba = suhe (dimensioonitu)

# text
seg-1c1eeb2dcaa0 = Perekonna leht: <a1>Kuu ja tsislunaarne ruum</a1>

# text
# c1: docs/kinds/by-kind/cislunar-observability.md
seg-258f128cea60 = Allikas: <c1/>

# text
# c1: cislunar-observability
seg-f0c7758e472f = <c1/> (stsenaariumi liik)

# text
seg-7ccd0a3babb8 = MODELLED tasapinnalise tsislunaarse konstellatsiooni jälgitavus (P6): jälgib nelja kosmoseaparaadi diferentsiaalselt korrigeeritud tasapinnalist DRO konstellatsiooni satelliitidevahelise vahemõõtmisega ja annab teada, kui suure osa kosmoseaparaadi neljaolekust [x,y,ẋ,ẏ] kaar jälgitavaks teeb. Väljastab ({ "1" }) astak-kaare pikkuse tabeli ühe ainult-vahemaa lingi jaoks — hetkeliselt astak 1, kasvades täieliku neljaolekuni kaare pikenedes (P6 tabel { "1" }); ({ "2" }) jälgitavuse Gramiani omaspektri + tingimusarvu üle kaare; ({ "3" }) ainult-vahemaa ja vahemaa+vahemaakiiruse hetkelise astaku võrdluse (Doppleri kujunduse hoob) pluss ainult-vahemaa-singulaarse / vahemaa+kiiruse-defineeritud GDOP-i aruandluse; ning ({ "4" }) sõltumatu SRIF-i ristvalideerimise, mille posteriori kovariatsioon muutub lõplikuks / hästi tingituks täpselt kaarel, kus jälgitav astak jõuab neljani. VALIDATED tuum: jälgitav astak on astakut paljastav singulaarväärtuse lävi, mida on risttõendatud Gramiani omaastakuga; omaspekter järgib spektraalseid invariante (jälg=Σλ, det=Πλ, Frobenius²=Σλ²); variatsiooniline STM on lõplike vahedega valideeritud CR3BP STM; vahemaa/vahemaakiiruse Jacobi read on lõplike vahedega valideeritud analüütilised osatuletised (risttõendatud paketi 3-D vahemaakiiruse vaadeldava suurusega); neli algtingimust on diferentsiaalselt korrigeeritud tasapinnalised DRO-d, mis sulguvad tiheda perioodilisuse jäägini ja on retrograadsed; astaku üleminek on ristvalideeritud paketi ruutjuur-infofiltriga (posteriori kovariatsioon lõplik täpselt täisastakul, cond(P)=cond(OᵀO)); astakupuudulik hetktõmmis märgitakse GDOP-määramata (fim condition=inf), mitte kunagi võlts lõplik väärtus — sama singulaargeomeetria kaitse, mida rakendab pvt::solve_spp. MODELLED: konstellatsiooni kujundus (DRO perilune amplituudid ja faasid) ja sellest tulenev konkreetne astaku areng. Mitte sertifitseeritud navigatsioonitulemuslikkuse toode.

# text
# c1: scenarios/cislunar-observability.toml
seg-a59f2fa9efb9 = Ühe <c1/> jooksu kokkuvõte: cislunar-observability | { "4" } s/c ({ "3" } viidet) | { "6.0" } h kaar, { "24" } epohhi | astak { "1" } → { "4" } / { "4" } üle kaare | Gramian λ [{ "2.92e-11" }…{ "5.98e-2" }] cond { "2.05e9" } | hetkeline astak ainult-vahemaa { "2" } → vahemaa+kiirus { "4" } ({ "3" } linki) | GDOP ainult-vahemaa määramata vahemaa+kiirus { "6.353" } | DRO ICs (maksimaalne perioodilisuse jääk { "4.7e-9" }) | SRIF posteriori lõplik astaku-4 epohhil { "8" } (valideeritud astak/STM/DRO-sulgumine/SRIF, modelleeritud kujundus)

# text
# c1: mu
# c2: arc_hours
# c3: epochs
# c4: steps
# c5: rel_tol
# c6: spatial
# c7: sigma_range_m
# c8: family
# c9: n_spacecraft
# c10: sigma_pos_threshold_km
seg-fb1601eda130 = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

# text
# c1: scenarios/cislunar-observability.toml
seg-f3b5cc590c78 = Näide <c1/> määrab muu hulgas:

# text
seg-0cc8ab10786b = pöörleva koordinaatsüsteemi ajaühikud

# text
seg-84781b6fff48 = GDOP määramata (astakupuudulik / singula

# text
seg-856eb311f24b = „undefined“ (tekst, nagu dokument väidab

# text
seg-1767b216650d = määratud

# text
seg-fc5d34345fdd = Tulemuse silt (mootori oma): MODELLED tasapinnalise tsislunaarse konstellatsiooni jälgitavus (P6). VALIDATED tuum: jälgitav ASTAK on astakut paljastav singulaarväärtuse lävi, mida on risttõendatud Gramiani omaastakuga; Gramiani omaspekter järgib spektraalseid invariante (jälg = omaväärtuste summa, det = omaväärtuste korrutis, Frobenius^{ "2" } = omaväärtuste ruutude summa^{ "2" }

# attr:alt
seg-f15bbf30b0dd = Diagramm, mille mootor kirjutab failile scenarios/cislunar-observability.toml, liik cislunar-observability

# text
seg-4564ad90378b = <b>MODELLED</b> Tsislunaarse kaare pikkuse jälgitavuse lävi RUUMILISES kuueoleku CR3BP-s tasapinnalise neljaoleku asemel, üle DRO, L2 halo ja L2 peaaegu sirgjoonelise halo perekondade, mõõtemüraga, mis siseneb Gramiani, ja KAHE kriteeriumiga, mis annavad aru

# text
seg-9f857ff85800 = <b>MODELLED</b> Tsislunaarse kaare pikkuse jälgitavuse lävi RUUMILISES kuueoleku CR3BP-s tasapinnalise neljaoleku asemel, üle DRO, L2 halo ja L2 peaaegu sirgjoonelise ha. Sõltumatu etalon (InternalConsistency): Sõltumatu astmelise kuju astak Gaussi elimineerimisega osalise peatelje valikuga kinnitab iga kuueoleku astakuotsuse — erinev algoritm, mis ei jaga koodi testitava omaväärtus/SVD teega. { "6" }×{ "6" } CR3BP olekuüleminekumaatriks, mida see koondab, kannab oma ReferenceImpl sõltumatut etaloni SciPy variatsioonilise integreerimise vastu ning halo/NRHO algtingimused tulevad korrektorist, mis reprodutseerib avaldatud L2 lõuna

# text
# c1: label
seg-53c183035bde = MODELLED tasapinnalise tsislunaarse konstellatsiooni jälgitavus (P6). VALIDATED tuum: jälgitav ASTAK on astakut paljastav singulaarväärtuse lävi, mida on risttõendatud Gramiani omaastakuga; Gramiani omaspekter järgib spektraalseid invariante (jälg = omaväärtuste summa, det = omaväärtuste korrutis, Frobenius^{ "2" } = omaväärtuste ruutude summa^{ "2" }); variatsiooniline STM on lõplike vahedega valideeritud CR3BP STM (crate::cr3bp); vahemaa / vahemaakiiruse Jacobi read (tulemus <c1/>)

# text
# c1: kshana kinds --json
seg-f6a217f57bec = MODELLED tasapinnalise tsislunaarse konstellatsiooni jälgitavus (P6): jälgib nelja kosmoseaparaadi diferentsiaalselt korrigeeritud tasapinnalist DRO konstellatsiooni satelliitidevahelise vahemõõtmisega ja annab teada, kui suure osa kosmoseaparaadi neljaolekust [x,y,ẋ,ẏ] kaar jälgitavaks teeb. (liikide kataloog (<c1/>))

# text
# c1: kshana kinds --json
seg-e5182743fd40 = MODELLED: konstellatsiooni kujundus (DRO perilune amplituudid ja faasid) ja sellest tulenev konkreetne astaku areng. (liikide kataloog (<c1/>))

# text
seg-5d3a370f1295 = Ausus: MODELLED. VALIDATED tuum -- jälgitav ASTAK on astakut paljastav singulaarväärtuse lävi, mida on risttõendatud Gramiani omaastakuga; omaspekter järgib spektraalseid invariante (jälg = omaväärtuste summa, det = omaväärtuste korrutis, Frobenius^{ "2" } = omaväärtuste ruutude summa^{ "2" }); variatsiooniline STM on lõplike vahedega valideeritud CR3BP STM; vahemaa / vahemaakiiruse Jacobi read on lõplike vahedega valideeritud analüütilised osatuletised (risttõendatud (stsenaariumifaili kommentaar, read { "16" } kuni { "25" })

# text
seg-c68bc1df8975 = Ruumiline, mürane, mitme perekonna tsislunaarse kaare pikkuse jälgitavus on MODELLED, mitte valideeritud: kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-ba3c2a8f0e28 = <s1>Eelmine</s1>cislunar-arc-recovery

# text
seg-3adfb78b1f34 = <s1>Järgmine</s1>clock
