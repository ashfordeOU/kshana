# docs--kind-leo-pvt: translations (cs)

seg-b054c73f22e5 = žádná hodnota

seg-7f5ad6ab8c23 = GPS

seg-cb91473bfdda = Tematická stránka: <a1>LEO-PNT.md</a1>

seg-a849735fcc6e = Tematická stránka: <a1>LEO-PNT-FUSION.md</a1>

seg-49964654d5f4 = Druh scénáře enginu v{ $version }, rodina <a1>Navigace z nízké oběžné dráhy Země</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každý štítek zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se štítek získává: oddíl Evidence v README).

seg-c5478f572d21 = Stránka rodiny: <a1>Navigace z nízké oběžné dráhy Země</a1>

seg-be21370c2446 = joint

seg-dfe64e82e4e9 = Zdroj: <c1/>

seg-fdba999dab11 = <c1/> (druh scénáře)

seg-093aac4b5ff1 = Spojené určování polohy, navigace a času (PNT) ze střední oběžné dráhy Země (MEO) a nízké oběžné dráhy Země (LEO) pro LIBOVOLNÉ konstelace: každý [[system]] je předvolba GNSS druhu constellation-design, předvolba LEO (xona-pulsar, iridium-stl, starlink-sop, centispace, generic-c-band, model efemerid atomic-zero-clock nebo jiný soubor předvolby, každý ve vlastním souboru se zdroji označenými VEŘEJNÝ, WORKSHOP nebo ODVOZENÝ), slupky Walker nebo explicitní sady prvků, s nosnou, čipovou rychlostí, obálkou poměru nosné k šumové hustotě (C/N0) od masky elevace po zenit, chybou vzdálenosti signálu v kosmu (SISRE), sigmou Dopplera a modelem hodin (vlastní hodiny přijímače, takže se mezisystémový bias odhaduje, nebo známý vysílaný posun). Čtyři režimy. DOPPLER: dávkové určení polohy Gaussovou-Newtonovou metodou z rychlosti změny vzdálenosti s analytickými parciálními derivacemi, stavy driftu hodin a volitelně rychlosti a volitelným omezením výšky, s jednou nebo více družicemi, chyba v závislosti na délce okna, obálka Dopplera, rychlosti změny Dopplera a ryvu každého systému LEO a přesnost v podélném a příčném směru při jediném přeletu v závislosti na příčném posunu (příčná chyba neomezeně roste, když přelet míří nad hlavu; jediný přelet má také zrcadlové řešení přes pozemní stopu). Zde běží signál příležitosti pouze s Dopplerem (starlink-sop). SPOLEČNÝ: určení polohy z pseudovzdáleností metodou vážených nejmenších čtverců pro každou epochu pouze z GNSS, pouze z LEO a z obojího, sigmy pro každé měření z modelu tepelného šumu smyčky zpožděného závěsu při C/N0 plus SISRE (nebo pevná sigma, aby je mohl krmit model signálu), odhadnuté mezisystémové biasy a PDOP/HDOP/VDOP v závislosti na počtu přidaných družic LEO. POLÁRNÍ: družice ve výhledu a DOP v závislosti na šířce pro GNSS, LEO a obojí. ČASOVÁNÍ: přenos času do koordinovaného světového času (UTC) z družic LEO ve známé poloze dvoustavovým filtrem hodin, jehož procesní šum pochází z tříd oscilátorů enginu, v závislosti na C/N0 a oscilátoru, a výraz IS-GPS-200 pro převod systémového času na UTC; s [timing] trace = true hlásí každý řádek také svou časovou chybu a předpovězenou sigmu v každé epoše. VALIDATED: největší Doppler přeletu od zenitu k obzoru proti publikovaným údajům Iridium (až { "36" } kHz) a Xona Pulsar X1 ({ "32" } až { "34" } kHz). MODELLED: vše ostatní; DOP je zkontrolován proti ručně odvozenému případu, určení polohy proti jeho kovarianci a model Dopplera proti identitě zrychlení vzdálenosti.

seg-f34d4bbcac4d = Jeden běh <c1/> se shrnuje takto: LEO PVT (joint) at { "61.10" }, { "6.60" } over { "1800" } s GPS gnss { "24" } sats at { "20182" } km, { "1575.42" } MHz Galileo gnss { "24" } sats at { "23222" } km, { "1575.42" } MHz Pulsar X5 leo { "258" } sats at { "1080" } km, { "1190.52" } MHz LEO ranging satellite in view on { "100.0" }% of epochs GNSS only availability { "1.000" }, median PDOP { "1.48" }, RMS 3D error { "1.29" } m LEO only availability { "1.000" }, median PDOP { "2.33" }, RMS 3D error { "0.69" } m fused availability { "1.000" }, median PDOP { "1.14" }, RMS 3D error { "0.63" } m

seg-e271a69236bf = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>

seg-f850cba7d96e = Příklad <c1/> mimo jiné nastavuje:

seg-bb3b3e8be839 = fjord

seg-99a3c57c7926 = { "7" } přibalených scénářů používá tento druh; ostatní jsou v <a1><c1/></a1>.

seg-b43a7ee40372 = Štítek výsledku (enginu): MODELLED společné určení polohy z pseudovzdáleností metodou vážených nejmenších čtverců s jedněmi hodinami pro každý systém nebo se známým posunem; šum z modelu smyčky zpožděného závěsu při obálce C/N0 plus chyba vzdálenosti signálu v kosmu

seg-90361a6f4e3c = Graf, který engine zapisuje pro scenarios/leo-pvt-fjord-skyline.toml, druh leo-pvt

