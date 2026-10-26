# docs--quantum-models: translations (nb)

seg-638b8d451550 = Sensor

seg-c35a20fa2529 = Modenhet

seg-2f51722ab9d4 = Kilde: <c1/>

seg-39ab7752d86d = Modeller for kvantesensorer: hva Kshana modellerer, og hva den ikke gjør

seg-daf0e0c0b16f = Kshana er en <b>simulator for robusthet i PNT (PNT: posisjonering, navigasjon og tidssynkronisering) med ytelsesmodeller for kvantesensorer</b>. Den er <em>ikke</em> en simulator for kvantefysikk fra første prinsipper. Denne siden sier nøyaktig hva det betyr, slik at «kvante»-rammen ikke kan misforstås som mer enn den er.

seg-6e504d97c41e = Hva som ER modellert

seg-7884c9a7d883 = Hver kvantesensor (og klassiske sensor) er en <b>feilmodell</b> drevet av publiserte parametere for støybudsjett:

seg-cad22f39d579 = <b>Klokker</b> – PSD-er (effekttetthetsspektre) for hvit frekvens og tilfeldig gange i frekvens, et flicker-gulv (1/f) i Allan-deviasjonen og lineær drift, hentet fra databladene og artikler: CSAC (chip-scale atomic clock) Microchip SA.45s; den optiske gitterklokken med strontium til Origlia et al. (arXiv:{ "1503.08457" }), et mål for bruk i rommet; og de seks standardene i <c1/> (CSAC; USO, ultrastabil oscillator; DSAC, Deep Space Atomic Clock; TCXO, temperaturkompensert krystalloscillator; OCXO, ovnsstyrt krystalloscillator; RAFS, rubidium-atomfrekvensstandard), hver med én sitert kilde. Allan-deviasjonen disse gir er validert mot standardhelningene for støytyper (se <a1><c2/></a1>). Én kurve for optiske klokker er reell: den målte Allan-deviasjonen til ⁸⁸Sr-pinsettklokken til Norcia et al. (<em>Science</em> { "2019" }) gjenskapes av støytilpasningen, en VALIDATED-rad i <a2><c3/></a2>; holdover-tallene bygget på den optiske klassen forblir MODELLED.

seg-13c3340e773b = <b>Treghetssensorer</b> – i pakkene <c1/> og hybrid et enakset (1-DOF, én frihetsgrad) feilbudsjett for akselerometer/gyro: hastighetens tilfeldige gange, vinkelens tilfeldige gange, akselerasjonens tilfeldige gange og et Allan-gulv for biasustabilitet. Typene <c2/> og <c3/> kjører i stedet den treakse strapdown-mekaniseringen i <c4/> (kvaternionbasert orientering, navigasjonsligninger i nord–øst–ned, en deterministisk IMU-feilmodell).

seg-f361d586b348 = Kvantescenariotypene – <c1/>, <c2/>, <c3/>, <c4/> og <c5/> – er bygget av disse feilmodellene og er MODELLED; <c6/>, <c7/> og <c8/> rapporterer også en representativitetsregistrering med hullene til flyging.

seg-05bbaddd4df6 = Motoren er <b>nøytral</b>: «kvante» og «klassisk» er den samme kodebanen med ulike koeffisienter. Kontrasten i kvalitetsmålene kommer helt og holdent fra inndataparametrene for støy, hver av dem sporbar til en sitert kilde.

seg-a1a067588520 = Hva som IKKE er modellert

seg-49a656243210 = For klokke- og tidsoverføringssensorene simuleres ingenting av den underliggende kvantefysikken – bare det netto Allan-bidraget, oppgitt som en koeffisient. For <b>kaldatom-akselerometeret</b> finnes nå et lag fra første prinsipper (se nedenfor); de gjenstående systematiske effektene er fortsatt på koeffisientnivå eller ikke modellert:

seg-844e65d52572 = atominterferometerets <b>Mach–Zehnder-fase</b> (<c1/>), <b>kvanteprojeksjons- / skuddstøy</b> (<c2/>), avtak av interferometerets <b>kontrast</b>, <b>syklustid</b> og <b>overføringsfunksjonen for vibrasjonskobling</b> (<c3/>, varians for hvit PSD <c4/>) <em>er nå modellert fra første prinsipper</em> for CAI-akselerometeret (cold-atom interferometer) (<c5/>), som utleder PSD-en for hvit akselerasjon <c6/> den klassiske modellen bruker, sammen med <b>det dynamiske området for fringe-flertydighet</b> (<c7/>) – se <a1><c8/></a1>;

seg-71a782041b89 = den <b>Coriolis</b>-systematiske effekten (<c1/> / <c2/>, <c3/>-tverrkoblingen) og den <b>AC-Stark-systematiske effekten (AC: vekselstrøm) / lysforskyvningen</b> (<c4/>, som opphever seg under en symmetrisk tofoton-avstemming) <em>er nå modellert og enhetstestet</em> i <c5/>;

seg-00c510117abc = tre ytterligere CAI-feilledd <em>er nå modellert</em> som bibliotekfunksjoner i <c1/> ({ "0.36" }; MODELLED; ikke ennå tilgjengelige fra en scenariotype):

seg-fcaf6ff00974 = <b>Fasestøy fra Raman-laser</b>: vektingen med følsomhetsfunksjonen til Cheinet et al. ({ "2008" }), ligning { "8" }, med lukket form for hvit fasestøy <c1/> (ligning { "18" } ved én syklus) og en numerisk vei for et hvilket som helst fasestøyspektrum, pluss laserens frekvensstøy som retrorefleksjonsforsinkelsen <c2/> ikke opphever (Le Gouët et al. { "2007" }, ligningene { "9" } til { "11" });

