# docs--kind-quantum-anomaly-detect: translations (cs)

seg-29e58493fdd4 = Modelováno

seg-619127334cf3 = Žádný řádek matice tento druh nejmenuje; označení jeho výsledku je vlastní označení enginu uvedené výše.

seg-7b2721b7588d = Druh scénáře enginu v{ $version }, rodina <a1>Inerciální, fúzní a kvantové senzory</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každé označení zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se označení získává: oddíl Evidence v README).

seg-f7f12029e0ec = Stránka rodiny: <a1>Inerciální, fúzní a kvantové senzory</a1>

seg-496b17a8d3b9 = Tematická stránka: <a1>QUANTUM-MODELS.md</a1>

seg-bb07c8ee153f = <b>PARTNER</b> Neposkytuje se — pouze modely výkonu; hardware se studenými atomy a hodinami je záležitostí partnera. Orákulum (NoneKind): žádné: disciplína ve vlastnictví partnera, záměrně bez modulu a bez testu

seg-836d5102f0d1 = Zdroj: <c1/>

seg-ad4ce0110e8d = <c1/> (druh scénáře)

seg-04310cd6cbec = Detekce poruch/anomálií MODELLED pro kvantové systémy PNT: označený katalog poruch (skok frekvence hodin/drift/ztráta zámku; skok zkreslení čidla/výpadek), ROC AUC detekční statistiky (s bootstrapovým intervalem spolehlivosti z externě ověřeného eval_stats) a minimální detekovatelná porucha při pevné míře falešných poplachů, přičemž monitor podporovaný kvantovými hodinami (nižší šum) detekuje menší poruchy — jako otevřené TradeEvidence + reprezentativnost. Model gaussovské detekční statistiky (AUC = Phi(mu/(sigma*sqrt2))); modeluje třídu, ilustrativní parametry z veřejných zdrojů, žádná TRL/let/certifikace.

seg-442310afbb13 = Jeden běh <c1/> se shrnuje takto: quantum-anomaly-detect | AUC kvantový { "0.9908" } oproti klasickému { "0.7603" } | min. detekovatelná porucha kvantový { "1.312" } oproti klasickému { "4.372" } | { "5" } tříd poruch | obchodní srovnání vítězí kvantový 2/2 | MODELLED

seg-335b8d87e27d = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-c2b10c0bdaf8 = Příklad <c1/> mimo jiné nastavuje:

seg-f44afe581836 = { $version }

seg-2f1d14239d1a = Graf, který engine zapisuje pro scenarios/quantum-anomaly-detect.toml, druh quantum-anomaly-detect

seg-af9aaf95d4f8 = <b>VALIDATED</b> Analytická binormální ROC AUC = Φ(μ/(σ√{ "2" })) a minimální detekovatelná porucha σ·(Φ⁻¹({ "1" }−P_fa)+Φ⁻¹(P_d)) podpírající detektory kvantových poruch a anomálií. Orákulum (ExternalDataset): scipy { "1.17" } (Cephes ndtr/ndtri) + scikit-learn roc_auc_score (Pedregosa et al., JMLR { "2011" }), obojí BSD-3-Clause — nezávislé knihovny počítající tytéž jednoznačně definované veličiny gaussovského chvostu / AUC, shodné až na podlahu A&S-erf (~{ "7e-8" }). Kvantová výhoda postavená nad tím zůstává MODELLED

seg-c37642bb24fe = <b>MODELLED</b> Jeden reprodukovatelný objekt TradeEvidence (pevný rámec: scénář+seed+engine; společné hodnoty kvantový-vs-klasický pro každý ukazatel kvality s polaritně správným přínosem, volitelné { "95" }%. Orákulum (InternalConsistency): Identity uzavřeného tvaru pro přínos/vítěze a věrný obal stávajícího quantum_trade::TradeResult; poctivost svázaná s registrem reprezentativnosti a štítky ověření

seg-b854cedc8a51 = <b>MODELLED</b> Označený katalog kvantových poruch (skok frekvence hodin/drift/ztráta zámku; skok zkreslení čidla/výpadek), ROC AUC detekční statistiky s bootstrapovým intervalem spolehlivosti a minimu. Orákulum (InternalConsistency): Gaussovská AUC v uzavřeném tvaru = Phi(mu/(sigma*sqrt2)) křížově zkontrolovaná proti externě ověřenému eval_stats::bootstrap_auc_ci (oproti scikit-learn) + analytické prahy detekce

seg-7b465c2bb7cf = Detekce poruch/anomálií MODELLED pro kvantové systémy PNT: označený katalog poruch (skok frekvence hodin/drift/ztráta zámku; skok zkreslení čidla/výpadek), ROC AUC detekční statistiky (s bootstrapovým intervalem spolehlivosti z externě ověřeného eval_stats) a minimální detekovatelná porucha při pevné míře falešných poplachů, přičemž monitor podporovaný kvantovými hodinami (nižší šum) detekuje menší poruchy — jako otevřené TradeEvidence + reprezentativ (katalog druhů (<c1/>))

seg-7f43972b246d = Detekce poruch/anomálií pro kvantové systémy PNT — označený katalog poruch + ROC AUC + minimální detekovatelná porucha, monitor podporovaný kvantovými hodinami oproti klasickému. MODELLED; ilustrativní parametry z veřejných zdrojů; modeluje třídu, žádné tvrzení o TRL ani letu. (komentář v souboru scénáře, řádky { "1" } až { "3" })

seg-eb75c6a4dcec = Důkazy z obchodního srovnání kvantového a klasického přístupu (společný tvar) jsou MODELLED, nikoli ověřené: zkontrolováno proti vlastní uzavřené / analytické identitě — zachytí chyby přepisu a koeficientů, ale není to vnější orákulum. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-3f92aec2b92a = Detekce poruch/anomálií pro kvantové systémy PNT je MODELLED, nikoli ověřená: zkontrolováno proti vlastní uzavřené / analytické identitě — zachytí chyby přepisu a koeficientů, ale není to vnější orákulum. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-6524a69e4835 = <s1>Předchozí</s1>pvt

seg-aa689568cf84 = <s1>Další</s1>quantum-gnss-free-nav

seg-a349aa76b0ed = PARTNER
