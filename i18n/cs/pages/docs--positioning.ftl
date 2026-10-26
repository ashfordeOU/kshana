# docs--positioning: translations (cs)

seg-6555ff9a6d8e = Výstup

seg-0be9b5747c00 = Kshana

seg-94058315dfe4 = Vstup

# c1: docs/POSITIONING.md
seg-09721fbcf7fc = Zdroj: <c1/>

seg-5b362d7b0903 = Kshana je otevřený, reprodukovatelný <b>engine pro důkazy o odolnosti PNT (určování polohy, navigace a času)</b>. Popíšete scénář — senzory nebo hodiny, výpadek GNSS (globálního družicového navigačního systému), útok rušením nebo spoofingem, rozpočet — a engine řekne, jak dobře si udrží čas a polohu, a to podle provozních ukazatelů kvality (FoM). Každá schopnost za těmito ukazateli je ve strojově kontrolované matici označena jako <b>VALIDATED</b> (ověřeno proti nezávislému vnějšímu orákulu), <b>MODELLED</b> (vnitřně konzistentní, vnější ověření chybí) nebo <b>PARTNER</b> (odpovídá za ni hardwarový partner). Tato stránka říká, v čem vede, k čemu slouží a čím není.

seg-48d576a345e3 = V čem vede: časování a holdover pro kritickou infrastrukturu

seg-f41d8a48ff13 = Nejlépe ověřenou částí enginu je časování. Telekomunikační sítě, rozvodné soustavy a finanční trhy berou čas z GNSS a každý z nich musí dimenzovat <b>holdover</b>: jak dlouho může místní hodinový zdroj volně běžet při výpadku GNSS, než jeho časová chyba překročí rozpočet.

# c1: allantools
# c2: VERIFICATION-MATRIX.md
seg-70d00c5fe203 = <b>Co je VALIDATED.</b> Odhadovače stability frekvence, z nichž se skládá odpověď o holdoveru — Allanova odchylka (ADEV), modifikovaná Allanova odchylka (MDEV), časová odchylka (TDEV), maximální chyba časového intervalu (MTIE) a odhadovač Theo1 s rozšířeným rozsahem — jsou ověřeny proti referenčním odchylkám ze Stable32, nezávislé knihovně <c1/> a skutečně naměřeným cesiovým hodinám. Výpočet rozptylu při setrvání hodin v holdoveru a jeho inverze na dobu holdoveru jsou ověřeny proti SciPy. Každý řádek, jeho test a jeho orákulum viz <a1><c2/></a1>.

seg-9fbedc930565 = <b>Co zůstává MODELLED.</b> Šumové hranice pro jednotlivé třídy hodin (například dlouhodobá hranice dané třídy oscilátorů) určují odpověď pro stabilní hodiny a jsou to reprezentativní hodnoty, nikoli měření vašeho zařízení. Pro číslo, které chcete obhajovat, dodejte naměřené hranice.

# c1: telecom-timing
# c2: TELECOM-TIMING.md
seg-700df4898ede = <b>Telekomunikační jednotky.</b> Druh scénáře <c1/> vykazuje MTIE a TDEV, kontroluje je proti maskám Mezinárodní telekomunikační unie, sektoru pro telekomunikační standardizaci (ITU-T) — G.8272 pro primární referenční časové hodiny (PRTC), G.8272.1 pro rozšířené PRTC (ePRTC), G.8273.2 pro telekomunikační hraniční hodiny (T-BC) a G.8271.1 pro síťové limity v referenčním bodě C — a vykazuje, jak dlouho zůstává holdover uvnitř každého rozpočtu časové chyby. Viz <a1><c2/></a1>.

seg-50421d8247ab = Čím se liší

seg-7ec913b140ed = Fyzika a standardy nejsou tím rozdílem: propagace Simplified General Perturbations { "4" } (SGP4), Allanova odchylka, referenční soustavy a faktor DOP (zhoršení přesnosti) jsou v jiných knihovnách k dispozici, zdarma a správně, a Kshana se proti několika z nich sama kontroluje. Rozdíl je v disciplíně práce s důkazy:

seg-f7d466d5215b = <b>Otevřený.</b> Engine je pod licencí GNU Affero General Public License (AGPL), takže jej může kdokoli číst a znovu spouštět. Pro uzavřenou integraci existuje komerční licence.

# c1: scenario + seed + engine version
seg-76ff24c1939b = <b>Reprodukovatelný.</b> Výsledek je bit po bitu určen položkami <c1/> a běh lze sdílet jako odkaz na prohlížečové hřiště.

