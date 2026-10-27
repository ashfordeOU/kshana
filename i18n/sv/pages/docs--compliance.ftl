# docs--compliance: translations (sv)

seg-f65b1f2b4182 = Läge

seg-e19db3d5273b = Källa: <c1/>

seg-045b24defdbb = Kartläggning av integritet enligt DO-316 / DO-229E

seg-9100800daa1c = Det här dokumentet kartlägger RTCA:s (tidigare Radio Technical Commission for Aeronautics) krav på skyddsnivåer och integritetsövervakning i <b>DO-229E</b> (SBAS (satellitbaserat förstärkningssystem) MOPS (minimikrav på operativ prestanda)) och <b>DO-316</b> (GPS/SBAS (GPS: Global Positioning System) luftburen utrustning) mot de Kshana-funktioner som implementerar dem. Det är ett <b>tekniskt spårbarhetsstöd</b>, inte ett uttalande om att något krav är uppfyllt — Kshana implementerar de publicerade algoritmerna; det är inte godkänd avionik.

seg-0e6ec5617eb5 = Den maskinläsbara formen är <a1><c1/></a1>; den här texten är dess följeslagare (en spegling av <a2><c2/></a2>).

seg-d5d7a2ec9c73 = Skyddsnivåer med viktad minsta kvadratmetod (DO-229E Appendix J)

seg-0dc19f403f5e = För varje satellit <em>i</em> med elevation <c1/> och azimut <c2/> hos användaren är observationsraden i lokalt plan (ENU (öst-nord-upp) + klocka)

seg-6415f7f28e7e = med vikt <c1/>, <c2/> (budgeten för UDRE (användarens differentiella avståndsfel) / GIVE (rutnätets vertikala jonosfärsfel) / luftburet / troposfär). Positionskovariansen är <c3/>; dess ENU-block ger de horisontella och vertikala skyddsnivåerna (HPL, VPL):

seg-ea574448bda4 = Kshana beräknar <c1/> genom att invertera normalmatrisen { "4" }×{ "4" } med samma rutin som RAIM-stacken (receiver autonomous integrity monitoring) använder (<c2/>), och validerar resultatet på två sätt (kovariansvägen <c3/> och projektionsvägen <c4/> måste stämma överens) samt mot en oberoende numpy-referensgeometri <c5/>.

seg-f63dd3d7aad4 = Källa

seg-268ae5b25684 = Flygning på färdväg → NPA (icke-precisionsinflygning; endast horisontellt)

seg-479790ca91c3 = Rayleigh <c1/> = { "6.1829" }

seg-dbae96c75a06 = Precisionsinflygning

seg-1bfafdcf6ab0 = DO-229E MOPS

seg-1922c53b8340 = Ärlighetsnotering: MOPS använder den avrundade horisontella konstanten <c1/>; den exakta tvåsidiga normalkvantilen <c2/> är <c3/>. Kshana använder den publicerade { "6.0" } i koden och härleder <c4/> med samma <c5/> som RAIM-stacken använder, en icke-cirkulär korskontroll (värdet avrundas till MOPS { "5.33" }).

seg-ef191c1d3db1 = Jonosfärsfri kombination av L1/L5 med två frekvenser (IS-GPS-705)

seg-b69825ef05d3 = Med <c1/>, <c2/>, <c3/>:

seg-ce81c6b71738 = Jonosfärsfördröjningen av första ordningen (<c1/>) upphävs exakt — verifierat mot motorns oberoende <c2/>-fysik för ett antal TEC-värden (totalt elektroninnehåll). Brusförstärkningen för indata med lika varians är <c3/>.

seg-e111fb05a7c6 = <b>I repot, automatiserat</b> (vid varje commit): K-faktorerna mot sina fördelningsdefinitioner, <c1/> och koefficienterna för den jonosfärsfria (IF) kombinationen mot frekvenserna i IS-GPS-705 (IS: Interface Specification), upphävandet av jonosfärens första ordning mot den oberoende fördröjningsfysiken, och skyddsnivåerna med viktad minsta kvadratmetod (WLS) mot en numpy-referensgeometri <c2/> (<c3/>).

seg-f30d84abe275 = <b>Extern oberoende referens, automatiserad</b> (<c1/>): givet varje satellits elevation, azimut och totala 1-σ återger <c2/> HPL från en oberoende implementation, <c3/> i RTKLIB:s (ett öppen källkod-bibliotek för kinematisk positionering i realtid) gaffel för SBAS-skyddsnivåer <c4/> (Siki & Takács { "2017" }), på sex epoker som det verktyget beräknade från <b>verkliga EGNOS (European Geostationary Navigation Overlay Service)</b>-sändningsmeddelanden (geostationär PRN (pseudoslumpkodens nummer) { "120" }) och verkliga RINEX (Receiver Independent Exchange Format)-observationer från stationen BUTE i Budapest (2017-02-19), till <b>< { "2e-3" } m</b>. Referensen avrundar K_V till { "5.33" }, så den vertikala jämförs utan K-faktor, som <c5/> mot dess VPL / { "5.33" }. ESA:s (European Space Agency) gLAB { "v6.0.0" } (<c6/>) använder samma formel.

seg-389e8a57e3e8 = <b>Inte gjort</b>: den satellitvisa σ är referensens egen; att modellera σ från råa UDRE/GIVE-meddelanden ligger utanför omfattningen, och ingen officiell publicerad skyddsnivåprodukt från WAAS (Wide Area Augmentation System) eller EGNOS har återskapats från början till slut. DO-229E/DO-316 är själva avgiftsbelagda hos RTCA; den öppna härledningskällan är ESA Navipedias sidor om ICAO/EGNOS (ICAO: International Civil Aviation Organization) SBAS.

seg-7686fb3d3e0c = <s1>Föregående</s1>ARAIM-referens

seg-0457ef382fb0 = <s1>Nästa</s1>Resiliens-crosswalk
