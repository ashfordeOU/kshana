# docs--ssv: translations (sv)

seg-0857a94a948e = Begränsningar

seg-75c8da01c0f1 = MET

seg-069a652c402e = tröskel

seg-1f79a5aae6c5 = Signaltillgänglighet för en användare på en sfär på { "36000" } km höjd med en halvsfärsantenn, från en verklig körning av motor v{ $version } på scenarios/gnss-ssv-shell.toml (en reducerad körning: { "162" } användare, { "3" } dagar, { "10" } min steg), vid en tröskel på { "20" } dB-Hz. För varje konstellation och band två staplar: andelen (användare, epok)-par med minst en signal och med minst fyra. Kombinerat, L1: { "99.4" } % minst en, { "73.2" } % minst fyra, längsta avbrott under fyra signaler { "160" } min. Kombinerat, L5: { "100.0" } % minst en, { "99.9" } % minst fyra, längsta avbrott under fyra signaler { "20" } min. MODELLED: en modellerad studie från angivna indata, inte en mätning och inte ett anspråk på tjänstevolym för något system. Den reducerade storleken är inte jämförelsen med häftet. Rådgivande: analysutdata från ett forsknings- och teknikverktyg, inte typgodkänd navigationsutrustning och inte en safety-of-life-tjänst.

seg-92ef8e0b78de = Signaler längs en hög jordbana (perigeum { "497" } km, apogeum { "58622" } km, omloppstid { "18.8" } h), från en verklig körning av motor v{ $version } på scenarios/gnss-ssv-heo.toml, band L1. Överst: den bästa bärvågs-brusdensiteten bland signalerna i sikte, mot tröskeln på { "20" } dB-Hz. Mitten: antalet signaler i sikte från alla konstellationer, från { "4" } till { "55" } längs de samplade punkterna. Av de mottagna länkarna kom { "2252" } genom en huvudlob och { "696" } genom sidolober, med ett märkt parametriskt ersättningsdiagram, inte något systems uppmätta diagram. Median-PDOP { "67" }, 95:e percentilen { "358" }. MODELLED: en modellerad studie från angivna indata, inte en mätning och inte ett anspråk på tjänstevolym för något system. Rådgivande: analysutdata från ett forsknings- och teknikverktyg, inte typgodkänd navigationsutrustning och inte en safety-of-life-tjänst.

seg-902c5c7da9aa = Ett nio-tillståndsfilter ombord på en överföring från låg bana mot månen, från en verklig körning av motor v{ $version } på scenarios/gnss-ssv-nav-lunar.toml ({ "289" } epoker, { "13" } punkter ritade). På en logaritmisk axel, det sanna positionsfelet och filtrets egen ett-sigma-gräns mot tid sedan start. Innanför GNSS-banorna är positions-RMS { "1.4" } m; ovanför dem är det { "90" } m, med slutfelet { "184" } m på { "193,330" } km höjd med { "1" } mätning. Genomsnittligt normaliserat estimeringsfel i kvadrat över hela körningen är { "4.4" } (omkring { "3" } för ett konsistent positionsblock). Referens och filter delar sina ersättningar för solen och månen. MODELLED: en modellerad studie från angivna indata, inte en mätning och inte ett anspråk på tjänstevolym för något system. Rådgivande: analysutdata från ett forsknings- och teknikverktyg, inte typgodkänd navigationsutrustning och inte en safety-of-life-tjänst.

seg-9a947b61a4cb = Relativ navigering av { "2" } deputies kring en chief på en hög bana, från en verklig körning av motor v{ $version } på scenarios/gnss-ssv-formation-heo.toml ({ "401" } epoker). För varje deputy två staplar: den relativa positions-RMS från att subtrahera de två oberoende absoluta skattningarna, och från det relativa filtret på enkeldifferentierade pseudoavstånd. Baslinje { "0.8" } km: { "5.1" } m och { "1.2" } m. Baslinje { "2.0" } km: { "4.1" } m och { "2.1" } m. Det absoluta filtret är inte konsistent här: genomsnittligt normaliserat estimeringsfel i kvadrat { "187" } mot omkring { "3" } för ett konsistent filter, så dess angivna osäkerhet är alldeles för liten. MODELLED: en modellerad studie från angivna indata, inte en mätning och inte ett anspråk på tjänstevolym för något system. Rådgivande: analysutdata från ett forsknings- och teknikverktyg, inte typgodkänd navigationsutrustning och inte en safety-of-life-tjänst.

