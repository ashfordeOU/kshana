# docs--kind-reentry: translations (nl)

seg-99ef7c1d552c = Scenariotype van de engine v{ $version }, familie <a1>Missieanalyse, verbindingen en ruimteoperaties</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen dienst voor het redden van mensenlevens. Elk label hier is dat van de engine of van de verificatiematrix; een type is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-8f1e7d3f5a07 = Familiepagina: <a1>Missieanalyse, verbindingen en ruimteoperaties</a1>

seg-3a3ee499961e = <b>MODELLED</b> Vlakke zwaartekrachtbocht-opstijging van een meertrapsvoertuig boven een niet-roterende bolvormige aarde door de US Standard Atmosphere { "1976" } (dichtheid en druk), met een pitch-kick, stuwkracht verminderd door de tegendruk van het mondstuk, trapburn-outs op exacte s

seg-8e62cc4af6ea = Onderwerppagina: <a1>ENTRY-EO-ASCENT.md</a1>

seg-05ce408c2dbb = kg/m^{ "2" }

seg-195347c63a8a = m/s^{ "2" }

seg-c95aec0d2943 = Bron: <c1/>

seg-91424dc65b3e = <c1/> (scenariosoort)

seg-039f77066d97 = Ballistisch terugkeercorridor volgens Allen-Eggers: piekvertraging (onafhankelijk van de ballistische coëfficiënt, V_e^{ "2" } sin|γ|/(2eH)), de snelheid en hoogte bij de piek-g, en de snelheid bij piekverhitting, voor een intreesnelheid/baanhoek/ballistische coëfficiënt door een exponentiële atmosfeer, plus een vlakke puntmassa-integratie van dezelfde ballistische intrede met zwaartekracht, aardkromming en de US Standard Atmosphere { "1976" } (piekvertraging, snelheid, hoogte en tijd bij de piek). MODELLED ballistische intrede (zonder lift); de verhittingsuitvoer is de SNELHEID bij piekverhitting, geen warmtestroom (geen aerothermisch model/TPS-model).

seg-9908d06c50eb = Eén run van <c1/> vat samen als: terugkeer (Allen–Eggers): V_e { "7800" } m/s, γ { "6.0" }° -> piek { "16.6" } g op { "49" } km, { "4731" } m/s; verhitting piekt bij { "6603" } m/s; puntmassa (zwaartekracht, kromming, US76) piek { "16.4" } g (MODELLED ballistisch, geen aerothermisch model)

seg-f057c2a160e7 = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-576245fd5b70 = Het voorbeeld <c1/> stelt onder meer in:

seg-0b7769c97ff3 = Resultaatlabel (van de engine): MODELLED — ballistische intrede volgens Allen–Eggers (zonder lift), exponentiële isotherme atmosfeer, constante baanhoek; piek-g is onafhankelijk van de ballistische coëfficiënt; de verhitting is de SNELHEID bij piekverhitting, GEEN warmtestroom (geen aerothermisch model/TPS-model)

seg-b0109481e8ff = De grafiek die de engine schrijft voor scenarios/reentry.toml, soort reentry

seg-c860b8679b47 = <b>MODELLED</b> Piekvertraging (onafhankelijk van de ballistische coëfficiënt), snelheid + hoogte bij piek-g en snelheid bij piekverhitting voor een ballistische intrede in een exponentiële atmosfeer. Tests: <a1>reentry_point_mass_accelerometer_oracle.rs</a1>.

seg-84abc0b9f859 = <b>MODELLED</b> Piekvertraging (onafhankelijk van de ballistische coëfficiënt), snelheid + hoogte bij piek-g en snelheid bij piekverhitting voor een ballistische intrede in een exponentiële atmosfeer. R. Onafhankelijke referentie (InternalConsistency): analytische intrede volgens Allen–Eggers in gesloten vorm, aanvullend gecontroleerd tegen een numerieke integratie met scipy { "1.18" } solve_ivp (DOP853) van dezelfde intrede-ODE met alleen weerstand (tests/ballistic_re_entry_corridor_reference.rs, { "36" } gevallen, slechtste a_max rel { "2.9e-9" }) — een controle van een numerieke integraal tegen de eigen analytische vorm, dus nog steeds InternalConsistency, GEEN externe validatie. MODELLED ballistisch (zonder lift), geen aerothermisch model/TPS-model — de verhittingsuitvoer is een ve

seg-8b9d3db5d563 = MODELLED — ballistische intrede volgens Allen–Eggers (zonder lift), exponentiële isotherme atmosfeer, constante baanhoek; piek-g is onafhankelijk van de ballistische coëfficiënt; de verhitting is de SNELHEID bij piekverhitting, GEEN warmtestroom (geen aerothermisch model/TPS-model) (resultaat <c1/>)

seg-82de2275c919 = MODELLED ballistische intrede (zonder lift); de verhittingsuitvoer is de SNELHEID bij piekverhitting, geen warmtestroom (geen aerothermisch model/TPS-model). (soortencatalogus (<c1/>))

seg-080b28422342 = EERLIJKE REIKWIJDTE: MODELLED ballistisch (zonder lift), exponentiële isotherme atmosfeer, constante baanhoek. Geen aerothermisch model/TPS-model -- de verhittingsuitvoer is de SNELHEID bij piekverhitting, geen warmtestroom. Geen 3-/6-DoF-traject. Run: kshana scenarios/reentry.toml (opmerking in het scenariobestand, regels { "8" } tot { "11" })

seg-cfc345f0dc0d = Het ballistische terugkeercorridor (Allen–Eggers) is MODELLED, niet getoetst: gecontroleerd aan de hand van de eigen gesloten-vormidentiteit of analytische identiteit — dat vangt transcriptie- en coëfficiëntfouten, maar is geen externe referentie. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-a4b7c16e3fea = <s1>Vorige</s1>realtime-frame-eop

seg-6166a1c21525 = <s1>Volgende</s1>slot-timing
