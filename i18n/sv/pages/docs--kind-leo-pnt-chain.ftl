# docs--kind-leo-pnt-chain: translations (sv)

seg-f42465f7d066 = ns

seg-7f5ad6ab8c23 = GPS

seg-cd04f5662884 = MODELLED. (typkatalog (<c1/>))

seg-cb91473bfdda = Ämnessida: <a1>LEO-PNT.md</a1>

seg-3bc1761c76ab = { "3" } medföljande scenarier använder den här typen; de övriga finns i <a1><c1/></a1>.

seg-49964654d5f4 = Scenariotyp i motorn v{ $version }, familj <a1>Navigering i låg omloppsbana</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en tjänst för skydd av människoliv. Varje etikett här är motorns eller verifieringsmatrisens; en kind är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidence i README).

seg-c5478f572d21 = Familjesida: <a1>Navigering i låg omloppsbana</a1>

seg-771484572fa7 = <b>VALIDATED</b> ITU-R P.618-14 avsnitt { "2.4.1" } steg { "3" } till { "9" } (referenssigma från N_wet, effektiv väglängd, antennmedelvärdesfaktor, fädningsdjup för { "0.01" } % till { "50" } % av tiden). Oberoende referens (ExternalDataset): ITU-R Study Group { "3" } valideringsexempel (CG-3M3J-13-ValEx-Rev8.3.0) för scintillation enligt P.618-14, med varje platsens P.453-14 N_wet från samma exempel; incheckade i tests/fixtures/leo_link/p618_14_scintillation.csv med webbadresser och hämtningsdatum. Uttrycket för våt refraktivitet utifrån temperatur och luftfuktighet täcks inte av den här raden

