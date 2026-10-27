# docs--kind-araim-reference-check: translations (fi)

seg-debc2f07db78 = true

seg-c53da0bf140d = Lähde: <c1/>

seg-82884391dd77 = <c1/> (skenaariolaji)

seg-8e845ce908ee = Moottorin v{ $version } skenaariolaji, perhe <a1>GNSS-mittaukset, paikannus ja eheys</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva nimike on moottorin tai varmennusmatriisin; laji on MODELLED, ellei matriisi toisin sano (miten nimike ansaitaan: README:n Evidence-osio).

seg-06197409c717 = Julkaistut ARAIM-viitevektorit: moottorin ARAIM-vaaka- ja pystysuuntaiset suojaustasot ajettuna WG-C ARAIM Technical Subgroupin OMIA lasketuja esimerkkejä vastaan toleranssilla (TOL_PL = { "5e-2" } m), jonka nämä asiakirjat itse ilmoittavat. Kaksi vektoria on kiinnitetty testikiinnitteiksi, kukin mukanaan noutoosoite, noutopäivä, lähdetiedoston SHA-256 ja sivu: Reference Airborne Algorithm Description Document v3.1 ({ "2019" }) Appendix D — sisäisesti johdonmukainen ja hyväksymisvektori — sekä Milestone { "3" } Report ({ "2016" }) Annex A, osa A.IX, väite, johon tutkimusbibliografiat viittaavat. Jokainen julkaistu syöte (10 satelliitin 2 satelliittitähdistön geometriamatriisi, C_int- ja C_acc-varianssidiagonaalit, b_nom, P_sat, P_const ja LPV-200-vakiojoukko) ja jokainen julkaistu tulos (VPL, HPL, EMT, sigma_v_acc, K_fa_3 sekä kahden tähdistövikatilan sigma_3, sigma_ss_3 ja b_3) raportoidaan moottorin oman lukunsa vieressä ja niiden absoluuttisen eron kanssa. Suojaustasoyhtälöä EI ratkaista tässä uudelleen: viitteen tilalista annetaan moottorin olemassa oleville funktioille raim::araim_protection_level / araim_integrity_risk, joten testattavana oleva puolitus ja Gaussin hännän algebra ovat moottorin omia; vain geometria, aliratkaisut, havaitsemiskynnykset ja julkaistu budjettijako rakennetaan sitä varten. ULKOISESTI TARKISTETTU { "2019" } -vektoria vastaan: VPL { "18.2926" } m vs { "18.3" } m julkaistu, HPL { "13.4063" } m vs { "13.45" } m, EMT { "7.2997" } m vs { "7.2998" } m, sigma_v_acc { "1.3694" } m vs { "1.3694" } m, ja kaikki kuusi julkaistua välitulosta puolen yksikön tarkkuudella viimeisessä painetussa desimaalissa. Vektorissa { "2016" } on kaksi sisäistä virhettä, jotka raportti toteaa eikä piilota — etumerkkivirhe matriisin G rivillä { "3" } ja K_fa_3, joka on laskettu { "57" } vikatilalle, vaikka asiakirja ilmoittaa N_fault_max = { "1" } ({ "12" } tilaa) — joten sen geometrian välitulokset toistuvat täsmälleen, mutta sen suojaustasot raportoidaan mitattuina poikkeamina ja jätetään pois hyväksymisluvusta; toleranssia ei koskaan laajenneta niiden absorboimiseksi. Jokainen tuotettu numeerinen kenttä sisältää yksikön ja alkuperäluokan, ja jäljennetty luku nimetään <c1/>, jotta sitä ei koskaan voi sekoittaa lasketun kanssa. RAJAUS: vain N_fault_max = { "1" } (yhden satelliitin ja yhden satelliittitähdistön vikatilat) on toteutettu, ja tapaus, jonka priorit vaativat samanaikaisia monitapahtumavikajoukkoja, on REFUSED eikä sitä typistetä hiljaa; vian havaitseminen, poissulkeminen, khiin neliö -johdonmukaisuustarkistus ja viitealgoritmin kaksoislaskennan uudelleenjakovaihe ovat soveltamisalan ulkopuolella. Tämä toistaa julkaistun viitealgoritmin lasketun esimerkin — se ei ole sertifiointi, lentokelpoisuusasiakirja eikä hyväksyntä.

seg-c16de81ec8da = Yksi ajo tiedostosta <c1/> tiivistyy näin: araim-reference-check: { "2" } julkaistua WG-C-viitevektoria; huonoin VPL/HPL-yhtäpitävyys { "0.0437" } m viitteen omaa TOL_PL = { "0.05" } m vastaan { "1" } hyväksymisvektorin yli

seg-b1be6b5632c1 = Valinnaiset kentät: <c1/>

seg-3f181d41edb5 = Esimerkki <c1/> asettaa muun muassa:

seg-9de6e1b3352d = Tulosnimike (moottorin oma): ULKOISESTI TARKISTETTU — moottorin ARAIM-suojaustasot ajettuna EU–USA:n Working Group C ARAIM Technical Subgroupin ilma-aluksen viitealgoritmin julkaistuja lasketuja esimerkkejä vastaan toleranssilla (TOL_PL), jonka nämä asiakirjat itse ilmoittavat. Jokainen julkaistu luku sisältää lähteensä UR

seg-693c823c85d1 = Moottorin kirjoittama kaavio skenaariolle scenarios/araim-reference-check.toml, laji araim-reference-check

seg-3068552e4ab4 = VALIDATED: <a1>varmennusmatriisin</a1> rivit, jotka nimeävät tämän lajin.

seg-c5c966ec3c6a = <b>VALIDATED</b> Usean hypoteesin ratkaisuerotteluun perustuva suojaustasoyhtälö itsessään: kaikki näkyvissä olevat ja vikatilakohtaiset painotetut pienimmän neliösumman ratkaisut East/North/Up-geometrialla, yksi kellotila satelliittitähdistöä kohden, aliratkaisujen sigmat, ratkaisuerot Testit: <a1>araim_reference_vectors.rs</a1>.

seg-a99b9cf4c6e8 = <b>VALIDATED</b> Usean hypoteesin ratkaisuerotteluun perustuva suojaustasoyhtälö itsessään: kaikki näkyvissä olevat ja vikatilakohtaiset painotetut pienimmän neliösumman ratkaisut East/North/Up-geometrialla. Oraakkeli (ExternalDataset): EU–USA Working Group C ARAIM Technical Subgroup, Reference Airborne Algorithm Description Document v3.1 ({ "20" } kesäkuuta { "2019" }), Appendix D laskettu numeerinen esimerkki — julkaistut SYÖTTEET (10 satelliitin 2 satelliittitähdistön geometriamatriisi, C_int/C_acc-diagonaalit, b_nom, P_sat, P_const, LPV-200-vakiot) ja julkaistut TULOKSET (VPL { "18.3" } m, HPL { "13.45" } m, EMT { "7.2998" } m, σ_v_acc { "1.3694" } m, K_fa_3 { "5.1083" } ja kuusi tähdistövian välitulosta

seg-f6b7ca020692 = Perhesivu: <a1>GNSS-mittaukset, paikannus ja eheys</a1>

seg-f4cf8b629797 = Aihesivu: <a1>INTEGRITY.md</a1>

seg-e6b1f9a47b5d = Aihesivu: <a1>ARAIM_REFERENCE.md</a1>

seg-7cf434223fa5 = <s1>Edellinen</s1>aperture-duty-cycle

seg-ed2003ecf41b = <s1>Seuraava</s1>ascent-losses
