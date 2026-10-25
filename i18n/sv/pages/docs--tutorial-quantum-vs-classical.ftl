# docs--tutorial-quantum-vs-classical: translations (sv)

seg-501d3a72ea43 = Integritet

seg-8980b5ae869b = Siffra

seg-e5f926d1055b = Fallgropar och enheter

seg-cb457294fc53 = Vad händer härnäst

seg-a3686dd6817d = Källa: <c1/>

seg-0c2365600795 = Handledning { "3" } – Kvant mot klassisk GNSS-resiliens (slutprov)

seg-cc4017642043 = <c1/> + <c2/> · <b>Scenarier:</b> <c3/>, <c4/> (undervisningskopior: <a1><c5/></a1>, <a2><c6/></a2>) · <b>Svårighetsgrad:</b> medel · <b>~{ "35" } min</b>

seg-5de2e6656527 = Slutprovet. Du kör ett scenario med spoofing-detektor och en fullständig sammanslagen PNT-svit (positionering, navigering och tidssynkronisering) och lär dig läsa <b>säkerhet</b>, <b>integritet</b> och <b>dödräkning</b> tillsammans – hela tesen: kvanttröghet och optisk tidssynkronisering ger en resiliens som GNSS-nekande (Global Navigation Satellite System) annars skulle ta ifrån dig.

seg-ffa5242638c2 = Del A – Säkerhet: att fånga en tidsspoofing

seg-23c18da1415f = En angripare injicerar en långsamt ramprande falsk GNSS-tid ({ "0.1" } ns/s, med start vid t = { "60" } s). Mottagaren kontrollerar den angivna tiden mot sin egen klockas utrullade prediktion och flaggar spoofingen när avvikelsen passerar detektionsgränsen. Detektorn är ett tvåsidigt <b>χ²₁ / Neyman–Pearson-energitest</b> vid en falsklarmssannolikhet P_fa = { "0.01" }; måttet för säkerhet är <b><c1/></b> (ett minus sannolikheten för missad detektion) vid en spoofing av specificerad storlek ({ "20" } ns).

seg-46aa0e01b330 = <b>Kvant: <c1/>, detekterad vid { "70" } s.</b> Den optiska klockans detektionsgolv är en bråkdel av en nanosekund, så den flaggar spoofingen nästan omedelbart – långt under specifikationen på { "20" } ns.

seg-022573b3dcc4 = <b>Klassisk: <c1/>, detekterad vid { "430" } s.</b> Den chipskaliga atomklockans (CSAC:s) eget utrullningsbrus över fönstret är jämförbart med { "20" } ns, så den kan ofta inte skilja spoofingen från sin egen drift – den missar { "44" } % av gångerna.

seg-27b2b715efcb = Den icke-cirkulära oberoende referensen: analytisk mot Monte Carlo-P_md

seg-c85651eebd32 = Detektorns sannolikhet för missad detektion beräknas på <b>två oberoende sätt</b> som måste stämma överens: ett <b>slutet uttryck för χ²₁-svansen</b> (Neyman–Pearson-resultatet) och en <b>Monte Carlo</b>-skattning (MC). För CSAC är den analytiska P_md <c1/> och MC-P_md <c2/> – de stämmer inom { "0.002" }, med god marginal inom samplingsfelet <c3/>. För den optiska klockan är båda { "0.000" }. Att två separata beräkningar av <em>samma</em> sannolikhet stämmer överens är den icke-cirkulära korskontrollen (Kay, <em>Fundamentals of Statistical Signal Processing: Detection Theory</em>; standard NP-/χ²-detektion). <c4/> kontrollerar <c5/> för båda klockorna samt <c6/>.

seg-5cf0d909bac7 = Del B – Hybrid-PNT: hela den sammanslagna sviten

seg-498a57aae11d = Nu slår slutprovsscenariot samman en optisk klocka + en kallatom-tröghetsmätenhet (IMU) (kvantsviten) mot en CSAC + en IMU av navigeringsklass (den klassiska sviten), genom samma GNSS-avbrott på { "6600" } s ({ "1.83" } h), mot en tidsspecifikation på { "20" } ns och en positionsspecifikation på { "100" } m. Båda sviterna ankrar om sina klockor var { "60" } s över samma optiska tidsöverföringslänk mellan satelliter, modellerad med ett jitter på { "1" } ps per omsynkronisering (<c1/> i scenariot; <c2/> bygger en <c3/>-länk för endera sviten).

seg-61934559c7a0 = Läs uppdelningen <c1/> – holdover för tid mot holdover för position:

seg-dee5b1a35bdd = <b>Kvant: PNT-holdover { "6600" } s</b> – klarar både tid (t { "6600" } s) och position (p { "6600" } s) under hela avbrottet.

seg-6441dfa026dc = <b>Klassisk: PNT-holdover { "350" } s</b> – <em>tiden</em> klaras under hela { "6600" } s (t { "6600" } s), eftersom den optiska tidsöverföringens omsynkronisering håller även den <em>klassiska klockan</em> låst. Sviten är <b>positionsbegränsad vid p { "350" } s</b>: IMU:n av navigeringsklass är den svaga länken. Det är sammanslagningstesen – att isolera den klassiska svitens fel till dess tröghetssensor.

