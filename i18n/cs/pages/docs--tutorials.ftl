# docs--tutorials: translations (cs)

seg-501402fc366f = Holdover hodin

seg-cae10fb9bff8 = Scénář

seg-a0b63210b807 = Číst dále

seg-835df2d05f2a = Měřicí doména GNSS

seg-3a0e724a8a2b = Úroveň

seg-28e87f407a10 = Oblast

seg-d6476863f862 = Schopnost

seg-a7cfe6f135f1 = Oběžná dráha a geometrie

seg-b03d56f501c3 = Druh

seg-029de6b99be0 = Inerciální výpočet polohy z pohybu

seg-9ef8f99ca6e4 = Přenos času

seg-ec26df467b88 = Společná Kalmanova fúze senzorů PNT nad týmiž hybridními vstupy.

seg-4f19d4fb1341 = Obecný N-rozměrný průchod libovolným balíčkem přes klíče TOML s tečkami / cesty metrik JSON.

seg-e7ab7b55c969 = 1-D průchod obchodní studie parametrem balíčku hodin.

seg-e43910de5fd8 = Notebooky

seg-d78822583c64 = Notebook

seg-3959aefa12be = Zdroj: <c1/>

seg-a5ebe4befda8 = Praktické pracovní příklady, které vás provedou od „spusťte dodaný scénář“ k „vyčíslete a obhajte výsledek“. Každé číslo uvedené ve třech tutoriálech je skutečným výstupem enginu, ukotveným k externímu (nekruhovému) směrodatnému orákulu a <b>zafixovaným integračním testem</b> (<c1/>), takže tutoriál se nikdy nemůže tiše odchýlit od toho, co engine skutečně dělá. Pokud tutoriál říká, že optické hodiny drží { "6600" } s, test shodí sestavení v den, kdy to přestane platit.

