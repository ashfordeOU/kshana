# docs--kinds-mission-analysis-links-and-space-operations: translations (nl)

seg-6e0cb6acc073 = VALIDATED

seg-b03d56f501c3 = Type

seg-cb9447893c7f = Eén satelliet boven één station: de schuine afstand, elevatie en Es/N0 van elke passage langs de passage, de DVB-S2-MODCOD die bij elke stap is gekozen (drempels van ETSI EN { "302" } 307-1 Table { "13" } plus een implementatiemarge) en het datavolume dat ACM verplaatst tegen de basislijn met constante codering die bij het masker sluit. MODELLED.

seg-046f69293874 = De grafiek die de engine schrijft voor scenarios/acm-link.toml, type acm-link

seg-7eff466eb018 = Standregeling van ruimtevaartuigen: een traagheidsgerichte slew van een stijve hub met drie of meer gebalanceerde reactiewielen onder MRP-terugkoppeling (L = -K sigma - P omega), wieltorques met minimale norm begrensd tot de limiet van elke motor, RK4 met een zero-order hold; optioneel gesloten op een multiplicatieve EKF vanuit een gesimuleerde gyro (hoek- en snelheidsrandomwalk) en sterrenzoeker. Rapporteert insteltijd, einde- en piekrichtfout, piekwielsnelheid en -torque, de verzadigde fractie, drift van het impulsmoment en, met de schatter, de standfout en NEES. De lus met ware toestand is VALIDATED tegen Basilisk { "2.9.1" }; de schatter is MODELLED.

seg-08c624d5324d = De grafiek die de engine schrijft voor scenarios/aocs-slew.toml, kind aocs

seg-0cef33b41040 = Aperture duty cycle: het tijdsaandeel navigatie versus communicatie dat een contactplan impliceert voor een pool van stuurbare aperturen. Neemt een contactplan (een lijst van <c1/> aos_s/los_s-vensters, elk met een verzoek om navigatie of communicatie — dezelfde aos_s/los_s-woordenschat die de <c2/>-voorspeller uitgeeft), een aantal aperturen en een ARBITRAGEBELEID (standaard navigatieprioriteit, of communicatieprioriteit, of niet-preëmptief first-come-first-served) en rapporteert de navigatieduty, de communicatieduty, de idle duty en de uitval per sessie — de contacttijd die een sessie vroeg en die geen apertuur bediende. Een exacte intervalsweep over de venstergrenzen, zodat aansluitende vensters nooit concurreren en geen apertuurseconde dubbel wordt geteld; navigatie-, communicatie- en idle-apertuurseconden worden onafhankelijk opgeteld en sluiten tegen apertures*horizon_s. Het rapport vermeldt het opgeloste beleid, de volledige definitie ervan en de definities van duty en uitval, omdat een duty-cijfer dat zonder zijn arbitragebeleid wordt genoemd niet reproduceerbaar is. MODELLED planningsrekenwerk: er wordt geen slew-, hertuning- of omschakeltijd gerekend wanneer een apertuur van dienst of sessie wisselt, er is geen datavolume, bufferstatus, energiebudget of linksluiting die in de beslissing meespeelt, en de contactvensters zijn invoer — hun geometrie is wat ze ook heeft voortgebracht. Geen planningsproduct voor het grondsegment.

seg-a8b38ed8e029 = De grafiek die de engine schrijft voor scenarios/aperture-duty-cycle.toml, kind aperture-duty-cycle

seg-34d041d6bd9f = Vlakke zwaartekrachtbocht-opstijging van een meertrapsvoertuig boven een niet-roterende bolvormige aarde door de US Standard Atmosphere { "1976" } (verticale stijging, pitch-kick, stuwkracht langs de snelheid), waarbij de zwaartekracht-, weerstands-, stuur- en tegendrukverliezen worden geïntegreerd en wordt gecontroleerd of ideale dv min verliezen gelijk is aan de burn-outsnelheid; max-Q, piekversnelling en burn-outtoestand. MODELLED.

