# docs--compliance: translations (nl)

seg-f65b1f2b4182 = Modus

seg-e19db3d5273b = Bron: <c1/>

seg-045b24defdbb = DO-316 / DO-229E integriteit: compliance-overzicht

seg-9100800daa1c = Dit document koppelt de eisen voor beschermingsniveaus en integriteitsbewaking van RTCA (voorheen de Radio Technical Commission for Aeronautics) <b>DO-229E</b> (SBAS (satellite-based augmentation system) MOPS (minimum operational performance standards)) en <b>DO-316</b> (GPS/SBAS (GPS: Global Positioning System) boordapparatuur) aan de { -brand }-functies die ze implementeren. Het is een <b>hulpmiddel voor technische traceerbaarheid</b>, geen verklaring dat een eis is gehaald — { -brand } implementeert de gepubliceerde algoritmen; het is geen goedgekeurde avionica.

seg-0e6ec5617eb5 = De machineleesbare vorm is <a1><c1/></a1>; deze tekst is de bijbehorende toelichting (naar het voorbeeld van <a2><c2/></a2>).

seg-d5d7a2ec9c73 = Beschermingsniveaus met gewogen kleinste kwadraten (DO-229E Appendix J)

seg-0dc19f403f5e = Voor elke satelliet <em>i</em> met elevatie <c1/> en azimut <c2/> bij de gebruiker is de waarnemingsrij in het lokale vlak (ENU (east-north-up) + klok)

seg-6415f7f28e7e = met gewicht <c1/>, <c2/> (het budget voor UDRE (user differential range error) / GIVE (grid ionospheric vertical error) / boordapparatuur / troposfeer). De positiecovariantie is <c3/>; het ENU-blok daarvan geeft de horizontale en verticale beschermingsniveaus (HPL, VPL):

seg-ea574448bda4 = { -brand } berekent <c1/> door de normaalmatrix van { "4" }×{ "4" } te inverteren met dezelfde routine die de RAIM-stack (receiver autonomous integrity monitoring) gebruikt (<c2/>), en valideert het resultaat op twee manieren (de covariantieroute <c3/> en de projectieroute <c4/> moeten overeenstemmen) en bovendien aan de hand van een onafhankelijke numpy-referentiegeometrie met <c5/>.

seg-f63dd3d7aad4 = Bron

seg-268ae5b25684 = En-route → NPA (non-precision approach; alleen horizontaal)

seg-479790ca91c3 = Rayleigh <c1/> = { "6.1829" }

seg-dbae96c75a06 = Precision Approach

seg-1bfafdcf6ab0 = DO-229E MOPS

seg-1922c53b8340 = Eerlijkheidsnotitie: de MOPS gebruikt de afgeronde horizontale constante <c1/>; het exacte tweezijdige normale kwantiel <c2/> is <c3/>. { -brand } gebruikt in de code de gepubliceerde { "6.0" } en leidt <c4/> af uit dezelfde <c5/> die de RAIM-stack gebruikt, een niet-circulaire kruiscontrole (de waarde rondt af op de MOPS-waarde { "5.33" }).

seg-ef191c1d3db1 = L1/L5 ionosfeervrije combinatie met twee frequenties (IS-GPS-705)

seg-b69825ef05d3 = Met <c1/>, <c2/>, <c3/>:

seg-ce81c6b71738 = De ionosferische vertraging van de eerste orde (<c1/>) valt exact weg — gecontroleerd aan de hand van de onafhankelijke fysica van <c2/> in de engine voor een reeks TEC-waarden (total electron content). De ruisversterking bij invoer met gelijke variantie is <c3/>.

seg-e111fb05a7c6 = <b>In de repository, geautomatiseerd</b> (bij elke commit): de K-factoren tegen hun verdelingsdefinities, <c1/> en de ionosfeervrije (IF) coëfficiënten tegen de frequenties van IS-GPS-705 (IS: Interface Specification), het wegvallen van de eerste-orde-ionosfeer tegen de onafhankelijke vertragingsfysica, en de beschermingsniveaus met gewogen kleinste kwadraten (WLS) tegen een numpy-referentiegeometrie met <c2/> (<c3/>).

seg-f30d84abe275 = <b>Externe onafhankelijke referentie, geautomatiseerd</b> (<c1/>): gegeven de elevatie, het azimut en de totale 1-σ van elke satelliet reproduceert <c2/> de HPL van een onafhankelijke implementatie, <c3/> in de SBAS-beschermingsniveaufork <c4/> van RTKLIB (een opensourcebibliotheek voor real-time kinematic positiebepaling) (Siki & Takács { "2017" }), op zes epochs die die tool berekende uit <b>echte EGNOS-uitzendberichten (European Geostationary Navigation Overlay Service)</b> (geostationaire PRN (pseudo-random noise code number) { "120" }) en echte RINEX-waarnemingen (Receiver Independent Exchange Format) van het station BUTE in Boedapest (2017-02-19), tot op <b>< { "2e-3" } m</b>. De referentie rondt K_V af op { "5.33" }, dus het verticale deel wordt zonder K-factor vergeleken, als <c5/> tegen zijn VPL / { "5.33" }. ESA gLAB (European Space Agency) { "v6.0.0" } (<c6/>) gebruikt dezelfde formule.

seg-389e8a57e3e8 = <b>Niet gedaan</b>: de σ per satelliet is die van de referentie zelf; het modelleren van σ uit ruwe UDRE/GIVE-berichten valt buiten de reikwijdte, en geen enkel officieel gepubliceerd WAAS- (Wide Area Augmentation System) of EGNOS-beschermingsniveauproduct is van begin tot eind gereproduceerd. DO-229E/DO-316 zelf zitten bij RTCA achter een betaalmuur; de open bron voor de afleiding is de ICAO/EGNOS-SBAS-pagina's (ICAO: International Civil Aviation Organization) van ESA Navipedia.

seg-7686fb3d3e0c = <s1>Vorige</s1>ARAIM-referentie

seg-0457ef382fb0 = <s1>Volgende</s1>Veerkrachtcorrespondentietabel
