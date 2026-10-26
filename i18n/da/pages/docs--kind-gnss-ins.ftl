# docs--kind-gnss-ins: translations (da)

seg-b054c73f22e5 = ingen værdi

seg-7b2721b7588d = Scenarietype i motoren v{ $version }, familie <a1>Inertial-, fusions- og kvantesensorer</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: afsnittet Evidens i README).

seg-195347c63a8a = m/s^{ "2" }

seg-451a304052c4 = <b>MODELLED</b> Koldatom-interferometer-accelerometer ud fra grundprincipper (k_eff·T², QPN). Uafhængig reference (ExternalDataset): Offentliggjorte numeriske vektorer fra CAI-primærartikler (Cheinet { "2008" }, overføringsfunktion; Peters/Freier, følsomhed): k_eff·T² stemte præcist, skudstøjens ASD et ensidet gulv inden for ca. { "2" }× af hvert offentliggjort instrument (rigtige enheder har teknisk støj over kvantegulvet). Et interval, ikke paritet. { "0.30" } runde { "2" } (præregistreret fcb9ac64), et fund (forbliver MODELLED): rotationsstøjen med kun QPN mod den målte Gauguet et al.

seg-9955b1b1c018 = Kvanteinertial sensorydelse er MODELLED, ikke valideret: en delpåstand kontrolleres eksternt, men hele funktionen sammensættes af modellerede dele, så funktionen forbliver modelleret. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-f7f12029e0ec = Familieside: <a1>Inertial-, fusions- og kvantesensorer</a1>

seg-fd8fad481c81 = Kilde: <c1/>

seg-e726a6d74d81 = <c1/> (scenarietype)

seg-38df285a3f25 = Løst og tæt koblet GNSS/INS-fejltilstands-EKF.

seg-e1e235215947 = Én kørsel af <c1/> opsummeres sådan: scenario c55a6246bd6f | gnss-ins | quantum outage-RMS fused 1.9m vs free 130.7m (hold 60s, avail { "1.00" }) | classical fused 3.1m vs free 314.3m (hold 60s, avail { "1.00" })

seg-e3112eac77af = Obligatoriske felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-6c128eb60a91 = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-79c75d3e461d = Eksemplet <c1/> angiver blandt andet:

seg-ca448daf5ec7 = nominal

seg-49f2fa051719 = denied

seg-327a2c4885bd = Inertienhed af MEMS/kvarts i taktisk klasse: større resterende bi

seg-d1beb62cf742 = { "6" } medfølgende scenarier bruger denne type; de øvrige findes i <a1><c1/></a1>.

seg-7d993b676006 = Diagrammet, som motoren skriver for scenarios/gnss-ins.toml, scenarietype gnss-ins

seg-ea4498cc0324 = <b>VALIDATED</b> 15-tilstands fejltilstands-EKF, løst koblet (valideret på en rigtig IMU/GNSS-kørsel mod NaveGo); et tæt koblet pseudoafstands-/Doppler-UKF og et koblet ur+pos. Uafhængig reference (ExternalDataset): NaveGo v1.4 (R. Gonzalez, LGPL-3.0, kørt som værktøj under GNU Octave, aldrig linket): dens løst koblede ins_gnss på dens egen rigtige Ekinox IMU/GNSS-kørsel med landkøretøj, begge løsninger bedømt mod Ekinox-referencetrajektorien. Begge filtre læser det samme float32-input med { "20" } Hz, og Kshanas konfiguration er afbildet mekanisk fra datasættets offentliggjorte parametre. Kshanas horisontale og vertikale positions-RMS og dens

seg-742a29ca1fb7 = Emneside: <a1>TEST-BENCH.md</a1>

seg-f3cc3d82aba8 = <s1>Forrige</s1>fusion

seg-af503aa1d900 = <s1>Næste</s1>gnss-sim
