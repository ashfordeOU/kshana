# docs--validation: translations (cs)

seg-70860389903a = Hodiny

seg-583dc9ff6178 = Knihovna

seg-d01db1c2710a = Reference

seg-2db69c58f694 = Měsíční diferenční PNT

seg-2eb6d1b0483d = RAIM / ARAIM

seg-da3532b1444d = SBAS / DO-229E

seg-d3af26f389f5 = IONEX / Klobuchar

seg-d6476863f862 = Schopnost

seg-ad856ad710eb = Stav

seg-4bcec6e2dd9f = Objem služby lunární navigace

seg-c04a3591074c = Export pro lunární interoperabilitu

seg-20fee61b3107 = Knihovna chybových modelů kvantových zařízení

seg-eaf341ff4522 = Kvantová navigace bez GNSS

seg-75636f9419b2 = Známá omezení

seg-5ed34a5b402e = Lunární společné vícetechnikové určování oběžné dráhy a hodin

seg-619f89bf160c = Realizace lunární referenční soustavy

seg-d12d4565b01d = Lunární geodetická VLBI, cesta jádra

seg-b03d56f501c3 = Druh

seg-9c0eb89a2fbe = Balíček

seg-f63dd3d7aad4 = Zdroj

seg-638b8d451550 = Senzor

seg-04f69a0edb2f = typ

seg-35bf9a48e566 = Veličina

seg-f3526b0d95f8 = Změřeno

seg-7634c6f4b32c = Spoj

seg-b966dd26caa6 = Datová sada

seg-4fe4920a3fa1 = Norma

seg-84430d202cd4 = Zdroj: <c1/>

seg-028f26d1374e = <b>K tolerancím.</b> „Ověřeno“ níže znamená, že kalibrační test potvrzuje, že simulovaná statistika odpovídá referenčnímu vztahu v rámci <b>vynucené brány (gate)</b>, v současnosti <b>relativní chyby { "20" }–{ "25" } %</b> (průměrované přes seedy) pro vztahy Allanovy odchylky a rozpočtu šumu. Medián pozorované shody je často mnohem těsnější (několik procent), ale <em>zaručenou</em> mezí je brána, nikoli medián. Kde se objeví číslo jako „~{ "2" } %“, jde o typické pozorování, nikoli o vynucenou toleranci. Viz <a1>Tvrzení versus realita</a1>.

seg-94a480ed9ccb = Pravidlo povýšení

seg-a550784412a6 = Řádek strojově kontrolované verifikační matice (<c1/>) je VALIDATED pouze tehdy, když orákulum <b>nezávislé na Kshana</b> souhlasí s implementací <b>v rámci tolerance stanovené před spuštěním porovnání</b>, v testu, který běží v bráně. Tato část je jediným místem, kde je pravidlo zapsáno; matice, text u jednotlivých řádků i poznámky k vydání se na ni odvolávají.

seg-5e14faed9f05 = Přijímané druhy orákul

seg-4297b6a1b385 = Co se počítá

seg-a42c0c36b37f = Příklady, které již jsou v matici

seg-e39aeb132e03 = Skutečná naměřená data veličiny, kterou řádek tvrdí: pozorování fyzického světa, nikoli výstup modelu.

seg-e77977db9de1 = Zadržené dvě třetiny skutečného záznamu cesiových hodin; archivované normální body laserového měření vzdálenosti k Měsíci; řada UTC(k) Circular T z BIPM (Mezinárodní úřad pro míry a váhy); dlaždice terénu SRTM (Shuttle Radar Topography Mission).

seg-6325fe1fafaf = Nezávislá knihovna nebo nástroj třetí strany, který počítá <b>jednoznačně definovanou</b> veličinu na stejných vstupech, kde knihovna sama implementuje výpočet z dané oblasti. Shoda knihovny s knihovnou je skutečnou kontrolou jen proto, že veličina má jednu správnou odpověď.

seg-a9cd35495601 = allantools, Orekit, ANISE, RTKLIB, gnss_lib_py, lamberthub, pymcdm, scikit-learn, statistická rozdělení SciPy.

seg-056adffae706 = Publikované referenční vektory, tabulky nebo ověřovací příklady: čísla, která norma, agentura nebo referenční text uvádí, aby bylo možné implementace proti nim kontrolovat.

seg-991fb822e99c = Vektory SOFA/ERFA (Standards of Fundamental Astronomy), ověřovací vektory SGP4 od AIAA (Americký institut pro letectví a kosmonautiku), ověřovací příklady ITU-R (Mezinárodní telekomunikační unie, sektor radiokomunikací), pracovní příklad ARAIM z Pracovní skupiny C, JPL (Jet Propulsion Laboratory) Horizons.

seg-2a774e48055a = Dvě další pravidla rozhodují hraniční případy. Obě jsou přijata pro vydání { "0.30" }.

seg-f5c6cf536ba1 = <b>P1, publikovaná pracovní hodnota.</b> Publikovaná pracovní hodnota vypočtená ze stejného uzavřeného vztahu, který řádek implementuje, se počítá jako publikovaný referenční vektor, pokud je publikace nezávislá na Kshana a porovnání zafixuje stanovenou toleranci. Hodnota musí být v publikaci vytištěna jako číslo (hodnota odečtená z grafu se počítá, jen pokud je nejistota odečtu uvnitř stanovené tolerance) a test musí přimět Kshana, aby ji vypočetla ze vstupů publikace; porovnání konstanty s dokumentem, z něhož byla zkopírována, je kontrola přepisu, nikoli P1.

seg-0b043b552e76 = <b>P2, nezávislá numerická knihovna.</b> Nezávislá numerická knihovna, například numpy nebo LAPACK (Linear Algebra PACKage), která přepočítá jednoznačně definovanou veličinu lineární algebry na stanovených vstupech, se počítá jako nezávislá knihovna. Knihovna musí provést rozklad, inverzi, řešení nebo krok nejmenších čtverců vlastním algoritmem, na vstupech uložených spolu s fixturou; ověřeným tvrzením je pak lineární algebra na těchto vstupech, nikoli fyzikální velikosti reprezentativního scénáře. Skript, který znovu vyhodnotí skalární uzavřený vztah aritmetikou numpy, je druhou implementací našeho vlastního kódu, nikoli P2.

seg-b7911d589f7a = Podmínky platné pro každý druh: orákulum nepíše, nespouští ani nepublikuje tento projekt (vlastní řada článků tohoto repozitáře proto na něm není nezávislá); tolerance je v testu a byla stanovena před prvním porovnáním; test podmíněný daty, který se přeskočí, když chybí jeho veřejná data, to při přeskočení oznámí.

seg-7e6057a2cad7 = Co se nepočítá

seg-80cfbb204767 = <b>Naše vlastní druhá implementace</b>: druhá cesta kódu v tomto crate (<c1/>) nebo skript v tomto repozitáři, který znovu vyhodnocuje stejný uzavřený vztah.

seg-d6efaf8399f9 = <b>Shoda s naším vlastním dřívějším výstupem</b>: goldeny, regresní zámky, snímky nebo tabulka z vlastních článků tohoto projektu.

seg-4d0365b383e5 = <b>Přepis konstant z citace</b>: kontrola koeficientu, předvolby, údaje z datasheetu nebo listu parametrů proti dokumentu, z něhož byl zkopírován.

seg-3bf8025077fb = <b>Návrhová volba</b>: alokace, váhování, práh, mez poplachu nebo reprezentativní scénář. Pro volbu neexistuje žádná vnější pravda.

seg-4f0aafd7166e = <b>Vnitřní identita</b>: číselný integrál proti vlastnímu analytickému tvaru, zpáteční převod, inverze, test vlastnosti nebo monotónnosti.

