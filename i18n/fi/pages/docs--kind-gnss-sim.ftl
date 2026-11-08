# docs--kind-gnss-sim: translations (fi)

seg-37d29d8303fe = km

seg-51362910dcb7 = { "2" } mukana toimitettua skenaariota käyttää tätä lajia; muut ovat kohteessa <a1><c1/></a1>.

seg-8e845ce908ee = Moottorin v{ $version } skenaariolaji, perhe <a1>GNSS-mittaukset, paikannus ja eheys</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva nimike on moottorin tai varmennusmatriisin; laji on MODELLED, ellei matriisi toisin sano (miten nimike ansaitaan: README:n Evidence-osio).

seg-3068552e4ab4 = VALIDATED: <a1>varmennusmatriisin</a1> rivit, jotka nimeävät tämän lajin.

seg-f6b7ca020692 = Perhesivu: <a1>GNSS-mittaukset, paikannus ja eheys</a1>

seg-d5f4762f8455 = Lähde: <c1/>

seg-b634bbba2197 = <c1/> (skenaariotyyppi)

seg-2ffccc9c1eff = Mittausalueen pseudoetäisyyssimulaatio (Klobuchar-ionosfääri, Saastamoinen/Niell-troposfääri) + RAIM.

seg-db93cbad6c6d = Yksi ajo tiedostolla <c1/> tiivistyy seuraavasti: scenario ab854d9d7886 | gnss-sim | mean iono 19.9m tropo 6.8m | RAIM avail { "0.82" } mean HPL 22.2m VPL 39.9m fault-rate { "0.000" }

seg-55ee4fdf9240 = Pakolliset kentät: <c1/>, <c2/>, <c3/>, <c4/>

seg-ee0d38971d08 = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>

seg-c7b57e696bc3 = Esimerkki <c1/> asettaa muun muassa seuraavat:

seg-1abddf8ecdc5 = [{ "3.8200e-8" }, { "1.4900e-8" }, -1.7900e-7, { "0" }]

seg-47ee40d4eb73 = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/gnss-sim-raim.toml, skenaariotyyppi gnss-sim

seg-ccc44a4ac68e = <b>VALIDATED</b> Klobuchar-yksitaajuinen L1-vinoionosfäärinen ryhmäviive kahdeksasta lähetetystä α/β-kertoimesta Testit: <a1>klobuchar_reference.rs</a1>.

seg-aec7fc2a4070 = <b>VALIDATED</b> ARAIM-monihypoteesinen ratkaisuerotus ARAIM Airborne Design Documentin (ADD) v4.2 mukaan (araim_reference::add_v42_protection_levels ja add_v42_protecti. Oraakkeli (ExternalDataset): Kolme riippumatonta työkalua, ennakkorekisteröity (0123cee1) ennen kuin mitään fixturea tai oraakkelin tulostetta oli olemassa, toleranssit kiinnitetty silloin. ({ "1" }) ARAIM: Stanford MAAST for ARAIM { "2" } (commit ab70e2a3, BSD-3) mhss_raim_baseline_v5.m, ajettu erillisenä ohjelmana ympäristössä GNU Octave { "8.4" } ajurin puoleisella unique()-yhteensopivuuskerroksella (ilmoitettu, ei algoritmimuutosta), ADD:n TOL_PL-arvolla { "0.05" } m: Rust toistaa ADD-viitetoteutuksen on

seg-277205e56d73 = <b>VALIDATED</b> GDOP/PDOP/HDOP/VDOP/TDOP näkölinjageometriasta Q=(HᵀH)⁻¹ paikallisella ENU-jaolla. Oraakkeli (ExternalDataset): gnss_lib_py { "1.0.4" } (Stanford NAV Lab) DOP — riippumaton kirjasto, täsmäytetty { "1e-6" } suhteelliseen tarkkuuteen

seg-752829346523 = <b>VALIDATED</b> Klobuchar-yksitaajuinen L1-vinoionosfäärinen ryhmäviive kahdeksasta lähetetystä α/β-kertoimesta. Oraakkeli (ExternalDataset): RTKLIB ionmodel (tomojitakasu/RTKLIB, src/rtkcmn.c) — lähteestä käännetty riippumaton viitetoteutus; täsmäytetty tarkkuuteen < { "1e-4" } m

seg-78ff7db5ad3d = <b>VALIDATED</b> Jakaumaydin, jonka varassa jokainen suojaustaso on: hetkellinen vikailmaisukynnys χ²₁₋ₚfₐ(dof), havaitsematta jäämisen epäkeskisyysparametri pbias=√λ ja . Oraakkeli (ExternalDataset): SciPy { "1.17.0" } (scipy.stats.chi2/.norm/.ncx2 + optimize.brentq) — riippumaton kirjasto (Cephes/Boost), eri algoritmi kuin Kshana-ohjelman epätäydellisen gammafunktion sarja; täsmäytetty ≤{ "1e-6" } suht. Vain ydin. ARAIM MHSS P_HMI -budjetin <em>allokaatiolla</em> ei ole enää ilman julkaistua numeerista oraakkelia — WG-C ARAIM Technical Subgroupin oma työstetty esimerkki tukee nyt erillistä riviä 'ARAIM MHSS protection levels against published referen

seg-cc7018560c2c = Aihesivu: <a1>REAL_TLE_GUIDE.md</a1>

seg-53a78e98af12 = Aihesivu: <a1>SKYLINE.md</a1>

seg-659e6288ad72 = <s1>Edellinen</s1>gnss-ins

seg-7d677a362edd = <s1>Seuraava</s1>gnss-ssv
