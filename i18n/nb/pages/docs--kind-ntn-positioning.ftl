# docs--kind-ntn-positioning: translations (nb)

seg-3068552e4ab4 = VALIDATED: radene i <a1>verifikasjonsmatrisen</a1> som nevner denne typen.

seg-cb91473bfdda = Temaside: <a1>LEO-PNT.md</a1>

seg-a3697ad561db = Hz

seg-a849735fcc6e = Temaside: <a1>LEO-PNT-FUSION.md</a1>

seg-49964654d5f4 = Scenariotype i motoren v{ $version }, familie <a1>Navigasjon i lav jordbane</a1>. Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en safety-of-life-tjeneste. Hver etikett her kommer fra motoren eller verifikasjonsmatrisen; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett oppnås: avsnittet Evidence i README).

seg-c5478f572d21 = Familieside: <a1>Navigasjon i lav jordbane</a1>

seg-8dcdfc5da900 = Kilde: <c1/>

seg-d865fd8ceef6 = <c1/> (scenariotype)

seg-4f0edb786a35 = Posisjonering fra nedlenken i et 5G ikke-terrestrisk nett (NTN) i S-båndet for mobil satellitt-tjeneste (MSS) (3GPP-bånd n256, nedlenke { "2170" } til { "2200" } MHz; standard bærebølge { "2172.5" } MHz): Cramér-Rao-grensen (CRB) for ankomsttid, c / ({ "2" } pi beta sqrt({ "2" } (C/N0) T)) der beta er den kvadratiske middelverdien (Gabor) av båndbredden til det flate OFDM-spekteret (B/sqrt({ "12" })), og for Doppler til en kompleks tone, sqrt({ "3" } / ({ "2" } pi^{ "2" } (C/N0) T^{ "3" })), for hvert signal (som standard en New Radio-kanal på { "5" } MHz med { "4.5" } MHz belagt og en smalbåndskanal på { "200" } kHz med { "180" } kHz belagt); deretter, over en vilkårlig LEO-konstellasjon, posisjonsbestemmelser fra nedlenkens ankomsttid med en ukjent mottakerklokke (med seed, og med grensen pluss en synkroniseringsfeil i nettet som sigma), deres PDOP og formelle 3D-sigma, og en Doppler-posisjonsbestemmelse fra én satellitt over den lengste passeringen med høyden holdt fast. MODELLED: trinnet fra båndbredde til grense er den lærebokmessige lukkede formen, kontrollert mot numerisk integrasjon av de flate og båndbegrensede BPSK-spektrene (intern konsistens, ingen publisert regnet eksempelverdi festet), og posisjoneringsnøyaktigheten er en grense for en kanal uten flerveisutbredelse med en oppgitt synkroniseringsfeil, ikke et oppnådd resultat.

seg-fea5da29df00 = En kjøring av <c1/> oppsummeres slik: 5G NTN positioning at { "2172.5" } MHz, C/N0 { "38" } to { "50" } dB-Hz, { "324" } satellites ({ "10.0" } in view) NR { "5" } MHz: { "4500" } kHz, CRB range { "0.26" } to { "1.03" } m; median formal 3D { "2.09" } m, RMS error { "2.01" } m NB { "200" } kHz: { "180" } kHz, CRB range { "6.49" } to { "25.85" } m; median formal 3D { "25.94" } m, RMS error { "26.73" } m one-satellite Doppler pass: { "53" } samples over { "520" } s, horizontal error { "1.9" } m

seg-145582d62c8c = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>

seg-7ff965e77d23 = Eksempelet <c1/> angir blant annet:

seg-409755afa2dd = NR { "5" } MHz

seg-a99a71f7178a = NB { "200" } kHz

seg-d04c7f65307d = index

seg-3a0cde9988c3 = Resultatetikett (motorens): MODELLED posisjonering fra Cramér-Rao-grenser: trinnet fra båndbredde til grense er en lærebokmessig lukket form (kontrollert mot numerisk integrasjon, ikke mot en publisert regnet eksempelverdi); nøyaktigheten er en grense for en kanal uten flerveisutbredelse med en oppgitt synkroniseringsfeil, ikke et oppnådd resultat

seg-c200240dd65e = Diagrammet motoren skriver for scenarios/ntn-5g-positioning.toml, type ntn-positioning

seg-056b5f3c8201 = <b>VALIDATED</b> Cramér-Rao-grensen for ankomsttid fra den kvadratiske middelverdien (Gabor) av båndbredden, c/({ "2" } pi beta sqrt({ "2" } (C/N0) T)), for et flatt OFDM-spekter (beta = B/sqrt({ "12" })), et båndbegrenset BPSK-spekter (lukket form for telleren) eller et vilkårlig spekter ved kvadr Tester: <a1>leo_fusion_scenarios.rs</a1>.

seg-c188cecaf468 = <b>VALIDATED</b> Cramér-Rao-grensen for ankomsttid fra den kvadratiske middelverdien (Gabor) av båndbredden, c/({ "2" } pi beta sqrt({ "2" } (C/N0) T)), for et flatt OFDM-spekter (beta = B/sqrt({ "12" }). Uavhengig referanse (ExternalDataset): publiserte regnede verdier (P1): Bachl, Lei og Nabeel, arXiv:{ "2608.10270" } ({ "2026" }), grenser for enkelt SSB i NR NTN gjengitt fra 3GPP TS { "38.211" }-SSB-kartet gjennom Kshanas egne numeriske funksjoner (W_rms { "1.9616" } mot { "1.96" } MHz, sigma_t { "38.755" } mot { "39" } us, sigma_f 100.79/87.28 mot 101/87 Hz, sigma_rho 0.5970/0.5831 mot 0.60/0.58 m, alle innenfor en halv enhet av det trykte siste sifferet); Betz { "2001" } tabell { "1" } kvadratiske middelverdier av båndbredden for BPSK-R (1.128/3.477 mot

seg-baa462153341 = MODELLED posisjonering fra Cramér-Rao-grenser: trinnet fra båndbredde til grense er en lærebokmessig lukket form (kontrollert mot numerisk integrasjon, ikke mot en publisert regnet eksempelverdi); nøyaktigheten er en grense for en kanal uten flerveisutbredelse med en oppgitt synkroniseringsfeil, ikke et oppnådd resultat (resultat <c1/>)

seg-c4a9693d1191 = MODELLED: trinnet fra båndbredde til grense er den lærebokmessige lukkede formen, kontrollert mot numerisk integrasjon av de flate og båndbegrensede BPSK-spektrene (intern konsistens, ingen publisert regnet eksempelverdi festet), og posisjoneringsnøyaktigheten er en grense for en kanal uten flerveisutbredelse med en oppgitt synkroniseringsfeil, ikke et oppnådd resultat. (typekatalog (<c1/>))

seg-e23e35aa1203 = Trinnet fra båndbredde til grense er en lærebokmessig lukket form; posisjoneringsnøyaktigheten er MODELLED (en grense for en kanal uten flerveisutbredelse, ikke et oppnådd resultat). (kommentar i scenariofilen, linje { "12" } til { "13" })

seg-ccb921bf73b5 = <s1>Forrige</s1>moonlight-service-volume

seg-467bd80c37f8 = <s1>Neste</s1>oem-interop