seg-4f4408e4ebab = <b>Integrační běh proti skutečnému hostiteli</b> (<c1/>): načtení pluginu do skutečného serveru Signal K nebo OpenCPN, nebo předání výstupu skutečné brány konzumentovi TCP a kontrola, že hostitel vstup přijme a ukáže očekávaný stav. Ukazuje, že instalace funguje. Hostitel není orákulem pro žádnou hodnotu, kterou integrace nese, takže není s čím externě porovnávat a takový řádek (řádek námořních integrací) je MODELLED, nikoli VALIDATED. <c2/> je samostatný druh orákula, povolený pouze u řádků MODELLED: <c3/> v <c4/> selže, pokud jej nese řádek VALIDATED, a <c5/> již vyžaduje, aby každý řádek VALIDATED byl <c6/>.

seg-a39a87c56a16 = <b>Věrohodnost na skutečných vstupech</b>: skutečná data použitá pouze jako vstup, s tvrzeními o řádové velikosti místo porovnání s vnější hodnotou.

seg-db6f5d98b4ef = Tolerance zvolená po zhlédnutí porovnání.

seg-f4f18b7549df = Jak se pravidlo vynucuje

seg-19a62c7e0aee = Každý řádek VALIDATED deklaruje v <c1/> v <c2/>, o jaký druh se opírá (Measured, Library, Reference, P1 nebo P2), nezávislý zdroj (citovaný z vlastního textu orákula řádku) a jediný test, který nese porovnání. Jednotkové testy vedle tabulky selžou, když řádek VALIDATED není deklarován nebo je deklarován dvakrát, když deklarace jmenuje řádek, který není VALIDATED, když deklarovaný zdroj není tím, který jmenuje text orákula řádku, nebo je jím sám Kshana, když deklarovaný test není tím, který řádek cituje, nebo když řádek P2 nejmenuje žádnou nezávislou numerickou knihovnu. <c3/> pak vyžaduje, aby deklarovaný test existoval na disku jako skutečný <c4/>, který není ignorován. Co stroj zkontrolovat nemůže, je, zda pojmenovaný test porovnává proti deklarovanému zdroji; to zůstává lidskému čtení. Počty podle druhů se zde nepíší: zdrojem je tabulka.

seg-e8ae3e380f40 = Stávající řádky VALIDATED znovu přezkoumané podle pravidla

seg-1dd44545a67a = Pravidlo bylo použito na stávající řádky stejně jako na budoucí povýšení.

seg-38db7b6e7053 = <b>Řádky P1 jmenované validační studií { "0.30" }, každý podložený:</b> Rozpočet jednosměrného spoje (návrhová tabulka řízení Galileo X-band JPL Pub 82-76, znovu sestavená z dílčích položek na { "4.6e-3" } dB ztráty ve volném prostoru); Uzavřené vztahy omezené pásmem pro libovolný určovací signál ({ "90.3" } procenta výkonu hlavního laloku a publikovaný koherentní jitter early-late); Maximální Doppler navigační družice na nízké oběžné dráze Země (publikované údaje Xona Pulsar X1 a Iridium); Maximální Doppler, který vidí statický uživatel z oběžné dráhy LEO nebo MEO (Tabulka { "1" } v článku o Pulsaru, { "20" } hodnot); Doppler, se kterým se musí vyrovnat pozemní přijímač od navigační družice LEO (stejné publikované údaje z letově ověřené dráhy). Každá publikace je nezávislá na Kshana, uvádí svá čísla a test stanoví svou toleranci.

seg-8e38103d05d6 = <b>Další řádky opírající se o P1, nalezené při přezkoumání, každý podložený:</b> Kompromis návrhu určovacího kódu (publikovaná zlatá křížová korelace −{ "23.9" } dB); Měsíční souřadnicový čas (Ashby a Patla { "2024" }, jejichž křížová kontrola rychlosti Měsíce proti DE440 je kontrolou Library); Uzavřené vztahy spektrální hustoty výkonu signálu v pásmu L (hodnoty Q podle Kaplana a Hegartyho); Ionosférické zpoždění prvního řádu pro každé pásmo (poměr skupinového zpoždění IS-GPS-200); Globálně průměrné váhy chyby signálu v prostoru (tabulka Montenbruck, Steigenberger a Hauschild { "2018" }).

seg-0014c53752ac = <b>Řádky P2 jmenované studií, každý podložený:</b> Fisherova informace a pozorovatelnost Cramér–Rao (numpy <c1/>/<c2/>); Identifikovatelnost měsíčního data; Spřažený měsíční rámec a měřítko časové stupnice; Autonomní potrubí pozorovatelnosti poruch ve volné síti (numpy/SciPy SVD, rozklad na singulární hodnoty). Každý přepočítá jednoznačně definovanou veličinu lineární algebry na uložených vstupech jiným algoritmem než Jacobiho řešič vlastních čísel v Kshana.

seg-e9d01633d002 = <b>Další řádky opírající se o P2, nalezené při přezkoumání, každý podložený:</b> Odvození priorit MCDA (vícekriteriální rozhodovací analýza) (vlastní vektor AHP, analytický hierarchický proces, pomocí SciPy/LAPACK; tabulka Random Index, kterou rovněž reprodukuje, je přepis a nepočítá se); Rozptyl setrvání hodin (SciPy <c1/> rozšířené matice Van Loan); Realizace měsíční referenční soustavy (řešení Umeyama pomocí numpy SVD); Beamforming CRPA (anténa s řízeným příjmovým diagramem) (komplexní řešení LAPACK); Jádro ochranných úrovní ARAIM pro Měsíc (inverze LU z RTKLIB s kvantily SciPy); Konzistence měsíčních rámců/dynamiky napříč poskytovateli (aproximace nejmenších čtverců pomocí numpy SVD tří publikovaných efemerid).

seg-1fd94e94e89d = <b>Označeno v prvním průchodu, znovu podloženo ve kole { "2" } běhu { "0.30" }.</b> Tři řádky byly označeny jako nepodložené napsaným pravidlem. Každý se nyní opírá o porovnání předregistrované před stažením jeho fixtury, takže žádný řádek není označen; jednotkový test vedle <c1/> zafixuje (nyní prázdný) seznam.

seg-3ef9479dea55 = <b>Integrita (RAIM/ARAIM/SBAS).</b> Citované testy dříve tvrdily pouze věrohodnost na skutečné geometrii IGS (Mezinárodní služba GNSS). Řádek se nyní opírá o tři knihovní orákula: separaci řešení více hypotéz ARAIM z Airborne Design Document v4.2 proti Stanford MAAST pro ARAIM { "2" } ({ "270" } skutečných případů, nejhorší rozdíl VPL { "2.2e-3" } m proti { "0.05" } m); detekci a vyloučení snapshotového RAIM proti RTKLIB <c1/> ({ "2016" } z { "2016" } rozhodnutí shodných) s ochrannou úrovní sklonu; a ochranné úrovně SBAS DO-229E L1 proti Stanford MAAST na skutečných vysíláních WAAS ({ "2868" } dvojic v rámci { "1.6e-5" } m). Řádek výslovně uvádí, že funkce s jednotnou sigmou <c2/> a <c3/> nejsou v souladu s ADD a že porovnání dvoufrekvenčního SBAS L5 je zjištění.

seg-16a4261c77ec = <b>Polohy planet napříč sluneční soustavou z keplerovských elementů JPL Standish.</b> Dodatečný práh dvojnásobku nominální chyby je nahrazen předregistrovaným prahem: RMS nejvýše hodnota z tabulky { "8.10.1" } Explanatory Supplement na planetu a složku, proti JPL Horizons DE441, s rozdělením Země a pokrytím rotace ICRF.

