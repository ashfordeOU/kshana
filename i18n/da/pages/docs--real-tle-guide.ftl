# docs--real-tle-guide: translations (da)

seg-a6da23b43f90 = <s1>Næste</s1>Kampagner

seg-bc9ae2eda129 = Kilde: <c1/>

seg-68b27f011ced = Brug af TLE'er for virkelige konstellationer

seg-109e8a920fc2 = Den medfølgende <c1/> bærer allerede <b>virkelige TLE'er</b> (two-line element sets): Celestrak-snapshottet <c2/> af den operative GPS-konstellation (Global Positioning System), katalogiseret 2021-07-28, { "30" } satellitter, med <c3/>. Hver satellit propageres med SGP4/SDP4 (Simplified General Perturbations { "4" } / Simplified Deep-space Perturbations { "4" }), som er valideret mod de officielle AIAA-vektorer (American Institute of Aeronautics and Astronautics) 2006-6753. Det samme snapshot ligger som kopi i <c4/>, og <c5/> henter et nyt. Læs afsnit { "3" }, før du citerer et geometrital herfra: det scenarie propagerer hver satellit fra sin egen epoke.

seg-faed28835cb2 = Til et syntetisk, selvstændigt eksempel giver <c1/> seks GPS-lignende satellitter som rene linje-2-poster, propageret som analytiske keplerelementer, og hvert <c2/>-scenarie uden en <c3/>-blok bygger en Walker-konstellation.

seg-1c9b96a07f5b = For at studere den <b>aktuelle</b> GPS-konstellation (eller en anden) lægger du et nyt snapshot ind.

seg-95bb71044de0 = { "1" }. Hent et aktuelt snapshot

seg-ab93ab55ddd9 = <a1>Celestrak</a1> videredistribuerer elementsættene i NORAD-kataloget (North American Aerospace Defense Command), opdateret mindst dagligt. For GPS:

seg-da7b4b89848b = Andre nyttige grupper: <c1/>, <c2/> (GLONASS, Ruslands Global Navigation Satellite System), <c3/>, <c4/> (ISS, International Space Station, og andre bemandede stationer).

seg-d7fe0dccbc36 = Filen er en række poster på tre linjer (navn, linje { "1" }, linje { "2" }). Kshanas parser ignorerer navnelinjer, så du kan indsætte filen, som den er.

seg-c2d6ca2089a1 = { "2" }. Læg det ind i et scenarie

seg-6e221c5b640a = I ethvert kredsløbsscenarie sætter du konstellationens <c1/>-blok til snapshottets indhold:

seg-f2b0e78ef568 = (PRN er det pseudorandom-noise-kodenummer, en GPS-satellit sender.)

seg-976bcb48df94 = Et par af linje { "1" } + linje { "2" } propageres med <b>SGP4/SDP4</b> (led for modstand og dybt rum); en ren linje { "2" } behandles som analytiske kepler-middelelementer. De to kan blandes.

seg-fa1d59fc7817 = <c1/> afviser enhver linje, hvis kontrolsum modulo 10 i kolonne 69 er forkert — en god integritetskontrol af en frisk hentet fil. Standardværdien er <c2/>, fordi de syntetiske undervisningsscenarier bruger pladsholder-kontrolsummer.

seg-90d3872ebf87 = { "3" }. Noter om epoker — læs dette, før du citerer et geometrital

seg-5e9056a30d53 = SGP4 propagerer hver satellit fra <b>dens egen TLE-epoke</b>, og <c1/> (i <c2/>) returnerer kun propagatorer, så scenarietiden <c3/> anvendes som <c4/> på hver satellit uafhængigt. Det er kun den rigtige konvention, hvis alle elementsæt i filen har samme epoke.

seg-3d04797ae50e = <b>En Celestrak-gruppefil giver dig ikke det.</b> Filen <em>hentes</em> på ét tidspunkt, men hvert satellitelementsæt opdateres i sin egen takt, så epokerne i den er spredt over dage. Målt på de sæt, der ligger som kopi i dette repositorium (linje { "1" }, kolonne { "19" }–{ "32" }):

seg-5f67557dd207 = fixture

seg-ce4855643f31 = sæt

seg-49a5b4798be4 = spredning af epoker

seg-b758a9b7ee02 = { "70.6" } h

seg-79e6ea88957c = { "76.4" } h

seg-e1e30f69fa4f = { "335.7" } h

seg-9d38cc073c94 = { "70.6" } h er { "5.9" } GPS-omløb. Propageret, som det er, er faserne i banens plan blandet sammen: satellitterne er i de rigtige højder og hældninger, men ikke dér, hvor de var på nogen enkelt dag, så den synlige mængde, DOP (dilution of precision) og enhver tilgængelighed beregnet ud fra dem beskriver en konstellation, der aldrig har eksisteret. Intet i parseren måler denne spredning for dig, og typerne <c1/> og <c2/> afstemmer ikke epoker: en TLE-blok i et scenarie propageres altid pr. satellitepoke.

seg-fa82a18e4418 = <b>Gør i stedet dette.</b> Behold epoken sammen med propagatoren, vælg ét referencetidspunkt, og forskyd hver satellits <c1/> til det. <c2/> er offentlig, så parsersløjfen er kort; <c3/> (<c4/>) er det gennemregnede eksempel i dette træ:

seg-78092818695e = TEME er det referencesystem med sand ækvator og middelækvinoktium, som SGP4 arbejder i; <c1/> roterer det til koordinater fastlåst til Jorden med <c2/>.

seg-78f483dfc3fa = Hvis du ikke afstemmer, så sig det, når du rapporterer tallet: det er en udtalelse om baneskaller, <em>ikke</em> om en virkelig himmel.

seg-34fddbd3d57f = Hvor meget det betyder, er målt i <c1/>, som anvender de samme forskydninger (referencetidspunkt: den seneste epoke i de kombinerede GPS- og Galileo-fixtures, 2026-06-07T07:{ "21" }:{ "04" } UTC (Coordinated Universal Time)) gennem en tilgængelighedskørsel med to konstellationer i ARAIM (advanced receiver autonomous integrity monitoring) over { "24" } h. Under en VAL (vertical alert limit) på { "12" } m giver den afstemte himmel { "0.993" } for kun GPS, { "1.000" } for samlet GPS+Galileo og { "0.990" } for dobbelt, robust over for fejl i en konstellation; konventionen med pr. satellitepoke uden afstemning giver { "0.208" }, { "0.671" } og { "0.031" } for de samme input — en anden konklusion, ikke en lille fejl.

seg-49f6c8f71d99 = <a1><c1/></a1> — kredsløbsscenarierne.

seg-c842884cb3e7 = <a1><c1/></a1> — felterne for typen <c2/>; typerne <c3/>, <c4/>, <c5/> og <c6/> tager den samme <c7/>-tabel, og <a2><c8/></a2> tager en enkelt <c9/>.

seg-a2c5db6dcf42 = <a1><c1/></a1> — ARAIM-motoren, som testen med virkelig himmel driver.

seg-106047488885 = <c1/> — parseren (<c2/>, <c3/>).

seg-c9068c1bc579 = <s1>Forrige</s1>Resultatskema
