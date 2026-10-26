# docs--receiver-protocols: translations (cs)

seg-99427ab75a03 = pole

# c1: docs/RECEIVER-PROTOCOLS.md
seg-75e6589cf544 = Zdroj: <c1/>

seg-4540630d4859 = Protokoly přijímačů čtené modulem receiver-trust ({ "0.38" })

seg-906a5f9e6cd9 = Všude pouze čtení: nic zde nezapisuje do přijímače ani bajt a neexistuje žádná cesta pro vysílání. Software pouze poradního charakteru, nikoli typově schválené navigační zařízení (IEC { "61108" }, IEC { "61162" }): odpovědný zůstává provozovatel.

seg-a44353d98d6c = Vlastní příznaky přijímače pro spoofing a rušení (UBX)

seg-b58d3a8f292c = zpráva

seg-24c57b65b8f7 = čteno jako

seg-bb61c4d9a33e = UBX-NAV-STATUS (0x01 0x03), { "16" } bajtů

# c1: flags2
# c2: spoofDetState
seg-3fb608c6c3ea = bajt <c1/> na posunu { "7" }, bity { "4" }..3: <c2/>

seg-54d4cf306b49 = { "0" } neznámé nebo deaktivováno, { "1" } spoofing neindikován, { "2" } spoofing indikován, { "3" } více indikací spoofingu (protokol { "18" } a novější; popis rozhraní u-blox F9 HPG { "1.32" }, oddíl { "3.15.20" })

seg-36d4d1d82f3d = UBX-SEC-SIG (0x27 0x09) verze { "1" }, { "12" } bajtů

# c1: jamFlags
# c2: spfFlags
seg-e7e262087849 = <c1/> na { "4" } (bit { "0" } jamDetEnabled, bity { "2" }..1 jammingState); <c2/> na { "8" } (bit { "0" } spfDetEnabled, bity { "3" }..1 spoofingState)

seg-3e117e319518 = stavy se čtou jen tam, kde je detektor zapnut; { "0" } neznámý, { "1" } žádný, { "2" } varování nebo indikováno, { "3" } kritický nebo potvrzeno

seg-8a5a59761cd0 = UBX-SEC-SIG verze { "2" }

# c1: sigSecFlags
# c2: jamNumCentFreqs
seg-9626adf4a5e7 = <c1/> na { "1" } (bit { "0" } jamDetEnabled, bity { "2" }..1 jammingState, bit { "3" } spfDetEnabled, bity { "6" }..4 spoofingState); <c2/> na { "3" } a tolik 4bajtových skupin (nepoužívá se)

seg-e0eb14018b2c = jako výše

# c1: SEC-SIG-V1
# c2: SEC-SIG-V2
# c3: tests/receiver_trust_self_report.rs
seg-b0c1eaeb4185 = <b>Zdroj rozložení SEC-SIG.</b> Popisy rozhraní u-blox F9 HPG { "1.32" } a M10 SPG { "5.10" }, které bylo možné stáhnout v době psaní, UBX-SEC-SIG jmenují, ale nedefinují. Výše uvedená rozložení jsou ta z pozdějších popisů rozhraní u-blox, jak byla přepsána v knihovně pyubx2 (BSD-3-Clause, <c1/> a <c2/>); testy fixture v <c3/> jsou postaveny na tomto rozložení, nikoli na výstupu skutečného přijímače. Rozložení z otevřeného přepisu, nezkontrolované proti aktuální příručce výrobce: před spoléháním na SEC-SIG je zkontrolujte proti aktuálnímu popisu rozhraní u-blox.

seg-6af7d45be34d = SEC-SIG nemá čas v týdnu; patří k aktuální navigační epoše. Stav již přečtený v dané epoše se ponechá, pokud pozdější není horší.

# c1: receiver-self-report
seg-f1cf7ee27cb1 = Srovnání <c1/>

