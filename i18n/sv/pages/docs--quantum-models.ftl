# docs--quantum-models: translations (sv)

seg-638b8d451550 = Sensor

seg-c35a20fa2529 = Mognad

seg-2f51722ab9d4 = Källa: <c1/>

seg-39ab7752d86d = Modeller av kvantsensorer: vad Kshana modellerar och vad den inte modellerar

seg-daf0e0c0b16f = Kshana är en <b>simulator för PNT-resiliens (PNT: positionering, navigering och tidssynkronisering) med prestandamodeller för kvantsensorer</b>. Den är <em>inte</em> en simulator av kvantfysik från grundprinciper. Den här sidan anger exakt vad det innebär, så att ramen "kvant" inte kan misstas för mer än den är.

seg-6e504d97c41e = Vad som modelleras

seg-7884c9a7d883 = Varje kvantsensor (och klassisk sensor) är en <b>felmodell</b> som drivs av publicerade parametrar för brusbudget:

seg-cad22f39d579 = <b>Klockor</b> — PSD:er (effektspektraltätheter) för vitfrekvens och slumpvandring i frekvens, ett Allan-golv för flicker (1/f) och linjär drift, hämtade ur datablad och artiklar: CSAC (atomklocka i chipformat) Microchip SA.45s; strontium-klockan med optiskt gitter av Origlia m.fl. (arXiv:{ "1503.08457" }), ett rymdinriktat mål; och de sex standardvärdena i <c1/> (CSAC; USO, ultrastabil oscillator; DSAC, Deep Space Atomic Clock; TCXO, temperaturkompenserad kristalloscillator; OCXO, ugnsstyrd kristalloscillator; RAFS, atomfrekvensstandard med rubidium), var och en med en källa. Allan-deviationen som de ger valideras mot standardlutningarna för brustyperna (se <a1><c2/></a1>). En kurva för optisk klocka är verklig: den uppmätta Allan-deviationen för ⁸⁸Sr-pincettklockan av Norcia m.fl. (<em>Science</em> { "2019" }) återges av brusanpassningen, en rad med VALIDATED i <a2><c3/></a2>; holdover-värdena som bygger på den optiska klassen förblir MODELLED.

seg-13c3340e773b = <b>Tröghetssensorer</b> — i <c1/> och de hybrida paketen en enaxlig (1-DOF, en frihetsgrad) felbudget för accelerometer/gyro: slumpvandring i hastighet, slumpvandring i vinkel, slumpvandring i acceleration och ett Allan-golv för biasinstabilitet. Typerna <c2/> och <c3/> kör i stället den treaxliga strapdown-mekaniseringen i <c4/> (kvaternionbaserad attityd, navigeringsekvationer i nord-öst-ned, en deterministisk felmodell för IMU).

seg-f361d586b348 = Kvantscenariotyperna — <c1/>, <c2/>, <c3/>, <c4/> och <c5/> — är byggda av dessa felmodeller och är MODELLED; <c6/>, <c7/> och <c8/> redovisar dessutom en representativitetspost med luckorna till flygning.

seg-05bbaddd4df6 = Motorn är <b>neutral</b>: "kvant" och "klassisk" är samma kodväg med olika koefficienter. Kontrasten i kvalitetsmåtten kommer helt från de brusparametrar som läggs in, var och en spårbar till en citerad källa.

seg-a1a067588520 = Vad som INTE modelleras

seg-49a656243210 = För klock- och tidsöverföringssensorerna simuleras ingen av den underliggande kvantfysiken — bara det nettobidrag till Allan som anges som en koefficient. För <b>kallatomsaccelerometern</b> finns nu ett lager från grundprinciper (se nedan); de återstående systematiska effekterna ligger fortfarande på koefficientnivå eller är omodellerade:

seg-844e65d52572 = atominterferometerns <b>Mach–Zehnder-fas</b> (<c1/>), <b>kvantprojektions-/skottbrus</b> (<c2/>), avtagande interferometer<b>kontrast</b>, <b>cykeltid</b> och <b>överföringsfunktionen för vibrationskoppling</b> (<c3/>, varians för vit PSD <c4/>) <em>modelleras nu från grundprinciper</em> för CAI-accelerometern (kallatomsinterferometer) (<c5/>), där den vita acceleration-PSD:n <c6/> som den klassiska modellen använder härleds, tillsammans med <b>dynamiskt omfång för fransosäkerhet</b> (<c7/>) — se <a1><c8/></a1>;

seg-71a782041b89 = den systematiska effekten <b>Coriolis</b> (<c1/> / <c2/>, korskopplingen <c3/>) och den systematiska effekten <b>AC-Stark (AC: växelström) / ljusskift</b> (<c4/>, som upphävs vid en symmetrisk tvåfotonsförstämning) <em>modelleras och enhetstestas nu</em> i <c5/>;

seg-00c510117abc = ytterligare tre felbidrag för CAI <em>modelleras nu</em> som biblioteksfunktioner i <c1/> ({ "0.36" }; MODELLED; ännu inte nåbara från en scenariotyp):

seg-fcaf6ff00974 = <b>Fasbrus från Raman-laser</b>: känslighetsfunktionens viktning enligt Cheinet m.fl. ({ "2008" }), ekv. { "8" }, med den slutna formen för vitt fasbrus <c1/> (ekv. { "18" } vid en cykel) och en numerisk väg för valfritt fasbrusspektrum, plus laserns frekvensbrus som fördröjningen vid retroreflektion <c2/> inte upphäver (Le Gouët m.fl. { "2007" }, ekv. { "9" } till { "11" });