seg-12e9b7192733 = <b><c1/> för kvantsviten är verkligt och inte en bugg.</b> Det är filtrets egen konsistens över det brusiga omsynkroniseringsflödet – <b>inte</b> ett integritetsmått för flyg (horisontell eller vertikal skyddsnivå, HPL/VPL). Läs inte in för mycket i ordet ”integritet” här; se <a1><c2/></a1>.

seg-587efcdcbc13 = Den icke-cirkulära oberoende referensen: position-holdover på { "350" } s

seg-a70ad8fc122f = Värdet { "350" } s är dödräkningsfysik, inget anpassat tal. En konstant accelerometerbias <c1/> driver positionsfelet som <b>½·b·T²</b>. När specifikationen på { "100" } m passeras:

seg-778e817e3e9b = Motorn rapporterar { "350" } s, den sista rutnätspunkten på { "10" } s före passagen och { "2" } % under det enbart bias-baserade värdet { "357" } s: scenariots accelerometrar har också brus av typen velocity random walk (<c1/>), som läggs till biasdriften, så det modellerade felet når { "100" } m något tidigare.

seg-e105a8ab605b = Auktoritativ lag: Groves, <em>Principles of GNSS, Inertial, and Multisensor Integrated Navigation</em> (2:a uppl.), felväxt vid dödräkning. Dessa två ½bT²-värden förklarar motorns uppdelning { "350" } s / { "6600" } s: en fysikkontroll i sluten form, extern i förhållande till filtret.

seg-c2515e55dffa = Den svaga tröghetslänken syns direkt i dödräkningsscenariot (<a1><c1/></a1>, typ <c2/>): <c3/>: sensorn av navigeringsklass divergerar till tiotals kilometer.

seg-6c688f2e7136 = Så läser du de tre värdena tillsammans

seg-4f1a49d61cee = Vad det betyder här

seg-2e91989b1a89 = Vad det <b>inte</b> betyder

seg-b403ce86b14d = analytisk gräns för <em>detekterbarhet</em> av spoofing (<c1/>) för en konfigurerad attack; sammanfattningen för <c2/> skriver ut <c3/> eftersom det scenariot inte konfigurerar någon

seg-e04c25dd278d = inte en RAIM-detektor (receiver autonomous integrity monitoring) med flera satelliter

seg-7e678dd4409e = filtrets egen konsistens (sampel inom k-σ-gränsen)

seg-1643e7e71209 = inte integritet i form av HPL/VPL/RAIM för flyg

seg-4095f7ab4b14 = tid inom specifikationen efter GNSS-bortfall, uppdelad på tid och position

seg-5b90536cdfd5 = inte en 2-D-noggrannhet i form av CEP (circular error probable) eller 2DRMS (twice the distance root mean square)

seg-4b11ef3b6dba = Den äkta mottagarautonoma integriteten – verkliga HPL/VPL med larmgränser och ett Stanford-diagram – finns i paketet <c1/> (<a1><c2/></a1>); det är läsövningen på nivå 3.

seg-28cddec341ed = Vad testerna fastställer

seg-a27c3195acf3 = <c1/> – analytisk och MC-P_md stämmer inom < { "0.05" } för båda klockorna; <c2/>.

seg-78a5a0066e09 = Hybridsammanfattningen ({ "6600" } s / { "350" } s) och tröghetsuppdelningen är fastlåsta via sina undervisningsscenarier (<a1><c1/></a1>, <a2><c2/></a2>) av <c3/>, som jämför varje motorsammanfattning med raden <c4/> som filen registrerar. ½bT²-referensen ovan är fysikkontrollen av de talen.

seg-a4371822e379 = <b>Tidsmåttet (FoM) anges i nanosekunder; positionsmåttet anges i meter och i 1-DOF</b> (en frihetsgrad: en enda axel, inte CEP/2DRMS).

seg-1331ea80a427 = <c1/> är självkonsistens, inte integritet i flygtillämpning.

seg-87c49084032c = Den klassiska svitens <em>tid</em> klaras bara tack vare den optiska tidsöverföringens omsynkronisering; läs uppdelningen <c1/>, inte bara rubrikvärdet för PNT-holdover.

seg-1c93115bf118 = Kör det ärliga felfallet: <c1/> (typ <c2/>) rapporterar ett ARAIM-pass (advanced RAIM) vid sydpolen där skyddsnivåerna <em>överskrider</em> larmgränsen (HPL { "263" }–{ "452" } m > { "50" } m, { "0" } av { "24" } epoker tillgängliga), så systemet rapporteras som <b>otillgängligt</b>: en egenskap, inte en bugg.

seg-ac70d3131064 = För berättelsen vidare till låg jordbana (LEO): <c1/> (typ <c2/>) kedjar en GNSS-jamming-fas, ett LEO-positioneringslager som bär användaren genom den och en integritetskontroll på en och samma tidslinje. Se <a1>de nyare förmågorna</a1> för de andra scenarierna för resiliens och vertikaler.

seg-063422d3c70b = Försvara ett resultat: gör <a1>övningen på nivå 3</a1> – Monte Carlo-band, reproducerbarhet och att läsa en skyddsnivå.

seg-4f7275a21f44 = <s1>Föregående</s1>{ "2" } · Klock-holdover

seg-8b0c90f82aab = <s1>Nästa</s1>Genomgånget exempel: pipeline med flera verktyg
