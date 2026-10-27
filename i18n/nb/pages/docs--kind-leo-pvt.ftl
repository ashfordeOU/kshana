# docs--kind-leo-pvt: translations (nb)

seg-7f5ad6ab8c23 = GPS

seg-b054c73f22e5 = ingen verdi

seg-cb91473bfdda = Temaside: <a1>LEO-PNT.md</a1>

seg-a849735fcc6e = Temaside: <a1>LEO-PNT-FUSION.md</a1>

seg-49964654d5f4 = Scenariotype i motoren v{ $version }, familie <a1>Navigasjon i lav jordbane</a1>. Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en safety-of-life-tjeneste. Hver etikett her kommer fra motoren eller verifikasjonsmatrisen; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett oppnås: avsnittet Evidence i README).

seg-c5478f572d21 = Familieside: <a1>Navigasjon i lav jordbane</a1>

seg-be21370c2446 = joint

seg-dfe64e82e4e9 = Kilde: <c1/>

seg-fdba999dab11 = <c1/> (scenariotype)

seg-093aac4b5ff1 = Fusjonert PNT (posisjonering, navigasjon og tidssynkronisering) i middels jordbane (MEO) og lav jordbane (LEO) over HVILKE SOM HELST konstellasjoner: hvert [[system]] er en GNSS-forhåndsinnstilling av typen constellation-design, en LEO-forhåndsinnstilling (xona-pulsar, iridium-stl, starlink-sop, centispace, generic-c-band, efemeridemodellen atomic-zero-clock, eller en annen forhåndsinnstillingsfil, hver i sin egen fil med kilder merket PUBLIC, WORKSHOP eller AVLEDET), Walker-skall eller eksplisitte elementsett, med en bærebølge, en chiprate, en envelope for bærebølge-til-støy-tetthet (C/N0) fra elevasjonsmasken til zenit, en signal-in-space range error (SISRE), en Doppler-sigma og en klokkemodell (sin egen mottakerklokke, slik at intersystembiasen estimeres, eller en kjent kringkastet forskyvning). Fire moduser. DOPPLER: batch Gauss-Newton-posisjonsbestemmelse fra avstandsrate med analytiske partielle deriverte, klokkedrift og valgfrie hastighetstilstander og en valgfri høydebegrensning, med én eller flere satellitter, feilen mot vindulengde, Doppler-, Doppler-rate- og jerk-envelopen for hvert LEO-system, og nøyaktigheten langs og på tvers av banen for én enkelt passering mot forskyvningen på tvers (feilen på tvers vokser uten grense når passeringen går rett over; en enkelt passering har også en speilløsning på tvers av bakkesporet). Et signal av anledning med kun Doppler (starlink-sop) kjøres her. JOINT: vektede minstekvadraters pseudoavstandsposisjoner per epoke fra kun GNSS, kun LEO og begge, sigma per måling fra en termisk støymodell for delay-lock-loop ved C/N0 pluss SISRE (eller en fast sigma, slik at en signalmodell kan mate dem), de estimerte intersystembiasene, og PDOP/HDOP/VDOP mot antall LEO-satellitter som legges til. POLAR: satellitter i sikte og DOP mot breddegrad for GNSS, LEO og begge. TIMING: tidsoverføring til koordinert universaltid (UTC) fra LEO-satellitter i en kjent posisjon med et klokkefilter med to tilstander der prosessstøyen kommer fra motorens oscillatorklasser, mot C/N0 og oscillatoren, og uttrykket i IS-GPS-200 for systemtid til UTC; med [timing] trace = true rapporterer hver rad også sin tidsfeil og predikerte sigma ved hver epoke. VALIDATED: den største Dopplerverdien for en passering fra rett over til horisonten mot de publiserte tallene for Iridium (opptil { "36" } kHz) og Xona Pulsar X1 ({ "32" } til { "34" } kHz). MODELLED: alt annet; DOP-en er kontrollert mot et håndutledet tilfelle, posisjonsbestemmelsene mot sin kovarians, og Doppler-modellen mot identiteten for avstandsakselerasjon.

seg-f34d4bbcac4d = Én kjøring av <c1/> oppsummeres slik: LEO PVT (joint) at { "61.10" }, { "6.60" } over { "1800" } s GPS gnss { "24" } sats at { "20182" } km, { "1575.42" } MHz Galileo gnss { "24" } sats at { "23222" } km, { "1575.42" } MHz Pulsar X5 leo { "258" } sats at { "1080" } km, { "1190.52" } MHz LEO ranging satellite in view on { "100.0" }% of epochs GNSS only availability { "1.000" }, median PDOP { "1.48" }, RMS 3D error { "1.29" } m LEO only availability { "1.000" }, median PDOP { "2.33" }, RMS 3D error { "0.69" } m fused availability { "1.000" }, median PDOP { "1.14" }, RMS 3D error { "0.63" } m

seg-e271a69236bf = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>

seg-f850cba7d96e = Eksemplet <c1/> setter blant annet:

seg-bb3b3e8be839 = fjord

seg-99a3c57c7926 = { "7" } medfølgende scenarioer bruker denne typen; de andre ligger i <a1><c1/></a1>.

seg-b43a7ee40372 = Resultatetikett (motorens): MODELLED felles vektet minstekvadraters pseudoavstandsposisjonering med én klokke per system eller en kjent forskyvning; støy fra delay-lock-loop-modellen ved C/N0-envelopen pluss signal-in-space range error

