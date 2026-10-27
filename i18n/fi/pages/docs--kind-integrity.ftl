# docs--kind-integrity: translations (fi)

seg-37d29d8303fe = km

seg-8e845ce908ee = Moottorin v{ $version } skenaariolaji, perhe <a1>GNSS-mittaukset, paikannus ja eheys</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva nimike on moottorin tai varmennusmatriisin; laji on MODELLED, ellei matriisi toisin sano (miten nimike ansaitaan: README:n Evidence-osio).

seg-f6b7ca020692 = Perhesivu: <a1>GNSS-mittaukset, paikannus ja eheys</a1>

seg-f4cf8b629797 = Aihesivu: <a1>INTEGRITY.md</a1>

seg-5b3dbe0aed82 = <b>MODELLED</b> Kellotyypin valinnainen [integrity]-osio (clock_integrity::run): annetusta paikasta ja tähdistöesiasetuksista (geometry::sky_geometry), jokaisella eheysepookilla, kun GNSS-aikajana ei ole estetty, hetkellinen RAIM (raim::snapshot_ Testit: <a1>clock_integrity.rs</a1>.

seg-ee7dd15019d0 = Aihesivu: <a1>CAMPAIGNS.md</a1>

seg-3bc1761c76ab = { "3" } mukana toimitettua skenaariota käyttää tätä tyyppiä; muut ovat kohdassa <a1><c1/></a1>.

seg-aec7fc2a4070 = <b>VALIDATED</b> ARAIM-monihypoteesinen ratkaisuerotus ARAIM Airborne Design Documentin (ADD) v4.2 mukaan (araim_reference::add_v42_protection_levels ja add_v42_protecti. Oraakkeli (ExternalDataset): Kolme riippumatonta työkalua, ennakkorekisteröity (0123cee1) ennen kuin mitään fixturea tai oraakkelin tulostetta oli olemassa, toleranssit kiinnitetty silloin. ({ "1" }) ARAIM: Stanford MAAST for ARAIM { "2" } (commit ab70e2a3, BSD-3) mhss_raim_baseline_v5.m, ajettu erillisenä ohjelmana ympäristössä GNU Octave { "8.4" } ajurin puoleisella unique()-yhteensopivuuskerroksella (ilmoitettu, ei algoritmimuutosta), ADD:n TOL_PL-arvolla { "0.05" } m: Rust toistaa ADD-viitetoteutuksen on

seg-277205e56d73 = <b>VALIDATED</b> GDOP/PDOP/HDOP/VDOP/TDOP näkölinjageometriasta Q=(HᵀH)⁻¹ paikallisella ENU-jaolla. Oraakkeli (ExternalDataset): gnss_lib_py { "1.0.4" } (Stanford NAV Lab) DOP — riippumaton kirjasto, täsmäytetty { "1e-6" } suhteelliseen tarkkuuteen

seg-78ff7db5ad3d = <b>VALIDATED</b> Jakaumaydin, jonka varassa jokainen suojaustaso on: hetkellinen vikailmaisukynnys χ²₁₋ₚfₐ(dof), havaitsematta jäämisen epäkeskisyysparametri pbias=√λ ja . Oraakkeli (ExternalDataset): SciPy { "1.17.0" } (scipy.stats.chi2/.norm/.ncx2 + optimize.brentq) — riippumaton kirjasto (Cephes/Boost), eri algoritmi kuin Kshana-ohjelman epätäydellisen gammafunktion sarja; täsmäytetty ≤{ "1e-6" } suht. Vain ydin. ARAIM MHSS P_HMI -budjetin <em>allokaatiolla</em> ei ole enää ilman julkaistua numeerista oraakkelia — WG-C ARAIM Technical Subgroupin oma työstetty esimerkki tukee nyt erillistä riviä 'ARAIM MHSS protection levels against published referen

seg-4bec24cd43f6 = Lähde: <c1/>

seg-dd304550e695 = <c1/> (skenaariotyyppi)

seg-eb7e0c2feb2b = Snapshot-, ratkaisuerottelu- ja ARAIM-RAIM HPL/VPL-arvoilla ja Stanford-diagrammilla.

seg-706887c285d8 = Yksi tiedoston <c1/> ajo tiivistyy seuraavasti: integrity | { "24" } satelliittia | 344/361 epookkia saatavilla ({ "95.3" }%) | HAL { "40" } m VAL { "50" } m | sigma { "1.0" } m | Stanford(V): { "0" } eheystapahtumaa, { "0" } HMI

seg-c3f7debf260a = Pakolliset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>

seg-7b28ab6567df = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-581a5231b230 = Esimerkki <c1/> asettaa muun muassa seuraavat:

seg-ce7f6130ddee = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/integrity-raim.toml, tyyppi integrity

seg-c8c38ffbb63f = MODELLED { "6" } · VALIDATED { "4" }: tämän tyypin mainitsevat <a1>varmennusmatriisin</a1> rivit.

seg-dff469738ec3 = <b>VALIDATED</b> Skalaariaikainen ratkaisuerottelu-TPL heterogeenisten lähteiden yli; suojaustasoa (PL) ohjaa huonoimman poissulkemisen osajoukon kohina + UTC(k)-harha

seg-33a94111e9d9 = <b>MODELLED</b> PL(τ)=max(TPL_handover,HPL(τ)); alhaalta puolijatkuva PL({ "0" }+)≥PL({ "0" }−); K(IR/2) juokseva maksimi; τ/τ³/τ⁵ vaihe-eksponentit

seg-4787b0b565df = <b>VALIDATED</b> Juoksevan maksimin verhokäyrä peittää ylärajana (nollaa lävistämättä) todellisen metrologisen sarjan jokaisella testatulla viiveellä tau>=90d erillisellä aineistojaksolla; lyhyt tau (<=30d) on ilmoitettu mallinnettu raja Testit: <a1>cti_holdover_coverage_reference.rs</a1>.

seg-090415eca3b7 = ja { "6" } muuta matriisissa.

seg-b4bc9ccbcee2 = <s1>Edellinen</s1>ins-trn-coast

seg-f1ba804baade = <s1>Seuraava</s1>jamming
