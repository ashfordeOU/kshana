# docs--partner-data: translations (nb)

seg-2247a2344710 = Betydning

seg-6e0cb6acc073 = VALIDATED

seg-a349aa76b0ed = PARTNER

seg-34bdcfd66ded = I repositoriegrenen disse dokumentene kommer fra; ennå ikke på GitHub

seg-f942b36a11c4 = Ikke på GitHub ennå

seg-7338b6210228 = Rad

seg-c5ce76c91ff7 = Etikett

seg-3a04afee76ec = Kilde: <c1/>

seg-e6d8549f24b9 = Partnerdata: hvilke målte data som kan løfte en MODELLED-rad

seg-7b9ff34db2c4 = Kshana merker hver funksjon i et maskinkontrollert register (<a1>verifikasjonsmatrise</a1>). De fleste rader for tidssynkronisering og sensorer er <b>MODELLED</b>: de hviler på oppgitte modeller, publiserte databladdata og interne kontroller, og ingen målt registrering av enhetsklassen er sammenlignet med dem. Den som har en slik registrering, kan endre det. Denne siden sier hvilke rader, hva du skal sende, hvordan en innsending kontrolleres, hvordan den skåres og hvordan den krediteres. Den er skrevet for et laboratorium, en produsent eller en universitetsgruppe; den er ikke et tilbud om oppdrag, og den gir ikke inntrykk av at noen støtter den. Kun veiledende: Kshana er et studieinstrument, ikke typegodkjent navigasjons- eller tidsutstyr.

seg-1cf5536037d4 = Hva merkelappene betyr

seg-5f43f341fa27 = en uavhengig ekstern referanse stemmer med funksjonen under en terskel fastsatt før sammenligningen. En målt registrering fra en partner kan være den referansen for delpåstanden den dekker; matriseinvariantene forbyr merkelappen uten en

seg-0d182b8c7430 = internt konsistent og sagt høyt; ingen ekstern uavhengig referanse dekker påstanden. En MODELLED-rad som sammenlignes med målte data og bommer, forblir MODELLED, og bommet publiseres

seg-8a45367544a0 = en disiplin kjøringen støtter seg på, som en maskinvarepartner eier og Kshana ikke leverer, for eksempel tallene som beskriver en partners egen klokke eller interferometer. Kshana modellerer hva en slik enhet ville gjort med en navigasjons- eller tidskjede; den går ikke god for enheten

seg-553a1db0e11d = En innsending kan flytte en rad til VALIDATED bare for den påstanden dataene faktisk tester, og bare hvis sammenligningen når terskelen sin. Den kan ikke gjøre en enhets egne tall til noe Kshana går god for: de forblir partnerens (PARTNER). Om en rads merkelapp endres, er eierens beslutning, registrert i commit-en som endrer den, med referanseteksten som sier nøyaktig hva som ble sammenlignet med hva.

seg-bac61cc47097 = Rader en partners data kan løfte

seg-bd4f5d3f9399 = Hver rad nedenfor er den nøyaktige <c1/>-teksten til en MODELLED-rad i matrisen (en test holder denne siden og matrisen i takt). «Kan endre» sier hva en forhåndsregistrert sammenligning med målte data ville understøtte hvis terskelen nås; det er aldri et løfte.

seg-fb5ceb1d62f0 = Data som ville teste den

seg-812eae6bbea9 = Kan endre

seg-f46d009d9380 = en registrering over flere dager av en klokke av en navngitt klasse, fritt løpende etter siste styring, sammenlignet med en bedre referanse, med et samplingsintervall på ett minutt eller mindre

seg-2a73fc59a03d = gulvene for rødt støy per klasse som begrenser holdover-tallene, forblir MODELLED i dag; en målt stabilitet ved lang midlingstid kunne sammenlignes med gulvet for den klassen, bare for den klassen

seg-abe6b657ce1b = den målte Allan-deviasjonen, som tabell eller som faseregistrering, for en partners klokke eller atominterferometer

seg-6ba2b7faa909 = avveiningstallene kvantifiserer (aldri validerer) partnerenheten, så de ville bli merket som partnerens tall (PARTNER); innlesingen av målte Allan-data i en støymodell er allerede avstemt mot en uavhengig løser

