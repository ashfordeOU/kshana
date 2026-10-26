# docs--kind-lunar-vlbi-fim: translations (da)

seg-b054c73f22e5 = ingen værdi

seg-98151954f217 = false

seg-1f17ef6a853e = Scenarietype i motoren v{ $version }, familie <a1>Måne og cislunart rum</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: README'ens afsnit Evidence).

seg-1c1eeb2dcaa0 = Familieside: <a1>Måne og cislunart rum</a1>

seg-57cd9c415e31 = MODELLED { "3" } · VALIDATED { "2" }: rækkerne i <a1>verifikationsmatrixen</a1>, der nævner denne type.

seg-3319b18ac61f = og { "1" } flere i matrixen.

seg-2595bd629ffb = <b>MODELLED</b> Helmert-referencesystemet med syv parametre udbredt fra en SIMULERET OBSERVATIONSKAMPAGNE i stedet for gendannet fra en tilført transformation.

seg-7ecec8d27f50 = Kilde: <c1/>

seg-d54e29b7bc80 = <c1/> (scenarietype)

seg-1bc37634ba9f = Kovarians for stationskoordinater ved lunar VLBI: delay-partialerne for observablen lunar-vlbi akkumuleret over en eksplicit PLAN (baselines x epoker) til en Fisher-informationsmatrix, inverteret og rapporteret som kovariansen for stationskoordinaterne og sigma pr. koordinat for stationen — et beregnet motoroutput frem for en skalar delay-præcision skubbet gennem en antaget isotrop equipartition-faktor g = { "3" }. Tilstanden bærer JORDFASTE (ITRS) stationskoordinater, så Jacobi-matricen er det inertiale partial roteret med hver epokes GCRS->ITRS-matrix: Jordens rotation er det, der gør disse koordinater observerbare, og rapporten MÅLER det jordfaste sweep af sigtelinjen og fyrets deklination i stedet for at antage dem. Én observation er ét par (baseline, epoke), hvor BEGGE stationer er over elevationsmasken, vægtet 1/delay_sigma_s^{ "2" }. Rapporterer rang, datumdefekt, konditionstal, hele informationsspektret, kovariansmatrixen, sigma pr. station pr. akse og i 3D samt nulrummet for det frie net ved hver kørsel; ved rangdefekt offentliggøres hovedsigma som NULL med en status, aldrig aflæst fra en næsten singulær invers. Equipartition-værdien c<em>delay_sigma_s</em>sqrt(g/N) for SAMME plan udsendes ved siden af den beregnede værdi med forholdet, sammen med den isotrope sporgrænse sqrt(p/trace(M)), som AM-HM gør til et hårdt gulv — så forholdet er den anisotropi, som antagelsen kasserede. Delay-lukningen tau_ik = tau_ij + tau_jk gør kun n-1 af de n(n-1)/2 baselines geometrisk uafhængige; rapporten angiver begge antal. MODELLED: Måne-centrets efemeride, stationsure, troposfære og jordorienteringsparametre holdes FASTE, og observationer behandles som uafhængige, så kovariansen er en Cramer-Rao-grænse for et reduceret parametersæt, ikke et forudsagt sessionsresultat; delay-sigma, stationskoordinater og plan er input. Partialet, som Jacobi-matricen for den geometriske delay udelader (det differentierede Shapiro-led), måles ved differenskvotient og udsendes. Ikke et geodætisk produkt.

seg-4df72c1b921e = Én kørsel af <c1/> opsummeres som: lunar-vlbi-fim | { "3" } stations / { "3" } baselines x { "49" } epochs = { "16" } obs (mask { "10.0" } deg) | datum anchor-first-station | rank 6/6 cond { "2.209e4" } | station sigma { "0.0926" } m vs equipartition g={ "3" } { "0.0013" } m (ratio { "71.360" })

seg-f0dabe1b061b = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>

seg-fabf305ae1de = Eksemplet <c1/> sætter blandt andet:

seg-7b0f433d1d63 = sigma = c * delay_sigma_s * (beacon_rang

seg-8b098bf1df6b = Resultatmærkat (motorens egen): MODELLED kovarians for stationskoordinater ved lunar VLBI. Kovariansen akkumuleres fra motorens egne analytiske delay-partialer over en eksplicit plan af baselines og epoker og inverteres; den er IKKE omregnet fra en skalar delay-præcision med en antaget geometrifaktor. Delay-sigma pr. observation

seg-19c383444296 = Diagrammet, som motoren skriver for scenarios/lunar-vlbi-fim.toml, type lunar-vlbi-fim

seg-d1a6a5086102 = <b>VALIDATED</b> Delay-partialer akkumuleret over en plan af baselines × epoker til en Fisher-informationsmatrix, inverteret til kovariansen for stationskoordinaterne og sigma pr. koordinat for stationen, i stedet for et antaget isotropt equipartition-led fra en

seg-55ce02ad5dd5 = <b>MODELLED</b> Et tredje valg af datum, <c1/>, der holder hver jordstation fast og estimerer KUN FYRETs Måne-legemsfaste koordinater — den konfiguration, som usikkerheden for et punkt på månens overflade faktisk angives for, da jordstationernes koordinater

seg-811a412b40b6 = <b>VALIDATED</b> Kovariansen for fyret med alle stationer fastholdt i scenariet lunar-vlbi-fim (hver jordstation holdt fast, fyrets Måne-legemsfaste koordinater estimeret alene) med fyret placeret på JPL DE440-Månen læst af motorens egen kernelæser

seg-a731b913bdf0 = <b>VALIDATED</b> Delay-partialer akkumuleret over en plan af baselines × epoker til en Fisher-informationsmatrix, inverteret til kovariansen for stationskoordinaterne og sigma pr. koordinat for sta. Uafhængig reference (ExternalDataset): En uafhængig vej i selve repositoriet. Hver Jacobi-række udledes igen ved central differenskvotient af lunar_vlbi::vlbi_delay_s, evalueret ud fra tilstandens egne jordfaste og Måne-legemsfaste koordinater roteret fremad gennem kæden af referencesystemer — en vej, der ikke beregner nogen afledet og ikke deler noget udtryk med de analytiske partialer — og informationsmatricerne, som de to veje opbygger, stemmer til < { "1e-6" } af den største diagonal. De

seg-2300ffd9fc4e = <b>MODELLED</b> Et tredje valg af datum, <c1/>, der holder hver jordstation fast og estimerer KUN FYRETs Måne-legemsfaste koordinater — den konfiguration, som en lu. Uafhængig reference (ReferenceImpl): Identiteter i lukket form, uden at nogen ekstern uafhængig reference gøres gældende eller findes. Løftearmen kontrolleres mod ρ/B og de to equipartition-former mod hinanden til { "1e-15" } — algebraiske identiteter, så de fanger en ledningsfejl og intet andet og er mærket som sådan. Det væsentlige resultat er MÅLT frem for postuleret: en delay fra en fast baseline begrænser fyrets RETNING, så sigtelinjekomponenten rea

seg-2cbf700a234e = MODELLED kovarians for stationskoordinater ved lunar VLBI. Kovariansen akkumuleres fra motorens egne analytiske delay-partialer over en eksplicit plan af baselines og epoker og inverteres; den er IKKE omregnet fra en skalar delay-præcision med en antaget geometrifaktor. Delay-sigma pr. observation, stationskoordinaterne, fyrets sted og planen er input. Måne-centrets efemeride, stationsurene (resultat <c1/>)

seg-8f63c3e774e2 = Kovarians for stationskoordinater ved lunar VLBI: delay-partialerne for observablen lunar-vlbi akkumuleret over en eksplicit PLAN (baselines x epoker) til en Fisher-informationsmatrix, inverteret og rapporteret som kovariansen for stationskoordinaterne og sigma pr. koordinat for stationen — et beregnet motoroutput frem for en skalar delay-præcision skubbet gennem en antaget isotrop equipartition-faktor g = { "3" }. (kategori-katalog (<c1/>))

seg-d09b166842d5 = Tilstanden bærer JORDFASTE (ITRS) stationskoordinater, så Jacobi-matricen er det inertiale partial roteret med hver epokes GCRS->ITRS-matrix: Jordens rotation er det, der gør disse koordinater observerbare, og rapporten MÅLER det jordfaste sweep af sigtelinjen og fyrets deklination i stedet for at antage dem. (kategori-katalog (<c1/>))

seg-bb7ff1e5d99f = Equipartition-værdien c<em>delay_sigma_s</em>sqrt(g/N) for SAMME plan udsendes ved siden af den beregnede værdi med forholdet, sammen med den isotrope sporgrænse sqrt(p/trace(M)), som AM-HM gør til et hårdt gulv — så forholdet er den anisotropi, som antagelsen kasserede. (kategori-katalog (<c1/>))

seg-0ed4495d4488 = MODELLED: Måne-centrets efemeride, stationsure, troposfære og jordorienteringsparametre holdes FASTE, og observationer behandles som uafhængige, så kovariansen er en Cramer-Rao-grænse for et reduceret parametersæt, ikke et forudsagt sessionsresultat; delay-sigma, stationskoordinater og plan er input. (kategori-katalog (<c1/>))

seg-4df6e3981cc4 = D3's offentliggjorte kæde går fra en delay-præcision pr. observation til en usikkerhed på stationskoordinaterne gennem en antaget ISOTROP equipartition-faktor g = { "3" }. Det trin er det, som artiklens eget abstract kalder modelleret frem for målt. Dette scenarie fjerner det: lunar-VLBI-delay-partialerne akkumuleres over en reel plan af (baseline x epoke)-par til en Fisher-informationsmatrix, inverteres og rapporteres som (kommentar i scenariefilen, linje { "3" } til { "8" })

seg-489b93ca0f7f = Tilstanden bærer JORDFASTE (ITRS) koordinater, så Jacobi-matricen er det inertiale partial roteret med hver epokes GCRS->ITRS-matrix: Jordens rotation er det, der overhovedet gør disse koordinater observerbare, og rapporten MÅLER det jordfaste sweep af sigtelinjen og fyrets deklination i stedet for at antage dem. Én observation er ét par (baseline, epoke), hvor BEGGE stationer er over elevationsmasken, vægtet 1/delay (kommentar i scenariefilen, linje { "10" } til { "14" })

seg-efb5719364af = Hvad du skal læse i rapporten * sigma pr. station pr. akse og i 3D — det beregnede svar; * equipartition-værdien c<em>delay_sigma_s</em>sqrt(g/N) for SAMME plan, udskrevet ved siden af med forholdet. Det forhold ER den anisotropi, som antagelsen kasserede, og den isotrope sporgrænse sqrt(p/trace(M)) gør AM-HM til et hårdt gulv, så antagelsen kun kan undervurdere; * rang, datumdefekt, konditionstal, hele sp (kommentar i scenariefilen, linje { "16" } til { "26" })

seg-96c1a129aeae = <s1>Forrige</s1>lunar-time-offset

seg-199d98630271 = <s1>Næste</s1>lunar-vlbi
