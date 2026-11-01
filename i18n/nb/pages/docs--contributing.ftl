# docs--contributing: translations (nb)

seg-c3c260b7063e = Tester

seg-5dce5694e6ec = Kilde: <c1/>

seg-3fa173b79e8f = Bidra til { -brand }

seg-c3a47c614836 = Takk for interessen. { -brand } har som mål å være en <b>nøytral, reproduserbar, ærlig validert</b> referanse for hybrid kvante-/klassisk PNT. Bidrag holdes til den terskelen: korrekthet, kildehenvisninger og reproduserbarhet foran bredde.

seg-5a82a55f7fb2 = Hvordan prosjektet styres — hvem som bestemmer, den tekniske terskelen og grensen mellom åpent og lukket — er dokumentert i <a1><c1/></a1>.

seg-cc8491af7a6f = Utvikling

seg-0163ccdfaa2b = De valgfrie språkbindingene er funksjonsstyrte og av som standard (så byggingen over og kontrollen av avhengigheter berører dem aldri). For å jobbe med dem:

seg-edc8bbab6e92 = Før hver commit — den raske sløyfen

seg-6a7eda7d82b7 = Disse tar sekunder. De er en delmengde av jobben <c2/> i <c1/>, i samme rekkefølge, så en feil her er en feil der:

seg-d62c1fe22fc4 = <b>Reproduserbarhet er en fast invariant.</b> En endring som gjør <c1/> ikke-deterministisk, er en feil. Tilfeldighet må gå gjennom den seedede tilfeldighetsgeneratoren; kvante- og klassiske kjøringer bruker uavhengige, deterministisk utledede seeder.

seg-66ea0748c10f = <b>Hygiene i repoet.</b> Commits og innhold må ikke ha etterslep eller bunntekster som tilskriver automatiserte verktøy, og må ikke navngi en AI-assistent som forfatter noe sted i innhold, filnavn eller historikk. Vakten håndhever dette.

seg-fbf423f6fb31 = Før du pusher — den fulle porten

seg-a9176352d3b4 = <c1/> er den kanoniske porten: den kjører <c2/> uavkortet, deretter <c3/> for å kjøre bibliotekssuiten noen ganger til, fordi et kappløp i trådinterleaving er usynlig i én enkelt kjøring. Først ved suksess skriver den <c4/> (ikke sporet — maskintilstand om én kjøring, ikke innhold).

seg-29815bd89ce2 = Den er treg med vilje — 62-79 minutter i sunn jevn drift, ifølge toppteksten i <c1/>, som har det gjeldende tallet — og det er ingen tidsavbrudd, fordi et tidsavbrudd kort nok til å være nyttig ville drept en sunn kjøring. En delmengdekjøring som kom tilbake grønn, er ikke en port: begge feilene denne mekanismen finnes for, slapp gjennom på den måten.

seg-408da9a8b8bb = Bidragsytere som jobber fra en fork trenger ikke kvitteringskroken — den er en lokal vedlikeholderport, og <b>CI er det som faktisk styrer en pull request</b>. Å kjøre <c1/> før du åpner en, betyr bare at CI ikke forteller deg noe du ikke allerede visste.

seg-9394727b21c3 = Legge til eller endre en sensormodell

seg-d9c891ca6827 = <b>Hver numeriske parameter trenger proveniens.</b> Legg kildehenvisningen i modellens <c1/>-streng og i scenariofilen. Ingen anonyme konstanter.

seg-d30cb836d4c4 = <b>Valider mot standardrelasjonen,</b> ikke bare intern konsistens — for eksempel Allan-deviasjon for klokker, Groves' feilvekst for dead-reckoning i treghetsnavigasjon, omregningen fra tid til avstand for tidsoverføring. Legg til en test som viser at simulert utdata gjengir den publiserte verdien eller relasjonsverdien innenfor en oppgitt toleranse.

seg-b52dd0dd550e = <b>Vær ærlig om modenhet.</b> Statusregisteret er <c1/> — legg til eller endre raden der, navngi den eksterne referansen (eller si rett ut at det ikke finnes noen, noe som gjør den til <c2/>), og generer deretter de publiserte artefaktene på nytt med <c3/>. <c4/>, <c5/> og <c6/> er alle generert fra den funksjonen og sier «ikke rediger for hånd» av en grunn. Oppdater fortellingen i <c7/> også når prosaen trenger det, og merk tall som er mål eller resultater fra bakkedemonstratorer som det.

seg-34b9c8b6f70c = Testdrevet: skriv den feilende testen først, med den forventede verdien <b>utledet for hånd</b> fra fysikken/relasjonen før du implementerer.

