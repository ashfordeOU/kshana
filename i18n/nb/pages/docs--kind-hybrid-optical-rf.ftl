# docs--kind-hybrid-optical-rf: translations (nb)

seg-debc2f07db78 = true

seg-37d16b499bc5 = dB

seg-98151954f217 = false

seg-619127334cf3 = Ingen matriserad nevner denne typen ved navn; etiketten på resultatet er motorens egen, ovenfor.

seg-0482fec5b0f6 = Kilde: <c1/>

seg-830c574e871b = <c1/> (scenariotype)

seg-72ad48275ebe = Scenariotype i motoren v{ $version }, familie <a1>Optisk PNT</a1>. Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en safety-of-life-tjeneste. Hver etikett her kommer fra motoren eller verifikasjonsmatrisen; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett oppnås: avsnittet Evidence i README).

seg-e6839b50b560 = MODELLED heterogent optisk + RF PNT, felles kvalitetsmål (P5): setter sammen det toveis optiske linkbudsjettet på { "1550" } nm (fotonbegrenset toveis avstandsmåling med CRLB σ_τ/√N og diffraksjonsavtrykk λ/D·avstand), et RAIM-beskyttelsesnivå med løsningsseparasjon på tvers av modaliteter (posisjon OG tid) som fusjonerer den løse RF-løsningen og den tette optiske løsningen med ulike kovarianser, den optiske klarværstilgjengeligheten for N stasjoner (uavhengig union { "1" }−Π({ "1" }−a_i) og en romlig korrelert variant), en overlevering av tilstand/kovarians optisk↔RF med en BEVIST bit-kontinuerlig (uten hopp) middelverdi og en NEES χ²-konsistensgrind, og en felles score for P(tilgjengelig OG presisjonsklasse OG integritetssikret) med korrelasjonshåndtering. VALIDATED lukket form: avstandsmåling med CRLB, diffraksjonsavtrykk, χ²-kvantil for beskyttelsesnivå, unionskombinatorikk, middelverdikontinuitet i overleveringen + NEES-grind og det felles uavhengige produktet. MODELLED: de optiske tapsfordelingene, RF-/optiske σ-størrelsene, klimatologiinndata for skyer, korrelasjonene og P_HMI-budsjettet. Ikke et sertifisert tilgjengelighets-/integritetsprodukt.

seg-30904e2367fc = Én kjøring av <c1/> oppsummeres slik: hybrid-optical-rf | optical footprint { "700" } m, { "1489" } photons -> ranging σ { "0.194" } mm, timing σ { "1.30" } ps | cross-RAIM HPL { "6.2" } m / VPL { "6.6" } m / TPL { "13.3" } ns (protected) | availability { "99.5" }% ({ "5" } sites) | handoff no-jump OK NEES { "3.34" }∈[0.48,{ "11.14" }] in-gate | joint FoM { "0.993" } (A { "0.995" } · P { "0.995" } · I { "1.000" }) | Validated CRLB/χ²-PL/union/handoff, Modelled σ/climatology

seg-73e5cf56c92c = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>, <c36/>, <c37/>, <c38/>, <c39/>, <c40/>, <c41/>, <c42/>, <c43/>

seg-27338c8b2e5f = Eksemplet <c1/> setter blant annet:

seg-7b9ce4689508 = Resultatetikett (motorens): Heterogent optisk + RF PNT, felles kvalitetsmål for tilgjengelighet / presisjon / integritet (P5). VALIDATED lukket form: den fotonbegrensede avstandsmålingen med CRLB (σ_τ/√N) og diffraksjonsavtrykket (λ/D·avstand), χ²-kvantilen for beskyttelsesnivå på tvers av modaliteter, den uavhengige unionstilgjengeligheten for N stasjoner ({ "1" } − Π(

seg-5cea5229815e = Diagrammet motoren skriver for scenarios/hybrid-optical-rf.toml, typen hybrid-optical-rf

seg-a8923a682728 = <b>MODELLED</b> Rapporten hybrid-optical-rf oppgir linkkonfigurasjonen den faktisk kjørte med (bærebølgelengde, sende- og mottaksapertur, avstand, pulsbredde, integrasjon. Uavhengig referanse (InternalConsistency): Ingen ekstern uavhengig referanse, og ingen er mulig: dette er selvbeskrivelse, ikke en måling. Den registreres fordi fraværet av den var en feil -- P5 måtte oppgi bærebølgelengden og sendeaperturen fra kildens standardverdier, og slutte at en bar <c1/> var i kvadratmeter ut fra en intern konsistenskontroll. Slutningen var riktig, og nettopp derfor var det viktig: ingenting ville ha fanget det om den var feil

seg-28abb5a84eaa = <b>MODELLED</b> Rapporten hybrid-optical-rf oppgir en RF-linktilgjengelighet, sammensatt av størrelser motoren allerede beregner i stedet for av en importert klimatologi, og . Uavhengig referanse (InternalConsistency): Ingen ekstern uavhengig referanse, og ExternalDataset er avslått. De to inndataene er en Eb/N0-margin og en C/N0-terskelkryssing, begge funksjoner av en MODELLED EIRP, et kvalitetsmål og en samlet tapsfordeling; det finnes ingen målt tilgjengelighetsregistrering for en hybrid optisk/RF-tjeneste mellom jorden og månen å kontrollere den sammensatte verdien mot. Kontrollene som finnes er interne og er oppgitt som det: sammensetningen beregnes på nytt fra r

seg-888004543d37 = <b>MODELLED</b> Rapporten hybrid-optical-rf gir forholdet mellom optisk og RF-avstandsmåling med ÉN konfigurasjon som begge ledd ble evaluert ved, båret i det samme objektet: den sa. Uavhengig referanse (InternalConsistency): Ingen ekstern uavhengig referanse for FORHOLDET, og ExternalDataset er bevisst avslått. Den underliggende RF-kjeden har en -- tests/validate_p5_rf_ranging_precision.rs kontrollerer linkbudget::link_budget og navsignal::dll_code_jitter_chips mot en uavhengig Python/NumPy-fixture og mot den hardkodede utregnede verdien fra Kaplan & Hegarty ({ "2.814e-3" } chip / { "0.825" } m ved { "45" } dB-Hz) -- og den optiske CRLB har sin egen lukkede rad

seg-db5ff373b50f = <b>MODELLED</b> Rapporten hybrid-optical-rf oppgir hva kjikvadratmonitoren på tvers av modaliteter faktisk kan OPPDAGE, ikke bare at den består et feilfritt tilfelle: den minste detekterbare. Uavhengig referanse (InternalConsistency): To interne uavhengige referanser, intet eksternt datasett. ({ "1" }) Rundtur i lukket form: den minste detekterbare biasen fremkommer ved å invertere halen til den ikke-sentrale kjikvadratfordelingen på ikke-sentraliteten (raim::pbias) og verifiseres ved å mate den resulterende ikke-sentraliteten tilbake gjennom raim::noncentral_chi2_cdf ved monitorens egen terskel, som må gi P_md. ({ "2" }) Injeksjon mot analyse: en bias skrives inn i RF-estimatet for én akse

seg-24f31f6b353f = Heterogent optisk + RF PNT, felles kvalitetsmål for tilgjengelighet / presisjon / integritet (P5). VALIDATED lukket form: den fotonbegrensede avstandsmålingen med CRLB (σ_τ/√N) og diffraksjonsavtrykket (λ/D·avstand), χ²-kvantilen for beskyttelsesnivå på tvers av modaliteter, den uavhengige unionstilgjengeligheten for N stasjoner ({ "1" } − Π({ "1" }−a_i)), invarianten for middelverdikontinuitet i overleveringen optisk↔RF (bit for bit uten hopp) og NEES χ²-grinden, og det felles uavhengige kvalitetsmålet (resultat <c1/>)

seg-bec90783ad8b = MODELLED heterogent optisk + RF PNT, felles kvalitetsmål (P5): setter sammen det toveis optiske linkbudsjettet på { "1550" } nm (fotonbegrenset toveis avstandsmåling med CRLB σ_τ/√N og diffraksjonsavtrykk λ/D·avstand), et RAIM-beskyttelsesnivå med løsningsseparasjon på tvers av modaliteter (posisjon OG tid) som fusjonerer den løse RF-løsningen og den tette optiske løsningen med ulike kovarianser, den optiske klarværstilgjengeligheten for N stasjoner (uavhengig un (typekatalog (<c1/>))

seg-15abc895e477 = MODELLED: de optiske tapsfordelingene, RF-/optiske σ-størrelsene, klimatologiinndata for skyer, korrelasjonene og P_HMI-budsjettet. (typekatalog (<c1/>))

seg-9fafa5ffb521 = MODELLED. Validerte lukkede former: avstandsmåling med CRLB (sigma_tau/sqrt(N)), diffraksjonsavtrykk (lambda/D * avstand), χ²-kvantil for beskyttelsesnivå, unionskombinatorikk, middelverdikontinuitet i overleveringen + NEES-grind og det felles uavhengige produktet. Tapsfordelingene, sigma-størrelsene, klimatologiinndata for skyer, korrelasjonene og P_HMI-budsjettet er modellerte representative inndata. Hvert felt nedenfor er valgfritt og vist med sin (kommentar i scenariofilen, linjene { "10" } til { "14" })

seg-e5f964e5d422 = --- G15 bias-/rampefeilinjeksjon mot monitoren på tvers av modaliteter --- Den minste detekterbare biasen og deteksjonseffektkurven er ANALYTISKE (invertering av ikke-sentral kjikvadrat), så de trenger ingen egne inndata. Disse to setter bare rampehastigheten som den rapporterte tiden til deteksjon er en hastighetsomregning av. Begge MODELLED. (kommentar i scenariofilen, linjene { "56" } til { "59" })

seg-70f50a62aa12 = --- G17 etter-overlevering-glidning: prosessstøy og kryssing av varslingsgrensen --- Tilfeldig gange på det eksisterende overleveringsfilteret med 4 tilstander (øst, nord, opp, klokke). Varslingsgrensene er de som allerede er deklarert ovenfor; bare prosessstøyen og dekningsfaktoren er nye. Begge PSD-ene er MODELLED representative inndata, og krysningstidene skalerer direkte med dem. (kommentar i scenariofilen, linjene { "63" } til { "67" })

seg-9fb4240fb0ef = Selvbeskrivelsen i hybrid optisk/RF-rapporten er MODELLED, ikke validert: kontrollert mot sin egen lukkede/analytiske identitet, noe som fanger opp transkripsjons- og koeffisientfeil, men ikke er en ekstern uavhengig referanse. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-a97755cb13eb = Familieside: <a1>Optisk PNT</a1>

seg-1586d90cdf1b = <s1>Forrige</s1>holdover-test

seg-211275a00df0 = <s1>Neste</s1>hybrid-ukf