# c1: self_report
# c2: agreement
# c3: both
# c4: receiver-only
# c5: kshana-only
# c6: neither
# c7: calibrating
# c8: receiver_self_report
# c9: epochs[].self_report
seg-f30ddb83bf99 = Kde záznam tyto příznaky nese, má každá epocha výsledku <c1/> (oba stavy, zda přijímač označuje, zda spustil poplach některý monitor Kshany a <c2/>: <c3/>, <c4/>, <c5/>, <c6/> nebo <c7/>) a výsledek má <c8/> s počty a první epochou každého. Přijímač „označuje“ při stavu { "2" } nebo vyšším. <b>Nevyvolává žádný poplach a nemění žádné skóre</b> a žádná ze stran není pravdou: shoda není validace a neshoda říká, že jeden detektor něco viděl a druhý ne, nic o tom, který měl pravdu. Pás ve Studiu čte <c9/>.

# c1: format = "sbf"
seg-49ae6094c06a = Septentrio SBF (<c1/>)

# c1: receiver_trust::ingest::read_sbf
# c2: sbf-tools
# c3: thiserror
# c4: deny.toml
# c5: band
# c6: L1CA
# c7: Info
# c8: rf_bands_reported
# c9: 2024-09-05T00:00:00.000 GPST
seg-4d6365d9ffd1 = <c1/> dekóduje pomocí crate <c2/> ({ "0.4" }, <b>MIT</b>; její jedinou závislostí je <c3/>; permisivní licence, kterou <c4/> povoluje). Čtené bloky: PVTGeodetic ({ "4007" }) pro určení polohy, MeasEpoch ({ "4027" }) pro C/N0 na družici a signál (<c5/> je název signálu, například <c6/>) a RFStatus ({ "4092" }) pro počet RF pásem, jejichž bajt <c7/> je nenulový (<c8/>, přenášeno a <b>neinterpretováno</b>: nikdy se nepočítá jako příznak). Epochy jsou klíčovány časem v týdnu a číslem týdne a označeny v čase GPS (<c9/>). Blok, který selže v CRC nebo zpracování, se počítá jako přeskočený záznam. Tato čtečka nečte AGC ani indikátor rušení, takže monitory poklesu C/N0 a ztráty zámku běží a monitory AGC a indikátoru rušení neběží.

# c1: sbf-tools
# c2: tests/receiver_trust_sbf.rs
seg-f86f2c25f41a = <b>Zdroj rozložení.</b> Referenční příručku Septentrio nebylo možné v době psaní stáhnout (server požadavek odmítl), proto byla rozložení převzata ze zdroje <c1/>, který příručku cituje, a fixture v <c2/> jsou syntetické bloky sestavené podle tohoto rozložení a jeho CRC-16-CCITT. Nebyl použit žádný skutečný záznam SBF. Rozložení z open-source crate, nezkontrolované proti aktuální příručce výrobce: před spoléháním na ně je zkontrolujte proti referenční příručce Septentrio.

# c1: receiver-trust live --serial
seg-680fa4eea3f4 = Přímý sériový vstup a vstup USB (<c1/>)

# c1: --baud
# c2: --configure
# c3: live
# c4: tests/receiver_trust_live_serial.rs
seg-38fcf7d91b6e = Pouze Unix. Otevře zařízení pro čtení, nastaví <b>místní</b> linku do surového režimu na <c1/> (výchozí { "4800" }, rychlost NMEA { "0183" }) a čte řádky NMEA jako každý jiný zdroj. Nikdy nic do přijímače nezapisuje. <c2/> je odmítnuto s vysvětlením: Kshana přijímače nekonfiguruje; nastavte přijímač na výstup NMEA vlastním nástrojem výrobce a poté jej čtěte. Vstupem je NMEA, jako u každého zdroje <c3/> (UBX a SBF se čtou ze souborů). Zařízení, které zmizí, ukončí příkaz jako závadu (výstup { "1" }), aby jej supervizor znovu spustil; vrstva se znovu nepřipojuje. Testováno na smyčce pseudoterminálu (<c4/>), včetně toho, že hlavní strana od příkazu nepřijme ani bajt.

seg-97e1ea47c2be = <s1>Předchozí</s1>Vstupy ze strojů a senzorů

seg-55ad3fc908be = <s1>Další</s1>Observatoř interference: metoda

seg-17c3203ee615 = Srovnání s vlastním hlášením přijímače

seg-68bc6d2e1575 = Septentrio SBF (format = "sbf")

seg-8444127e7ee6 = Přímý sériový vstup a vstup USB (receiver-trust live --serial)
