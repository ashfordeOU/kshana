# docs--real-tle-guide: translations (nb)

seg-a6da23b43f90 = <s1>Neste</s1>Kampanjer

seg-bc9ae2eda129 = Kilde: <c1/>

seg-68b27f011ced = Bruk av virkelige TLE-er for konstellasjoner

seg-109e8a920fc2 = Den medfølgende <c1/> har allerede <b>virkelige TLE-er</b> (two-line element sets): Celestrak-øyeblikksbildet <c2/> av den operative GPS-konstellasjonen (Global Positioning System) katalogisert 2021-07-28, { "30" } satellitter, med <c3/>. Hver satellitt propageres med SGP4/SDP4 (Simplified General Perturbations { "4" } / Simplified Deep-space Perturbations { "4" }), som er validert mot de offisielle vektorene fra AIAA (American Institute of Aeronautics and Astronautics) 2006-6753. Det samme øyeblikksbildet ligger som kopi i <c4/>, og <c5/> henter et ferskt. Les avsnitt { "3" } før du siterer et geometritall fra det: det scenarioet propagerer hver satellitt fra sin egen epoke.

seg-faed28835cb2 = For et syntetisk, selvstendig eksempel gir <c1/> seks GPS-lignende satellitter som rene linje-2-poster, propagert som analytiske Kepler-elementer, og hvert <c2/>-scenario uten en <c3/>-blokk bygger en Walker-konstellasjon.

seg-1c9b96a07f5b = For å studere den <b>nåværende</b> GPS-konstellasjonen (eller en annen) legger du inn et ferskt øyeblikksbilde.

seg-95bb71044de0 = { "1" }. Last ned et aktuelt øyeblikksbilde

seg-ab93ab55ddd9 = <a1>Celestrak</a1> videredistribuerer elementsettene i NORAD-katalogen (North American Aerospace Defense Command), oppdatert minst daglig. For GPS:

seg-da7b4b89848b = Andre nyttige grupper: <c1/>, <c2/> (GLONASS, Russlands globale satellittnavigasjonssystem), <c3/>, <c4/> (ISS, den internasjonale romstasjonen, og andre bemannede stasjoner).

seg-d7fe0dccbc36 = Filen er en rekke treliners poster (navn, linje { "1" }, linje { "2" }). Kshanas parser ignorerer navnelinjer, så du kan lime inn filen som den er.

seg-c2d6ca2089a1 = { "2" }. Legg den inn i et scenario

seg-6e221c5b640a = I et hvilket som helst orbit-scenario setter du konstellasjonens <c1/>-blokk til innholdet i øyeblikksbildet:

seg-f2b0e78ef568 = (PRN er nummeret på den pseudotilfeldige støykoden en GPS-satellitt sender.)

seg-976bcb48df94 = Et par av linje { "1" } + linje { "2" } propageres med <b>SGP4/SDP4</b> (luftmotstand og dypromsledd); en enkeltstående linje { "2" } behandles som analytiske Kepler-middelelementer. De to kan blandes.

seg-fa1d59fc7817 = <c1/> avviser enhver linje der kontrollsummen modulo 10 i kolonne 69 er feil — en god integritetskontroll for en nylig nedlastet fil. Standardverdien er <c2/> fordi de syntetiske undervisningsscenarioene bruker plassholderkontrollsummer.

seg-90d3872ebf87 = { "3" }. Merknader om epoker — les dette før du siterer et geometritall

seg-5e9056a30d53 = SGP4 propagerer hver satellitt fra <b>sin egen TLE-epoke</b>, og <c1/> (i <c2/>) returnerer bare propagatorer, så scenariotiden <c3/> brukes som <c4/> for hver satellitt uavhengig. Det er riktig konvensjon bare hvis alle elementsettene i filen har felles epoke.

seg-3d04797ae50e = <b>En gruppefil fra Celestrak gir deg ikke det.</b> Filen <em>lastes ned</em> på ett tidspunkt, men hvert satellittsett oppdateres i sin egen takt, så epokene i den er spredt over flere dager. Målt på settene som ligger i dette depotet (linje { "1" }, kolonne { "19" }–{ "32" }):

seg-5f67557dd207 = testdatasett

seg-ce4855643f31 = sett

seg-49a5b4798be4 = epokespredning

seg-b758a9b7ee02 = { "70.6" } h

seg-79e6ea88957c = { "76.4" } h

seg-e1e30f69fa4f = { "335.7" } h

seg-9d38cc073c94 = { "70.6" } h er { "5.9" } GPS-omløp. Propagert som de er, blir faseforholdet i banen rotet til: satellittene er i riktige høyder og med riktige inklinasjoner, men ikke der de var på noen enkelt dag, så synlig sett, DOP (dilution of precision) og enhver tilgjengelighet beregnet ut fra dem beskriver en konstellasjon som aldri har eksistert. Ingenting i parseren måler denne spredningen for deg, og typene <c1/> og <c2/> justerer ikke epoker: en TLE-blokk i et scenario propageres alltid per satellittepoke.

seg-fa82a18e4418 = <b>Gjør dette i stedet.</b> Behold epoken sammen med propagatoren, velg ett referansetidspunkt, og forskyv hver satellitts <c1/> til det. <c2/> er offentlig, så parsesløyfen er kort; <c3/> (<c4/>) er det gjennomarbeidede eksempelet i dette treet:

seg-78092818695e = TEME er rammen med sann ekvator og midlere jevndøgn som SGP4 arbeider i; <c1/> roterer den til jordfaste koordinater med <c2/>.

seg-78f483dfc3fa = Hvis du ikke justerer, må du si fra om det når du rapporterer tallet: det er en uttalelse om <em>banesjikt</em>, ikke om en virkelig himmel.

seg-34fddbd3d57f = Hvor mye dette betyr, er målt i <c1/>, som bruker de samme forskyvningene (referansetidspunkt: den seneste epoken i de kombinerte GPS- og Galileo-testdataene, 2026-06-07T07:{ "21" }:{ "04" } UTC (Coordinated Universal Time)) gjennom en { "24" } h tilgjengelighetskjøring med ARAIM (advanced receiver autonomous integrity monitoring) for to konstellasjoner. Under en VAL (vertical alert limit) på { "12" } m gir den justerte himmelen { "0.993" } for bare GPS, { "1.000" } for samlet GPS+Galileo og { "0.990" } for dual-konstellasjonen som er robust mot konstellasjonsfeil; den ujusterte konvensjonen per satellittepoke gir { "0.208" }, { "0.671" } og { "0.031" } for de samme inndataene — en annen konklusjon, ikke en liten feil.

seg-49f6c8f71d99 = <a1><c1/></a1> — orbit-scenarioene.

seg-c842884cb3e7 = <a1><c1/></a1> — feltene til typen <c2/>; typene <c3/>, <c4/>, <c5/> og <c6/> bruker den samme <c7/>-tabellen, og <a2><c8/></a2> tar en enkelt <c9/>.

seg-a2c5db6dcf42 = <a1><c1/></a1> — ARAIM-motoren som testen med virkelig himmel bruker.

seg-106047488885 = <c1/> — parseren (<c2/>, <c3/>).

seg-c9068c1bc579 = <s1>Forrige</s1>Resultatskjema
