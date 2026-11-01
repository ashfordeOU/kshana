# docs--constellation-design: translations (nb)

seg-f63dd3d7aad4 = Kilde

seg-8f0e4021404d = Kilde: <c1/>

seg-44196ab9678c = Typen <c1/> bygger én eller flere satellittkonstellasjoner rundt jorden, månen, Mars eller et annet legeme i solsystemkatalogen (<c2/>: de åtte planetene, Pluto, månen, Phobos, Deimos, de fire galileiske månene og Titan, med de samme konstantene som typene <c3/> og <c4/> bruker; se <a1>SOLAR-SYSTEM.md</a1>) og kartlegger dekning og presisjonsforringelse (DOP) over et bredde-/lengdegradsrutenett. Kilde: <c5/>.

seg-61385c509a3d = Legemet velges med <c1/> (standard <c2/>). Kjøringen spenner over <c3/> (standard ett siderisk døgn, { "86 164" } s) i steg på <c4/> (standard { "600" } s), over <c5/> (standard { "5" } grader), på et rutenett med <c6/> (standard { "10" } grader) som <c7/>, <c8/>, <c9/> og <c10/> kan begrense; <c11/> legger til den sekulære driften fra J2, den andre sonale harmoniske i legemets gravitasjonsfelt.

seg-d02f6d747522 = Hva som går inn

seg-743e68478333 = <b>Walker-skall</b> i konvensjonen <c1/>: <c2/> satellitter i <c3/> jevnt fordelte baneplan med faseforskyvning <c4/>. Et <em>delta</em>-mønster sprer de stigende nodene over { "360" } grader, et <em>stjerne</em>-mønster over { "180" } grader. Plan <c5/> ligger ved node <c6/> og satellitt <c7/> i det ved middelanomali <c8/>.

seg-d86b01d633a0 = <b>Eksplisitte elementsett</b>: store halvakse eller høyde, eksentrisitet, inklinasjon, rektascensjon for stigende node (RAAN), perisenterargument og middelanomali.

seg-0737ef1ddb72 = <b>Forhåndsinnstillinger</b> fra publiserte nominelle elementer (bare jorden; en forhåndsinnstilling rundt et annet legeme er en feil):

seg-587beeccaa11 = Forhåndsinnstilling

seg-1ff32b87e030 = Satellitter

seg-9e0514e371e5 = Global Positioning System (GPS) Standard Positioning Service Performance Standard (SPS PS), 5. utgave, april { "2020" }, tabell 3.2-1 og 3.2-3

seg-fb6956d09acc = { "24" } til { "30" }

seg-f679ee0f3a3f = SPS PS tabell 3.2-2: hver av de seks utvidbare posisjonene (B1, D2, F2, A2, C4, E3) som er navngitt i <c1/>, erstattes av paret foran og bak; alle seks som standard

seg-45f3abdcb8d4 = Galileo Open Service Service Definition Document (OS SDD), utgave { "1.1" }: Walker 24/3/1, store halvakse { "29 599.801" } km, { "56" } grader (tabell { "1" }), posisjoner i tabell { "23" }

seg-87e23a896f58 = BeiDou Open Service Performance Standard { "3.0" } ({ "2021" }), avsnitt { "4.1" }: Walker 24/3/1 i middels høy jordbane (MEO) på { "21 528" } km og { "55" } grader, pluss tre geostasjonære (GEO) satellitter ved { "80" }, { "110.5" } og { "140" } grader Ø og tre skråstilte geosynkrone (IGSO) satellitter på { "55" } grader

seg-70a32cd2402d = GLONASS Interface Control Document (ICD), utgave { "5.1" } ({ "2008" }), avsnitt { "5.2" }: posisjonsformel, { "19 100" } km, { "64.8" } grader

