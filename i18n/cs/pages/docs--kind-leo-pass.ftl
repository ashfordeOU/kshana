# docs--kind-leo-pass: translations (cs)

seg-ad20a7bebf23 = STL

seg-37d16b499bc5 = dB

seg-cb91473bfdda = Tematická stránka: <a1>LEO-PNT.md</a1>

seg-49964654d5f4 = Druh scénáře enginu v{ $version }, rodina <a1>Navigace z nízké oběžné dráhy Země</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každý štítek zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se štítek získává: oddíl Evidence v README).

seg-c5478f572d21 = Stránka rodiny: <a1>Navigace z nízké oběžné dráhy Země</a1>

seg-fad0b45fd9c2 = Zdroj: <c1/>

seg-f0433f09f033 = <c1/> (druh scénáře)

seg-c3861f7d717c = Přelet LEO a rozpočet spoje po pásmech pro LEO-PNT (určování polohy, navigace a času z nízké oběžné dráhy Země), nezávisle na systému: uživatel (pozemní, námořní, letecký nebo uvnitř budovy, statický nebo pohybující se) a jedna či více družic LEO z NAVRŽENÉHO PRŮLETU (kruhová dráha umístěná tak, aby uživatel viděl jeden přelet zvolené maximální elevace ve zvolený čas, případně heliosynchronní), explicitních PRVKŮ, TLE (dvouřádková sada prvků) přes SGP4 enginu, nebo WALKEROVY konstelace vytvořené kódem pro návrh konstelací (hlášeny nejvyšší přelety). Pásma pocházejí z pojmenované předvolby (obecné vícepásmové UHF/L/S/C, obecné pásmo C, Xona Pulsar X1/X5, Iridium STL, Starlink jako signál příležitosti pouze s Dopplerem, CentiSpace a volitelná předvolba Celeste IOD označená WORKSHOP) nebo se zapisují do scénáře; každá předvolba uvádí, zda její čísla jsou VEŘEJNÁ (s URL), REPREZENTATIVNÍ nebo WORKSHOP. Pro každou družici, pásmo a epochu: elevace, azimut, vzdálenost, rychlost změny vzdálenosti a zrychlení vzdálenosti; ztráta šířením ve volném prostoru; EIRP a zisk diagramu družice (isoflux, gaussovský svazek nebo plochý); zisk uživatelské antény v závislosti na elevaci (plošná, polokulová nebo izotropní); plynné zeslabení (ITU-R P.676-10 Annex { "2" }), zeslabení deštěm (koeficienty ITU-R P.838-3 a postup P.618-14 z intenzity a výšky deště), troposférická scintilace (ITU-R P.618-14 oddíl { "2.4.1" }), ztráta pronikáním do budovy pro uživatele uvnitř (ITU-R P.2109-2), polarizační nesoulad, šumová teplota systému a C/N0 (poměr nosné k šumové hustotě); Doppler a rychlost Doppleru v uzavřeném tvaru z rychlosti změny vzdálenosti a zrychlení vzdálenosti, každý zkontrolovaný proti centrálním diferencím; ionosférické zpoždění prvního řádu { "40.3" } STEC/f^{ "2" } z šikmého TEC podle Klobucharu nebo z vertikálního TEC, přepočteného na část ionosféry pod družicí. Dvojice pásem dostávají bezionosférické koeficienty, zesílení šumu a kódový šum ve vrcholu přeletu. Družice MEO GNSS (předvolby Galileo nebo GPS) se vyhodnocují stejným modelem antény a šumu z přijímaných výkonů podle dokumentů rozhraní, takže zvonovitý přelet LEO a ploché nosné GNSS sdílejí jeden graf. Volitelná sekce [iot] udává dobu do prvního určení polohy, energii na určení a výdrž baterie v závislosti na střídě provozu pro uvedený rozpočet příkonu přijímače (MODELLED). Každá dvojice pásem také udává šikmý TEC, který její kombinace bez geometrie ve vrcholu obnoví, a sigma kódového šumu tohoto odhadu (sondování ionosféry). Volitelná sekce [spoofer] padělá signály deklarované polohy, která po nástupu skočí nebo je odtlačena od skutečné, a spouští dva monitory s uvedenými pravděpodobnostmi falešného poplachu a nezachycené události: konzistenci Dopplera a geometrie přeletu (změřené rychlosti změny vzdálenosti proti těm předpovězeným z drah a nezávislé předchozí polohy a rychlosti, zobecněný test chí-kvadrát metodou nejmenších čtverců přes okno, na kanálech GNSS, LEO a všech) a konzistenci mezi pásmy (krok od epochy k epoše modelem korigované kombinace bez geometrie každé dvojice pásem LEO), s hlášením statistik po epochách a kdy každý monitor detekuje (MODELLED). Komponenty VALIDATED: ztráta ve volném prostoru, koeficienty P.838-3 proti jeho tabulce { "5" }, postupy P.618-14 pro déšť a scintilaci a ztráta pronikáním do budovy P.2109 proti validačním příkladům ITU-R Study Group { "3" }, poměr skupinového zpoždění L1/L2 podle IS-GPS-200 a maximální Doppler statického uživatele na kruhové dráze proti arXiv { "2509.19551" } tabulce { "1" }. MODELLED: EIRP, diagramy, Chapmanův podíl TEC pod družicí a celý přelet.

