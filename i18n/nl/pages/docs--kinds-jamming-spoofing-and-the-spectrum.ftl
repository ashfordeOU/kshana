# docs--kinds-jamming-spoofing-and-the-spectrum: translations (nl)

seg-b03d56f501c3 = Type

seg-98e740d32860 = Testomgeving voor de evaluatie van detectie van RF-verstoringen met machine learning ({ "13494" }): genereer een gelabeld, op parameters gegrond SYNTHETISCH corpus (nominal/jamming/spoof-time/spoof-position/multipath), scoor een detector (energy|agc|sqm|parity|fused) met het detectoronafhankelijke harnas, en rapporteer AUC/ROC/confusion + Pd per klasse bij een doel-Pfa, plus de optimismekloof tussen in- en uit-de-verdeling. Alleen MODELLED werkkarakteristieken: nooit veld-/IQ-data, geen goed/slecht-oordeel.

seg-7e7b07bc5545 = De grafiek die de engine schrijft voor scenarios/impairment-eval.toml, soort impairment-eval

seg-60bf3f0ff000 = Jamming via linkbudget: J/S → effectieve C/N₀ → verlies van lock.

seg-42d46b928d09 = De grafiek die de engine schrijft voor scenarios/jamming-demo.toml, soort jamming

seg-fef00c827c6a = Model en waterval van het L-bandspectrum: de hele GNSS-L-band als één vermogensspectrale dichtheid (PSD), frequentie dwars, tijd omlaag, over een scripted jammertijdlijn. SIGNALEN: GPS L1 C/A en L2C (BPSK({ "1" })), Galileo E1 open service (MBOC(6,1,1/11), of BOC({ "1,1" })), GPS L5 en Galileo E5a (BPSK({ "10" })), elk op zijn draaggolf met het minimale ontvangen vermogen uit de interfacespecificatie (IS-GPS-200, IS-GPS-705, Galileo OS SIS ICD) tenzij overschreven; GLONASS, BeiDou en Galileo E6 worden niet gemodelleerd. JAMMERS: continue-golftoon, vlakke smalbandruis, lineaire zaagtandchirp en breedbandruis afgestemd op de eigen modulatie van een band, elk met een middenfrequentie, een bandbreedte, een ontvangen vermogen (direct, of EIRP en afstand via het vrije-ruimteverlies van de soort jamming) en aan-/uittijden. Elke jammer wordt per band beoordeeld aan de hand van zijn spectrale scheidingscoëfficiënt kappa over de bandbreedte van de ontvanger, en (C/N0)_eff = [1/(C/N0) + sum (J/S) kappa]^-1; voor één jammer is dit gelijk aan de anti-jamvergelijking van de soort jamming met Q = 1/(R_c kappa), en het rapport bevat die kruiscontrole (en het representatieve Q-cijfer van de soort jamming ernaast). De ruisvloer is k T_sys met T_sys = T_ant + { "290" } K (F - { "1" }). De waterval middelt elke cel over haar bin en haar rij (chirps exact, hele sweeps plus de gedeeltelijke; jammers die midden in een rij schakelen naar hun duty), zodat de C/N0-tijdlijn en het beeld uit dezelfde getallen komen; result.json bevat het in vermogen blokgemiddelde raster, C/N0 en J/S per rij per band, en per jammer per band de SSC, Q, J/S, J/S in de band en de stabiele C/N0. Optioneel [iq]: het model getekend als complexe IQ op één moment, weggeschreven naar en teruggelezen uit een SigMF-opname (cf32_le of ci16_le) en vergeleken met een Welch-schatting. Optioneel [recording] (native builds): de Welch-PSD van een echte SigMF-opname naast het model. VALIDATED: de PSD's van de signalen tegen de leerboekbreedtes van de hoofdlob (BPSK(n) 2n x { "1.023" } MHz nul tot nul; BOC({ "1,1" })-lobben gecentreerd op +/-1.023 MHz) en de spectrale scheidingscoëfficiënten tegen hun gesloten vormen volgens Parseval en Q = { "1" } (CW) en { "1.5" } (afgestemd) van Kaplan & Hegarty. MODELLED: jammervermogens, tijdlijn, front-endbandbreedtes, de behandeling met een continu spectrum (zonder codelijnen) en de afwezigheid van AGC, blanking en antennepatroon.

seg-ea1678eb9e84 = De grafiek die de engine schrijft voor scenarios/l-band-waterfall-jamming.toml, soort spectrum

