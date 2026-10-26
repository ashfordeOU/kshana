# docs--kind-lunar-vlbi-fim: translations (nb)

seg-b054c73f22e5 = ingen verdi

seg-98151954f217 = false

seg-1f17ef6a853e = Scenariotype i motoren v{ $version }, familie <a1>Måne og cislunart rom</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en sikkerhetskritisk tjeneste for menneskeliv. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett fortjenes: Evidens-avsnittet i README).

seg-1c1eeb2dcaa0 = Familieside: <a1>Måne og cislunart rom</a1>

seg-57cd9c415e31 = MODELLED { "3" } · VALIDATED { "2" }: radene i <a1>verifikasjonsmatrisen</a1> som nevner denne typen.

seg-3319b18ac61f = og { "1" } til i matrisen.

seg-2595bd629ffb = <b>MODELLED</b> Helmert-datumet med sju parametere propagert fra en SIMULERT OBSERVASJONSKAMPANJE i stedet for gjenfunnet fra en injisert transformasjon.

seg-7ecec8d27f50 = Kilde: <c1/>

seg-d54e29b7bc80 = <c1/> (scenariotype)

seg-1bc37634ba9f = Kovarians for stasjonskoordinater med lunar VLBI: delay-partialene til lunar-vlbi-observabelen akkumulert over en eksplisitt TIDSPLAN (grunnlinjer x epoker) til en Fisher-informasjonsmatrise, invertert og rapportert som kovariansen for stasjonskoordinatene og sigma per koordinat for stasjonen — en beregnet motorutdata i stedet for en skalar delay-presisjon skjøvet gjennom en antatt isotrop ekvipartisjonsfaktor g = { "3" }. Tilstanden bærer JORDFASTE (ITRS) stasjonskoordinater, så Jacobi-matrisen er den inertiale partialen rotert med hver epokes GCRS->ITRS-matrise: Jordens rotasjon er det som gjør disse koordinatene observerbare, og rapporten MÅLER sveipet av siktlinjen i jordfast system og bakens deklinasjon i stedet for å anta dem. Én observasjon er ett par (grunnlinje, epoke) med BEGGE stasjoner over høydemasken, vektet 1/delay_sigma_s^{ "2" }. Rapporterer rang, datumdefekt, kondisjonstall, hele informasjonsspekteret, kovariansmatrisen, sigma per stasjon per akse og i 3D, og nullrommet for det frie nettverket ved hver kjøring; ved rangmangel publiseres hovedsigmaen som NULL med en status, aldri lest ut av en nesten singulær invers. Ekvipartisjonsverdien c<em>delay_sigma_s</em>sqrt(g/N) for SAMME tidsplan gis ut ved siden av den beregnede verdien med forholdstallet, sammen med den isotrope sporgrensen sqrt(p/trace(M)) som AM-HM gjør til et hardt gulv — så forholdstallet er anisotropien antakelsen forkastet. Delay-lukkingen tau_ik = tau_ij + tau_jk gjør bare n-1 av de n(n-1)/2 grunnlinjene geometrisk uavhengige; rapporten oppgir begge antallene. MODELLED: månesentrumsefemeriden, stasjonsklokkene, troposfæren og jordorienteringsparameterne holdes FASTE og observasjonene behandles som uavhengige, så kovariansen er en Cramer-Rao-grense for et redusert parametersett, ikke et forutsagt øktresultat; delay-sigma, stasjonskoordinatene og tidsplanen er inngangsverdier. Partialen som geometrisk-delay-Jacobi-matrisen utelater (det differensierte Shapiro-leddet) måles med finite differanse og gis ut. Ikke et geodetisk produkt.

seg-4df72c1b921e = Én kjøring av <c1/> oppsummeres slik: lunar-vlbi-fim | { "3" } stasjoner / { "3" } grunnlinjer x { "49" } epoker = { "16" } obs (maske { "10.0" } deg) | datum anchor-first-station | rang 6/6 cond { "2.209e4" } | stasjonssigma { "0.0926" } m mot ekvipartisjon g={ "3" } { "0.0013" } m (forhold { "71.360" })