# c1: PROVENANCE.md
seg-6df34e089b53 = <b>Označený původem.</b> Každý parametr senzoru je dohledatelný k publikovanému zdroji (<a1><c1/></a1>) a každá schopnost nese svou úroveň VALIDATED / MODELLED / PARTNER. Kontrola v průběžné integraci (CI) odmítne řádek VALIDATED bez nezávislého vnějšího orákula, takže vnitřní autokontrolu nelze vydávat za validaci.

seg-8bccfe110f4c = Jiný otevřený nástroj, který by to spojoval napříč holdoverem, integritou, inerciálním setrváním a kvantovými senzory, jsme nenašli, ale hledání, které nic nenajde, není důkazem, že nic neexistuje; netvrdíme, že jsme jediní.

seg-e942b2474960 = Kvantové technologie: neutrální obchodní metoda, výsledky označené MODELLED

# c1: quantum-trade
# c2: QUANTUM.md
# c3: QUANTUM-MODELS.md
seg-655769464447 = Kshana porovnává kvantové a klasické hodiny a inerciální senzory na stejném scénáři se stejným kódem: každé zařízení je chybový model a engine neví, které z nich je „kvantové“. Chápejte ji jako <b>neutrální metodu obchodního srovnání kvantových a klasických technologií, jejíž výsledky jsou označeny MODELLED</b>. Většina vstupů jsou publikované koeficienty Allanovy odchylky a rozpočtu šumu; akcelerometr s atomovým interferometrem z chladných atomů má vrstvu z prvních principů, která svůj koeficient šumu odvozuje. Naměřená data Allanovy odchylky od partnera lze do enginu přivést druhem <c1/>, což je cesta, jak povýšit údaje konkrétního zařízení. Viz <a1><c2/></a1> a <a2><c3/></a2>.

seg-eb5d247b42aa = Měsíc, cislunární prostor a hluboký vesmír: udržováno, nikoli hlavní téma

seg-4b9bd68b7fb1 = Lunární / cislunární sada (lunární monitorování integrity, třítělesové jádro Země–Měsíc, lunární časové škály, analýza servisního objemu) a engine radiometrické navigace pro hluboký vesmír jsou udržované schopnosti. Většina jejich řádků je MODELLED a lunární navigaci již obsluhují specializované nástroje, proto jsou nabízeny jako schopnosti téhož enginu, každá s vlastní úrovní, a nikoli jako hlavní téma.

seg-26f242f1bef8 = Zbytek enginu

seg-b9b2e29e51d9 = Stejný engine se stejnými úrovněmi pokrývá také:

# c1: leo-signal
# c2: leo-pass
# c3: leo-navmsg
# c4: leo-pvt
# c5: leo-ppp
# c6: ntn-positioning
# c7: leo-pnt-chain
seg-89d1923b3ed9 = <b>PNT z nízké oběžné dráhy Země (LEO) od začátku do konce.</b> Návrh signálu (<c1/>), průlet a rozpočet spoje po pásmech (<c2/>), vysílaná navigační zpráva (<c3/>), fúzované určování polohy ze střední a nízké oběžné dráhy Země (<c4/>), konvergence přesného určování polohy bodu (PPP) s augmentací LEO (<c5/>), určování polohy ze sítě 5G pro nepozemské služby (<c6/>) a <c7/>, který předává výstup každého stupně dalšímu v rámci jednoho systému.

# c1: spectrum
seg-2e5b57ccd454 = <b>Spektrum.</b> Vodopád výkonové spektrální hustoty v pásmu L (a v pásmech velmi vysokých frekvencí (UHF), S a C) při skriptované časové ose rušiček, s poměrem rušení k signálu a efektivní hustotou nosné k šumu po pásmech (<c1/>) a se záznamem Signal Metadata Format (SigMF) na vstupu i výstupu.

# c1: solar-system
# c2: body-pnt
# c3: constellation-design
seg-0e7fd993a838 = <b>Sluneční soustava a libovolné centrální těleso.</b> Polohy a fyzikální konstanty planet a větších měsíců (<c1/>), určování polohy kolem kteréhokoli z těchto těles (<c2/>) a návrh konstelací Walker a z publikovaných slotů s mapami pokrytí a faktoru DOP (zhoršení přesnosti) kolem kteréhokoli z nich (<c3/>).

