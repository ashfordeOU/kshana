# docs--kind-optical-atmosphere: translations (cs)

seg-f42465f7d066 = ns

seg-37d16b499bc5 = dB

seg-37d29d8303fe = km

seg-51362910dcb7 = Tento druh používají { "2" } přibalené scénáře; ostatní jsou v <a1><c1/></a1>.

seg-9fd02351d844 = ms

seg-72ad48275ebe = Druh scénáře enginu v{ $version }, rodina <a1>Optická PNT</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každý štítek zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se štítek získává: oddíl Evidence v README).

seg-a97755cb13eb = Stránka rodiny: <a1>Optická PNT</a1>

seg-d4e4da22fadb = Zdroj: <c1/>

seg-deb0a932a76f = <c1/> (druh scénáře)

seg-a878d9be65b7 = Stav MODELLED pro optické PNT atmosférou: pro optickou linku a sadu pozemních stanovišť s uvedenými oblačnými klimaty vypisuje ztrátu v čistém vzduchu závislou na vlnové délce a elevaci (Kimův zákon viditelnosti plus Rayleighův rozptyl), stav turbulence podle Hufnagela–Valleyho (Rytovův rozptyl, index scintilace, parametry gamma-gamma, průměrování apertury), dostupnost řízenou počasím vůči rezervě linky (optická hloubka oblačnosti z log-normálního klimatu obsahu kapalné vody, extinkce podle geometrické optiky, nezávislý únik turbulencí), rezervu linky potřebnou pro cílové dostupnosti, rozdělení délek výpadků, růst chyby času a měření vzdálenosti při každém výpadku přes model holdover hodin, dostupnost při diverzitě stanovišť korelované vzdáleností a hypotetické zisky technik zlepšení (vlnová délka, přijímací apertura, snížení scintilace adaptivní optikou, další rezerva). VALIDATED jako implementace uvedených vzorců proti nezávislému orákulu mpmath: Rytovův rozptyl, index scintilace, pravděpodobnost úniku gamma-gamma, činitel průměrování apertury, optická hloubka oblačnosti a čistého vzduchu. MODELLED: každý vstup týkající se počasí, techniky a hodin a předpoklady nezávislosti a kopule; nebyl porovnán žádný změřený záznam dostupnosti. Poradní analýza, nikoli certifikovaná dostupnost ani navigační produkt.

seg-c443d8d3e4ce = Jeden běh <c1/> se shrnuje takto: optical-atmosphere: { "1550" } nm při elevaci { "30" } deg, rezerva { "19.2" } dB před atmosférou; nejlepší stanoviště jižní { "74.66" } %; síť 3 stanovišť { "92.72" } % při nezávislém / { "91.62" } % při korelovaném počasí (MODELLED, poradní)

seg-e466ecbd4e6d = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

seg-8adae3ea6e60 = Příklad <c1/> mimo jiné nastavuje:

seg-687f2930a40d = downlink

seg-e794d481aed4 = plane

seg-a0fb22dd0a44 = [ocxo, rafs, dsac]

seg-9799bd5f9fdb = nm

seg-7707c45d1d30 = dBm

seg-0fd6a569077f = Popisek výsledku (z enginu): MODELLED — optické PNT atmosférou: extinkce v čistém vzduchu (Kimův zákon viditelnosti + Rayleighův rozptyl), optická hloubka oblačnosti z uvedeného klimatu obsahu kapalné vody (množství P.840, extinkce podle geometrické optiky), turbulence podle Hufnagela–Valleyho s úniky gamma-gamma a průměrováním apertury, dostupnost vůči

seg-4e2b759aff17 = Graf, který engine zapisuje pro scenarios/optical-atmosphere-network.toml, druh optical-atmosphere

seg-a18d144f149e = <b>MODELLED</b> Hufnagelovo–Valleyho Cn2 integrované podél šikmé dráhy pro Rytovův rozptyl rovinné a kulové vlny (uplink a downlink), Andrewsův–Phillipsův index scintilace a parametry gamma-gamma, pravděpodobnost úniku gamma-gamma a rezerva úniku, Testy: <a1>optical_atmosphere_reference.rs</a1>.

seg-d97535fd4875 = <b>MODELLED</b> Dostupnost optické linky vůči uvedené rezervě linky z log-normálního klimatu obsahu kapalné vody v oblačnosti (množství ITU-R P.840, extinkce podle geometrické optiky) a nezávislého úniku gamma-gamma způsobeného turbulencí, rezerva linky potřebná pro cílové d Testy: <a1>optical_atmosphere_identities.rs</a1>.

seg-6e2c643df3a6 = <b>MODELLED</b> Rozdělení délek výpadků optického stanoviště spojené s uzavřeným tvarem rozptylu při dobíhání v modelu holdover hodin: chyba času a měření vzdálenosti při uvedených kvantilech výpadků, holdover do časového prahu, podíl výpadků a Testy: <a1>optical_atmosphere_identities.rs</a1>.

