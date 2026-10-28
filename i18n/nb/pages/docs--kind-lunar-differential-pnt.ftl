# docs--kind-lunar-differential-pnt: translations (nb)

seg-9feefecdcf67 = rafs

seg-f42465f7d066 = ns

seg-37d29d8303fe = km

seg-1f17ef6a853e = Scenariotype i motoren v{ $version }, familie <a1>Måne og cislunart rom</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en sikkerhetskritisk tjeneste for menneskeliv. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett fortjenes: Evidens-avsnittet i README).

seg-1c1eeb2dcaa0 = Familieside: <a1>Måne og cislunart rom</a1>

seg-619127334cf3 = Ingen matriserad nevner denne typen ved navn; etiketten på resultatet er motorens egen, ovenfor.

seg-549a6103e711 = bit

seg-d0c9bec248b4 = Kilde: <c1/>

seg-d226df2bb634 = <c1/> (scenariotype)

seg-8ac5ac006ae7 = Modellert differensiell PNT på månen (en månens analog til DGNSS/SBAS): en referansestasjon av NovaMoon-klassen på et KJENT selenografisk sted beregner differensialkorreksjoner per satellitt fra en ILLUSTRATIVE konstellasjon av Moonlight/LCNS-klassen med offentlige kilder (NovaMoon nevnes bare som en system-KLASSE, ikke tilknyttet ESA), og en bruker forskjøvet med baseline_km bruker dem slik at de FELLES banefeilene og klokkefeilene opphever hverandre. Klokkeleddet oppheves EKSAKT (en algebraisk identitet); banedelen etterlater bare projeksjonen av siktlinjeforskjellen, som → { "0" } når grunnlinjen → { "0" } (gulvet for romlig dekorrelasjon) og vokser ≈ lineært med grunnlinjen. Rapporterer brukerens 3D-posisjonsfeil MED og UTEN korreksjoner, reduksjonsfaktoren, kurven for feil mot grunnlinje og et beskyttelsesnivå for brukeren som GJENBRUKER DO-229E SBAS-maskineriet (crate::sbas) med den differensielle restverdien σ. MODELLED — eksakt opphevingsidentitet + førsteordens dekorrelasjonsmodell; ikke validert mot virkelige data; ingen TRL/heritage/støtte fra noe byrå. Deterministisk hvis seedet.

seg-4b7355b174a3 = Én kjøring av <c1/> oppsummeres slik: lunar-differential-pnt | { "8" } satellitter (illustrativ, LCNS-klasse, ikke tilknyttet) | grunnlinje { "50" } km | brukerfeil { "24.46" } m → { "0.0077" } m ({ "3186" }× reduksjon) | HPL { "23.1" } m (σ_resid { "5.0" } m) | MODELLED

seg-1115464be513 = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>

seg-3f32e0fea066 = Eksempelet <c1/> setter blant annet:

seg-8e67df89448a = Diagrammet motoren skriver for scenarios/lunar-differential-pnt.toml, type lunar-differential-pnt

seg-6f4246bd8f6f = <b>MODELLED</b> Differensiell referansestasjon av NovaMoon-klassen: opphevelse av felles feil + rest som vokser med grunnlinjen + DGNSS-beskyttelsesnivåer. Uavhengig referanse (InternalConsistency): Identitet for differensiell feilopphevelse + gjenbruk av DO-229E SBAS PL-maskineriet; enkeltdifferansen + WLS-løsningen er i tillegg kryssjekket mot RTKLIBs lsq()/matinv() (Takasu, BSD-2-Clause, kompilert C): uavhengig løserkode, men den samme førsteordens LOS-differansealgebraen, så den er fortsatt InternalConsistency

