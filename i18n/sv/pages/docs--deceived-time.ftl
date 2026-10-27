# docs--deceived-time: translations (sv)

seg-d46702617926 = Källa: <c1/>

seg-f44d01df7b1c = Ett signerat kommando som tillämpas vid en vilseledd tid leder ändå fel

seg-6497012e401e = En teknisk not till operatörer av tidsindexerade nät: konstellationer som dirigerar, tilldelar uppgifter eller överlämnar enligt ett schema, där varje nod agerar när dess egen klocka når ett schemalagt ögonblick.

seg-714bce435435 = Förkortningar: GNSS, Global Navigation Satellite System; TPL, skyddsnivå för tidssynkronisering; PNT, positionering, navigering och tidssynkronisering.

seg-a7208323de1c = Påståendet

seg-246715a1c559 = Att autentisera styrmeddelanden, även med postkvantsignaturer, bevisar vem som skickade ett meddelande och att det inte ändrades. Det bevisar inte <b>när mottagaren agerar på det</b>. En nod utför ett tidsindexerat kommando mot sin egen klocka. Om den klockan har dragits med <c1/> körs ett kommando som gäller för ögonblicket <c2/> vid verklig tid <c3/>, med varje signatur intakt. När <c4/> överstiger slotskyddet hamnar trafiken i fel slot, en länk växlar medan andra änden fortfarande pekar åt ett annat håll, eller en överlämning sker för tidigt. Nätet dirigerar fel, och varje integritetskontroll i kommandovägen rapporterar att allt gick bra.

seg-8683f0749042 = Varför klockan är det mjuka målet

seg-1af5aea2ef5b = <b>GNSS-tid är den vanliga referensen, och den går att spoofa.</b> En nod som disciplinerar sin klocka mot GNSS ärver den tid som mottagaren levererar. En spoofer som håller mottagarens egna kvalitetsflaggor gröna kan dra den tiden långsamt.

seg-354a4c706264 = <b>Färskhetskontroller använder samma klocka.</b> Ett giltighetsfönster ("godta det här kommandot till <c1/>") eller en återuppspelningsräknare knuten till tid bedöms mot den lokala klockan, så en dragen klocka kan också vidga fönstret där ett infångat signerat kommando godtas.

seg-a4b8a5db0975 = <b>Attacken behöver ingen nyckel.</b> Ingenting i den signerade kanalen rörs. Starkare kryptografi höjer kostnaden för att förfalska ett kommando och lämnar den här kostnaden oförändrad.

seg-e514b03fbae3 = Detta ligger vid sidan av arbetet med postkvantkryptering, inte emot det: de två täpper till olika hål. Signaturer stoppar ett förfalskat kommando. Tidsintegritet hindrar att ett äkta kommando utförs vid fel tidpunkt.

seg-09f493386dbc = Vad som begränsar det

seg-750bd90b0ee1 = Fyra åtgärder, var och en kvantifierad av scenariosorten <c1/> (<a1><c2/></a1>):

seg-77cf39b434b5 = <b>En klockstödd övervakare.</b> Jämför GNSS-tid med nodens egen klocka som går vidare över ett fönster, och larma när skillnaden är för stor för att vara klockbrus. Den villkorliga TPL begränsar det fel som kan förbli obemärkt innan larmet.

seg-e58f7fb94ac5 = <b>Oberoende kontroller, schemalagda.</b> En tvåvägs-tidsöverföring från markstation eller en jämförelse via korslänk med en granne utom räckhåll för spoofern sätter en gräns för hur länge ett långsamt drag kan pågå. Deras återbesöksintervall är en säkerhetsparameter, inte bara en driftparameter.

seg-69590f56817c = <b>Geometri.</b> En spoofer på marken når en satellit i låg jordbana bara medan den ligger över spooferns horisont, så draget begränsas av spooferns rampfart gånger det fönstret. Som överslagsräkning: en ramp på { "10" } ns/s som hålls i { "600" } s blir { "6" } µs. Det medföljande exemplet (<c1/>: bana på { "550" } km, högsta ramp { "10" } ns/s) redovisar en spooferexponering på { "732" } s och ett rampbegränsat drag på { "7 321" } ns.

seg-e8e52ce05943 = <b>Ett skydd dimensionerat efter gränsen, och en säker åtgärd vid larm.</b> Slotskyddet bör täcka det största oupptäckta fel som övervakaren och kontrollerna tillåter, inte bara klockans fritt gående brus. Vid larm bör en nod hålla fast vid sitt senaste goda schema på sin klocka som går vidare i stället för att följa GNSS.

seg-c11b66f214ac = Vad den här noten inte hävdar

seg-8b0ed39ead25 = Den hävdar inte att en spoofad satellit har observerats leda fel; den uppskattar inte någon operatörs exponering; och de gränser den pekar på är MODELLED, villkorade av detektering och av de angivna hotantagandena. Den argumenterar för en sammansättning: en giltig signatur och en korrekt utförandetid är skilda egenskaper, och ett tidsindexerat nät behöver båda.

seg-c1bf6467e3c9 = <s1>Föregående</s1>Telekomtidssynkronisering

seg-d4e9bfd42982 = <s1>Nästa</s1>Holdover-test och tidssynkroniseringshårdvara i slingan