seg-8d5b51a942e0 = <b>Světelný čas mezi tělesy sluneční soustavy.</b> Řešič světelného času se nyní porovnává se světelnými časy Horizons v rámci { "1e-6" } s na polohách DE441, předregistrovaný práh, který nedědí práh pro polohy.

seg-e96900bc322f = <b>Řádky MODELLED, které dvě pravidla činí povýšitelnými</b> (pouze prostřednictvím běhu { "0.30" } po jednotlivých řádcích, nikdy tímto textem): podle P1 mez geolokace zdroje pomocí TDOA/FDOA (rozdíl času a frekvence příchodu), vazba relativistické rychlosti hodin na rámec, synchronizační masky ITU-T (sektor telekomunikační standardizace) (pouze pro hodnoty masek, které doporučení uvádějí jako čísla; přepsané zlomové body kontrolované samy proti sobě se nepočítají) a mez určování polohy v nepozemních sítích 5G (pouze pokud se najde publikovaná pracovní hodnota); podle P2 slepota integrity v souhlasném režimu, skalární ochranná úroveň časování MHSS (separace řešení více hypotéz) a bělení GLS (zobecněné nejmenší čtverce). Dva řádky benchmarku integrity časování (klasifikátor Stanfordova diagramu integrity a hodnotitel pokrytí integrity) jsou klasifikace založená na pravidlech, nikoli lineární algebra, takže P2 se jich netýká; potřebují nezávislý nástroj a jediný nalezený (gLAB) nese nekomerční licenci.

seg-50a08fe5918b = <b>Soulad s dřívějšími odmítnutími.</b> Kontrola Vallado u řádku okna startu by nyní podle P1 vyhověla, pokud její test počítá vytištěný pracovní příklad; plán { "0.30" } ji místo toho povyšuje přes Orekit. Tabulka průsečíků měsíčního času podle třídy hodin zůstává MODELLED: tabulka, kterou reprodukuje, pochází z vlastního článku tohoto projektu, který není nezávislý.

seg-02423542480f = Šumový člen

seg-2bd49b92f14b = Shoda odhadů Allanovy odchylky (ADEV/MDEV/TDEV/OHDEV (ADEV: Allanova odchylka; MDEV: modifikovaná Allanova odchylka; OHDEV: překrývající se Hadamardova odchylka))

seg-c429a25d17ae = Dvě kontroly proti primárnímu zdroji <b>NIST (Národní institut standardů a technologie) SP (Special Publication) { "1065" }</b> (Riley, <em>Handbook of Frequency Stability Analysis</em>, { "2008" }), obě s relativní tolerancí <b>{ "1e-4" }</b>. ({ "1" }) <c1/>: překrývající se ADEV, modifikovaná ADEV, časová odchylka a překrývající se Hadamardovy odhady reprodukují odchylky pro kanonický 10bodový datový soubor <b>NBS14</b> (<b>SP { "1065" } tabulka 29/30, s. { "107" }</b>) při tau = { "1" }, { "2" } — shoda je ve skutečnosti ~{ "1e-6" } (např. překrývající se ADEV (OADEV) při τ = { "2" }: { "85.952868" } vs { "85.95287" }). ({ "2" }) <c2/>: stejné čtyři odhady reprodukují <b>1000bodový datový soubor z SP { "1065" } §{ "12.4" }</b> (<b>tabulka { "31" }, s. { "108" }</b>) při průměrovacích faktorech { "1" } / { "10" } / { "100" }, kde je datový soubor v kódu znovu vygenerován z LCG podle SP { "1065" } (rov. { "73" }) — hermeticky, bez fixtury. Stejná data a čísla z tabulky 31 jsou regresním cílem v aewallin/allantools (<c3/>), zde reprodukovaným bez kódu třetích stran. Tím se zafixuje <em>matematika odhadů</em> proti referenci, odlišně od řádků <em>kalibrace</em> šumu níže.

seg-79e6f7d1e7f0 = Shoda odhadů Allanovy odchylky na <b>skutečném naměřeném hardwaru</b>

seg-8c72a9df2547 = <c1/>: překrývající se Allanův a překrývající se Hadamardův odhad reprodukují referenční odchylky <b>Stable32</b> pro <b>skutečný cesiový primární normál 5071A měřený proti vodíkovému maseru</b> ({ "556 990" } fázových vzorků při τ₀ = { "1" } s; { "1" } PPS (impuls za sekundu) do čítače 53230A, únor { "2014" }; sbíral A. Wallin, distribuováno s <c2/>). Zkontrolováno napříč <b>celým dekadickým žebříčkem τ ({ "16" } průměrovacích faktorů, τ = { "1" } s … { "4" }×10⁴ s)</b>: dobře vzorkované faktory s relativní bránou <b>{ "1e-3" }</b> (pozorovaná shoda je ve skutečnosti ≤ { "3e-5" }, např. OADEV({ "1" } s) { "3.317111e-10" } vs Stable32 { "3.3171e-10" }), řídké faktory při dlouhém τ musí ležet uvnitř vytištěného pásma spolehlivosti { "1" }‑σ ze Stable32. Toto doplňuje syntetickou shodu NBS14 výše o kontrolu na naměřených hodinách. Surový fázový soubor jsou data třetí strany bez licence k redistribuci, proto je ignorován gitem; <c3/> jej reprodukuje a test vypíše oznámení o přeskočení (CI (kontinuální integrace) zůstává zelená), když chybí. Uloženy jsou pouze veřejná referenční čísla Stable32 (<c4/>); nepoužívá se žádný kód třetích stran.

seg-1a7f0e741913 = Shoda odhadů Allanovy odchylky na <b>kanonickém Stable32 PHASE.DAT</b>

seg-00e382874a00 = <c1/>: překrývající se Allanův, modifikovaný Allanův a časový odhad reprodukují referenční odchylky <b>Stable32</b> pro <b>PHASE.DAT</b> — 1001bodovou řadu distribuovanou se Stable32, kterou nezávislé nástroje (např. <c2/>) používají jako svůj standardní regresní cíl — napříč <b>celým žebříčkem průměrovacích faktorů ({ "139" } faktorů)</b> s relativní bránou <b>{ "1e-3" }</b> (pozorováno ≤ { "5e-5" }). Druhá, nezávislá skutečná referenční řada vedle kontroly naměřeného cesia výše. PHASE.DAT se dodává s komerčním nástrojem Stable32, proto je surová řada ignorována gitem; <c3/> ji reprodukuje a test se přeskočí zeleně (CI zůstává zelená), když chybí. Uloženy jsou pouze veřejná referenční čísla Stable32 (<c4/>); nepoužívá se žádný kód třetích stran.

seg-9dde9e0c8055 = Stabilita optických hodin na <b>skutečné naměřené křivce</b>

seg-ea908ba3a79f = <c1/>: inverze parametrů šumu hodin (<c2/>) reprodukuje <b>publikovanou σ_y(τ) optických mřížkových hodin ⁸⁸Sr od Norcia a kol., <em>Science</em> { "366" }:{ "93" } ({ "2019" })</b> (Zenodo 10.5281/zenodo.3382347, <b>CC-BY-4.0</b> (Creative Commons Attribution { "4.0" }), křivka uložena v <c3/>): získaný koeficient bílého frekvenčního šumu √q_wf ≈ { "4.33e-16" } odpovídá krátkodobé stabilitě ≈4.7e-16/√τ z článku (~{ "10" } % RMS (střední kvadratická hodnota) přes křivku) a fit zjistí nenulovou naměřenou podlahu (q_rw > { "0" }). Tím se zafixuje <b>inverze naměřené ADEV → parametry šumu proti skutečným optickým hodinám</b>; přínos holdoveru k prahu, který je na ní postaven, zůstává MODELLED.