seg-1c045624a6be = Kshana je simulátor určování polohy, navigace a času (PNT). Tutoriály používají několik dalších zkratek, každá je rozepsána tam, kde se poprvé objeví: GNSS (globální družicový navigační systém), GPS (Global Positioning System), CLI (rozhraní příkazového řádku) a TOML (Tom's Obvious Minimal Language, formát souborů scénářů).

seg-7a84a80b57d5 = Jste v projektu noví? Přečtěte si nejprve <a1>úvodní přehled pojmů</a1> a <a2>slovník</a2> a pak se vraťte.

seg-b4cd44590347 = Tři pracovní příklady

seg-eebeab9693b2 = Tutoriál

seg-a0bc6e585d71 = Co se naučíte

seg-b6cc01b76947 = Druh scénáře

seg-429bab0a0e05 = Obtížnost

seg-0e188f9c0f65 = ~Čas

seg-bcf40448e55d = Moje první oběžná dráha: kde jsou družice GPS

seg-de1032024a69 = propagovat skutečnou konstelaci GPS, přečíst dostupnost, faktor zhoršení přesnosti polohy (PDOP) a přesnost polohy a exportovat, kde družice skutečně jsou (formát přesných drah SP3)

seg-e7b6c262333e = začátečník

seg-d6042fb74a5f = { "15" } min

seg-07a8d6cfc1ae = Holdover hodin: jak dlouho lze setrvat

seg-0e9c77468fb2 = spustit holdover hodin bez GNSS, přečíst ukazatel kvality časování a pochopit zákon růstu √(q_wf·T), který za ním stojí

seg-0f6fba31626a = { "20" } min

seg-7973e9c54366 = Kvantová a klasická odolnost GNSS

seg-4d8036091b37 = vrcholový tutoriál: detektor spoofingu (<c1/>) a úplná fúzní sada PNT (<c2/>) a jak číst bezpečnost, integritu a dead-reckoning společně

seg-1b39d4927602 = pokročilejší

seg-ea37ac575235 = { "35" } min

seg-1d56222dfd25 = Spustitelné notebooky Jupyter, na syntetických datech a veřejných sadách elementů uložených pouze v repozitáři, jsou v <a1><c1/></a1>:

seg-9aae3a4e10dc = Důvěra na plavidle a trénink

seg-1d680d635c6d = vygenerovat syntetický proud NMEA z můstku se scénářovanou událostí a ohodnotit jej monitory důvěry plavidla (poradní, nikoli typově schválené navigační zařízení)

seg-739f8f5a9082 = kde navigační data vypadala zhoršeně a jak velké části trasy se to týká

seg-443c908ff49b = Mapování compliance a export pro testovací bench

seg-0d639065192a = jaké řádky veřejných rámců sada běhů podporuje důkazy pro (supports evidence for) (nikdy že je rámec splněn) a pohyb a události scénáře exportované jako text pro laboratorní simulátor GNSS (nezapisuje se žádný signál)

seg-981a3238794d = Kvantové a klasické GDOP

seg-228ce150ee80 = stejná geometrie konstelace s kvantovým a klasickým senzorem, porovnaná podle faktoru zhoršení přesnosti

seg-4b82b5edd4ff = Geometrie oblohy pod skylinou

seg-1186b6cd6149 = družice, které místo vidí pod skylinou ulice nebo nábřeží, jejich DOP a chybová elipsa, datovaná obloha ze sad elementů a seedované Monte Carlo proti kovarianci (MODELLED)

seg-d9d06cb8e237 = Jak spustit tutoriál

seg-ffc4ddfc9426 = Každý tutoriál spouští stejný scénář třemi způsoby; vyberte si, který vám vyhovuje. Všechny volají <em>jediný</em> engine, takže čísla jsou shodná (odpovídá části <a1>Usage</a1> v README).

seg-e7ba76a06aa6 = <b>Příkazový řádek.</b> CLI rozlišuje podle pole <c1/> ve scénáři a zapisuje <c2/>, <c3/>, <c4/> a <c5/> vedle vstupu (JSON je JavaScript Object Notation, SVG Scalable Vector Graphics, HTML HyperText Markup Language). Několik druhů publikuje také tabulku reprodukovatelnosti jako <c6/> (hodnoty oddělené čárkami): <c7/>, <c8/>, <c9/>, <c10/>, <c11/> a <c12/>, je-li nastaveno místo exportu. Žádný ze tří tutoriálů mezi ně nepatří, takže tento soubor zde neuvidíte.

seg-5ee6f15d3b08 = <c1/> sestaví CLI z tohoto checkoutu. S nainstalovanou binárkou (<c2/>) je stejný příkaz <c3/>. Bez checkoutu je většina dodaných scénářů součástí binárky: <c4/> je vypíše (a pojmenuje těch několik, které součástí nejsou, s důvodem) a <c5/> jeden zapíše: kopii <c6/>, se kterou byla binárka sestavena.

seg-1b7e851749d5 = <b>Python.</b> Jednou sestavte rozšíření z tohoto checkoutu pomocí maturin v aktivním virtuálním prostředí a poté zavolejte <c1/>:

seg-3aa10d551694 = <c1/> nainstaluje místo toho publikovaný wheel. Ten může zaostávat za tímto checkoutem: <c2/> vám řekne, které druhy scénářů vaše sestavení má.

seg-333b7956b06b = <b>Playground v prohlížeči.</b> Bez instalace: otevřete <a1>Studio</a1>, zvolte scénář, upravte parametry a přečtěte si výsledek. Nic se nenahrává; engine běží na straně klienta jako WebAssembly.

seg-2cd8bbd1e7f0 = Tutoriály uvádějí <b>CLI</b>, ale každý příkaz má výše uvedený ekvivalent v Pythonu a playgroundu. Každý výsledek je reprodukovatelný z <c1/>: spusťte jej dvakrát a dostanete bitově shodný výstup.

seg-d497caeb889a = Okomentované výukové scénáře

seg-c966709a600d = Pro každou schopnostní doménu existuje jeden silně okomentovaný soubor <c1/> v <a1><c2/></a1>: <em>výuková kopie</em> kanonického scénáře s každým polem vysvětleným přímo v něm, pojmenovaným citovaným orákulem a očekávaným jednořádkovým shrnutím zaznamenaným jako komentář <c3/>. Hodnoty polí jsou shodné s nadřazeným scénářem v nejvyšším adresáři <c4/> repozitáře (<c5/> porovnává zpracovaný TOML), takže zdokumentovaný výstup zůstává pravdivý. Zlaté hashe zůstávají rovněž nedotčeny: komentář nikdy nezmění hash scénáře.

seg-871fcecc5ee1 = Výukový soubor

seg-4e852a6a1581 = Odvozeno z

seg-e74e1c9b387e = Integrita (RAIM, autonomní monitorování integrity přijímačem)

seg-95b6cceb76e6 = Bezpečnost (spoofing)

seg-dab48471c270 = Hybridní PNT

seg-c889e5e77121 = Výukový soubor pro <b>bezpečnost</b> uvnitř používá <c1/>: ukazatel kvality bezpečnosti (<c2/>, jedna minus pravděpodobnost nezachycené události) vytváří balíček spoof. Název souboru se řídí <em>schopností</em> (bezpečnost), <c3/> se řídí <em>balíčkem</em> (spoof). Hlavička tohoto souboru na to upozorňuje.

seg-89fef83a9d54 = Úplný katalog druhů scénářů

seg-0f744a3a7193 = Holdover hodin vůči specifikaci; volitelný soubor Monte Carlo (<c1/>).

seg-9a2564fdc86a = 1-DOF (jeden stupeň volnosti) inerciální dead-reckoning během výpadku GNSS.

seg-62f0400581b3 = Dostupnost GNSS + faktor zhoršení přesnosti (DOP) z konstelace (Walker / dvouřádkové elementy / RINEX, Receiver Independent Exchange format).

seg-59fc8330ba12 = Snapshot / separace řešení / ARAIM (pokročilý RAIM) s horizontálními a vertikálními ochrannými úrovněmi (HPL/VPL) + Stanfordský diagram.

seg-22c598d57e77 = Průlet ARAIM s ochrannými úrovněmi na jižním pólu Měsíce proti sadě relé LunaNet.

seg-f97d8fb3b6fa = Optický vs. rádiofrekvenční (RF) obousměrný přenos času/frekvence.

seg-8af1c652d854 = Vrcholový hybridní PNT: hodiny + inerciální měřicí jednotka (IMU) + podpora přenosem času.

seg-d24a9596f53e = Volně a těsně vázaný rozšířený Kalmanův filtr chybového stavu GNSS/INS (inerciální navigační systém).

seg-3c915870476a = Simulace pseudovzdáleností v měřicí oblasti (ionosféra Klobuchar, troposféra Saastamoinen/Niell) + RAIM.

seg-72284bad54e4 = Rozpočet spoje při rušení: poměr rušení k signálu (J/S) → efektivní hustota nosné k šumu (C/N₀) → ztráta zachycení.

seg-2ead4d42b427 = Stochastický detektor časového spoofingu (Neyman–Pearson / χ²₁) s pravděpodobnostmi falešného poplachu a nezachycené události z Monte Carlo (P_fa/P_md).

seg-5f2f9e63093a = Za hranicemi tutoriálů: novější schopnosti

seg-3d6a8fd31402 = Tři tutoriály zůstávají u klasických balíčků hodin, oběžné dráhy a bezpečnosti. Engine od té doby výrazně vyrostl. Každý řádek níže je dodaný scénář, který můžete spustit tak, jak je (<c1/> nebo <c2/>); shrnutí je první řádek, který kshana { "0.35.0" } pro něj vypsala dne 2026-10-10. Na rozdíl od údajů v tutoriálech jsou tyto řádky záznamem jednoho běhu a nejsou zafixovány <c3/>: pro aktuální hodnotu scénář spusťte znovu. Výsledky uvádějí vlastní rozsah (většina nese <c4/>) a <a1>verifikační matice</a1> uvádí, které schopnosti jsou VALIDATED proti vnějšímu orákulu a které MODELLED.

seg-2dc1d8680abb = První řádek shrnutí

seg-abd799395f27 = Spektrum pásma L a vodopád rušení

seg-33453b2cfdf3 = Sluneční soustava v jedné epoše

seg-23bc4ff7f741 = Určování polohy kolem jiného tělesa

seg-c135b151e469 = Návrh konstelace ve velkém měřítku

seg-065995e9bd5e = Kampaně: druhy řetězené na jedné časové ose

seg-dbae357e7e34 = Jeden systém LEO-PNT od začátku do konce

seg-9d3d72ea03df = Fúzované určování polohy MEO + LEO

seg-acc2793d1721 = Signály LEO, průlety a navigační zprávy

seg-db2626e54a24 = <c1/> (průlet)

seg-319ddeeb8205 = <a1>LEO-SIGNAL.md</a1>, <a2>LEO-PASS.md</a2>, <a3>LEO-NAVMSG.md</a3>

seg-aa93235e8c6d = Konvergence PPP s vrstvou LEO; určování polohy 5G

seg-01160980ce50 = Odolnost: GNSS rušeno, uživatele nese LEO

seg-adf8453bc035 = Vertikály: železnice, námořní doprava, telekomunikace, vozidla, Arktida

seg-15a5098b5045 = <c1/> (a další soubory <c2/>)

seg-e6494ed83ee3 = Telekomunikační holdover vůči limitům hodin ITU-T (Mezinárodní telekomunikační unie, sektor telekomunikační standardizace) G.8272

seg-dfc04f1abe82 = LEO je nízká oběžná dráha Země a MEO střední oběžná dráha Země; PVT je poloha, rychlost a čas; PPP je přesné bodové určování polohy; 5G je pátá generace mobilního standardu; TDB je barycentrický dynamický čas; JD je juliánské datum; TE je časová chyba.

seg-1d45d94f2e5b = CLI přidává ke každému běhu tři výstupy:

seg-893276648fec = <b>Zprávy.</b> Každý běh zapisuje <c1/> a <c2/> (viz <a1>REPORTS.md</a1>). <c3/> spustí sadu scénářů do jednoho <c4/> a <c5/>, například <c6/>.

seg-e9f06d47c82c = <c1/> vykreslí časové řady běhu, například <c2/> na <c3/> zapíše <c4/>. Druh bez vzorkované časové osy (například <c5/>) je odmítnut s chybou; viz <a1>ANIMATION.md</a1>.

seg-f037fe5d7ffa = Exporty pro interoperabilitu.

seg-3977722b8517 = <c1/> zapíše výsledek pro jiné nástroje: CZML (Cesium Language), KML (Keyhole Markup Language, pro Google Earth), GeoJSON (geografický JSON), efemeridy STK (Systems Tool Kit) nebo záznam SigMF (Signal Metadata Format). <c2/> říká, které formáty se na scénář vztahují; SigMF se vztahuje pouze na <c3/>. Balíček oběžné dráhy také exportuje <c4/>, <c5/> a <c6/> (zprávy o oběžné dráze CCSDS, Poradní výbor pro kosmické datové systémy). Viz <a1>INTEROP.md</a1>.

seg-3abd51182cc0 = Odstupňovaná cvičení

seg-9513af4fb862 = Projděte si žebříček. Každá úroveň je těžší a lépe obhajitelná než předchozí; referenční řešení jsou v <a1><c1/></a1>.

seg-89ad8eb64a54 = Cíl

seg-0a824838ef57 = Co děláte

seg-2463a86470b8 = Referenční řešení

seg-7ce3ac2347b9 = Úroveň { "1" } — spustit a přečíst

seg-e1dee35aedff = spustit dodaný scénář beze změny a přečíst jeden ukazatel kvality

seg-296694716b3b = Spusťte <c1/>; vypište <c2/> pro kvantové a klasické hodiny. CLI, playground nebo jednořádkové volání Pythonu.

seg-bad6d3afb6a0 = Úroveň { "2" } — upravit a proměřit

seg-c18da238e470 = změnit jeden parametr a sledovat monotónní účinek

seg-598ca8efea83 = Zpřísněte specifikaci hodin (<c1/>) nebo prodlužte výpadek a sledujte, jak holdover klesá; nebo k vytvoření tabulky použijte <c2/>/<c3/>.

seg-1d9dfecce6fa = Úroveň { "3" } — vyčíslit a obhájit

seg-5b57f2c8ffb9 = Monte Carlo, pásma spolehlivosti, reprodukovatelnost a ochranná úroveň

seg-0fac2036b289 = Spusťte soubor hodin (<c1/>), přečtěte pásmo [p05–p95], ověřte, že dva běhy dávají shodný <c2/>, a přečtěte si výsledek integrity / Stanfordova diagramu.

seg-45dc753da682 = Referenční řešení používají rozšíření Pythonu (nejprve <c1/>). Spuštěno z kořene repozitáře, <c2/> vypíše pokles holdoveru čipových atomových hodin z { "2610" } s při specifikaci { "20" } ns na { "1140" } s při { "5" } ns.

seg-e59b1beadb98 = Chcete čerstvá data?

seg-530db2e609d0 = Úvodní čísla v těchto tutoriálech běží výhradně ze scénářů, které již jsou v repozitáři. Nic se nestahuje, a právě proto jsou reprodukovatelná a bezpečná ke spouštění v kontinuální integraci (CI). Pro cvičení „rozšiřte to“ můžete stáhnout živá data:

seg-6a20ec96cb92 = <b>Dvouřádkové elementy GPS (TLE)</b> (obnovení konstelace oběžné dráhy): <a1>https://celestrak.org/NORAD/elements/gp.php?GROUP=gps-ops&FORMAT=tle</a1>, textové 3řádkové sady elementů (název + řádek { "1" } + řádek { "2" }). Pomocník: <c1/>. Otevřená data (katalog 18. eskadry kosmické obrany Vesmírných sil USA, redistribuovaný Celestrakem, Dr T. S. Kelso).

seg-9bcea1d9eb12 = <b>Ověřovací orákulum SGP4 (Simplified General Perturbations { "4" })</b> (již součástí repozitáře, nestahujte znovu): testovací vektory AIAA (Americký institut pro letectví a kosmonautiku) 2006-6753 „Revisiting Spacetrack Report #3“, <a1>https://celestrak.org/publications/AIAA/2006-6753/</a1>, používané <c1/>; viz <a2><c2/></a2>.

seg-d33aa34b2762 = <b>Orákulum vztahů stability hodin</b>: NIST (Národní institut standardů a technologie) Special Publication { "1065" } (Riley, <em>Handbook of Frequency Stability Analysis</em>), <a1>https://tf.nist.gov/general/pdf/2220.pdf</a1>, vztahy σ_y(τ)↔fáze za Tutoriálem { "2" }.

seg-36be39f17e35 = <s1>Předchozí</s1>Průvodce Studiem

seg-6f6204737a87 = <s1>Další</s1>{ "1" } · Vaše první oběžná dráha

seg-2fa9e002b3a2 = Engine rozlišuje podle <c1/> scénáře. Tabulka níže uvádí nejčastěji používané druhy (osm výše uvedených tutoriálových domén a jejich nejbližší sousedy). <b>Není</b> to úplná množina: <c2/> vrací všech <c3/> vestavěných druhů. Tato funkce (zpřístupněná jako <c4/> ve vazbách Pythonu a WebAssembly (WASM) a jako <c5/> na příkazovém řádku) je směrodatným, vždy aktuálním katalogem a <a1><c6/></a1> je její generovaný výčet, jedna sekce na druh s povinnými a volitelnými poli TOML. <c7/> vynucuje, aby každý druh, který tutoriál dokumentuje, byl skutečným druhem rozlišení, takže tato tabulka nemůže uvádět druh, který neexistuje.
