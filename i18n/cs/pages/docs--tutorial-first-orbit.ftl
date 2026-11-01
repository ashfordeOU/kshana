# docs--tutorial-first-orbit: translations (cs)

seg-51ae9468b92a = Co tento scénář je

seg-08f3fdc9252a = Přečtěte si jednořádkové shrnutí

seg-def5271a207d = Co test zafixuje

seg-e5f926d1055b = Úskalí a jednotky

seg-cb457294fc53 = Kam dál

seg-dcb2d0b170c1 = Zdroj: <c1/>

seg-f57d8b38bf08 = Tutoriál { "1" } — Moje první oběžná dráha: kde jsou družice GPS

seg-1b9e1178555d = <c1/> · <b>Scénář:</b> <c2/> (výuková kopie: <a1><c3/></a1>) · <b>Obtížnost:</b> začátečník · <b>~{ "15" } min</b>

seg-d065731294a1 = Na konci budete mít propagovanou <em>skutečnou</em> provozní konstelaci GPS, přečtete si její dostupnost a geometrii a exportujete tabulku, kde přesně každá družice ve vesmíru je — a budete vědět, že tato tabulka je ověřena proti vnější referenci, nikoli sama proti sobě.

seg-b07bb365235d = Družice GPS (Global Positioning System) říkají uživateli, <em>kde je</em> a <em>kolik je hodin</em>. Předtím je ale třeba vědět, <b>kde družice jsou</b> a <b>kolik z nich uživatel vidí</b>. To je geometrie a geometrie určuje spodní mez toho, jak přesně lze určit polohu (faktor DOP, zhoršení přesnosti). Tento tutoriál:

seg-dec5079e7715 = vezme skutečný snímek konstelace GPS <c1/> z Celestraku (2021-07-28, { "30" } družic, skutečné dvouřádkové elementy, TLE),

seg-693859c435d8 = propaguje každou družici ověřeným modelem SGP4/SDP4 (Simplified General Perturbations { "4" } / Simplified Deep-space Perturbations { "4" }),

seg-74b73260c7bc = v každém časovém kroku vypočte, které družice vidí uživatel na nízké oběžné dráze Země (přímá viditelnost, zákryt Zemí a elevační maska { "5" }°),

seg-605c40b73e96 = promění tuto geometrii v <b>PDOP</b> (faktor zhoršení přesnosti polohy) a <b>přesnost polohy</b> a

seg-356e96d219b5 = exportuje skutečné polohy družic v zemské pevné soustavě se středem v Zemi (ECEF) do souboru SP3 (Standard Product { "3" }, formát přesných drah Mezinárodní služby GNSS, IGS; GNSS je globální družicový navigační systém).

seg-ff1666fe175e = Osnova je: <b>TLE → propagace SGP4 → ECEF pro každou epochu → viditelnost → počet viditelných družic → PDOP → sigma polohy = PDOP · σ_UERE</b>, kde σ_UERE je ekvivalentní chyba měření vzdálenosti uživatele (chyba měření vzdálenosti 1-σ na družici).

seg-379da723ae57 = Nebo otevřete <a1>Studio v prohlížeči</a1> a vyberte scénář oběžné dráhy.

seg-441743833f1e = Deterministický běh (seed = { "17" }) vypíše:

seg-918a30fea48a = Pole po poli:

seg-375fad797dcf = <b><c1/></b> — 12znakový hash scénáře. Je otiskem přesných vstupů (seed, prahy, parametry modelu, blok TLE). Změníte-li jakýkoli vstup, změní se; ponecháte-li je stejné, reprodukujete běh bit po bitu. Stejný hash je vyznačen v patičce grafu a v souboru výsledku JSON (JavaScript Object Notation).

seg-133711d1ad9f = <b><c1/></b> — z { "361" } časových kroků má uživatel použitelné řešení polohy v { "345" } z nich ({ "95.6" } %). Běh je průlet { "12" } h ({ "43,200" } s) s krokem { "120" } s.

seg-a500c0473784 = <b><c1/></b> — nejlepší (nejnižší) faktor DOP polohy za celý průlet. PDOP blízko { "1" } je vynikající geometrie; čím nižší, tím lepší.

seg-98a24f0170d2 = <b><c1/></b> — nejlepší přesnost polohy: <b>sigma polohy = PDOP · σ_UERE</b>. V tomto scénáři platí <c2/>, takže obě čísla jsou zde <em>číselně shodná</em> — ale pravidlem je PDOP × UERE, <b>nikoli</b> „poloha = PDOP“. Při UERE { "3" } m by sigma polohy bylo ~{ "3.2" } m. (Viz úskalí na konci.)

seg-410081c6dcab = Údaje o hodinách (<c1/>, <c2/>, <c3/>, <c4/>) se objevují, protože balíček oběžné dráhy nese i hodiny po celý průlet; jsou předmětem <a1>Tutoriálu { "2" }</a1>, nikoli tohoto. (<c5/> ukazuje <c6/>, protože není nastaven žádný útok.)

seg-95ccef0d94ae = Blok geometrie v JSON obsahuje podkladová čísla:

seg-89cb7db9b9eb = Kde jsou družice? (odměna)