seg-e1e930dcd0a1 = ROC (provozní charakteristika přijímače) AUC (plocha pod křivkou) detekce anomálií na <b>skutečné telemetrii ESA (Evropská kosmická agentura) OPS-SAT</b>

seg-2b637daa985c = <c1/> (reprodukuje štítky)

seg-c667434b580d = <c1/>: na datové sadě <b>OPSSAT-AD</b> (Ruszczak a kol. { "2025" }, Zenodo 10.5281/zenodo.12588359, <b>CC BY { "4.0" }</b>) — skutečné segmenty housekeepingu OPS-SAT s pravdivými štítky anomálií — Mann–Whitneyho ROC AUC z Kshana (<c2/>) reprodukuje <b>scikit-learn <c3/></b> s přesností <b>< { "1e-9" }</b> na zadržené testovací části ({ "529" } segmentů, { "113" } anomálií), pro dvě deterministická skóre: transparentní detektor s jedním příznakem (počet vrcholů segmentu, <b>AUC ≈ { "0.851" }</b>) a skóre diagonální Mahalanobisovy vzdálenosti s 8 příznaky natrénované na normálních trénovacích segmentech (AUC ≈ { "0.556" }); <c4/> obklopuje bodový odhad intervalem, jehož dolní mez překračuje náhodu. Tím se ověřuje <b>výpočet AUC na skutečných datech ESA</b> a <b>označená separace</b> transparentního detektoru — <b>nereprodukuje</b> to nejlepší publikovanou metriku z článku OPSSAT-AD (supervizovaná FCNN (plně propojená neuronová síť), F1 ≈ { "0.95" }), která potřebuje jejich natrénovaný model. Data CC-BY uložena (<c5/>, hermeticky); orákulum znovu generuje <c6/>.

seg-5f2d41617fb2 = Syntéza funkcionálů gravitačního pole (gravitačně podporovaná / bez GNSS (GNSS: globální družicový navigační systém) navigační mapa)

seg-4c1126137428 = <c1/>: jádro funkcionálu gravitace ve sférických harmonických (<c2/> / <c3/>) — „čtečka mapy“, proti které se gravitačně podporovaný navigátor porovnává — je ověřeno proti <b>normálnímu tíhovému standardu GRS80 (Geodetic Reference System { "1980" })</b> (Moritz { "1980" }, přijatému IAG (IAG: Mezinárodní asociace geodézie)). Sestavení normálního pole GRS80 z jeho publikovaných sudých zonálních harmonických J₂…J₈ a syntéza tíže (gravitace + odstředivá) na elipsoidu reprodukuje uzavřenou <b>Somiglianovu</b> normální tíži a publikované rovníkové/polární hodnoty γ_e = { "9.7803267715" } / γ_p = { "9.8321863685" } m/s² s relativní přesností <b>{ "3.5e-12" }</b> napříč všemi šířkami (brána { "1e-9" }). Stejné jádro načítá vlajkový <b>skutečný model Země z ICGEM (Mezinárodní centrum pro globální modely Země) EGM2008 (Earth Gravitational Model { "2008" })</b> (NGA (Národní geoprostorová zpravodajská agentura) volné dílo přes ICGEM; čtečka <c4/> je také vyzkoušena na měsíčním poli GRAIL (Gravity Recovery and Interior Laboratory) v <c5/>) a vytváří fyzikálně omezenou mapu tíhové poruchy (RMS ≈ { "26" } mGal, max ≈ { "89" } mGal při d/o { "70" }). Ověřuje <b>správnost kódu syntézy</b>; <em>přesnost navigačního řešení</em> podporovaného gravitací zůstává MODELLED (neexistuje veřejná trajektorie s gravimetrem na platformě a s pravdivými daty).

seg-7dc3ff4c6eea = Edf specifické pro typ šumu (intervaly spolehlivosti)

seg-7e8a93fb2eea = <c1/>: pásmo χ² spolehlivosti u každého bodu překrývající se ADEV používá efektivní stupně volnosti specifické pro typ šumu (uzavřené vztahy z tabulky { "5" } NIST SP { "1065" } pro bílou a flicker fázovou modulaci, bílou a flicker frekvenční modulaci a náhodnou procházku frekvenční modulace (WPM/FPM/WFM/FFM/RWFM) — jednoduchá sada Stable32), přičemž typ mocninného zákona záznamu je určen ze sklonu jeho MDEV v log-log. Tři nezávislé kontroly: (a) pět vzorců reprodukuje ručně vyhodnocené hodnoty při N={ "64" },m={ "4" } na { "1e-12" }; (b) <b>soubor Monte Carlo s bílou FM (FM: frekvenční modulace)</b> ({ "4 000" } záznamů) měří skutečné edf chí-kvadrát odhadu = { "2" }·průměr²/Var(σ²) a shoduje se se vzorcem v rámci { "20" } % (a podstatně překonává konzervativní počet bez překryvu); (c) <c2/> reprodukuje vytištěné edf z <b>SP { "1065" } tabulky { "32" } (s. { "109" })</b> = { "146.177" } pro 1000bodový datový soubor při m={ "10" } (bílá FM) na { "5e-3" } a { "95" }% meze spolehlivosti z tabulky ({ "8.223942e-2" } / { "1.035201e-1" }) na <{ "0.2" } % (malá zbytková odchylka je aproximace Wilson-Hilferty pro χ² oproti přesnému χ² z NIST). Exportovaná křivka ADEV nese pro každé τ určený typ šumu, edf a { "95" }% pásmo.

seg-7048ac695b99 = Bílá FM (krátkodobá)

seg-b6982cb2ca25 = <c1/>: simulovaná překrývající se ADEV reprodukuje publikovanou sigma_y({ "1" } s) — typicky v rámci několika procent, <b>vynucená brána { "20" } %</b> (CSAC a cíl optických mřížkových hodin) — a křivku bílé FM sigma_y(tau)=sigma_y(1s)/sqrt(tau) napříč tau = { "1" }, { "10" }, { "100" } s v rámci <b>brány { "25" } %</b> (odpovídá datasheetu CSAC (čipové atomové hodiny) { "3e-10" } / { "1e-10" } / { "3e-11" }).

seg-11fc7c4b61ff = Náhodná procházka FM (dlouhodobá)

seg-1e211f342e79 = <c1/>: simulovaná ADEV odpovídá sigma_y^{ "2" }(tau)=q_rw*tau/3 (Riley NIST SP { "1065" }) s přesností ~{ "20" } % (průměrováno přes seedy).

seg-dcfca4041429 = Stárnutí / lineární drift

seg-2d5c6a44cbdb = <c1/> + vykalibrováno

seg-492f91ba2f79 = Deterministické; odhadovač holdoveru odstraňuje offset a stárnutí kvadratickým prediktorem, takže zbytek je stochastická mez. Testováno v <c1/> / <c2/>.

seg-2ea6a14cac1c = Kalmanův odhadovač + mez integrity

seg-8c8f8a5eba5a = <c1/>: dvoustavový (fáze, frekvence) filtr, jehož přesný procesní šum podle van Loana odpovídá pravdivému modelu; setrvání reprodukuje analytický rozptyl holdoveru <c2/> na { "1e-9" }. Aktualizace kovariance je v <b>Josephově stabilizovaném tvaru</b> <c3/>, který zůstává pozitivně semidefinitní (ověřeno Choleského rozkladem) po { "500" } krocích predikce/aktualizace při extrémním poměru <c4/> a shoduje se s naivním tvarem na { "1e-9" } tam, kde je ten dobře podmíněný. Vrstva běhu hlásí integritu jako podíl vzorků výpadku uvnitř ochranné meze 3 sigma (<c5/>).

