# docs--tutorial-clock-holdover: translations (sv)

seg-b59f529012a6 = Källa: <c1/>

seg-e66a5042182e = Handledning { "2" } — Klock-holdover: hur länge kan du glida

seg-889112bc4c09 = <c1/> · <b>Scenario:</b> <c2/> (undervisningskopia: <a1><c3/></a1>) · <b>Svårighetsgrad:</b> nybörjare · <b>~{ "20" } min</b>

seg-a4bdf55d96be = I slutet har du kört en klock-holdover med GNSS-signaler (Global Navigation Satellite System) nekade, läst timing-kvalitetsmåttet och förstått driftlagen √(q_wf·T) som förklarar <em>varför</em> den optiska klockan håller längre än den i chipskala, med en lag hämtad från NIST (USA:s National Institute of Standards and Technology) och inte påhittad.

seg-51ae9468b92a = Vad det här scenariot är

seg-87334505b228 = När GNSS-signalerna försvinner håller ett system tiden på sin egen inbyggda klocka. Klockans fas driver långsamt, och när driften överstiger den operativa tidsspecifikationen är du ur drift. <b>Holdover</b> är hur länge du håller dig inom specifikationen efter GNSS-förlust — det centrala kvalitetsmåttet för autonomi.

seg-798ac031b5c6 = Scenariot kör en tidslinje på { "2" } h: { "10" } min GNSS-synkronisering, därefter { "6600" } s ({ "1.83" } h) nekad, mot en tidsspecifikation på { "20" } ns, samplad var { "10" }:e s. Det jämför två klockor på identisk kod med sitt <em>eget</em> publicerade brus:

seg-3d53622dbe12 = <b>Quantum</b>: en optisk strontiumgitterklocka, mål för rymden σ_y({ "1" } s) = { "1" }×{ "10" }⁻¹⁵ (arXiv:{ "1503.08457" }), ett markdemonstratormål, inte flugen. σ_y(τ) är Allan-deviationen, standardmåttet på klockans frekvensstabilitet vid medelvärdestiden τ.

seg-e25af6d0752f = <b>Classical</b>: en atomklocka i chipskala (CSAC) från Microchip SA.45s, σ_y({ "1" } s) = { "3" }×{ "10" }⁻¹⁰ (datablad) — en kommersiell del i drift.

seg-08f3fdc9252a = Läs enradssammanfattningen

seg-baa0cc808987 = Med seed = { "42" }, specifikationen på { "20" } ns och avbrottet på { "6600" } s:

seg-76f7739f8b17 = <b><c1/></b> — den optiska klockan klarar hela avbrottet på { "6600" } s utan att överskrida { "20" } ns. Dess 95:e percentil av fasfel är { "1.20e-4" } ns, ungefär en tiotusendels nanosekund: den rör sig knappt.

seg-0ba48fccffae = <b><c1/></b> — CSAC överskrider specifikationen på { "20" } ns vid ~{ "2610" } s, mindre än halva avbrottet. Dess p95-fasfel ({ "19.7" } ns) ligger precis vid specifikationslinjen.

seg-b745d05e2bf1 = <b><c1/></b> — det här scenariot konfigurerar ingen attack, så det finns inget att detektera och sammanfattningen skriver inte ut något tal. JSON-utdata innehåller ändå varje klockas analytiska gräns för spoofing-detekterbarhet i <c2/> ({ "0.997" } för den optiska klockan; { "0.000" } för CSAC, vars eget glidbrus över fönstret redan överstiger { "20" } ns), markerad <c3/> i blocket <c4/>. Att poängsätta detektion mot en verklig attack är historien i <a1>Handledning { "3" }</a1>.

seg-510e1cd8ed40 = <b><c1/></b> — här är detta <em>filtrets självkonsistens</em> (andelen avbrottssampel inom Kalman-filtrets eget k-sigma-gränsvärde), <b>inte</b> en horisontell eller vertikal skyddsnivå (HPL/VPL) inom flyget. Se <a1><c2/></a1>.

seg-7cc0ba5e5d13 = Den icke-cirkulära referensen: varför { "2610" } s för CSAC?