seg-04509d8245b7 = Jeden běh <c1/> se shrnuje takto: LEO pass link budget, air user at { "50.00" }, -30.00; { "1" } LEO satellite(s), { "900" } s window Iridium-pass [iridium-stl PUBLIC]: { "781" } km, max elevation { "65.0" } deg at { "444" } s, { "750" } s above the mask STL { "1621.000" } MHz: C/N0 peak { "80.5" } dB-Hz median { "71.3" } dB-Hz; |Doppler| max { "35.4" } kHz; iono { "7.53" } m GNSS gps-baseline L1: { "8" } in view, C/N0 { "38.2" } dB-Hz to { "51.1" } dB-Hz (median { "46.2" } dB-Hz) LEO STL peak { "80.5" } dB-Hz is { "34.3" } dB above the GNSS median; above the strongest GNSS carrier for { "750" } s

seg-e6f4e5c502d7 = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>

seg-e12426a79a2f = Příklad <c1/> mimo jiné nastavuje:

seg-274c7555b9d6 = 2026-09-28T14:{ "00" }:{ "00" }

seg-7cd17bf1ac74 = Iridium STL z letadla

seg-f4d857403ae0 = descending

seg-08bc462d676c = { "8" } přibalených scénářů používá tento druh; ostatní jsou v <a1><c1/></a1>.

seg-ee6d9e6d9556 = Štítek výsledku (enginu): MODELLED: geometrie přeletu LEO a rozpočet spoje po pásmech z uvedených EIRP a idealizovaných diagramů antén s členy šíření ITU-R; dílčí modely nesou vlastní štítky ve verifikační matici. Není to měření žádné družice.

seg-02ae51cfada6 = Graf, který engine zapisuje pro scenarios/leo-pass-iridium.toml, druh leo-pass

seg-65c8e3e5b1bc = MODELLED { "7" } · VALIDATED { "5" }: řádky <a1>verifikační matice</a1>, které tento druh uvádějí.

seg-69ed19957592 = <b>VALIDATED</b> Rovnice ITU-R (International Telecommunication Union, Radiocommunication Sector) P.838-3 ({ "1" }) až ({ "5" }): k_H, alpha_H, k_V, alpha_V z proložení křivek v tabulkách { "1" } až { "4" }, (k, alpha) závislé na dráze a polarizaci a měrné zeslabení. Testy: <a1>leo_link_reference.rs</a1>.

seg-56948e163406 = <b>VALIDATED</b> ITU-R P.618-14 oddíl { "2.2.1.1" } kroky { "2" } až { "10" } (šikmá a vodorovná dráha pod výškou deště, činitele vodorovné redukce a svislého přizpůsobení, A0.01 a jeho přepočet na { "0.001" } % až { "5" } % průměrného roku), s výškou deště (P.839) a Testy: <a1>leo_link_reference.rs</a1>.

seg-c4720302b980 = <b>VALIDATED</b> ITU-R P.618-14 oddíl { "2.4.1" } kroky { "3" } až { "9" } (referenční sigma z N_wet, efektivní délka dráhy, činitel středování antény, hloubka úniku pro { "0.01" } % až { "50" } % času), s N_wet zadaným nebo vypočteným z teploty, vlhkosti a tlaku pomocí Testy: <a1>leo_link_reference.rs</a1>.

seg-7e52290d354c = <b>VALIDATED</b> Rovnice ITU-R P.2109-2 Annex { "1" } ({ "1" }) až ({ "10" }) s tabulkou { "1" }: ztráta, která není překročena s pravděpodobností P, pro tradiční a tepelně účinné budovy při elevaci dráhy u fasády, { "80" } MHz až { "100" } GHz; použito po pásmech a epochách. Testy: <a1>leo_link_reference.rs</a1>.

seg-ac1927b760d5 = a { "8" } dalších v matici.

