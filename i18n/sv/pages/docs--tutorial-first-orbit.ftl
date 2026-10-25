# docs--tutorial-first-orbit: translations (sv)

seg-51ae9468b92a = Vad det här scenariot är

seg-08f3fdc9252a = Läs enradssammanfattningen

seg-def5271a207d = Vad testet fastställer

seg-e5f926d1055b = Fallgropar och enheter

seg-cb457294fc53 = Vad händer härnäst

seg-dcb2d0b170c1 = Källa: <c1/>

seg-f57d8b38bf08 = Handledning { "1" } – Min första bana: var finns GPS-satelliterna

seg-1b9e1178555d = <c1/> · <b>Scenario:</b> <c2/> (undervisningskopia: <a1><c3/></a1>) · <b>Svårighetsgrad:</b> nybörjare · <b>~{ "15" } min</b>

seg-d065731294a1 = I slutet har du propagerat den <em>verkliga</em> operativa GPS-konstellationen, läst av dess tillgänglighet och geometri och exporterat en tabell över var varje satellit faktiskt befinner sig i rymden – och du vet att tabellen är validerad mot en extern referens, inte mot sig själv.

seg-b07bb365235d = GPS-satelliter (Global Positioning System) talar om för en användare <em>var den befinner sig</em> och <em>vad klockan är</em>. Innan dess behöver du veta <b>var satelliterna finns</b> och <b>hur många av dem en användare kan se</b>. Det är geometri, och geometrin sätter golvet för hur noggrant du kan positioneras (precisionsförsämringen, dilution of precision, DOP). Den här handledningen:

seg-dec5079e7715 = tar en äkta ögonblicksbild av GPS-konstellationen från Celestrak <c1/> (2021-07-28, { "30" } satelliter, verkliga tvåradiga elementmängder, TLE),

seg-693859c435d8 = propagerar varje satellit med den validerade SGP4/SDP4-modellen (Simplified General Perturbations { "4" } / Simplified Deep-space Perturbations { "4" }),

seg-74b73260c7bc = räknar vid varje tidssteg ut vilka satelliter en användare i låg jordbana kan se (siktlinje, jordens skymning och en elevationsmask på { "5" }°),

seg-605c40b73e96 = omvandlar den geometrin till en <b>PDOP</b> (positionens precisionsförsämring) och en <b>positionsnoggrannhet</b>, och

seg-356e96d219b5 = exporterar satelliternas faktiska jordcentrerade, jordfasta (ECEF) positioner till en SP3-fil (Standard Product { "3" }, det precisa banformatet från International GNSS Service, IGS; GNSS är Global Navigation Satellite System).

seg-ff1666fe175e = Kedjan är: <b>TLE → SGP4-propagering → ECEF per epok → synlighet → antal synliga satelliter → PDOP → positions-sigma = PDOP · σ_UERE</b>, där σ_UERE är användarens ekvivalenta avståndsfel (avståndsfelet på 1 σ per satellit).

seg-379da723ae57 = Eller öppna <a1>webbläsarens Studio</a1> och välj omloppsscenariot.

seg-441743833f1e = Den deterministiska körningen (frö = { "17" }) skriver ut:

seg-918a30fea48a = Fält för fält:

seg-375fad797dcf = <b><c1/></b> – scenariots hash på 12 tecken. Den är ett fingeravtryck av exakt de indata som används (frö, trösklar, modellparametrar, TLE-blocket). Ändra en indata så ändras hashen; behåll dem och du återskapar körningen bit för bit. Samma hash är instämplad i diagrammets sidfot och i resultatfilen i JSON (JavaScript Object Notation).

seg-133711d1ad9f = <b><c1/></b> – av { "361" } tidssteg har användaren en användbar positionsbestämning vid { "345" } av dem ({ "95.6" } %). Körningen är ett pass på { "12" } h ({ "43,200" } s) med steget { "120" } s.

seg-a500c0473784 = <b><c1/></b> – den bästa (lägsta) positionsprecisionsförsämringen under passet. En PDOP nära { "1" } är utmärkt geometri; ju lägre desto bättre.

seg-98a24f0170d2 = <b><c1/></b> – den bästa positionsnoggrannheten: <b>positions-sigma = PDOP · σ_UERE</b>. I det här scenariot gäller <c2/>, så de två talen är här <em>numeriskt lika</em> – men regeln är PDOP × UERE, <b>inte</b> ”position = PDOP”. Med en UERE på { "3" } m skulle positions-sigma vara ~{ "3.2" } m. (Se fallgropen i slutet.)

seg-410081c6dcab = Klockvärdena (<c1/>, <c2/>, <c3/>, <c4/>) följer med eftersom omloppspaketet också bär en klocka genom passet; de är fokus i <a1>handledning { "2" }</a1>, inte i den här. (<c5/> visar <c6/> eftersom ingen attack är konfigurerad.)

seg-95ccef0d94ae = Geometriblocket i JSON innehåller de underliggande talen:

seg-89cb7db9b9eb = Var finns satelliterna? (belöningen)

