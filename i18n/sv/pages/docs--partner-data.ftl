# docs--partner-data: translations (sv)

seg-2247a2344710 = Betydelse

seg-6e0cb6acc073 = VALIDATED

seg-a349aa76b0ed = PARTNER

seg-34bdcfd66ded = I den gren i arkivet som dessa dokument kommer från; ännu inte på GitHub

seg-f942b36a11c4 = Ännu inte på GitHub

seg-7338b6210228 = Rad

seg-c5ce76c91ff7 = Etikett

seg-3a04afee76ec = Källa: <c1/>

seg-e6d8549f24b9 = Partnerdata: vad uppmätta data kan lyfta en MODELLED-rad till

seg-7b9ff34db2c4 = Kshana märker varje förmåga i ett maskinkontrollerat register (<a1>verifieringsmatrisen</a1>). De flesta rader för tidssynkronisering och sensorer är <b>MODELLED</b>: de vilar på angivna modeller, publicerade datablad och interna kontroller, och ingen uppmätt post för enhetsklassen har jämförts med dem. Den som har en sådan post kan ändra på det. Den här sidan säger vilka rader, vad man ska skicka, hur ett bidrag kontrolleras, hur det poängsätts och hur det tillgodoräknas. Den är skriven för ett laboratorium, en tillverkare eller en universitetsgrupp; den är inte ett arbetserbjudande och gör inte anspråk på stöd från någon. Endast rådgivande: Kshana är ett studieinstrument, inte typgodkänd navigations- eller tidsutrustning.

seg-1cf5536037d4 = Vad etiketterna betyder

seg-5f43f341fa27 = en oberoende extern referens stämmer med förmågan under en tröskel som fastställts före jämförelsen. En uppmätt post från en partner kan vara den oberoende referensen för det delpåstående den täcker; matrisens invarianter förbjuder etiketten utan en

seg-0d182b8c7430 = internt konsistent och sagt högt; ingen extern oberoende referens täcker påståendet. En MODELLED-rad som jämförs med uppmätta data och missar förblir MODELLED, och missen publiceras

seg-8a45367544a0 = en disciplin som körningen förlitar sig på och som en hårdvarupartner äger och Kshana inte tillhandahåller, till exempel siffrorna som beskriver en partners egen klocka eller interferometer. Kshana modellerar vad en sådan enhet skulle göra med en navigerings- eller tidskedja; den går inte i god för enheten

seg-553a1db0e11d = Ett bidrag kan flytta en rad till VALIDATED bara för det påstående som data faktiskt testar, och bara om jämförelsen når sin tröskel. Det kan inte göra en enhets egna siffror till något Kshana går i god för: de förblir partnerns (PARTNER). Om en rads etikett ändras är ägarens beslut, registrerat i den incheckning som ändrar den, med text för den oberoende referensen som säger exakt vad som jämfördes med vad.

seg-bac61cc47097 = Rader som en partners data kan lyfta

seg-bd4f5d3f9399 = Varje rad nedan är den exakta texten i <c1/> för en MODELLED-rad i matrisen (ett test håller den här sidan och matrisen i takt). "Kan ändra" säger vad en jämförelse med uppmätta data som förhandsregistrerats skulle stödja om tröskeln nås; det är aldrig ett löfte.

seg-fb5ceb1d62f0 = Data som skulle testa den

seg-812eae6bbea9 = Kan ändra

seg-f46d009d9380 = en post över dygn från en klocka av en namngiven klass, fritt gående efter sin sista styrning, jämförd med en bättre referens, med ett provintervall på en minut eller mindre

seg-2a73fc59a03d = golven för rött brus per klass som begränsar holdover-siffror förblir MODELLED i dag; en uppmätt stabilitet vid långa medelvärdestider kunde jämföras med golvet för den klassen, för den klassen enbart

seg-abe6b657ce1b = den uppmätta Allan-deviationen, som en tabell eller som fasposten, för en partners klocka eller atominterferometer

seg-6ba2b7faa909 = avvägningssiffrorna kvantifierar (validerar aldrig) partnerns enhet, så de skulle märkas som partnerns siffror (PARTNER); inläsningen av uppmätta Allan-data i en brusmodell är redan avstämd mot en oberoende lösare

