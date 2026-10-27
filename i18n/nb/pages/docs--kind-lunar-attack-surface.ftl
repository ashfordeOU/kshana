# docs--kind-lunar-attack-surface: translations (nb)

seg-8784979d6569 = dBW

seg-37d16b499bc5 = dB

seg-98151954f217 = false

seg-cc2ad9e12064 = <b>MODELLED</b> Geometrisk J/S-linkbudsjett, anti-jam C/N₀, tap av lås per satellitt. Uavhengig referanse (InternalConsistency): Likningen for anti-jam C/N₀-linkbudsjett kryssjekket mot en uavhengig numpy-utledning (deler samme lukkede form → InternalConsistency) pluss en karakterisering av C/N₀-degradering i virkelige JammerTest-2024-data. { "0.30" } runde { "2" }, blokkert (forblir MODELLED): den målte C/N0-nedgangen i JammerTest { "2024" } mot en linkbudsjettprediksjon (forhåndsregistrert 6a66994b, innen { "3" } dB) ble ikke kjørt fordi F8.1-antenneposisjonen og -pekingen at

seg-143f3f1cc521 = Robusthet mot jamming uten GNSS er MODELLED, ikke validert: kontrollert mot sin egen lukkede/analytiske identitet – fanger opp transkripsjons- og koeffisientfeil, men er ikke en uavhengig ekstern referanse. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-1f17ef6a853e = Scenariotype i motoren v{ $version }, familie <a1>Måne og cislunart rom</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en sikkerhetskritisk tjeneste for menneskeliv. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett fortjenes: Evidens-avsnittet i README).

seg-1c1eeb2dcaa0 = Familieside: <a1>Måne og cislunart rom</a1>

seg-619127334cf3 = Ingen matriserad nevner denne typen ved navn; etiketten på resultatet er motorens egen, ovenfor.

seg-a3697ad561db = Hz

seg-9521a296d617 = dBi

seg-c14d2343d802 = Kilde: <c1/>

seg-9c0b5e933472 = <c1/> (scenariotype)

seg-004c56ded47f = Angrepsflate for signalsikkerhet ved navigasjon på månens overflate (P1): setter sammen de åpne signalsikkerhetsanalysene til én kjøring som kan nås fra binærfilen. Rapporterer ({ "1" }) AFS-mottatt effekt og dens effekt-OVERSKUDD i forhold til en jordbasert GPS-referanse, pluss følsomhetsbåndet på 12-18 dB som et ekte flerakset sveip over linkinngangene (referansenivå x EIRP x skråavstand) med avstemmingen mellom 25x avrundet / 28x uavrundet lineær faktor. REVIDERT (regel R4): dette rapporterte et effekt-UNDERSKUDD på { "15.6" } dB og en faktor på 32x/36x helt til GPS-referansen ble rettet fra -125 / -128.5 (som er dBm-verdiene) til -155 / -158.5 dBW, ICD-GPS-200-verdiene som jamming-modulen alltid har båret. Fortegnet snus: det modellerte AFS-signalet fra månen er { "14.4" } dB STERKERE enn jordbasert GPS L1 C/A, ikke svakere. Den mottatte effekten selv flyttet seg ikke en eneste bit, og den lineære faktoren er den gamle delt på nøyaktig { "1000" }, som nøyaktig er dBm-til-dBW-forskyvningen på { "30" } dB; ({ "2" }) den påkrevde angripersendeeffekten for å spoofe (J/S = { "3" } dB) og for å nekte (J/S = { "30" } dB) ved hver avstand, det inverse av J/S-linken; ({ "3" }) det orbitale fangstområdet under et ekte antennemønster med uniform apertur (Airy [{ "2" } J1(x)/x]^{ "2" }), en høydebegrenset kalott som er mindre enn en halvkule, og hvis rand IKKE fanges; ({ "4" }) et beregnet utfall av innfanging i sporingssløyfen (drar en spoofer med lik kode, ved en gitt effektfordel og kodeforskyvning, faktisk med seg DLL/PLL) i stedet for den påståtte terskelen på { "3" } dB; ({ "5" }) den geometriske horisontrekkevidden til en hevet sender på overflaten på et legeme uten atmosfære; og ({ "6" }) OSNMA/TESLA-autentiseringsbudsjettet ({ "20" } bit/s overhead = ~{ "40" } % av en AFS-navigasjonsmelding på { "50" } bit/s, forsinkelse for nøkkelutlevering, forfalskning på { "2" }^-40). En tom kropp gjengir P1-grunnlinjen; hver inngangsverdi har en standardverdi og kan overstyres. VALIDATED delresultater bærer sin kildemoduls uavhengige referanse (lukket dB-radiometri; invers J/S-rundtur; Airy-mønster mot A&S Bessel og kuleskallgeometri; DLL/PLL-innfanging mot Kaplan & Hegarty; sfærisk-tangent-horisontidentitet mot eo_payload; OSNMA SIS-ICD-feltdimensjonering). MODELLED: de representative størrelsene for geometri og effekt og de enkelte cellverdiene i fangstkartet. Ikke et sertifisert sikkerhetsprodukt.

seg-e5edd5b9ef27 = Én kjøring av <c1/> oppsummeres slik: lunar-attack-surface | AFS -140.6 dBW, overskudd { "14.4" } dB (bånd -17.9–-12.0, { "25" }×/28× overskudd) | spoof@{ "1000" } m { "0.000" } W | fotavtrykk { "3" }% kalott, rand false | spoof-capture true (lock { "0.00" } s) | mastrekkevidde { "21.0" } km | OSNMA { "20" } bit/s ({ "40" }% av { "50" } bit/s), { "30" } s forsinkelse | fotavtrykkssveip 7x5 (høyde 20-500 km x HPBW 1.83-29.20 deg), fangst 0.6-42.9% | randen nås IKKE på dette rutenettet (best -0.8 dB, { "3.8" } dB for lite; trenger { "19.8" } dBW mot { "16.0" } dBW)

seg-781a7094b955 = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>

seg-87e0c97de011 = Eksempelet <c1/> setter blant annet:

seg-6ea8f1132b57 = lineær

seg-8b701f465117 = log

seg-de295af20c55 = Diagrammet motoren skriver for scenarios/lunar-attack-surface.toml, type lunar-attack-surface

seg-c853e3e832c0 = <b>MODELLED</b> Toakset sveip av det mønstervektede, høydebegrensede fangstfotavtrykket på overflaten over senderhøyde og skåldiameter, gitt ut som én rad per driftspunkt po. Uavhengig referanse (InternalConsistency): Mengdeinklusjon: forholdet mellom jammer og signal inngår som en uniform desibelforskyvning, så den fangede mengden ved høyere sendeeffekt inneholder mengden ved lavere effekt, og andelen kan bare øke; en egenskap Airy-mønsteret IKKE gir i strålebredde eller høyde, der det fangede området brytes opp i ringer og andelen faktisk er ikke-monoton. Ingen publisert tabell gir den fangede skiveandelen for en månebane-sender

seg-d11486381332 = MODELLED: de representative størrelsene for geometri og effekt og de enkelte cellverdiene i fangstkartet. (typekatalog (<c1/>))

seg-95be70748647 = Fangstfotavtrykk mot høyde og strålebredde er MODELLED, ikke validert: kontrollert mot sin egen lukkede/analytiske identitet; fanger opp avskrivings- og koeffisientfeil, men er ikke en uavhengig ekstern referanse. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-1a1799e01ac4 = <s1>Forrige</s1>link-budget

seg-4b0efe4b9b85 = <s1>Neste</s1>lunar-beacon
