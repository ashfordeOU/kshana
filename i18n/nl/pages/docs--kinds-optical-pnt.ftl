# docs--kinds-optical-pnt: translations (nl)

seg-b03d56f501c3 = Type

seg-e6839b50b560 = MODELLED heterogene gezamenlijke kwaliteitsmaat voor optische + RF-PNT (P5): combineert het tweerichtings-optische linkbudget van { "1550" } nm (door fotonen beperkte CRLB voor tweerichtingsafstandsmeting σ_τ/√N en diffractievoetafdruk λ/D·afstand), een RAIM-beschermingsniveau met oplossingsscheiding over modaliteiten heen (positie EN tijd) dat de losse RF- en strakke optische oplossingen met uiteenlopende covarianties samenvoegt, de optische heldere-luchtbeschikbaarheid van N stations (onafhankelijke unie { "1" }−Π({ "1" }−a_i) en een ruimtelijk gecorreleerde variant), een toestands-/covariantieoverdracht optisch↔RF met een BEWEZEN bitcontinu (sprongloos) gemiddelde en een NEES-χ²-consistentiepoort, en een gezamenlijke score P(beschikbaar EN precisieklasse EN integriteit gewaarborgd) met correlatieafhandeling. VALIDATED gesloten vorm: de CRLB voor afstandsmeting, de diffractievoetafdruk, de χ²-kwantiel van het beschermingsniveau, de combinatoriek van de unie, de continuïteit van het gemiddelde bij de overdracht + NEES-poort, en het gezamenlijke onafhankelijke product. MODELLED: de optische verliestoewijzingen, de grootte van de RF-/optische σ, de invoer van de wolkenklimatologie, de correlaties en het P_HMI-budget. Geen gecertificeerd beschikbaarheids-/integriteitsproduct.

seg-5cea5229815e = De grafiek die de engine schrijft voor scenarios/hybrid-optical-rf.toml, soort hybrid-optical-rf

seg-a878d9be65b7 = MODELLED optische PNT door de atmosfeer: voor een optische verbinding en een reeks grondstations met vermelde wolkenklimaten rapporteert zij het golflengte- en elevatieafhankelijke verlies in heldere lucht (zichtbaarheidswet van Kim plus Rayleigh), de Hufnagel-Valley-turbulentietoestand (Rytov-variantie, scintillatie-index, gamma-gamma-parameters, aperture-middeling), de door het weer bepaalde beschikbaarheid ten opzichte van de verbindingsmarge (optische wolkendiepte uit een lognormaal klimaat van vloeibaar water, extinctie volgens de geometrische optica, onafhankelijke turbulentiefading), de verbindingsmarge die nodig is voor doelbeschikbaarheden, de verdeling van de uitvalduur, de groei van de tijdsynchronisatie- en afstandsmetingsfout per uitval via het klok-holdovermodel, afstandsgecorreleerde beschikbaarheid met locatiediversiteit, en wat-als-winsten voor verbeteringstechnieken (golflengte, ontvangstapertuur, scintillatiereductie met adaptieve optiek, extra marge). VALIDATED als implementatie van de vermelde formules aan de hand van een onafhankelijk mpmath-orakel: Rytov-variantie, scintillatie-index, gamma-gamma-fadekans, aperture-middelingsfactor, optische diepte van wolken en heldere lucht. MODELLED: elke weer-, techniek- en klokinvoer en de aannamen van onafhankelijkheid en copula; er is geen gemeten beschikbaarheidsregistratie vergeleken. Adviserende analyse, geen gecertificeerd beschikbaarheids- of navigatieproduct.

seg-4e2b759aff17 = De grafiek die de engine schrijft voor scenarios/optical-atmosphere-network.toml, soort optical-atmosphere

seg-4e31c8daf798 = Register

seg-963749981a7c = Bron: <c1/>

seg-079c8b284c44 = Optische PNT (familie van scenariosoorten)

seg-6dea687b727b = { "2" } scenariosoorten van de engine v{ $version }. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen veiligheidsdienst voor mensenlevens. Elk label hier is dat van de engine of van de verificatiematrix; een soort is MODELLED tenzij de matrix anders aangeeft (hoe een label wordt verdiend: het onderdeel Bewijs van de README).

seg-d019c8511f48 = Themapagina's: <a1>OPTICAL-ATMOSPHERE</a1>. Voer er een uit: <c1/>. Alle families: <a2>KINDS.md</a2>.

seg-b8f937411028 = Contactblad met de grafieken die de engine schrijft voor de soorten van de familie Optische PNT

seg-76131e6805e5 = MODELLED optische PNT door de atmosfeer: voor een optische verbinding en een reeks grondlocaties met opgegeven wolkenklimaten rapporteert het de van golflengte en elevatie afhankelijke verzwakking bij heldere lucht (Kim-zicht

seg-55725043f48e = MODELLED heterogene gezamenlijke kwaliteitsmaat voor optische + RF-PNT (P5): voegt het tweewegs optische linkbudget van { "1550" } nm samen (door fotonen beperkte CRLB σ_τ/√N voor tweewegsafstandsmeting en diffractievoetafdruk λ/D·afstand), een

seg-5e658f01d9f4 = HETEROGENEOUS (resultaatlabel)

seg-750466e3188c = Verplichte velden: geen. Optioneel: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

seg-9e3ce423c0b9 = <b>Register:</b> MODELLED. Volledige pagina, met de invoer, resultaten, bewijs en beperkingen: <a1>optical-atmosphere</a1>.

seg-93f5d0527850 = Verplichte velden: geen. Optioneel: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>, <c36/>, <c37/>, <c38/>, <c39/>, <c40/>, <c41/>, <c42/>, <c43/>.

seg-6a6f8eea5767 = <b>Register:</b> geen matrixrij noemt deze soort; de engine labelt zijn eigen resultaat. Volledige pagina, met de invoer, resultaten, bewijs en beperkingen: <a1>hybrid-optical-rf</a1>.

seg-a4baaf1fbb8c = <s1>Vorige</s1>Missieanalyse, verbindingen en ruimteoperaties

seg-48792381ba0b = <s1>Volgende</s1>Navigatie voor ruimtegebruikers
