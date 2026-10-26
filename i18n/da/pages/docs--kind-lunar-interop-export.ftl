# docs--kind-lunar-interop-export: translations (da)

seg-debc2f07db78 = true

seg-1f17ef6a853e = Scenarietype i motoren v{ $version }, familie <a1>Måne og cislunart rum</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: README'ens afsnit Evidence).

seg-1c1eeb2dcaa0 = Familieside: <a1>Måne og cislunart rum</a1>

seg-834408a40783 = min

seg-d36e6d7d8a10 = Kilde: <c1/>

seg-fdf560e675f4 = <c1/> (scenarietype)

seg-5a4dcb93a643 = Modelleret lunar interoperabilitetseksport: udsender det lunare referencesystem, den lunare tidsskala og den lunare efemeride i LunaNet/IOAG-tilpassede, CCSDS-baserede udvekslingsformer med rundturs- og feltformatkontrol. GENBRUGER cratens CCSDS OEM { "2.0" }-skriver og -læser (crate::oem), omkodet til den lunare kontekst — OEM-feltet REF_FRAME bærer IAU { "2015" } WGCCRE's lunare legemssystem (MOON_ME / MOON_PA), TIME_SYSTEM den lunare tidsskala (LTC / TCL / UTC), CENTER_NAME = MOON — over en illustrativ eksempelefemeride af LCNS-klassen (positioner fra crate::lunar_service, hastighed ved differenskvotient). Udsender også en LunaNet/IOAG-tilpasset beskrivelse af lunar tid (skalaens id, sekulær rate µs/dag fra crate::lunar_time, offentliggjort bånd, referenceoverflade), der kan gøre rundtur via serde_json, og pakker artefakterne ind i den eksisterende KIF-kuvert (crate::interchange) med mærkatet MODELLED. Rapporterer udsendte artefakter, antal OEM-linjer, feltformatkontrol bestået og liste over felter, der er til stede/mangler, OEM-rundtur ok, rundtur for tidsmetadata ok og KIF-størrelse i bytes. MODELLED — deterministisk rundtur + kontrol af feltnavne mod offentliggjort CCSDS OEM + LunaNet/IOAG-feltsemantik er den uafhængige reference; IKKE en certificeret overensstemmelsestest for interoperabilitet; illustrativ efemeride fra offentlige kilder, ikke tilknyttet ESA; ingen TRL-, heritage- eller myndighedsstøtte.

seg-1726861e444f = Én kørsel af <c1/> opsummeres som: lunar-interop-export | REF_FRAME MOON_ME / TIME_SYSTEM LTC | { "9" } states, OEM { "23" } lines | conformance PASS ({ "9" } present / { "0" } missing) | OEM round-trip ok | time-meta round-trip ok | KIF { "1640" } bytes | MODELLED

seg-f8353e15aabd = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-169f9446e90d = Eksemplet <c1/> sætter blandt andet:

seg-b8135da5a99a = 2030-01-01T00:{ "00" }:{ "00" }

seg-3f36bd2ec5ea = LTC

seg-2ac27c1e55c0 = oktet

seg-0e86ff364c17 = Diagrammet, som motoren skriver for scenarios/lunar-interop-export.toml, type lunar-interop-export

seg-98acb538942f = <b>MODELLED</b> LunaNet/IOAG-tilpasset eksport af lunart referencesystem + tid + efemeride (CCSDS OEM + KIF) med rundturskontrol. Uafhængig reference (InternalConsistency): kshanas lunare OEM-eksport indlæst igen af det uafhængige tredjepartsbibliotek <c1/> (R. J. Anderson): system- og tidstokens og tilstanden pr. epoke stemmer til skrivepræcisionen ({ "1" } mm / { "1e-9" } km/s), og en eksport uden TIME_SYSTEM afvises — en strukturel rundtur for udveksling; de fysiske betydninger af det lunare referencesystem og den lunare tid er valideret af deres egne rækker, så denne forbliver MODELLED. { "0.30" } ekstern sammenligning, et fund (forbliver MODELLED): en se

seg-c9a1d76625d6 = MODELLED (resultat <c1/>)

seg-633bcd62ce93 = Udsender også en LunaNet/IOAG-tilpasset beskrivelse af lunar tid (skalaens id, sekulær rate µs/dag fra crate::lunar_time, offentliggjort bånd, referenceoverflade), der kan gøre rundtur via serde_json, og pakker artefakterne ind i den eksisterende KIF-kuvert (crate::interchange) med mærkatet MODELLED. (kategori-katalog (<c1/>))

seg-0e91697e3036 = MODELLED — deterministisk rundtur + kontrol af feltnavne mod offentliggjort CCSDS OEM + LunaNet/IOAG-feltsemantik er den uafhængige reference; IKKE en certificeret overensstemmelsestest for interoperabilitet; illustrativ efemeride fra offentlige kilder, ikke tilknyttet ESA; ingen TRL-, heritage- eller myndighedsstøtte. (kategori-katalog (<c1/>))

seg-11d0ccba5ee7 = HVAD src/lunar_interop.rs gør: * export_lunar_oem — GENBRUGER cratens CCSDS OEM { "2.0" }-skriver (crate::oem), omkodet til den lunare kontekst: REF_FRAME = IAU { "2015" } WGCCRE's lunare legemssystem (MOON_ME / MOON_PA), TIME_SYSTEM = den lunare tidsskala (LTC / TCL / UTC), CENTER_NAME = MOON, over en ILLUSTRATIV eksempelefemeride af LCNS-klassen (positioner fra crate::lunar_service, hastighed ved central differenskvotient). * export_ (kommentar i scenariefilen, linje { "6" } til { "19" })

seg-f730e8f789cf = ÆRLIGHED: MODELLED. FeltNAVNENE og enhederne er tilpasset OFFENTLIGE standarder (CCSDS 502.0-B OEM, IAU WGCCRE { "2015" } lunare referencesystemer, LunaNet Interoperability Specification / IOAG's lunare arkitektur). Den deterministiske rundtur og kontrollen af feltnavne er den uafhængige reference. Dette er IKKE en certificeret overensstemmelsestest for interoperabilitet. Efemeriden er illustrativ, fra offentlige kilder, IKKE tilknyttet ESA og indebærer ingen TRL (kommentar i scenariefilen, linje { "21" } til { "26" })

seg-254d48fe58a5 = Lunar interoperabilitetseksport er MODELLED, ikke valideret: kontrolleret mod sin egen lukkede/analytiske identitet — fanger afskrivnings- og koefficientfejl, men er ikke en ekstern uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-07d6cc44724f = <s1>Forrige</s1>lunar-integrity

seg-9669cd9b1d04 = <s1>Næste</s1>lunar-jamming