# c1: campaign
seg-9d993a356eb0 = <b>Kampaně.</b> Stávající druhy scénářů zřetězené na jedné sdílené časové ose, procházené přes parametry, spouštěné jako soubory Monte Carlo se seedem nebo vedle sebe za sdílených podmínek (<c1/>).

# c1: --animate
# c2: --export
# c3: spectrum
seg-905a9aa8c47c = <b>Výstupy.</b> Každý běh zapíše dokument s výsledkem, graf a zprávu ve formátech HTML (HyperText Markup Language) a JSON (JavaScript Object Notation); <c1/> zapíše animaci jako SVG (Scalable Vector Graphics), HTML nebo sekvenci snímků; <c2/> zapíše efemeridy CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON nebo STK (Systems Tool Kit) pro druhy, které umisťují objekty na Zemi, a SigMF pro <c3/>.

seg-75206591a52a = Většina těchto řádků je MODELLED; verifikační matice jmenuje těch několik, které jsou VALIDATED (například doporučení Mezinárodní telekomunikační unie pro déšť a scintilace, algoritmus vysílaných efemerid Galilea, kontrola rámce CRC-24Q (24bitová cyklická redundantní kontrola) a řešič planetárního světelného času).

seg-785218a0ea66 = Čím Kshana není

# c1: iq
# c2: spectrum
# c3: [iq]
# c4: spoof_capture
seg-fae54ec38477 = <b>Není simulátorem rádiofrekvenčního (RF) signálu ani zařízením typu hardware-in-the-loop (HIL).</b> Kshana neovládá žádný rádiový hardware a nic nevysílá. Většina práce probíhá na úrovni chybových modelů a rozpočtů spoje, ještě než se koupí hardware nebo laboratorní čas. Na úrovni signálu je to výhradně software: vrstva GNSS IQ (<c1/>) zapisuje soubory vzorků IQ (in-phase/quadrature) v základním pásmu s legitimními signály GNSS pro softwarové přijímače a sama na nich provozuje svůj softwarový přijímač; sekce <c3/> druhu <c2/> (od verze { "0.29.0" }) zapisuje snímek SigMF (Signal Metadata Format) svého analytického modelu včetně nakonfigurovaných rušiček (šumové rušičky po jednotlivých binech, tóny a čirpy jako průběhy); a <c4/> v paměti sčítá autentický signál a repliku signálu spooferu, aby otestoval zachycení smyčky, aniž by jej zapisoval ven. Testování hardwarového přijímače proti skutečnému RF stimulu je úkolem RF simulátoru.

seg-ca243f3f8e8d = <b>Není náhradou za MATLAB/Simulink, STK ani Orekit.</b> Stojí vedle nich. Čte a zapisuje výměnné formáty, které používají — zprávy CCSDS (Consultative Committee for Space Data Systems) Orbit Ephemeris Message, přesné dráhy SP3 (Standard Product { "3" }), RINEX (Receiver Independent Exchange Format) — zapisuje efemeridy CZML, KML, GeoJSON a STK pro jejich prohlížeče a její numerický silový model je křížově kontrolován proti Orekitu, nikoli nabízen místo něj.

seg-8fa4e93c3d0e = <b>Není enginem pro zpracování fáze nosné GNSS ani službou určování polohy</b> (viz níže).

seg-8ba4b67bc813 = <b>Není certifikačním orgánem.</b> Označení VALIDATED znamená, že se schopnost shoduje s vnějším orákulem; není to certifikace žádného produktu ani provozovatele.

seg-362b857140b9 = Čím Kshana je a není ve srovnání s enginem pro zpracování GNSS