seg-57cd9c415e31 = MODELLED { "3" } · VALIDATED { "2" }: řádky <a1>verifikační matice</a1>, které tento druh uvádějí.

seg-68aa305e05a4 = <b>VALIDATED</b> Přesná rychlost změny vzdálenosti družice, jejíž poloha a rychlost vázané na Zemi pocházejí z dvoutělesové dráhy se sekulárním driftem J2 a rotací Země (leo_fusion::geom::EarthOrbit::state, rychlost je přesná časová derivace polohy), Testy: <a1>leo_doppler_reference.rs</a1>.

seg-c3ef3e0163f2 = <b>MODELLED</b> Dávkové určení polohy Gaussovou-Newtonovou metodou z rychlosti změny vzdálenosti s analytickými parciálními derivacemi (d rho_dot / d r = -(I - u u^T)(v_s - v_u)/rho, d/dv = -u, d/d drift = { "1" }), volitelně konstantní rychlost uživatele, pseudoměření výšky pro uživatele na povrchu, tlumený s Testy: <a1>leo_fusion_scenarios.rs</a1>.

seg-a4e0166269ea = <b>MODELLED</b> Určení polohy Gaussovou-Newtonovou metodou vážených nejmenších čtverců přes libovolnou směs systémů, jedny hodiny přijímače pro každý systém (mezisystémový bias odhadovaný spolu s polohou) nebo známý vysílaný posun na referenční časové stupnici; sigmy pro každé měření dodává Testy: <a1>leo_fusion_scenarios.rs</a1>.

seg-5c9f826efbc8 = <b>MODELLED</b> Měření hodin z každé družice LEO ve výhledu ve známé poloze, kombinovaná váhami inverzního rozptylu z modelu šumu pseudovzdálenosti, filtrovaná dvoustavovým (fáze, frekvence) Kalmanovým filtrem, jehož procesní šum je třídy oscilátoru Testy: <a1>leo_fusion_scenarios.rs</a1>.

seg-3319b18ac61f = a { "1" } dalších v matici.

seg-f6bd93155e41 = <b>MODELLED</b> Určení polohy Gaussovou-Newtonovou metodou vážených nejmenších čtverců přes libovolnou směs systémů, jedny hodiny přijímače pro každý systém (mezisystémový bias odhadovaný spolu s polohou) nebo známý . Orákulum (InternalConsistency): Ručně odvozený DOP čtyř družic (jedna družice v zenitu a tři na obzoru po { "120" } deg, jejichž normálová matice se dá invertovat ručně), strukturální identita, že systém s vlastními hodinami a jednou družicí nepřidá žádnou geometrii, obnovení polohy, hodin a biasu bez šumu a seedované chyby proti kovarianci. Pouze vnitřní kontroly; nesrovnáno s výstupem přijímače. { "0.30" } externí srovnání, zjištění

seg-4056b0470099 = <b>MODELLED</b> Systémově nezávislé vstupy: každý systém je tvořen slupkami Walker, explicitními prvky nebo předvolbou GNSS, signálem (nosná, čipová rychlost, šířka pásma, přijímaný výkon nebo rozsah C/N0. Orákulum (InternalConsistency): Přepis citovaných veřejných hodnot, zkontrolovaný na strukturu (každý veřejný zdroj má URL, vzory Walker se dělí beze zbytku, C/N0 z přijímaného výkonu nad kT při { "290" } K), nikoli proti externímu orákulu. Reprezentativní hodnoty jsou v každé předvolbě pojmenovány a jsou ilustrativní

seg-df745ccdaceb = MODELLED společné určení polohy z pseudovzdáleností metodou vážených nejmenších čtverců s jedněmi hodinami pro každý systém nebo se známým posunem; šum z modelu smyčky zpožděného závěsu při obálce C/N0 plus chyba vzdálenosti signálu v kosmu (výsledek <c1/>)

seg-c988291eb41d = MODELLED: vše ostatní; DOP je zkontrolován proti ručně odvozenému případu, určení polohy proti jeho kovarianci a model Dopplera proti identitě zrychlení vzdálenosti. (katalog druhů (<c1/>))

seg-be908356ad19 = Předvolba skyline je REPREZENTATIVNÍ (původ v docs/SKYLINE.md a <c1/>): řádově šířka a reliéf hlubokých západonorských fjordů, nikoli zaměření nějakého fjordu. Pouze přímá viditelnost: žádná difrakce, odraz ani příjem bez přímé viditelnosti. Pro srovnání s otevřenou oblohou odstraňte sekci [skyline]. MODELLED. (komentář v souboru scénáře, řádky { "15" } až { "18" })

seg-1d0ab26930e1 = Společné určení polohy z pseudovzdáleností GNSS a LEO s mezisystémovými biasy a chybovými modely pro každý signál je MODELLED, nikoli ověřeno proti nezávislé vnější referenci: zkontrolováno proti vlastní uzavřené / analytické identitě – zachytí chyby přepisu a koeficientů, ale není to externí orákulum. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-35916a8ac93e = Pojmenované systémy LEO PNT jako volitelné datové předvolby, každý se svým zdrojem, jsou MODELLED, nikoli ověřeny proti nezávislé vnější referenci: zkontrolováno proti vlastní uzavřené / analytické identitě – zachytí chyby přepisu a koeficientů, ale není to externí orákulum. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-6ac7dcc57b2a = <s1>Předchozí</s1>leo-ppp

seg-458b3eda3250 = <s1>Další</s1>leo-signal
