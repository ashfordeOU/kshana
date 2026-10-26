# docs--trust-telemetry: translations (cs)

seg-2247a2344710 = Význam

seg-d4e48c972084 = Štítky

seg-ca448daf5ec7 = nominal

seg-a129b9e613d0 = Typ

seg-2672b7f55371 = zhoršené

seg-c711c7fecbfc = Jeden výsledek důvěry ve třech exportních formátech, ze skutečných běhů enginu v{ $version } (`kshana trust-telemetry`) na examples/maritime-trust: textová expozice Prometheus (poslední skóre důvěryhodnosti je { "5.9" } a nastaveno je pásmo nedůvěryhodné) a poslední zprávy CEF a LEEF. Příkaz nic nepublikuje, pokud nedostane cíl, nedrží žádné přihlašovací údaje a nevysílá žádný rádiový signál. Software pouze poradního charakteru, nikoli typově schválené navigační zařízení (IEC { "61108" }, IEC { "61162" }): za navigaci plavidla zůstává odpovědný provozovatel.

seg-15fcf05d16c5 = Zdroj: <c1/>

seg-05919ac6cf31 = Důvěra v GNSS jako bezpečnostní telemetrie

seg-8978c6508ebd = <c1/> převádí proud důvěry v GNSS po epochách (skóre 0–100, pásmo, důvody) na signály, které operační nebo bezpečnostní centrum již přijímá: metriky Prometheus, události syslog ve formátu CEF nebo LEEF pro SIEM a volitelně OpenTelemetry. Proud čte; nikdy nemění hodnocení důvěry a nevysílá nic než telemetrii.

seg-14ad6b7911d6 = Vstupem je živé schéma JSON-lines v1.1 popsané v <c1/>. Čte se: <c2/>; <c3/> (<c4/>, pásmo); <c5/> (0–100 nebo null); <c6/> (čas epochy, jak je uveden); <c7/> (<c8/>); <c9/> (<c10/>, <c11/>, <c12/> nebo null); důvody jsou monitory v <c13/>, poté další v <c14/>; od schématu { "1.3" } <c15/> (<c16/>, <c17/>, <c18/>, <c19/>) a <c20/> každého odvození. Ostatní klíče se ignorují, protože schéma roste jen přidanými klíči. Řádek, který se nepodaří zpracovat, se započte do <c21/> a přeskočí; skóre mimo 0–100 se odmítají, nikoli ořezávají, aby si změny formátu někdo všiml. Jediný kód, který tento formát zná, je <c22/>.
