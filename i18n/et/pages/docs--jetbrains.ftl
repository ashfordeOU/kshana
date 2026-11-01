# docs--jetbrains: translations (et)

# text
# c1: ide/jetbrains/README.md
seg-f8a0fe9968c4 = Allikas: <c1/>

# text
seg-c55e49fd2a72 = Kshana JetBrainsi IDE-dele

# text
seg-d7280bb554bf = <a1><b>Kshana — PNT simulator</b> JetBrains Marketplace'is</a1> — või mis tahes JetBrainsi IDE-s <em>Settings → Plugins → Marketplace → search "Kshana"</em>.

# text
# c1: .toml
seg-959ab829762c = Natiivne plugin, mis käivitab <b>Kshana</b> PNT-vastupidavuse simulaatori mis tahes JetBrainsi IDE-s (IntelliJ IDEA, CLion, RustRover, PyCharm, …). Paremklõps stsenaariumil <c1/> → <b>Run Kshana Scenario</b>; kvaliteedinäitajad ja tulemuse JSON voogavad tööriistaaknasse <b>Kshana</b>.

# text
seg-594199d2ce06 = Täiendab <a1>MCP serverit</a1> (mis annab JetBrainsi <em>AI Assistant</em>-ile juurdepääsu Kshanale): see plugin on <em>inimese</em> osutamise ja klõpsamise tee.

# text
# c1: .toml
# c2: kshana <file>
seg-a356f2c30afb = Toiming <b>Run Kshana Scenario</b> mis tahes <c1/> peal (redaktori ja projektivaate kontekstimenüüd) — käivitab <c2/> ja näitab väljundit Kshana tööriistaaknas.

# text
# c1: receiver-trust
# c2: .toml
# c3: kshana receiver-trust
seg-116d04ae5538 = <b>Assess Receiver Trust</b> stsenaariumil <c1/> <c2/> (<c3/>): usalduse ajatelg, laeva jaoks 0-100 skoori ja põhjustega. Nõuandev tarkvara, mitte tüübikinnitust omav navigatsiooniseade (IEC { "61108" }, IEC { "61162" }): laeva navigeerimise eest vastutab jätkuvalt operaator.

# text
# c1: nmea-scenario
# c2: .toml
# c3: kshana nmea-scenario
seg-726d88d0dea7 = <b>Generate Training NMEA</b> stsenaariumil <c1/> <c2/> (<c3/>): sünteetiline sillal kasutatav NMEA ja instruktori logi, kirjutatud stsenaariumi kõrvale. Ainult tekst; treenimiseks, mitte kunagi laeva reaalajas navigatsioonisüsteemide jaoks.

# text
# c1: .csv
seg-99510426a384 = <b>Build Interference Map</b> ADS-B või AIS <c1/> peal (projektivaade; küsib, milline heaks kiidetud andmekogum see on) ja <b>Route Exposure</b> marsruudifailil (küsib kaartide kausta). Halvenenud lahter ei tuvasta häiret põhjusena; mitte prognoos.

# text
# c1: .toml
# c2: kshana bench-export
seg-8c50e6aeb5e2 = <b>Export Test-Bench Files</b> stsenaariumil <c1/> (<c2/>): sõiduki liikumine, NMEA ja märgendatud sündmused laboratoorse GNSS-simulaatori jaoks, kirjutatud stsenaariumi kõrvale. See ei kirjuta signaali; simulaatorit tohib käitada ainult seal, kus see on lubatud.

# text
# c1: .json
# c2: kshana compliance-report
# c3: kshana compliance-report --mapping
seg-79c553c303c5 = <b>Build Compliance Report</b> käivitustulemusel <c1/> (<c2/>) ja <b>Tools → Show Compliance Mapping</b> (<c3/>): avaliku raamistiku vastendus, näidatud mootori enda väitega sõna-sõnalt.

# text
# c1: kshana evidence verify
# c2: .pub
seg-9b6ce5bbb523 = <b>Verify Evidence Pack</b> tõendipaketi kaustal (projektivaade; <c1/>): küsib allkirjastaja avalikku võtit ({ "64" } kuueteistkümnendnumbrit või fail <c2/>; alati kinnitatud, plugin ei aktsepteeri kunagi kinnitamata allkirjastajat) ja valikuliselt täielikku seansilogi. Ainult kontrollitud tulemus loetakse kontrollituks; terve pakett kinnitamata allkirjastajaga loetakse „NOT VERIFIED“.

# text
# c1: receiver-trust
# c2: .json
# c3: kshana trust-telemetry --result
seg-253d5b7f94ce = <b>Render Trust Telemetry</b> tulemusel <c1/> <c2/> (<c3/>): Prometheuse tekst, CEF/LEEF süsteemilogi sündmused või Home Assistant MQTT read, mis trükitakse Kshana aknasse. Midagi ei saadeta ega serveerita; töötavad eksportijad jäävad käsureale.

# text
# c1: .csv
# c2: kshana imu-fit
# c3: hybrid
# c4: fusion
# c5: [accel_classical]
seg-ce12ebcdccb5 = <b>Fit Sensor Parameters from IMU Log</b> paigalseisva IMU <c1/> peal (<c2/>): stsenaariumide <c3/> ja <c4/> kiirendusmõõturi ja güroskoobi parameetrid sobitatuna Alani hälbega, trükitud Kshana aknasse tabelina <c5/>. Midagi ei kirjutata; sobitus on MODELLED.

