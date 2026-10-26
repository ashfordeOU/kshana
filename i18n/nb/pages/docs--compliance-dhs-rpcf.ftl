# docs--compliance-dhs-rpcf: translations (nb)

seg-d01db1c2710a = Referanse

seg-fdbb9db68f1d = ingen

seg-dbec6a166e56 = Kilde: <c1/>

seg-6e9b601864df = US DHS Resilient PNT Conformance Framework: hva Kshana gir belegg for

seg-cef4181edf29 = Rammeverket beskriver resiliensnivåer fra { "0" } til { "4" } bygget på åtte nummererte krav, og en evalueringstilnærming som kombinerer statisk analyse med dynamisk analyse der testvektorer representerer trusler. Det har ikke noe eget skjema for kravidentifikatorer, så henvisningene nedenfor er nivå- og kravnumrene og seksjonsnumrene. Det er resultatbasert og katalogiserer ikke trusler.

seg-ff0e00610721 = Hver rad sier hvilke Kshana-utdata som <b>gir belegg for</b> kravet og hva som gjenstår. Ingenting her sier at et rammeverk er oppfylt eller at noe produkt er vurdert eller godkjent av noen. Kjør <c1/> på dine egne resultatfiler for å se hvilke rader kjøringene dine faktisk gir evidens for; se <a1>README.md</a1>.

seg-30c8cabb6e90 = Kildedokumenter

seg-2261e4292865 = <b>Resilient Positioning, Navigation, and Timing (PNT) Conformance Framework</b>: versjon { "2.0" }, { "26" }. april { "2022" } (DHS Science and Technology Directorate, sammen med CISA). <a1>https://www.dhs.gov/sites/default/files/2022-05/22_0531_st_resilient_pnt_conformance_framework_v2.0.pdf</a1>. Lest 2026-10-09: dokumentet er lest i sin helhet; publikasjonens landingsside ble ikke hentet.

seg-955191e0baab = Kobling

seg-6ba8f74126ee = Hva det ber om (parafrasert)

seg-0438151025da = Kshana-utdata som gir belegg for det

seg-3f265e18f56c = Hull

seg-4263435e702a = Seksjon { "5.2" } (Prevent, Respond, Recover)

seg-e7b721f6e216 = Resiliens beskrives som tre funksjoner: å forebygge skade, å respondere (oppdage, rapportere, avbøte, begrense) og å gjenopprette. Deteksjon er sannsynlighetsbasert, så både falske alarmer og uoppdagede hendelser teller.

seg-3447d3b53fe8 = Tillitsvurdering av mottakerlogg; Deteksjon av spoofing og meaconing; Holdover og coasting

seg-ab055a50e16e = Forebygging er en egenskap ved produktets utforming som ingen simuleringsutdata viser. Deteksjonsstatistikk fra en syntetisk kjøring eller en kjøring med én økt er ikke en målt rate for falske alarmer eller uoppdagede hendelser for et produkt i drift.

seg-501badd6a436 = Nivå { "1" }, krav { "1" }

seg-e8cfbe121084 = Kontroller at lagrede data som kommer fra eksterne kilder stemmer med formatene og verdiområdene i de relevante standardene.

seg-7d7196aefa05 = En egenskap ved programvaresikring og inndatavalidering i produktet som testes. Kshana inspiserer ikke et produkts håndtering av inndata.

seg-6085030de980 = Nivå { "1" }, krav { "2" }

seg-e8cd6fb732ad = Tillat full manuell gjenoppretting ved å tømme eller tilbakestille minnet, slik at systemet går tilbake til definert ytelse når trusselen er borte.

seg-8d216d42c776 = Tillitsvurdering av mottakerlogg

seg-e3ca721d9d2e = En mottakerlogg viser når en posisjonsbestemmelse ble ikke-tiltrodd og når den ble gjenopprettet; den viser ikke at en manuell tilbakestilling tømmer hver lagrede tilstand.

seg-2c78c15cea96 = Nivå { "1" }, krav { "3" }

seg-ab9458f8b8fc = Last inn eller oppdater fastvare på en sikker måte.

seg-3a50eceb47f5 = Sikkerheten ved fastvareoppdatering ligger utenfor det noen Kshana-utdata observerer.

seg-752a194674f6 = Nivå { "2" }, krav { "4" }

seg-a5f263a083c7 = Identifiser kompromitterte PNT-kilder og hindre dem i å ødelegge løsningen.