seg-ad537759d084 = en faseregistrering av en oscillator av en av de fire forhåndsinnstilte modellene, over minst ett døgn

seg-44a55f6ebef6 = om forhåndsinnstillingens databladavledede støymodell gjengir stabiliteten til en målt enhet ved databladets egne midlingstider

seg-3da5a93abde6 = en faseregistrering av en klokkeklasse som ennå ikke har kort (en OCXO, en rubidium-, en cesium-, en maser- eller en optisk klokke)

seg-72f248aa4438 = et kort tilpasset på første tredjedel som forutsier Allan-deviasjonen for resten innenfor den forhåndsregistrerte faktoren, slik det allerede er gjort for GNSS-satellittklokker og én mottaker

seg-54971e473811 = en logg fra en ekte installasjon (en hvilken som helst daemon-versjon) med daemonens egne sammendragslinjer

seg-bccf188b7636 = leserne ble bygget fra offentlige linjeoppsett og fixtures; en ekte logg sammenlignet med en uavhengig leser ville være den første eksterne kontrollen

seg-e83b73ab2d5d = en ekte eksport fra en teller eller analyseprogramvare

seg-80b69f559ea5 = det samme, for de formatene

seg-0c279732d132 = en ekte holdover-test: registreringen, tidspunktene operatøren fjernet og gjenopprettet referansen, og laboratoriets egne MTIE-, TDEV- og maskeavgjørelser fra analyseprogramvaren

seg-cfad71161af0 = en uavhengig beregning av de samme størrelsene å sammenligne med motorens

seg-97c65b646eae = en stasjonær logg fra en treghetsenhet hvis støyparametere er publisert eller målt av noen andre

seg-77f9d22ec624 = tilpasningen gjenvunnet innenfor en oppgitt faktor av de uavhengige parameterne

seg-c9544eadc55d = en statisk logg eller støyparametrene til en partners kaldatom-treghetssensor

seg-062dd193ab20 = enhetstallene er partnerens (PARTNER); posisjonsfeilbudsjettet som setter dem sammen, forblir Kshanas modell

seg-078be7f5769f = Start med de to første: de avgjør om gulvene for holdover per klasse og avveiningen mellom kvante og klassisk hviler på noen egne målte data.

seg-c325655738e0 = Hva du skal sende

seg-ca24fa511ffe = En innsending er to filer i én mappe: dataene og en kort beskrivelse av dem, en TOML-fil (<c1/>; et gjennomarbeidet, oppdiktet eksempel er <c2/>).

seg-a3e30cf27adb = <b>Klokkedata.</b> Ett av formatene Kshana leser (se <a1>klokkeloggformater</a1>): TAPR TICC-logger, TimeLab-lignende ASCII-fase eller -frekvens, RINEX-klokke, linuxptp-loggene <c1/>, <c2/> og <c3/>, samt chrony-sporings- og statistikklogger. Fase foretrekkes framfor frekvens; oppgi enhetene og samplingsintervallet. Gi den lengste uavbrutte registreringen du har: stabilitet ved lang midlingstid krever dager, og en registrering på under ett døgn aksepteres, men det gis en advarsel.

seg-a14b0c961637 = <b>Treghetsdata.</b> En CSV med navngitte kolonner (<c1/>, rad/s og m/s^{ "2" }) eller EuRoC-oppsettet, fra en stasjonær enhet, lang nok for tilpasningen (minst { "2000" } sampler; flere timer er bedre).

seg-a1f2cd79bcc0 = <b>Beskrivelsen</b> oppgir følgende, og kontrollen verifiserer det der den kan:

seg-cfeee5da56d7 = organisasjonstypen (en type som «et nasjonalt tidslaboratorium», ikke et navn; et navn er valgfritt og bare for kreditering);

seg-4bd30d68101c = enheten (slag, klasse og en modell for klassen <c1/>);

seg-e8222178a0ee = hvordan dataene ble tatt: hva de ble sammenlignet med, starttidspunktet (UTC), miljøet, og om de er rå eller bearbeidet (og hva som er gjort med dem);

seg-7ac28bd566f2 = SHA-256 for datafilen, slik at filen som skåres, er filen som er beskrevet;

seg-0eba30c3a5b8 = MODELLED-radene den tilbys mot, med den nøyaktige kravteksten ovenfor;

