# docs--kind-lunar-differential-pnt: translations (et)

# text
seg-9feefecdcf67 = rafs

# text
seg-f42465f7d066 = ns

# text
seg-37d29d8303fe = km

# text
seg-1f17ef6a853e = Mootori v{ $version } stsenaariumi liik, perekond <a1>Kuu ja tsislunaarne ruum</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-1c1eeb2dcaa0 = Perekonna leht: <a1>Kuu ja tsislunaarne ruum</a1>

# text
seg-619127334cf3 = Ükski maatriksirida ei nimeta seda liiki nimepidi; selle tulemuse silt on mootori enda, ülal.

# text
seg-549a6103e711 = bitt

# text
# c1: docs/kinds/by-kind/lunar-differential-pnt.md
seg-d0c9bec248b4 = Allikas: <c1/>

# text
# c1: lunar-differential-pnt
seg-d226df2bb634 = <c1/> (stsenaariumi liik)

# text
seg-8ac5ac006ae7 = Modelleeritud Kuu DIFERENTSIAAL-PNT (Kuu DGNSS/SBAS analoog): NovaMoon-klassi etaloonijaam TEADAOLEVAS selenograafilises asukohas arvutab satelliidipõhised diferentsiaalparandused ILLUSTRATIVE, avaliku allikaga Moonlight/LCNS-klassi konstellatsioonist (NovaMooni viidatakse ainult süsteemi KLASSINA, ESA-ga sidumata), ja kasutaja, kes on nihkes baseline_km võrra, rakendab neid nii, et ÜHISREŽIIMI orbiidi + kella vead tühistuvad. Kellaliige tühistub TÄPSELT (algebraline samasus); orbiidiliige jätab alles ainult vaatejoonte erinevuse projektsiooni, mis → { "0" }, kui baseline → { "0" } (ruumilise dekorrelatsiooni põhi) ja kasvab ≈ lineaarselt baseline-iga. Esitab kasutaja 3-D asukohavea parandustega VS ILMA parandusteta, vähenemise teguri, vea ja baseline-i kõvera ning kasutaja kaitsetaseme, mis KASUTAB UUESTI DO-229E SBAS masinavärki (crate::sbas) diferentsiaaljäägi σ-ga. MODELLED — täpse tühistumise samasus + esimest järku dekorrelatsiooni mudel; ei ole päris andmetega valideeritud; ei ole TRL/pärandi/agentuuri heakskiitu. Deterministlik, kui algväärtus (seed) on antud.

# text
# c1: scenarios/lunar-differential-pnt.toml
seg-4b7355b174a3 = Ühe <c1/> käivituse kokkuvõte: lunar-differential-pnt | { "8" } sat (illustratiivne LCNS-klass, sidumata) | baseline { "50" } km | kasutaja viga { "24.46" } m → { "0.0077" } m ({ "3186" }× vähenemine) | HPL { "23.1" } m (σ_resid { "5.0" } m) | MODELLED

# text
# c1: n_sats
# c2: sma_km
# c3: eccentricity
# c4: inc_deg
# c5: argp_deg
# c6: ref_lat_deg
# c7: ref_lon_deg
# c8: baseline_km
# c9: orbit_err_m
# c10: clock_err_m
# c11: noise_m
# c12: seed
# c13: t_s
# c14: residual_sigma_m
# c15: p_hmi
# c16: survey_sigma_m
# c17: latency_s
# c18: quantization_bits
seg-1115464be513 = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>

# text
# c1: scenarios/lunar-differential-pnt.toml
seg-3f32e0fea066 = Näide <c1/> määrab muu hulgas:

# attr:alt
seg-8e67df89448a = Mootori joonistatud diagramm failile scenarios/lunar-differential-pnt.toml, liik lunar-differential-pnt

# text
seg-6f4246bd8f6f = <b>MODELLED</b> NovaMoon-klassi diferentsiaaletaloonijaam: ühisrežiimi tühistamine + baseline-iga kasvav jääk + DGNSS kaitsetasemed. Sõltumatu etalon (InternalConsistency): Diferentsiaalvea tühistamise samasus + DO-229E SBAS PL masinavärgi taaskasutus; üksikdiferents + WLS lahendus on lisaks ristkontrollitud RTKLIB lsq()/matinv() vastu (Takasu, BSD-2-Clause, kompileeritud C) — sõltumatu lahendajakood, kuid sama esimest järku LOS-erinevuse algebra, seega siiski InternalConsistency

