# docs--kinds-gnss-measurements-positioning-and-integrity: translations (sv)

seg-6e0cb6acc073 = VALIDATED

seg-b03d56f501c3 = Typ

seg-06197409c717 = Publicerade referensvektorer för ARAIM avsedda för intygande: motorns horisontella och vertikala ARAIM-skyddsnivåer körda mot ARAIM Technical Subgroup i WG-C:s EGNA genomräknade numeriska exempel, vid den tolerans (TOL_PL = { "5e-2" } m) som dessa dokument själva anger. Två vektorer är incheckade som testdata, var och en med sin hämtnings-URL, sitt hämtningsdatum, källfilens SHA-256 och sida: Reference Airborne Algorithm Description Document v3.1 ({ "2019" }) bilaga D — självkonsistent, och acceptansvektorn — samt Milestone { "3" } Report ({ "2016" }) bilaga A avsnitt A.IX, det uttalande som forskningens litteraturlistor citerar. Varje publicerad indata (geometrimatrisen för 10 satelliter och 2 konstellationer, varians-diagonalerna C_int och C_acc, b_nom, P_sat, P_const och konstantuppsättningen för LPV-200) och varje publicerad utdata (VPL, HPL, EMT, sigma_v_acc, K_fa_3 och de två konstellationsfelslägenas sigma_3, sigma_ss_3 och b_3) redovisas bredvid motorns eget tal och deras absoluta skillnad. Skyddsnivåekvationen löses INTE om här: referensens lägeslista lämnas till motorns befintliga raim::araim_protection_level / araim_integrity_risk, så bisektionen och den gaussiska svansalgebran som testas är motorns egna; bara geometrin, delösningarna, detektionströsklarna och den publicerade budgetuppdelningen byggs åt den. EXTERNT KONTROLLERAD mot vektorn från { "2019" }: VPL { "18.2926" } m mot { "18.3" } m publicerat, HPL { "13.4063" } m mot { "13.45" } m, EMT { "7.2997" } m mot { "7.2998" } m, sigma_v_acc { "1.3694" } m mot { "1.3694" } m, och alla sex publicerade mellanresultat inom en halv enhet i sin sista utskrivna decimal. Vektorn från { "2016" } har två interna fel som rapporten anger i stället för att dölja — ett teckenfel i rad { "3" } i G, och ett K_fa_3 som utvärderats vid { "57" } felägen medan dokumentet anger N_fault_max = { "1" } ({ "12" } lägen) — så dess geometrimellanresultat reproduceras exakt medan dess skyddsnivåer redovisas som uppmätta avvikelser och utesluts ur acceptanssiffran; toleransen vidgas aldrig för att rymma dem. Varje utsänt numeriskt fält har en enhet och en proveniensklass, och en avskriven siffra märks <c1/> så att den aldrig kan förväxlas med en beräknad. OMFATTNING: bara N_fault_max = { "1" } (felägen för en enskild satellit och en enskild konstellation) är implementerat, och ett fall vars aprioriantaganden kräver samtidiga felundermängder med flera händelser är REFUSED i stället för att tyst trunkeras; feldetektion, uteslutning, kontrollen av chi-kvadratkonsistens och omfördelningssteget för dubbelräkning i referensalgoritmen ligger utanför omfattningen. Detta reproducerar en publicerad referensalgoritms genomräknade exempel — det är inte en certifiering, en luftvärdighetsartefakt eller ett godkännande.

seg-693c823c85d1 = Diagrammet som motorn skriver för scenarios/araim-reference-check.toml, typ araim-reference-check

seg-2ffccc9c1eff = Pseudoavståndssimulering i mätdomänen (Klobuchar-jonosfär, Saastamoinen/Niell-troposfär) + RAIM.

seg-47ee40d4eb73 = Diagrammet som motorn skriver för scenarios/gnss-sim-raim.toml, kind gnss-sim

seg-eb7e0c2feb2b = RAIM med ögonblicksbild / lösningsseparation / ARAIM med HPL/VPL och ett Stanford-diagram.

seg-ce7f6130ddee = Diagrammet som motorn skriver för scenarios/integrity-raim.toml, kind integrity

seg-b7b67e03f125 = Enkel punktpositionering med verkliga observationer: lös en mottagares position från en RINEX { "3" }-observationsfil och en sändningsnavigeringsfil (kodpseudoavstånd, sänd efemerid, Klobuchar-jonosfär, Saastamoinen/Niell-troposfär), valfritt validerad mot en inmätt koordinat.

seg-d76d59644d84 = Diagrammet som motorn skriver för scenarios/pvt-abmf.toml, typ pvt

seg-edfcb546d9de = Budget för prediktion av lunart referenssystem / jordorientering i realtid: P4 tabell { "1" } (konsistenskontrollen av ramfel — efterbearbetat ~{ "0.27" } m ↔ ~{ "0.010" } ms och realtid ~{ "15" } m ↔ ~{ "0.5" } ms, varje ramposition uttryckt som motsvarande UT1-fel via hävarmen L19 Δr = D_EM·ω⊕·ΔUT1) och tabell { "2" } (uppmätt UT1-prediktionsfel mot horisont — L18-kurvan avläst direkt ur den verkliga IERS finals2000A-serien: det slutliga golvet Bulletin A − Bulletin B och persistensprediktorns fel över flera dygn, vart och ett avbildat på en månramsposition med L19), plus L21-kvadratsummebudgeten för ramfel i realtid (EOP + efemerid + golv för realisering). VALIDATED sluten form (hävarmen L19, ω⊕ korskontrollerad mot CIO-jordrotationsvinkeln) och VALIDATED verkliga data (L18-kurvan ur de verkliga raderna i finals2000A); MODELLED är kovariansmagnituderna för banbestämning av lunara reläer och golvet för realisering av referenssystemet (representativa allokeringar) och persistensprediktorn (inte IERS operativa Bulletin A-algoritm). Ingen certifierad produkt för referenssystem i realtid.

