# docs--resilience-crosswalk: translations (cs)

seg-88372b30ed79 = Limit

seg-aab745a65e76 = Modul

seg-ad856ad710eb = Stav

seg-b03d56f501c3 = Druh

seg-4dbf41c0ec3b = Funkce

seg-f472e43c1100 = Co ukazuje

seg-fa4468d4cb80 = Dostupnost

seg-fe4d868448ef = Zdroj: <c1/>

seg-d745715d5332 = Mapování rámců odolnosti PNT

seg-aa1c24d63df5 = <b>Zarovnáno s, nikoli hodnoceno ani schváleno.</b> Toto mapuje simulované schopnosti Kshana na zveřejněné rámce odolnosti PNT (PNT: určování polohy, navigace a času). Je to <em>sebehodnocení odvozené ze simulace a zarovnané s</em> rámcem Resilient PNT Conformance Framework (RPCF) v2.0 od DHS/CISA (DHS: Department of Homeland Security; CISA: Cybersecurity and Infrastructure Security Agency), modelem Resist-Detect-Respond-Recover (RDRR) od RethinkPNT/Firesmitha a kritérii odolného PNT Yang Yuanxiho. <b>Není</b> to hodnocení, schválení, akreditace ani prohlášení o compliance a nenese žádnou podporu od DHS, IEEE (Institute of Electrical and Electronics Engineers) ani od jakéhokoli úřadu. Každý řádek je označen svým poctivým stavem ověření (<c1/> proti vnějšímu orákulu, nebo <c2/> z prvních principů s testy); samotná vrstva skórování odolnosti je <b>MODELLED</b>. Dvě její jádra nesou vlastní řádky VALIDATED ve verifikační matici, jádro inverzní Simpsonovy diverzity (<c3/>) a jádro pořadových statistik (<c4/>); to ověřuje aritmetiku, nikoli skóre, která na ní stojí.

seg-652fcf3ec12d = Skórovací engine (<c1/>) tyto schopnosti spotřebovává a vydává dílčí skóre pro jednotlivé dimenze, nikdy jediné smyšlené číslo. Strojově kontrolované invarianty stavů viz <c2/>.

seg-7a71de89a9fd = DHS RPCF v2.0: co rámec definuje a vlastní kategorie dílčího skóre Kshana

seg-1985dbfe351d = Zveřejněný rámec (Resilient PNT Conformance Framework, verze { "2.0" }, { "26" }. dubna { "2022" }, DHS Science and Technology Directorate s CISA) definuje tři <b>základní funkce</b> (oddíl { "5.2" }: Prevent, Respond, Recover), <b>úrovně odolnosti { "0" } až { "4" }</b> (oddíl { "5.3" }) a <b>osm číslovaných minimálních požadavků</b> rozložených na úrovně { "1" } až { "4" } (oddíl { "5.3" }, zopakováno v { "5.5" }), plus přístup k hodnocení (oddíl { "8" }). <b>Nedefinuje</b> seznam sedmi kategorií technik. Dřívější verze této stránky a komentáře v modulu odolnosti popisovaly sedm „kategorií technik RPCF“; slova Obfuscate a Diversify ve v2.0 nejsou. Text tohoto dokumentu byl znovu přečten 2026-10-09 a žádný takový seznam nalezen nebyl.

seg-178d1e119dce = Sedm názvů dílčího skóre, které skórovací engine vydává (Obfuscate, Limit, Verify, Isolate, Diversify, Mitigate, Recover; „OLVIDMR“ je naše pomůcka), jsou proto <b>vlastní skórovací kategorie Kshana</b>, ponechané kvůli stabilitě výstupu. Nejsou to pojmy DHS a řádky níže netvrdí, že je DHS vyžaduje. Kde kategorie odpovídá požadavku rámce, říká to poslední sloupec; kde ne, uvádí „none“.

seg-5a9eb11bb965 = Kategorie dílčího skóre Kshana

seg-e117e6f71845 = Schopnost Kshana použitá jako hnací veličina

seg-7677dafa7016 = Nejbližší odkaz v RPCF v2.0

seg-27e0f6b39605 = Obfuscate

seg-7327b9cbc106 = Deklarovaná technika × kvalita zdroje (žádná přímá behaviorální hnací veličina)

seg-b63e61fa5fa2 = žádný (preventivní technika; oddíl { "5.2" }, Prevent)

seg-7ed4f2e21189 = Deklarovaná technika × kvalita zdroje

seg-8579207ae2e5 = Verify

seg-30b8cb030965 = AUC detektoru poruch (plocha pod křivkou) ve scénáři (monitory spoofingu/jammingu/meaconingu)

seg-3d358c029f50 = úroveň { "2" } požadavek { "4" }; úroveň { "3" } požadavek { "7" }

seg-fcb8cb7d4c97 = Isolate

seg-b3cd355743da = úroveň { "3" } požadavek { "6" }

seg-ffa87d149a20 = Diversify

seg-1282685a888b = Počet nezávislých skupin → efektivní diverzita podle inverzního Simpsona

seg-f0dd4c4ef1c5 = úroveň { "4" } požadavek { "8" }; oddíl { "5.5" } (společný režim)

seg-2d91b12a9e56 = Mitigate

seg-d183b552df76 = Dostupnost při odepření

seg-c337df73e231 = oddíl { "5.2" }, Respond

seg-2da4df22d35d = Recover

seg-85d7e3292549 = Setrvání v holdoveru × brána omezeného zhoršení

seg-3aec9f076902 = úroveň { "2" } požadavek { "5" }; oddíl { "5.2" }, Recover