seg-00c76aeadb90 = <b>MODELLED</b> Volitelná tabulka <c1/> (duration, step, seed) způsobí, že druh <c2/> zapíše také pro každé stanoviště jednu realizaci uvedeného modelu stanoviště v čase se seedem: epizody oblačnosti (jasné úseky exponenciální, výpadky oblačností log-normální Testy: <a1>optical_atmosphere_timeseries.rs</a1>.

seg-f1ee20e52b46 = <b>MODELLED</b> Hufnagelovo–Valleyho Cn2 integrované podél šikmé dráhy pro Rytovův rozptyl rovinné a kulové vlny (uplink a downlink), Andrewsův–Phillipsův index scintilace. Orákulum (ExternalDataset): Numerika je porovnána s nezávislým programem (xval/optical-atmosphere/oracle.py, mpmath { "1.4.1" } na { "30" } číslic, kvadratura tanh-sinh na původní proměnné výšky a hustoty gamma-gamma přes Besselovu funkci K), který se systémem Kshana nesdílí žádný kód, při prazích stanovených dříve, než existovala jakákoli implementace (xval/optical-atmosphere/PREREGISTRATION.md). PROČ MODELLED: toto orákulum vyhodnocuje titíž publikované vzorce, takže kontroluje im

seg-4af9bc99ef29 = <b>MODELLED</b> Dostupnost optické linky vůči uvedené rezervě linky z log-normálního klimatu obsahu kapalné vody v oblačnosti (množství ITU-R P.840, extinkce podle geometrické optiky) a . Orákulum (InternalConsistency): Vnitřní konzistence: uzavřené limity a monotonie modelu diverzity, uzavřený tvar stropu oblačnosti a log-normální identity výpadků. ŽÁDNÉ vnější orákulum se netvrdí a žádné nebylo porovnáno: nepoužívá se žádný změřený záznam dostupnosti optické pozemní stanice ani volné linie výhledu bez oblačnosti. PROČ MODELLED: klima oblačnosti (pravděpodobnost oblačnosti, medián a rozptyl sloupce kapalné vody, délky výpadků),

seg-b3abf6cbeba4 = <b>MODELLED</b> Rozdělení délek výpadků optického stanoviště spojené s uzavřeným tvarem rozptylu při dobíhání v modelu holdover hodin: chyba času a měření vzdálenosti při uvedených ku. Orákulum (InternalConsistency): Vnitřní konzistence s modulem holdover, bit po bitu; ŽÁDNÉ vnější orákulum se netvrdí. PSD tříd jsou syntetizované podlahy dlouhého tau, které modul holdover již obsahuje, takže údaje dědí jeho uvedenou výhradu, že holdover k úzkému prahu určuje předpokládaná podlaha červeného šumu, nikoli citovaná Allanova odchylka. Délky výpadků jsou log-normální model s uvedenými parametry, nikoli změřený

seg-c4772a9e1a26 = MODELLED — optické PNT atmosférou: extinkce v čistém vzduchu (Kimův zákon viditelnosti + Rayleighův rozptyl), optická hloubka oblačnosti z uvedeného klimatu obsahu kapalné vody (množství P.840, extinkce podle geometrické optiky), turbulence podle Hufnagela–Valleyho s úniky gamma-gamma a průměrováním apertury, dostupnost vůči rezervě linky, délky výpadků spojené s holdover hodin a dostupnost při diverzitě stanovišť korelované vzdáleností. Numerika je zkontrolována (výsledek <c1/>)

seg-32c6524b0baf = Stav MODELLED pro optické PNT atmosférou: pro optickou linku a sadu pozemních stanovišť s uvedenými oblačnými klimaty vypisuje ztrátu v čistém vzduchu závislou na vlnové délce a elevaci (Kimův zákon viditelnosti plus Rayleighův rozptyl), stav turbulence podle Hufnagela–Valleyho (Rytovův rozptyl, index scintilace, parametry gamma-gamma, průměrování apertury), dostupnost řízenou počasím vůči rezervě linky (optická hloubka oblačnosti z (katalog druhů (<c1/>))

seg-2c7493ee5042 = MODELLED: každý vstup týkající se počasí, techniky a hodin a předpoklady nezávislosti a kopule; nebyl porovnán žádný změřený záznam dostupnosti. (katalog druhů (<c1/>))

seg-b4402211e3fe = Optické PNT atmosférou: tři ILUSTRATIVNÍ pozemní stanoviště (oblačnější severní, střední a jasnější jižní) sledující optický terminál na LEO při elevaci { "30" } stupňů na { "1550" } nm. Klimata oblačnosti jsou uvedené vstupy, nikoli měření ani hodnoty jakékoli datové sady, takže každá dostupnost níže je MODELLED. Běh uvádí pro každé stanoviště ztrátu v čistém vzduchu, stav turbulence podle Hufnagela–Valleyho, (komentář v souboru scénáře, řádky { "1" } až { "8" })

seg-384f5c73cdf9 = Jedna realizace spoje každého stanoviště v čase se seedem (MODELLED; tah z výše uvedeného modelu, nikoli z klimatu). Pokud chybí, žádná řada se nezapíše a výsledkem je dokument { "0.37" }. (komentář v souboru scénáře, řádky { "78" } až { "79" })

seg-c75fa5787bd4 = Numerika optické atmosféry na šikmé dráze: Rytovův rozptyl, scintilace, pravděpodobnost úniku gamma-gamma, průměrování apertury, optická hloubka oblačnosti a čistého vzduchu je MODELLED, nikoli ověřená: dílčí tvrzení je externě zkontrolováno, ale celá schopnost skládá dohromady modelované části, takže schopnost zůstává v kategorii vypočtené z modelu. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-e5013bdf86bb = Dostupnost optického pozemního stanoviště řízená počasím a dostupnost při diverzitě stanovišť korelované vzdáleností je MODELLED, nikoli ověřená: zkontrolováno proti vlastní uzavřené / analytické identitě — zachytí chyby přepisu a koeficientů, ale není to vnější orákulum. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-dc1132147318 = Tematická stránka: <a1>OPTICAL-ATMOSPHERE.md</a1>

seg-bd5b1654b3ed = <s1>Předchozí</s1>oem-interop

seg-ef0a779c300c = <s1>Další</s1>orbit