seg-2958401e00ca = För en klocka med vit frekvensmodulering (white-FM) växer 1-σ-fasfelet som <b>σ_x(T) ≈ √(q_wf · T)</b>, där <c1/> har enheten s². Det sambandet kommer från <b>NIST Special Publication { "1065" }</b> (Riley, <em>Handbook of Frequency Stability Analysis</em>) — sambanden mellan σ_y(τ) och fas — <em>samma</em> SP-1065-samband som <c2/> validerar motorns Allan-deviation mot inom ~{ "2" } %.

seg-d6c8f68b42b9 = För CSAC gäller <c1/>. Lös ut tiden då 1-σ-fasen når { "20" } ns = { "2" }×{ "10" }⁻⁸ s:

seg-0f28d1a1163f = Motorns { "2610" } s är inte den 1-σ-tiden, och ska inte vara det. <c1/> är den första rutnätspunkten på { "10" } s (<c2/>) där <em>just den här slumpade realiseringens</em> absoluta fasfel överstiger { "20" } ns (<c3/>). En slumpvandrings första passage av en nivå inträffar ofta långt före den tid då dess 1-σ-hölje når nivån, och realiseringen bär dessutom det resterande frekvensfel som filtret har kvar efter synkroniseringen på { "600" } s. Så lagen fastställer skalan, några tusen sekunder för en klocka på { "3" }×{ "10" }⁻¹⁰ mot { "20" } ns, inte det exakta värdet. Testet kontrollerar ett <b>band på { "2000" }–{ "3200" } s</b> kring det, inte själva talet.

seg-2e7cbdefa9b7 = Själva databladets ankarvärden är externa, angivna i scenariots strängar <c1/>: optiskt Sr-gittermål { "1" }×{ "10" }⁻¹⁵ (arXiv:{ "1503.08457" }); Microchip SA.45s CSAC { "3" }×{ "10" }⁻¹⁰ (datablad). Och den exporterade <c2/> stämmer med databladets σ_y(τ) inom ~{ "2" } % (<c3/>, NIST SP { "1065" }). Rita den som ett log-log-diagram "Clock stability (ADEV, Allan deviation)" på lekplatsen.

seg-def5271a207d = Vad testet fastställer

seg-ebddc1f5ffe2 = <c1/> (den optiska klockan måste hålla minst lika länge),

seg-8e570268f107 = <c1/> (klarar hela avbrottet),

seg-d60483c1af2e = <c1/> – ett toleransband kring SP-1065-skalan för white-FM, <em>inte</em> ett magiskt tal. Den oberoende referensen är lagen, inte värdet.

seg-e5f926d1055b = Fallgropar och enheter

seg-0f57e35ed833 = <b>Tidssynkroniseringsvärden anges i nanosekunder</b>, aldrig i meter. (Holdover för position är ett <em>annat</em> paket – se avsnittet om tröghet i handledning { "3" }.)

seg-2e476b213141 = <b><c1/> har enheten s² och motsvarar σ_y({ "1" } s)².</b> Det är bryggan från ett Allan-tal i ett datablad till modellen.

seg-75951a150b44 = <b>Holdover är en nedre gräns kvantiserad till rutnätet</b> (<c1/>). Läs inte in för mycket i det exakta värdet; läs av <em>bandet</em>.

seg-959eb86066f1 = <c1/> avser här filtrets egen konsistens, inte integritet i flygtillämpning.

seg-cb457294fc53 = Vad händer härnäst

seg-aa3e50f2c699 = <b>Nivå { "2" }:</b> skärp <c1/> från { "20" } till { "10" } och se hur CSAC-holdover <em>sjunker</em> ({ "2610" } s → { "1300" } s, uppmätt med <c2/>), eller använd <c3/> för att tabellera holdover mot CSAC-brusnivån <c4/> (<c5/>: { "25" } punkter från { "10" }⁻²⁴ till { "10" }⁻¹⁸ s², klassisk holdover { "2610" } s → { "250" } s).

seg-cb31f104d104 = <b>Nivå { "3" }:</b> lägg till <c1/> för att göra detta till ett Monte Carlo-ensemble och läs av holdover-bandet [p05–p95] (<c2/> skriver ut <c3/>).

seg-9cb56e10f0fd = Sedan slutprovet: <a1>Handledning { "3" } – Kvant mot klassisk resiliens</a1>.

seg-7dc19a98c7ee = <s1>Föregående</s1>{ "1" } · Din första bana

seg-c274e92fdcb5 = <s1>Nästa</s1>{ "3" } · Kvant mot klassisk