# text
seg-8d02b1426187 = <b>MODELLED</b> Kolm liiget, mille diferentsiaalparandus omandab epohhi vahel, mil see arvutatakse, ja epohhi, mil seda kasutatakse, igaüks varem jäetud modelleerimata varuks:. Sõltumatu etalon (InternalConsistency): Suletud kujuga samasused ja sisemine kooskõla: ühtlase kvantori step²/12 dispersioon, täpne (GᵀG)⁻¹GᵀRG(GᵀG)⁻¹ kovariatsiooni levitamine, mis võrdse σ korral taandub kujule σ·PDOP, mõõdistusliikme { "1" }:{ "1" } ülekanne kui û_user ≈ û_ref tagajärg ja väljalülituse kvadratuuri sulgumine. PDOP ristkontroll orbit::dop vastu jagab normaalmaatriksit [−û, { "1" }], seega on see kooskõlakontroll ja on nii märgitud, mitte kui sõltumatu

# text
# c1: kshana kinds --json
seg-f1e7283d2e15 = MODELLED — täpne tühistumise samasus + esimest järku dekorrelatsiooni mudel; ei ole päris andmetega valideeritud; ei ole TRL/pärandi/agentuuri heakskiitu. (liikide kataloog (<c1/>))

# text
seg-9d54d8c07ca3 = AUSTUS: MODELLED. Ühisrežiimi tühistamine on TÄPNE algebraline samasus; ruumilise dekorrelatsiooni jääk on ESIMEST JÄRKU geomeetriline mudel (süstitud orbiidivea LOS-erinevuse projektsioon), mitte päris Kuu jälgimisest sobitatud dekorrelatsioonimudel. Kasutaja kaitsetase KASUTAB UUESTI DO-229E SBAS kaitsetaseme masinavärki (crate::sbas) diferentsiaaljäägi sigmaga kui satelliidipõhise erro (stsenaariumifaili kommentaar, read { "23" } kuni { "28" })

# text
# c1: correction_link
seg-4156a7515574 = ── PARANDUSLINK ────────────────────────────────────────────────────────────────────── Ülaltoodud samasus eeldab TÄIUSLIKKU parandust: arvutatud jaama poolt, mis teab täpselt, kus see asub, edastatud koheselt, lõpmatu eraldusvõimega. Ükski kolmest ei kehti ja allpool olevad kolm sisendit modelleerivad, mida kumbki maksab. Need toidavad AINULT tulemusdokumendi plokki <c1/> -- kõik kolm väärtustel, mis on kirjutatud h (stsenaariumifaili kommentaar, read { "57" } kuni { "62" })

# text
seg-e7f016777e09 = MÕÕDISTUSVIGA. Jaam moodustab oma parandi koordinaadi suhtes, mida see USUB. Viga seal sõidab kaasa igale selle edastatavale paranduse ja jõuab kasutajani kujul -delta . u_ref -- mis ei sisalda üldse kasutaja geomeetriat, seega erinevalt orbiidiliikmest see ei kao nullbaseline-il ega kasva baseline-iga ning kandub peaaegu üks-ühele kasutaja asukohta. Vaikimisi { "0.30" } m on selle crate enda Kuu etalon (stsenaariumifaili kommentaar, read { "64" } kuni { "70" })

# text
seg-e0648d9b52b4 = PARANDUSE VANANEMINE. Ajahetkel t arvutatud ja ajahetkel t+tau rakendatud parandus on aegunud kahel viisil. Orbiit: satelliit on LIIKUNUD, nii et külmutatud orbiidivea vektor projitseerub nüüd pööratud vaatejoonele; pööre tuleb selle crate enda levitajast, seega ei eeldata kusagil orbiidivea kiirust. Kell: satelliidi kell on triivinud c*sigma_y(tau)*tau võrra täieliku RAFS astmeseaduse järgi failis crate::clock_specs, kalibreeritud (stsenaariumifaili kommentaar, read { "73" } kuni { "79" })

# text
seg-7171b2e3f29d = Kuu diferentsiaal-PNT on MODELLED, mitte valideeritud: kontrollitud omaenda suletud kujul / analüütilise samasuse vastu — tabab ülekande- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-35f1876d023e = Kuu diferentsiaal-PNT — paranduslingi jäägi eelarve on MODELLED, mitte valideeritud: kontrollitud omaenda suletud kujul / analüütilise samasuse vastu — tabab ülekande- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-8f8871ac8a0f = Teemaleht: <a1>LUNAR-REFERENCE-STATION.md</a1>

# text
seg-2b8455001710 = <s1>Eelmine</s1>lunar-beacon

# text
seg-dca7482d9d75 = <s1>Järgmine</s1>lunar-frame-campaign
