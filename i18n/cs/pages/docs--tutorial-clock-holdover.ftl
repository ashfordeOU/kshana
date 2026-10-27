# docs--tutorial-clock-holdover: translations (cs)

seg-b59f529012a6 = Zdroj: <c1/>

seg-e66a5042182e = Tutoriál { "2" } — Holdover hodin: jak dlouho lze setrvat bez signálu

seg-889112bc4c09 = <c1/> · <b>Scénář:</b> <c2/> (výuková kopie: <a1><c3/></a1>) · <b>Obtížnost:</b> začátečník · <b>~{ "20" } min</b>

seg-a4bdf55d96be = Na konci budete mít za sebou holdover hodin při odepřených signálech GNSS (globálního družicového navigačního systému), přečtete si ukazatel kvality časování a pochopíte zákon driftu √(q_wf·T), který vysvětluje, <em>proč</em> optické hodiny vydrží déle než čipové; zákon je převzat z NIST (amerického Národního institutu standardů a technologie), nikoli vymyšlen.

seg-51ae9468b92a = Co tento scénář je

seg-87334505b228 = Když signály GNSS zmizí, systém udržuje čas na vlastních palubních hodinách. Fáze těchto hodin pomalu driftuje, a jakmile drift překročí provozní specifikaci časování, jste mimo provoz. <b>Holdover</b> je doba, po kterou zůstanete ve specifikaci po ztrátě GNSS — hlavní ukazatel kvality autonomie.

seg-798ac031b5c6 = Scénář běží na časové ose { "2" } h: { "10" } min synchronizace GNSS, poté { "6600" } s ({ "1.83" } h) bez signálu, proti specifikaci časování { "20" } ns, se vzorkováním každých { "10" } s. Porovnává dvoje hodiny na identickém kódu s jejich <em>vlastním</em> publikovaným šumem:

seg-3d53622dbe12 = <b>Kvantové</b>: stronciové optické mřížkové hodiny, kosmický cíl σ_y({ "1" } s) = { "1" }×{ "10" }⁻¹⁵ (arXiv:{ "1503.08457" }), cíl pozemního demonstrátoru, nikoli letově ověřený. σ_y(τ) je Allanova odchylka, standardní míra frekvenční stability hodin při průměrovacím čase τ.

seg-e25af6d0752f = <b>Klasické</b>: čipové atomové hodiny (CSAC) Microchip SA.45s, σ_y({ "1" } s) = { "3" }×{ "10" }⁻¹⁰ (datasheet) — nasazený komerční díl.

seg-08f3fdc9252a = Přečtěte si jednořádkové shrnutí

seg-baa0cc808987 = Se seedem = { "42" }, specifikací { "20" } ns a výpadkem { "6600" } s:

seg-76f7739f8b17 = <b><c1/></b> — optické hodiny vydrží celý výpadek { "6600" } s bez překročení { "20" } ns. Jejich 95. percentil fázové chyby je { "1.20e-4" } ns, tedy asi desetitisícina nanosekundy: sotva se pohne.

seg-0ba48fccffae = <b><c1/></b> — CSAC překročí specifikaci { "20" } ns přibližně v ~{ "2610" } s, tedy za méně než polovinu výpadku. Jeho fázová chyba p95 ({ "19.7" } ns) leží těsně na hranici specifikace.

seg-b745d05e2bf1 = <b><c1/></b> — tento scénář nenastavuje žádný útok, takže není co detekovat a shrnutí číslo nevypisuje. JSON však přesto nese analytickou mez detekovatelnosti spoofingu pro každé hodiny v <c2/> ({ "0.997" } pro optické hodiny; { "0.000" } pro CSAC, jehož vlastní šum při setrvání v daném okně již překračuje { "20" } ns), označenou <c3/> v bloku <c4/>. Hodnocení detekce proti skutečnému útoku je příběh <a1>Tutoriálu { "3" }</a1>.

seg-510e1cd8ed40 = <b><c1/></b> — zde jde o <em>vnitřní konzistenci filtru</em> (podíl vzorků výpadku uvnitř vlastní k-sigma meze Kalmanova filtru), <b>nikoli</b> o letecké horizontální či vertikální ochranné úrovně (HPL/VPL). Viz <a1><c2/></a1>.

seg-7cc0ba5e5d13 = Nekruhové orákulum: proč { "2610" } s pro CSAC?

