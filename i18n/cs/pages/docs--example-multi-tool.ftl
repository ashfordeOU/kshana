# docs--example-multi-tool: translations (cs)

seg-077d900655af = Zdroj: <c1/>

seg-42e93cd44e94 = Vypracovaný příklad — Kshana jako spojovací vrstva pro analýzu mise pomocí více nástrojů

seg-286cf0e7bb71 = Tento příklad provede jednu trajektorii druhy scénářů pro interoperabilitu založenou na standardech a analýzu mise od začátku do konce a ukazuje, jak Kshana stojí <em>mezi</em> špičkovými nástroji, které program už používá, místo aby s nimi soutěžila: GMAT (General Mission Analysis Tool), Orekit a STK (Systems Tool Kit) pro návrh trajektorie a Basilisk nebo { "42" } pro simulaci systému řízení polohy a dráhy (AOCS). Každý krok je spustitelný druh scénáře a každý výsledek nese <c1/> uvádějící jeho rozsah a úroveň důkazů.

seg-7198d05bece6 = Poznámka k poctivosti: toto je <em>geometrický/analytický</em> řetězec na úrovni před fází A / studie variant (před první formální návrhovou fází mise). Není to certifikace letové dynamiky; viz pole <c1/> každého druhu.

seg-70c18138497b = Další zkratky použité níže: FDS (systém letové dynamiky), CCSDS (Consultative Committee for Space Data Systems), OEM (Orbit Ephemeris Message), SGP4 (Simplified General Perturbations { "4" }, propagátor z dvouřádkových elementů), TOML (formát souboru scénáře) a CLI (rozhraní příkazového řádku).

seg-7cc0d4d15c4a = Řetězec kroků

seg-09a321d36a10 = Kroky jsou samostatné běhy: každý bere své vstupy z vlastního souboru scénáře, takže číslo z jednoho do dalšího přenesete (například šikmou vzdálenost z <c1/> do <c2/>) úpravou dalšího souboru. Druh <c3/> může udržet několik druhů v jednom běhu za sdílených podmínek; viz <a1>CAMPAIGNS.md</a1>.

seg-382ae9161181 = Každý příkaz níže se spouští z kořene repozitáře a shrnutí pod ním je první řádek, který kshana { $version } vypíše pro dodaný scénář.

seg-7939b15235c8 = { "1" }. Načtěte trajektorii, kterou projektant vytvořil (<c1/>)

seg-4b732dd54291 = GMAT, Orekit i STK všechny <em>exportují</em> zprávy CCSDS Orbit Ephemeris Message. Kshana je importuje (opačný směr mostu), takže analýza Kshana může začít z přesné dráhy, kterou projektant trajektorie odsouhlasil, nikoli z odvozeného přiblížení:

seg-3136cfd5a40e = Uvádí segmenty, objekty, soustavy a rozpětí epoch a kontrolu konzistence rychlosti, což ukazuje, že efemeridy byly načteny věrně (chyba zpětného převodu pod { "1" }×{ "10" }⁻⁶ km). Pokud místo toho dostane externí soubor v <c1/>, uvede, co zpracoval: po zadání OEM, který zapisuje <c2/>, vypíše <c3/>. <c4/> výslovně uvádí, že jde o strukturální a fyzikální kontrolu načtení, nikoli o ověření přesnosti dráhy zdroje.

seg-e2c563fcb8cb = { "2" }. Kdy je viditelná z pozemní stanice? (<c1/>)

seg-d66361888ede = Předpovídá průlety (východ/západ) nad stanicí nad elevační maskou: zachycení signálu (AOS), čas největšího přiblížení (TCA), ztráta signálu (LOS), maximální elevace a trvání, plus celkový čas přístupu. To je dotaz plánování pozemního segmentu. Dráha je sada elementů SGP4 převedená do soustavy pevné k Zemi řetězcem IAU 2006/2000A a elevace jsou zdánlivé: refrakce podle ITU-R P.834-9 a světelný čas downlinku, každé volitelně zapnutelné (<c1/>, <c2/>).

seg-24d31bafa334 = { "3" }. Uzavře se spojení? (<c1/>)

seg-47bdb9d4700c = Pro průlet dosaďte šikmou vzdálenost a údaje terminálů do rovnice spoje CCSDS { "401" } / DSN 810-005 (Deep Space Network NASA):

