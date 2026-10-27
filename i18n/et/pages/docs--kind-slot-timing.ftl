# docs--kind-slot-timing: translations (et)

# text
seg-f42465f7d066 = ns

# text
seg-37d29d8303fe = km

# text
seg-cb91473bfdda = Teemaleht: <a1>LEO-PNT.md</a1>

# text
seg-c61e88721556 = Mootori v{ $version } stsenaariumi liik, perekond <a1>Kellad, ajastus ja holdover</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-849c08d3ce70 = Perekonna leht: <a1>Kellad, ajastus ja holdover</a1>

# text
# c1: docs/kinds/by-kind/slot-timing.md
seg-09644e40e2d8 = Allikas: <c1/>

# text
# c1: slot-timing
seg-ec92d03eaa6c = <c1/> (stsenaariumi liik)

# text
seg-1b61962464c5 = Pesa ajastus: sekundid, kuni vabalt töötav kell väljub ajaindekseeritud marsruutimis- või ülesandepesa kaitsevahemikust (suurim absoluutne ajaviga, mida pesa talub), iga liikme panus sel hetkel koos domineeriva liikme nimetamisega (määrangu määramatus, valge faasimüra, valge, flicker-, juhuslikku kõnni ja juhusliku jooksu sagedusmüra, jääksageduse nihe, temperatuur, vananemine), viimasest määrangust järelejäänud aeg ning suurim määrangute intervall, mis hoiab kella sees, määrangu latentsuse võrra vähendatult. Ostsillaator on KLASSI vaikeväärtus (csac, uso, dsac, tcxo, ocxo või rafs: üks viidatud ühesekundiline Alani hälve ja eeldatud punase müra põhjatase), telekommunikatsiooni ajastuse ANDMELEHE EELSEADE või sisseehitatud ANDMELEHT (Alani hälbe maksimumid sobitatud ümbrikuna, pluss vananemine ja temperatuurikoefitsient) või sisseehitatud MEASURED PHASE RECORD (selle kattuv Alani hälve sobitatud kaalutud vähimruutudega valge faasi ja IEEE Std { "1139" } sagedusmodulatsiooni baasis, nii et punase müra põhjatase on mõõdetud, mitte eeldatud). Rikkumine pikema keskmistamisajaga, kui andmeleht või kirje toetab, märgitakse ekstrapoleeritud. Valikuline spuufimise jaotis lisab orbiidil oleva vastuvõtja ajastuse kaitsetaseme: orbitaalkiirus ja -periood, kui kaua üks maapealne spuufer suudab satelliidini ühe läbimise jooksul ulatuda, kellaga toetatud monitori põhjatase ja CUSUM-i tuvastuslatentsus, tingimuslik piir, tõmme, mille spuufer kindlaksmääratud maksimaalse tõusukiirusega kogub, enne kui satelliit lahkub tema ulatusest või sõltumatu kontroll käivitub, ning kas iga maakontakti- või ristlingi kontroll on sellest spuuferist sõltumatu. VALIDATED: holdover-i pöördarvutus sobitatud kirjest, hoitud tagasi päris tseesiumikellal, mõõdetud vesinikmaseri vastu (tests/slot_timing_cs5071a_holdout.rs, andmetega piiratud); mõõdetud kristallostsillaatoril on tagasihoitud ennustus konservatiivne, kuid ei mahu läve sisse, seega on kristallijuhtum MODELLED. MODELLED: klassi- ja andmelehe allikad, deterministlikud liikmed ja spuufimise hinnang.

# text
# c1: scenarios/slot-timing-ocxo-leo.toml
seg-1284cfee51f0 = Ühe <c1/> käivituse kokkuvõte: slot-timing (andmelehe allikas): kaitsevahemik { "100.0" } ns juures k={ "3" } rikub { "650.8" } s pärast määrangut ({ "50.8" } s jäänud); määrang vähemalt iga { "645.8" } s tagant ({ "133.80" } päevas); domineeriv liige: juhusliku kõnni sagedusmüra

# text
# c1: oscillator
# c2: slot
seg-97e12e763be3 = Kohustuslikud väljad: <c1/>, <c2/>

# text
# c1: spoofing
seg-6b75ef50497a = Valikulised väljad: <c1/>

# text
# c1: scenarios/slot-timing-ocxo-leo.toml
seg-8c4662736bc0 = Näide <c1/> määrab muu hulgas:

# text
seg-8aee75a55007 = ocxo

# text
seg-df4ca2d859ff = 1/s^{ "3" }

# text
seg-1a282dc35742 = andmeleht

# text
seg-c13396b4e57b = Tulemuse silt (mootori oma): MODELLED — aeg, kuni vabalt töötav kell väljub marsruutimispesa kaitsevahemikust, ja määrangute sagedus, mis hoiab selle sees, statsionaarsest astmeseadusega kellamudelist. Andmelehe allikas on selle maksimumide ümbrik, mitte ühegi üksuse mõõtmine; klassi allikas põhineb eeldatud punase müra põhjatasemel.

# attr:alt
seg-97a91c8a60cd = Diagramm, mille mootor kirjutab failile scenarios/slot-timing-ocxo-leo.toml, liik slot-timing

# text
seg-8461cb5b7863 = MODELLED { "2" } · VALIDATED { "1" }: <a1>kontrollimaatriksi</a1> read, mis nimetavad seda liiki.

# text
# c1: slot-timing
seg-e84e4b49fee0 = <b>VALIDATED</b> Liigi <c1/> mõõdetud kirje rada: faasikirje kattuv Alani hälve sobitatud edf-kaalutud mittenegatiivsete vähimruutudega valge faasi ja IEEE Std { "1139" } sagedusmodulatsiooni baasis (slot_timing::fit_weighted), Testid: <a1>slot_timing_cs5071a_holdout.rs</a1>.

