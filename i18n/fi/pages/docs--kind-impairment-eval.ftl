# docs--kind-impairment-eval: translations (fi)

seg-98151954f217 = false

seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" }: <a1>varmennusmatriisin</a1> rivit, jotka nimeävät tämän tyypin.

seg-2e6b437f3e99 = Lähde: <c1/>

seg-134407946837 = <c1/> (skenaariotyyppi)

seg-304496607bd7 = Moottorin v{ $version } skenaariotyyppi, perhe <a1>Häirintä (jamming), harhautus (spoofing) ja spektri</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva merkintä on moottorin tai varmennusmatriisin oma; tyyppi on MODELLED, ellei matriisi toisin sano (miten merkintä ansaitaan: README-tiedoston osio Evidence).

seg-98e740d32860 = Koneoppimiseen perustuvan RF-häiriöiden havaitsemisen arviointitestialusta ({ "13494" }): generoi merkitty, parametriperusteinen SYNTEETTINEN korpus (nominal/jamming/spoof-time/spoof-position/multipath), pisteytä ilmaisin (energy|agc|sqm|parity|fused) ilmaisimesta riippumattomalla arviointikehyksellä ja raportoi AUC/ROC/sekaannusmatriisi + luokkakohtainen Pd tavoite-Pfa:lla sekä jakaumansisäisen ja jakaumanulkoisen optimismiaukon. Vain MODELLED toimintaominaisuudet — ei koskaan kenttä-/IQ-dataa, ei hyvä/huono-päätöstä.

seg-41c3f9559282 = Yksi ajo tiedostolla <c1/> tiivistyy seuraavasti: impairment-eval | detector fused(max-z) | AUC { "0.998" } in / { "0.981" } out (gap { "0.017" }) | Pd { "0.99" } Pfa { "0.05" } @ target { "0.05" } | { "1000" } cases | MODELLED synthetic

seg-9b0d7ebaa1f0 = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-283510d17885 = Esimerkki <c1/> asettaa muun muassa seuraavat:

seg-6a64be3b3f07 = fused

seg-3db71c5bdd0a = auc_out käyttää hienovaraisempaa viritysalueen ulkopuolista reg

seg-667d26b3a2fe = Tulosmerkintä (moottorin oma): MODELLED — synteettinen parametriperusteinen korpus (ei koskaan kenttä-/IQ-dataa); vain toimintaominaisuudet, ei hyvä/huono-päätöstä

seg-7e7b07bc5545 = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/impairment-eval.toml, skenaariotyyppi impairment-eval

seg-798a7e5526a0 = <b>VALIDATED</b> AUC (Mann-Whitney, tasatilanteet ½), sekaannusmatriisi kynnyksellä, P_d/P_md/P_fa/täsmällisyys (precision)/tarkkuus (accuracy)/F1 Testit: <a1>eval_metrics_reference.rs</a1>.

seg-ceedc14c623a = <b>VALIDATED</b> ROC AUC + bootstrap-luottamusväli, joka erottaa todelliset merkityt poikkeamat; läpinäkyvä ilmaisin (toistaa merkinnät) Testit: <a1>opssat_ad_reference.rs</a1>.

seg-0ee5b31cfd09 = <b>MODELLED</b> Merkitty synteettinen häiriökorpus + ilmaisimesta riippumaton ROC/AUC/sekaannusmatriisi/Pfa-Pmd-arviointikehys; vuotosuoja, ositettu jako, jakaumasiirtymän (alueen sisäinen vs. ulkopuolinen) optimismiraportti.

seg-392fa6495840 = <b>VALIDATED</b> AUC (Mann-Whitney, tasatilanteet ½), sekaannusmatriisi kynnyksellä, P_d/P_md/P_fa/täsmällisyys/tarkkuus/F1. Oraakkeli (ExternalDataset): scikit-learn { "1.9.0" } (Pedregosa ym., JMLR { "2011" }) — riippumaton kirjasto, täsmälleen sama tulos

seg-c719d4060e1a = <b>MODELLED</b> Merkitty synteettinen häiriökorpus + ilmaisimesta riippumaton ROC/AUC/sekaannusmatriisi/Pfa-Pmd-arviointikehys; vuotosuoja, ositettu jako, jakaumasiirtymän (alueen sisäinen vs. ulkopuolinen) optimismiraportti. Oraakkeli (InternalConsistency): Suljetun muodon AUC-rajat (Mann–Whitney) + täydellinen oraakkeli-ilmaisin; korpus on SYNTEETTINEN (parametriperusteinen, ei kenttä-/IQ-dataa)

seg-5565108cc4d1 = MODELLED — synteettinen parametriperusteinen korpus (ei koskaan kenttä-/IQ-dataa); vain toimintaominaisuudet, ei hyvä/huono-päätöstä (tulos <c1/>)

seg-d2a9f35ea8cc = MODELLED vain toimintaominaisuudet — ei koskaan kenttä-/IQ-dataa, ei hyvä/huono-päätöstä. (tyyppiluettelo (<c1/>))

seg-376f86fbdcb7 = RAJAUS, REHELLISESTI: vain MODELLED toimintaominaisuudet. Korpus on synteettinen ja parametriperusteinen (koostettu Kshana-ohjelman jamming/AGC/SQM/parity-malleista) — ei koskaan kenttäkaappauksia tai raaka-IQ:ta. Arviointikehys on erotuomari; se raportoi ominaisuuksia, se ei anna hyvä/huono-päätöstä. Aja: kshana scenarios/impairment-eval.toml (skenaariotiedoston kommentti, rivit { "9" }–{ "12" })

seg-882d67b9474f = Koneoppimiseen perustuva RF-häiriöiden havaitsemisen arviointi ({ "13494" }) on MODELLED, ei validoitu: se on tarkistettu sen omaa suljetun muodon / analyyttistä identiteettiä vasten — se havaitsee kirjoitus- ja kerroinvirheet, mutta ei ole ulkoinen oraakkeli. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-5d23d7f8f872 = Perhesivu: <a1>Häirintä (jamming), harhautus (spoofing) ja spektri</a1>

seg-6cf4bb2d7f7a = Aihesivu: <a1>BENCH.md</a1>

seg-dde90de4270b = <s1>Edellinen</s1>hybrid

seg-1e68310f2dc6 = <s1>Seuraava</s1>inertial
