# docs--jammertest: translations (cs)

seg-f8cf777c0caa = Povrchy

seg-9367b8736d36 = Zdroj: <c1/>

seg-c2a40cd73d0e = Hodnocení Jammertestu: publikovaný plán jako naplánovaná pravda

seg-a560942cbd27 = <c1/> čte katalog testů Jammertest a plán vysílání a promění sloty jedné testovací oblasti na <c2/> pro důvěru v přijímač. <c3/> pustí záznam přijímače přes monitory důvěry a hodnotí jej proti tomuto plánu, test po testu. Každý výsledek je <b>MODELLED</b>: plán říká, kdy byl test <em>plánován</em>, nikoli kdy byl vysílač zapnut.

seg-bc4e7285c38a = Software pouze poradního charakteru, nikoli typově schválené navigační zařízení (IEC { "61108" }, IEC { "61162" }): za navigaci plavidla zůstává odpovědný provozovatel. Nic z toho není podporováno Norskou správou veřejných silnic, Nkom ani pořadateli akce; žádná dohoda s nimi se netvrdí.

seg-af0edceb1503 = Hodnocení jednoho syntetického záznamu přijímače proti plánu o třech testech, ze skutečného běhu enginu v{ $version } (`kshana jammertest score`). Záznam je vymyšlený: { "1800" } s NMEA s poklesem C/N0 o { "20" } dB ve dvou intervalech. Plán uvádí tři sloty; ve středním slotu není v záznamu žádná rušička. Hodnocení označuje { "2" } ze { "3" } testů za detekované (medián latence { "0" } s) a { "1" } za nezachycený, s { "0" } běhy falešného poplachu za { "0.25" } h čistého času. Nic z toho neříká nic o skutečném přijímači. Software pouze poradního charakteru, nikoli typově schválené navigační zařízení (IEC { "61108" }, IEC { "61162" }): za navigaci plavidla zůstává odpovědný provozovatel.

seg-ceaa46bdcb7e = Plán a katalog

