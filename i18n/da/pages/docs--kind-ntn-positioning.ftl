# docs--kind-ntn-positioning: translations (da)

seg-3068552e4ab4 = VALIDATED: rækkerne i <a1>verifikationsmatrixen</a1>, som nævner denne type.

seg-cb91473bfdda = Emneside: <a1>LEO-PNT.md</a1>

seg-a3697ad561db = Hz

seg-a849735fcc6e = Emneside: <a1>LEO-PNT-FUSION.md</a1>

seg-8dcdfc5da900 = Kilde: <c1/>

seg-d865fd8ceef6 = <c1/> (scenarietype)

seg-4f0edb786a35 = Positionsbestemmelse ud fra en 5G-downlink i et ikke-terrestrisk netværk (NTN) i S-båndet for den mobile satellittjeneste (MSS) (3GPP-bånd n256, downlink { "2170" } til { "2200" } MHz; standardbærebølge { "2172.5" } MHz): Cramér-Rao-grænsen (CRB) for ankomsttid, c / ({ "2" } pi beta sqrt({ "2" } (C/N0) T)), hvor beta er den effektive (Gabor-)båndbredde for det flade OFDM-spektrum (B/sqrt({ "12" })), og for Doppler af en kompleks tone, sqrt({ "3" } / ({ "2" } pi^{ "2" } (C/N0) T^{ "3" })), for hvert signal (som standard en New Radio-kanal på { "5" } MHz med { "4.5" } MHz optaget og en smalbåndskanal på { "200" } kHz med { "180" } kHz optaget); derefter, over en vilkårlig LEO-konstellation, positionsbestemmelser ud fra downlinks ankomsttid med et ukendt modtagerur (med seed, hvor grænsen plus en synkroniseringsfejl i netværket er sigma), deres PDOP og formelle 3D-sigma samt en positionsbestemmelse med Doppler fra én satellit over det længste overflyv med højden holdt fast. MODELLED: trinnet fra båndbredde til grænse er den lærebogsagtige lukkede form, kontrolleret mod numerisk integration af de flade og båndbegrænsede BPSK-spektre (intern konsistens, ingen offentliggjort gennemregnet værdi fastlagt), og positionsnøjagtigheden er en grænse på en kanal uden flervejsudbredelse med en angivet synkroniseringsfejl, ikke et opnået resultat.

seg-fea5da29df00 = Én kørsel af <c1/> opsummeres som: 5G NTN-positionsbestemmelse ved { "2172.5" } MHz, C/N0 { "38" } til { "50" } dB-Hz, { "324" } satellitter ({ "10.0" } i sigte) NR { "5" } MHz: { "4500" } kHz, CRB-afstand { "0.26" } til { "1.03" } m; median af formel 3D { "2.09" } m, RMS-fejl { "2.01" } m NB { "200" } kHz: { "180" } kHz, CRB-afstand { "6.49" } til { "25.85" } m; median af formel 3D { "25.94" } m, RMS-fejl { "26.73" } m Doppler-overflyv med én satellit: { "53" } prøver over { "520" } s, horisontal fejl { "1.9" } m

seg-145582d62c8c = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>

seg-7ff965e77d23 = Eksemplet <c1/> angiver blandt andet:

seg-409755afa2dd = NR { "5" } MHz

seg-a99a71f7178a = NB { "200" } kHz

seg-d04c7f65307d = index

seg-3a0cde9988c3 = Resultatetiket (motorens egen): MODELLED positionsbestemmelse ud fra Cramér-Rao-grænser: trinnet fra båndbredde til grænse er en lærebogsagtig lukket form (kontrolleret mod numerisk integration, ikke mod en offentliggjort gennemregnet værdi); nøjagtigheden er en grænse på en kanal uden flervejsudbredelse med en angivet synkroniseringsfejl, ikke et opnået resultat

seg-c200240dd65e = Diagrammet, som motoren skriver for scenarios/ntn-5g-positioning.toml, type ntn-positioning

seg-056b5f3c8201 = <b>VALIDATED</b> Cramér-Rao-grænsen for ankomsttid ud fra den effektive (Gabor-)båndbredde, c/({ "2" } pi beta sqrt({ "2" } (C/N0) T)), for et fladt OFDM-spektrum (beta = B/sqrt({ "12" })), et båndbegrænset BPSK-spektrum (lukket form for tælleren) eller et vilkårligt spektrum ved kvadr Tests: <a1>leo_fusion_scenarios.rs</a1>.

seg-c188cecaf468 = <b>VALIDATED</b> Cramér-Rao-grænsen for ankomsttid ud fra den effektive (Gabor-)båndbredde, c/({ "2" } pi beta sqrt({ "2" } (C/N0) T)), for et fladt OFDM-spektrum (beta = B/sqrt({ "12" }). Uafhængig reference (ExternalDataset): offentliggjorte gennemregnede værdier (P1): Bachl, Lei og Nabeel, arXiv:{ "2608.10270" } ({ "2026" }), grænser for en enkelt SSB i NR NTN gengivet ud fra 3GPP TS { "38.211" }-SSB-kortet gennem Kshanas egne numeriske funktioner (W_rms { "1.9616" } mod { "1.96" } MHz, sigma_t { "38.755" } mod { "39" } us, sigma_f 100.79/87.28 mod 101/87 Hz, sigma_rho 0.5970/0.5831 mod 0.60/0.58 m, hver inden for en halv enhed af det trykte sidste ciffer); Betz { "2001" } Table { "1" } effektive båndbredder for BPSK-R (1.128/3.477 mod

seg-baa462153341 = MODELLED positionsbestemmelse ud fra Cramér-Rao-grænser: trinnet fra båndbredde til grænse er en lærebogsagtig lukket form (kontrolleret mod numerisk integration, ikke mod en offentliggjort gennemregnet værdi); nøjagtigheden er en grænse på en kanal uden flervejsudbredelse med en angivet synkroniseringsfejl, ikke et opnået resultat (resultat <c1/>)

seg-c4a9693d1191 = MODELLED: trinnet fra båndbredde til grænse er den lærebogsagtige lukkede form, kontrolleret mod numerisk integration af de flade og båndbegrænsede BPSK-spektre (intern konsistens, ingen offentliggjort gennemregnet værdi fastlagt), og positionsnøjagtigheden er en grænse på en kanal uden flervejsudbredelse med en angivet synkroniseringsfejl, ikke et opnået resultat. (typekatalog (<c1/>))

seg-e23e35aa1203 = Trinnet fra båndbredde til grænse er en lærebogsagtig lukket form; positionsnøjagtigheden er MODELLED (en grænse på en kanal uden flervejsudbredelse, ikke et opnået resultat). (kommentar i scenariefilen, linje { "12" } til { "13" })

seg-ccb921bf73b5 = <s1>Forrige</s1>moonlight-service-volume

seg-467bd80c37f8 = <s1>Næste</s1>oem-interop
