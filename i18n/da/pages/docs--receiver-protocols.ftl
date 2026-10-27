# docs--receiver-protocols: translations (da)

seg-99427ab75a03 = felt

seg-75e6589cf544 = Kilde: <c1/>

seg-4540630d4859 = Modtagerprotokoller, som receiver-trust læser ({ "0.38" })

seg-906a5f9e6cd9 = Kun læsning, hele vejen igennem: intet her skriver en eneste byte til en modtager, og der findes ingen sendesti af nogen art. Vejledende software, ikke typegodkendt navigationsudstyr (IEC { "61108" }, IEC { "61162" }): operatøren er fortsat ansvarlig.

seg-a44353d98d6c = Modtagerens egne flag for spoofing og jamming (UBX)

seg-b58d3a8f292c = meddelelse

seg-24c57b65b8f7 = læses som

seg-bb61c4d9a33e = UBX-NAV-STATUS (0x01 0x03), { "16" } bytes

seg-3fb608c6c3ea = <c1/>-byte ved offset { "7" }, bit { "4" }..3: <c2/>

seg-54d4cf306b49 = { "0" } ukendt eller deaktiveret, { "1" } ingen spoofing angivet, { "2" } spoofing angivet, { "3" } flere angivelser af spoofing (protokol { "18" } og senere; u-blox F9 HPG { "1.32" } grænsefladebeskrivelse, afsnit { "3.15.20" })

seg-36d4d1d82f3d = UBX-SEC-SIG (0x27 0x09) version { "1" }, { "12" } bytes

seg-e7e262087849 = <c1/> ved { "4" } (bit { "0" } jamDetEnabled, bit { "2" }..1 jammingState); <c2/> ved { "8" } (bit { "0" } spfDetEnabled, bit { "3" }..1 spoofingState)

seg-3e117e319518 = tilstande læses kun, hvor detektoren er aktiveret; { "0" } ukendt, { "1" } ingen, { "2" } advarsel eller angivet, { "3" } kritisk eller bekræftet

seg-8a5a59761cd0 = UBX-SEC-SIG version { "2" }

seg-9626adf4a5e7 = <c1/> ved { "1" } (bit { "0" } jamDetEnabled, bit { "2" }..1 jammingState, bit { "3" } spfDetEnabled, bit { "6" }..4 spoofingState); <c2/> ved { "3" } og så mange grupper på 4 bytes (bruges ikke)

seg-e0eb14018b2c = som ovenfor

seg-b0c1eaeb4185 = <b>Kilden til SEC-SIG-layoutet.</b> Grænsefladebeskrivelserne for u-blox F9 HPG { "1.32" } og M10 SPG { "5.10" }, som kunne hentes, da dette blev skrevet, nævner UBX-SEC-SIG, men definerer det ikke. Layoutene ovenfor er dem fra de senere u-blox-grænsefladebeskrivelser, som de er afskrevet i biblioteket pyubx2 (BSD-3-Clause, <c1/> og <c2/>); fixture-testene i <c3/> er bygget ud fra det layout, ikke ud fra en virkelig modtagers output. Layout fra åben afskrift, ikke kontrolleret mod den aktuelle vejledning fra producenten: kontrollér det mod den aktuelle grænsefladebeskrivelse fra u-blox, før du stoler på SEC-SIG.

seg-6af7d45be34d = En SEC-SIG har ingen tid i ugen; den hører til den aktuelle navigationsepoke. En tilstand, der allerede er aflæst ved en epoke, bevares, medmindre en senere er værre.

seg-f1cf7ee27cb1 = Sammenligningen <c1/>

seg-f30ddb83bf99 = Hvor en log bærer disse flag, har hver epoke i resultatet <c1/> (de to tilstande, om modtageren flager, om en Kshana-monitor har slået alarm, og <c2/>: <c3/>, <c4/>, <c5/>, <c6/> eller <c7/>), og resultatet har <c8/> med antallene og den første epoke for hver. Modtageren "flager" ved en tilstand på { "2" } eller derover. Den <b>udløser ingen alarm og ændrer ingen score</b>, og ingen af siderne er reference: enighed er ikke validering, og uenighed siger, at den ene detektor så noget, den anden ikke så, intet om, hvilken der havde ret. Studios bånd læser <c9/>.

seg-49ae6094c06a = Septentrio SBF (<c1/>)

seg-4d6365d9ffd1 = <c1/> afkodes med crate'en <c2/> ({ "0.4" }, <b>MIT</b>; dens eneste afhængighed er <c3/>; en tilladende licens, som <c4/> tillader). Blokke, der læses: PVTGeodetic ({ "4007" }) til positionsbestemmelsen, MeasEpoch ({ "4027" }) til C/N0 pr. satellit og signal (<c5/> er signalets navn, såsom <c6/>) og RFStatus ({ "4092" }) til antallet af RF-bånd, hvis <c7/>-byte ikke er nul (<c8/>, medtaget og <b>ikke fortolket</b>: det tæller aldrig som et flag). Epoker nøgles efter tid i ugen og ugenummer og mærkes i GPS-tid (<c9/>). En blok, der fejler sin CRC eller fortolkning, tæller som en sprunget post. Denne læser læser ikke AGC eller en jamming-indikator, så monitorerne for fald i C/N0 og tab af lås kører, mens monitorerne for AGC og jamming-indikator ikke gør.

seg-f86f2c25f41a = <b>Kilden til layoutene.</b> Septentrios referencevejledning kunne ikke hentes, da dette blev skrevet (serveren afviste forespørgslen), så layoutene er taget fra kilden til <c1/>, som henviser til vejledningen, og fixtures i <c2/> er syntetiske blokke bygget til dette layout og dets CRC-16-CCITT. Ingen virkelig SBF-log er brugt. Layout fra en open source-crate, ikke kontrolleret mod den aktuelle vejledning fra producenten: kontrollér mod Septentrios referencevejledning, før du stoler på det.

seg-680fa4eea3f4 = Direkte seriel og USB-input (<c1/>)

seg-38fcf7d91b6e = Kun Unix. Den åbner enheden til læsning, sætter den <b>lokale</b> linje i rå tilstand ved <c1/> (standard { "4800" }, hastigheden for NMEA { "0183" }) og læser NMEA-linjer som enhver anden kilde. Den skriver aldrig til modtageren. <c2/> afvises med en forklaring: Kshana konfigurerer ikke modtagere; sæt modtageren til at udsende NMEA med producentens eget værktøj, og læs det så. Feedet er NMEA, som for hver <c3/>-kilde (UBX og SBF læses fra filer). En enhed, der forsvinder, afslutter kommandoen som en fejl (exit { "1" }), så en supervisor kan genstarte den; laget genopretter ikke forbindelsen. Testet på en pseudoterminal-loopback (<c4/>), herunder at master-siden ikke modtager nogen byte fra kommandoen.

seg-97e1ea47c2be = <s1>Forrige</s1>Maskin- og sensorinput

seg-55ad3fc908be = <s1>Næste</s1>Interferensobservatorium: metode

seg-17c3203ee615 = Sammenligningen med modtagerens egen rapport

seg-68bc6d2e1575 = Septentrio SBF (format = "sbf")

seg-8444127e7ee6 = Direkte seriel og USB-input (receiver-trust live --serial)
