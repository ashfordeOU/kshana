# docs--receiver-protocols: translations (sv)

seg-99427ab75a03 = fält

seg-75e6589cf544 = Källa: <c1/>

seg-4540630d4859 = Mottagarprotokoll som receiver-trust läser ({ "0.38" })

seg-906a5f9e6cd9 = Endast läsning, genomgående: ingenting här skriver en enda byte till en mottagare, och det finns ingen sändningsväg av något slag. Rådgivande programvara, inte typgodkänd navigationsutrustning (IEC { "61108" }, IEC { "61162" }): operatören är fortsatt ansvarig.

seg-a44353d98d6c = Mottagarens egna flaggor för spoofing och jamming (UBX)

seg-b58d3a8f292c = meddelande

seg-24c57b65b8f7 = läses som

seg-bb61c4d9a33e = UBX-NAV-STATUS (0x01 0x03), { "16" } bytes

seg-3fb608c6c3ea = <c1/>-byte vid offset { "7" }, bitarna { "4" }..3: <c2/>

seg-54d4cf306b49 = { "0" } okänd eller avaktiverad, { "1" } ingen spoofing indikerad, { "2" } spoofing indikerad, { "3" } flera indikationer på spoofing (protokoll { "18" } och senare; gränssnittsbeskrivningen för u-blox F9 HPG { "1.32" }, avsnitt { "3.15.20" })

seg-36d4d1d82f3d = UBX-SEC-SIG (0x27 0x09) version { "1" }, { "12" } bytes

seg-e7e262087849 = <c1/> vid { "4" } (bit { "0" } jamDetEnabled, bitarna { "2" }..1 jammingState); <c2/> vid { "8" } (bit { "0" } spfDetEnabled, bitarna { "3" }..1 spoofingState)

seg-3e117e319518 = tillstånden läses bara där detektorn är aktiverad; { "0" } okänd, { "1" } ingen, { "2" } varning eller indikerad, { "3" } kritisk eller bekräftad

seg-8a5a59761cd0 = UBX-SEC-SIG version { "2" }

seg-9626adf4a5e7 = <c1/> vid { "1" } (bit { "0" } jamDetEnabled, bitarna { "2" }..1 jammingState, bit { "3" } spfDetEnabled, bitarna { "6" }..4 spoofingState); <c2/> vid { "3" } och lika många grupper om 4 bytes (används inte)

seg-e0eb14018b2c = som ovan

seg-b0c1eaeb4185 = <b>Källa till SEC-SIG-layouten.</b> Gränssnittsbeskrivningarna för u-blox F9 HPG { "1.32" } och M10 SPG { "5.10" } som gick att ladda ned när detta skrevs nämner UBX-SEC-SIG men definierar det inte. Layouterna ovan är de från de senare gränssnittsbeskrivningarna för u-blox, så som de är avskrivna i biblioteket pyubx2 (BSD-3-Clause, <c1/> och <c2/>); testerna med testdata i <c3/> är byggda utifrån den layouten, inte utifrån en verklig mottagares utdata. Layouten kommer från en öppen avskrift och är inte kontrollerad mot tillverkarens aktuella guide: kontrollera den mot den aktuella gränssnittsbeskrivningen för u-blox innan du förlitar dig på SEC-SIG.

seg-6af7d45be34d = En SEC-SIG har ingen veckotid; den hör till den aktuella navigeringsepoken. Ett tillstånd som redan lästs vid en epok behålls om inte ett senare är sämre.

seg-f1cf7ee27cb1 = Jämförelsen <c1/>

seg-f30ddb83bf99 = Där en logg bär dessa flaggor har varje epok i resultatet <c1/> (de två tillstånden, om mottagaren flaggar, om någon Kshana-övervakare larmade och <c2/>: <c3/>, <c4/>, <c5/>, <c6/> eller <c7/>), och resultatet har <c8/> med antalen och den första epoken för var och en. Mottagaren "flaggar" vid ett tillstånd på { "2" } eller mer. Den <b>ger inget larm och ändrar ingen poäng</b>, och ingen av sidorna är sanning: samsyn är inte validering, och en avvikelse säger att en detektor såg något som den andra inte såg, ingenting om vilken som hade rätt. Studios remsa läser <c9/>.

seg-49ae6094c06a = Septentrio SBF (<c1/>)

seg-4d6365d9ffd1 = <c1/> avkodas med craten <c2/> ({ "0.4" }, <b>MIT</b>; dess enda beroende är <c3/>; en tillåtande licens som <c4/> medger). Block som läses: PVTGeodetic ({ "4007" }) för positionsbestämningen, MeasEpoch ({ "4027" }) för C/N0 per satellit och signal (<c5/> är signalens namn, till exempel <c6/>) och RFStatus ({ "4092" }) för antalet RF-band vars <c7/>-byte inte är noll (<c8/>, medföljer och <b>tolkas inte</b>: det räknas aldrig som en flagga). Epoker nycklas på veckotid och veckonummer och märks i GPS-tid (<c9/>). Ett block som misslyckas med sin CRC eller tolkning räknas som en överhoppad post. Den här läsaren läser inte AGC eller någon jamming-indikator, så övervakarna för C/N0-fall och förlorad låsning körs medan övervakarna för AGC och jamming-indikator inte körs.

seg-f86f2c25f41a = <b>Källa till layouterna.</b> Septentrios referensguide gick inte att ladda ned när detta skrevs (servern avvisade begäran), så layouterna hämtades ur källkoden för <c1/>, som hänvisar till guiden, och testdata i <c2/> är syntetiska block byggda efter den layouten och dess CRC-16-CCITT. Ingen verklig SBF-logg användes. Layouten kommer från den öppna craten och är inte kontrollerad mot tillverkarens aktuella guide: kontrollera mot Septentrios referensguide innan du förlitar dig på den.

seg-680fa4eea3f4 = Direkt indata via serieport och USB (<c1/>)

seg-38fcf7d91b6e = Endast Unix. Den öppnar enheten för läsning, ställer den <b>lokala</b> linjen i råläge vid <c1/> (standard { "4800" }, hastigheten för NMEA { "0183" }) och läser NMEA-rader som vilken annan källa som helst. Den skriver aldrig till mottagaren. <c2/> avvisas med en förklaring: Kshana konfigurerar inte mottagare; ställ in mottagaren på att mata ut NMEA med tillverkarens eget verktyg och läs den sedan. Flödet är NMEA, som för varje <c3/>-källa (UBX och SBF läses från filer). En enhet som försvinner avslutar kommandot som ett fel (avslutskod { "1" }), för att en övervakare ska starta om det; lagret återansluter inte. Testad på en loopback med pseudoterminal (<c4/>), inklusive att huvudsidan inte tar emot någon byte från kommandot.

seg-97e1ea47c2be = <s1>Föregående</s1>Maskin- och sensorindata

seg-55ad3fc908be = <s1>Nästa</s1>Observatorium för störningar: metod

seg-17c3203ee615 = Jämförelsen med mottagarens egen rapport

seg-68bc6d2e1575 = Septentrio SBF (format = "sbf")

seg-8444127e7ee6 = Direkt indata via serieport och USB (receiver-trust live --serial)
