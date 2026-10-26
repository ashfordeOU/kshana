# docs--compliance-dhs-rpcf: translations (da)

seg-d01db1c2710a = Reference

seg-fdbb9db68f1d = ingen

seg-dbec6a166e56 = Kilde: <c1/>

seg-6e9b601864df = US DHS Resilient PNT Conformance Framework: hvad Kshana leverer belæg for

seg-cef4181edf29 = Rammeværket beskriver resilienceniveauer { "0" } til { "4" } opbygget af otte nummererede krav og en evalueringstilgang, der kombinerer statisk analyse med dynamisk analyse, hvor testvektorer træder i stedet for trusler. Det har ikke noget eget skema for kravidentifikatorer, så henvisningerne nedenfor er dets niveau- og kravnumre og dets afsnitsnumre. Det er resultatbaseret og katalogiserer ikke trusler.

seg-ff0e00610721 = Hver række siger, hvilke Kshana-outputs der <b>leverer belæg for</b> kravet, og hvad der er tilbage. Intet her siger, at et rammeværk er opfyldt, eller at et produkt er vurderet eller godkendt af nogen. Kør <c1/> på dine egne resultatfiler for at se, hvilke rækker dine kørsler faktisk dokumenterer; se <a1>README.md</a1>.

seg-30c8cabb6e90 = Kildedokumenter

seg-2261e4292865 = <b>Resilient Positioning, Navigation, and Timing (PNT) Conformance Framework</b>: Version { "2.0" }, { "26" } april { "2022" } (DHS Science and Technology Directorate, sammen med CISA). <a1>https://www.dhs.gov/sites/default/files/2022-05/22_0531_st_resilient_pnt_conformance_framework_v2.0.pdf</a1>. Læst 2026-10-09: dokumentet læst i sin helhed; publikationens landingsside blev ikke hentet.

seg-955191e0baab = Kortlægning

seg-6ba8f74126ee = Hvad det kræver (omskrevet)

seg-0438151025da = Kshana-outputs, der leverer belæg for det

seg-3f265e18f56c = Hul

seg-4263435e702a = Afsnit { "5.2" } (Prevent, Respond, Recover)

seg-e7b721f6e216 = Resilience beskrives som tre funktioner: at forebygge skade, at reagere (detektere, rapportere, afbøde, inddæmme) og at komme sig. Detektering er probabilistisk, så både falske alarmer og udeblevne detekteringer har betydning.

seg-3447d3b53fe8 = Vurdering af tillid til modtagerlog; Detektering af spoofing og meaconing; Holdover og udglidning

seg-ab055a50e16e = Forebyggelse er en egenskab ved produktets udformning, som intet simuleringsoutput viser. Detektionsstatistik fra en syntetisk kørsel eller en kørsel i én session er ikke en målt andel af falske alarmer eller udeblevne detekteringer for et produkt i drift.

seg-501badd6a436 = Niveau { "1" }, krav { "1" }

seg-e8cfbe121084 = Kontrollér, at lagrede data, der kommer fra eksterne kilder, passer til formaterne og værdiintervallerne i de relevante standarder.

seg-7d7196aefa05 = En egenskab ved softwaresikring og inputvalidering i det produkt, der testes. Kshana inspicerer ikke et produkts håndtering af input.

seg-6085030de980 = Niveau { "1" }, krav { "2" }

seg-e8cd6fb732ad = Tillad fuld manuel genopretning ved at rydde eller nulstille hukommelsen, så systemet vender tilbage til defineret ydeevne, når truslen er væk.

seg-8d216d42c776 = Vurdering af tillid til modtagerlog

seg-e3ca721d9d2e = En modtagerlog viser, hvornår en positionsbestemmelse blev upålidelig, og hvornår den kom sig; den viser ikke, at en manuel nulstilling rydder enhver lagret tilstand.

seg-2c78c15cea96 = Niveau { "1" }, krav { "3" }

seg-ab9458f8b8fc = Genindlæs eller opdatér firmware sikkert.

seg-3a50eceb47f5 = Sikkerhed ved firmwareopdatering ligger uden for det, noget Kshana-output observerer.

seg-752a194674f6 = Niveau { "2" }, krav { "4" }

seg-a5f263a083c7 = Identificér kompromitterede PNT-kilder og forhindr dem i at ødelægge løsningen.