seg-ccf2185b0b5e = De grafiek die de engine schrijft voor scenarios/ascent-losses.toml, kind ascent-losses

seg-62c0dda9fc56 = 3-DOF-stand- en richtfoutbudget: het worstcase-verstoringsmoment van de zwaartekrachtgradiënt ((3/2)(μ/R³)ΔI) en een root-sum-square-richtfoutbudget over benoemde 1σ-bijdragers (sensorruis, reactiewieljitter, thermisch, uitlijning) met de dominante term, voor een baanhoogte + spreiding van het lichaamstraagheidsmoment. MODELLED scalair AOCS-budget — een pre-hardwarecomplement op Basilisk/42, geen simulatie van regellus, 6-DoF of flexibele modi.

seg-ad0e72e3b688 = De grafiek die de engine schrijft voor scenarios/attitude-budget.toml, kind attitude-budget

seg-be4e928a5865 = Planning van grondcontacten voor meerdere satellieten boven meerdere stations: schijnbare toegangsvensters (SGP4, aardvast frame IAU 2006/2000A, refractie ITU-R P.834, lichttijd), het DVB-S2-ACM-datavolume van elke passage (drempels van ETSI EN { "302" } 307-1 Table { "13" }) en een conflictvrij schema (één satelliet per antenne met een omschakeltijd, één station per satelliet, prioriteitsgewogen aflevering begrensd tot elke achterstand) door een greedy-methode op marginale waarde, een first-come-basislijn en een exacte branch-and-bound op kleine verzamelingen, met de optimaliteitskloof van de greedy-methode. MODELLED.

seg-e26b549579e2 = De grafiek die de engine schrijft voor scenarios/contact-schedule.toml, kind contact-schedule

seg-b843e2e0a4ee = 3-DoF-puntmassa-atmosferische-intrede boven een roterende bolvormige Aarde of Mars (ballistisch of liftend bij constante rolhoek), RK4, door US76, een exponentiële of de Mars-atmosfeer, met convectieve verwarming van het stuwpunt volgens Sutton-Graves (NASA TR R-376): piekvertraging, warmteflux en dynamische druk, warmtelast, downrange, een energiecontrole in het roterende frame en de gesloten vorm van Allen-Eggers ernaast. De piekvertraging wordt gecontroleerd tegen de gepubliceerde nominale waarde van Stardust; de verwarming is MODELLED.

seg-dbb618cd6357 = De grafiek die de engine schrijft voor scenarios/entry-heating-stardust.toml, kind entry-heating

seg-47b4aea6ed01 = Voetafdruk van een aardobservatiepayload en dekkingsgeometrie (SMAD-ruimtedriehoek): hoekstraal van de Aarde, zwadbreedte, grondafstand van een sample in nadir, maximale toegang buiten nadir, cirkelvormige periode, J2-knoopperiode en equatoriale grondspoorafstand met een vlag voor aaneengesloten dekking, voor een baanhoogte, inclinatie (standaard zonsynchroon) en sensor-FOV/IFOV. MODELLED bolvormige-Aardegeometrie (geen radiometrie/MTF/atmosfeer/jitter/glint); knoopafstand R_e·(ω − Ω̇)·T_nodal met eerste-orde seculaire J2-snelheden.

seg-c2a8332f2ee2 = De grafiek die de engine schrijft voor scenarios/eo-coverage.toml, kind eo-coverage

seg-816bd5a5808a = Radiometrie en beeldkwaliteit van een nadirbeeldvormer: radiantie van een lambertiaanse scène aan de apertuur, de cameravergelijking, signaal en shot-/donker-/lees-/kwantisatieruis en SNR; de systeem-MTF bij Nyquist (diffractie x detector x smear x jitter), de daaruit afgeleide relatieve randrespons, Q = lambda F/p en de GIQE-versie { "4" }-NIIRS zonder MTF-compensatie. MODELLED.
