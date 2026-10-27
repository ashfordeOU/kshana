# docs--kind-ntn-positioning: translations (nl)

seg-3068552e4ab4 = VALIDATED: de rijen van de <a1>verificatiematrix</a1> die dit kind noemen.

seg-cb91473bfdda = Onderwerppagina: <a1>LEO-PNT.md</a1>

seg-a3697ad561db = Hz

seg-a849735fcc6e = Onderwerppagina: <a1>LEO-PNT-FUSION.md</a1>

seg-49964654d5f4 = Scenariosoort van de engine v{ $version }, familie <a1>Navigatie in een lage baan om de aarde</a1>. Adviserend: uitvoer van een analyse door een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen safety-of-life-dienst. Elk label hier is van de engine of van de verificatiematrix; een soort is MODELLED tenzij de matrix anders vermeldt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-c5478f572d21 = Familiepagina: <a1>Navigatie in een lage baan om de aarde</a1>

seg-8dcdfc5da900 = Bron: <c1/>

seg-d865fd8ceef6 = <c1/> (scenariosoort)

seg-4f0edb786a35 = Positiebepaling vanuit een 5G-downlink van een niet-terrestrisch netwerk (NTN) in de S-band van de mobiele satellietdienst (MSS) (3GPP-band n256, downlink { "2170" } tot { "2200" } MHz; standaarddraaggolf { "2172.5" } MHz): de Cramér-Rao-grens (CRB) op de aankomsttijd, c / ({ "2" } pi beta sqrt({ "2" } (C/N0) T)) met beta de kwadratisch gemiddelde (Gabor-)bandbreedte van het vlakke OFDM-spectrum (B/sqrt({ "12" })), en op de Doppler van een complexe toon, sqrt({ "3" } / ({ "2" } pi^{ "2" } (C/N0) T^{ "3" })), voor elk signaal (standaard een New Radio-kanaal van { "5" } MHz met { "4.5" } MHz bezet en een smalbandkanaal van { "200" } kHz met { "180" } kHz bezet); vervolgens, over een willekeurige LEO-constellatie, downlink-positiebepalingen met aankomsttijd en een onbekende ontvangerklok (met seed, met de grens plus een synchronisatiefout van het netwerk als sigma), hun PDOP en formele 3D-sigma, en een Doppler-positiebepaling met één satelliet over de langste passage met vastgehouden hoogte. MODELLED: de stap van bandbreedte naar grens is de gangbare gesloten vorm uit de leerboeken, gecontroleerd aan de hand van numerieke integratie van het vlakke en het bandbegrensde BPSK-spectrum (interne consistentie, geen gepubliceerd uitgewerkt cijfer vastgelegd), en de nauwkeurigheid van de positiebepaling is een grens op een kanaal zonder multipath met een vermelde synchronisatiefout, geen behaald resultaat.

seg-fea5da29df00 = Eén run van <c1/> vat samen als: 5G NTN-positiebepaling op { "2172.5" } MHz, C/N0 { "38" } tot { "50" } dB-Hz, { "324" } satellieten ({ "10.0" } in zicht) NR { "5" } MHz: { "4500" } kHz, CRB-bereik { "0.26" } tot { "1.03" } m; mediaan formeel 3D { "2.09" } m, RMS-fout { "2.01" } m NB { "200" } kHz: { "180" } kHz, CRB-bereik { "6.49" } tot { "25.85" } m; mediaan formeel 3D { "25.94" } m, RMS-fout { "26.73" } m Doppler-passage met één satelliet: { "53" } samples over { "520" } s, horizontale fout { "1.9" } m

seg-145582d62c8c = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>

seg-7ff965e77d23 = Het voorbeeld <c1/> stelt onder meer in:

seg-409755afa2dd = NR { "5" } MHz

seg-a99a71f7178a = NB { "200" } kHz

seg-d04c7f65307d = index

seg-3a0cde9988c3 = Resultaatlabel (van de engine): MODELLED positiebepaling uit Cramér-Rao-grenzen: de stap van bandbreedte naar grens is een gangbare gesloten vorm uit de leerboeken (gecontroleerd aan de hand van numerieke integratie, niet aan een gepubliceerd uitgewerkt cijfer); de nauwkeurigheid is een grens op een kanaal zonder multipath met een vermelde synchronisatiefout, geen behaald resultaat

seg-c200240dd65e = De grafiek die de engine schrijft voor scenarios/ntn-5g-positioning.toml, soort ntn-positioning

seg-056b5f3c8201 = <b>VALIDATED</b> De Cramér-Rao-grens op de aankomsttijd uit de kwadratisch gemiddelde (Gabor-)bandbreedte, c/({ "2" } pi beta sqrt({ "2" } (C/N0) T)), voor een vlak OFDM-spectrum (beta = B/sqrt({ "12" })), een bandbegrensd BPSK-spectrum (teller in gesloten vorm) of een willekeurig spectrum via quadr Tests: <a1>leo_fusion_scenarios.rs</a1>.

seg-c188cecaf468 = <b>VALIDATED</b> De Cramér-Rao-grens op de aankomsttijd uit de kwadratisch gemiddelde (Gabor-)bandbreedte, c/({ "2" } pi beta sqrt({ "2" } (C/N0) T)), voor een vlak OFDM-spectrum (beta = B/sqrt({ "12" }). Onafhankelijke referentie (ExternalDataset): gepubliceerde uitgewerkte waarden (P1): Bachl, Lei en Nabeel, arXiv:{ "2608.10270" } ({ "2026" }), grenzen voor één SSB van NR NTN, gereproduceerd uit de 3GPP TS { "38.211" } SSB-afbeelding met de eigen numerieke functies van Kshana (W_rms { "1.9616" } tegenover { "1.96" } MHz, sigma_t { "38.755" } tegenover { "39" } us, sigma_f 100.79/87.28 tegenover 101/87 Hz, sigma_rho 0.5970/0.5831 tegenover 0.60/0.58 m, elk binnen een halve eenheid van het afgedrukte laatste cijfer); Betz { "2001" } Tabel { "1" } kwadratisch gemiddelde bandbreedten van BPSK-R (1.128/3.477 tegenover

seg-baa462153341 = MODELLED positiebepaling uit Cramér-Rao-grenzen: de stap van bandbreedte naar grens is een gangbare gesloten vorm uit de leerboeken (gecontroleerd aan de hand van numerieke integratie, niet aan een gepubliceerd uitgewerkt cijfer); de nauwkeurigheid is een grens op een kanaal zonder multipath met een vermelde synchronisatiefout, geen behaald resultaat (resultaat <c1/>)

seg-c4a9693d1191 = MODELLED: de stap van bandbreedte naar grens is de gangbare gesloten vorm uit de leerboeken, gecontroleerd aan de hand van numerieke integratie van het vlakke en het bandbegrensde BPSK-spectrum (interne consistentie, geen gepubliceerd uitgewerkt cijfer vastgelegd), en de nauwkeurigheid van de positiebepaling is een grens op een kanaal zonder multipath met een vermelde synchronisatiefout, geen behaald resultaat. (soortencatalogus (<c1/>))

seg-e23e35aa1203 = De stap van bandbreedte naar grens is een gangbare gesloten vorm uit de leerboeken; de nauwkeurigheid van de positiebepaling is MODELLED (een grens op een kanaal zonder multipath, geen behaald resultaat). (opmerking in het scenariobestand, regels { "12" } tot { "13" })

seg-ccb921bf73b5 = <s1>Vorige</s1>moonlight-service-volume

seg-467bd80c37f8 = <s1>Volgende</s1>oem-interop
