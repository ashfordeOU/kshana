# docs--kind-lunar-interop-export: translations (nb)

seg-debc2f07db78 = true

seg-1f17ef6a853e = Scenariotype i motoren v{ $version }, familie <a1>Måne og cislunart rom</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en sikkerhetskritisk tjeneste for menneskeliv. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett fortjenes: Evidens-avsnittet i README).

seg-1c1eeb2dcaa0 = Familieside: <a1>Måne og cislunart rom</a1>

seg-619127334cf3 = Ingen matriserad nevner denne typen ved navn; etiketten på resultatet er motorens egen, ovenfor.

seg-834408a40783 = min

seg-d36e6d7d8a10 = Kilde: <c1/>

seg-fdf560e675f4 = <c1/> (scenariotype)

seg-5a4dcb93a643 = Modellert eksport av interoperabilitet på månen: gir ut referansesystemet, tidsskalaen og efemeriden på månen i LunaNet/IOAG-tilpassede, CCSDS-baserte utvekslingsformer med rundtur- og feltoverensstemmelse. GJENBRUKER cratens CCSDS OEM { "2.0" }-skriver og -parser (crate::oem), merket på nytt for månekonteksten: OEM REF_FRAME bærer IAU { "2015" } WGCCRE-legemsreferansesystemet for Månen (MOON_ME / MOON_PA), TIME_SYSTEM månens tidsskala (LTC / TCL / UTC), CENTER_NAME = MOON, over en illustrativ eksempelefemeride av LCNS-klassen (posisjoner fra crate::lunar_service, hastighet ved finite differanse). Gir også ut en LunaNet/IOAG-tilpasset beskrivelse av månens tid (skala-id, sekulær rate µs/døgn fra crate::lunar_time, publisert bånd, referanseflate) som går i rundtur via serde_json, og pakker artefaktene inn i den eksisterende KIF-konvolutten (crate::interchange) med MODELLED-ærlighetsmerket. Rapporterer utgitte artefakter, antall OEM-linjer, feltoverensstemmelse bestått + liste over tilstedeværende/manglende felt, OEM-rundtur ok, rundtur for tidsmetadata ok og KIF-bytestørrelse. MODELLED — deterministisk rundtur + feltnavnoverensstemmelse mot publisert CCSDS OEM + LunaNet/IOAG-feltsemantikk er den uavhengige referansen; IKKE en sertifisert test av interoperabilitet eller overensstemmelse; illustrativ efemeride fra offentlige kilder, ikke tilknyttet ESA; ingen TRL/heritage/støtte fra noe byrå.

seg-1726861e444f = Én kjøring av <c1/> oppsummeres slik: lunar-interop-export | REF_FRAME MOON_ME / TIME_SYSTEM LTC | { "9" } tilstander, OEM { "23" } linjer | overensstemmelse PASS ({ "9" } til stede / { "0" } mangler) | OEM-rundtur ok | rundtur for tidsmetadata ok | KIF { "1640" } bytes | MODELLED

seg-f8353e15aabd = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-169f9446e90d = Eksempelet <c1/> setter blant annet:

seg-b8135da5a99a = 2030-01-01T00:{ "00" }:{ "00" }

seg-3f36bd2ec5ea = LTC

seg-2ac27c1e55c0 = oktett

seg-0e86ff364c17 = Diagrammet motoren skriver for scenarios/lunar-interop-export.toml, type lunar-interop-export

seg-98acb538942f = <b>MODELLED</b> LunaNet/IOAG-tilpasset eksport av referansesystem, tid og efemeride for månen (CCSDS OEM + KIF) med rundtur-overensstemmelse. Uavhengig referanse (InternalConsistency): kshanas månebaserte OEM-eksport lest inn på nytt av det uavhengige tredjepartsbiblioteket <c1/> (R. J. Anderson): referansesystem-/tidstokener og tilstand per epoke stemmer overens innenfor skrivepresisjon ({ "1" } mm / { "1e-9" } km/s), og en eksport uten TIME_SYSTEM avvises — en strukturell rundtur for utveksling; den fysiske semantikken for månens referansesystem og tid er validert av sine egne rader, så denne forblir MODELLED. { "0.30" } ekstern sammenligning, et funn (forblir MODELLED): en se

seg-c9a1d76625d6 = MODELLED (resultat <c1/>)

seg-633bcd62ce93 = Gir også ut en LunaNet/IOAG-tilpasset beskrivelse av månens tid (skala-id, sekulær rate µs/døgn fra crate::lunar_time, publisert bånd, referanseflate) som går i rundtur via serde_json, og pakker artefaktene inn i den eksisterende KIF-konvolutten (crate::interchange) med MODELLED-ærlighetsmerket. (typekatalog (<c1/>))

seg-0e91697e3036 = MODELLED — deterministisk rundtur + feltnavnoverensstemmelse mot publisert CCSDS OEM + LunaNet/IOAG-feltsemantikk er den uavhengige referansen; IKKE en sertifisert test av interoperabilitet eller overensstemmelse; illustrativ efemeride fra offentlige kilder, ikke tilknyttet ESA; ingen TRL/heritage/støtte fra noe byrå. (typekatalog (<c1/>))

seg-11d0ccba5ee7 = HVA src/lunar_interop.rs gjør: * export_lunar_oem — GJENBRUKER cratens CCSDS OEM { "2.0" }-skriver (crate::oem), merket på nytt for månekonteksten: REF_FRAME = IAU { "2015" } WGCCRE-legemsreferansesystemet for Månen (MOON_ME / MOON_PA), TIME_SYSTEM = månens tidsskala (LTC / TCL / UTC), CENTER_NAME = MOON, over en ILLUSTRATIVE eksempelefemeride av LCNS-klassen (posisjoner fra crate::lunar_service, hastighet ved sentral finite differanse). * export_ (kommentar i scenariofilen, linje { "6" } til { "19" })

seg-f730e8f789cf = ÆRLIGHET: MODELLED. FeltNAVNENE og enhetene er tilpasset PUBLIC-standarder (CCSDS 502.0-B OEM, IAU WGCCRE { "2015" } referansesystemer for Månen, LunaNet Interoperability Specification / IOAG-arkitekturen for månen). Den deterministiske rundturen og feltnavnoverensstemmelsen er den uavhengige referansen. Dette er IKKE en sertifisert test av interoperabilitet eller overensstemmelse. Efemeriden er illustrativ, fra offentlige kilder, IKKE tilknyttet ESA, og antyder ingen TRL (kommentar i scenariofilen, linje { "21" } til { "26" })

seg-254d48fe58a5 = Interoperabilitetseksport for månen er MODELLED, ikke validert: kontrollert mot sin egen lukkede/analytiske identitet; fanger opp avskrivings- og koeffisientfeil, men er ikke en uavhengig ekstern referanse. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-07d6cc44724f = <s1>Forrige</s1>lunar-integrity

seg-9669cd9b1d04 = <s1>Neste</s1>lunar-jamming