seg-73a5899de383 = Zdroj: repozitář <c1/> Norské správy veřejných silnic (<a1>https://github.com/NPRA/jammertest-plan</a1>), <b>licence MIT</b> (copyright { "2024" } Norská správa veřejných silnic; text licence je zkontrolován v <c2/>). Soubory se stahují, nikdy nejsou přibaleny:

seg-2a4967d30c3a = Stáhne katalogy a soubory plánu { "2025" } na zafixovaném commitu <c1/> a odmítne každý soubor, jehož SHA-256 se liší od <c2/>.

seg-7826929c89f6 = Test v katalogu má id s tečkami, <c1/> (například <c2/>: typ { "1" } rušení, skupina { "2" }, test { "5" }). Plán uvádí pro každou testovací oblast a časový slot, které id je naplánováno. Typy { "1" } (rušení), { "2" } (spoofing) a { "3" } (meaconing) vysílají; typ { "0" } (porady, odkladná lhůta, rezervace a ad hoc sloty) nevysílá a přeskakuje se. Časy plánu jsou místní nástěnné; <c3/> (výchozí { "2" }, CEST) říká, jak daleko jsou od UTC. Soubory plánu nesou pole kontaktní osoby testu se jménem osoby: nikdy se nečte a nic z něj odvozeného se nezapisuje.

seg-3eab33a0c38f = Import

seg-91fddde78691 = <c1/> nahrazuje <c2/>/<c3/>, když záznam svůj začátek neuvádí. Výstupem je TOML <c4/> k připojení ke scénáři důvěry v přijímač; každý popisek začíná <c5/> a nese rok vydání, id katalogu a oblast a záhlaví zaznamenává SHA-256 každého zdrojového souboru. <c6/> místo toho čte pravdu o událostech jedné složky datové sady JammerTest { "2024" } (její <c7/>, razítka posunutá o <c8/>, výchozí -2: uvádějí <c9/>, ale jde o místní čas).

seg-6ed6415a6f52 = Hodnocení

seg-1e72a977f7ad = <c1/> je scénář důvěry v přijímač (<c2/>, volitelně <c3/>, <c4/>). Jeho vlastní <c5/> se nahradí importovaným plánem. Pro každý naplánovaný test:

seg-99427ab75a03 = pole

seg-d2681be37798 = <c1/> (poplach do <c2/>, výchozí { "10" } s, od plánovaného začátku), <c3/> (později, uvnitř slotu), <c4/> (žádný), <c5/>

seg-01a977f18700 = první poplach minus plánovaný začátek

seg-b83d1f0a1fb7 = konec slotu do začátku prvního úseku o délce alespoň <c1/> ({ "10" } s) bez poplachu, před dalším testem

seg-84a34f13e93b = Test lze hodnotit, jen když začíná alespoň <c1/> po začátku záznamu; záznam s dřívějším testem se označí <c2/> (základ mohl být vytvořen za interference). <b>Falešné poplachy</b> jsou poplašné epochy po kalibraci mimo každý slot prodloužený o <c3/> ({ "60" } s) před i po (nebo po bodu zotavení), počítané jako epochy i jako běhy, s běhy za hodinu čistého času. S <c4/> a <c5/> se běh zapíše jako podepsaný balíček důkazů (<c6/>): výsledkový list a importovaný plán jsou uvnitř <c7/>, tedy uvnitř hashového řetězce a podpisu. Balíček je technický záznam, nikoli právní názor.

seg-382613112d5d = Co výsledek neříká

seg-f1cb12a89001 = Plánovaný slot není záznam o vysílání. Vysílač mohl začít pozdě, skončit dříve nebo vůbec neběžet; „nezachycený“ test může být test, který nevysílal, a latence se počítá od plánovaného začátku.

seg-32baa4a4b9f0 = „Čistá“ epocha je „mimo plánované sloty“, nikoli „prokazatelně bez interference“.

seg-95cc22bbacc5 = Detekce monitory v oblasti měření neříká nic o detekci spoofera s nízkým výkonem a koherentního.

seg-2e91813cf9d7 = Žádné vnější orákulum neuvádí skutečné časy vysílání, takže nic z toho není VALIDATED.

seg-cfdf09e38e6e = Běh na datové sadě { "2024" } (předregistrovaný)

seg-473ed6ca71e5 = <c1/> stanovila populaci, definice a prahy před prvním hodnoceným během; <c2/> tento běh zaznamenává. Výsledek: <b>registrované pravidlo minima dat selhalo</b> ({ "4" } hodnotitelná okna rušení ze { "4" } z { "12" } složek <c3/>: { "5" } složek vyřadilo pravidlo základu a { "3" } záznamy UBX uvádějí svůj začátek jen jako týden GPS a čas v týdnu), takže <b>žádný práh nelze posoudit</b>. Nic nebylo uvolněno ani znovu spuštěno. <b>v2</b> (<c4/>, zapsána samostatně před svým během; jen zacházení s daty, stejné prahy a pravidlo minima dat) zařadila záznamy jen s časem GPS podle data složky, ohodnotila { "12" } složek jen s CSV a pro pohyblivé roverové platformy použila relaci s pohyblivou platformou. Výsledek (<c5/>): { "14" } z { "24" } složek zachováno, ale jen <c6/> hodnotitelných oken rušení, takže pravidlo minima dat znovu selhalo a <b>žádný práh nelze posoudit</b>. Výsledek v1 je nezměněn. Pouze popisně: { "3" } ze { "7" } oken rušení vyvolala poplach do { "10" } s, { "4" } později, žádné nezachycené; medián latence { "18" } s; míra poplachů v čistém čase { "0.089" }. Závazným omezením je nyní pravidlo základu, které odstraňuje { "10" } složek; další registrace by pro rané okno potřebovala jiné pravidlo. Datová sada (JammerTest { "2024" }, Zenodo { "15911589" }, GPL-3.0-or-later) se stahuje pomocí <c7/> a nikdy není přibalena; test <c8/> zafixuje zaznamenaný běh, když <c9/> ukazuje na rozbalenou datovou sadu.

seg-cd75b60bd0db = Datová sada SimulaMet NMEA { "2025" }

seg-87bc2544154b = Datová sada SimulaMet Jammertest { "2025" } odvozená z NMEA (IEEE DataPort, DOI 10.21227/a7v4-xw11) <b>není</b> ve verzi { "0.38" } převzata. Její stránka neuvádí žádnou licenci a říká „This dataset requires an IEEE DataPort Subscription to access“: podmínky jasně nepovolují šíření ani automatizované stažení, proto nebyl napsán žádný adaptér ani skript pro stažení. Její použití vyžaduje rozhodnutí vlastníka a ideálně písemný souhlas autorů.

seg-aa8d3fe2adf3 = CLI, Rust (<c1/>), Python (<c2/>, <c3/>), WebAssembly (stejné názvy), nástroje MCP stejných názvů a příkaz <c4/> a skill <c5/>. Podepsaný balíček je jen z příkazového řádku (potřebuje podpisový klíč). Viz <c6/>.

seg-82aab597103a = <s1>Předchozí</s1>Rozšířený signál LunaNet vysílaný dopředu

seg-fb9e48a04566 = <s1>Další</s1>Vstupy ze strojů a senzorů

seg-45425f378b61 = význam
