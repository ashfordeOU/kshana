# docs--kind-lunar-interop-export: translations (sv)

seg-debc2f07db78 = true

seg-1f17ef6a853e = Scenariotyp i motor v{ $version }, familj <a1>Måne och cislunart</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-1c1eeb2dcaa0 = Familjesida: <a1>Måne och cislunart</a1>

seg-619127334cf3 = Ingen matrisrad nämner den här typen vid namn; etiketten på dess resultat är motorns egen, ovan.

seg-834408a40783 = min

seg-d36e6d7d8a10 = Källa: <c1/>

seg-fdf560e675f4 = <c1/> (scenariotyp)

seg-5a4dcb93a643 = Modelled export för månens interoperabilitet: ger månens referenssystem, månens tidsskala och månens efemerid i LunaNet/IOAG-anpassade, CCSDS-baserade utbytesformer med rundtur- och fältkontroll. ÅTERANVÄNDER cratens CCSDS OEM { "2.0" }-emitter och -parser (crate::oem), omtaggade för månsammanhang — OEM REF_FRAME bär IAU { "2015" } WGCCRE:s månkroppssystem (MOON_ME / MOON_PA), TIME_SYSTEM månens tidsskala (LTC / TCL / UTC), CENTER_NAME = MOON — över en illustrativ exempelefemerid av LCNS-klass (positioner från crate::lunar_service, hastighet genom finit differens). Ger också en LunaNet/IOAG-anpassad deskriptor för månens tid (skal-id, sekulär takt i µs/dygn från crate::lunar_time, publicerat band, referensyta) som går att rundtura via serde_json, och packar artefakterna i det befintliga KIF-höljet (crate::interchange) med ärlighetsetiketten MODELLED. Redovisar emitterade artefakter, antal OEM-rader, fältkontroll (lyckad/misslyckad samt lista över närvarande och saknade fält), OEM-rundtur ok, rundtur för tidsmetadata ok och KIF-storlek i byte. MODELLED — deterministisk rundtur och kontroll av fältnamn mot publicerad CCSDS OEM samt LunaNet/IOAG:s fältsemantik är den oberoende referensen; INTE ett certifierat interoperabilitetstest; illustrativ efemerid från publika källor, inte knuten till ESA; inget TRL, inget arv och inget stöd från någon myndighet.

seg-1726861e444f = En körning av <c1/> sammanfattas som: lunar-interop-export | REF_FRAME MOON_ME / TIME_SYSTEM LTC | { "9" } tillstånd, OEM { "23" } rader | formatkontroll PASS ({ "9" } närvarande / { "0" } saknade) | OEM tur-och-retur ok | tidsmetadata tur-och-retur ok | KIF { "1640" } bytes | MODELLED

seg-f8353e15aabd = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-169f9446e90d = Exemplet <c1/> anger bland annat:

seg-b8135da5a99a = 2030-01-01T00:{ "00" }:{ "00" }

seg-3f36bd2ec5ea = LTC

seg-2ac27c1e55c0 = octet

seg-0e86ff364c17 = Diagrammet som motorn skriver för scenarios/lunar-interop-export.toml, typ lunar-interop-export

seg-98acb538942f = <b>MODELLED</b> Export av lunart referenssystem + tid + efemerid i linje med LunaNet/IOAG (CCSDS OEM + KIF) med formatkontroll genom tur-och-retur. Oberoende referens (InternalConsistency): kshanas lunara OEM-export tolkas på nytt av det oberoende biblioteket <c1/> från tredje part (R. J. Anderson): token för referenssystem/tid och tillstånd per epok stämmer med skrivprecisionen ({ "1" } mm / { "1e-9" } km/s) och en export där TIME_SYSTEM tappats avvisas — en strukturell tur-och-retur för utbyte; den fysikaliska semantiken för lunart referenssystem/lunar tid är validerad av sina egna rader, så den här förblir MODELLED. { "0.30" } extern jämförelse, ett fynd (förblir MODELLED): en se

seg-c9a1d76625d6 = MODELLED (resultat <c1/>)

seg-633bcd62ce93 = Skickar också ut en lunar tidsbeskrivning i linje med LunaNet/IOAG (skal-id, sekulär takt µs/dag från crate::lunar_time, publicerat band, referensyta) som går tur-och-retur via serde_json, och omsluter artefakterna i det befintliga KIF-höljet (crate::interchange) med ärlighetsetiketten MODELLED. (typkatalog (<c1/>))

seg-0e91697e3036 = MODELLED — deterministisk tur-och-retur + formatkontroll av fältnamn mot publicerad CCSDS OEM + fältsemantik i LunaNet/IOAG är den oberoende referensen; INTE ett certifierat interoperabilitetstest; illustrativ efemerid från offentliga källor, inte knuten till ESA; inget TRL, inget flygarv och inget stöd från någon myndighet. (typkatalog (<c1/>))

seg-11d0ccba5ee7 = VAD src/lunar_interop.rs gör: * export_lunar_oem — ÅTERANVÄNDER cratens CCSDS OEM-sändare { "2.0" } (crate::oem), omtaggad för lunart sammanhang: REF_FRAME = IAU { "2015" } WGCCRE:s lunara kroppsfasta referenssystem (MOON_ME / MOON_PA), TIME_SYSTEM = den lunara tidsskalan (LTC / TCL / UTC), CENTER_NAME = MOON, över en exempelefemerid av ILLUSTRATIV LCNS-klass (positioner från crate::lunar_service, hastighet med central finit differens). * export_ (kommentar i scenariofilen, rad { "6" } till { "19" })

seg-f730e8f789cf = ÄRLIGHET: MODELLED. FältNAMNEN och enheterna är i linje med OFFENTLIGA standarder (CCSDS 502.0-B OEM, IAU WGCCRE { "2015" } lunara referenssystem, LunaNet Interoperability Specification / IOAG:s lunara arkitektur). Den deterministiska tur-och-retur-kontrollen och formatkontrollen av fältnamn är den oberoende referensen. Detta är INTE ett certifierat interoperabilitetstest. Efemeriden är illustrativ, från offentliga källor, INTE knuten till ESA och innebär inget TRL (kommentar i scenariofilen, rad { "21" } till { "26" })

seg-254d48fe58a5 = Lunar interoperabilitetsexport är MODELLED, inte validerad: kontrollerad mot sin egen slutna eller analytiska identitet — fångar avskrivnings- och koefficientfel, men är ingen extern oberoende referens. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-07d6cc44724f = <s1>Föregående</s1>lunar-integrity

seg-9669cd9b1d04 = <s1>Nästa</s1>lunar-jamming