seg-f43fe94d84e0 = Gecombineerde spoofdetector op RF-/meetniveau (RAIM-consistentie met meerdere SV's + AGC + SQM, gefuseerd) tegenover een geparametriseerde aanval (vermogensvoordeel, uitlijning van de draaggolffase, tijd-/positieverschuiving; in de stijl van TEXBAT).

seg-268ebf4cba99 = De grafiek die de engine schrijft voor scenarios/spoof-detect.toml, soort spoof-detect

seg-cbd77f6ffd63 = Stochastische detector voor tijdspoofing (Neyman–Pearson / χ²₁) met Monte-Carlo P_fa/P_md.

seg-6f6a8c975111 = De grafiek die de engine schrijft voor scenarios/spoof-attack.toml, soort spoof

seg-f6ff1c8c78db = Verlies van vergrendeling van de tracking-lus: C/N0 -> vergrendeld/ontgrendeld inclusief HYSTERESE, de tijd die het kost om de vergrendeling te verliezen, en spoof-pull-in als functie van de SNELHEID van de code- en draaggolfoffset. De bestaande ontkennings- en overnamecriteria van de engine zijn verhoudingen op ontvangen vermogen (een jammer ontkent bij J/S = { "30" } dB, een spoofer neemt over bij { "3" } dB); echt verlies van vergrendeling is geen vermogensverhouding, maar het punt waar de jitter van een lus plus dynamische belasting het tracking-drempelbudget overschrijdt. Rapporteert ({ "1" }) draaggolf- (Costas) en code-jitter (niet-coherent early/late) van 1 sigma thermisch versus C/N0, inclusief kwadrateringsverlies, tegen de opgegeven regels { "3" }<em>sigma_PLL + theta_e <= { "45" } deg (de 15-gradenregel in drie-sigmavorm) en { "3" }</em>sigma_DLL + ramp lag <= d/2 chips; ({ "2" }) de drempels voor C/N0 bij wegvallen en herstel van de vergrendeling met de bepalende lus benoemd, waarbij de herstelvergrendelingsdrempel AFGELEID is uit de bredere bandbreedte waarmee een ontvanger opnieuw intrekt in plaats van beweerd, zodat de hysteresebreedte tussen { "5" }<em>log10(ratio) en { "10" }</em>log10(ratio) dB moet liggen; ({ "3" }) de verklaarde tijd tot verlies van vergrendeling van een lock-detector met twee drempels en bevestigingsverblijftijden, aangestuurd over een C/N0-helling, afzonderlijk gerapporteerd van de fysieke faseontsnappingstijd (de gemiddelde Viterbi-tijd tussen cycle slips, in log10 s omdat die honderden decaden beslaat); ({ "4" }) spoof-pull-in-limieten — de grootste codeverschuiving en Doppler-snelheid van de draaggolf die de lussen van een slachtoffer kunnen volgen, met een kaart over beide assen, omdat een spoofer die sneller verschuift dan deze de lus niet overneemt maar achter zich laat; en ({ "5" }) de ONTKENNINGSSTRAAL die de luisdynamiek impliceert, gerapporteerd NAAST de bestaande vermogensverhoudingsstraal, nooit in plaats daarvan, met hun verschil met teken als eigen benoemd veld (denial_radius_delta_km) en een definitie ernaast. Elk uitgegeven numeriek veld heeft een eenheid en een herkomstklasse. VALIDATED gesloten vormen: de jitteruitdrukkingen voor draaggolf en code, de reductie van het lusfilter sqrt({ "2" }<em>B_n</em>T) en de eerste-orde ramp lag zijn gecontroleerd tegen de eigen sdr-correlator van de engine, voorwaarts gestapt op geseede synthetische IF — een andere route naar dezelfde getallen — tot respectievelijk { "0.6" } %, { "3.7" } % en { "0.17" } %, en de gewijzigde Bessel I0 achter de cycle-slip-tijd tegen standaard getabelleerde waarden tot { "1e-7" }. De ondergrens van de geldigheid wordt afgedwongen, niet alleen vermeld: onder ~{ "32" } dB-Hz bij { "1" } ms verzadigt de echte atan-discriminator tegen zijn bereik van +-pi/2 en meet hij minder jitter dan enige lineaire theorie. MODELLED: de lusbandbreedtes, integratietijd, correlatorafstand, pull-in-bandbreedteverhouding, bevestigingsverblijftijden, jammervermogen en antenneversterkingen zijn representatieve bandwaarden, geen datasheet. NIET gemodelleerd: oscillator- (Allan-deviatie) en trillingsjitter, bandbreedtebeperking van de front-end, multipath, AGC-dynamiek, verlies door databittransities, externe ondersteuning en elke halve-cyclus-correctie op de Costas-cycle-slip-formule. Onder luisdynamiek heeft spoof-overname helemaal geen straal — de bepalende beperking is de offsetsnelheid, niet het vermogen — dus dat veld is null met een reden in plaats van een verzonnen getal. Geen gecertificeerd product voor ontvangerprestaties.

seg-72182c1aecd9 = De grafiek die de engine schrijft voor scenarios/tracking-loop.toml, soort tracking-loop

seg-4e31c8daf798 = Register

seg-d1c67e3dd12e = MODELLED { "1" } · VALIDATED { "2" }

seg-63c3a7483268 = { "6" } scenariosoorten van de engine v{ $version }. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen veiligheidsdienst voor mensenlevens. Elk label hier is dat van de engine of van de verificatiematrix; een soort is MODELLED tenzij de matrix anders aangeeft (hoe een label wordt verdiend: het onderdeel Bewijs van de README).

seg-f6a18b7cb172 = Bron: <c1/>

seg-d4ae70a5d619 = Jamming, spoofing en het spectrum (familie van scenariosoorten)

seg-b4b8b72e060b = Themapagina's: <a1>SPECTRUM</a1>, <a2>DECEIVED-TIME</a2>, <a3>IQ-FOLLOW</a3>. Voer er een uit: <c1/>. Alle families: <a4>KINDS.md</a4>.

seg-cc031b964086 = Contactblad met de grafieken die de engine schrijft voor de soorten van de familie Jamming, spoofing en het spectrum

seg-bbbd87f888b9 = Verlies van vergrendeling van de tracking-lus: C/N0 -> vergrendeld/ontgrendeld inclusief HYSTERESE, de tijd die het kost om de vergrendeling te verliezen, en spoof-pull-in als functie van de SNELHEID van de code- en draaggolfoffset.

seg-e37f1e071b2c = L-bandspectrummodel en waterfall: de hele GNSS-L-band als één vermogensspectrale dichtheid (PSD), frequentie horizontaal, tijd naar beneden, over een gescripte jammertijdlijn.

seg-02706b96f8fa = MODELLED { "3" } · VALIDATED { "2" }

seg-8887d666b4fc = Testomgeving voor de evaluatie van machine-learningdetectie van RF-verstoringen ({ "13494" }): genereer een gelabeld, op parameters gebaseerd SYNTHETISCH corpus (nominaal/jamming/spoof-tijd/spoof-positie/multipath), scoor een detector (energy/agc/s

seg-f6dcb5b36454 = Verplichte velden: <c1/>, <c2/>, <c3/>, <c4/>. Optioneel: <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>.

seg-7bb2f42902f0 = <b>Register:</b> MODELLED. Volledige pagina, met de invoer, resultaten, bewijs en beperkingen: <a1>jamming</a1>.

seg-d5f06ff66e1b = Verplichte velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

seg-1bd760afbaca = <b>Register:</b> MODELLED. Volledige pagina, met de invoer, resultaten, bewijs en beperkingen: <a1>spoof</a1>.

seg-fb15ecc29f7c = Verplichte velden: <c1/>. Optioneel: <c2/>, <c3/>.

seg-15c08ee5ae76 = <b>Register:</b> MODELLED. Volledige pagina, met de invoer, resultaten, bewijs en beperkingen: <a1>spoof-detect</a1>.

seg-c65b9d45bdcc = Verplichte velden: geen. Optioneel: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>.

seg-bd1b04ccfe22 = <b>Register:</b> MODELLED. Volledige pagina, met de invoer, resultaten, bewijs en beperkingen: <a1>tracking-loop</a1>.

seg-5024b537d000 = Verplichte velden: geen. Optioneel: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>.

seg-a73f44c04565 = <b>Register:</b> MODELLED { "3" } · VALIDATED { "2" }. Volledige pagina, met de invoer, resultaten, bewijs en beperkingen: <a1>spectrum</a1>.

seg-cbcc6f5302b8 = Verplichte velden: geen. Optioneel: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

seg-d14fa8348a2a = <b>Register:</b> MODELLED { "1" } · VALIDATED { "2" }. Volledige pagina, met de invoer, resultaten, bewijs en beperkingen: <a1>impairment-eval</a1>.

seg-5242026d2998 = <s1>Vorige</s1>Traagheids-, fusie- en kwantumsensoren

seg-6b9b04e59491 = <s1>Volgende</s1>Navigatie met lage aardbaan