seg-36958650abc0 = Mapování po jednotlivých požadavcích na skutečný rámec, s tím, pro co výstupy Kshana podporují důkazy (supports evidence for) a co zbývá, je v <a1>compliance/dhs-rpcf.md</a1>.

seg-a085dd81c769 = Funkce RDRR RethinkPNT / Firesmith

seg-1b972717180b = Hnací veličina

seg-6eaf161f8871 = Resist

seg-6046a8914dc7 = Průměr dílčích skóre Obfuscate/Limit/Isolate/Diversify

seg-242e2c01ebc2 = Detect

seg-45c8da13581f = Dílčí skóre Verify (AUC detektoru)

seg-d29232baaaa6 = Respond

seg-36ab7ce187e6 = Dílčí skóre Mitigate (dostupnost)

seg-f98dc190541c = Holdover × omezená brána; klíčové ukazatele výkonnosti (KPI) časové osy odolnosti (detect/react/recover/loss)

seg-e7190928bed6 = Kritéria Yang Yuanxiho (podmnožina, k níž se vyjadřují ukazatele kvality časování a detekce)

seg-52836e247425 = Kritérium

seg-cbbe4c0baf3f = Spolehlivost

seg-32d64f865b21 = Podíl integrity filtru

seg-214372f29bd1 = Kontinuita

seg-ad5e76a596b8 = Holdover × omezená brána

seg-d92fb15e6dfa = Přesnost

seg-0de1f9119e0f = Zástupná veličina časování/kvality — <b>přesnost v poziční oblasti není součástí skóre</b>. <c1/> převede dodanou kovarianci polohy a HPL (horizontální ochranná úroveň) na CEP/SEP/2DRMS (circular error probable, spherical error probable, dvojnásobek odmocniny ze střední kvadratické vzdálenosti), ale žádný scénář ji do skóre odolnosti nevkládá

seg-0aa925a09499 = MODELLED (pouze v oblasti časování)

seg-6b661e6e4399 = Co toto mapování netvrdí

seg-51a48d0c718d = Žádná udělená úroveň RPCF. Přiřazená úroveň je <em>předběžné čtení odvozené ze simulace</em> s výslovnou bránou omezeného zhoršení, nikoli udělená vyspělost.

seg-df73b7c76ae5 = Žádná přesnost v poziční oblasti ve skóre. Dílčí skóre odolnosti jsou sestavena z metrik časování a detekce. Engine polohy jinde počítá (druhy <c1/>, <c2/> a <c3/>) a také ochranné úrovně (druh <c4/>), ale skórovací vrstva je nespotřebovává.

seg-30a1b1a4dfea = Žádná terénní validace. Referenční panel a soubor hrozeb jsou syntetická, parametricky podložená zjednodušení (<c1/>), uvedená jako přední omezení.

seg-83c465cd78b0 = Průvodní studie (<c1/>) existuje právě proto, aby ukázala, že sloučení těchto dimenzí do jednoho souhrnného skóre nebo jedné úrovně vytváří hodnocení, jehož pořadí architektur je nestabilní při obhajitelných volbách vah a hrozeb — takže toto mapování je měřicí vrstva, kterou je třeba číst po dimenzích, nikoli jediná známka, podle níž by se hodnotil produkt.

seg-32bd45dc031d = Scénáře odolnosti a vertikální scénáře, které tyto vrstvy využívají

seg-4e36adba1c55 = Přibalené scénáře níže spouštějí mechaniku hrozeb a zotavení, na kterou řádky mapování odkazují. Každý je skutečným během uvedeného druhu; každý je <b>MODELLED</b> (žádná terénní data).

seg-44664e49d449 = Scénář (<c1/>)

seg-44b8d7435bfd = Vrstvené PNT při sdílené hrozbě rušení/spoofingu: seedovaný Monte Carlo odepření vrstev, fúze přeživších s inverzním rozptylem, poměr celkové ztráty jedné vrstvy a vrstveného systému a to, jak korelované odepření tento poměr zhroutí. Jeho identity Monte Carlo vůči uzavřenému tvaru a fúze jsou kontrolovány testy v crate; druh nemá řádek verifikační matice, a proto je zde hodnocen jako MODELLED.

seg-1734506ad287 = GNSS (globální družicový navigační systém) rušen, uživatele nese vrstva PNT na nízké oběžné dráze Země (LEO), integrita zachována (tři fáze na jedné časové ose).

seg-ff8cc090bdce = Jeden rušič proti čtyřpásmovému přijímači; který monitor spoofingu vidí který spoofer.

seg-0a93502a4a19 = Rezerva poměru rušení k signálu (J/S) z přijímaného výkonu.

seg-f2230253bdff = Detekce spoofingu podle konzistence Dopplera a geometrie přeletu.

seg-d8ca900a8c14 = Časování základnových stanic a kritické infrastruktury v holdoveru, s časem z LEO.

seg-2a61d07bf177 = Uživatelé silniční, železniční, námořní, polární a internetu věcí (IoT) s vrstvou LEO.

seg-8723073167ad = Dead reckoning GNSS/INS (inerciální navigační systém) městským kaňonem a při rušení u malého bezpilotního letadla.

seg-6ee1ef707b20 = Jak dlouho INS udrží loď nebo vlak v mezích při odepřeném GNSS.

seg-7ca913e1729b = Námořní rušič; detekce spooferu, který táhne hlášenou polohu lodi.

seg-c49548e8393b = <s1>Předchozí</s1>Mapa DO-316 / DO-229E

seg-dedf3b53d31f = <s1>Další</s1>Důvěra v přijímač