seg-4e7034acccc0 = Detektering af spoofing og meaconing; Vurdering af tillid til modtagerlog; Integritetsmonitorering og beskyttelsesniveauer

seg-d5fdef2a78f2 = Kshana scorer detektorer og monitorer, som det modellerer eller kører over en log; om et produkts egen udelukkelse af kilder virker, kræver produktets interne tilstand og ikke kun dets log.

seg-e3ea1208fac9 = Niveau { "2" }, krav { "5" }

seg-c0219254fe8e = Genopret kilder og systemet automatisk uden at afbryde outputtet; en løsning leveres stadig under truslen, muligvis med ubegrænset forringelse.

seg-3dd48cb65cb4 = Holdover og udglidning; Vurdering af tillid til modtagerlog

seg-0c36c4a3eb4e = Holdover-kørsler afgrænser modelleret drift for en angivet ur- eller inertialmodel, ikke produktets egen genopretningsadfærd.

seg-befbf4b94876 = Niveau { "3" }, krav { "6" }

seg-45410d1675be = Ødelagte data fra én kilde må ikke forurene en anden kilde.

seg-ff808ce8ec48 = Alternative og diversificerede PNT-kilder

seg-ccf628643110 = Kshana kører kilder side om side; isolation af kilder inde i et produkt kræver udformningsgennemgang eller fejlinjektion i produktet.

seg-a1d5a3125697 = Niveau { "3" }, krav { "7" }

seg-db149ea618dd = Krydsverificér løsningerne fra alle kilder, og hold forringelsen under en trussel afgrænset.

seg-4afa05ef42fa = Integritetsmonitorering og beskyttelsesniveauer; Holdover og udglidning; Alternative og diversificerede PNT-kilder

seg-8b1f938c0175 = Afgrænset forringelse er vist for de modellerede sensorer; produktets egen krydskontrol observeres ikke.

seg-772244881e5b = Niveau { "4" }, krav { "8" }

seg-aff5161e6363 = Brug kilder med forskellige teknologier mod trusler i fælles mode, uden forringelse under truslen.

seg-587889f9881c = Alternative og diversificerede PNT-kilder; Effekter af jamming på link-budgettet

seg-65b96caf8d6b = Et argument om fælles mode kræver det rigtige produkts sæt af kilder og en trussel, der spænder over dem; et scenarie angiver én, det beviser ikke, at produktet ikke har nogen delt svaghed.

seg-3c4cc0793454 = Afsnit { "5.5" } (fælles mode)

seg-a87c9808dd99 = Diversificerede mekanismer må ikke dele en svaghed: for eksempel slår en jammer, der dækker to bånd, banddiversitet.

seg-c10ba3bb01be = Effekter af jamming på link-budgettet; Resilience-scoring over trusselsensembler; Alternative og diversificerede PNT-kilder

seg-843fe2fc9e33 = Scoring bruger et syntetisk trusselsensemble, angivet som sådant; det er ikke feltdata.

seg-3158e7efd1a5 = Afsnit { "8.1" } til { "8.3" } (evaluering)

seg-3942d9cdc64b = Evaluering kombinerer statisk analyse med dynamisk analyse, hvor testvektorer træder i stedet for trusler; testklasserne er kildefejl, interferens og interne fejl. Simulatorer nævnes som testmetode.

seg-9d5c297c1ab9 = Vurdering af tillid til modtagerlog; Effekter af jamming på link-budgettet; Detektering af spoofing og meaconing

seg-bb02568e8f8f = Eksporteret bevægelse og eksporterede hændelser kan drive en laboratoriesimulator (docs/TEST-BENCH.md). Kshana skriver intet signal, så simulatoren og dens autoriserede operatør leverer truslen.

seg-b81625e9e071 = Afsnit { "8.6" } (elementer i testplanen)

seg-27d645a79672 = En testplan angiver niveau, krav, input, referencer, nødvendig dataadgang, procedure med kriterier for bestået eller ikke bestået, resultater og noter.

seg-1f2898855ccc = Reproducerbar proveniens for kørsler; Vurdering af tillid til modtagerlog

seg-d8b08da48cb2 = Kriterier for bestået eller ikke bestået vælges af vurderingsmanden; Kshana registrerer de input, tærskler og hashes, det kørte med.

seg-ccfdf53a1e54 = <s1>Forrige</s1>Compliance-kortlægning

seg-260ba950eb89 = <s1>Næste</s1>IMO-vejledning for skibe
