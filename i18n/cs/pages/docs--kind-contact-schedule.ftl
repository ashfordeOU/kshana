# docs--kind-contact-schedule: translations (cs)

seg-99ef7c1d552c = Druh scénáře enginu v{ $version }, rodina <a1>Analýza misí, spoje a kosmické operace</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každý zdejší štítek je štítkem enginu nebo verifikační matice; druh je MODELLED, pokud matice neříká jinak (jak se štítek získává: oddíl Evidence v README).

seg-debc2f07db78 = true

seg-8784979d6569 = dBW

seg-dfe78b9d0811 = GHz

seg-37d16b499bc5 = dB

seg-0f4c2ab525ac = <b>MODELLED</b> Es/N0 downlinku podél každého přeletu jedné družice nad jednou stanicí (EIRP, ztráta ve volném prostoru, atmosférická ztráta podle kosekantového zákona, ostatní ztráty, G/T, Boltzmannova konstanta, symbolová rychlost), nejúčinnější MODCOD DVB-S2, který splňuje svůj ETSI EN { "302" } 307-

seg-c246881f6fd4 = <b>VALIDATED</b> Přelety viditelnosti (AOS, TCA, LOS, maximální zdánlivá elevace, trvání) sady prvků SGP4 nad stanicí WGS-84 na ověřené cestě pro oběžné dráhy kolem Země (IAU { "2006" }. Orákulum (ExternalDataset): Orekit { "13.1.8" } (CS GROUP, Apache-2.0) s Hipparchus { "4.0.3" }: TLEPropagator na týchž sadách prvků v TEME, kterou Orekit sestavuje podle uvedené definice (jeho IERS { "2010" } TOD otočené o GAST - GMST), ElevationDetector a ElevationExtremumDetector s ITURP834AtmosphericRefraction i bez ní a AngularAzEl s AngularRadioRefractionModifier pro případ světelného času, průsečíky a maximum řešené Hipparchus; { "60" } případů (f

seg-35588ca8e9bb = <b>MODELLED</b> Es/N0 downlinku podél každého přeletu jedné družice nad jednou stanicí (EIRP, ztráta ve volném prostoru, atmosférická ztráta podle kosekantového zákona, ostatní ztráty, G/T, Boltzmannova konstanta,. Orákulum (InternalConsistency): vnitřní konzistence: spektrální účinnost vypočtená v uzavřeném tvaru z K_bch tabulky 5a a délek rámců se shoduje s účinnostmi, které tiskne tabulka { "13" } (kontrola přepisu tabulky prahů); části bilance spoje se shodují se svými uzavřenými tvary; volba je monotónní v Es/N0 a respektuje rezervu; ACM přenese alespoň objem při konstantním kódování. Geometrie přeletu pochází z odděleně VALIDATED a

seg-cd04f5662884 = MODELLED. (katalog druhů (<c1/>))

seg-7f8667e8d8fe = Adaptivní kódování a modulace DVB-S2 podél přeletu downlinku LEO je MODELLED, nikoli ověřeno nezávislou referencí: zkontrolováno proti vlastní uzavřené / analytické identitě — zachytí chyby přepisu a koeficientů, ale není to externí orákulum. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-8f1e7d3f5a07 = Stránka rodiny: <a1>Analýza misí, spoje a kosmické operace</a1>

seg-72fd0321e4af = Stránka tématu: <a1>CONTACT-SCHEDULING.md</a1>

seg-b79fcddea1d6 = Zdroj: <c1/>

seg-040d160b3fdd = <c1/> (druh scénáře)

seg-be4e928a5865 = Plánování pozemních kontaktů pro více družic nad více stanicemi: zdánlivá okna přístupu (SGP4, zemská pevná soustava IAU 2006/2000A, refrakce podle ITU-R P.834, světelný čas), datový objem DVB-S2 ACM každého přeletu (prahy z ETSI EN { "302" } 307-1, Table { "13" }) a bezkonfliktní rozvrh (jedna družice na anténu s přípravnou dobou, jedna stanice na družici, doručení vážené prioritou omezené každým nevyřízeným objemem) pomocí hladového algoritmu s mezní hodnotou, základního postupu podle pořadí příchodu a přesného větvení a mezí na malých množinách, s mezerou optimality hladového algoritmu. MODELLED.

seg-7a3fad06a9fc = Jeden běh <c1/> se shrnuje takto: contact-schedule: { "3" } družice x { "3" } stanice za { "12" } h -> { "31" } kandidátních kontaktů, { "22" } naplánováno; { "797266" } z { "860000" } Mbit doručeno (MODELLED)

seg-a03d83f5866a = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-5ba0968796ac = Příklad <c1/> mimo jiné nastavuje:

seg-cade59b5a371 = Označení výsledku (z enginu): MODELLED -- plán kontaktů s více družicemi a více stanicemi: zdánlivá okna přístupu (SGP4, IAU 2006/2000A, refrakce podle ITU-R P.834, světelný čas), datový objem DVB-S2 ACM na přelet z rozpočtu spoje za jasné oblohy (prahy z ETSI EN { "302" } 307-1, Table { "13" }) a řešení konfliktů (jedna družice na anténu s

seg-e26b549579e2 = Graf, který engine zapisuje pro scenarios/contact-schedule.toml, druh contact-schedule

seg-036b708ed2b9 = <b>MODELLED</b> Kandidátní kontakty z každého přeletu družice nad stanicí s jeho datovým objemem ACM; konflikty, kdy by jedna anténa obsluhovala dvě družice během své přípravné doby nebo by jedna družice vysílala sestupně ke dvěma stanicím najednou; doručení vážené prioritou

seg-60431931082a = <b>MODELLED</b> Kandidátní kontakty z každého přeletu družice nad stanicí s jeho datovým objemem ACM; konflikty, kdy by jedna anténa obsluhovala dvě družice během své přípravné doby nebo by. Oracle (InternalConsistency): Vnitřní konzistence: přesné větvení a meze souhlasí s úplným výčtem na malých náhodných množinách, každý plán je zkontrolován jako proveditelný proti pravidlům konfliktů a hladový algoritmus nikdy nepřekoná přesné optimum. CO NENÍ: nebyl porovnán žádný externí plánovač ani provozní plán; kontakty se berou celé (bez dělení), nevyřízený objem je pevný na začátku okna, doba přesměrování nad rámec pevné přípravné doby a palubní s

seg-9941b9f6d4a8 = MODELLED -- plán kontaktů s více družicemi a více stanicemi: zdánlivá okna přístupu (SGP4, IAU 2006/2000A, refrakce podle ITU-R P.834, světelný čas), datový objem DVB-S2 ACM na přelet z rozpočtu spoje za jasné oblohy (prahy z ETSI EN { "302" } 307-1, Table { "13" }) a řešení konfliktů (jedna družice na anténu s přípravnou dobou, jedna stanice na družici) pomocí hladového algoritmu s mezní hodnotou zkontrolovaného proti přesnému větvení a mezím; žádný déšť, (výsledek <c1/>)

seg-f8ef88bc82b5 = Každé číslo níže je ILUSTRATIVNÍ: žádné dráhy, stanice ani rozpočet spoje žádného provozovatele. MODELLED: plánovač je kontrolován proti vlastnímu přesnému řešiči, nikoli proti externímu nástroji. (komentář v souboru scénáře, řádky { "11" } až { "12" })

seg-fe2b4799b397 = Plánování pozemních kontaktů s více družicemi a více stanicemi s řešením konfliktů je MODELLED, nikoli ověřeno proti nezávislé vnější referenci: kontroluje se proti vlastní uzavřené / analytické identitě, což zachytí chyby přepisu a koeficientů, ale není to vnější orákulum. (verifikační matice (docs/MODELLED-RATIONALE.md))

seg-be14d99cb86d = <s1>Předchozí</s1>constellation-design

seg-3784be57d6df = <s1>Další</s1>earth-gnss-lunar
