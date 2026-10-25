# docs--kind-araim-reference-check: translations (sv)

seg-debc2f07db78 = true

seg-c53da0bf140d = Källa: <c1/>

seg-82884391dd77 = <c1/> (scenariotyp)

seg-8e845ce908ee = Scenariotyp i motor v{ $version }, familj <a1>GNSS-mätningar, positionering och integritet</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-06197409c717 = Publicerade referensvektorer för ARAIM avsedda för intygande: motorns horisontella och vertikala ARAIM-skyddsnivåer körda mot ARAIM Technical Subgroup i WG-C:s EGNA genomräknade numeriska exempel, vid den tolerans (TOL_PL = { "5e-2" } m) som dessa dokument själva anger. Två vektorer är incheckade som testdata, var och en med sin hämtnings-URL, sitt hämtningsdatum, källfilens SHA-256 och sida: Reference Airborne Algorithm Description Document v3.1 ({ "2019" }) bilaga D — självkonsistent, och acceptansvektorn — samt Milestone { "3" } Report ({ "2016" }) bilaga A avsnitt A.IX, det uttalande som forskningens litteraturlistor citerar. Varje publicerad indata (geometrimatrisen för 10 satelliter och 2 konstellationer, varians-diagonalerna C_int och C_acc, b_nom, P_sat, P_const och konstantuppsättningen för LPV-200) och varje publicerad utdata (VPL, HPL, EMT, sigma_v_acc, K_fa_3 och de två konstellationsfelslägenas sigma_3, sigma_ss_3 och b_3) redovisas bredvid motorns eget tal och deras absoluta skillnad. Skyddsnivåekvationen löses INTE om här: referensens lägeslista lämnas till motorns befintliga raim::araim_protection_level / araim_integrity_risk, så bisektionen och den gaussiska svansalgebran som testas är motorns egna; bara geometrin, delösningarna, detektionströsklarna och den publicerade budgetuppdelningen byggs åt den. EXTERNT KONTROLLERAD mot vektorn från { "2019" }: VPL { "18.2926" } m mot { "18.3" } m publicerat, HPL { "13.4063" } m mot { "13.45" } m, EMT { "7.2997" } m mot { "7.2998" } m, sigma_v_acc { "1.3694" } m mot { "1.3694" } m, och alla sex publicerade mellanresultat inom en halv enhet i sin sista utskrivna decimal. Vektorn från { "2016" } har två interna fel som rapporten anger i stället för att dölja — ett teckenfel i rad { "3" } i G, och ett K_fa_3 som utvärderats vid { "57" } felägen medan dokumentet anger N_fault_max = { "1" } ({ "12" } lägen) — så dess geometrimellanresultat reproduceras exakt medan dess skyddsnivåer redovisas som uppmätta avvikelser och utesluts ur acceptanssiffran; toleransen vidgas aldrig för att rymma dem. Varje utsänt numeriskt fält har en enhet och en proveniensklass, och en avskriven siffra märks <c1/> så att den aldrig kan förväxlas med en beräknad. OMFATTNING: bara N_fault_max = { "1" } (felägen för en enskild satellit och en enskild konstellation) är implementerat, och ett fall vars aprioriantaganden kräver samtidiga felundermängder med flera händelser är REFUSED i stället för att tyst trunkeras; feldetektion, uteslutning, kontrollen av chi-kvadratkonsistens och omfördelningssteget för dubbelräkning i referensalgoritmen ligger utanför omfattningen. Detta reproducerar en publicerad referensalgoritms genomräknade exempel — det är inte en certifiering, en luftvärdighetsartefakt eller ett godkännande.

seg-c16de81ec8da = En körning av <c1/> sammanfattas som: araim-reference-check: { "2" } publicerade WG-C-referensvektor(er); sämsta VPL/HPL-överensstämmelse { "0.0437" } m mot referensens egen TOL_PL = { "0.05" } m över { "1" } acceptansvektor(er)

seg-b1be6b5632c1 = Valfria fält: <c1/>

seg-3f181d41edb5 = Exemplet <c1/> anger bland annat:

seg-9de6e1b3352d = Resultatetikett (motorns): EXTERNALLY CHECKED — motorns ARAIM-skyddsnivåer körda mot de publicerade genomräknade numeriska exemplen från referensalgoritmen för luftburna system från EU-U.S. Working Group C ARAIM Technical Subgroup, vid den tolerans (TOL_PL) som dessa dokument själva anger. Varje publicerad siffra har sin källa UR

seg-693c823c85d1 = Diagrammet som motorn skriver för scenarios/araim-reference-check.toml, typ araim-reference-check

seg-3068552e4ab4 = VALIDATED: raderna i <a1>verifieringsmatrisen</a1> som nämner den här typen.

seg-c5c966ec3c6a = <b>VALIDATED</b> Själva skyddsnivåekvationen för flerhypotesig lösningsseparation: viktad minsta kvadrat för alla satelliter i sikte och per felläge på en East/North/Up-geometri med ett klocktillstånd per konstellation, delösningarnas sigman, lösningsseparation Tester: <a1>araim_reference_vectors.rs</a1>.

seg-a99b9cf4c6e8 = <b>VALIDATED</b> Själva skyddsnivåekvationen för flerhypotesig lösningsseparation: viktad minsta kvadrat för alla satelliter i sikte och per felläge på en East/North/Up-geometri. Oberoende referens (ExternalDataset): EU-U.S. Working Group C ARAIM Technical Subgroup, Reference Airborne Algorithm Description Document v3.1 ({ "20" } juni { "2019" }), bilaga D genomräknat numeriskt exempel — publicerade INDATA (geometrimatris för 10 satelliter och 2 konstellationer, diagonalerna C_int/C_acc, b_nom, P_sat, P_const, LPV-200-konstanter) och publicerade UTDATA (VPL { "18.3" } m, HPL { "13.45" } m, EMT { "7.2998" } m, σ_v_acc { "1.3694" } m, K_fa_3 { "5.1083" }, och sex mellanresultat för konstellationsfel

seg-f6b7ca020692 = Familjesida: <a1>GNSS-mätningar, positionering och integritet</a1>

seg-f4cf8b629797 = Ämnessida: <a1>INTEGRITY.md</a1>

seg-e6b1f9a47b5d = Ämnessida: <a1>ARAIM_REFERENCE.md</a1>

seg-7cf434223fa5 = <s1>Föregående</s1>aperture-duty-cycle

seg-ed2003ecf41b = <s1>Nästa</s1>ascent-losses