seg-6e2236c81db8 = <b>vågfrontskrökning</b> (endast ren defokusering): biasen <c1/> för ett termiskt moln på en stråle med krökningsradie <c2/>, och dess minskning när bara atomer inom en detektionsradie räknas (efter Louchet-Chauvet m.fl. { "2011" } och Schkolnik m.fl. { "2015" }); aberrationer av högre ordning modelleras inte;

seg-92295ad17228 = <b>upplösning av fransosäkerhet</b>: sannolikheten för ett felaktigt fransindex, <c1/>, med hjälp av en klassisk accelerometer (Lautier m.fl. { "2014" }) och för två avfrågningstider (efter Bonnin m.fl. { "2018" }), med inversen som ger det största klassiska bruset för en angiven felsannolikhet.

seg-f383678fb806 = Varje sluten form kontrolleras mot en oberoende numerisk väg (kvadratur i frekvensdomänen, eller en Monte Carlo över atomer eller skott) och mot sina gränsfall. Det enda publicerade värde som återges är Cheinet m.fl:s nivå för vitt fasbrus: −{ "111" } dB·rad²/Hz vid <c1/> = { "20" } µs ger omkring { "1" } mrad per skott ({ "0.99" } mrad; artikeln härleder den nivån med sin ekv. { "17" }, flicker plus vitt). Inget av detta är en mätning av något instrument;

seg-150f8b9dfea4 = fortfarande <b>inte</b> modellerat: vågfrontsaberrationer av högre ordning, fasbruset hos ett specifikt lasersystem och fysik från grundprinciper på klocksidan;

seg-643109601eba = paketet <c1/> för kvant mot klassisk är enaxligt; den treaxliga strapdown-vägen körs bara i <c2/> och <c3/> (se anmärkningen om IMU, tröghetsmätenhet, i README och <a1><c4/></a1>).

seg-1ff01ab9f92d = Att slutföra kvantfysiklagret (att nå CAI:s felbidrag från en scenariotyp, vågfrontsaberrationer av högre ordning och fysik från grundprinciper på klocksidan) är det återstående P2-arbetet i <c1/>.

seg-f09a31b33faa = Värden för markbaserat labb jämfört med flygkvalificerade

seg-dcef4579d2a9 = Parametertabellerna blandar mognadsnivåer; behandla dem därefter:

seg-4f25895df32f = Källvärde

seg-cef61e912cd0 = CSAC (t.ex. SA.45s)

seg-4a016be9bca9 = datablad σ_y({ "1" } s) ≈ { "3e-10" }

seg-38cc72b2405c = <b>använd</b> kommersiell komponent (strålningståliga rymdvarianter finns)

seg-d38d20629ed6 = Strontium-klocka med optiskt gitter

seg-1f0d3ec00922 = σ_y({ "1" } s), mål ≈ { "1e-15" } (arXiv:{ "1503.08457" })

seg-1496e0c42086 = <b>markbaserat labb</b> — Kshana känner inte till någon publicerad prestanda i omloppsbana för en sådan

seg-ce1d7994188b = Kallatomsaccelerometer

seg-b07fa6b8cebc = publicerade Allan-värden från labb

seg-60864f168701 = markbaserat labb / sondraket

seg-84a68aeb467d = Värden för optiska klockor i Kshana är <em>rymdmål på markbaserad hårdvara</em>. Det finns ingen optisk klocka som har flugit; README och resultatets proveniens säger det uttryckligen.

seg-a204c1b854fa = Referens: ACES/PHARAO på ISS (i drift sedan april { "2025" })

seg-fb88de1257bd = Nyttolasten <b>ACES/PHARAO</b> från ESA (Europeiska rymdorganisationen) (ACES: Atomic Clock Ensemble in Space; PHARAO: Projet d'Horloge Atomique par Refroidissement d'Atomes en Orbite) — en lasernedkyld cesiumklocka plus en aktiv vätemaser, i drift på ISS (Internationella rymdstationen) sedan april { "2025" } — är den nuvarande operativa referensen för klockstabilitet i omloppsbana (mål för relativ stabilitet av storleksordningen { "1e-16" } efter några dygns integrering). Kshanas modell av optisk klocka representerar ett <em>mer offensivt</em> mål för markbaserat labb än ACES flugna prestanda med cesium/maser; när man jämför Kshanas optiska värden med "vad som faktiskt har flugit" är ACES/PHARAO den ärliga referenspunkten, och det är ett mikrovågs-/masersystem, inte en klocka med optiskt gitter.

seg-9d2e850cb986 = De exakta värdena för ACES prestanda i omloppsbana bör citeras ur ESA:s publicerade resultat i takt med att de släpps; poängen här är <em>mognadsgapet</em>, inte ett specifikt tal — Kshanas optiska värden är mål, inte flugen prestanda.

seg-4b373686adf8 = <a1><c1/></a1> — etiketter per parameter (<c2/> / <c3/>).

seg-3f0c1048aea9 = <a1><c1/></a1> — definitioner av kvalitetsmått (FoM) och varje förkortning.

seg-a360cd4997e2 = <a1><c1/></a1> — vad kvalitetsmåtten för integritet och säkerhet är och inte är.

seg-0ac025397b23 = <a1><c1/></a1> — kallatomsaccelerometern från grundprinciper.

seg-41ba2c8f70fe = <s1>Föregående</s1>Utformning av konstellationer

seg-136fa589fed5 = <s1>Nästa</s1>Kallatomsinterferometer