seg-ad537759d084 = en fasserie från en oscillator av en av de fyra förinställda modellerna, över minst ett dygn

seg-44a55f6ebef6 = om förinställningens brusmodell härledd från databladet återger en uppmätt enhets stabilitet vid databladets egna medelvärdestider

seg-3da5a93abde6 = en fasserie från en klockklass som ännu inte har något kort (en OCXO, en rubidium, en cesium, en maser, en optisk klocka)

seg-72f248aa4438 = ett kort anpassat på den första tredjedelen som förutsäger Allan-deviationen för resten inom den förhandsregistrerade faktorn, så som redan gjorts för GNSS-satellitklockor och en mottagare

seg-54971e473811 = en logg från en verklig installation (vilken daemonversion som helst) med daemonens egna sammanfattningsrader

seg-bccf188b7636 = läsarna byggdes utifrån offentliga radlayouter och fixturer; en verklig logg jämförd med en oberoende läsare vore den första externa kontrollen

seg-e83b73ab2d5d = en export från en verklig räknare eller analysprogramvara

seg-80b69f559ea5 = samma, för de formaten

seg-0c279732d132 = ett verkligt holdover-test: posten, de tider då operatören tog bort och återställde referensen, och laboratoriets egna MTIE-, TDEV- och maskutfall från dess analysprogramvara

seg-cfad71161af0 = en oberoende beräkning av samma storheter att jämföra med motorns

seg-97c65b646eae = en stillastående logg från en tröghetsenhet vars brusparametrar är publicerade eller uppmätta av någon annan

seg-77f9d22ec624 = anpassningen återfinner de oberoende parametrarna inom en angiven faktor

seg-c9544eadc55d = en statisk logg eller brusparametrarna för en partners tröghetssensor med kalla atomer

seg-062dd193ab20 = enhetens siffror är partnerns (PARTNER); positionsfelsbudgeten som sätter ihop dem förblir Kshanas modell

seg-078be7f5769f = Börja med de två första: de avgör om golven för holdover per klass och avvägningen mellan kvant och klassiskt vilar på några egna uppmätta data alls.

seg-c325655738e0 = Vad man ska skicka

seg-ca24fa511ffe = Ett bidrag är två filer i en mapp: data och en kort beskrivning av dem, en TOML-fil (<c1/>; ett genomarbetat, påhittat exempel är <c2/>).

seg-a3e30cf27adb = <b>Klockdata.</b> Ett av de format som Kshana läser (se <a1>klockloggformat</a1>): TAPR TICC-loggar, ASCII-fas eller -frekvens i TimeLab-stil, RINEX clock, linuxptp-loggarna <c1/>, <c2/> och <c3/>, chrony tracking- och statistics-loggar. Fas är att föredra framför frekvens; ange enheterna och provintervallet. Ge den längsta oavbrutna post du har: stabilitet vid långa medelvärdestider kräver dygn, och en post under ett dygn accepteras men ger en varning.

seg-a14b0c961637 = <b>Tröghetsdata.</b> En CSV med namngivna kolumner (<c1/>, rad/s och m/s^{ "2" }) eller EuRoC-layouten, från en stillastående enhet, tillräckligt lång för anpassningen (minst { "2000" } prov; timmar är bättre).

seg-a1f2cd79bcc0 = <b>Beskrivningen</b> anger, och kontrollen verifierar där den kan:

seg-cfeee5da56d7 = organisationens typ (en typ som "ett nationellt tidslaboratorium", inte ett namn; ett namn är valfritt och bara för tillskrivning);

seg-4bd30d68101c = enheten (typ, klass, och en modell för klassen <c1/>);

seg-e8222178a0ee = hur data togs: vad de jämfördes mot, starttiden (UTC), miljön, och om de är råa eller bearbetade (och vad som gjordes med dem);

seg-7ac28bd566f2 = SHA-256 för datafilen, så att den fil som poängsätts är den fil som beskrivs;

seg-0eba30c3a5b8 = de MODELLED-rader den erbjuds mot, med den exakta kravtexten ovan;