seg-8d02b1426187 = <b>MODELLED</b> De tre leddene en differensialkorreksjon får mellom epoken den beregnes ved og epoken den brukes ved, hver tidligere latt stå som umodellert rom:. Uavhengig referanse (InternalConsistency): Lukkede identiteter og selvkonsistens: variansen step²/12 til den uniforme kvantisereren, den eksakte kovarianspropagasjonen (GᵀG)⁻¹GᵀRG(GᵀG)⁻¹ som kollapser til σ·PDOP for lik σ, overføringen { "1" }:{ "1" } for oppmålingsleddet som en følge av û_user ≈ û_ref, og kvadraturlukking ved frakobling. PDOP-kryssjekken mot orbit::dop deler normalmatrisen [−û, { "1" }], så den er en konsistenskontroll og er merket som det i stedet for en

seg-f1e7283d2e15 = MODELLED — eksakt opphevingsidentitet + førsteordens dekorrelasjonsmodell; ikke validert mot virkelige data; ingen TRL/heritage/støtte fra noe byrå. (typekatalog (<c1/>))

seg-9d54d8c07ca3 = ÆRLIGHET: MODELLED. Opphevelsen av felles feil er en EKSAKT algebraisk identitet; resten fra romlig dekorrelasjon er en FØRSTEORDENS geometrisk modell (projeksjonen av siktlinjeforskjellen for en injisert banefeil), ikke en tilpasset dekorrelasjonsmodell fra virkelig månesporing. Beskyttelsesnivået for brukeren GJENBRUKER DO-229E SBAS-maskineriet for beskyttelsesnivå (crate::sbas) med den differensielle restsigmaen som feil per satellitt (kommentar i scenariofilen, linje { "23" } til { "28" })

seg-4156a7515574 = ── KORREKSJONSLINKEN ────────────────────────────────────────────────────────────── Identiteten ovenfor forutsetter en PERFEKT korreksjon: beregnet av en stasjon som vet nøyaktig hvor den står, levert øyeblikkelig, med uendelig oppløsning. Ingen av de tre stemmer, og de tre inngangsverdiene under modellerer hva hver av dem koster. De mates BARE inn i blokken <c1/> i resultatdokumentet -- med alle tre på verdiene skrevet h (kommentar i scenariofilen, linje { "57" } til { "62" })

seg-e7f016777e09 = OPPMÅLINGSFEIL. Stasjonen danner korreksjonen mot koordinaten den TROR på. En feil der følger med hver korreksjon den sender ut og når brukeren som -delta . u_ref -- som ikke inneholder noen brukergeometri i det hele tatt, så i motsetning til banedelen forsvinner den verken ved null grunnlinje eller vokser med grunnlinjen, og den overføres omtrent én til én til brukerens posisjon. Standardverdien { "0.30" } m er cratens egen månereferanse (kommentar i scenariofilen, linje { "64" } til { "70" })

seg-e0648d9b52b4 = KORREKSJONSALDRING. En korreksjon beregnet ved t og brukt ved t+tau er foreldet på to måter. Bane: satellitten har BEVEGET seg, så den frosne banefeilvektoren projiseres nå på en rotert siktlinje; rotasjonen kommer fra denne cratens egen propagator, så ingen banefeilrate antas noe sted. Klokke: satellittklokken har drevet med c*sigma_y(tau)*tau for potenslovet for full RAFS i crate::clock_specs, kalibrert (kommentar i scenariofilen, linje { "73" } til { "79" })

seg-7171b2e3f29d = Differensiell PNT på månen er MODELLED, ikke validert: kontrollert mot sin egen lukkede/analytiske identitet; fanger opp avskrivings- og koeffisientfeil, men er ikke en uavhengig ekstern referanse. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-35f1876d023e = Differensiell PNT på månen, restbudsjett for korreksjonslinken, er MODELLED, ikke validert: kontrollert mot sin egen lukkede/analytiske identitet; fanger opp avskrivings- og koeffisientfeil, men er ikke en uavhengig ekstern referanse. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-8f8871ac8a0f = Temaside: <a1>LUNAR-REFERENCE-STATION.md</a1>

seg-2b8455001710 = <s1>Forrige</s1>lunar-beacon

seg-dca7482d9d75 = <s1>Neste</s1>lunar-frame-campaign

seg-e66e2ca31e54 = Temaside: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-f9d918743ec6 = <s1>Forrige</s1>lunar-descent
