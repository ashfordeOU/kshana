# docs--receiver-protocols: translations (nb)

seg-99427ab75a03 = felt

seg-75e6589cf544 = Kilde: <c1/>

seg-4540630d4859 = Mottakerprotokoller lest av receiver-trust ({ "0.38" })

seg-906a5f9e6cd9 = Bare lesing, hele veien: ingenting her skriver en byte til en mottaker, og det finnes ingen sendevei av noe slag. Veiledende programvare, ikke typegodkjent navigasjonsutstyr (IEC { "61108" }, IEC { "61162" }): operatøren er fortsatt ansvarlig.

seg-a44353d98d6c = Mottakerens egne flagg for spoofing og jamming (UBX)

seg-b58d3a8f292c = melding

seg-24c57b65b8f7 = tolkes som

seg-bb61c4d9a33e = UBX-NAV-STATUS (0x01 0x03), { "16" } bytes

seg-3fb608c6c3ea = Byten <c1/> ved offset { "7" }, bit { "4" }..3: <c2/>

seg-54d4cf306b49 = { "0" } ukjent eller deaktivert, { "1" } ingen spoofing angitt, { "2" } spoofing angitt, { "3" } flere spoofing-indikasjoner (protokoll { "18" } og senere; grensesnittbeskrivelse for u-blox F9 HPG { "1.32" }, avsnitt { "3.15.20" })

seg-36d4d1d82f3d = UBX-SEC-SIG (0x27 0x09) versjon { "1" }, { "12" } bytes

seg-e7e262087849 = <c1/> ved { "4" } (bit { "0" } jamDetEnabled, bit { "2" }..1 jammingState); <c2/> ved { "8" } (bit { "0" } spfDetEnabled, bit { "3" }..1 spoofingState)

seg-3e117e319518 = tilstander leses bare der detektoren er aktivert; { "0" } ukjent, { "1" } ingen, { "2" } advarsel eller indikert, { "3" } kritisk eller bekreftet

seg-8a5a59761cd0 = UBX-SEC-SIG versjon { "2" }

seg-9626adf4a5e7 = <c1/> ved { "1" } (bit { "0" } jamDetEnabled, bit { "2" }..1 jammingState, bit { "3" } spfDetEnabled, bit { "6" }..4 spoofingState); <c2/> ved { "3" } og like mange grupper på 4 bytes (ikke brukt)

seg-e0eb14018b2c = som ovenfor

seg-b0c1eaeb4185 = <b>Kilde for SEC-SIG-oppsettet.</b> Grensesnittbeskrivelsene for u-blox F9 HPG { "1.32" } og M10 SPG { "5.10" } som kunne lastes ned da dette ble skrevet, nevner UBX-SEC-SIG, men definerer den ikke. Oppsettene ovenfor er de fra de senere grensesnittbeskrivelsene fra u-blox slik de er gjengitt i biblioteket pyubx2 (BSD-3-Clause, <c1/> og <c2/>); testene med testdata i <c3/> er bygget fra dette oppsettet, ikke fra utdata fra en virkelig mottaker. Oppsett fra åpen gjengivelse, ikke kontrollert mot den gjeldende produsentveiledningen: kontroller det mot den gjeldende grensesnittbeskrivelsen fra u-blox før du stoler på SEC-SIG.

seg-6af7d45be34d = En SEC-SIG har ingen ukestid; den hører til den gjeldende navigasjonsepoken. En tilstand som allerede er lest for en epoke, beholdes med mindre en senere er verre.

seg-f1cf7ee27cb1 = Sammenligningen <c1/>

seg-f30ddb83bf99 = Der en logg har disse flaggene, har hver epoke i resultatet <c1/> (de to tilstandene, om mottakeren flagger, om noen Kshana-monitor slo alarm, og <c2/>: <c3/>, <c4/>, <c5/>, <c6/> eller <c7/>), og resultatet har <c8/> med tellingene og den første epoken for hver. Mottakeren «flagger» ved en tilstand på { "2" } eller mer. Den <b>utløser ingen alarm og endrer ingen score</b>, og ingen av sidene er fasit: enighet er ikke validering, og uenighet sier bare at den ene detektoren så noe den andre ikke så, ikke noe om hvem som hadde rett. Studios stripe leser <c9/>.

seg-49ae6094c06a = Septentrio SBF (<c1/>)

seg-4d6365d9ffd1 = <c1/> dekodes med craten <c2/> ({ "0.4" }, <b>MIT</b>; den eneste avhengigheten er <c3/>; en permissiv lisens som <c4/> tillater). Blokker som leses: PVTGeodetic ({ "4007" }) for posisjonsbestemmelsen, MeasEpoch ({ "4027" }) for C/N0 per satellitt og signal (<c5/> er signalets navn, for eksempel <c6/>), og RFStatus ({ "4092" }) for antallet RF-bånd der <c7/>-byten er ulik null (<c8/>, medtatt og <b>ikke tolket</b>: den teller aldri som et flagg). Epoker identifiseres med ukestid og ukenummer og merkes i GPS-tid (<c9/>). En blokk som feiler CRC eller parsing, teller som en hoppet over post. Denne leseren leser ikke AGC eller en jamming-indikator, så monitorene for C/N0-fall og tap av lås kjører, mens monitorene for AGC og jamming-indikator ikke gjør det.

seg-f86f2c25f41a = <b>Kilde for oppsettene.</b> Septentrios referanseveiledning kunne ikke lastes ned da dette ble skrevet (serveren avslo forespørselen), så oppsettene er hentet fra kilden til <c1/>, som viser til veiledningen, og testdataene i <c2/> er syntetiske blokker bygget etter dette oppsettet og dets CRC-16-CCITT. Ingen virkelig SBF-logg ble brukt. Oppsett fra den åpne kildekode-craten, ikke kontrollert mot den gjeldende produsentveiledningen: kontroller mot Septentrios referanseveiledning før du stoler på det.

seg-680fa4eea3f4 = Direkte seriell og USB-inngang (<c1/>)

seg-38fcf7d91b6e = Bare Unix. Den åpner enheten for lesing, setter den <b>lokale</b> linjen i rå modus med <c1/> (standard { "4800" }, NMEA { "0183" }-hastigheten), og leser NMEA-linjer som fra enhver annen kilde. Den skriver aldri til mottakeren. <c2/> avvises med en forklaring: Kshana konfigurerer ikke mottakere; sett mottakeren til å sende NMEA med produsentens eget verktøy, og les den deretter. Strømmen er NMEA, som for hver <c3/>-kilde (UBX og SBF leses fra filer). En enhet som forsvinner, avslutter kommandoen som en feil (avslutningskode { "1" }), slik at en overvåker kan starte den på nytt; laget kobler ikke til på nytt. Testet på en pseudoterminal-sløyfe (<c4/>), blant annet at master-siden ikke mottar noen byte fra kommandoen.

seg-97e1ea47c2be = <s1>Forrige</s1>Maskin- og sensorinndata

seg-55ad3fc908be = <s1>Neste</s1>Interferensobservatoriet: metode

seg-17c3203ee615 = Sammenligningen med mottakerens egenrapport

seg-68bc6d2e1575 = Septentrio SBF (format = "sbf")

seg-8444127e7ee6 = Direkte seriell og USB-inngang (receiver-trust live --serial)