# text
# c1: slot-timing
seg-26ccdbd07a46 = <b>MODELLED</b> Liik <c1/>: ennustatud viga E(t) = k·√(σ₀² + σ_x²(t)) + (|y₀| + |c_T·ΔT|)·t + ½|D|t² pööratud rikkumise, järelejäänud aja, uuestisünkroniseerimise intervalli määrangu latentsuse võrra vähendatult ja määrangute päevase arvu jaoks, iga liige eraldi esitatud koos Testid: <a1>slot_timing_igs_holdout.rs</a1>.

# text
# c1: slot-timing
seg-35ac4dddc39f = <b>MODELLED</b> orbital_timing::orbital_timing, kättesaadav liigi <c1/> spuufimise jaotisena: ringorbiidi kiirus ja periood, pikim aeg, mille jooksul maapealne spuufer satelliidini ühe läbimise jooksul ulatub, kellaga toetatud monitori põhjatase ja CUSUM-i tuvastus l

# text
# c1: slot-timing
seg-8dbc28c3398f = <b>MODELLED</b> Liik <c1/>: ennustatud viga E(t) = k·√(σ₀² + σ_x²(t)) + (|y₀| + |c_T·ΔT|)·t + ½|D|t² pööratud rikkumise, järelejäänud aja, uuestisünkroniseerimise. Oraakel (sisemine kooskõla; InternalConsistency): iga liikme kinnised kujud eraldi ja sõltumatu holdover::holdover_seconds juureleidmine; andmelehe arvud on nimetatud dokumendid (docs/SLOT-TIMING.md). Klassi vaikeväärtus põhineb eeldatud punase müra põhjatasemel ja andmelehe allikas on maksimumide ümbrik, seega pole ükski neist ühegi üksuse mõõtmine

# text
# c1: slot-timing
seg-fabde8dddf68 = <b>MODELLED</b> orbital_timing::orbital_timing, kättesaadav liigi <c1/> spuufimise jaotisena: ringorbiidi kiirus ja periood, pikim aeg, mille jooksul maapealne spuufer suudab satelliidini ulatuda ühe läbimise jooksul, kellaga toetatud monitori põhjatase ja CUSUM-i tuvastus l. Oraakel (sisemine kooskõla; InternalConsistency): taandamine olemasolevale ajastuse kaitsetasemele ning ringorbiidi ja kerakujulise Maa nähtavuse kinnistele kujudele. Tingimuslik tuvastamisest, üks maapealne spuufer kindlaksmääratud tõusukiirusega, läbimine otse pea kohal mittepöörleval Maal; spuufitud vastuvõtjal orbiidil ei ole valideeritud

# text
# c1: not_modelled[0]
seg-29af1ec87672 = sageduse hüpped, kiirgusefektid ja relativistlikud sageduse nihked (tulemus <c1/>)

# text
# c1: not_modelled[1]
seg-89f90cdab1db = termomudel: temperatuurikõrvalekallet rakendatakse astmena määrangu hetkel (tulemus <c1/>)

# text
# c1: not_modelled[2]
seg-cb3887ccae22 = sünkroniseerimisprotokoll ise: määrang lähtestab vea väärtusele fix_sigma_ns (tulemus <c1/>)

# text
# c1: not_modelled[3]
seg-b96fceda31df = millise hälbemõõdiku vastu peaks marsruutimispesa vastu võtma; vt docs/SLOT-TIMING.md (tulemus <c1/>)

# text
# c1: label
seg-b101457241f2 = MODELLED — aeg, kuni vabalt töötav kell väljub marsruutimispesa kaitsevahemikust, ja määrangute sagedus, mis hoiab selle sees, statsionaarsest astmeseadusega kellamudelist. Andmelehe allikas on selle maksimumide ümbrik, mitte ühegi üksuse mõõtmine; klassi allikas põhineb eeldatud punase müra põhjatasemel. (tulemus <c1/>)

# text
# c1: kshana kinds --json
seg-8e3d910f22ed = Ostsillaator on KLASSI vaikeväärtus (csac, uso, dsac, tcxo, ocxo või rafs: üks viidatud ühesekundiline Alani hälve ja eeldatud punase müra põhjatase), telekommunikatsiooni ajastuse ANDMELEHE EELSEADE või sisseehitatud ANDMELEHT (Alani hälbe maksimumid sobitatud ümbrikuna, pluss vananemine ja temperatuurikoefitsient) või sisseehitatud MEASURED PHASE RECORD (selle kattuv Alani hälve sobitatud kaalutud vähimruutudega valge faasi ja IEEE S (liikide kataloog (<c1/>))

# text
# c1: kshana kinds --json
seg-f6a831727890 = VALIDATED: holdover-i pöördarvutus sobitatud kirjest, hoitud tagasi päris tseesiumikellal, mõõdetud vesinikmaseri vastu (tests/slot_timing_cs5071a_holdout.rs, andmetega piiratud); mõõdetud kristallostsillaatoril on tagasihoitud ennustus konservatiivne, kuid ei mahu läve sisse, seega on kristallijuhtum MODELLED. (liikide kataloog (<c1/>))

# text
# c1: kshana kinds --json
seg-1cf85cbedffa = MODELLED: klassi- ja andmelehe allikad, deterministlikud liikmed ja spuufimise hinnang. (liikide kataloog (<c1/>))

# text
seg-1a72034c1343 = Teemaleht: <a1>DECEIVED-TIME.md</a1>

# text
seg-10e6cd8ce00c = <s1>Eelmine</s1>reentry

# text
seg-b8ec9e10ee84 = <s1>Järgmine</s1>solar-system
