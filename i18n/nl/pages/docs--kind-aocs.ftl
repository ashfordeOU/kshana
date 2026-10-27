# docs--kind-aocs: translations (nl)

seg-99ef7c1d552c = Scenariotype van de engine v{ $version }, familie <a1>Missieanalyse, verbindingen en ruimteoperaties</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen dienst voor het redden van mensenlevens. Elk label hier is dat van de engine of van de verificatiematrix; een type is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-8f1e7d3f5a07 = Familiepagina: <a1>Missieanalyse, verbindingen en ruimteoperaties</a1>

seg-5cd8b3d8c098 = Bron: <c1/>

seg-7f2ade997df5 = <c1/> (scenariokind)

seg-7eff466eb018 = Standregeling van ruimtevaartuigen: een traagheidsgerichte slew van een stijve hub met drie of meer gebalanceerde reactiewielen onder MRP-terugkoppeling (L = -K sigma - P omega), wieltorques met minimale norm begrensd tot de limiet van elke motor, RK4 met een zero-order hold; optioneel gesloten op een multiplicatieve EKF vanuit een gesimuleerde gyro (hoek- en snelheidsrandomwalk) en sterrenzoeker. Rapporteert insteltijd, einde- en piekrichtfout, piekwielsnelheid en -torque, de verzadigde fractie, drift van het impulsmoment en, met de schatter, de standfout en NEES. De lus met ware toestand is VALIDATED tegen Basilisk { "2.9.1" }; de schatter is MODELLED.

seg-a499721d08b1 = Eén run van <c1/> vat samen als: aocs: { "4" } wielen, { "600" } s slew van { "82.06" } deg -> settelt onder { "0.1" } deg bij { "481.0" } s | eind { "2.37e-2" } deg | piekwiel { "1797" } rpm | lus met ware toestand

seg-2ad4d3f07a6a = Verplichte velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

seg-ed0c5c6266d9 = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-a09eb69b36d7 = Het voorbeeld <c1/> stelt onder meer in:

seg-8b51cfcf5bd5 = N m

seg-6876b0214e4c = N m s

seg-8e4dea0df19e = kg m^{ "2" }

seg-51362910dcb7 = { "2" } meegeleverde scenario's gebruiken dit kind; de overige staan in <a1><c1/></a1>.

seg-b054c73f22e5 = geen waarde

seg-6e22c97374b0 = Resultaatlabel (van de engine): VALIDATED regelwet en wieldynamica (tegen Basilisk { "2.9.1" } op de lus met ware toestand); de invoer van deze run is die van het scenario zelf — reactiewielregeling onder MRP-terugkoppeling, traagheidsgerichte richting, geen sensorruis, geen wrijving

seg-08c624d5324d = De grafiek die de engine schrijft voor scenarios/aocs-slew.toml, kind aocs

seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" }: de rijen van de <a1>verificatiematrix</a1> die dit kind noemen.

seg-d69a588facf1 = <b>VALIDATED</b> Traagheidsgerichte standregeling van een stijve hub met drie of meer gebalanceerde reactiewielen: de MRP-terugkoppelwet L_r = -K sigma_BR - P omega_BR (Schaub en Junkins), wielmotortorques met minimale norm G_s u = -L_r, begrensd tot de l Tests: <a1>aocs_basilisk_oracle.rs</a1>.

seg-7bc495b05d9a = <b>MODELLED</b> De multiplicatieve EKF van Lefferts-Markley-Shuster: toestanden voor standfout in het lichaamsframe en gyrobias, propagatie met de gyrosnelheid min de biasschatting en het discrete procesruis van Farrenkopf (hoek- en snelheidsrandomwalk), sterrenzoekerupdate

seg-7e3e0dcc936f = <b>VALIDATED</b> Traagheidsgerichte standregeling van een stijve hub met drie of meer gebalanceerde reactiewielen: de MRP-terugkoppelwet L_r = -K sigma_BR - P omega_BR (Schaub en J. Onafhankelijke referentie (ExternalDataset): Basilisk { "2.9.1" } (AVSLab, ISC; de bsk-wielrun als afzonderlijk hulpmiddel, nooit gelinkt of gevendord): ruimtevaartuighub, reactionWheelStateEffector (BalancedWheels, torquelimiet aan), simpleNav, inertial3D, attTrackingError, mrpFeedback (zonder integraalterm) en rwMotorTorque bij dt = { "0.1" } s met zijn RK4, tegenover Kshana's eigen implementatie op drie gevallen (drie orthogonale wielen; een vierwielige piramide; een verzadigend vierwielig geval),

seg-d7889856073b = <b>MODELLED</b> De multiplicatieve EKF van Lefferts-Markley-Shuster: toestanden voor standfout in het lichaamsframe en gyrobias, propagatie met de gyrosnelheid min de biasschatting en Farre. Onafhankelijke referentie (InternalConsistency): Interne consistentie: de genormaliseerde geschatte fout in het kwadraat van het filter tegenover een referentie die met dezelfde sensormodellen over Monte-Carlo-seeds is gesimuleerd, en de convergentie van de stand- en biasschattingen. WAT NIET: er is geen externe schatter of vluchtdata vergeleken (Basilisk { "2.9.1" } heeft geen MEKF-module); de sensormodellen zijn de leerboekmodellen, zonder misalignment, schaalfactor of effecten van het gezichtsveld van de sterrenzoeker.

seg-3b71575e0c23 = De lus met ware toestand is VALIDATED tegen Basilisk { "2.9.1" }; de schatter is MODELLED. (kindcatalogus (<c1/>))

seg-c7ff0ddbd040 = Multiplicatieve EKF-standschatting vanuit een gyro en een sterrenzoeker is MODELLED, niet extern getoetst: gecontroleerd tegen zijn eigen gesloten-vorm- of analytische identiteit — dat vangt transcriptie- en coëfficiëntfouten, maar is geen externe referentie. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-cc4e7274d409 = Onderwerppagina: <a1>AOCS.md</a1>

seg-b022bad77259 = <s1>Vorige</s1>acm-link

seg-1fb6e680fd4a = <s1>Volgende</s1>aperture-duty-cycle
