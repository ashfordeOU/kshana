# docs--kind-terrain-slam: translations (sv)

seg-216efc4e6fba = Scenariotyp i motor v{ $version }, familj <a1>GPS-nekad alternativ PNT</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-619127334cf3 = Ingen matrisrad nämner den här typen vid namn; etiketten på dess resultat är motorns egen, ovan.

seg-0df60ac6343f = <b>MODELLED</b> Matchning mot gravitationskarta, terrängreferensnavigering (TERCOM/SITAN), magnetisk anomali. Oberoende referens (InternalConsistency): IGRF-14-koefficienter; CRLB för matchat filter från första principer. Fältet i riktmärket för verkligt gravitationsfält är externt kontrollerat (raden 'Gravity-anomaly synthesis from a spherical-harmonic model'), men dess navigeringsutfall har ingen extern oberoende referens

seg-d776abd5691c = Alternativ / kompletterande PNT är MODELLED, inte validerad: kontrollerad mot sin egen slutna / analytiska identitet — fångar transkriptions- och koefficientfel, men är ingen extern oberoende referens. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-98133e74f88a = Familjesida: <a1>GPS-nekad alternativ PNT</a1>

seg-bb7c9c4d4b5d = Källa: <c1/>

seg-562e59d703e3 = <c1/> (scenariotyp)

seg-6bdc150ab25b = Sekventiell (rekursiv) terrängreferensnavigering utan GPS: ett partikelfilter kör mätmodellen för terrängmatchning epok för epok (SITAN som löpande filter) så att en tidsvarierande INS-drift följs längs spåret, medan den enskilda terrain-nav-satsen bara återställer en enda konstant förskjutning.

seg-1e4350c2c5f0 = En körning av <c1/> sammanfattas som: terrain-slam | { "60" } waypoints | fri tröghets-RMS { "2947" } m (slutvärde { "5082" } m) | terrängmatchad RMS { "1241" } m (slutvärde { "69" } m, 2x minskning) | medel-ESS 2599/4000 | matchningssigma { "17.0" } m

seg-939d877137f6 = Obligatoriska fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

seg-5ceb5b8597ac = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

seg-48e022b0945e = Exemplet <c1/> anger bland annat:

seg-4aca87f022dc = Diagrammet som motorn skriver för scenarios/terrain-slam.toml, typ terrain-slam

seg-832919783819 = <s1>Föregående</s1>terrain-nav

seg-1693abd546fe = <s1>Nästa</s1>time-transfer-budget