# text
# c1: kshana --validate
# c2: kshana kinds
# c3: .toml
# c4: kshana receiver-trust live --file
seg-b81f27c51c22 = <b>Validate Scenario</b> (<c1/>), <b>List Scenario Kinds</b> (menüü Tools; <c2/>) ja <b>Assess Receiver Stream</b> (laevaseanss <c3/> pluss valitud salvestatud NMEA logi; <c4/>, hinnatakse üks kord, ilma sokli ja väravata).

# text
# c1: kshana example
# c2: .toml
# c3: .toml
# c4: .geojson
seg-38037d36639c = <b>Insert Example Scenario</b> (projektivaate kaust või menüü Tools; <c1/>): valida kaasasolev stsenaarium ja see kirjutatakse uue failina <c2/> (mitte kunagi olemasoleva peale). <b>Export Scenario</b> failil <c3/> (SP3, OMM, OEM, CZML, KML, GeoJSON, STK, SigMF; ainult simuleeritud väljund), <b>Animate Scenario</b> (HTML või SVG, avatakse brauseris) ja <b>Import Route</b> marsruudil <c4/> (küsib, milline stsenaarium).

# text
# c1: .toml
# c2: kshana receiver-trust evidence
# c3: kshana evidence keygen
# c4: kshana evidence attach-timestamp
# c5: openssl ts -verify
seg-1f1b18f8e102 = <b>Create Evidence Pack</b> vastuvõtja usalduse seansil <c1/> (<c2/>): küsib akent, olemasolevat allkirjastamisvõtme faili ja väljundkausta. Plugin ei loo, loe ega salvesta kunagi võtit (<c3/> jääb käsureale). <b>Attach Timestamp</b> paketi kaustal (<c4/>): Kshana ei kontrolli ajatempli autoriteedi allkirja; <c5/> tuleb ise käivitada.

# text
# c1: evidence keygen
# c2: receiver-trust live
seg-f4f6605d3db9 = Endiselt ainult käsureal: IQ käsud, <c1/> ja <c2/>.

# text
seg-63efd04104f1 = Alumine tööriistaaken <b>Kshana</b>, mis majutab käivituskonsooli.

# text
# c1: kshana receiver-trust live
# c2: kshana trust-telemetry
# c3: docs/MARITIME-TRUST.md
seg-decda07aa7eb = Pluginas ei ole: <c1/> (pikaajaline vooguprotsess värava ja valikulise TCP-kuulajaga) ja <c2/> jäävad käsureale, sest IDE toiming käivitab käsu lõpuni ja näitab selle väljundit; vt <c3/>.

# text
# c1: kshana
# c2: PATH
# c3: cargo install kshana
seg-9c185454d0c0 = <b>Settings → Tools → Kshana</b> binaarfaili <c1/> määramiseks (tühi → lahendatakse asukohast <c2/>; paigaldamine käsuga <c3/>).

# text
seg-44dfdd65bd0a = Plugin on puhas platvormiplugin (keelespetsiifilisi sõltuvusi ei ole), nii et see laadib igas JetBrainsi IDE-s ehituse { "243" } ({ "2024.3" }) ja uuemates.

# text
seg-453bd42c23fa = Ehitamine ja käivitamine

# text
seg-b5328f8c7a8a = Nõuab JDK-d { "17" }+ (ehitus kinnitab JDK { "21" }) ja kaasasolevat Gradle'i ümbrist.

# text
# c1: verifyPlugin
# c2: TYPE:VERSION
seg-758124ceb1c7 = <c1/> kontrollib vaikimisi since-build'i, { "2024.3" }. Muude liinide kontrollimiseks tuleb need loetleda kujul <c2/> (iga IDE on umbes { "1" } GB allalaadimine):

# text
# c1: KshanaChooser
# c2: Messages.showChooseDialog
seg-15d175aaeb59 = Plugin ei kasuta ühelgi neist aegunud ega eemaldamiseks ajastatud platvormi API-t; nii peabki jääma (valikudialoog käib läbi <c1/>, mitte <c2/>).

# text
seg-39cfd740d9b3 = Ehitatud zip paigaldatakse läbi <b>Settings → Plugins → ⚙ → Install Plugin from Disk…</b>.

# text
seg-87aff08f344c = Paigutus

# text
seg-73b3f55b7208 = Isolatsioon

# text
# c1: mcp/
# c2: xval/
# c3: kshana
# c4: /ide
# c5: exclude
seg-a14db8de576a = Nagu <c1/> ja <c2/>, on see eraldiseisev Gradle'i projekt, mis on välja jäetud avaldatud paketist <c3/> (<c4/> paketi väljal <c5/>); selle ehitusväljund on gitignore'is.

# text
# c1: LICENSING.md
seg-b38914a430b9 = Litsents: AGPL-3.0-only (või Ashforde OÜ kommertslitsents — vt hoidla <c1/>).

# text
seg-bb286e3ce9c9 = <s1>Eelmine</s1>Kus iga võimekus kättesaadav on

# text
seg-e62586b5f58c = <s1>Järgmine</s1>Kus Kshana töötab
