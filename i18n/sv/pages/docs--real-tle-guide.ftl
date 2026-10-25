# docs--real-tle-guide: translations (sv)

seg-a6da23b43f90 = <s1>Nästa</s1>Kampanjer

seg-bc9ae2eda129 = Källa: <c1/>

seg-68b27f011ced = Använda TLE:er för verkliga konstellationer

seg-109e8a920fc2 = Den medföljande <c1/> har redan <b>verkliga TLE:er</b> (tvåradiga elementmängder): ögonblicksbilden <c2/> från Celestrak av den operativa GPS-konstellationen (Global Positioning System) katalogiserad 2021-07-28, { "30" } satelliter, med <c3/>. Varje satellit propageras med SGP4/SDP4 (Simplified General Perturbations { "4" } / Simplified Deep-space Perturbations { "4" }), som är validerad mot de officiella vektorerna i AIAA (American Institute of Aeronautics and Astronautics) 2006-6753. Samma ögonblicksbild medföljer som <c4/>, och <c5/> hämtar en ny. Läs avsnitt { "3" } innan du citerar ett geometritalvärde från den: det scenariot propagerar varje satellit från sin egen epok.

seg-faed28835cb2 = För ett syntetiskt, självständigt exempel ger <c1/> sex GPS-liknande satelliter som rena rad 2-poster, propagerade som analytiska keplerska element, och varje <c2/>-scenario utan ett <c3/>-block bygger en Walker-konstellation.

seg-1c9b96a07f5b = För att studera den <b>aktuella</b> GPS-konstellationen (eller någon annan), lägg in en ny ögonblicksbild.

seg-95bb71044de0 = { "1" }. Hämta en aktuell ögonblicksbild

seg-ab93ab55ddd9 = <a1>Celestrak</a1> vidaredistribuerar elementmängderna ur NORAD-katalogen (North American Aerospace Defense Command), uppdaterade minst dagligen. För GPS:

seg-da7b4b89848b = Andra användbara grupper: <c1/>, <c2/> (GLONASS, Rysslands globala satellitnavigeringssystem), <c3/>, <c4/> (ISS, Internationella rymdstationen, och andra bemannade stationer).

seg-d7fe0dccbc36 = Filen är en följd av poster med tre rader (namn, rad { "1" }, rad { "2" }). Kshanas tolkare ignorerar namnrader, så du kan klistra in filen som den är.

seg-c2d6ca2089a1 = { "2" }. Lägg in den i ett scenario

seg-6e221c5b640a = Ange i vilket banscenario som helst konstellationens <c1/>-block till ögonblicksbildens innehåll:

seg-f2b0e78ef568 = (PRN är numret på den pseudoslumpkod som en GPS-satellit sänder.)

seg-976bcb48df94 = Ett par med rad { "1" } + rad { "2" } propageras med <b>SGP4/SDP4</b> (termer för luftmotstånd och djuprymd); en ensam rad { "2" } behandlas som analytiska keplerska medelelement. De två kan blandas.

seg-fa1d59fc7817 = <c1/> avvisar varje rad vars kontrollsumma modulo 10 i kolumn 69 är fel — en bra integritetskontroll av en nyligen nedladdad fil. Standardvärdet är <c2/> eftersom de syntetiska undervisningsscenarierna använder platshållare som kontrollsummor.

seg-90d3872ebf87 = { "3" }. Anmärkningar om epoker — läs det här innan du citerar ett geometritalvärde

seg-5e9056a30d53 = SGP4 propagerar varje satellit från <b>sin egen TLE-epok</b>, och <c1/> (i <c2/>) returnerar bara propagatorer, så scenariotiden <c3/> tillämpas som <c4/> på varje satellit oberoende av de andra. Det är rätt konvention bara om alla elementmängder i filen har samma epok.

seg-3d04797ae50e = <b>En gruppfil från Celestrak ger dig inte det.</b> Filen <em>laddas ned</em> vid ett ögonblick, men varje satellits elementmängd uppdateras i sin egen takt, så epokerna i den är spridda över dygn. Uppmätt på mängderna som medföljer i det här repot (rad { "1" }, kolumnerna { "19" }–{ "32" }):

seg-5f67557dd207 = testdata

seg-ce4855643f31 = mängder

seg-49a5b4798be4 = epokspridning

seg-b758a9b7ee02 = { "70.6" } h

seg-79e6ea88957c = { "76.4" } h

seg-e1e30f69fa4f = { "335.7" } h

seg-9d38cc073c94 = { "70.6" } h är { "5.9" } GPS-varv. Propagerad som den är blir fasläget i banplanet förvrängt: satelliterna befinner sig på rätt höjder och med rätt inklinationer, men inte där de var under någon enskild dag, så den synliga mängden, DOP (geometrisk försämring av precisionen) och all tillgänglighet som beräknas ur dem beskriver en konstellation som aldrig har funnits. Ingenting i tolkaren mäter den här spridningen åt dig, och typerna <c1/> och <c2/> justerar inte epoker: ett TLE-block i ett scenario propageras alltid per satellitepok.

seg-fa82a18e4418 = <b>Gör så här i stället.</b> Behåll epoken tillsammans med propagatorn, välj ett gemensamt referensögonblick och förskjut varje satellits <c1/> till det. <c2/> är publik, så tolkningsslingan blir kort; <c3/> (<c4/>) är det genomgångna exemplet i det här trädet:

seg-78092818695e = TEME är det system med sant ekvatorsplan och medelekvinoktium som SGP4 arbetar i; <c1/> roterar det till jordfasta koordinater med <c2/>.

seg-78f483dfc3fa = Om du inte justerar, säg det när du redovisar talet: det är ett påstående om <em>banskal</em>, inte om en verklig himmel.

seg-34fddbd3d57f = Hur mycket det spelar roll mäts i <c1/>, som tillämpar samma förskjutningar (referensögonblick: den senaste epoken i de kombinerade GPS- och Galileo-testdata, 2026-06-07T07:{ "21" }:{ "04" } UTC (koordinerad universell tid)) genom en { "24" } h lång tillgänglighetskörning med ARAIM (avancerad autonom integritetsövervakning i mottagaren) för två konstellationer. Med en VAL (vertikal larmgräns) på { "12" } m ger den justerade himlen { "0.993" } för enbart GPS, { "1.000" } för sammanslagen GPS+Galileo och { "0.990" } för den dubbla som är robust mot konstellationsfel; konventionen med oinjusterad epok per satellit ger { "0.208" }, { "0.671" } och { "0.031" } för samma indata — en annan slutsats, inte ett litet fel.

seg-49f6c8f71d99 = <a1><c1/></a1> — banscenarierna.

seg-c842884cb3e7 = <a1><c1/></a1> — fälten för typen <c2/>; typerna <c3/>, <c4/>, <c5/> och <c6/> tar samma <c7/>-tabell, och <a2><c8/></a2> tar en enda <c9/>.

seg-a2c5db6dcf42 = <a1><c1/></a1> — ARAIM-motorn som testet mot verklig himmel driver.

seg-106047488885 = <c1/> — tolkaren (<c2/>, <c3/>).

seg-c9068c1bc579 = <s1>Föregående</s1>Resultatschema