seg-f332f06e80f9 = Vnitřní konzistence filtru (NIS (normalizovaný čtverec inovace) / NEES (normalizovaný čtverec chyby odhadu))

seg-333e1701b6d0 = <c1/> (model)

seg-c1304de95180 = <c1/>: hodnocení konzistence metodou Monte Carlo (Bar-Shalom §{ "5.4" }). Sdružené <b>NIS → { "1" }</b> a <b>NEES → { "2" }</b> shodného filtru leží uvnitř svých { "95" }% pásem χ² (pásmo NIS používá sdružený počet bílých inovací; pásmo NEES používá počet nezávislých běhů, protože chyby odhadu jsou v čase korelované). Test <b>proměření nesouladu Q/R</b> ověřuje, že monitor hlásí <c2/> pouze při jednotkovém naladění a <c3/> při rozladění ×0.1/×0.5/×2/×{ "10" }, přičemž NIS se mění jako ≈1/q_factor, jak bylo odvozeno. Zobrazeno jako <c4/> ve výsledku hodin v JSON (JavaScript Object Notation) a na kartě playgroundu. Pásma χ² používají kvantil Wilson–Hilferty (<c5/>, ověřeno proti tabulce).

seg-078c4009b24f = Model obousměrného přenosu času

seg-22f8cdeda335 = <c1/>: vzájemné souhlasné zpoždění se v odhadu <c2/> přesně vyruší (odvozeno ručně, přesně) a dvě jednosměrná měření se průměrují na <c3/> (průměrováno přes seedy); nevzájemné diferenční zpoždění je barevný proces bílé FM + náhodné procházky FM, jehož Allanova odchylka sleduje <c4/> (průměrováno přes seedy, ~{ "20" } %, prostřednictvím vlastního <c5/> spoje). <em>Parametry</em> (<c6/>, <c7/> pro každý spoj) jsou reprezentativní údaje TWSTFT/optického přenosu (TWSTFT: obousměrný družicový přenos času a frekvence), nikoli přizpůsobené konkrétnímu terminálu.

seg-6ab219622143 = Bezpečnost (skóre detekce spoofingu)

seg-29dd10011ed1 = <c1/>: 1-sigma práh monitoru <c2/> a z něj vyplývající minimálně detekovatelný offset <c3/>-sigma a skóre <c4/> jsou odvozeny ručně a testovány jednotkovými testy. Model (detekce podporovaná hodinami ve stylu inovace / RAIM (RAIM: autonomní monitorování integrity přijímačem)) je věcně správný; <em>parametry</em> (okno monitorování <c5/>, detekční násobitel <c6/>, šum měření <c7/>) jsou reprezentativní, nikoli přizpůsobené konkrétnímu přijímači.

seg-ca51e4f1e19c = Detekce útoku spoofingem

seg-e991f5b2fdb2 = <c1/>: narůstající spoofing falešného času je označen, když jeho offset překročí detekční mez hodin; doba detekce odpovídá ručně odvozenému <c2/> na jeden krok mřížky a hodiny, jejichž mez překračuje specifikaci, nechají spoofing dosáhnout prahu nezjištěný. Stejné upozornění <c3/> jako u skóre bezpečnosti.

seg-3d2f6d2b7722 = Flicker FM (podlaha)

seg-55697d598918 = <c1/> (ve výchozím stavu vypnuto)

seg-55000870c060 = Syntetizováno jako součet logaritmicky rozmístěných Ornsteinových–Uhlenbeckových (OU) procesů kalibrovaných na nastavitelnou plochou podlahu ADEV; <c1/> ověřuje, že podlaha je plochá napříč průměrovacím časem a leží na nastavené úrovni (průměrováno přes seedy). Zapíná se pro každé hodiny pomocí <c2/>. Citované referenční scénáře jej nechávají vypnutý: CSAC je v celém rozsahu svého datasheetu (1-1000 s) dominován bílou FM a systematická podlaha optických hodin (~{ "5e-17" }) je zastoupena jejich údajem o přesnosti.

seg-e2e3de9a61a4 = Statistiky souboru Monte Carlo

seg-9785d05ec5a7 = <c1/> (agregace)

seg-cc6c6bb5eb83 = <c1/>: percentily podle nejbližší pořadové hodnoty a průměr přes <c2/> reprodukovatelných realizací; jediný běh rozptyl zhroutí, pásmo na každý časový krok je uspořádáno <c3/> a opakované běhy jsou bitově shodné. Jde o statistickou agregaci nad již ověřeným jediným během, nikoli o nový fyzikální model.

seg-72a9d5de61f5 = sigma_y({ "1" } s)

seg-ebbe708d9cbc = csac-sa45s (CSAC)

seg-c43fe67d4200 = datasheet Microchip SA65 / SA.45s

seg-e3bde4355d78 = optical-sr-lattice (mřížka Sr)

seg-87793f684233 = stronciové optické mřížkové hodiny, cíl orientovaný na kosmos, arXiv:{ "1503.08457" }

seg-b03f5856d451 = Stav: bílá FM a náhodná procházka FM ověřeny; stárnutí modelováno a vykalibrováno; flicker FM modelována a ověřena (v citovaných scénářích ve výchozím stavu vypnuta).

seg-c5ff448dcb88 = Zralost: údaje o optických hodinách jsou <em>cílem orientovaným na kosmos</em> na pozemním hardwaru -- žádné stronciové optické hodiny dosud nelétaly. Laboratorní hodiny Sr dosahují { "4.8e-17" } (Oelker a kol. { "2019" }, Nature Photonics). Údaje CSAC pocházejí z nasazeného komerčního dílu.

seg-b59a4b8e6d88 = Vztahy: Riley, NIST SP { "1065" }, rov. { "67" } -- bílá FM sigma_y^{ "2" }(tau)=h0/({ "2" } tau); náhodná procházka FM sigma_y^{ "2" }(tau)=({ "2" } pi^2/3) h_-2 tau, rovnocenně q_rw*tau/3 pro frekvenční Wienerův proces s difuzí q_rw.

seg-dca7ee671d91 = Balíček { "2" } — inerciální dead-reckoning (kvantová inerciální měřicí jednotka)

seg-98452a081241 = Konstantní/zbytkové zkreslení -> poloha

seg-6aa386251acf = chyba polohy = { "0.5" }<em>b</em>T^{ "2" } (rodina; Groves AESS (Aerospace and Electronic Systems Society) Tutorial); ručně odvozený diskrétní test v <c1/>.

seg-c60c0b54c485 = Náhodná procházka rychlosti (bílé zrychlení)

seg-7ce1f40566cf = <c1/>: simulovaná směrodatná odchylka (SD) chyby polohy odpovídá sigma_x(T)=sqrt(S_a*T^3/3) (Groves rov. 54) s pozorovanou přesností ~{ "12" } % (průměrováno přes seedy; vynucená brána { "20" } %).

seg-8ac776795d40 = Fyzika akcelerometru s interferometrem studených atomů (CAI) (z prvních principů)

seg-4eafc81873ed = <c1/>: třípulzní Mach-Zehnderův interferometr studených atomů. Ručně ověřeno proti učebnicové geometrii — Rb-87 <c2/>; <c3/> při { "1" } g, <c4/>; projekční šum <c5/> při <c6/>, <c7/>; <c8/> na jeden výstřel; zákony škálování <c9/> a <c10/>; exponenciální pokles kontrastu. <c11/> <b>odvozuje</b> spektrální hustotu výkonu (PSD) bílého zrychlení, kterou spotřebovává klasický <c12/>. Poctivý rozsah: pouze <b>podlaha kvantového projekčního šumu</b> (zde ~{ "0.09" } ug/sqrtHz) — hluboko pod skutečnými zařízeními omezenými vibracemi (1-50 ug/sqrtHz); tenzor vibrací, Coriolisova síla a systematické vlivy světelného posunu zatím nejsou modelovány (viz <a1><c13/></a1>).