seg-771484572fa7 = <b>VALIDATED</b> ITU-R P.618-14 oddíl { "2.4.1" } kroky { "3" } až { "9" } (referenční sigma z N_wet, efektivní délka dráhy, činitel středování antény, hloubka úniku pro { "0.01" } % až { "50" } % času. Orákulum (ExternalDataset): Validační příklady ITU-R Study Group { "3" } (CG-3M3J-13-ValEx-Rev8.3.0) pro scintilaci P.618-14, s hodnotou N_wet podle P.453-14 pro každé místo z týchž příkladů; zapsáno v tests/fixtures/leo_link/p618_14_scintillation.csv s URL a datem stažení. Výraz pro vlhkostní refraktivitu z teploty a vlhkosti tento řádek nepokrývá

seg-ab58ab4e7dc6 = <b>VALIDATED</b> Skupinové zpoždění { "40.3" } STEC/f^{ "2" } pro každé pásmo; bezionosférické koeficienty f1^2/(f1^{ "2" } - f2^{ "2" }) a -f2^2/(f1^{ "2" } - f2^{ "2" }) a zesílení šumu sqrt(a1^{ "2" } s1^{ "2" } + a2^. Orákulum (ExternalDataset): IS-GPS-200 oddíl { "20.3.3.3.3.2" }, který uvádí poměr skupinového zpoždění L1/L2 gamma = (77/60)^{ "2" } plynoucí ze škálování prvního řádu 1/f^{ "2" }, a Friisův přenosový vzorec (Proc. IRE, { "1946" }). Ověřuje zákony škálování, nikoli šikmý TEC

seg-67fdbce3503c = <b>VALIDATED</b> leo_link::geometry::max_static_user_range_rate: prohledání každé polohy na dráze a každého uživatele na obzoru družice na kruhové dráze, s rotací Země. Orákulum (ExternalDataset): Leclere, Marathe a Reid, Insights into Xona Pulsar LEO PNT: Constellation, Signals, and Receiver Design, ION GNSS+ { "2025" }, arXiv { "2509.19551" }, tabulka { "1" } (statický přijímač na kouli o poloměru { "6371" } km, rotace Země jediný další vliv): { "37751.7" } / { "33628.5" } / { "31813.4" } / { "4018.4" } Hz na L1. Pokrývá kruhové dvoutělesové dráhy

seg-b952b2928bbe = <b>MODELLED</b> Druh <c1/>: družice z navrženého přeletu, z prvků, z TLE přes SGP4 nebo konstelace Walker z constellation-design; pro každé pásmo a epochu l. Orákulum (InternalConsistency): Uzavřené tvary a vlastní konzistence: identity rychlosti změny vzdálenosti a zrychlení vzdálenosti proti numerickým derivacím, isoflux zisk rušící nárůst vzdálenosti, učebnicové meze ztráty polarizací, kvalitativní pozorování LEO oproti GNSS (zvonovitý přelet trvající minuty a vrcholící o několik dB nad plochými nosnými GNSS 44-51 dB-Hz). EIRP a diagramy jsou publikované přijímané výkony převedené na EIRP nebo reprezentat

seg-65a0444ca451 = MODELLED: geometrie přeletu LEO a rozpočet spoje po pásmech z uvedených EIRP a idealizovaných diagramů antén s členy šíření ITU-R; dílčí modely nesou vlastní štítky ve verifikační matici. Není to měření žádné družice. (výsledek <c1/>)

seg-8b3ffb30c23c = Volitelná sekce [iot] udává dobu do prvního určení polohy, energii na určení a výdrž baterie v závislosti na střídě provozu pro uvedený rozpočet příkonu přijímače (MODELLED). (katalog druhů (<c1/>))

seg-597be3a6eb96 = Volitelná sekce [spoofer] padělá signály deklarované polohy, která po nástupu skočí nebo je odtlačena od skutečné, a spouští dva monitory s uvedenými pravděpodobnostmi falešného poplachu a nezachycené události: konzistenci Dopplera a geometrie přeletu (změřené rychlosti změny vzdálenosti proti těm předpovězeným z drah a nezávislé předchozí polohy a rychlosti, zobecněný test chí-kvadrát metodou nejmenších čtverců přes okn (katalog druhů (<c1/>))

seg-dbcc7b9c9b9b = MODELLED: EIRP, diagramy, Chapmanův podíl TEC pod družicí a celý přelet. (katalog druhů (<c1/>))

seg-e675c999f303 = MODELLED. Bodové svazky, rozvrh dávek a průběh signálu STL se nemodelují. (komentář v souboru scénáře, řádek { "14" })

seg-c3665ac09bf6 = Přelet LEO-PNT a jeho rozpočet spoje po pásmech oproti družicím MEO GNSS ve výhledu je MODELLED, nikoli ověřen proti nezávislé vnější referenci: zkontrolováno proti vlastní uzavřené / analytické identitě – zachytí chyby přepisu a koeficientů, ale není to externí orákulum. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-ab0fc0d88556 = Pojmenované předvolby systémů LEO-PNT s uvedenými zdroji a systémově nezávislý engine jsou MODELLED, nikoli ověřeny proti nezávislé vnější referenci: zkontrolováno proti vlastní uzavřené / analytické identitě – zachytí chyby přepisu a koeficientů, ale není to externí orákulum. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-ae15d15bf151 = Tematická stránka: <a1>LEO-PASS.md</a1>

seg-3ddcc0ea097f = <s1>Předchozí</s1>leo-navmsg

seg-7c0d4c0f536d = <s1>Další</s1>leo-pnt-chain