seg-f0dabe1b061b = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>

seg-fabf305ae1de = Eksempelet <c1/> setter blant annet:

seg-7b0f433d1d63 = sigma = c * delay_sigma_s * (beacon_rang

seg-8b098bf1df6b = Resultatetikett (motorens egen): MODELLED kovarians for stasjonskoordinater med lunar VLBI. Kovariansen akkumuleres fra motorens egne analytiske delay-partialer over en eksplisitt tidsplan av grunnlinjer og epoker og inverteres; den er IKKE omregnet fra en skalar delay-presisjon med en antatt geometrifaktor. Delay-sigma per observasjon

seg-19c383444296 = Diagrammet motoren skriver for scenarios/lunar-vlbi-fim.toml, type lunar-vlbi-fim

seg-d1a6a5086102 = <b>VALIDATED</b> Delay-partialer akkumulert over en tidsplan av grunnlinjer × epoker til en Fisher-informasjonsmatrise, invertert til kovariansen for stasjonskoordinatene og sigma per koordinat for stasjonen, og erstatter en antatt isotrop ekvipartisjonslink fra en

seg-55ce02ad5dd5 = <b>MODELLED</b> Et tredje datumvalg, <c1/>, som holder hver jordstasjon fast og estimerer BAKENS månefaste koordinater alene — konfigurasjonen en usikkerhet for et overflatepunkt på månen faktisk oppgis for, siden koordinater for jordstasjoner

seg-811a412b40b6 = <b>VALIDATED</b> Kovariansen for bake med alle stasjoner faste i scenarioet lunar-vlbi-fim (hver jordstasjon holdt fast, bakens månefaste koordinater estimert alene) med bakken plassert på JPL DE440-Månen lest av motorens egen kjernelser

seg-a731b913bdf0 = <b>VALIDATED</b> Delay-partialer akkumulert over en tidsplan av grunnlinjer × epoker til en Fisher-informasjonsmatrise, invertert til kovariansen for stasjonskoordinatene og sigma per koordinat for stasjonen. Uavhengig referanse (ExternalDataset): En uavhengig vei i samme repo. Hver Jacobi-rad utledes på nytt ved sentral finite differanse av lunar_vlbi::vlbi_delay_s evaluert fra tilstandens egne jordfaste og månefaste koordinater rotert fremover gjennom referansesystemkjeden — en vei som ikke beregner noen derivert og ikke deler noe uttrykk med de analytiske partialene — og informasjonsmatrisene de to veiene bygger stemmer til < { "1e-6" } av den største diagonalen. Den

seg-2300ffd9fc4e = <b>MODELLED</b> Et tredje datumvalg, <c1/>, som holder hver jordstasjon fast og estimerer BAKENS månefaste koordinater alene — konfigurasjonen en lu. Uavhengig referanse (ReferenceImpl): Lukkede identiteter, uten at noen ekstern uavhengig referanse hevdes eller finnes. Spaken kontrolleres mot ρ/B og de to ekvipartisjonsformene mot hverandre til { "1e-15" } — algebraiske identiteter, så de fanger en koblingsfeil og ingenting annet, og er merket som det. Det vesentlige resultatet er MÅLT i stedet for påstått: en delay fra en fast grunnlinje begrenser bakens RETNING, så siktlinjekomponenten rea

seg-2cbf700a234e = MODELLED kovarians for stasjonskoordinater med lunar VLBI. Kovariansen akkumuleres fra motorens egne analytiske delay-partialer over en eksplisitt tidsplan av grunnlinjer og epoker og inverteres; den er IKKE omregnet fra en skalar delay-presisjon med en antatt geometrifaktor. Delay-sigma per observasjon, stasjonskoordinatene, bakestedet og tidsplanen er inngangsverdier. Månesentrumsefemeriden, stasjonsklokkene (resultat <c1/>)

seg-8f63c3e774e2 = Kovarians for stasjonskoordinater med lunar VLBI: delay-partialene til lunar-vlbi-observabelen akkumulert over en eksplisitt TIDSPLAN (grunnlinjer x epoker) til en Fisher-informasjonsmatrise, invertert og rapportert som kovariansen for stasjonskoordinatene og sigma per koordinat for stasjonen — en beregnet motorutdata i stedet for en skalar delay-presisjon skjøvet gjennom en antatt isotrop ekvipartisjonsfaktor g = { "3" }. (typekatalog (<c1/>))

seg-d09b166842d5 = Tilstanden bærer JORDFASTE (ITRS) stasjonskoordinater, så Jacobi-matrisen er den inertiale partialen rotert med hver epokes GCRS->ITRS-matrise: Jordens rotasjon er det som gjør disse koordinatene observerbare, og rapporten MÅLER sveipet av siktlinjen i jordfast system og bakens deklinasjon i stedet for å anta dem. (typekatalog (<c1/>))

seg-bb7ff1e5d99f = Ekvipartisjonsverdien c<em>delay_sigma_s</em>sqrt(g/N) for SAMME tidsplan gis ut ved siden av den beregnede verdien med forholdstallet, sammen med den isotrope sporgrensen sqrt(p/trace(M)) som AM-HM gjør til et hardt gulv — så forholdstallet er anisotropien antakelsen forkastet. (typekatalog (<c1/>))

seg-0ed4495d4488 = MODELLED: månesentrumsefemeriden, stasjonsklokkene, troposfæren og jordorienteringsparameterne holdes FASTE og observasjonene behandles som uavhengige, så kovariansen er en Cramer-Rao-grense for et redusert parametersett, ikke et forutsagt øktresultat; delay-sigma, stasjonskoordinatene og tidsplanen er inngangsverdier. (typekatalog (<c1/>))

seg-4df6e3981cc4 = D3s publiserte kjede går fra en delay-presisjon per observasjon til en usikkerhet i stasjonskoordinater gjennom en antatt ISOTROP ekvipartisjonsfaktor g = { "3" }. Det steget er det artikkelens eget sammendrag kaller modellert i stedet for målt. Dette scenarioet fjerner det: delay-partialene til lunar VLBI akkumuleres over en virkelig tidsplan av (grunnlinje x epoke)-par til en Fisher-informasjonsmatrise, inverteres og rapporteres som (kommentar i scenariofilen, linje { "3" } til { "8" })

seg-489b93ca0f7f = Tilstanden bærer JORDFASTE (ITRS) koordinater, så Jacobi-matrisen er den inertiale partialen rotert med hver epokes GCRS->ITRS-matrise: Jordens rotasjon er det som gjør disse koordinatene observerbare i det hele tatt, og rapporten MÅLER sveipet av siktlinjen i jordfast system og bakens deklinasjon i stedet for å anta dem. Én observasjon er ett par (grunnlinje, epoke) med BEGGE stasjoner over høydemasken, vektet 1/delay (kommentar i scenariofilen, linje { "10" } til { "14" })

seg-efb5719364af = Hva du bør lese i rapporten * sigma per stasjon per akse og i 3D — det beregnede svaret; * ekvipartisjonsverdien c<em>delay_sigma_s</em>sqrt(g/N) for SAMME tidsplan, skrevet ut ved siden av med forholdstallet. Det forholdstallet ER anisotropien antakelsen forkastet, og den isotrope sporgrensen sqrt(p/trace(M)) gjør AM-HM til et hardt gulv, så antakelsen alltid bare kan undervurdere; * rang, datumdefekt, kondisjonstall, hele sp (kommentar i scenariofilen, linje { "16" } til { "26" })

seg-96c1a129aeae = <s1>Forrige</s1>lunar-time-offset

seg-199d98630271 = <s1>Neste</s1>lunar-vlbi