seg-654d7aceff94 = RAAN i GPS-tabellen er inertial ved epoken; forhåndsinnstillingen omregner den til en jordfast nodelengdegrad med Greenwich-timevinkelen tabellen oppgir ({ "100.765" } grader). GLONASS oppgir absolutte (Greenwich) nodelengdegrader direkte. Galileo-dokumentet oppgir ingen timevinkel, så RAAN brukes som nodelengdegrad. BeiDou-standarden oppgir ikke MEO-fasen eller IGSO-nodene; forhåndsinnstillingen starter MEO-mønsteret ved node { "0" } og middelanomali { "0" } og legger de tre IGSO-ene på ett bakkespor som krysser ekvator ved { "118" } grader Ø. Disse to valgene er modellert.

seg-b2bbdd23c13b = Flere konstellasjoner kan dele én kjøring. Med <c1/> (standard) estimerer mottakeren én klokke per system i sikte, slik en multi-GNSS-mottaker (Global Navigation Satellite System) gjør; <c2/> deler én klokke.

seg-27db52482bdd = Hva som kommer ut

seg-2405196cfccb = Per rutenettcelle: gjennomsnittlig, færreste og flest satellitter over masken; andelen epoker med posisjonsbestemmelse og med posisjons-DOP (PDOP) på eller under <c1/>; gjennomsnittlig geometrisk, posisjons-, horisontal og vertikal DOP (GDOP, PDOP, HDOP, VDOP); største PDOP. Globalt, vektet med cosinus til breddegrad slik at hver celle teller etter sitt areal: tilgjengelighet, tilgjengelighet på det dårligste stedet, og gjennomsnitt, median, 90., 95. og 99. persentil og maksimum for hver DOP. Per satellitt: et nedsamplet bakkespor (<c2/> sampler, standard { "24" }, for høyst <c3/> satellitter, standard { "120" }). Diagrammet er to kart, tilgjengelighet og gjennomsnittlig PDOP.

seg-6cb532d0bca9 = Hvordan det skalerer

seg-988ae3272c1f = En satellitt i radius <c1/> er over en elevasjonsmaske <c2/> nøyaktig når sentralvinkelen fra brukeren er høyst <c3/>, så synlighetstesten er ett skalarprodukt mot <c4/>. Hver epoke sorteres satellittene også etter breddegraden under satellitten, og en rutenettrad ved breddegrad <c5/> tester bare satellittene innenfor <c6/> av <c7/>. Begge er eksakte på et sfærisk legeme, og en enhetstest sammenligner hvert kart med en brute-force-skanning med den direkte elevasjonstesten. Blokken <c8/> rapporterer parvise tester en brute-force-skanning ville gjort og de som ble gjort. Enhetstestens design med { "5" } 000 satellitter på et rutenett på { "10" } grader ({ "648" } punkter, { "6" } epoker) beholder { "9.9" } % av de { "19 440 000" } parvise brute-force-testene; det medfølgende scenarioet <c9/> ({ "5 000" } satellitter, { "648" } punkter, { "12" } epoker) kjører på omtrent { "0.14" } s med kommandolinjeprogrammet i release-bygg på en bærbar PC med Apple-silicon. Veggklokketider varierer med maskinen og belastningen på den. Motoren bruker ingen tråder, klokke eller filsystem, så den kjører uendret som WebAssembly.

seg-abba032ee1c7 = Hva som kontrolleres, og mot hva

seg-2342ed239300 = VALIDATED, mot publiserte dokumenter:

seg-dc7fe92fcf05 = Walker-generatoren gjengir alle { "24" } radene i Galileo OS SDD tabell { "23" }, og posisjonsformelen i GLONASS ICD er det samme settet med { "24" } posisjoner som en Walker 24/3/1;

seg-686f9543c7c9 = GPS-forhåndsinnstillingen gjengir kolonnen for ekvatorkrysning av bakkesporet i SPS PS tabell 3.2-1 og 3.2-2: { "35" } av { "36" } steder innenfor { "0.0108" } grader mot en avrundingsterskel på { "0.015" } grader. E3F holdes til en løsere terskel på { "0.06" } grader, fordi tabellens egen E3F-rad er inkonsistent med sin RAAN og breddeargument: breddeargumentet er { "14.60" } grader foran E3s, noe som flytter krysningen { "7.30" } grader, mens tabellen flytter den { "7.36" } grader;