seg-81678afa0cee = Geometrin är bra <em>därför att</em> satelliterna verkligen befinner sig i GPS-skalet. Bevisa det – exportera deras jordfasta positioner:

seg-1452dfac9e06 = De tre första satelliterna vid det första samplingssteget, ECEF i km (SP3-filen har en fjärde klockkolumn, skriven med markören { "999999.999999" } för ”inget värde”):

seg-4fd0f95da0cf = Ta PG01:s geocentriska radie:

seg-cb02d7c01561 = Den icke-cirkulära oberoende referensen: är detta verkligen en GPS-bana?

seg-a7c478360464 = En handledning som kontrollerar motorn mot sig själv bevisar ingenting. Här är det externa, <em>icke-cirkulära</em> stödet för varje påstående ovan.

seg-eec62069a957 = <b>{ "1" }. Satelliterna ligger i det verkliga GPS-skalet i medelhög jordbana (MEO).</b> GPS nominella halva storaxel är <b>a = { "26,560" } km</b>, höjd ≈ { "20,180" } km över jordens medelradie på { "6,378" } km (IS-GPS-200, gränssnittsspecifikationen för GPS; GPS Standard Positioning Service (SPS) Performance Standard, US Department of Defense (DoD); Misra & Enge, <em>Global Positioning System</em>, 2:a uppl.). PG01:s momentana radie på <b>{ "26,480.9" } km</b> ligger inom några hundra km från <c1/> – precis vad verklig GPS-excentricitet (~{ "0.005" }–{ "0.02" }) ger. Testet <c2/> kontrollerar <c3/> mot detta publicerade <c4/>, som är <b>externt i förhållande till Kshana</b>.

seg-a052774de08f = <b>{ "2" }. Passets längd är ett GPS-varv.</b> Keplers tredje lag ger omloppstiden <c1/> med <c2/> och <c3/> (World Geodetic System { "1984" }, WGS-84; tekniska rapporten NIMA TR8350.2 från National Imagery and Mapping Agency): <c4/>, ett halvt siderisk dygn. Scenariots varaktighet på { "43,200" } s (”ungefär ett GPS-varv”) stämmer med det inom { "0.3" } %, och GPS markspår upprepas varje siderisk dygn (två varv), enligt IS-GPS-200.

seg-067fb466e396 = <b>{ "3" }. De propagerade positionerna är validerade, inte bara självkonsistenta.</b> SGP4/SDP4-propagatorn som tog fram denna ECEF-tabell stämmer med <b>alla { "666" } verifieringsvektorer i AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 med ett värsta fall på { "4.12" } mm</b> (<c1/>, <a1><c2/></a1>) och stämmer med den oberoende <c3/>-craten inom en bråkdel av en mikrometer. Tabellen du exporterade är alltså kontrollerad mot en extern referensimplementering, inte mot Kshanas egen aritmetik.

seg-652ec3b3d3b8 = <b>En anmärkning om SP3-datumen.</b> SP3-epokhuvudet visar ett platshållardatum (2000-01-01); propageringen utgår i själva verket från varje TLE:s egen epok ({ "2021" }). Läs tabellen som ”ECEF-positioner vid det första samplingssteget”, inte ”den { "1" } jan { "2000" }”.

seg-74dcb96a27a9 = <c1/> gör varje tal ovan till ett CI-kontrakt:

seg-cbad1e83279d = <c1/> – <c2/>, <c3/> (eftersom <c4/>), <c5/>, och sammanfattningen innehåller <c6/>.

seg-241d75b1502b = <c1/> – PG01:s radie ligger i GPS-skalets band, kontrollerat mot det publicerade <c2/>.

seg-34328f4f148b = Om motorn någonsin slutar producera ett verkligt GPS-skal blir bygget rött.

seg-3c23c11911cb = <b>Positions-sigma är PDOP × UERE, inte PDOP.</b> De är lika <em>bara därför att</em> <c1/> här. Ändra UERE så skiljer de sig åt.

seg-6bb2f31c15dc = <b>Tidssynkroniseringsvärdena anges i nanosekunder</b>, positionsvärdet i meter. Blanda inte ihop dem.

seg-5bc68d0c144d = <b><c1/> är kvantiserat till rutnätet</b> (en nedre gräns vid tidsrutnätets steg). I det här passet har användaren i princip alltid positionsbestämning, så holdover är { "0" } s (inget avbrott att ta sig igenom) – det är det <em>goda</em> fallet.

seg-9c36a5c64af5 = Skärp eller vidga elevationsmasken (<c1/>) och se hur tillgängligheten ändras – det är en övning på nivå 2.

seg-b0222934237e = Byt in en färsk TLE-ögonblicksbild med <c1/> (nivå 2, ”använd färska data”).

seg-e487166204f8 = Gå vidare till <a1>handledning { "2" } – Klock-holdover</a1>, där GNSS-signalen <em>tas bort</em> och den inbyggda klockan måste klara sig själv.

seg-795315608752 = <s1>Föregående</s1>Handledningar

seg-97ca5a3cc77e = <s1>Nästa</s1>{ "2" } · Klock-holdover