seg-ed78f40a8d80 = Zkreslení gyroskopu + náhodná procházka úhlu (ARW) -> náklon -> vazba na gravitaci

seg-a73e97ac4a0e = Zbytkové zkreslení gyroskopu a ARW způsobují chybu orientace; náklon převádí gravitaci (<c1/>) na chybu horizontální specifické síly. <c2/> přesně ověřuje kubický růst polohy při čistém zkreslení a růst chyby orientace způsobený ARW jako Wienerův proces (průměrováno přes seedy). Zapíná se pro každý senzor pomocí <c3/> a <c4/>; v citovaných scénářích jen s akcelerometry je vypnuto.

seg-e68d093e952a = Nestabilita zkreslení (podlaha flicker 1/f)

seg-5ad1e7d55d07 = <c1/>: proces flicker 1/f (stejná syntéza OU ověřená pro hodiny), jehož plochá podlaha Allanovy odchylky leží na koeficientu nestability zkreslení; nula je bez účinku, nenulová podlaha mění trajektorii, obojí reprodukovatelně. Zapíná se pro každý senzor pomocí <c2/>.

seg-b631c1bfce05 = Náhodná procházka zrychlení (náhodná procházka rychlosti změny)

seg-4a4a70363412 = <c1/>: zkreslení je Wienerův proces s <c2/>, ověřený s průměrováním přes seedy na ~{ "20" } %. Zapíná se pro každý senzor pomocí <c3/>.

seg-49c4a2532dca = Křížová validace NaveGo (koeficienty šumu IMU (inerciální měřicí jednotka))

seg-e558aa705560 = <c1/>: externí křížová kontrola proti <b>NaveGo</b> (R. Gonzalez, open-source sada nástrojů INS/GNSS (INS: inerciální navigační systém), <c2/>). Reprodukuje syntetický zpáteční test z <c3/> NaveGo na jeho <b>publikovaném referenčním profilu Microstrain 3DM-GX3-35</b>: řízením našeho (NBS14/Stable32 ověřeného) odhadu překrývající se ADEV bílým šumem senzoru na úrovních 1-σ podle NaveGo se obnoví koeficienty náhodné procházky rychlosti a úhlu (VRW, ARW) (<c4/>) s přesností <c5/> (skutečně ~{ "0.4" } %), přičemž větev bílého šumu leží na sklonu −1/2. Potvrzuje, že náš postup Allanovy odchylky a definice VRW/ARW v NaveGo se shodují. Zaznamenaný záznam STIM300 <c6/> o velikosti { "40" } MB není načítán (omezeno binárním formátem).

seg-171b215f0526 = Činitel měřítka, jemnější členy křížových os

seg-b690ed87f493 = <c1/> v tomto 1-DOF (jeden stupeň volnosti) balíčku

seg-c1bd4e24c091 = Starší jednoosý balíček nemá chybu činitele měřítka ani křížové vazby. Tříosá strapdown knihovna a balíček <c1/> modelují činitel měřítka, nesouosost, citlivost na g, kvantování a rampu rychlosti (<c2/>; viz tabulka tvrzení níže).

seg-ce2b3237acfe = stabilita zkreslení

seg-129dc6af8f10 = odmocnina PSD šumu

seg-7109e60b8c9b = cold-atom-quat (kvantové)

seg-5f5690d74918 = { "5.88e-7" } m/s^{ "2" } ({ "60" } ng, { "24" } h)

seg-8e83c799fb03 = { "22" } ug/sqrtHz = { "2.16e-4" } (m/s^{ "2" })/sqrtHz

seg-b52686064c43 = Templier a kol. { "2022" }, Science Advances (arXiv:{ "2209.13209" })

seg-09b42bed82c9 = nav-grade-quartz (klasické)

seg-fa9adbe58c2f = { "1.57e-3" } m/s^{ "2" } (~{ "160" } ug)

seg-63f64f576abc = ~{ "20" } ug/sqrtHz = { "1.96e-4" } (m/s^{ "2" })/sqrtHz

seg-8714c547449a = Honeywell QA-2000 / Groves AESS Tutorial

seg-79fc524162b5 = Poctivé zarámování: výhodou studených atomů je <b>dlouhodobá stabilita zkreslení</b> (~2600x nižší), která při dlouhém výpadku GNSS převládá přes { "0.5" }<em>b</em>T^{ "2" }. Krátkodobý šum je srovnatelný (kvantový ~{ "22" } vs. klasický ~{ "20" } ug/sqrtHz) — kvantový senzor vyhrává maraton, nikoli sprint. Zralost: akcelerometry na studených atomech jsou laboratorní/raného stadia (JRC122785), křemenné navigační třídy jsou nasazeny.

seg-e02e93f4f30a = Balíček { "3" } — přenos času (optický vs. rádiofrekvenční (RF), optický mezidružicový spoj)

seg-2b87e5f0ba7e = Bílý časový jitter -> přesnost synchronizace

seg-229295aa1f70 = <c1/>: simulovaná RMS synchronizace reprodukuje jitter spoje sigma_j; výběrový průměr se průměruje jako sigma/sqrt(N) s přesností <{ "20" } % (průměrováno přes seedy).

seg-4325ec478bca = Časování -> jednosměrné určování vzdálenosti

seg-aa7a1f463683 = vzdálenost = c * dt, c={ "299792458" } m/s; { "1" } ps = { "0.299792458" } mm (přesně, ručně odvozený test).

seg-7ad8bb95bf35 = Podlaha flicker/TDEV, zbytek vzájemnosti obousměrného přenosu

seg-5bf72778b6c2 = <c1/> (druh <c2/>): fázový šum flicker (Kasdin–Walter, plochá TDEV), denní nevzájemnost a konstantní zbytek vzájemnosti na obousměrné řadě; balíček <c3/> s bílým jitterem zůstává beze změny.

seg-dae3fa0375fe = jitter jednoho vzorku

seg-4a141a45a8ff = zdroj

seg-ee136a1d0051 = { "1" } ps ({ "1e-12" } s)

seg-c78abd60ec97 = cíl věrohodný na oběžné dráze

seg-9dfc1d4334a3 = optický mezidružicový spoj, cíl synchronizace na úrovni pikosekund; laboratorní O-TWTFT (TWTFT: obousměrný přenos času a frekvence) ~{ "1" } fs (Giorgetta { "2013" } / Deschenes { "2016" })

seg-4f3d23d83190 = { "0.5" } ns ({ "5e-10" } s)

seg-0e730e8e2237 = naměřeno v jedné relaci

seg-b9faad47d802 = TWSTFT od BIPM/PTB/NIST (BIPM: Mezinárodní úřad pro míry a váhy; PTB: Physikalisch-Technische Bundesanstalt, německý národní metrologický ústav)

seg-51e2e5782c96 = Poctivé zarámování: optický údaj je cíl synchronizace na úrovni pikosekund na oběžné dráze (nelétal). Pozemní optická laboratorní podlaha je ~{ "1" } fs (mnohem lepší); dobře zkonstruovaný mikrovlnný spoj (mikrovlnný spoj ACES (Atomic Clock Ensemble in Space) (MWL), ~{ "0.3" } ps) se může optickému vyrovnat, takže základ „RF = { "0.5" } ns“ je výslovně běžný TWSTFT. Převod na vzdálenost je jednosměrný (vzdálenost = c<em>dt); obousměrný/okružní jej půlí (vzdálenost = c</em>dt/2).

seg-5fa72f18f983 = Balíček { "4" } — hybridní fúze (vrcholový)

