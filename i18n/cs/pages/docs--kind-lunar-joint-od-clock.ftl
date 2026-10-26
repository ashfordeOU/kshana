# docs--kind-lunar-joint-od-clock: translations (cs)

seg-37d29d8303fe = km

seg-593938ee5995 = Zdroj: <c1/>

seg-d54a85227f43 = <c1/> (druh scénáře)

seg-200e58e189c2 = Modelovaný společný vícetechnikový odhadovač dávky pro lunární určování oběžné dráhy a hodin na SIMULOVANÉ síti: snímkový fit Gauss-Newton, který slučuje geodetická zpoždění VLBI na zemských základnách, lunárně místní vzdálenosti stanice↔družice a vzdálenosti mezi družicemi, aby společně obnovil 3D polohu lunární povrchové stanice, polohy malé konstelace a posun hodin každého prvku z vložené pravdy. Hlavní čestný výsledek — VLBI činí úplnou 3D polohu stanice pozorovatelnou tam, kde samotné lunárně místní měření vzdálenosti ponechává slabě pozorovaný směr — se uvádí jako kontrast chyby stanice s VLBI a bez VLBI. MODELLED simulovaná obnova uzavřenou smyčkou (pravda sdílí model pozorování), deterministické (seedované), NEOVĚŘENO na reálných datech; bez propagace silového modelu uvnitř řešiče; bez TRL/heritage/podpory agentury.

seg-6419390eeae4 = Jeden běh <c1/> se shrne takto: lunar-joint-od-clock | { "3" } družice, { "6" } pozemních stanic | 3D chyba stanice s VLBI { "3.54" } m oproti samotným vzdálenostem { "2184.02" } m ({ "617.5" }× ostřejší) | RMS polohy družic { "2.20" } m | chyba hodin stanice { "2.87e-10" } s | obs 40/16 parametrů

seg-be3bcad756cc = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>

seg-ef164af52468 = Příklad <c1/> mimo jiné nastavuje:

seg-6f788a1278b9 = 1/({ "10" }^{ "6" } m)^{ "2" }

seg-cfa051b87e59 = Graf, který engine zapisuje pro scenarios/lunar-joint-od-clock.toml, druh lunar-joint-od-clock

seg-4c6914c162d1 = <b>VALIDATED</b> Dávková fúze VLBI + lunárně místní vzdálenosti + vzdálenosti mezi družicemi pro obnovu poloh a hodin stanice a konstelace. Orákulum (ExternalDataset): P2: numpy { "2.4.6" } (numpy.linalg.lstsq s LAPACK gelsd, numpy.linalg.inv; BSD-3) znovu vypočte každý krok Gauss-Newton, konvergované řešení vážených nejmenších čtverců, formální sigma a chybu stanice na uložených Jacobiánech a pozorováních šesti simulovaných sítí, předregistrováno (5094bc31) na relativní max({ "1e-8" }, { "100" } kappa eps). První běh selhal na síti bez VLBI ({ "6.1e-7" } proti { "1e-8" }, normální rovnice v

seg-5b3f6008f5a7 = <b>VALIDATED</b> Fisherova informace M=HᵀWH, dolní mez Cramér–Rao, hodnost pozorovatelnosti / nulový prostor defektu datumu (pseudoinverze Moore–Penrose) a D/A/E/T-optimální návrh experimentu. Orákulum (ExternalDataset): NumPy { "2.4.1" } (numpy.linalg.eigh / .inv; BSD-3-Clause, na bázi LAPACK) — nezávislá autorita třetí strany počítající tytéž jednoznačně definované vlastní hodnoty, kovarianci σ²(XᵀX)⁻¹ Cramér–Rao a faktory DOP GNSS jiným algoritmem (LAPACK rozděl a panuj + LU) než cyklické Jacobiho kroky a spektrální pseudoinverze v Kshana; shoda na { "1e-9" }. Tatáž třída externích knihoven již ověřuje D

seg-af12da412a10 = <b>MODELLED</b> Pozorovatelnost společného lunárního řešení pomocí Fisherovy informace: bez zemských základen leží datum absolutního rámce v nulovém prostoru HᵀWH (poloha stanice neu. Orákulum (InternalConsistency): Analytická struktura defektu datumu — nepozorovatelný mód absolutního rámce leží v nulovém prostoru Fisherovy informace (uzavřený tvar), práh hodnosti odpovídá publikovanému zdůvodnění návrhu se 3 stanicemi a odhadovač dosahuje výsledné CRLB v Monte Carlo. Samotná lunární geometrie je reprezentativní síť (nikoli odlétaná efemerida), takže řádek zůstává MODELLED; podkladový engine FIM/CRLB je kontrolován proti

seg-865ba2668582 = MODELLED simulovaná obnova uzavřenou smyčkou (pravda sdílí model pozorování), deterministické (seedované), NEOVĚŘENO na reálných datech; bez propagace silového modelu uvnitř řešiče; bez TRL/heritage/podpory agentury. (katalog druhů (<c1/>))

seg-a0d4350a1c66 = Čestnost: MODELLED simulovaná obnova uzavřenou smyčkou. Vložená pravda se převede na syntetické pozorovatelné veličiny STEJNÝM modelem geometrie, který řešič invertuje, přidá se seedovaný gaussovský šum a odhadovač obnoví vloženou pravdu v rámci šumu. Orákulum je vnitřní konzistence (obnova pravdy + realističnost kovariance NEES), NIKOLI validace na reálných datech. Uvnitř řešiče není žádná propagace silového modelu — druž (komentář v souboru scénáře, řádky { "24" } až { "29" })

seg-1465694e7e4f = Pozorovatelnost absolutní lunární stanice (defekt datumu) je MODELLED, nikoli ověřená: je kontrolována proti vlastní identitě v uzavřeném tvaru / analytické — zachytí chyby přepisu a koeficientů, ale není vnějším orákulem. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-e6962535ee72 = <s1>Předchozí</s1>lunar-jamming

seg-2ef5c8112d1b = <s1>Další</s1>lunar-llr-datum

seg-1f17ef6a853e = Druh scénáře enginu v{ $version }, rodina <a1>Lunární a cislunární</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každé označení zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se označení získává: oddíl Evidence v README).

seg-1c1eeb2dcaa0 = Stránka rodiny: <a1>Lunární a cislunární</a1>

seg-619127334cf3 = Žádný řádek matice tento druh nejmenuje; označení jeho výsledku je vlastní označení enginu uvedené výše.
