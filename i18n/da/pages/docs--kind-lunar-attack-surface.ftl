# docs--kind-lunar-attack-surface: translations (da)

seg-8784979d6569 = dBW

seg-37d16b499bc5 = dB

seg-98151954f217 = false

seg-cc2ad9e12064 = <b>MODELLED</b> Geometrisk J/S-linkbudget, anti-jam-C/N₀, tab af lås pr. satellit. Uafhængig reference (InternalConsistency): Linkbudgetligningen for anti-jam-C/N₀ krydskontrolleret mod en uafhængig numpy-udledning påny (deler den samme lukkede form → InternalConsistency) plus en karakterisering af C/N₀-forringelse fra reelle JammerTest-2024-data. { "0.30" } runde { "2" }, blokeret (forbliver MODELLED): det målte fald i C/N0 fra JammerTest { "2024" } mod en linkbudgetforudsigelse (præregistreret 6a66994b, inden for { "3" } dB) blev ikke kørt, fordi F8.1-antennens position og pegning ved

seg-143f3f1cc521 = Modstandsdygtighed over for jamming i GNSS-nægtede miljøer er MODELLED, ikke valideret: kontrolleret mod sin egen lukkede/analytiske identitet — fanger transskriptions- og koefficientfejl, men er ikke en ekstern uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-1f17ef6a853e = Scenarietype i motoren v{ $version }, familie <a1>Måne og cislunart rum</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: README'ens afsnit Evidence).

seg-1c1eeb2dcaa0 = Familieside: <a1>Måne og cislunart rum</a1>

seg-a3697ad561db = Hz

seg-9521a296d617 = dBi

seg-c14d2343d802 = Kilde: <c1/>

seg-9c0b5e933472 = <c1/> (scenarietype)

seg-004c56ded47f = Angrebsflade for signalsikkerhed ved navigation på månens overflade (P1): sammensætter de åbne signalsikkerhedsanalyser i én kørsel, der kan nås fra binæren. Rapporterer ({ "1" }) AFS' modtagne effekt og dens effektOVERSKUD i forhold til en jordbaseret GPS-reference, plus følsomhedsbåndet på 12-18 dB som et ægte flerakset sweep over linkets input (referenceniveau x EIRP x skråafstand) med afstemningen af den lineære faktor 25x afrundet / 28x uafrundet. REVIDERET (regel R4): dette rapporterede et effekt-UNDERSKUD på { "15.6" } dB og en faktor 32x/36x, indtil GPS-referencen blev rettet fra -125 / -128.5 (som er dBm-værdierne) til -155 / -158.5 dBW, ICD-GPS-200-værdierne, som jamming-modulet altid har haft. Fortegnet vendes: det modellerede lunare AFS-signal er { "14.4" } dB STÆRKERE end terrestrisk GPS L1 C/A, ikke svagere. Selve den modtagne effekt flyttede sig ikke en bit, og den lineære faktor er den gamle divideret med præcis { "1000" }, som netop er dBm-til-dBW-forskydningen på { "30" } dB; ({ "2" }) den krævede angribersendeeffekt til at spoofe (J/S = { "3" } dB) og til at nægte (J/S = { "30" } dB) ved hver afstand, den omvendte af J/S-linket; ({ "3" }) den orbitale indfangningsfodaftrykning under et reelt antennemønster med ensartet apertur (Airy [{ "2" } J1(x)/x]^{ "2" }), en højdebegrænset sub-hemisfærisk kalot, hvis rand IKKE indfanges; ({ "4" }) et beregnet resultat af sporingsløkkens pull-in ved spoofer-indfangning (trækker en spoofer med matchende kode ved en given effektfordel og kodeforskydning faktisk DLL/PLL med sig) i stedet for den postulerede tærskel på { "3" } dB; ({ "5" }) den geometriske horisontrækkevidde på et legemes uden atmosfære for en hævet sender på overfladen; og ({ "6" }) OSNMA/TESLA-autentificeringsbudgettet ({ "20" } bit/s overhead = ~{ "40" } % af en AFS-navigationsmeddelelse på { "50" } bit/s, forsinkelse ved nøgleafsløring, { "2" }^-40 forfalskning). En tom krop gengiver P1-baseline; hvert input har en standardværdi og kan overstyres. VALIDATED delresultater bærer deres kildemoduls uafhængige reference (lukket-form dB-radiometri; omvendt J/S-rundtur; Airy-mønster mod A&S Bessel og sfærisk kalotgeometri; DLL/PLL-pull-in mod Kaplan & Hegarty; sfærisk tangenthorisontidentitet mod eo_payload; OSNMA SIS-ICD-feltdimensionering). MODELLED: de repræsentative størrelser for geometri/effekt og de konkrete værdier i indfangningskortets celler. Ikke et certificeret sikkerhedsprodukt.

seg-e5edd5b9ef27 = Én kørsel af <c1/> opsummeres som: lunar-attack-surface | AFS -140.6 dBW, overskud { "14.4" } dB (bånd -17.9–-12.0, { "25" }×/28× overskud) | spoof@{ "1000" } m { "0.000" } W | fodaftryk { "3" }% kalot, rand falsk | spoof-capture sand (lock { "0.00" } s) | mastrækkevidde { "21.0" } km | OSNMA { "20" } bit/s ({ "40" }% af { "50" } bit/s), { "30" } s forsinkelse | fodaftryks-sweep 7x5 (højde 20-500 km x HPBW 1.83-29.20 grader), indfangning 0.6-42.9% | rand IKKE nået på dette gitter (bedst -0.8 dB, { "3.8" } dB for lidt; kræver { "19.8" } dBW mod { "16.0" } dBW)

seg-781a7094b955 = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>

seg-87e0c97de011 = Eksemplet <c1/> sætter blandt andet:

seg-6ea8f1132b57 = lineær

seg-8b701f465117 = log

seg-de295af20c55 = Diagrammet, som motoren skriver for scenarios/lunar-attack-surface.toml, type lunar-attack-surface

seg-c853e3e832c0 = <b>MODELLED</b> Todimensionelt sweep af det mønstervægtede, højdebegrænsede indfangningsfodaftryk på overfladen over senderhøjde og skivediameter, udsendt som én række pr. driftspunkt. Uafhængig reference (InternalConsistency): Mængdeinklusion: forholdet mellem jammer og signal indgår som en ensartet decibelforskydning, så den indfangede mængde ved en højere sendeeffekt indeholder mængden ved en lavere, og andelen kan kun stige -- en egenskab, som Airy-mønstret IKKE giver i strålebredde eller højde, hvor det indfangede område brydes op i ringe og andelen reelt er ikke-monoton. Ingen offentliggjort tabel angiver den indfangede skiveandel for en lunar orbital tr

seg-d11486381332 = MODELLED: de repræsentative størrelser for geometri/effekt og de konkrete værdier i indfangningskortets celler. (kategori-katalog (<c1/>))

seg-95be70748647 = Indfangningsfodaftryk mod højde og strålebredde er MODELLED, ikke valideret: kontrolleret mod sin egen lukkede/analytiske identitet — fanger afskrivnings- og koefficientfejl, men er ikke en ekstern uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-1a1799e01ac4 = <s1>Forrige</s1>link-budget

seg-4b0efe4b9b85 = <s1>Næste</s1>lunar-beacon