seg-4e7034acccc0 = Deteksjon av spoofing og meaconing; Tillitsvurdering av mottakerlogg; Integritetsovervåking og beskyttelsesnivåer

seg-d5fdef2a78f2 = Kshana scorer detektorer og monitorer den modellerer eller kjører over en logg; om et produkts egen kildeutelatelse virker, krever produktets interne tilstand, ikke bare loggen.

seg-e3ea1208fac9 = Nivå { "2" }, krav { "5" }

seg-c0219254fe8e = Gjenopprett kilder og systemet automatisk uten å avbryte utdataene; en løsning leveres fortsatt under trusselen, muligens med ubegrenset forringelse.

seg-3dd48cb65cb4 = Holdover og coasting; Tillitsvurdering av mottakerlogg

seg-0c36c4a3eb4e = Holdover-kjøringer avgrenser modellert drift for en oppgitt klokke- eller treghetsmodell, ikke produktets egen gjenopprettingsatferd.

seg-befbf4b94876 = Nivå { "3" }, krav { "6" }

seg-45410d1675be = Korrupte data fra én kilde må ikke forurense en annen kilde.

seg-ff808ce8ec48 = Alternative og mangfoldige PNT-kilder

seg-ccf628643110 = Kshana kjører kilder side om side; kildeisolasjon inne i et produkt krever designgjennomgang eller feilinjeksjon i produktet.

seg-a1d5a3125697 = Nivå { "3" }, krav { "7" }

seg-db149ea618dd = Krysskontroller løsningene fra alle kilder, og hold forringelsen under en trussel begrenset.

seg-4afa05ef42fa = Integritetsovervåking og beskyttelsesnivåer; Holdover og coasting; Alternative og mangfoldige PNT-kilder

seg-8b1f938c0175 = Begrenset forringelse vises for de modellerte sensorene; produktets egen krysskontroll observeres ikke.

seg-772244881e5b = Nivå { "4" }, krav { "8" }

seg-aff5161e6363 = Bruk kilder med ulike teknologier mot fellesmodustrusler, uten forringelse under trusselen.

seg-587889f9881c = Alternative og mangfoldige PNT-kilder; Effekter av jamming på linkbudsjettet

seg-65b96caf8d6b = Et fellesmodusargument krever det virkelige produktets kildesett og en trussel som spenner over dem; et scenario oppgir én, det beviser ikke at produktet ikke har noen felles svakhet.

seg-3c4cc0793454 = Seksjon { "5.5" } (fellesmodus)

seg-a87c9808dd99 = Ulike mekanismer må ikke dele en svakhet: for eksempel slår en jammer som dekker to bånd ut båndmangfoldet.

seg-c10ba3bb01be = Effekter av jamming på linkbudsjettet; Resiliensscoring over trusselensembler; Alternative og mangfoldige PNT-kilder

seg-843fe2fc9e33 = Scoringen bruker et syntetisk trusselensemble, oppgitt som sådan; det er ikke feltdata.

seg-3158e7efd1a5 = Seksjonene { "8.1" } til { "8.3" } (evaluering)

seg-3942d9cdc64b = Evalueringen kombinerer statisk analyse med dynamisk analyse, der testvektorer representerer trusler; testklassene er kildesvikt, interferens og interne feil. Simulatorer nevnes som testmetode.

seg-9d5c297c1ab9 = Tillitsvurdering av mottakerlogg; Effekter av jamming på linkbudsjettet; Deteksjon av spoofing og meaconing

seg-bb02568e8f8f = Eksportert bevegelse og eksporterte hendelser kan drive en laboratoriesimulator (docs/TEST-BENCH.md). Kshana skriver ikke noe signal, så simulatoren og dens autoriserte operatør leverer trusselen.

seg-b81625e9e071 = Seksjon { "8.6" } (elementer i testplanen)

seg-27d645a79672 = En testplan oppgir nivået, kravet, inndataene, referansene, nødvendig datatilgang, prosedyren med kriterier for bestått eller ikke bestått, resultatene og merknader.

seg-1f2898855ccc = Reproduserbart opphav for kjøringer; Tillitsvurdering av mottakerlogg

seg-d8b08da48cb2 = Kriteriene for bestått eller ikke bestått velges av den som vurderer; Kshana registrerer inndataene, terskelene og hashene den kjørte med.

seg-ccfdf53a1e54 = <s1>Forrige</s1>Compliance-kobling

seg-260ba950eb89 = <s1>Neste</s1>IMO-veiledning for skip