seg-81678afa0cee = Geometrie je dobrá, <em>protože</em> družice skutečně jsou ve slupce GPS. Dokažte to — exportujte jejich polohy v zemské pevné soustavě:

seg-1452dfac9e06 = První tři družice v prvním vzorkovacím kroku, ECEF v km (soubor SP3 nese čtvrtý sloupec s hodinami, zapsaný jako značka „bez hodnoty“ { "999999.999999" }):

seg-4fd0f95da0cf = Vezměte geocentrický poloměr PG01:

seg-cb02d7c01561 = Nekruhové orákulum: je to opravdu dráha GPS?

seg-a7c478360464 = Tutoriál, který kontroluje engine sám proti sobě, nic nedokazuje. Zde je externí, <em>nekruhová</em> opora pro každé tvrzení výše.

seg-eec62069a957 = <b>{ "1" }. Družice leží na skutečné slupce střední oběžné dráhy Země (MEO) systému GPS.</b> Nominální hlavní poloosa GPS je <b>a = { "26,560" } km</b>, výška ≈ { "20,180" } km nad středním poloměrem Země { "6,378" } km (IS-GPS-200, rozhraní specifikace GPS; Standard výkonnosti standardní určovací služby GPS (SPS), Ministerstvo obrany USA (DoD); Misra & Enge, <em>Global Positioning System</em>, 2. vyd.). Okamžitý poloměr PG01 <b>{ "26,480.9" } km</b> leží několik set km od <c1/> — přesně to, co vytváří skutečná excentricita GPS (~{ "0.005" }–{ "0.02" }). Test <c2/> ověřuje <c3/> proti této publikované hodnotě <c4/>, která je <b>vnější vůči Kshana</b>.

seg-a052774de08f = <b>{ "2" }. Délka průletu je jeden oběh GPS.</b> Třetí Keplerův zákon dává periodu <c1/> s <c2/> a <c3/> (World Geodetic System { "1984" }, WGS-84; technická zpráva Národní agentury pro zobrazování a mapování NIMA TR8350.2): <c4/>, půl hvězdného dne. Trvání scénáře { "43,200" } s („~jeden oběh GPS“) tomu odpovídá s odchylkou pod { "0.3" } % a pozemní stopa GPS se opakuje každý hvězdný den (dva oběhy), podle IS-GPS-200.

seg-067fb466e396 = <b>{ "3" }. Propagované polohy jsou ověřené, nikoli jen vnitřně konzistentní.</b> Propagátor SGP4/SDP4, který tuto tabulku ECEF vytvořil, souhlasí se <b>všemi { "666" } ověřovacími vektory AIAA (Americký institut pro letectví a kosmonautiku) 2006-6753 v nejhorším případě na { "4.12" } mm</b> (<c1/>, <a1><c2/></a1>) a shoduje se s nezávislým crate <c3/> na úrovni pod mikrometr. Exportovaná tabulka je tedy kontrolována proti externí referenční implementaci, nikoli proti vlastní aritmetice Kshana.

seg-652ec3b3d3b8 = <b>Poznámka k datům v SP3.</b> Hlavička epochy SP3 ukazuje zástupné kalendářní datum (2000-01-01); propagace ve skutečnosti běží od vlastní epochy každého TLE ({ "2021" }). Čtěte tabulku jako „polohy ECEF v prvním vzorkovacím kroku“, nikoli „dne { "1" }. ledna { "2000" }“.

seg-74dcb96a27a9 = <c1/> mění každé číslo výše ve smlouvu CI:

seg-cbad1e83279d = <c1/> — <c2/>, <c3/> (protože <c4/>), <c5/> a shrnutí obsahuje <c6/>.

seg-241d75b1502b = <c1/> — poloměr PG01 leží v pásmu slupky GPS, ověřeno proti publikované hodnotě <c2/>.

seg-34328f4f148b = Pokud engine někdy přestane vytvářet skutečnou slupku GPS, sestavení zčervená.

seg-3c23c11911cb = <b>Sigma polohy je PDOP × UERE, nikoli PDOP.</b> Obojí je stejné <em>jen proto</em>, že zde platí <c1/>. Změňte UERE a rozejdou se.

seg-6bb2f31c15dc = <b>Údaje o časování jsou v nanosekundách</b>, údaj o poloze v metrech. Nezaměňujte je.

seg-5bc68d0c144d = <b><c1/> je kvantováno mřížkou</b> (dolní mez v kroku časové mřížky). Během tohoto průletu je uživatel v podstatě stále v řešení, takže holdover je { "0" } s (není žádný výpadek, kterým by bylo třeba setrvat) — to je <em>dobrý</em> případ.

seg-9c36a5c64af5 = Zpřísněte nebo rozšiřte elevační masku (<c1/>) a sledujte, jak se mění dostupnost — to je cvičení úrovně 2.

seg-b0222934237e = Vyměňte snímek TLE za čerstvý pomocí <c1/> (úroveň 2 „použijte čerstvá data“).

seg-e487166204f8 = Pokračujte <a1>Tutoriálem { "2" } — Holdover hodin</a1>, kde je signál GNSS <em>odebrán</em> a palubní hodiny musejí setrvat samy.

seg-795315608752 = <s1>Předchozí</s1>Tutoriály

seg-97ca5a3cc77e = <s1>Další</s1>{ "2" } · Holdover hodin