seg-2721ed7727bb = Diagrammet som motorn skriver för scenarios/realtime-frame-eop.toml, typ realtime-frame-eop

seg-5f25c5b71f0c = Modell av rymdvädermiljön: indexen för sol- (F10.7/F10.7a) och geomagnetisk (Kp, med den definitionsmässiga tabellen Kp↔ap) aktivitet, den exosfäriska temperatur enligt Jacchia-1971 som de driver (validerad mot publicerade värden för solminimum/medel/maximum), och den termosfäriska neutraldensiteten enligt Jacchia-1971 vid den dygnsmedelvärdade exosfäriska temperaturen mot den aktivitetsfria statiska profilen vid en uppsättning höjder — solcykelberoendet i densiteten som den statiska atmosfären utelämnar. MODELLED: densiteten stämmer med accelerometerhärledda densiteter (TOLEOS CHAMP och GRACE) inom en faktor { "2" } vid solmaximum men är omkring 1.7x för tät vid solminimum { "2008" }.

seg-c1c6f2f73fb5 = Diagrammet som motorn skriver för scenarios/space-weather.toml, typ space-weather

seg-4e31c8daf798 = Register

seg-d1c67e3dd12e = MODELLED { "1" } · VALIDATED { "2" }

seg-c9cf40c5e609 = Källa: <c1/>

seg-569fac649b5d = GNSS-mätningar, positionsbestämning och integritet (familj av scenariotyper)

seg-63c3a7483268 = { "6" } scenariotyper i motorn v{ $version }. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en safety-of-life-tjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen anger något annat (hur en etikett förtjänas: avsnittet Evidence i README).

seg-33a602147cc2 = Ämnessidor: <a1>INTEGRITY</a1>, <a2>POSITIONING</a2>, <a3>ARAIM_REFERENCE</a3>, <a4>OSNMA</a4>. Kör en: <c1/>. Alla familjer: <a5>KINDS.md</a5>.

seg-9c60c8803b6b = Kontaktark med diagrammen som motorn skriver för typerna i familjen GNSS-mätningar, positionsbestämning och integritet

seg-045ecd7c036f = MODELLED { "6" } · VALIDATED { "4" }

seg-6698e12e148b = Enkelpunktspositionering med verkliga observationer: lös en mottagares position ur en RINEX { "3" }-observationsfil och en broadcast-navigeringsfil (kodpseudoavstånd, broadcast-efemerid, Klobuchar-jonosfär, Saastamo

seg-da89c260b1a3 = Publicerade referensvektorer för ARAIM-certifiering: motorns horisontella och vertikala ARAIM-skyddsnivåer körda mot WG-C ARAIM Technical Subgroups EGNA genomräknade numeriska exempel, vid tolerans

seg-7a750a89c9c4 = Modell av rymdvädermiljö: sol- (F10.7/F10.7a) och geomagnetiska (Kp, med den definitionsmässiga Kp↔ap-tabellen) aktivitetsindex, exosfärtemperaturen enligt Jacchia-1971 som de driver (validerad mot publicerade

seg-d79d4d58275b = Budget för realtidsprediktion av månens referenssystem och jordorientering: P4 Tabell { "1" } (konsistenskontrollen av systemfel — efterbearbetat ~{ "0.27" } m ↔ ~{ "0.010" } ms och realtid ~{ "15" } m ↔ ~{ "0.5" } ms, varje systemposition uttryckt

seg-dc783268156c = Obligatoriska fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>. Valfria: <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>.

seg-7b110aacdb27 = <b>Register:</b> MODELLED { "6" } · VALIDATED { "4" }. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>integrity</a1>.

seg-d444fb35cae9 = Obligatoriska fält: <c1/>, <c2/>, <c3/>, <c4/>. Valfria: <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>.

seg-b651ec58bcba = <b>Register:</b> VALIDATED. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>gnss-sim</a1>.

seg-b9a21187317d = Obligatoriska fält: <c1/>, <c2/>. Valfria: <c3/>, <c4/>, <c5/>, <c6/>.

seg-143dc4fd1d44 = <b>Register:</b> MODELLED. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>pvt</a1>.

seg-9ca1f6783e8e = Obligatoriska fält: inga. Valfria: <c1/>.

seg-415f1fa78518 = <b>Register:</b> VALIDATED. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>araim-reference-check</a1>.

seg-6c4655b35c65 = Obligatoriska fält: inga. Valfria: <c1/>, <c2/>, <c3/>, <c4/>.

seg-1e5052c0bce7 = <b>Register:</b> MODELLED. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>space-weather</a1>.

seg-64c512530ee6 = Obligatoriska fält: inga. Valfria: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>.

seg-1c244958d3c4 = <b>Register:</b> MODELLED { "1" } · VALIDATED { "2" }. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>realtime-frame-eop</a1>.

seg-d4adf4283480 = <s1>Föregående</s1>Konstellationer täckning och geometri

seg-2cdfd7f8bfb3 = <s1>Nästa</s1>Alternativ PNT utan GPS