seg-5322d5b2188c = Deterministiske tester hevder eksakte (håndutledede) verdier; statistiske tester hevder en oppgitt toleranse og midler helst over seeder for å kontrollere spredningen.

seg-7f76a26c4d5f = Commits og versjonering

seg-a1cfb9064694 = <b>Conventional Commits</b> (<c1/>, <c2/>, <c3/>, <c4/>, <c5/> …).

seg-1a13616ca0ac = <b>Semantisk versjonering.</b> Før 1.0 kan skjemaet for scenario/resultat endres; fremhev brytende endringer.

seg-0e3036c27aa8 = <b>Utgivelser lages med en tag <c1/>, og publiseringen er automatisk, men ordnet.</b> Arbeidsflyten Auto-tag pusher taggen når CI er grønn på <c2/> ved en versjonsøkning. Arbeidsflyten Release kjører full verifisering på det taggede commitet, og først når den består, publiserer den til crates.io, Python Package Index (PyPI), npm, ghcr.io, registeret for Model Context Protocol (MCP) og JetBrains Marketplace; deretter kontrollerer den at hver kanal serverer versjonen, og bygger kshana.dev på nytt fra taggen. Ingen kjører <c3/> for hånd. Trinnene, og hvordan du prøver en mislykket publisering på nytt, står i <a1><c4/></a1>.

seg-18ca89a2c573 = Vedlikehold av endringsloggen (påkrevd)

seg-1f7e1d73c2ef = Hver endring som er synlig for brukere, oppdaterer <a1><c1/></a1>:

seg-1448e96afbbc = Legg til en oppføring under avsnittet <b><c1/></b>, i riktig gruppe (<c2/> / <c3/> / <c4/> / <c5/> / <c6/> / <c7/>).

seg-76ddc53c752e = Ved utgivelse gir du <c1/> nytt navn til den nye <c2/>, starter en fersk <c3/>, øker <c4/> i <c5/> (så <c6/> i resultat-JSON stemmer), oppdaterer sammenligningslenkene nederst og tagger <c7/>.

seg-ed680e59377c = Hold oppføringene korte og brukerrettede; lenk til saker/PR-er der det er nyttig.

seg-fe83216ebeed = En pull request som endrer oppførsel uten en oppføring i endringsloggen, er ufullstendig.

seg-776cd2ef0b0c = Eksportkontroll

seg-d0f1db9798a6 = PNT-robusthet og kvantesensing kan berøre eksportkontroll for varer med dobbelt bruksområde. Hold det offentlige repoet til generiske, publiserte modeller og metoder. Alt som ligner eksportfølsom robusthets- eller anti-spoofing-dybde, hører hjemme i det private laget, ikke her. Er du i tvil, spør før du bidrar med det.

seg-506a29aafc12 = Lisens

seg-c0409a1226ca = { -brand } er dobbeltlisensiert (AGPL-3.0 <b>eller</b> en kommersiell lisens fra Ashforde OÜ — se <a1><c1/></a1>). For at det skal fortsette å fungere, må bidrag kunne brukes under <b>begge</b> lisensene. Ved å bidra godtar du derfor at:

seg-da7b02ac890c = bidraget ditt lisensieres inn under <b>AGPL-3.0-only</b>; og

seg-8d6ed0d3a17f = du <b>også gir Ashforde OÜ</b> en evigvarende, verdensomspennende, royaltyfri, uigenkallelig lisens til å bruke, endre og <b>relisensiere bidraget ditt som en del av den kommersielt lisensierte utgaven av { -brand }</b> (det vil si også distribuere det på kommersielle vilkår som ikke er AGPL). Du beholder opphavsretten til bidraget ditt.

seg-3b1a0dd6b5aa = Denne lette dobbeltlisensieringen — ikke en overdragelse av opphavsrett — er det som lar prosjektet forbli åpent <em>og</em> tilby en kommersiell utgave. Hvis du ikke kan gi ({ "2" }) (for eksempel kode som eies av arbeidsgiver), si fra i pull requesten din før du bidrar.

seg-6630d0ac4ad5 = <b>Unntak: <c1/>.</b> Den mappen er lisensiert under <b>GPL-3.0-or-later</b> (se <c2/>) og ligger utenfor den kommersielle lisensen. Bidrag til den lisensieres inn under GPL-3.0-or-later <b>bare</b>; tildeling ({ "2" }) gjelder ikke for dem.

seg-0a78a12b1188 = Signer hvert commit for å bekrefte <a1>Developer Certificate of Origin</a1>: <c1/> (legger til en <c2/>-linje).

seg-9f86d8f58b17 = <s1>Forrige</s1>Sikkerhet

seg-fc760238e9a5 = <s1>Neste</s1>Styring