seg-d76123040989 = Den registrerade jämförelsen av tillgänglighetsmodellen för rymdanvändare med det offentliga häftet Space Service Volume, från de incheckade resultaten av den förhandsregistrerade körningen (xval/gnss-ssv/results-run1.json, skriven av exemplet ssv_booklet_check i motor v{ $version }). Tröskel för tröskel, cellerna inom tolerans: S0 { "13" } av { "13" } (MET); S1 { "43" } av { "52" } (NOT MET); S2 { "48" } av { "52" } (NOT MET); S3 { "122" } av { "155" } (NOT MET); S4 { "132" } av { "156" } (NOT MET); S5 { "18" } av { "26" } (NOT MET); S6 { "26" } av { "26" } (MET); S7 { "0" } av { "20" } panelmönster (NOT MET). Bara S0 och S6 är uppnådda under den förhandsregistrerade läsningen. En diagnostisk variant som använder häftets andra GLONASS-vinklar ger S1, S2 och S4 alla celler, men ersätter inte den registrerade körningen. Ingen registerrad är VALIDATED. Rådgivande: analysutdata från ett forsknings- och teknikverktyg, inte typgodkänd navigationsutrustning och inte en safety-of-life-tjänst.

seg-74675df154dc = Källa: <c1/>

seg-ce7ea32e67f1 = GNSS bortom konstellationen: typen <c1/>

seg-389cb131fd77 = Endast rådgivande. Modellerade resultat från angivna indata och en simulerad referens; inte en certifiering, en flygkvalificerad siffra eller ett påstående om servicevolym för något system. Kshana sänder ingenting.

seg-a0011b278269 = Typen <c1/> besvarar: för en rymdfarkost ovanför, kring eller långt bortom GNSS-banorna, hur många GNSS-signaler kan den använda, hur starka är de, hur bra är geometrin, och vad kan ett filter ombord göra med dem? Den har tre lägen, valda efter vilken tabell scenariot har: <c2/>, <c3/> eller <c4/> (med en valfri <c5/>).

seg-2e4ac6b7a883 = Status: <b>MODELLED</b>. Tillgänglighetssvepen jämförs med ICG:s Space Service Volume-häfte under en förhandsregistrering; se <a1>vad jämförelsen visar</a1> innan du förlitar dig på något tal.

seg-a0ff58bccaa8 = Offentliga källor

seg-4658268e82e1 = <em>The Interoperable Global Navigation Satellite Systems Space Service Volume</em>, United Nations Office for Outer Space Affairs, ST/SPACE/75 ({ "1" } november { "2018" }), utarbetad av International Committee on GNSS (ICG), arbetsgrupp B: metoden (bilaga B), omloppselementen för varje konstellation (bilaga C), sändarnas strålbredder och effekter (tabellerna B2, B6, B8, { "4.2" }), användarantennerna (tabell B10) och de publicerade tillgänglighetstabellerna. Det är i sig en simulering. Hämtas av <c1/> (låst SHA-256), ingår aldrig i repot.

seg-e46d9353e6f3 = U.S. Coast Guard Navigation Center, GPS Block IIR- och IIR-M-antennpanelmönster (Marquis, { "2014" }): de uppmätta L1-panelmönstren används bara för att bedöma den parametriska ersättaren (tröskel S7). Hämtas, ingår aldrig i repot, inga mönsterdata incheckade.

seg-0a002dc0df64 = Modellens konstanter (gravitation, jordrotation, frisiktsdämpning, brustäthet) är standard; Gallaghers plasmasfärtäthetslag, Chapman-skiktet och refraktivitetsprofilen för radio är publicerade former, använda med angivna enkla parametrar (se <c1/>).

seg-c3c3f63df966 = Skalläge: häftets globala mått

seg-f1e153c95b13 = <c1/> placerar en användare på en sfär (standard { "36,000" } km höjd med en nadirriktad halvsfärisk antenn, den övre SSV; eller { "8,000" } km med en rundstrålande antenn, den nedre SSV) på ett ikosfärsraster med 2,562 punkter och räknar, över { "14" } dagar med steg om 1 minut, andelen (användare, epok)-par med minst en och minst fyra signaler, per konstellation och kombinerat, samt det längsta avbrottet hos den sämsta användaren. Svepet använder det slutna synlighetsintervallet i centralvinkel (en strålkägla, jordblockering av sfären på { "6378" } km plus { "50" } km, användarhalvsfären och RF-räckviddsgränsen) och körs på sekunder i ett release-bygge; ett egenskapstest kontrollerar det mot det allmänna geometriska predikatet.