seg-dd694deec626 = licensen (en SPDX-identifierare eller ord) och hur data får användas i arkivet: <c1/> (incheckade, med tillskrivning), <c2/> (bara dess hash och poängen publiceras) eller <c3/> (poängen delas bara med den som skickade in);

seg-7cea4b7c1df8 = tre uttalanden: det är en mätning och inte en simulering, den som skickar in får licensiera det för den här användningen, och filerna innehåller inga personuppgifter.

seg-caa6696f3f5f = <b>Skicka inte.</b> Allt som är personligt eller har kontaktuppgifter (kontrollen avvisar en e-postadress eller ett telefonnummer i beskrivningen), allt som omfattas av exportkontroll eller är begränsat av avtal, och alla simulerade data som presenteras som uppmätta.

seg-a2f0067b6da5 = Hur ett bidrag kontrolleras

seg-f1d4c097691e = Format och metadata, av dig eller oss, innan något körs.

seg-c3cd90222eaa = Den bekräftar schemat, de obligatoriska fälten, hashen, reglerna för licens och tillskrivning, att målraderna finns och är MODELLED, att data går att läsa med motorns egen läsare, och den redovisar vad den läste (prov, intervall, spann, glapp) och varnar för poster som är korta. Slutstatus { "0" } betyder fullständig och läsbar; { "1" } listar vad som ska rättas. <b>Den poängsätter inte data, validerar inte en rad och lovar inte att de kommer att användas.</b>

seg-7dd95552a6fb = <b>En förhandsregistrering, före varje poängsatt körning.</b> För varje rad fastställer ett dokument i <c1/>, och checkas in innan data körs: raden, datafilens SHA-256, vilken del av data som hålls undan (inget som anpassas får se den), måttet och tröskeln. För klockkort är den befintliga mallen den undanhållna prediktion som används för IGS- och mottagarposterna: anpassa på den första tredjedelen av posten, förutsäg Allan-deviationen för resten, och kräv att kvoten förutsagd mot uppmätt ligger inom en angiven faktor vid varje anpassad medelvärdestid. En tröskel luckras aldrig upp efter en körning.

seg-10dc9f8cf394 = <b>En poängsatt körning.</b> Resultatet, varje tal och varje miss inräknade, publiceras med kommandot och incheckningen, och ett test låser fast det. En miss är ett fynd, inte ett misslyckande att dölja: raden förblir MODELLED och sidan säger det.

seg-e5704c43a6b8 = <b>Beslutet om registret är ägarens</b>, skriftligt, i den incheckning som ändrar raden. Texten för den oberoende referensen för en lyft rad namnger datamängden, dess licens och tillskrivning, vad som jämfördes och vad som inte jämfördes.

seg-6d467ffb4199 = Tillskrivning och rättigheter

seg-e82f31e7d9cc = Data förblir dina under den licens du anger. <c1/> och <c2/> håller filen utanför arkivet.

seg-156499ebc142 = Ett bidrag med <c1/> tillskrivs med den tillskrivningsrad du anger, i radens text för den oberoende referensen och i resultatfilen.

seg-a5c01115d23a = Ingenting publiceras under ditt namn utan ditt skriftliga samtycke; en organisation som anges som källa citeras som källa, aldrig som någon som stöder. Inget påstående om att en partner har gett sitt gillande eller stöd görs av eller om en partner.

seg-6c9ed423e51d = Du kan dra tillbaka ett bidrag innan dess resultat publiceras. Efter det förblir resultatet som registrerat; om du drar tillbaka datalicensen tas filen bort från arkivet och hashen och poängen finns kvar.

seg-2cc3c091ba0f = Kshana sänder ingenting och styr ingen hårdvara. Ett bidrag är filer in, en rapport ut.

seg-01b0ee9973dc = Kontakt

seg-b5cb4dc0493f = En ensidig not till ett laboratorium är utkastad åt ägaren i <s1><c1/></s1>. Det är ett utkast: ingenting skickas, och ingen kontaktas, förrän ägaren bestämmer.

seg-83b30e1ca261 = <s1>Föregående</s1>Bevispaket

seg-09c0b5fa6e52 = <s1>Nästa</s1>Optiska länkar genom atmosfären
