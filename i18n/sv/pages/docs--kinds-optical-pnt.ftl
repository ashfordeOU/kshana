# docs--kinds-optical-pnt: translations (sv)

seg-b03d56f501c3 = Typ

seg-e6839b50b560 = MODELLED heterogent gemensamt kvalitetsmått för optisk + RF PNT (P5): sätter ihop den tvåvägs optiska länkbudgeten för { "1550" } nm (fotonbegränsad tvåvägsavståndsmätning CRLB σ_τ/√N och diffraktionsfotavtryck λ/D·avstånd), en korsmodal RAIM-skyddsnivå med lösningsseparation (position OCH tidssynkronisering) som fusionerar de lösa RF-lösningarna och de täta optiska lösningarna med olikartade kovarianser, den optiska tillgängligheten vid klar himmel för N stationer (oberoende union { "1" }−Π({ "1" }−a_i) och en rumsligt korrelerad variant), en överlämning av tillstånd/kovarians mellan optik och RF med ett BEVISAT bitkontinuerligt (hoppfritt) medelvärde och en NEES χ²-konsistensspärr, samt ett gemensamt poängtal P(tillgänglig OCH precisionsklass OCH integritetssäkrad) med korrelationshantering. VALIDATED sluten form: avstånds-CRLB, diffraktionsfotavtrycket, χ²-kvantilen för skyddsnivån, unionskombinatoriken, överlämningens medelvärdeskontinuitet + NEES-spärren och den gemensamma oberoende produkten. MODELLED: de optiska förlustfördelningarna, storleksordningarna för RF-/optisk σ, indata om molnklimatologi, korrelationerna och P_HMI-budgeten. Ingen certifierad tillgänglighets-/integritetsprodukt.

seg-5cea5229815e = Diagrammet som motorn skriver för scenarios/hybrid-optical-rf.toml, kind hybrid-optical-rf

seg-a878d9be65b7 = MODELLED optisk PNT genom atmosfären: för en optisk länk och en uppsättning markplatser med angivna molnklimat redovisas den våglängds- och elevationsberoende förlusten i klar luft (Kims sikt-lag plus Rayleigh), turbulenstillståndet enligt Hufnagel-Valley (Rytov-varians, scintillationsindex, gamma-gamma-parametrar, aperturmedelvärdesbildning), den väderstyrda tillgängligheten mot länkmarginalen (molnets optiska djup från ett log-normalt klimat för flytande vatten, geometrisk-optisk extinktion, oberoende turbulensfädning), den länkmarginal som behövs för målvärden på tillgänglighet, fördelningen av avbrottens varaktighet, tillväxten av tids- och avståndsfel per avbrott genom klockans holdover-modell, avståndskorrelerad tillgänglighet med platsdiversitet och vad-händer-om-vinster för förbättringstekniker (våglängd, mottagarapertur, adaptiv optik för minskad scintillation, extra marginal). VALIDATED som implementation av de angivna formlerna mot en oberoende mpmath-referens: Rytov-varians, scintillationsindex, gamma-gamma-fädningssannolikhet, aperturmedelvärdesfaktor, optiskt djup i moln och klar luft. MODELLED: varje väder-, teknik- och klockindata samt antagandena om oberoende och copula; ingen uppmätt tillgänglighetsregistrering har jämförts. Rådgivande analys, inte en certifierad tillgänglighets- eller navigeringsprodukt.

seg-4e2b759aff17 = Diagrammet som motorn skriver för scenarios/optical-atmosphere-network.toml, typ optical-atmosphere

seg-4e31c8daf798 = Register

seg-963749981a7c = Källa: <c1/>

seg-079c8b284c44 = Optisk PNT (familj av scenariotyper)

seg-6dea687b727b = { "2" } scenariotyper i motorn v{ $version }. Rådgivande: analysresultat från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här kommer från motorn eller verifieringsmatrisen; en typ är MODELLED om inte matrisen anger något annat (hur en etikett förtjänas: avsnittet Evidence i README).

seg-d019c8511f48 = Ämnessidor: <a1>OPTICAL-ATMOSPHERE</a1>. Kör en: <c1/>. Alla familjer: <a2>KINDS.md</a2>.

seg-b8f937411028 = Kontaktark med de diagram som motorn skriver för typerna i familjen Optisk PNT

seg-76131e6805e5 = MODELLED optisk PNT genom atmosfären: för en optisk länk och en uppsättning markstationer med angivna molnklimat redovisar den den våglängds- och elevationsberoende förlusten i klar luft (Kim-sikt

seg-55725043f48e = MODELLED heterogen gemensam kvalitetsfigur för optisk + RF PNT (P5): sätter ihop den tvåvägs optiska länkbudgeten vid { "1550" } nm (fotonbegränsad tvåvägs avståndsmätning med CRLB σ_τ/√N och diffraktionsavtryck λ/D·avstånd), en

seg-5e658f01d9f4 = HETEROGENEOUS (resultatetikett)

seg-750466e3188c = Obligatoriska fält: inga. Valfria: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

seg-9e3ce423c0b9 = <b>Register:</b> MODELLED. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>optical-atmosphere</a1>.

seg-93f5d0527850 = Obligatoriska fält: inga. Valfria: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>, <c36/>, <c37/>, <c38/>, <c39/>, <c40/>, <c41/>, <c42/>, <c43/>.

seg-6a6f8eea5767 = <b>Register:</b> ingen matrisrad nämner den här typen; motorn etiketterar sitt eget resultat. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>hybrid-optical-rf</a1>.

seg-a4baaf1fbb8c = <s1>Föregående</s1>Uppdragsanalys, länkar och rymdoperationer

seg-48792381ba0b = <s1>Nästa</s1>Navigering för rymdanvändare