seg-3fb4c06c8b3f = Banläge: längs en bana

seg-632fedc95af5 = <c1/> flyger användaren på en keplersk bana (en förinställning: <c2/>, <c3/>, <c4/>, <c5/> (häftets tabell { "5.10" }) eller <c6/>, eller element) och redovisar, per band och konstellation, tillgänglighet för en och fyra signaler, avbrottstider, signaler i sikte, bästa C/N0, utspädningstal (median, 95:e percentilen, sämsta), länkar mottagna genom huvudloben och genom sidoloberna, och en valfri tidsserie och CSV.

seg-7bfd301cd789 = <b>Sändarmönster</b> (<c1/>): <c2/> (konstant effekt innanför referensvinkeln utanför boresight), <c3/> (en märkt ersättare: { "3" } dB per grad bortom referensvinkeln ned till ett golv { "25" } dB under huvudloben; <b>inte</b> något systems uppmätta mönster) eller <c4/> (ett uppmätt mönster du tillhandahåller: <c5/> eller infogat <c6/>; mönstren för Block IIR/IIR-M-paneler kan extraheras med <c7/>).

seg-c1390929d9f2 = <b>Mottagarantenner</b>: rundstrålande, halvsfärisk eller häftets högförstärknings- och patchantenner i tabell B10, mot nadir eller zenit; varje länk använder den antenn som har högre förstärkning.

seg-fe56ab7a2cac = <b>Medium för limbstrålar</b> (<c1/>): en Chapman-jonosfär, en plasmasfär (Gallaghers form från { "1988" }, plasmapaus vid L = { "4.5" }, avsmalnande under { "1,500" } km) och en neutral atmosfär (brytning cirka { "1.33" } grader vid ytan, syreabsorption, defokusering) integrerade längs den raka strålen. Redovisar sned TEC, den plasmasfäriska delen, överskottsfördröjning, tangenthöjd och länkar förlorade till strykande sikt. Integration längs rak stråle: brytningen redovisas, itereras inte.

seg-1bad91204f6a = <b>Mottagare för svag signal</b> (<c1/>): koherent och icke-koherent integrering, databitgräns, assisterande kanaler och pilotkanaler, dopplersökning; förvärvströskeln vid angivna detektions- och falsklarmssannolikheter och tröskeln för bärvågs- och kodspårning ersätter den fasta C/N0-tröskeln (intervallet { "10" } till { "25" } dB-Hz). Återanvänder motorns modeller för förvärv och spårningsslinga.

seg-497126fe23e9 = Navigeringsläge: ett filter ombord

seg-af7919ae046e = <c1/> flyger en farkost i hög bana eller månöverföring och kör ett extended Kalman-filter med nio tillstånd (position, hastighet, mottagarklockans bias och drift, en skala för solstrålningstryck) på pseudoavstånd. Referensen integreras med punktmassegravitation, J2, tredjekroppsinverkan från Sol och Måne och strålningstryck med en cylindrisk jordskugga; filtret modellerar gravitation, J2 och tredjekropparna och skattar strålningstrycket. Pseudoavstånden kommer från samma länkgeometri och C/N0-tröskel som svepen; deras brus växer när C/N0 faller; mediets överskottsfördröjning (med <c2/>) läggs till och modelleras inte av filtret. Rapporten skiljer den del av körningen som ligger innanför GNSS-banorna (under { "20,000" } km höjd) från delen ovanför, anger det längsta glappet utan mätning och det genomsnittliga normaliserade skattningsfelet i kvadrat (cirka { "3" } för ett konsistent positionsblock). Solen och Månen är lågprecisionsersättare i cirkelbanor.

seg-a515950c13d6 = Formationsläge: relativ navigering

seg-8d2b72ca56d9 = <c1/> (kräver <c2/> för chief) lägger till deputy-farkoster förskjutna i sann anomali. Varje farkost kör det absoluta filtret; deputy-farkostens position relativt chief skattas genom att subtrahera de oberoende absoluta skattningarna och med ett relativt filter på enkeldifferentierade pseudoavstånd för de signaler som båda farkosterna spårar. Rapporten anger båda, baslinjen och antalet signaler som spåras gemensamt.