seg-db12a99edcd2 = Uvádí ztrátu šířením ve volném prostoru (FSPL), poměr nosné k hustotě šumu (C/N₀), energii na bit k hustotě šumu (Eb/N₀), rezervu a to, zda se spoj <b>uzavře</b> proti požadovanému Eb/N₀: kontrola proveditelnosti komunikace, která mění „je vidět“ na „skutečně můžeme data stáhnout“. Čísla vyplývají přímo ze vstupů v souboru (zde EIRP { "55" } dBW, ekvivalentní izotropně vyzářený výkon, do přijímacího G/T { "53" } dB/K, poměr zisku k šumové teplotě); před čtením rezervy dosaďte údaje vlastního terminálu. Je to deterministický výpočet, nikoli kalibrovaný datový list terminálu.

seg-85ad46986461 = { "4" }. Jak rychle ji prostředí utlumuje? (<c1/>)

seg-8977b12fd934 = Odvozuje hustotu termosférického neutrálního plynu ze sluneční aktivity (F10.7, rádiový tok { "10.7" } cm, a jeho 81denní průměr F10.7a) a geomagnetické aktivity (indexy Kp a ap) pomocí exosférické teploty podle Jacchia-71. To zachycuje ~{ "5" }–{ "10" }násobné kolísání hustoty v průběhu slunečního cyklu, které statická atmosféra vynechává, takže odhad životnosti dráhy nebo odporu odráží režim kosmického počasí, nikoli pevnou atmosféru. Od { "0.30" } je hustotou termosférická hustota Jacchia { "1971" }, charakterizovaná proti NRLMSISE-00 (Naval Research Laboratory mass-spectrometer and incoherent-scatter), ale nikoli atmosféra NRLMSISE-00 ověřená na datech.

seg-4b5bdadf3e7e = { "5" }. Předejte výsledek zpět (exporty)

seg-f4a438636ea8 = Totéž CLI zapisuje standardní soubory pro další nástroj. Na scénáři <c1/> zapíše <c2/> efemeridy CCSDS OEM { "2.0" } s rychlostí (soubor, který čtou GMAT, Orekit a STK), <c3/> přesné efemeridy SP3 (Standard Product { "3" }) a <c4/> katalog zpráv CCSDS Orbit Mean-Elements Message. <c5/> pokrývá prohlížeče: CZML (Cesium Language), KML (Keyhole Markup Language, pro Google Earth), GeoJSON, soubory efemerid STK (<c6/>, jeden na družici plus uživatel) a záznamy SigMF (Signal Metadata Format) z druhu <c7/>. <c8/> říká, které platí pro daný scénář. Pro Měsíc druh <c9/> vydává lunární soustavu, časovou stupnici a efemeridy jako CCSDS OEM s kontrolou shody. Viz <a1>INTEROP.md</a1>.

seg-5293e6d761a8 = Proč je to spojovací vrstva, a ne konkurent

seg-cd78b0435abb = Každý krok je malý, auditovatelný, reprodukovatelný scénář s výslovným označením rozsahu. Špičkové nástroje vlastní optimalizaci trajektorie, AOCS o šesti stupních volnosti (6-DoF) a aerotermální vstup, sestup a přistání (EDL); Kshana vlastní <b>otevřenou, citovatelnou, spustitelnou pojivovou tkáň</b>: načíst standardní formáty, odpovědět na průřezové otázky geometrie a proveditelnosti a předat výsledek dál, na úrovni, kterou může spustit kterýkoli partner bez licence. Viz také doprovodné druhy pro analýzu mise <c1/>, <c2/>, <c3/>, <c4/> a <c5/>.

seg-af1ab3c55fe6 = <s1>Předchozí</s1>{ "3" } · Kvantové proti klasickému

seg-b0765a28b4ce = <s1>Další</s1>Druhy scénářů

seg-dc88ec5ccc43 = { "1" }. Načtěte trajektorii, kterou projektant vytvořil (oem-interop)

seg-cdff21ef6984 = { "2" }. Kdy je viditelná z pozemní stanice? (passes)

seg-afa47b4283a3 = { "3" }. Uzavře se spojení? (link-budget)

seg-e508e844bf2d = { "4" }. Jak rychle ji prostředí utlumuje? (space-weather)