# c1: leo-ppp
# c2: pvt
seg-f50951b2e9c8 = Kshana <b>není</b> enginem pro <em>zpracování</em> fáze nosné GNSS a žádný druh scénáře není službou určování polohy. Určitou oporu v doméně měření však má, a to jako kód knihovny, o který se opírá studie výkonu a který je kontrolován proti nezávislým referencím. Kinematické určování polohy v reálném čase (RTK) na krátké základně s celočíselným řešením LAMBDA (least-squares ambiguity decorrelation adjustment) běží na skutečných dvoufrekvenčních pozorováních RINEX, stejně jako statický filtr přesného určování polohy bodu (PPP) s plovoucím řešením, využívající finální dráhy a hodiny IGS; hodiny přijímače, které tento filtr odhaduje, jsou časovým řešením vůči finálním hodinám stanice IGS. Každý ze tří je řádkem VALIDATED <a1>verifikační matice</a1>, a to proti údajům stanic IGS, které tam jsou uvedeny, a každý běží na statických, krátkých pozorovacích oknech, nikoli jako průběžná služba s řešením nejednoznačností na dlouhých základnách, vyhlazováním nosné nebo kinematickým roverem. Druh <c1/> provozuje filtr PPP s plovoucím řešením na kódu a fázi nosné, ale na měřeních, která si sám simuluje, aby studoval dobu konvergence s augmentací LEO i bez ní; soubor pozorování nezpracovává. Druh <c2/> (poloha, rychlost a čas) řeší polohu přijímače ze skutečných kódových pseudovzdáleností RINEX a vysílaných efemerid, ověřenou proti zaměřené souřadnici Mezinárodní služby GNSS (IGS) (stanice ABMF, 2018-05-13) s odchylkou <b>{ "5.7" } m 3-D RMS (kvadratický průměr) / { "1.1" } m horizontálně</b>. Produktem je však studie výkonu, nikoli služba určování polohy, a vymezení níže má potenciálnímu uživateli ušetřit zklamání z nevhodného nástroje.

seg-169dd778c45f = Engine pro zpracování GNSS (RTKLIB, open-source knihovna pro kinematické určování polohy v reálném čase; gLAB, sada laboratorních nástrojů GNSS skupiny gAGE na Technické univerzitě Katalánska)

# c1: pvt
seg-4faa1de0ef70 = scénář: chybové modely senzorů, okna výpadků, geometrie — nebo, pro <c1/>, soubor skutečných pozorování RINEX plus vysílaná navigační data

seg-ae60d0def8af = skutečná pozorování GNSS (RINEX), efemeridy, korekce

# c1: pvt
seg-5fce99bb803d = ukazatele kvality výkonu: holdover, časová/polohová chyba, dostupnost, meze integrity/bezpečnosti — plus poloha z kódového jednobodového určování polohy (SPP) z druhu <c1/>

seg-b752bb5c3f64 = <b>řešení</b> polohy/rychlosti/času (SPP, PPP, RTK)

seg-dd8a47d4f618 = Otázka, na kterou odpovídá

seg-b52fd8e0c856 = „jak dobrá <em>by</em> tato architektura byla a kde selže?“

seg-09672ca004ac = „kde jsem <em>nyní</em> podle těchto měření?“

seg-00d5ebd56088 = Kvantové / optické senzory

seg-a55f2bd6c1bf = modelované jako chybové modely (optické hodiny, atomová inerciální měřicí jednotka (IMU) z chladných atomů, optický přenos času), výsledky označené MODELLED

seg-7ccfb3395d84 = nemodelováno

seg-ec21dbf4b910 = Zpracování skutečných pozorování

# c1: pvt
seg-324ef9a933d5 = kódové SPP ze skutečných pozorování RINEX (<c1/>, na úrovni metrů); RTK na krátké základně s LAMBDA a statické PPP s plovoucím řešením na skutečné fázi nosné, jako kód knihovny kontrolovaný proti stanicím IGS (VALIDATED, statická a krátká okna, nikoli průběžná služba); plus geometrie / faktor DOP (zhoršení přesnosti) / dostupnost

seg-e15db8a33a9a = hlavní kompetence, až po PPP/RTK s fází nosné

seg-e6df7ccdba96 = nulová — běží na kartě prohlížeče (WebAssembly)

seg-812c1c70ce63 = nativní sestavení / toolchain

seg-58df67617e1a = Doplňkové, nikoli konkurenční — RTKLIB a gLAB

# c1: pvt
# c2: pvt
seg-29aeb97bd509 = <a1>RTKLIB</a1> a <a2>gLAB</a2> jsou vyspělé, široce používané sady pro zpracování GNSS. Berou skutečná měření a vytvářejí řešení polohy (SPP/PPP/RTK; gLAB je také vynikajícím výukovým nástrojem se silným zázemím v Evropské kosmické agentuře (ESA) a u Evropské geostacionární navigační překryvné služby (EGNOS)). Kshana je <b>nenahrazuje</b> a o to se ani nepokouší. Její cesta pro pozorování je úzká: kódové jednobodové určování polohy (<c1/>) a, jako kontrolovaný kód knihovny, RTK na krátké základně s celočíselným řešením LAMBDA a statický filtr PPP s plovoucím řešením na skutečných dvoufrekvenčních pozorováních, každý VALIDATED proti údajům stanic IGS (filtr PPP také proti běhu RTKLIB na stejných vstupech). Nemá vyhlazování nosné, kinematické ani průběžné zpracování a žádné řešení nejednoznačností na dlouhých základnách a <c2/> neodhaduje troposféru ani ionosféru — používá modely troposféry Saastamoinen/Niell a ionosféricky nezávislou kombinaci L1/L2, neřeší je jako stavy.