seg-90361a6f4e3c = Diagrammet motoren skriver for scenarios/leo-pvt-fjord-skyline.toml, typen leo-pvt

seg-57cd9c415e31 = MODELLED { "3" } · VALIDATED { "2" }: radene i <a1>verifikasjonsmatrisen</a1> som nevner denne typen.

seg-68aa305e05a4 = <b>VALIDATED</b> Eksakt avstandsrate for en satellitt der den jordfaste posisjonen og hastigheten kommer fra en todelegemebane med sekulær J2-drift og jordens rotasjon (leo_fusion::geom::EarthOrbit::state, hastigheten den eksakte tidsderiverte av posisjonen), Tester: <a1>leo_doppler_reference.rs</a1>.

seg-c3ef3e0163f2 = <b>MODELLED</b> Batch Gauss-Newton-posisjonsbestemmelse fra avstandsrate med analytiske partielle deriverte (d rho_dot / d r = -(I - u u^T)(v_s - v_u)/rho, d/dv = -u, d/d drift = { "1" }), en konstant brukerhastighet som valg, en høydepseudomåling for en overflatebruker, dempet s Tester: <a1>leo_fusion_scenarios.rs</a1>.

seg-a4e0166269ea = <b>MODELLED</b> Vektede minstekvadraters Gauss-Newton-posisjoner over enhver blanding av systemer, én mottakerklokke per system (intersystembiasen estimert sammen med posisjonen) eller en kjent kringkastet forskyvning på referansetidsskalaen; sigma per måling levert av Tester: <a1>leo_fusion_scenarios.rs</a1>.

seg-5c9f826efbc8 = <b>MODELLED</b> Klokkemålinger fra hver LEO-satellitt i sikte i en kjent posisjon, kombinert med invers varians fra pseudoavstandsstøymodellen, filtrert av et Kalman-filter med to tilstander (fase, frekvens) der prosessstøyen er oscillatorklassens w Tester: <a1>leo_fusion_scenarios.rs</a1>.

seg-3319b18ac61f = og { "1" } til i matrisen.

seg-f6bd93155e41 = <b>MODELLED</b> Vektede minstekvadraters Gauss-Newton-posisjoner over enhver blanding av systemer, én mottakerklokke per system (intersystembiasen estimert sammen med posisjonen) eller en kjent. Uavhengig referanse (InternalConsistency): En håndutledet DOP med fire satellitter (én satellitt i zenit og tre på horisonten { "120" } grader fra hverandre, hvis normalmatrise inverteres for hånd), den strukturelle identiteten at et system med sin egen klokke og én satellitt ikke tilfører noen geometri, støyfri gjenvinning av posisjon, klokke og bias, og seedede feil mot kovariansen. Kun interne kontroller; ikke sammenlignet med utdata fra en mottaker. { "0.30" } ekstern sammenligning, et funn

seg-4056b0470099 = <b>MODELLED</b> Systemagnostiske inndata: hvert system er Walker-skall, eksplisitte elementer eller en GNSS-forhåndsinnstilling, et signal (bærebølge, chiprate, båndbredde, mottatt effekt eller C/N0-område. Uavhengig referanse (InternalConsistency): Avskrift av de siterte offentlige verdiene, kontrollert for struktur (hver offentlige kilde har en URL, Walker-mønstre deler jevnt, C/N0 fra mottatt effekt over kT ved { "290" } K), ikke mot en ekstern uavhengig referanse. Representative verdier er navngitt i hver forhåndsinnstilling og er illustrative

seg-df745ccdaceb = MODELLED felles vektet pseudoavstandsposisjonering med minste kvadraters metode, med én klokke per system eller et kjent avvik; støy fra modellen for forsinkelseslåst sløyfe ved C/N0-omhyllingen pluss avstandsfeilen i signalet i rommet (resultat <c1/>)

seg-c988291eb41d = MODELLED: alt annet; DOP kontrolleres mot et håndutledet tilfelle, posisjonsbestemmelsene mot sin kovarians, og Doppler-modellen mot identiteten for avstandsakselerasjon. (typekatalog (<c1/>))

seg-be908356ad19 = Horisontforhåndsinnstillingen er REPRESENTATIVE (opphav i docs/SKYLINE.md og <c1/>): av størrelsesorden som bredden og relieffet i de dype vestnorske fjordene, ikke en oppmåling av noen fjord. Kun siktlinje: ingen diffraksjon, refleksjon eller mottak uten siktlinje. Fjern [skyline]-seksjonen for å sammenligne med åpen himmel. MODELLED. (kommentar i scenariofilen, linje { "15" } til { "18" })

seg-1d0ab26930e1 = Felles GNSS- og LEO-pseudoavstandsposisjonering med intersystembiaser og feilmodeller per signal er MODELLED, ikke validert: kontrollert mot sin egen lukkede/analytiske identitet; fanger opp avskrivings- og koeffisientfeil, men er ikke en uavhengig ekstern referanse. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-35916a8ac93e = Navngitte LEO-PNT-systemer som valgfrie datapreset-filer, hver med sin kilde, er MODELLED, ikke validert: kontrollert mot sin egen lukkede/analytiske identitet; fanger opp avskrivings- og koeffisientfeil, men er ikke en uavhengig ekstern referanse. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-6ac7dcc57b2a = <s1>Forrige</s1>leo-ppp

seg-458b3eda3250 = <s1>Neste</s1>leo-signal
