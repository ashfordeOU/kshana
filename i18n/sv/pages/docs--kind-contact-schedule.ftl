# docs--kind-contact-schedule: translations (sv)

seg-99ef7c1d552c = Scenariotyp i motor v{ $version }, familj <a1>Uppdragsanalys, länkar och rymdoperationer</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-debc2f07db78 = true

seg-8784979d6569 = dBW

seg-dfe78b9d0811 = GHz

seg-37d16b499bc5 = dB

seg-0f4c2ab525ac = <b>MODELLED</b> Nedlänkens Es/N0 längs varje överflygning av en satellit över en station (EIRP, fri-rymdsdämpning, atmosfärsdämpning enligt cosekantlagen, övriga förluster, G/T, Boltzmanns konstant, symbolhastighet), den effektivaste DVB-S2 MODCOD som klarar sin ETSI EN { "302" } 307-

seg-c246881f6fd4 = <b>VALIDATED</b> Synlighetsöverflygningar (AOS, TCA, LOS, maximal synlig elevation, varaktighet) för en SGP4-elementuppsättning över en WGS-84-station på den validerade jordbanevägen (IAU { "2006" }. Oberoende referens (ExternalDataset): Orekit { "13.1.8" } (CS GROUP, Apache-2.0) med Hipparchus { "4.0.3" }: TLEPropagator på samma elementuppsättningar i ett TEME som Orekit bygger enligt den angivna definitionen (dess IERS { "2010" } TOD roterad med GAST - GMST), ElevationDetector och ElevationExtremumDetector med och utan ITURP834AtmosphericRefraction, och AngularAzEl med AngularRadioRefractionModifier för ljustidsfallet, skärningar och maximum lösta av Hipparchus; { "60" } fall (f

seg-35588ca8e9bb = <b>MODELLED</b> Nedlänkens Es/N0 längs varje överflygning av en satellit över en station (EIRP, fri-rymdsdämpning, atmosfärsdämpning enligt cosekantlagen, övriga förluster, G/T, Boltzmanns konstant,. Oberoende referens (InternalConsistency): Inre samstämmighet: spektraleffektiviteten beräknad i sluten form från tabell 5a K_bch och ramlängderna stämmer med de effektiviteter som tabell { "13" } skriver ut (en transkriptionskontroll av tröskeltabellen); länkbudgetens delar stämmer med sina slutna former; valet är monotont i Es/N0 och respekterar marginalen; ACM för över minst volymen med konstant kodning. Överflygningsgeometrin kommer från den separat VALIDATED a

seg-cd04f5662884 = MODELLED. (typkatalog (<c1/>))

seg-7f8667e8d8fe = Adaptiv kodning och modulering för DVB-S2 längs en LEO-nedlänkspassage är MODELLED, inte validerad: kontrollerad mot sin egen slutna / analytiska identitet — fångar transkriptions- och koefficientfel, men är ingen extern oberoende referens. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-8f1e7d3f5a07 = Familjesida: <a1>Uppdragsanalys, länkar och rymdoperationer</a1>

seg-72fd0321e4af = Ämnessida: <a1>CONTACT-SCHEDULING.md</a1>

seg-b79fcddea1d6 = Källa: <c1/>

seg-040d160b3fdd = <c1/> (scenario kind)

seg-be4e928a5865 = Planering av markkontakter för flera satelliter över flera stationer: skenbara åtkomstfönster (SGP4, jordfast system enligt IAU 2006/2000A, refraktion enligt ITU-R P.834, ljustid), DVB-S2 ACM-datavolymen för varje passage (ETSI EN { "302" } 307-1, trösklarna i Table { "13" }) och en konfliktfri tidsplan (en satellit per antenn med omställningstid, en station per satellit, prioritetsviktad leverans begränsad till varje eftersläpning) med en girig metod med marginalvärde, en först-till-kvarn-baslinje och en exakt branch and bound på små mängder, med den giriga metodens optimalitetsgap. MODELLED.

seg-7a3fad06a9fc = En körning av <c1/> sammanfattas som: contact-schedule: { "3" } satelliter x { "3" } stationer över { "12" } h -> { "31" } kandidatkontakter, { "22" } schemalagda; { "797266" } av { "860000" } Mbit levererade (MODELLED)

seg-a03d83f5866a = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-5ba0968796ac = Exemplet <c1/> anger bland annat:

seg-cade59b5a371 = Resultatetikett (motorns egen): MODELLED — kontaktplan för flera satelliter och flera stationer: skenbara åtkomstfönster (SGP4, IAU 2006/2000A, refraktion enligt ITU-R P.834, ljustid), DVB-S2 ACM-datavolym per passage utifrån en länkbudget med klar himmel (ETSI EN { "302" } 307-1, trösklarna i Table { "13" }) och konfliktlösning (en satellit per antenn med tu

seg-e26b549579e2 = Diagrammet som motorn skriver för scenarios/contact-schedule.toml, kind contact-schedule

seg-036b708ed2b9 = <b>MODELLED</b> Kandidatkontakter från varje passage mellan satellit och station med dess ACM-datavolym; konflikter där en antenn skulle betjäna två satelliter inom sin omställningstid eller en satellit skulle sända ner till två stationer samtidigt; en prioritetsviktad leverans

seg-60431931082a = <b>MODELLED</b> Kandidatkontakter från varje passage mellan satellit och station med dess ACM-datavolym; konflikter där en antenn skulle betjäna två satelliter inom sin omställningstid eller o. Oracle (InternalConsistency): Intern konsistens: den exakta branch and bound överensstämmer med uttömmande uppräkning på små slumpmässiga mängder, varje plan kontrolleras som genomförbar mot konfliktreglerna, och den giriga metoden slår aldrig det exakta optimumet. VAD SOM INTE GÄLLER: ingen extern schemaläggare eller operativ plan har jämförts; kontakter tas hela (ingen delning), eftersläpningen är fast vid fönstrets start, ställtid utöver den fasta omställningstiden och onboard s

seg-9941b9f6d4a8 = MODELLED — kontaktplan för flera satelliter och flera stationer: skenbara åtkomstfönster (SGP4, IAU 2006/2000A, refraktion enligt ITU-R P.834, ljustid), DVB-S2 ACM-datavolym per passage utifrån en länkbudget med klar himmel (ETSI EN { "302" } 307-1, trösklarna i Table { "13" }) och konfliktlösning (en satellit per antenn med omställningstid, en station per satellit) med en girig metod med marginalvärde som kontrollerats mot en exakt branch and bound; inget regnfädning, (result <c1/>)

seg-f8ef88bc82b5 = Varje tal nedan är ILLUSTRATIVE: inga operatörers banor, stationer eller länkbudgetar. MODELLED: schemaläggaren kontrolleras mot sin egen exakta lösare, inte mot ett externt verktyg. (scenario file comment, lines { "11" } to { "12" })

seg-fe2b4799b397 = Markkontaktsplanering för flera satelliter och flera stationer med konfliktlösning är MODELLED, inte validerad: kontrollerad mot sin egen slutna/analytiska identitet. Det fångar transkriptions- och koefficientfel men är ingen extern oberoende referens. (verification matrix (docs/MODELLED-RATIONALE.md))

seg-be14d99cb86d = <s1>Föregående</s1>constellation-design

seg-3784be57d6df = <s1>Nästa</s1>earth-gnss-lunar