seg-9c4e70ce8a55 = Postup je doplňkový:

seg-01f43da4858c = <b>RTKLIB / gLAB</b> odpovídají na otázku <em>„kde jsem podle těchto signálů?“</em>

seg-f5370894cdd1 = <b>Kshana</b> odpovídá na otázku <em>„jak dlouho si udržím dobrou odpověď, když tyto signály přestanou přicházet — a kolik mi přinese lepší hodinový zdroj nebo inerciální senzor, klasický či kvantový?“</em>

seg-2403d6b115de = Přirozený postup využívá engine pro zpracování v úseku, kdy je GNSS k dispozici, a Kshanu ke studiu chování při <b>holdoveru</b> a prostoru obchodních variant senzorů kolem něj. Pokud potřebujete službu určování polohy s fází nosné — kinematické PPP nebo RTK, dlouhé základny, síťové řešení nejednoznačností — použijte RTKLIB nebo gLAB; pokud potřebujete reprodukovatelné, označené důkazy o odolnosti a holdoveru, k tomu je Kshana určena.

seg-21631e5c6be3 = Prohlížečová úroveň bez instalace

seg-9b01dd6721ed = Většina simulačních nástrojů v této oblasti (RTKLIB, gLAB, General Mission Analysis Tool (GMAT), Orekit, STK) vyžaduje nativní instalaci nebo licenci a před prvním výsledkem i čas na zaučení. Kshana se kompiluje do WebAssembly a běží <b>celá v prohlížeči</b> — <a1>hřiště</a1> načte rozpracovaný scénář, spustí skutečný engine na straně klienta (nic se nenahrává) a během několika sekund ukáže výsledek. Vedené posuvníky a scénáře na jedno kliknutí znamenají, že první užitečný výsledek nevyžaduje TOML (Tom's Obvious Minimal Language, formát souboru scénáře) ani toolchain.

seg-b1cb4b8f0ef1 = Tato úroveň bez instalace je záměrné rozhodnutí:

seg-33b361bde50d = <b>Dosah</b> — recenzent, student nebo nákupčí může skutečný engine vyzkoušet z odkazu, na libovolném zařízení, bez jakéhokoli nastavení.

# c1: scenario + seed + engine version
seg-a4a4ebf89cee = <b>Reprodukovatelnost</b> — tentýž engine, který běží v prohlížeči, je knihovna, která se šíří na crates.io, v Python Package Index (PyPI) a v npm; výsledek je reprodukovatelný z <c1/> a běh lze sdílet jako URL (webovou adresu).

seg-3d3d4bda606c = <b>Poctivost</b> — spustit engine sám, veřejně, je nejsilnější protiargument vůči výzvě „věřte číslům“: prohlížečová úroveň <em>je</em> plochou pro audit.

seg-6095bcacb725 = Prohlížečová úroveň z Kshany nedělá náhradu za desktopovou sadu pro zpracování — dělá z otázky obchodní studie výkonu téma přístupné lidem, kteří by takovou sadu nikdy neinstalovali.

# c1: CAPABILITY.md
# c2: pvt
seg-938ca8eab04c = <a1><c1/></a1> — mapa rozsahu po řádcích (úplný rozsah a rezidua řešiče <c2/> jsou v řádku <b>Zpracování GNSS / PNT</b>).

# c1: VALIDATION.md
seg-9e94b1740386 = <a1><c1/></a1> — co je ověřeno, s důkazy.

# c1: TELECOM-TIMING.md
seg-3a02f39bd90a = <a1><c1/></a1> — druh telekomunikačního časování a jeho masky.

# c1: GLOSSARY.md
seg-c5aa08e4ca55 = <a1><c1/></a1> — srozumitelné definice zde použitých pojmů.

# c1: web/README.md
seg-85aaaa34ea7c = <a1><c1/></a1> — prohlížečové hřiště.

seg-54e2deeffc7d = <s1>Předchozí</s1>Architektura

seg-b2f93c49d5c6 = <s1>Další</s1>Seznam změn