seg-6e2236c81db8 = <b>bølgefrontkurvatur</b> (bare ren uskarphet): biasen <c1/> til en termisk sky på en stråle med krumningsradius <c2/>, og dens reduksjon når bare atomer innenfor en deteksjonsradius telles (etter Louchet-Chauvet et al. { "2011" } og Schkolnik et al. { "2015" }); aberrasjoner av høyere orden er ikke modellert;

seg-92295ad17228 = <b>løsning av fringe-flertydighet</b>: sannsynligheten for en feil fringe-indeks, <c1/>, for støtte fra et klassisk akselerometer (Lautier et al. { "2014" }) og for to avhørstider (etter Bonnin et al. { "2018" }), med inversen som gir den største klassiske støyen for en oppgitt sannsynlighet for feil.

seg-f383678fb806 = Hvert lukkede uttrykk er kontrollert mot en uavhengig numerisk vei (kvadratur i frekvensdomenet, eller en Monte Carlo over atomer eller skudd) og mot grensetilfellene sine. Det ene publiserte tallet som gjenskapes er nivået for hvit fasestøy hos Cheinet et al.: −{ "111" } dB·rad²/Hz ved <c1/> = { "20" } µs gir omtrent { "1" } mrad per skudd ({ "0.99" } mrad; artikkelen utleder dette nivået med sin ligning { "17" }, flicker pluss hvit). Ingenting av dette er en måling av noe instrument;

seg-150f8b9dfea4 = fortsatt <b>ikke</b> modellert: bølgefrontaberrasjoner av høyere orden, fasestøyen til et bestemt lasersystem og fysikk fra første prinsipper på klokkesiden;

seg-643109601eba = <c1/>-pakken for kvante mot klassisk er enakset; treakse-strapdown-banen kjører bare i <c2/> og <c3/> (se merknaden om IMU, treghetsmåleenhet, i README og <a1><c4/></a1>).

seg-1ff01ab9f92d = Å fullføre kvantefysikklaget (å gjøre CAI-feilleddene tilgjengelige fra en scenariotype, bølgefrontaberrasjoner av høyere orden og fysikk fra første prinsipper på klokkesiden) er det gjenstående P2-arbeidet i <c1/>.

seg-f09a31b33faa = Tall fra bakkelab mot flygekvalifiserte tall

seg-dcef4579d2a9 = Parametertabeller blander modenhetsnivåer; behandle dem deretter:

seg-4f25895df32f = Kildetall

seg-cef61e912cd0 = CSAC (f.eks. SA.45s)

seg-4a016be9bca9 = datablad σ_y({ "1" } s) ≈ { "3e-10" }

seg-38cc72b2405c = kommersiell del <b>i bruk</b> (strålingstolerante romvarianter finnes)

seg-d38d20629ed6 = Optisk gitterklokke med strontium

seg-1f0d3ec00922 = σ_y({ "1" } s) mål ≈ { "1e-15" } (arXiv:{ "1503.08457" })

seg-1496e0c42086 = <b>bakkelab</b> – Kshana kjenner ikke til noen publisert ytelse i bane for en slik

seg-ce1d7994188b = Kaldatom-akselerometer

seg-b07fa6b8cebc = publiserte Allan-tall fra lab

seg-60864f168701 = bakkelab / sonderakett

seg-84a68aeb467d = Tall for optiske klokker i Kshana er <em>romfartsmål på bakkemaskinvare</em>. Ingen optisk klokke har fløyet; README og resultatets proveniens sier det eksplisitt.

seg-a204c1b854fa = Referanse: ACES/PHARAO på ISS (i drift siden april { "2025" })

seg-fb88de1257bd = Nyttelasten <b>ACES/PHARAO</b> fra ESA (European Space Agency) (ACES: Atomic Clock Ensemble in Space; PHARAO: Projet d'Horloge Atomique par Refroidissement d'Atomes en Orbite) – en laserkjølt cesiumklokke pluss en aktiv hydrogenmaser, i drift på ISS (International Space Station) siden april { "2025" } – er den nåværende operative referansen for klokkestabilitet i bane (målt relativ stabilitet i størrelsesorden { "1e-16" } etter noen døgns integrasjon). Kshanas modell for optiske klokker representerer et <em>mer ambisiøst</em> mål for bakkelab enn ytelsen til ACES' fløyne cesium/maser; når Kshanas optiske tall sammenlignes med «det som faktisk har fløyet», er ACES/PHARAO det ærlige referansepunktet, og det er et mikrobølge-/masersystem, ikke en optisk gitterklokke.

seg-9d2e850cb986 = De nøyaktige ytelsestallene for ACES i bane bør siteres fra ESAs publiserte resultater etter hvert som de frigis; poenget her er <em>modenhetsgapet</em>, ikke et bestemt tall – Kshanas optiske tall er mål, ikke ytelse i flyging.

seg-4b373686adf8 = <a1><c1/></a1> – merkelappene <c2/> / <c3/> per parameter.

seg-3f0c1048aea9 = <a1><c1/></a1> – definisjoner av kvalitetsmål (FoM) og hver forkortelse.

seg-a360cd4997e2 = <a1><c1/></a1> – hva kvalitetsmålene for integritet og sikkerhet er og ikke er.

seg-0ac025397b23 = <a1><c1/></a1> – kaldatom-akselerometeret fra første prinsipper.

seg-41ba2c8f70fe = <s1>Forrige</s1>Utforming av konstellasjoner

seg-136fa589fed5 = <s1>Neste</s1>Kaldatom-interferometer