seg-3de12b094504 = Skládá balíček { "1" } (hodiny), balíček { "2" } (inerciální) a balíček { "3" } (přenos času) do jedné sady PNT (určování polohy, navigace a času). Sada musí udržet OBOJÍ, časování (< specifikace časování) i polohu (< specifikace polohy), v mezích; <c1/> je doba, než jedno z toho překročí mez. Volitelný optický mezidružicový spoj (ISL) pro přenos času znovu synchronizuje hodiny během výpadku (pouze podpora času — poloha se znovu nesynchronizuje, protože přenos času dává čas, nikoli polohu).

seg-4f7cd8f86565 = Aspekt

seg-19deb2a3537c = Kombinované hodnocení PNT (časování A poloha)

seg-77a7595ffad7 = <c1/> ručně odvozený test <c2/> (pnt_holdover = první z časování/polohy, který mez překročí).

seg-d0e39bf123d8 = Integrita + bezpečnost pro hybridní balíček

seg-3fb63eb2b6b8 = <c1/>: Kalmanův odhadovač času disciplinovaný k pravdě (nominálně) a znovu ukotvený při každé optické resynchronizaci; integrita je zahrnutí do ochranné meze (mez zahrnuje podlahu jitteru spoje), bezpečnost je skóre detekce spoofingu. Testováno pro obě sady včetně případu s podporou spoje.

seg-c3be96b7cb41 = Společný fúzní odhadovač

seg-e9d5448ea06c = <c1/>: jediný společný Kalmanův filtr ([fáze, frekv.] ⊕ [pol., rychl.]) je navigátorem, disciplinovaným GNSS (učí se offsety z nenulové počáteční kovariance) a podporovaným přenosem času; společná kovariance dává společnou integritu, která je testována jako spolehlivá (≥{ "0.9" }) pro obě sady se senzory konzistentními v šumu. Balíček sleduje polohu a čas <b>odděleně</b>, pro což je optimální filtr blokově diagonální; odhad konstantního zkreslení v rozšířeném stavu a dynamická vzájemná podpora jsou budoucí práce.

seg-915ec766439f = Spřažený filtr hodin + polohy (kovariance mezi bloky)

seg-fd718a51859a = <c1/>: jediný skládaný Kalmanův filtr <c2/> (aktualizace v Josephově tvaru), jehož měření <b>pseudovzdálenosti</b> <c3/> spojuje bloky polohy a hodin. Testy: sdílená pseudovzdálenost činí <c4/> nenulovou (oddělené filtry ji drží přesně na { "0" }); dvě odlišné geometrie společně rozliší vložené offsety polohy a hodin, které jedna vzdálenost oddělit nedokáže; oprava pouze <b>hodin</b> zpřesní <b>polohu</b> prostřednictvím křížové kovariance (přínos, který spřažení poskytuje a oddělené filtry ne); a <b>NEES z Monte Carlo je konzistentní s χ²({ "4" })</b> (Bar-Shalom §{ "5.4" }, pásmo založené na bězích). 1-DOF (rozměrnost balíčku); zatím není zapojeno do spustitelného balíčku a 3D rozšíření na 8 stavů je budoucí práce.

seg-31ecf062b941 = Složení z ověřených dílčích modelů

seg-9b849cb4fe8d = zdědí

seg-4e1c8b6791f3 = členy hodin/inerciální/přenosu času jsou ověřeny ve svých vlastních balíčcích.

seg-b672e5499976 = Volně vázané GNSS/INS (balíček <c1/>)

seg-277425f2cbcf = <c1/>: 15stavový chybový EKF (δp, δv, ψ, zkreslení akcelerometru/gyroskopu; Groves §{ "14" }) řídí tříosý strapdown navigátor se zpětnou vazbou. Testy: vložená chyba polohy se při dokonalé podpoře pravdou vynuluje; podporované řešení zůstává omezeno na metry, zatímco volně běžící INS se rozbíhá za { "100" } m; a fúzovaná poloha RMS během výpadku { "60" } s překoná nepodporovaný dead-reckoning o mez testu souboru (~{ "4" }×, měřeno před { "0.27.3" }; rozdíl je po níže uvedené opravě větší). Vazba zkreslení gyroskopu je kontrolována proti samotnému strapdownu: známé zbytkové zkreslení gyroskopu musí vytvořit chybu orientace, kterou filtr předpovídá (<c2/>), a široký apriorní odhad se musí naučit zkreslení gyroskopu třídy řadiče letu a zůstat omezený; oba selžou při znaménku před 0.27.3. <b>Revidováno ve { "0.27.3" }:</b> tato vazba měla chybné znaménko, takže odhady zkreslení gyroskopu tlačily špatným směrem a balíček stabilizoval jen těsný apriorní odhad; publikované údaje o výpadku se změnily (CHANGELOG, Fixed). Poctivá mez: u volně vázaného systému jsou zkreslení akcelerometru a náklon slabě oddělitelné, proto se kalibrace jednotlivých zkreslení netvrdí.

seg-1c9a9f76a432 = Těsně vázané GNSS/INS (pseudovzdálenost)

seg-b4ccc12229c4 = <c1/> + <c2/> <c3/>: inovace se tvoří v oblasti vzdáleností (Jacobián přímé viditelnosti na δp). Testy: čtyři družice vynulují vloženou horizontální chybu { "8" } m/−{ "5" } m na < { "0.1" } m; <b>dvě družice</b> (řešení polohy, rychlosti a času (PVT) není možné) přesto sníží horizontální chybu o > { "5" }×; jediná družice v zenitu pozoruje pouze složku podél přímé viditelnosti (vertikální) a horizontální nechává nedotčenou; nesprávně utvořené vstupy jsou odmítnuty. Pouze pseudovzdálenost — fáze nosné a explicitní stav hodin přijímače jsou v plánu.

seg-240b681b6021 = Věrnost vzájemné podpory senzorů (úplná fúze Kalman/faktorový graf)

seg-efe7e288276b = <c1/> v balíčku <c2/>

seg-e5371874c57d = Hybridní balíček je skladba na úrovni systému + podpora časem, nikoli optimální odhadovač. Filtry existují jinde: volně i těsně vázaný EKF (rozšířený Kalmanův filtr) v balíčku <c1/> (řádky výše) a 17stavový UKF (nevonný Kalmanův filtr) druhu <c2/>. Žádný vyhlazovač s faktorovým grafem není modelován.

seg-189758709fd2 = Výsledek: čistě kvantová sada drží plné PNT po celý výpadek { "1.8" } h; čistě klasická sada je <b>omezena polohou</b> (IMU navigační třídy překročí mez jako první). Optický přenos času mezidružicovým spojem drží zachycené i klasické HODINY, čímž vyčleňuje inerciální senzor jako slabý článek klasické sady — jádro argumentu pro kvantovou inerciální techniku a optické časování dohromady.

seg-a4c5b45ea8a5 = Geometrie — dostupnost GNSS z oběžných drah

seg-d347bb63c1fd = Kruhová propagace dvou těles

seg-60c369fbbd97 = <c1/>: perioda <c2/> (mu = { "3.986004418e14" }), poloha se vrací po jedné periodě, rovníková/polární rovinnost — ručně odvozené testy.

seg-1260a2fef95f = Excentrická (keplerovská) propagace

seg-49df9d526f9c = <c1/>: Keplerova rovnice <c2/> řešená Newtonovou metodou (reziduum < { "1e-12" }); poloměry perigea/apogea <c3/>; kruhový případ se shoduje s uzavřenou cestou na { "1e-9" }.

seg-958f03424508 = Sekulární drift uzlu/apsid vlivem J2