seg-ab58ab4e7dc6 = <b>VALIDATED</b> Grupplöptid { "40.3" } STEC/f^{ "2" } per band; de jonosfärsfria koefficienterna f1^2/(f1^{ "2" } - f2^{ "2" }) och -f2^2/(f1^{ "2" } - f2^{ "2" }) och brusförstärkningen sqrt(a1^{ "2" } s1^{ "2" } + a2^. Oberoende referens (ExternalDataset): IS-GPS-200 avsnitt { "20.3.3.3.3.2" }, som anger L1/L2-förhållandet för grupplöptid gamma = (77/60)^{ "2" } som följer av förstaordningens 1/f^{ "2" }-skalning, och Friis överföringsformel (Proc. IRE, { "1946" }). Validerar skalningslagarna, inte en snedställd TEC

seg-ae15d15bf151 = Ämnessida: <a1>LEO-PASS.md</a1>

seg-d24f2cccc926 = Källa: <c1/>

seg-3a66efa79aa2 = <c1/> (scenariotyp)

seg-81d1604171a5 = Ett LEO-PNT-system (positionering, navigering och tidssynkronisering från låg omloppsbana) från början till slut, för vilken konstellation och signal som helst: leo-signal-utformningen som anges av signal_design (en offentlig förinställning eller en inbäddad [signal]-utformning) anger ett [pass]-bands centrum, bandbredd, chipfrekvens och EIRP-fördelning, länkbudgeten leo-pass ger den spårade C/N0 och bandbegränsad kodjitter över överflygningen, en C/N0-linje i sin(elevation) och SISRE som sänds i [navmsg]-meddelandet (anpassad till överflygningssatellitens höjd) matar varje LEO-system i den gemensamma positionsbestämningen leo-pvt för [fusion] och, valfritt, fallen leo-ppp för [ppp]; varje överlämning listas med sitt värde och sin enhet. MODELLED.

seg-9dec9cd6fbfc = En körning av <c1/> sammanfattas som: LEO-PNT från början till slut, generisk { "1080" } km konstellation signal generic-l (<a1>https://www.itu.int/pub/R-REG-RR</a1>), spårad pilot vid { "10.230" } Mchip/s, C/N0-förskjutning -2.57 dB överflygning LEO-1 { "1080" } km: spårad C/N0 topp { "58.2" } dB-Hz, kodjitter median { "0.050" } m; C/N0-linje { "35.6" } + { "24.3" } sin(el) dB-Hz meddelande kepler-rac { "300" } s anpassning / { "300" } s uppdatering: representations-SISRE { "0.907" } mm RMS (bana { "0.005" } mm), med { "0.250" } m banbestämning: { "0.250" } m överlämnat sammanvägd positionsbestämning: endast GNSS PDOP { "1.47" } RMS 3D { "1.60" } m -> GNSS + LEO PDOP { "1.06" } RMS 3D { "0.43" } m PPP-konvergens: endast GNSS { "11.5" } min, { "240" } LEO { "7.5" } min { "11" } värden överlämnade mellan stegen. MODELLED.

seg-21babf07292a = Obligatoriska fält: <c1/>, <c2/>, <c3/>

seg-f7bd59312f9b = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-585a1b0d5950 = Exemplet <c1/> anger bland annat:

seg-be21370c2446 = joint

seg-f9c560b3c318 = Galileo

seg-28b34c8ae7c5 = galileo

seg-0093705edf63 = Resultatetikett (motorns egen): MODELLED — kedjan lämnar över varje stegs utdata till nästa; stegen behåller sina egna etiketter (raderna leo-signal, leo-pass, leo-navmsg, leo-pvt och leo-ppp i verifieringsmatrisen).

seg-abe0599498c9 = Diagrammet som motorn skriver för scenarios/leo-pnt-end-to-end.toml, typ leo-pnt-chain

seg-d8b7c2c82566 = <b>MODELLED</b> Typen <c1/>: en leo-signal-utformning (offentlig förinställning eller inbäddad) anger ett leo-pass-bands centrum, bandbredd, chipfrekvens och EIRP-fördelning; överflygningen ger C/N0 för den spårade komponenten och bandbegränsad kodjitter per epok; en minsta kvadrat-C/ Tester: <a1>leo_pnt_chain.rs</a1>.

seg-59b976838ef1 = <b>VALIDATED</b> navsignal: sinusintegralen (sine_integral), BPSK-R-andelen av effekten inom ett dubbelsidigt band i sluten form (bpsk_power_in_band_closed_form), det bandbegränsade. Oberoende referens (ExternalDataset): Externt fastlagda: { "90.3" } procent av effekten i huvudloben, den koherenta early-late-jittern vid den angivna arbetspunkten, tabellvärdena för sinusintegralen och BPSK:s egen spektrala separationskoefficient 2/({ "3" } R_c) vid noll förskjutning. Endast interna korskontroller, inte extern validering: den slutna formen för bandbegränsad BPSK Gabor-bandbredd och dess asymptot, och den spektrala separationskoefficienten för förskjuten BPSK vid förskjutningar skilda från noll, båda

seg-faf2775f3003 = <b>MODELLED</b> Typen <c1/>: parametriserade signalutformningar (band, sändningsbandbredd, ITU-tilldelning; förvärvs-, data- och pilotkomponenter med BPSK(n), BOC(m,n), MB. Oberoende referens (InternalConsistency): De validerade slutna formerna i de två raderna ovan, identiteten för falsklarm vid kvadratisk detektion P_d(snr = { "0" }) = P_fa och Holmes medeltid för förvärv, samt reduktion till spektrumtypens egen SSC-kedja (samma Jammer::ssc-kod). Själva utformningarna är indata: förinställningar märkta REPRESENTATIVE eller WORKSHOP är inte publicerade specifikationer, förbättrad Feher-QPSK, kodskiftnyckling och OFDM-spektra är approximerade, och formen

seg-752b6d88fc9c = Positioneringssteget modellerar C/N0 som en rät linje i sinus av elevationen mellan masken och zenit; kedjan anpassar den linjen till överflygningens spårade C/N0, så en överflygningsspecifik form (ett isoflux-platå, en strålkant) reduceras till två tal. (resultat <c1/>)

seg-f609a2991c7f = SISRE som lämnas till positioneringsstegen är navigeringsmeddelandets representationsfel mot en av Kshana integrerad referensbana, plus scenariots angivna od_sisre_m som kvadratisk summa; meddelandesteget modellerar självt ingen banbestämning eller prediktion. (resultat <c1/>)

seg-f75f874cdfaa = Positioneringssteget beräknar sin egen jitter för fördröjningslåsningsslingan (DLL) utifrån den överlämnade C/N0 med en formel för obegränsad bandbredd; överflygningen redovisar bredvid den den bandbegränsade jittern för den faktiska utformningen. (resultat <c1/>)

seg-174ce18ade58 = Steget för exakt punktpositionering tar meddelandets SISRE som LEO:s ban- och klockfel; dess kod- och fasbrus förblir stegets egna indata. (resultat <c1/>)

seg-0aaff940eacb = En satellit, den första vars band bär utformningen, representerar hela LEO-systemet i överflygnings- och meddelandestegen. (resultat <c1/>)

seg-65930be43134 = MODELLED — kedjan lämnar över varje stegs utdata till nästa; stegen behåller sina egna etiketter (raderna leo-signal, leo-pass, leo-navmsg, leo-pvt och leo-ppp i verifieringsmatrisen). (resultat <c1/>)

seg-bf452e9ae07f = MODELLED: varje steg behåller sin egen etikett; kedjan tillför ingen fysik. (kommentar i scenariofilen, rad { "25" })

seg-0bff72185f12 = <s1>Föregående</s1>leo-pass

seg-851e55b87d01 = <s1>Nästa</s1>leo-ppp
