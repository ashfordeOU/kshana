# docs--kind-space-weather: translations (de)

# text
# c1: docs/kinds/by-kind/space-weather.md
seg-95f8bd8e0078 = Quelle: <c1/>

# text
# c1: space-weather
seg-24c21b5b0cc3 = <c1/> (Szenariotyp)

# text
seg-5f25c5b71f0c = Weltraumwetter-Umgebungsmodell: solare (F10.7/F10.7a) und geomagnetische (Kp, mit der definitorischen Tabelle Kp↔ap) Aktivitätsindizes, die von ihnen getriebene exosphärische Temperatur nach Jacchia-1971 (validiert gegen veröffentlichte Werte für Sonnenminimum, -mittel und -maximum) und die thermosphärische Neutraldichte nach Jacchia-1971 bei der tagesgemittelten exosphärischen Temperatur gegenüber dem aktivitätsfreien statischen Profil in einer Reihe von Höhen — die Abhängigkeit der Dichte vom Sonnenzyklus, die die statische Atmosphäre auslässt. MODELLED: Die Dichte stimmt mit beschleunigungsmesserbasierten Dichten (TOLEOS CHAMP und GRACE) innerhalb eines Faktors { "2" } im Sonnenmaximum überein, ist aber im Sonnenminimum { "2008" } etwa 1.7x zu dicht.

# text
seg-37d29d8303fe = km

# text
seg-8e845ce908ee = Szenarioart der Engine v{ $version }, Familie <a1>GNSS-Messungen, Positionierung und Integrität</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
seg-f6b7ca020692 = Familienseite: <a1>GNSS-Messungen, Positionierung und Integrität</a1>

# text
# c1: scenarios/space-weather.toml
seg-f2c2860db799 = Ein Lauf von <c1/> fasst sich zusammen als: space-weather: F10.7={ "180" } F10.7a={ "165" } Kp={ "4.0" } (ap={ "27" }) -> T_inf={ "1047" } K; Dichte x1.49 bei { "300" } km (MODELLED)

# text
# c1: f107
# c2: f107a
# c3: kp
# c4: altitudes_km
seg-6bb05c41eba2 = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>

# text
# c1: scenarios/space-weather.toml
seg-c367f1aacd0b = Das Beispiel <c1/> setzt unter anderem:

# text
seg-02dc0d42fb21 = sfu

# text
seg-1dd966268e12 = { "2" } nT

# text
seg-d245f215f331 = Ergebnisbezeichnung (die der Engine): MODELLED — solare/geomagnetische Indizes, exosphärische Temperatur nach Jacchia-71 und statische Dichte nach Jacchia-71 bei der tagesmittleren Temperatur

# text
seg-15587da59e8e = <b>MODELLED</b> Solare/geomagnetische Indizes (definitorische Kp↔ap-Tabelle), die exosphärische Temperatur nach Jacchia-1971 und die thermosphärische Dichte nach Jacchia { "1971" } (SAO Special Report { "332" }: statische Diffusionsprofile, die dessen Tabelle { "7" } reproduzieren, mit den tageszeitlichen, geomagne

# text
seg-f8eef6eabfb2 = <b>MODELLED</b> Solare/geomagnetische Indizes (definitorische Kp↔ap-Tabelle), die exosphärische Temperatur nach Jacchia-1971 und die thermosphärische Dichte nach Jacchia { "1971" } (SAO Special Report { "33" }. Unabhängige Referenz (ExternalDataset): Definitorische Kp↔ap-Tabelle + geschlossene Form der exosphärischen Temperatur nach Jacchia-1971 (auf <{ "1" } K gegen die veröffentlichten Ankerwerte abgeglichen, tests/space_weather_reference.rs); die Dichte wird gegen pymsis NRLMSISE-00 (ein unabhängiges NRL-Modell) charakterisiert: der Sonnenzyklus-Hub bei { "800" } km beträgt 10.4x gegen 13.6x bei NRLMSISE-00. { "0.30" }-Revision: der kalibrierte Aktivitätsfaktor erster Ordnung wurde durch Jacchia { "1971" } ersetzt (Standardszenario-Dichte bei { "40" }

# text
# c1: label
seg-72979b637644 = MODELLED — solare/geomagnetische Indizes, exosphärische Temperatur nach Jacchia-71 und statische Dichte nach Jacchia-71 bei der tagesmittleren Temperatur (Ergebnis <c1/>)

# text
seg-b86a312077b5 = EHRLICHER GELTUNGSBEREICH: MODELLED. Die Kp<->ap-Umrechnung ist die definitorische IAGA-Tabelle, und die exosphärische Temperatur ist gegen veröffentlichte Größenordnungen für Sonnenminimum/-mittel/-maximum validiert, aber die Dichtekorrektur ist eine KALIBRIERTE Skalenhöhenkopplung ERSTER ORDNUNG — sie erfasst das richtige Vorzeichen, die Monotonie und die Größenordnung, NICHT die absolute Genauigkeit einer datenvalidierten (NRLMSISE-00) Atmosphäre. Lauf: kshana scenarios/space-weath (Kommentar der Szenariodatei, Zeilen { "10" } bis { "15" })

# text
seg-10cf16c12a2a = Weltraumwetter-Umgebung & aktivitätsgetriebene thermosphärische Dichte ist MODELLED, nicht validiert: Eine Teilaussage wird extern geprüft, aber die gesamte Fähigkeit setzt sich aus modellierten Teilen zusammen, sodass die Fähigkeit modelliert bleibt. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-3dd29f8fba14 = <s1>Zurück</s1>space-packet

# text
seg-ff9d9a41692b = <s1>Weiter</s1>spectrum

# text
# c1: kshana kinds --json
seg-0306ee022298 = MODELLED: Die Dichte stimmt mit beschleunigungsmesserabgeleiteten Dichten (TOLEOS CHAMP und GRACE) im Sonnenmaximum innerhalb eines Faktors { "2" } überein, ist aber im Sonnenminimum { "2008" } etwa 1.7x zu dicht. (Szenarioarten-Katalog (<c1/>))

# attr:alt
seg-c1c6f2f73fb5 = Das Diagramm, das die Engine für scenarios/space-weather.toml schreibt, Art space-weather
