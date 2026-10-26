# docs--tutorial-quantum-vs-classical: translations (nl)

seg-501d3a72ea43 = Integriteit

seg-8980b5ae869b = Cijfer

seg-e5f926d1055b = Valkuilen en eenheden

seg-cb457294fc53 = Hoe nu verder

seg-a3686dd6817d = Bron: <c1/>

seg-0c2365600795 = Tutorial { "3" } — Quantum tegenover klassieke GNSS-veerkracht (sluitstuk)

seg-cc4017642043 = <c1/> + <c2/> · <b>Scenario's:</b> <c3/>, <c4/> (leerversies: <a1><c5/></a1>, <a2><c6/></a2>) · <b>Moeilijkheid:</b> gevorderd · <b>~{ "35" } min</b>

seg-5de2e6656527 = Het sluitstuk. U draait een scenario met een spoofingdetector en een volledige gefuseerde suite voor positiebepaling, navigatie en tijdsynchronisatie (PNT), en leert <b>beveiliging</b>, <b>integriteit</b> en <b>dead-reckoning</b> samen te lezen — de hele stelling: quantum-inertie plus optische tijdsynchronisatie leveren veerkracht op die het wegvallen van GNSS (Global Navigation Satellite System) anders zou wegnemen.

seg-ffa5242638c2 = Deel A — Beveiliging: een tijdspoof betrappen

seg-23c18da1415f = Een aanvaller injecteert een langzaam oplopende valse GNSS-tijd ({ "0.1" } ns/s, vanaf t = { "60" } s). De ontvanger vergelijkt de opgegeven tijd met de voorspelling van zijn eigen klok tijdens het doorlopen en markeert de spoof zodra het verschil de detectiegrens overschrijdt. De detector is een tweezijdige <b>χ²₁ / Neyman–Pearson-energietest</b> bij een kans op vals alarm P_fa = { "0.01" }; de kwaliteitsmaat voor beveiliging is <b><c1/></b> (één min de kans op gemiste detectie) bij een spoof ter grootte van de specificatie ({ "20" } ns).

seg-46aa0e01b330 = <b>Quantum: <c1/>, gedetecteerd na { "70" } s.</b> De detectiedrempel van de optische klok is een fractie van een nanoseconde, dus hij markeert de spoof vrijwel meteen — ver onder de specificatie van { "20" } ns.

seg-022573b3dcc4 = <b>Klassiek: <c1/>, gedetecteerd na { "430" } s.</b> De eigen doorloopruis van de atoomklok op chipschaal (CSAC) over het venster is vergelijkbaar met { "20" } ns, dus hij kan de spoof vaak niet van zijn eigen drift onderscheiden — hij mist { "44" } % van de tijd.

seg-27b2b715efcb = De niet-circulaire onafhankelijke referentie: analytische tegenover Monte-Carlo-P_md

seg-c85651eebd32 = De kans op gemiste detectie van de detector wordt op <b>twee onafhankelijke manieren</b> berekend die moeten overeenkomen: een <b>gesloten-vorm-χ²₁-staart</b> (het resultaat van Neyman–Pearson) en een <b>Monte-Carlo</b>-schatting (MC). Voor de CSAC is de analytische P_md <c1/> en de MC-P_md <c2/> — ze komen overeen tot op { "0.002" }, ruim binnen de bemonsteringsfout <c3/>. Voor de optische klok zijn beide { "0.000" }. Dat twee afzonderlijke berekeningen van <em>dezelfde</em> kans overeenkomen, is de niet-circulaire kruiscontrole (Kay, <em>Fundamentals of Statistical Signal Processing: Detection Theory</em>; standaard NP-/χ²-detectie). <c4/> eist <c5/> voor beide klokken en <c6/>.

seg-5cf0d909bac7 = Deel B — Hybride PNT: de volledige gefuseerde suite

seg-498a57aae11d = Nu fuseert het sluitstukscenario een optische klok + een koudeatoom-inertiële meeteenheid (IMU) (quantumsuite) tegenover een CSAC + een IMU van navigatiekwaliteit (klassieke suite), door dezelfde GNSS-uitval van { "6600" } s ({ "1.83" } h), tegen een tijdsynchronisatiespecificatie van { "20" } ns en een positiespecificatie van { "100" } m. Beide suites zetten hun klokken elke { "60" } s opnieuw vast via dezelfde optische tijdoverdrachtsverbinding tussen satellieten, gemodelleerd met een jitter van { "1" } ps per hersynchronisatie (<c1/> in het scenario; <c2/> bouwt één <c3/>-verbinding voor beide suites).

seg-61934559c7a0 = Lees de splitsing <c1/> — holdover van tijdsynchronisatie tegenover holdover van positie:

seg-dee5b1a35bdd = <b>Quantum: PNT-holdover { "6600" } s</b> — houdt zowel de tijdsynchronisatie (t { "6600" } s) als de positie (p { "6600" } s) de hele uitval vol.

seg-6441dfa026dc = <b>Klassiek: PNT-holdover { "350" } s</b> — de <em>tijdsynchronisatie</em> houdt de volle { "6600" } s vol (t { "6600" } s), omdat de optische tijdoverdracht met hersynchronisatie zelfs de <em>klassieke klok</em> vergrendeld houdt. De suite is <b>positiebeperkt bij p { "350" } s</b>: de IMU van navigatiekwaliteit is de zwakke schakel. Dit is de fusiestelling — het falen van de klassieke suite wordt teruggebracht tot haar inertiële sensor.