seg-336b9581c47c = <c1/>: <c2/>, <c3/> (Vallado); uzel couvá (prográdní) / postupuje (retrográdní) / je stacionární (polární) a apsidy zamrznou při kritické inklinaci { "63.4" } stupně — ručně odvozené testy znaménka/nuly. Pouze dvě tělesa + sekulární, nikoli oskulační.

seg-dcba8d368326 = Přímá viditelnost (zákryt Zemí + elevační maska)

seg-2eee9a8f894b = Antipodální družice zakryta, radiálně ven směřující družice v elevaci { "90" } stupňů, tečná družice na obzoru — přesné ručně odvozené testy.

seg-f251c75eb367 = Viditelnost -> stav GNSS -> časová osa

seg-70fbb9f3cc2b = <c1/> viditelné = nominální, 1-3 zhoršené, { "0" } odepřeno; generátor Walker-delta; integrační test řídí běh holdoveru hodin z odvozené časové osy.

seg-988d3fedb7f5 = Optimalizátor návrhu konstelace + geometrie streets-of-coverage

seg-2a636487a4e6 = <c1/>: <c2/> prohledává mřížku <c3/> a vrací buňku, která nejlépe splňuje <c4/> (nejméně družic pro cíl pokrytí / maximální pokrytí / minimální nejhorší PDOP (PDOP: faktor zhoršení přesnosti polohy)) — test ověřuje, že výběr se rovná nezávislému hrubému prohledání téhož proměření, a pracovní příklad potvrzuje, že návrh GPS (Global Positioning System) Walker 24/6/1 pokrývá alespoň stejně dobře jako zředěný návrh s 18 družicemi. Analytické uzavřené tvary <b>streets-of-coverage</b> (<c5/> <c6/>; <c7/> <c8/>, Rider/Beste) jsou ručně ověřeny proti učebnicové geometrii (GPS při masce { "5" }°: λ ≈ { "71.16" }°, poloviční šířka ulice pro 4 družice ≈ { "62.83" }°) a zjišťují mezeru z nedostatečného obsazení (<c9/>). Úplný Riderův řešitel minimálního počtu družic pro <em>globální</em> pokrytí (počet rovin citlivý na švy) zatím není implementován.

seg-a1c1364cc45a = Faktor zhoršení přesnosti (GDOP/PDOP/HDOP/VDOP/TDOP (GDOP: geometrický faktor zhoršení přesnosti; HDOP: horizontální faktor zhoršení přesnosti; VDOP: vertikální faktor zhoršení přesnosti; TDOP: časový faktor zhoršení přesnosti)) -> přesnost polohy

seg-a1706d47f895 = <c1/>: <c2/> z návrhové matice přímé viditelnosti. <b>Externí orákulum</b> (<c3/>): pět faktorů DOP reprodukuje ty, které vypočetla <b>gnss_lib_py { "1.0.4" }</b> (Stanford NAV Lab — nezávislá, recenzovaná knihovna GNSS, použitá zde tak, jako se pro soustavy používá ERFA (Essential Routines for Fundamental Astronomy)) napříč <b>{ "8" } geometriemi</b> od dobře podmíněných po téměř singulární (DOP v řádu stovek), s relativní přesností <b>{ "1e-6" }</b>; původ a regenerace v <c4/>. Jako další kontrola v uzavřeném tvaru reprodukuje geometrie pravidelného čtyřstěnu analytické hodnoty DOP (PDOP { "1.5" }, TDOP { "0.5" }, GDOP √{ "2.5" }, HDOP √{ "1.5" }, VDOP √{ "0.75" }) na { "1e-9" }. Sigma polohy = PDOP × ekvivalentní chyba měření vzdálenosti uživatele.

seg-504d5aa92cbc = Chyba polohy = σ_UERE × DOP pro vlastní řešení nejmenších čtverců enginu

seg-fc3443210358 = <c1/>, <c2/>: seedované Monte Carlo (N = { "20,000" } epoch na geometrii, σ = { "1.5" } m, seed ChaCha8 { "36" } + i) <c3/> s jednotkovými vahami, řešené z pravdivé polohy, na <b>{ "8" } geometriích <c4/></b> (těch, jejichž DOP je shodný s gnss_lib_py), proti σ²·Q, kde Q je kovarianční faktor samotného jádra <c5/> (<c6/>, stejná aritmetika). <b>Tolerance předregistrované</b> (commit e50c88d2, před prvním během, podle návrhové poznámky ke geometrii { "0.36" }, část { "5.2" }), každá jako počet směrodatných chyb: rozptyly východ, sever, nahoru a hodin v rámci { "5" } %; RMS H/V/P v rámci { "2.5" } %; korelace východ–sever v rámci { "0.035" }; střední hodnoty v rámci { "5" } směrodatných chyb; podíl { "95" }% horizontální elipsy v rámci { "0.95" } ± { "0.0077" }. První běh: všech { "104" } kontrol projde (nejhorší rozptyl { "3.2" } %, RMS { "1.6" } %, korelace { "0.012" }, střední hodnota { "2.2" } směrodatné chyby, elipsa { "0.0039" }). <b>Negativní kontroly</b> selžou, jak je požadováno: zdvojnásobený PDOP selže na každé geometrii; chyby rostoucí jako 1/sin(elevace) proti nevážené Q selžou na kontrole rozptylu u každé geometrie, jejíž nejnižší družice je pod { "20" }°. <b>Jak se skládá s řádkem výše:</b> tento řádek ověřuje DOP těchto geometrií proti gnss_lib_py; tento přidává krok od těchto faktorů k metrům prostřednictvím řešiče enginu. <b>První samostatná kontrola je ponechána vedle něj</b> (<c7/>, <c8/>, spuštěna před předregistrací a tak uvedena): čtyři ručně zvolené oblohy (otevřená, shluková, kaňon, poloviční obloha; σ { "1" } m) s intervaly spolehlivosti chí-kvadrát při celkových { "1e-6" } na { "20" } kontrol; poměry { "0.987" } až { "1.009" } a vlastní negativní kontroly (chyba DOP { "10" } %, chyby 1/sin(elevace)) selžou, jak je požadováno. <b>Proč MODELLED:</b> žádný externí soubor dat; neukazuje, že chyba skutečného přijímače sleduje model, a σ_UERE je vstup.

seg-94bffbd8385b = Dostupnost při více konstelacích

seg-a40eab03bbbe = <c1/>: další <c2/> jsou sloučeny do jedné sady družic pro viditelnost/DOP; test sloučeného počtu potvrzuje sjednocení.

seg-0b905100d91c = Vysílaná ionosféra (Klobuchar, IS-GPS-200 (IS: Interface Specification)) → šikmé zpoždění L1

seg-05e278f04770 = <c1/>: <c2/>, osmikoeficientní vysílaný jednofrekvenční model. <b>Externí orákulum</b> (<c3/>): šikmé zpoždění L1 reprodukuje <b><c4/> z RTKLIB (open-source knihovna pro kinematické určování polohy v reálném čase)</b> (tomojitakasu/RTKLIB, <c5/> — de facto otevřená reference GNSS, přeložená ze zdrojů a spuštěná nezávisle) napříč <b>{ "10" } případy</b> pokrývajícími elevaci, azimut, místní čas a dvě sady koeficientů (výchozí z kshana + z RTKLIB), s přesností <b>< { "1e-4" } m</b>. Čtečka map TEC (TEC: celkový obsah elektronů) IONEX (IONosphere map EXchange format) pro soubory GIM (globální ionosférická mapa) nyní existuje (<c6/>, <c7/> s bilineární prostorovou a časovou interpolací a šikmým mapováním, testovaná jednotkově v crate); křížová kontrola této interpolace proti skutečnému produktu GIM z CODE (Center for Orbit Determination in Europe) je stále navazující práce. Samotný vysílaný model je vnějšně ověřen.
