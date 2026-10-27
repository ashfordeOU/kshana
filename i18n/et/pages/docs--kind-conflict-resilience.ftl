# docs--kind-conflict-resilience: translations (et)

# text
seg-c4ed27a559df = Teemaleht: <a1>RESILIENCE-CROSSWALK.md</a1>

# text
seg-216efc4e6fba = Mootori v{ $version } stsenaariumi liik, perekond <a1>GPS-ita alternatiivne PNT</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-619127334cf3 = Ükski maatriksirida ei nimeta seda liiki nimepidi; selle tulemuse silt on mootori enda, ülal.

# text
seg-98133e74f88a = Perekonna leht: <a1>GPS-ita alternatiivne PNT</a1>

# text
# c1: docs/kinds/by-kind/conflict-resilience.md
seg-34f14aa2ee0b = Allikas: <c1/>

# text
# c1: conflict-resilience
seg-a80556cfe1a9 = <c1/> (stsenaariumi liik)

# text
seg-c8f93431680a = MODELLED kihilise PNT konfliktivastupidavus (P7): vaidlustatud keskkonna kasutaja kasutab mitut PNT kihti (avatud teenuse GNSS, lairiba-GNSS, autenditud konstellatsioon, täiendusrelee), millest igaühel on baaskättesaadavus, 1σ täpsus ja vektorikohane keelamise haavatavus jagatud segamise/spuufimise ohu suhtes. Intensiivsuse üle pühitud ALGVÄÄRTUSEGA (SEEDED) Monte Carlo keelab iga kihi tõenäosusega clamp(vulnerability·intensity·vector_weight,{ "0,1" }), ühendab ellujäänud suletud kujul pöördhajuvuse reegliga σ_fused=(Σ 1/σ_i²)^(−1/2) ning annab teada kogukaotuse tõenäosuse (kõik kihid keelatud), ühendatud vea mediaani ja kihikohased kasutatavuse/keelamise statistikad intensiivsuse suhtes. Peamine vastupidavussuhe (üksikkihi ja kihilise kogukaotuse tõenäosus) jääb ~7x juurde SÕLTUMATUSE eelduse korral; ühefaktoriline Gaussi koopula korreleeritud keelamise pühkimine näitab seejärel, et see ~7x variseb väärtuse { "1" } suunas, kui keelamise korrelatsioon kasvab (korrelatsioon nurjab kihistamise). Eelduste tundlikkuse plokk vahemikustab peamise suuruse ALLIKATEGA haavatavuse eelduste üle mcda tornado + Dirichlet' ohupingutuse ümberjaotamise + protsentiilide usaldusvahemike abil. VALIDATED tuum: Monte Carlo kogukaotus koondub suletud kujul sõltumatu korrutiseni Π_i p_deny_i (MC standardvea piires fikseeritud algväärtusega (seed) ja suure N korral); pöördhajuvuse ühendamine on suletud kujul samasus; ρ={ "0" } korral taandub koopula sõltumatule mudelile ja iga ρ säilitab iga kihi marginaalse keelamismäära. MODELLED: kihikohased haavatavuse/kättesaadavuse/täpsuse suurused on allikatega, kuid modelleeritud sisendid (JammerTest { "2024" }, TEXBAT, EASA SIB, RTCA DO-229, LunaNet/IOAG — vt conflict_threat_params), ning konkreetne ~7x suurus ja suhte-korrelatsiooni kõvera kuju tulenevad sellest parametriseeringust. § { "4.2" } vektorikohane ellujäämise lahutus lahendab seejärel jagatud RF-ohu neljaks nimetatud vektoriks (segamine/spuufimine/kineetiline/küber) ja annab teada iga vektori kasutatava PNT sujuva halvenemise kõvera S_v(x)=1-Prod_i(1-a_i(1-clamp(susceptibility_i,v·x,{ "0,1" }))) — VALIDATED: algväärtusega (seed) kihikohane Monte Carlo koondub sellele suletud kujule; segamine on korreleeritud RF-baasjoone teravaim vektor ja RF-immuunne inertsiaalkiht on otsustav ellujääja. Mitte sertifitseeritud navigatsiooni kättesaadavuse toode.

# text
# c1: scenarios/conflict-resilience.toml
seg-dd10a00edc2f = Ühe <c1/> jooksu kokkuvõte: conflict-resilience | { "4" } kihti ({ "0" } baasjoon) | võrdlusintensiivsus { "1.00" } | vastupidavussuhe suletud kujul 6.73x MC 6.19x (kihiline vs üksikkiht) | korrelatsioon nurjab kihistamise: suhe 7.50x @ rho { "0.00" } -> 1.21x @ rho { "0.95" } | eelduste usaldusvahemik [5.51-8.48]x | vektorikohane ellujäämine @ ref jam { "26" }% spoof { "80" }% kinetic { "100" }% cyber { "99" }% (teravaim segamine) | ~7x peamine MODELLED, VALIDATED MC->suletud kuju / ühendamise samasus / koopula marginaalid / vektorikohane ellujäämine

# text
# c1: layers
# c2: intensity
# c3: correlation
# c4: trials
# c5: seed
# c6: primary_layer
seg-674bafccbaf7 = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: scenarios/conflict-resilience.toml
seg-71fcff68edaf = Näide <c1/> määrab muu hulgas:

# text
seg-4e3b5bb5a5e7 = GNSS L1 C/A (avatud teenus)

# text
seg-bd3832c8215d = Tulemuse silt (mootori oma): MODELLED kihilise PNT konfliktivastupidavus (P7). VALIDATED tuum: Monte Carlo kogukaotuse tõenäosus koondub suletud kujul sõltumatu korrutiseni Pi_i p_deny_i (kinnitatud Monte Carlo standardvea piires fikseeritud algväärtusega (seed) ja suure N korral); pöördhajuvuse positsiooniühendamine sigma_fused = (sum_i 1/sig

# attr:alt
seg-4dd2bcc206db = Diagramm, mille mootor kirjutab failile scenarios/conflict-resilience.toml, liik conflict-resilience

# text
seg-c0e69524f05d = <b>MODELLED</b> Mõõtmekohased alamhinded Kshana enda seitsme vastupidavuskategooria (mitte DHS-i terminid), RethinkPNT RDRR funktsioonide ja Yangi kriteeriumide üle, igaüks märgitud modelleeritud märgisega i. Oraakel (sõltumatu etalon) (InternalConsistency): Käsitsi tuletatud mõõdikukohased valemid: pöördSimpsoni mitmekesisus, kaalutud keskmine komposiit, piiratud/piiramata ajajoone kestused, nõrgima lüli Level-redel

# text
# c1: label
seg-2ca37a78e899 = MODELLED kihilise PNT konfliktivastupidavus (P7). VALIDATED tuum: Monte Carlo kogukaotuse tõenäosus koondub suletud kujul sõltumatu korrutiseni Pi_i p_deny_i (kinnitatud Monte Carlo standardvea piires fikseeritud algväärtusega (seed) ja suure N korral); pöördhajuvuse positsiooniühendamine sigma_fused = (sum_i 1/sigma_i^{ "2" })^(-1/2) on suletud kujul samasus; korrelatsiooni rho={ "0" } korral taandub Gaussi koopula täpselt sõltumatule mo (tulemus <c1/>)

# text
# c1: kshana kinds --json
seg-d0d834e377ee = MODELLED kihilise PNT konfliktivastupidavus (P7): vaidlustatud keskkonna kasutaja kasutab mitut PNT kihti (avatud teenuse GNSS, lairiba-GNSS, autenditud konstellatsioon, täiendusrelee), millest igaühel on baaskättesaadavus, 1σ täpsus ja vektorikohane keelamise haavatavus jagatud segamise/spuufimise ohu suhtes. (liikide kataloog (<c1/>))

# text
# c1: kshana kinds --json
seg-3ca12700b54c = Peamine vastupidavussuhe (üksikkihi ja kihilise kogukaotuse tõenäosus) jääb ~7x juurde SÕLTUMATUSE eelduse korral; ühefaktoriline Gaussi koopula korreleeritud keelamise pühkimine näitab seejärel, et see ~7x variseb väärtuse { "1" } suunas, kui keelamise korrelatsioon kasvab (korrelatsioon nurjab kihistamise). (liikide kataloog (<c1/>))

# text
# c1: kshana kinds --json
seg-70e4fdff099f = MODELLED: kihikohased haavatavuse/kättesaadavuse/täpsuse suurused on allikatega, kuid modelleeritud sisendid (JammerTest { "2024" }, TEXBAT, EASA SIB, RTCA DO-229, LunaNet/IOAG — vt conflict_threat_params), ning konkreetne ~7x suurus ja suhte-korrelatsiooni kõvera kuju tulenevad sellest parametriseeringust. (liikide kataloog (<c1/>))

# text
seg-33541cca61b6 = Vaidlustatud keskkonna kasutaja kasutab nelja RF PNT kihti, mis kõik sõidavad samal sagedusalal ja jagavad seetõttu segamise/spuufimise keelamisvektorit — habras, korreleeritud juhtum. Stsenaarium annab teada: * kogukaotuse tõenäosus vs ohu intensiivsus (Monte Carlo vs suletud kujul sõltumatu korrutis, milleni see koondub), * ~7x kihilise ja üksikkihi vastupidavussuhe sõltumatuse eelduse korral, * kuidas see ~7x variseb (stsenaariumifaili kommentaar, read { "3" } kuni { "15" })

# text
# c1: layers
seg-83badfe4784d = Iga kihikohane suurus on MODELLED sisend koos päritoluga; vt src/conflict_threat_params.rs allikatega [min, nominal, max] eelduste ja vektorikohaste vastuvõtlikkuse profiilide kohta (JammerTest { "2024" }, TEXBAT, EASA SIB 2022-02, RTCA DO-229, LunaNet/IOAG). Kui <c1/> välja jätta, jookseb sama allikatega neljakihiline baasjoon; see on siin läbipaistvuse huvides välja kirjutatud — sealhulgas iga kihi vector_profile. (stsenaariumifaili kommentaar, read { "17" } kuni { "22" })

# text
seg-bb182ed41520 = PNT-vastupidavuse raamistikuga joondatud hindamine on MODELLED, mitte valideeritud: kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-6a42653a8a0f = <s1>Eelmine</s1>combined-altpnt

# text
seg-2bd3e9d1505c = <s1>Järgmine</s1>constellation-design