seg-dd694deec626 = lisensen (en SPDX-identifikator eller ord) og hvordan dataene kan brukes i repositoriet: <c1/> (committet, med kreditering), <c2/> (bare hashen og skårene publiseres) eller <c3/> (skåren deles bare med den som sendte inn);

seg-7cea4b7c1df8 = tre erklæringer: det er en måling og ikke en simulering, innsenderen kan lisensiere den til denne bruken, og filene inneholder ingen personopplysninger.

seg-caa6696f3f5f = <b>Ikke send.</b> Alt personlig eller med kontaktopplysninger (kontrollen avviser en e-postadresse eller et telefonnummer i beskrivelsen), alt som er under eksportkontroll eller begrenset av avtale, og alle simulerte data som framstilles som målt.

seg-a2f0067b6da5 = Hvordan en innsending kontrolleres

seg-f1d4c097691e = Format og metadata, av deg eller oss, før noe kjøres.

seg-c3cd90222eaa = Den bekrefter skjemaet, de påkrevde feltene, hashen, reglene for lisens og kreditering, at målradene finnes og er MODELLED, at dataene kan leses med motorens egen leser, og den rapporterer hva den leste (sampler, intervall, spenn, hull) og advarer om registreringer som er korte. Avslutningsstatus { "0" } betyr komplett og lesbar; { "1" } lister opp hva som må rettes. <b>Den skårer ikke dataene, validerer ingen rad og lover ikke at de blir brukt.</b>

seg-7dd95552a6fb = <b>En forhåndsregistrering, før noen skåret kjøring.</b> For hver rad fastsetter et dokument i <c1/> følgende, og det committes før dataene kjøres: raden, SHA-256 for datafilen, hvilken del av dataene som holdes tilbake (ingenting som tilpasses, får se den), metrikken og terskelen. For klokkekort er den eksisterende malen den tilbakeholdte prediksjonen som ble brukt for IGS- og mottakerregistreringene: tilpass på første tredjedel av registreringen, forutsi Allan-deviasjonen for resten, og krev at forholdet mellom predikert og målt ligger innenfor en oppgitt faktor ved hver tilpassede midlingstid. En terskel løsnes aldri etter en kjøring.

seg-10dc9f8cf394 = <b>Én skåret kjøring.</b> Resultatet, med hvert tall og hvert bom, publiseres med kommandoen og commit-en, og en test fester det. Et bom er et funn, ikke en svikt som skal skjules: raden forblir MODELLED, og siden sier det.

seg-e5704c43a6b8 = <b>Registerbeslutningen er eierens</b>, skriftlig, i commit-en som endrer raden. Referanseteksten til en løftet rad navngir datasettet, lisensen og krediteringen, hva som ble sammenlignet og hva som ikke ble det.

seg-6d467ffb4199 = Kreditering og rettigheter

seg-e82f31e7d9cc = Dataene forblir dine under lisensen du oppgir. <c1/> og <c2/> holder filen utenfor repositoriet.

seg-156499ebc142 = En <c1/>-innsending krediteres med kredittlinjen du oppgir, i radens referansetekst og i resultatfilen.

seg-a5c01115d23a = Ingenting publiseres under ditt navn uten ditt skriftlige samtykke; en organisasjon som er navngitt som kilde, siteres som kilde, aldri som en som støtter arbeidet. Ingen påstand om godkjenning eller støtte framsettes av eller om en partner.

seg-6c9ed423e51d = Du kan trekke tilbake en innsending før resultatet er publisert. Etter det står resultatet som registrert; hvis du trekker tilbake datalisensen, fjernes filen fra repositoriet, og hashen og skårene blir stående.

seg-2cc3c091ba0f = Kshana sender ingenting og styrer ingen maskinvare. En innsending er filer inn, en rapport ut.

seg-01b0ee9973dc = Oppsøkende arbeid

seg-b5cb4dc0493f = Et ensides notat til et laboratorium er skissert for eieren i <s1><c1/></s1>. Det er et utkast: ingenting sendes, og ingen kontaktes, før eieren bestemmer det.

seg-83b30e1ca261 = <s1>Forrige</s1>Bevispakker

seg-09c0b5fa6e52 = <s1>Neste</s1>Optiske lenker gjennom atmosfæren
