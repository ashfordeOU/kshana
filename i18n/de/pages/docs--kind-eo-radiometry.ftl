# docs--kind-eo-radiometry: translations (de)

# text
seg-99ef7c1d552c = Szenarioart der Engine v{ $version }, Familie <a1>Missionsanalyse, Links und Raumfahrtbetrieb</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
# c1: kshana kinds --json
seg-cd04f5662884 = MODELLED. (Artenkatalog (<c1/>))

# text
seg-8f1e7d3f5a07 = Familienseite: <a1>Missionsanalyse, Links und Raumfahrtbetrieb</a1>

# text
seg-8e62cc4af6ea = Themenseite: <a1>ENTRY-EO-ASCENT.md</a1>

# text
# c1: docs/kinds/by-kind/eo-radiometry.md
seg-841259b04897 = Quelle: <c1/>

# text
# c1: eo-radiometry
seg-1b0ba13fcef1 = <c1/> (Szenarioart)

# text
seg-816bd5a5808a = Radiometrie und Bildqualität eines Nadir-Imagers: Strahldichte einer Lambert-Szene an der Apertur, die Kameragleichung, Signal und Schrot-/Dunkel-/Auslese-/Quantisierungsrauschen und SNR; die System-MTF bei Nyquist (Beugung x Detektor x Verschmierung x Jitter), die daraus folgende relative Kantenantwort, Q = lambda F/p und die NIIRS nach GIQE Version { "4" } ohne MTF-Kompensation. MODELLED.

# text
# c1: scenarios/eo-radiometry.toml
seg-7d786a7bfb86 = Ein Lauf von <c1/> fasst sich so zusammen: eo-radiometry: GSD { "0.76" } m, Q { "1.06" }, SNR { "39" } (well { "6" } %), MTF@Nyquist { "0.212" }, RER { "0.573" }, GIQE4 NIIRS { "4.27" } (MODELLED)

# text
# c1: altitude_m
# c2: focal_length_m
# c3: aperture_m
# c4: pixel_pitch_um
# c5: wavelength_um
# c6: bandwidth_um
# c7: fill_factor
# c8: smear_px
# c9: jitter_px_rms
# c10: reflectance
# c11: solar_irradiance_w_m2_um
# c12: sun_zenith_deg
# c13: atmospheric_transmittance
# c14: path_radiance_w_m2_sr_um
# c15: optics_transmittance
# c16: integration_s
# c17: quantum_efficiency
# c18: dark_current_e_s
# c19: read_noise_e
# c20: full_well_e
# c21: adc_bits
seg-3378b7b0716f = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>

# text
# c1: scenarios/eo-radiometry.toml
seg-d613181f3fe3 = Das Beispiel <c1/> setzt unter anderem:

# text
seg-ffb002276b21 = um

# text
seg-1c15591babed = px

# text
seg-e94f9ad9e6c4 = Ergebnisbezeichnung (die der Engine): MODELLED — Radiometrie eines Nadir-Imagers (Lambert-Szene, Kameragleichung, Schrot-/Dunkel-/Auslese-/Quantisierungsrauschen), System-MTF bei Nyquist (Beugung x Detektor x Verschmierung x Jitter), relative Kantenantwort, Q = lambda F/p und NIIRS nach GIQE { "4" } ohne MTF-Kompensation; die NIIRS ist eine empirische Regression auf modellierten

# attr:alt
seg-bf7b52f7a01e = Das Diagramm, das die Engine für scenarios/eo-radiometry.toml schreibt, Art eo-radiometry

# text
seg-562a7cf2859c = <b>MODELLED</b> Signal-Rausch-Budget eines Nadir-Imagers (Strahldichte einer Lambert-Szene, Kameragleichung, Schrot-, Dunkel-, Auslese- und Quantisierungsrauschen), die System-MTF bei Nyquist als Produkt aus Beugung an der unverdeckten Apertur, Detektorapertur, linearer Verschmierung und Gaus

# text
seg-dadea618d757 = <b>MODELLED</b> Signal-Rausch-Budget eines Nadir-Imagers (Strahldichte einer Lambert-Szene, Kameragleichung, Schrot-, Dunkel-, Auslese- und Quantisierungsrauschen), die System-MTF bei Nyquist als Produkt aus. Unabhängige Referenz (InternalConsistency): Geschlossene Formen: die Beugungs-MTF bei halber Grenzfrequenz, die Ein-Pixel-Rampenkante einer reinen Detektorapertur (RER { "1" }), die Normalverteilungs-Kante einer Gauß-Unschärfe (RER = erf(0.5/(sigma sqrt { "2" }))), die Skalierung des Schrotrauschens und die GIQE-{ "4" }-Koeffizienten wie veröffentlicht (Leachtenauer et al., Applied Optics { "36" }({ "32" }), { "1997" }). WAS NICHT: Es wurde kein externer Imager, keine gemessene MTF und kein bewertetes Bild verglichen; die GIQE ist eine empirische Regression mit ihrem

# text
# c1: label
seg-5182b4b0f8d6 = MODELLED — Radiometrie eines Nadir-Imagers (Lambert-Szene, Kameragleichung, Schrot-/Dunkel-/Auslese-/Quantisierungsrauschen), System-MTF bei Nyquist (Beugung x Detektor x Verschmierung x Jitter), relative Kantenantwort, Q = lambda F/p und NIIRS nach GIQE { "4" } ohne MTF-Kompensation; die NIIRS ist eine empirische Regression auf modellierten Eingaben, kein bewertetes Bild (Ergebnis <c1/>)

# text
seg-b2f1e6466c2c = Radiometrie und Bildqualität eines Nadir-Imagers für eine ILLUSTRATIVE kleine Erdbeobachtungskamera (kein Entwurf eines Betreibers): { "0.40" } m Apertur, { "3.6" } m Brennweite (F/9), { "5.5" } um Pixel, aus { "500" } km. Der Lauf liefert das Signal-Rausch-Budget einer Szene mit { "15" } % Reflexionsgrad, die System-MTF bei Nyquist, die relative Kantenantwort und die NIIRS nach GIQE Version { "4" }. MODELLED: Die NIIRS ist eine empirische Regression, ausgewertet auf modellierten Eingaben, n (Kommentar der Szenariodatei, Zeilen { "1" } bis { "5" })

# text
seg-aaf9ed3b0899 = Radiometrie, MTF, relative Kantenantwort und NIIRS nach GIQE { "4" } elektrooptischer Imager sind MODELLED, nicht validiert: gegen die eigene geschlossene bzw. analytische Identität geprüft — fängt Transkriptions- und Koeffizientenfehler ab, ist aber keine unabhängige Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-d6c92dc655ab = <s1>Zurück</s1>eo-coverage

# text
seg-a0daef9a496e = <s1>Weiter</s1>ephemeris
