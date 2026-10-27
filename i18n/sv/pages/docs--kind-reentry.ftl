# docs--kind-reentry: translations (sv)

seg-99ef7c1d552c = Scenariotyp i motor v{ $version }, familj <a1>Uppdragsanalys, länkar och rymdoperationer</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-8f1e7d3f5a07 = Familjesida: <a1>Uppdragsanalys, länkar och rymdoperationer</a1>

seg-3a3ee499961e = <b>MODELLED</b> Plan gravitationssväng-uppstigning för ett flerstegsfordon över en icke-roterande sfärisk jord genom US Standard Atmosphere { "1976" } (densitet och tryck), med en pitchsparkning, dragkraft reducerad av dysans mottryck, stegens brinntidens slut vid exakta s

seg-8e62cc4af6ea = Ämnessida: <a1>ENTRY-EO-ASCENT.md</a1>

seg-05ce408c2dbb = kg/m^{ "2" }

seg-195347c63a8a = m/s^{ "2" }

seg-c95aec0d2943 = Källa: <c1/>

seg-91424dc65b3e = <c1/> (scenariotyp)

seg-039f77066d97 = Ballistisk återinträdeskorridor enligt Allen-Eggers: toppavbromsning (oberoende av ballistisk koefficient, V_e^{ "2" } sin|γ|/(2eH)), hastighet och höjd vid toppavbromsningen samt hastigheten vid toppuppvärmning, för en ingångshastighet/banvinkel/ballistisk koefficient genom en exponentiell atmosfär, plus en plan punktmassintegrering av samma ballistiska inträde med gravitation, jordkrökning och US Standard Atmosphere { "1976" } (toppavbromsning, hastighet, höjd och tid vid toppen). MODELLED ballistiskt inträde (utan lyft); uppvärmningsutdata är HASTIGHETEN vid toppuppvärmning, inte ett värmeflöde (ingen aerotermisk/TPS-modell).

seg-9908d06c50eb = En körning av <c1/> sammanfattas som: reentry (Allen–Eggers): V_e { "7800" } m/s, γ { "6.0" }° -> peak { "16.6" } g at { "49" } km, { "4731" } m/s; heating peaks at { "6603" } m/s; point mass (gravity, curvature, US76) peak { "16.4" } g (MODELLED ballistic, no aerothermal)

seg-f057c2a160e7 = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-576245fd5b70 = Exemplet <c1/> anger bland annat:

seg-0b7769c97ff3 = Resultatetikett (motorns egen): MODELLED — ballistiskt inträde enligt Allen–Eggers (utan lyft), exponentiell isoterm atmosfär, konstant banvinkel; toppbelastningen i g är oberoende av ballistisk koefficient; uppvärmningen är HASTIGHETEN vid toppuppvärmning, INTE ett värmeflöde (ingen aerotermisk/TPS-modell)

seg-b0109481e8ff = Diagrammet som motorn skriver för scenarios/reentry.toml, typ reentry

seg-c860b8679b47 = <b>MODELLED</b> Toppavbromsning (oberoende av ballistisk koefficient), hastighet + höjd vid topp-g och hastighet vid toppuppvärmning för ett ballistiskt inträde i exponentiell atmosfär. Tester: <a1>reentry_point_mass_accelerometer_oracle.rs</a1>.

seg-84abc0b9f859 = <b>MODELLED</b> Toppavbromsning (oberoende av ballistisk koefficient), hastighet + höjd vid topp-g och hastighet vid toppuppvärmning för ett ballistiskt inträde i exponentiell atmosfär. R. Oberoende referens (InternalConsistency): Analytiskt inträde enligt Allen–Eggers i sluten form, dessutom korskontrollerat mot en numerisk integrering med scipy { "1.18" } solve_ivp (DOP853) av SAMMA ODE för inträde med enbart luftmotstånd (tests/ballistic_re_entry_corridor_reference.rs, { "36" } fall, sämsta a_max rel { "2.9e-9" }) — en kontroll av numerisk integral mot den egna analytiska formen, alltså fortfarande InternalConsistency, INTE en extern validering. MODELLED ballistiskt (utan lyft), ingen aerotermisk/TPS — uppvärmningsutdata är en ve

seg-8b9d3db5d563 = MODELLED — ballistiskt inträde enligt Allen–Eggers (utan lyft), exponentiell isoterm atmosfär, konstant banvinkel; toppbelastningen i g är oberoende av ballistisk koefficient; uppvärmningen är HASTIGHETEN vid toppuppvärmning, INTE ett värmeflöde (ingen aerotermisk/TPS-modell) (resultat <c1/>)

seg-82de2275c919 = MODELLED ballistiskt inträde (utan lyft); uppvärmningsutdata är HASTIGHETEN vid toppuppvärmning, inte ett värmeflöde (ingen aerotermisk/TPS-modell). (typkatalog (<c1/>))

seg-080b28422342 = ÄRLIG AVGRÄNSNING: MODELLED ballistiskt (utan lyft), exponentiell isoterm atmosfär, konstant banvinkel. Ingen aerotermisk/TPS-modell -- uppvärmningsutdata är HASTIGHETEN vid toppuppvärmning, inte ett värmeflöde. Inte en 3-/6-DoF-bana. Kör: kshana scenarios/reentry.toml (kommentar i scenariofilen, rad { "8" } till { "11" })

seg-cfc345f0dc0d = Ballistisk återinträdeskorridor (Allen–Eggers) är MODELLED, inte validerad: kontrollerad mot sin egen slutna analytiska identitet. Det fångar överförings- och koefficientfel, men är ingen extern oberoende referens. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-a4b7c16e3fea = <s1>Föregående</s1>realtime-frame-eop

seg-6166a1c21525 = <s1>Nästa</s1>slot-timing