seg-12e9b7192733 = <b><c1/> voor de quantumsuite is echt en is geen bug.</b> Het is de zelfconsistentie van het filter over ruisende hersynchronisatie — <b>niet</b> een integriteitscijfer uit de luchtvaart (horizontaal of verticaal beschermingsniveau, HPL/VPL). Lees het woord “integriteit” hier niet te letterlijk; zie <a1><c2/></a1>.

seg-587efcdcbc13 = De niet-circulaire onafhankelijke referentie: de positie-holdover van { "350" } s

seg-a70ad8fc122f = Het cijfer van { "350" } s is dead-reckoning-fysica, geen gefit getal. Een constante versnellingsmeterbias <c1/> laat de positiefout groeien als <b>½·b·T²</b>. Het passeren van de specificatie van { "100" } m:

seg-778e817e3e9b = De engine meldt { "350" } s, het laatste rasterpunt van { "10" } s vóór de doorgang en { "2" } % korter dan de { "357" } s met alleen bias: de versnellingsmeters van het scenario hebben ook velocity-random-walk-ruis (<c1/>), die bij de biasdrift komt, zodat de gemodelleerde fout iets eerder { "100" } m bereikt.

seg-e105a8ab605b = Gezaghebbende wet: Groves, <em>Principles of GNSS, Inertial, and Multisensor Integrated Navigation</em> (2e druk), groei van de dead-reckoning-fout. Deze twee ½bT²-waarden verklaren de splitsing { "350" } s / { "6600" } s van de engine: een fysische controle in gesloten vorm, extern aan het filter.

seg-c2515e55dffa = U ziet de inertiële zwakke schakel rechtstreeks in het dead-reckoning-scenario (<a1><c1/></a1>, soort <c2/>): <c3/>: de sensor van navigatiekwaliteit loopt uiteen tot tientallen kilometers.

seg-6c688f2e7136 = Hoe u de drie cijfers samen leest

seg-4f1a49d61cee = Wat het hier betekent

seg-2e91989b1a89 = Wat het <b>niet</b> betekent

seg-b403ce86b14d = analytische grens voor de <em>detecteerbaarheid</em> van spoofing (<c1/>) voor een geconfigureerde aanval; de samenvatting van <c2/> drukt <c3/> af omdat dat scenario er geen configureert

seg-e04c25dd278d = geen RAIM-detector (receiver autonomous integrity monitoring) met meerdere satellieten

seg-7e678dd4409e = zelfconsistentie van het filter (samples binnen de k-σ-grens)

seg-1643e7e71209 = geen HPL/VPL/RAIM-integriteit uit de luchtvaart

seg-4095f7ab4b14 = tijd binnen de specificatie na verlies van GNSS, gesplitst in tijdsynchronisatie en positie

seg-5b90536cdfd5 = geen 2-D-nauwkeurigheid in CEP (circular error probable) of 2DRMS (twice the distance root mean square)

seg-4b11ef3b6dba = De echte integriteit met autonome ontvangercontrole — echte HPL/VPL met alarmlimieten en een Stanford-diagram — zit in het pakket <c1/> (<a1><c2/></a1>); dat is de leesoefening van Tier-3.

seg-28cddec341ed = Wat de tests vastleggen

seg-a27c3195acf3 = <c1/> — analytische en MC-P_md komen overeen tot op < { "0.05" } voor beide klokken; <c2/>.

seg-78a5a0066e09 = De hybride samenvatting ({ "6600" } s / { "350" } s) en de inertiële splitsing worden vastgelegd via hun leerscenario's (<a1><c1/></a1>, <a2><c2/></a2>) door <c3/>, dat elke enginesamenvatting vergelijkt met de regel <c4/> die het bestand vastlegt. De ½bT²-controle hierboven is de fysische controle op die getallen.

seg-a4371822e379 = <b>De kwaliteitsmaat (figure of merit, FoM) voor tijdsynchronisatie is in nanoseconden; de FoM voor positie is in meters en 1-DOF</b> (één vrijheidsgraad: één as, niet CEP/2DRMS).

seg-1331ea80a427 = <c1/> is zelfconsistentie, geen integriteit uit de luchtvaart.

seg-87c49084032c = De <em>tijdsynchronisatie</em> van de klassieke suite overleeft alleen dankzij de optische tijdoverdracht met hersynchronisatie; lees de splitsing <c1/>, niet alleen de kop-PNT-holdover.

seg-1c93115bf118 = Draai het geval van eerlijk falen: <c1/> (soort <c2/>) meldt een ARAIM-passage (advanced RAIM) op de zuidpool waarbij de beschermingsniveaus de alarmlimiet <em>overschrijden</em> (HPL { "263" }–{ "452" } m > { "50" } m, { "0" } van { "24" } epochs beschikbaar), zodat het systeem als <b>niet beschikbaar</b> wordt gemeld: een eigenschap, geen bug.

seg-ac70d3131064 = Neem het verhaal mee naar een lage baan om de aarde (LEO): <c1/> (soort <c2/>) koppelt een fase met GNSS-jamming, een LEO-positioneringslaag die de gebruiker erdoorheen draagt, en een integriteitscontrole op één tijdlijn. Zie <a1>de nieuwere mogelijkheden</a1> voor de andere scenario's over veerkracht en verticale toepassingen.

seg-063422d3c70b = Verdedig een resultaat: doe de <a1>oefening van Tier-3</a1> — Monte-Carlo-banden, reproduceerbaarheid en het lezen van een beschermingsniveau.

seg-4f7275a21f44 = <s1>Vorige</s1>{ "2" } · Klok-holdover

seg-8b0c90f82aab = <s1>Volgende</s1>Uitgewerkt voorbeeld: pijplijn met meerdere hulpmiddelen
