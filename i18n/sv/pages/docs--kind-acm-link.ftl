# docs--kind-acm-link: translations (sv)

seg-a686bcdc6cc9 = Källa: <c1/>

seg-a53e57719a74 = <c1/> (scenariotyp)

seg-99ef7c1d552c = Scenariotyp i motor v{ $version }, familj <a1>Uppdragsanalys, länkar och rymdoperationer</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-cb9447893c7f = En satellit över en station: varje överflygnings lutande avstånd, elevation och Es/N0 längs överflygningen, den DVB-S2 MODCOD som väljs vid varje steg (ETSI EN { "302" } 307-1 tabell { "13" }, trösklar plus en implementeringsmarginal) och den datavolym som ACM för över jämfört med baslinjen med konstant kodning som sluter vid masken. MODELLED.

seg-1ab30ff9616a = En körning av <c1/> sammanfattas som: acm-link: { "3" } överflygning(ar); ACM { "92866" } Mbit mot CCM 8PSK 3/4 { "58495" } Mbit -> vinst x1.59 (MODELLED)

seg-54e2159e532d = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-c7d1b4b1f247 = Exemplet <c1/> anger bland annat:

seg-debc2f07db78 = true

seg-8784979d6569 = dBW

seg-dfe78b9d0811 = GHz

seg-37d16b499bc5 = dB

seg-b77b8420b4f5 = Mbit

seg-37d29d8303fe = km

seg-eeaa777e4301 = 8PSK 3/4

seg-d62795b9fdc0 = Resultatetikett (motorns): MODELLED — adaptiv kodning och modulering för DVB-S2 över en satellits överflygningar vid en station: Es/N0 vid klar himmel längs varje synlig överflygning, den effektivaste MODCOD som klarar sin ETSI EN { "302" } 307-1 tabell { "13" }-tröskel plus en marginal, mot den MODCOD med konstant kodning som sluter vid masken; inget regn

seg-046f69293874 = Diagrammet som motorn skriver för scenarios/acm-link.toml, typ acm-link

seg-0f4c2ab525ac = <b>MODELLED</b> Nedlänkens Es/N0 längs varje överflygning av en satellit över en station (EIRP, fri-rymdsdämpning, atmosfärsdämpning enligt cosekantlagen, övriga förluster, G/T, Boltzmanns konstant, symbolhastighet), den effektivaste DVB-S2 MODCOD som klarar sin ETSI EN { "302" } 307-

seg-c246881f6fd4 = <b>VALIDATED</b> Synlighetsöverflygningar (AOS, TCA, LOS, maximal synlig elevation, varaktighet) för en SGP4-elementuppsättning över en WGS-84-station på den validerade jordbanevägen (IAU { "2006" }. Oberoende referens (ExternalDataset): Orekit { "13.1.8" } (CS GROUP, Apache-2.0) med Hipparchus { "4.0.3" }: TLEPropagator på samma elementuppsättningar i ett TEME som Orekit bygger enligt den angivna definitionen (dess IERS { "2010" } TOD roterad med GAST - GMST), ElevationDetector och ElevationExtremumDetector med och utan ITURP834AtmosphericRefraction, och AngularAzEl med AngularRadioRefractionModifier för ljustidsfallet, skärningar och maximum lösta av Hipparchus; { "60" } fall (f

seg-35588ca8e9bb = <b>MODELLED</b> Nedlänkens Es/N0 längs varje överflygning av en satellit över en station (EIRP, fri-rymdsdämpning, atmosfärsdämpning enligt cosekantlagen, övriga förluster, G/T, Boltzmanns konstant,. Oberoende referens (InternalConsistency): Inre samstämmighet: spektraleffektiviteten beräknad i sluten form från tabell 5a K_bch och ramlängderna stämmer med de effektiviteter som tabell { "13" } skriver ut (en transkriptionskontroll av tröskeltabellen); länkbudgetens delar stämmer med sina slutna former; valet är monotont i Es/N0 och respekterar marginalen; ACM för över minst volymen med konstant kodning. Överflygningsgeometrin kommer från den separat VALIDATED a

seg-02e9f2e87410 = MODELLED — adaptiv kodning och modulering för DVB-S2 över en satellits överflygningar vid en station: Es/N0 vid klar himmel längs varje synlig överflygning, den effektivaste MODCOD som klarar sin ETSI EN { "302" } 307-1 tabell { "13" }-tröskel plus en marginal, mot den MODCOD med konstant kodning som sluter vid masken; inget regnfading eller pekningsförlust längs överflygningen (resultat <c1/>)

seg-cd04f5662884 = MODELLED. (typkatalog (<c1/>))

seg-a2cdc7dff1e3 = Varje tal nedan är ILLUSTRATIVE: ingen operatörs bana, station eller länkbudget. MODELLED. (kommentar i scenariofilen, rad { "8" })

seg-7f8667e8d8fe = Adaptiv kodning och modulering för DVB-S2 längs en LEO-nedlänkspassage är MODELLED, inte validerad: kontrollerad mot sin egen slutna / analytiska identitet — fångar transkriptions- och koefficientfel, men är ingen extern oberoende referens. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-8f1e7d3f5a07 = Familjesida: <a1>Uppdragsanalys, länkar och rymdoperationer</a1>

seg-72fd0321e4af = Ämnessida: <a1>CONTACT-SCHEDULING.md</a1>

seg-1f67ae89028b = <s1>Nästa</s1>aocs