seg-2958401e00ca = U hodin s bílou frekvenční modulací (white-FM) roste fázová chyba 1-σ jako <b>σ_x(T) ≈ √(q_wf · T)</b>, kde <c1/> má jednotky s². Tento vztah pochází z <b>NIST Special Publication { "1065" }</b> (Riley, <em>Handbook of Frequency Stability Analysis</em>) — vztahy σ_y(τ)↔fáze — a je to <em>tentýž</em> vztah SP-1065, proti němuž <c2/> ověřuje Allanovu odchylku enginu s přesností ~{ "2" } %.

seg-d6c8f68b42b9 = Pro CSAC platí <c1/>. Vyřešte čas, kdy fáze 1-σ dosáhne { "20" } ns = { "2" }×{ "10" }⁻⁸ s:

seg-0f28d1a1163f = Hodnota { "2610" } s z enginu není tento čas 1-σ a ani být nemá. <c1/> je první bod mřížky po { "10" } s (<c2/>), ve kterém absolutní fázová chyba <em>této seedované realizace</em> překročí { "20" } ns (<c3/>). První překročení úrovně náhodnou procházkou často nastane dlouho předtím, než její obálka 1-σ té úrovně dosáhne, a realizace navíc nese zbytkovou frekvenční chybu, která filtru zůstane po synchronizaci { "600" } s. Zákon tedy určuje řádovou škálu, několik tisíc sekund pro hodiny { "3" }×{ "10" }⁻¹⁰ proti { "20" } ns, nikoli přesnou hodnotu. Test ověřuje <b>pásmo { "2000" }–{ "3200" } s</b> kolem ní, nikoli konkrétní číslo.

seg-2e7cbdefa9b7 = Samotné kotevní hodnoty z datasheetu jsou externí, citované v řetězcích <c1/> scénáře: cíl optických mřížkových hodin Sr { "1" }×{ "10" }⁻¹⁵ (arXiv:{ "1503.08457" }); Microchip SA.45s CSAC { "3" }×{ "10" }⁻¹⁰ (datasheet). A exportovaná <c2/> odpovídá σ_y(τ) z datasheetu s přesností ~{ "2" } % (<c3/>, NIST SP { "1065" }). V playgroundu ji vykreslete jako log-log graf „Stabilita hodin (ADEV, Allanova odchylka)“.

seg-def5271a207d = Co test zafixuje

seg-ebddc1f5ffe2 = <c1/> (optické hodiny musí vydržet alespoň stejně dlouho),

seg-8e570268f107 = <c1/> (vydrží celý výpadek),

seg-d60483c1af2e = <c1/> — tolerančním pásmem kolem škály white-FM podle SP-1065, <em>nikoli</em> magickým číslem. Orákulem je zákon, nikoli hodnota.

seg-e5f926d1055b = Úskalí a jednotky

seg-0f57e35ed833 = <b>Údaje o časování jsou v nanosekundách</b>, nikdy v metrech. (Holdover polohy je <em>jiný</em> balíček — viz inerciální část Tutoriálu { "3" }.)

seg-2e476b213141 = <b><c1/> má jednotky s² a rovná se σ_y({ "1" } s)².</b> To je most od Allanova čísla z datasheetu k modelu.

seg-75951a150b44 = <b>Holdover je dolní mez kvantovaná mřížkou</b> (<c1/>). Nepřeceňujte přesnou hodnotu; čtěte <em>pásmo</em>.

seg-959eb86066f1 = <c1/> je zde vnitřní konzistence filtru, nikoli letecká integrita.

seg-cb457294fc53 = Kam dál

seg-aa3e50f2c699 = <b>Úroveň { "2" }:</b> zpřísněte <c1/> z { "20" } na { "10" } a sledujte, jak holdover CSAC <em>klesne</em> ({ "2610" } s → { "1300" } s, změřeno pomocí <c2/>), nebo použijte <c3/> k vytvoření tabulky holdoveru proti úrovni šumu CSAC <c4/> (<c5/>: { "25" } bodů od { "10" }⁻²⁴ do { "10" }⁻¹⁸ s², klasický holdover { "2610" } s → { "250" } s).

seg-cb31f104d104 = <b>Úroveň { "3" }:</b> přidejte <c1/>, čímž z toho uděláte soubor Monte Carlo, a přečtěte si pásmo holdoveru [p05–p95] (<c2/> vypíše <c3/>).

seg-9cb56e10f0fd = Poté vrcholový tutoriál: <a1>Tutoriál { "3" } — Kvantová odolnost proti klasické</a1>.

seg-7dc19a98c7ee = <s1>Předchozí</s1>{ "1" } · Vaše první oběžná dráha

seg-c274e92fdcb5 = <s1>Další</s1>{ "3" } · Kvantové proti klasickému