seg-dc78efcb8bcb = Vad jämförelsen med häftet visar

seg-643bcfcea515 = Trösklarna förhandsregistrerades (<c1/>, tillägg { "1" } till { "5" }) före körningen i full storlek; resultat i <c2/>, celler i <c3/>, fastlåsta av <c4/>, missar inkluderade.

seg-5498636f8d07 = vad

seg-32c0ea7929e2 = körning { "1" } (förhandsregistrerad tolkning)

seg-abe521171d2f = variant med GLONASS-vinkel (diagnostik)

seg-9489ef691574 = minsta utstrålad effekt, { "13" } signaler, inom { "0.1" } dB

seg-4b7e0252355c = geometri för övre SSV (tabell B4)

seg-e3c870085a6c = NOT MET ({ "43" } av { "52" } celler)

seg-b57b1f9b0b43 = alla { "52" } celler inom toleransen

seg-6bf57763d120 = nedre SSV (tabell { "5.2" })

seg-c9349a3a0185 = NOT MET ({ "48" } av { "52" })

seg-056eae8e55d1 = alla { "52" }

seg-805e4402f556 = övre SSV med 15/20/25 dB-Hz (tabell B9)

seg-a8d9a1f66989 = NOT MET ({ "122" } av { "155" })

seg-7a6fd0eb8f77 = { "153" } av { "155" }

seg-cb1a6f558a09 = sex GEO-uppdrag

seg-e4759e8d2baa = NOT MET ({ "132" } av { "156" })

seg-3e59e79791e2 = alla { "156" }

seg-76d88834ab69 = HEO-uppdrag

seg-1c06414304a0 = NOT MET ({ "18" } av { "26" })

seg-b1656692859b = { "21" } av { "26" }

seg-d4cedd711485 = månuppdrag

seg-b52333886109 = NOT MET ({ "23" } av { "26" })

seg-479a041e2b62 = parametriskt mönster mot uppmätta GPS L1-panelmönster

seg-b514bc035c86 = NOT MET (RMS { "6.3" } till { "8.8" } dB mot { "3" } dB)

seg-dd703fdea949 = Häftet är internt inkonsekvent om GLONASS referensvinkel utanför boresight: tabellerna B2 och B6 anger { "20" } och { "28" } grader, tabell { "4.2" } anger { "26" } och { "34" }. Körning { "1" } använde den första (det förhandsregistreringen angav); nästan varje miss i S1 till S5 gäller GLONASS. Varianten, som åtogs som diagnostik innan den kördes, använder den andra, och då stämmer övre SSV, nedre SSV och GEO-uppdragen överens cell för cell, avbrott inkluderade. Varianten ersätter inte körning { "1" }. <b>Ingen rad är VALIDATED</b>: häftet är en simulering, utfallsregeln kräver S0 till S3 under den förhandsregistrerade tolkningen, och de återstående missarna (GPS L1 vid { "20" } dB-Hz, HEO Galileo, QZSS och NavIC, GLONASS-raderna för månen) är inte förklarade.

seg-6eecf686159b = Att köra det

seg-adbb9c22de1c = Varje medföljande scenario är nedskuret för att köras på sekunder; jämförelsen i full storlek är exemplet ovan. Samma typ körs från Python (<c1/>), webbläsaren (WebAssembly), MCP-servern (<c2/>, bara infogad text: <c3/> är en filkälla och avvisas, använd <c4/>) och insticksmodulerna.

seg-8fa10c8e7ab7 = MODELLED: ingenting här jämfördes med uppmätt GNSS-mottagning i omloppsbana. Häftet är en simulering.

seg-b34e9acebec0 = Keplerska tvåkroppsbanor för GNSS-konstellationerna och för användaren i svepen; månöverföringen är en tvåkroppsellips, inte en propagerad bana.

seg-76aa617ba828 = Mediet är en angiven enkel modell med integrering längs rak stråle; det är ingen rymdvädersprognos.

seg-3114c4249988 = Navigationsfiltret är en designstudie: inga manövrar, ingen attityd, ingen flervägsutbredning, och referensen delar sina Sol- och Måneefemerider med filtret.

seg-2deafc0f9534 = <s1>Föregående</s1>Månens referensstation

seg-23386861eebf = <s1>Nästa</s1>Månbana och månyta som infrastruktur
