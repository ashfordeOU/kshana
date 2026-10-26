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