seg-dc2756c75401 = GPS-grunnlinjen under betingelsene i SPS PS Appendix B (ett siderisk døgn, { "287" } steg på fem minutter, et rutenett på { "4" } grader, alle i sikte, maske på { "5" } grader) gir en global HDOP-median på { "0.940" }, { "90" } % { "1.165" }, { "95" } % { "1.255" }, { "98" } % { "1.370" } og gjennomsnitt { "0.965" }, mot de publiserte { "0.94" }, { "1.16" }, { "1.25" }, { "1.37" } og { "0.96" } (terskel { "0.03" }, fastsatt før første kjøring). PDOP-median { "1.795" } ligger under { "1.815" } i tabell B.3-1, som beskriver en forringet blanding av 20-24 satellitter. PDOP på { "6" } eller lavere holder i { "100" } % av tiden, mot { "98" } % globalt og { "88" } % på det dårligste stedet i tabell 3.8-1.

seg-9aac9d8aa228 = Kontrollert mot en håndutledning, ikke et eksternt dokument: en DOP for én epoke stemmer med den lukkede formen for en satellitt i zenit og tre ved { "30" } graders elevasjon (PDOP 8/3, GDOP { "3.0732" }).

seg-d946dad08e23 = MODELLED: toleggemsbaner med valgfri sekulær J2-drift; et sfærisk legeme; bare geometrisk synlighet (ingen signaleffekt, satellitthelse eller terreng); ingen tredjelegemeforstyrrelse, som en virkelig frossen månebane er avhengig av. Det verste enkeltpunktet i tid og rom avhenger av rutenettet: HDOP { "2.40" } og VDOP { "5.22" } her mot { "2.49" } og { "5.43" } publisert; disse rapporteres, ikke låses. Forhåndsinnstillingene for de fire systemene kommer fra ulike referanseepoker, så den relative fasen deres i én kjøring er ikke et øyeblikksbilde av noen dato.

seg-a6c63abeb7e6 = Medfølgende scenarioer

seg-3e6a942c84d4 = Hver linje gir det kjøringen skriver ut med kshana { $version }.

seg-c8b40c9c2c00 = <c1/>: GPS, Galileo, BeiDou og GLONASS ({ "102" } satellitter) over ett døgn over en maske på { "10" } grader, én klokke per system. Tilgjengelighet (PDOP { "6" } eller lavere) { "100" } % globalt og på det dårligste stedet, median-PDOP { "0.95" }, i gjennomsnitt { "31.0" } satellitter i sikte.

seg-b65ade1eab04 = <c1/>: { "5 000" } satellitter i fire skall i lav jordbane (LEO) for posisjonering, navigasjon og tidssynkronisering (PNT), med J2, over en maske på { "20" } grader. Tilgjengelighet (PDOP { "3" } eller lavere) { "99.22" } % globalt og { "0" } % på det dårligste stedet, median-PDOP { "1.11" }, i gjennomsnitt { "39.4" } satellitter i sikte.

seg-7d860ca30360 = <c1/>: { "8" } satellitter i elliptiske frosne månebaner og et sirkulært skall med 6 satellitter rundt månen. Tilgjengelighet (PDOP { "6" } eller lavere) { "21.33" } % globalt og { "0" } % på det dårligste stedet, median-PDOP { "5.22" }, i gjennomsnitt { "3.2" } satellitter i sikte.

seg-0c331bea1f52 = LEO-PNT-dekning for polare og arktiske brukere, mot GNSS i middels høy jordbane, er den polare modusen til typen <c1/> (<c2/>; se <a1>LEO-PNT.md</a1>).

seg-9aab3bf49146 = <s1>Forrige</s1>Fusjonert MEO- og LEO-posisjonering

seg-9f717b9015e1 = <s1>Neste</s1>Modeller for kvantesensorer
