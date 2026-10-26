# docs--kind-impairment-eval: translations (cs)

seg-98151954f217 = false

seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" }: řádky <a1>verifikační matice</a1>, které tento druh uvádějí.

seg-2e6b437f3e99 = Zdroj: <c1/>

seg-134407946837 = <c1/> (druh scénáře)

seg-304496607bd7 = Druh scénáře enginu v{ $version }, rodina <a1>Rušení, spoofing a spektrum</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každý štítek zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se štítek získává: oddíl Evidence v README).

seg-98e740d32860 = Testovací prostředí pro vyhodnocení detekce zhoršení RF pomocí strojového učení ({ "13494" }): vygeneruje označený korpus SYNTETICKÝCH dat opřený o parametry (nominal/jamming/spoof-time/spoof-position/multipath), ohodnotí detektor (energy|agc|sqm|parity|fused) pomocí harnessu nezávislého na detektoru a hlásí AUC/ROC/matici záměn + Pd podle tříd při cílovém Pfa, plus rozdíl optimismu uvnitř a vně rozdělení. Pouze provozní charakteristiky MODELLED — nikdy terénní data/IQ, žádný verdikt dobrý/špatný.

seg-41c3f9559282 = Jeden běh <c1/> se shrnuje takto: impairment-eval | detector fused(max-z) | AUC { "0.998" } in / { "0.981" } out (gap { "0.017" }) | Pd { "0.99" } Pfa { "0.05" } @ target { "0.05" } | { "1000" } cases | MODELLED synthetic

seg-9b0d7ebaa1f0 = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-283510d17885 = Příklad <c1/> mimo jiné nastavuje:

seg-6a64be3b3f07 = fused

seg-3db71c5bdd0a = auc_out používá jemnější mimo-ladicí reg

seg-667d26b3a2fe = Štítek výsledku (enginu): MODELLED — syntetický korpus opřený o parametry (nikdy terénní data/IQ); pouze provozní charakteristiky, žádný verdikt dobrý/špatný

seg-7e7b07bc5545 = Graf, který engine zapisuje pro scenarios/impairment-eval.toml, druh impairment-eval

seg-798a7e5526a0 = <b>VALIDATED</b> AUC (Mann-Whitney, shody ½), matice záměn při prahu, P_d/P_md/P_fa/preciznost/přesnost/F1. Testy: <a1>eval_metrics_reference.rs</a1>.

seg-ceedc14c623a = <b>VALIDATED</b> ROC AUC + bootstrapový CI oddělující skutečné označené anomálie; transparentní detektor (reprodukuje označení). Testy: <a1>opssat_ad_reference.rs</a1>.

seg-0ee5b31cfd09 = <b>MODELLED</b> Označený syntetický korpus zhoršení + harness ROC/AUC/matice záměn/Pfa-Pmd nezávislý na detektoru; ochrana proti úniku, stratifikované dělení, zpráva o optimismu při posunu rozdělení (uvnitř vs. vně režimu).

seg-392fa6495840 = <b>VALIDATED</b> AUC (Mann-Whitney, shody ½), matice záměn při prahu, P_d/P_md/P_fa/preciznost/přesnost/F1. Orákulum (ExternalDataset): scikit-learn { "1.9.0" } (Pedregosa et al., JMLR { "2011" }) — nezávislá knihovna, přesná shoda

seg-c719d4060e1a = <b>MODELLED</b> Označený syntetický korpus zhoršení + harness ROC/AUC/matice záměn/Pfa-Pmd nezávislý na detektoru; ochrana proti úniku, stratifikované dělení, zpráva o optimismu při posunu rozdělení (uvnitř vs. vně rež. Orákulum (InternalConsistency): Meze AUC v uzavřeném tvaru (Mann–Whitney) + detektor s dokonalým orákulem; korpus je SYNTETICKÝ (opřený o parametry, nikoli terénní data/IQ)

seg-5565108cc4d1 = MODELLED — syntetický korpus opřený o parametry (nikdy terénní data/IQ); pouze provozní charakteristiky, žádný verdikt dobrý/špatný (výsledek <c1/>)

seg-d2a9f35ea8cc = MODELLED pouze provozní charakteristiky — nikdy terénní data/IQ, žádný verdikt dobrý/špatný. (katalog druhů (<c1/>))

seg-376f86fbdcb7 = ÚPRIMNÝ ROZSAH: pouze provozní charakteristiky MODELLED. Korpus je syntetický a opřený o parametry (složený z modelů rušení/AGC/SQM/parity v Kshaně) — nikdy ne terénní záznamy ani surová data IQ. Harness je rozhodčí; hlásí charakteristiky, nevynáší verdikt dobrý/špatný. Spuštění: kshana scenarios/impairment-eval.toml (komentář v souboru scénáře, řádky { "9" } až { "12" })

seg-882d67b9474f = Vyhodnocení detekce zhoršení RF pomocí strojového učení ({ "13494" }) je MODELLED, nikoli ověřeno proti nezávislé vnější referenci: zkontrolováno proti vlastní uzavřené / analytické identitě – zachytí chyby přepisu a koeficientů, ale není to externí orákulum. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-5d23d7f8f872 = Stránka rodiny: <a1>Rušení, spoofing a spektrum</a1>

seg-6cf4bb2d7f7a = Tematická stránka: <a1>BENCH.md</a1>

seg-dde90de4270b = <s1>Předchozí</s1>hybrid

seg-1e68310f2dc6 = <s1>Další</s1>inertial
