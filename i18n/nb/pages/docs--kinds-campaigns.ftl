# docs--kinds-campaigns: translations (nb)

seg-b03d56f501c3 = Type

seg-a07990e776cb = Kampanje: eksisterende scenariotyper satt sammen til én kjøring, der hvert tall er lest fra en reell kjøring av den navngitte typen. Fire deler, i en hvilken som helst kombinasjon. PHASES: et lenket oppdrag på én felles tidslinje -- hver fase kjører ett eller flere scenarioer (for eksempel jamming, deretter spoofing, deretter en klokke i holdover med et treghetsnavigasjonssystem som glir ved siden av, deretter en integritetsalarm, deretter gjenoppretting), utdataene leses inn i navngitte kanaler (klokkens tidsfeil mot sin vaktgrense, bærebølge-til-støytetthetsforhold mot sporingsgulvet, beskyttelsesnivå mot varslingsgrensen, posisjonsfeil, satellitter som spores, alarmflagg) ved en forhåndsinnstilling per type eller ved eksplisitte resultatstier, og resamples på et felles rutenett med null-ordens holdning, med fasegrenser og hendelser; tilstand føres videre ved carry (en kanal fortsetter fra forrige fases sluttverdi), handoff (et tall fra forrige fase skrives inn i denne fasens scenario) og end_at (en fase slutter på et tidspunkt en kjøring beregnet, for eksempel en spoofing-monitors deteksjonstid). SWEEP: et rutenett over én til tre punktnotasjonsnøkler i scenarioet for en hvilken som helst type (et heltallssegment indekserer en liste av tabeller, som i system.2.sisre_m), med metrikker lest ved resultatsti og, med flere enn én kjøring, et seedet Monte Carlo-ensemble i hver node. MONTE_CARLO: realisering k kjøres ved base_seed + k; hver metrikk rapporterer gjennomsnitt, standardavvik, nærmeste-rang 5.-/50.-/95.-persentiler og et bootstrap-konfidensintervall på { "95" }% med fast seed for gjennomsnittet. COMPOSE: flere scenarioer under felles verdier (én jammers effekt og posisjon skrevet inn i en maritim mottaker og en veimottaker), med en samlet beste/verste oppsummering. Resultatet inneholder en kampanje-hash, en digest over alle medlemsresultater og en enhetsoppføring for hvert utsendt tall; interoperabilitetseksportene skriver hvert medlemsscenario som har geometri som et eget filsett. Sammensetningsidentiteter er testet: en kampanje med én fase gjengir den frittstående kjøringen bit for bit, et ensemble med fast seed er byte-stabilt, og på en klokke med hvit frekvensstøy faller ensemblets gjennomsnitt inne i det rapporterte intervallet med en spredning som stemmer med sqrt(q_wf * tau). MODELLED: den additive carry-en og null-ordens holdning er modelleringsvalg, og hver fase har etiketten til typen som kjørte den.

seg-b2c7cd1f9712 = Diagrammet motoren skriver for scenarios/campaign-sweep-jammer-power.toml, typen campaign

seg-ea93f81fa08b = Kilde: <c1/>

seg-7f8e8af56bc0 = Kampanjer (scenariotypefamilie)

seg-c8012ee549ea = { "1" } scenariotype i motoren v{ $version }. Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en safety-of-life-tjeneste. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett oppnås: README-ens Evidence-avsnitt).

seg-09ed7c4e175c = Temasider: <a1>CAMPAIGNS</a1>. Kjør én: <c1/>. Alle familier: <a2>KINDS.md</a2>.

seg-b49ec180e810 = Kontaktark over diagrammene motoren skriver for typene i familien Kampanjer

seg-4e31c8daf798 = Register

seg-b2016159c9d0 = Kampanje: eksisterende scenariotyper satt sammen til én kjøring, der hvert tall er lest fra en reell kjøring av den nevnte typen.

seg-25148644a262 = Obligatoriske felt: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>.

seg-e0334a6899b6 = <b>Register:</b> MODELLED. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>campaign</a1>.

seg-906f63ffbc30 = <s1>Forrige</s1>Retningslinjer for oppførsel

seg-cdf23ced49bd = <s1>Neste</s1>Klokker, tidssynkronisering og holdover
