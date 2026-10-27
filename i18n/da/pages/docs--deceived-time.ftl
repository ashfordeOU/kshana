# docs--deceived-time: translations (da)

seg-d46702617926 = Kilde: <c1/>

seg-f44d01df7b1c = En signeret kommando, der udføres på et vildledt tidspunkt, fejlroutes stadig

seg-6497012e401e = En teknisk note til operatører af tidsindekserede net: konstellationer, der router, tildeler opgaver eller overdrager efter en plan, hvor hver knude handler, når dens eget ur når et planlagt tidspunkt.

seg-714bce435435 = Forkortelser: GNSS, Global Navigation Satellite System; TPL, timing protection level (beskyttelsesniveau for tid); PNT, positionering, navigation og tidssynkronisering.

seg-a7208323de1c = Påstanden

seg-246715a1c559 = At autentificere styremeddelelser, også med post-kvantesignaturer, beviser, hvem der sendte en meddelelse, og at den ikke blev ændret. Det beviser ikke, <b>hvornår modtageren handler på den</b>. En knude udfører en tidsindekseret kommando mod sit eget ur. Hvis det ur er trukket med <c1/>, kører en kommando, der er gyldig for tidspunktet <c2/>, på sand tid <c3/>, med alle signaturer intakte. Når <c4/> overstiger slotgarden, havner trafikken i det forkerte slot, et link skifter, mens den anden ende stadig peger andetsteds, eller en overdragelse sker for tidligt. Nettet fejlroutes, og hver integritetskontrol i kommandostien melder succes.

seg-8683f0749042 = Hvorfor uret er det bløde mål

seg-1af5aea2ef5b = <b>GNSS-tid er den sædvanlige reference, og den kan spoofes.</b> En knude, der disciplinerer sit ur mod GNSS, arver den tid, modtageren leverer. En spoofer, der holder modtagerens egne kvalitetsflag grønne, kan trække den tid langsomt.

seg-354a4c706264 = <b>Friskhedskontroller bruger det samme ur.</b> Et gyldighedsvindue (»acceptér denne kommando indtil <c1/>«) eller en genafspilningstæller knyttet til tid bedømmes mod det lokale ur, så et trukket ur også kan udvide det vindue, hvori en opfanget signeret kommando accepteres.

seg-a4b8a5db0975 = <b>Angrebet kræver ingen nøgle.</b> Intet i den signerede kanal berøres. Stærkere kryptografi hæver prisen for at forfalske en kommando og lader denne pris være uændret.

seg-e514b03fbae3 = Dette ligger ved siden af arbejdet med post-kvante, ikke imod det: de to lukker forskellige huller. Signaturer stopper en forfalsket kommando. Tidsintegritet stopper, at en ægte kommando udføres på det forkerte tidspunkt.

seg-09f493386dbc = Hvad der begrænser det

seg-750bd90b0ee1 = Fire foranstaltninger, hver kvantificeret af scenarietypen <c1/> (<a1><c2/></a1>):

seg-77cf39b434b5 = <b>En urstøttet monitor.</b> Sammenlign GNSS-tid med knudens eget ur, der coaster over et vindue, og giv alarm, når forskellen er for stor til at være urstøj. Den betingede TPL begrænser den fejl, der kan forblive uopdaget før alarmen.

seg-e58f7fb94ac5 = <b>Uafhængige kontroller, planlagt.</b> En tovejs tidsoverførsel fra en jordstation eller en krydslinksammenligning med en nabo udenfor spooferens rækkevidde begrænser, hvor længe et langsomt træk kan løbe. Deres genbesøgsinterval er en sikkerhedsparameter, ikke kun en driftsparameter.

seg-69590f56817c = <b>Geometri.</b> En spoofer på jorden når en satellit i lav jordbane kun, mens den er over spooferens horisont, så trækket begrænses af spooferens rampehastighed gange det vindue. Som regnestykke: en rampe på { "10" } ns/s holdt i { "600" } s er { "6" } µs. Det medfølgende eksempel (<c1/>: bane på { "550" } km, maksimal rampe på { "10" } ns/s) rapporterer en spoofer-eksponering på { "732" } s og et rampebegrænset træk på { "7 321" } ns.

seg-e8e52ce05943 = <b>En garde dimensioneret ud fra grænsen og en sikker handling ved alarm.</b> Slotgarden bør dække den største uopdagede fejl, som monitoren og kontrollerne tillader, ikke kun urets frie støj. Ved alarm bør en knude holde sin seneste gode plan på sit coastende ur frem for at følge GNSS.

seg-c11b66f214ac = Hvad denne note ikke hævder

seg-8b0ed39ead25 = Den hævder ikke, at en spoofet satellit er observeret at fejlroute; den anslår ikke nogen operatørs eksponering; og de grænser, den peger på, er MODELLED, betinget af detektion og af de angivne trusselsantagelser. Den argumenterer for en sammensætning: en gyldig signatur og et korrekt udførelsestidspunkt er adskilte egenskaber, og et tidsindekseret net har brug for begge.

seg-c1bf6467e3c9 = <s1>Forrige</s1>Tidssynkronisering i telekommunikation

seg-d4e9bfd42982 = <s1>Næste</s1>Holdover-test og tidssynkroniseringshardware i løkken
