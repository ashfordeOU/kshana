# docs--governance: translations (nb)

seg-26440a254ba8 = Kilde: <c1/>

seg-5f8e9a4a15be = Styring av Kshana

seg-b20b74b77755 = Dette dokumentet sier hvordan Kshana styres: hvem som tar beslutninger, hvordan, og hva prosjektet vil og ikke vil ta imot. Det er bevisst <b>lett</b> — tilpasset prosjektets nåværende størrelse — og er ærlig om dagens situasjon med én vedlikeholder og veien mot bredere styring etter hvert som fellesskapet vokser.

seg-1e0c276811e2 = Oppdrag og omfang

seg-5dcc38148cf4 = Kshana er en <b>nøytral, reproduserbar og ærlig validert referanse for ytelse og robusthet i hybrid kvante/klassisk PNT</b>. Oppdraget setter terskelen for hver beslutning: korrekthet, kilder og reproduserbarhet fremfor bredde. Det ærlige omfanget er dokumentert i <a1><c1/></a1> og valideringsstatusen i <a2><c2/></a2>; forslag vurderes mot dette omfanget, ikke mot antall funksjoner.

seg-d331a1cfc60b = Roller

seg-88bb2a831125 = <b>Vedlikeholder.</b> Kshana vedlikeholdes for tiden av grunnleggeren, Ashforde OÜ (kontakt: <c1/>). Vedlikeholderen tar den endelige avgjørelsen om omfang, utforming, utgivelser og hva som flettes inn. Dette er en modell med en velvillig vedlikeholder, uttrykt rett fram i stedet for å bli utkledd som en komité som ikke finnes.

seg-8e1da46f9b0b = <b>Bidragsytere.</b> Alle som åpner en issue eller en pull request. Bidrag måles mot terskelen i <a1><c1/></a1> — opprinnelse for hver numeriske parameter, validering mot en publisert sammenheng og ærlighet om modenhet.

seg-d212e17ac218 = <b>Fremtidige committere.</b> Når vedvarende bidrag av høy kvalitet tilsier det, gis commit-rettigheter til betrodde bidragsytere, og dette dokumentet oppdateres til en modell med flere vedlikeholdere (beslutninger ved lazy consensus, der vedlikeholdergruppen løser uenigheter). Fram til da er veien: bidra, bygg opp en merittliste og bli invitert.

seg-91e3f1919016 = Hvordan beslutninger tas

seg-0d45899c92f4 = <b>Diskusjon i det åpne.</b> Vesentlige endringer starter som en GitHub-issue, slik at begrunnelsen, alternativene og avveiningene er dokumentert.

seg-88916dd2357b = <b>Lazy consensus.</b> Et forslag uten vedvarende innvendinger etter rimelig tid, og som består den tekniske terskelen nedenfor, går videre.

seg-788566515dad = <b>Vedlikeholderen avgjør ved uenighet.</b> Der enighet ikke nås, avgjør vedlikeholderen og noterer begrunnelsen. Uenighet løses ut fra oppdraget og den tekniske terskelen, ikke ut fra ansiennitet eller høylytthet.

seg-e45e1b565e62 = Den tekniske terskelen (ikke til forhandling)

seg-2c397872e2f5 = Dette er harde invarianter, håndhevet av CI og gjennomgang, som ingen beslutning overstyrer:

seg-70cb5a174c2f = <c1/> må reprodusere en kjøring bit-for-bit. En endring som gjør dette ikke-deterministisk, er en feil, ikke en funksjon.

seg-b8733ea97546 = <b>Opprinnelse.</b> Ingen anonyme numeriske konstanter — hver parameter oppgir en kilde.

seg-55a09b775418 = <b>Ærlighet om validering.</b> Hver funksjon er merket <c1/> (mot en uavhengig referanse) eller <c2/> / <c3/>. Ingenting hevdes utover det evidensen viser. Se den maskinkontrollerte matrisen i <c4/>.

seg-dd339a396698 = <b>Hygiene.</b> Ingen attribusjon til automatiserte verktøy noe sted i commits, innhold eller historikk (håndhevet av <c1/>).

seg-45733fea1709 = En endring som ikke kan nå terskelen, avslås, uansett hvor nyttig den ville vært.

seg-3eb0831d99a2 = Grensen mellom åpent og lukket

seg-ca7730a3d518 = Kshana er <b>åpen kjerne</b>. Dette repoet er, og forblir, den komplette åpne AGPL-3.0-motoren — den nøytrale referansen, med kommersiell dobbeltlisens fra Ashforde OÜ (se <a1><c1/></a1>). Prosjektet vil <b>ikke</b> ta imot i det åpne repoet:

seg-8c2a89a3a4e2 = <b>Eksportkontrollert eller tosidig bruk i dybden</b> — ekte trusselbiblioteker, motstanderes bølgeformer eller ytelsesparametere mot jamming/spoofing. Det offentlige repoet holder seg til generelle, publiserte modeller og metoder (se <c1/> → Export control). Spør <em>før</em> du bidrar hvis du er usikker.

seg-6df31d37cfe4 = Fortrolige data eller kalibrering fra kunder eller partnere.

seg-b3b4a5384199 = <b>Copyleft-<em>avhengigheter</em> (GPL/AGPL/LGPL/MPL)</b> — ikke fordi de strider mot motorens egen AGPL-lisens (det gjør de ikke), men fordi de ikke kan relisensieres inn i den <b>kommersielle</b> utgaven: vi kan bare selge en kommersiell lisens over kode vi eier eller som er permissiv. En copyleft-avhengighet ville smitte den kommersielle utgaven og bryte dobbeltlisensen. Avhengigheter forblir derfor permissive (Apache/MIT/BSD/ISC), håndhevet av <a1><c1/></a1>.

seg-ce264f3e43fe = Omvendt vil prosjektet <b>ikke</b> tømme den åpne kjernen for å skyve proprietær verdi: den validerte motoren, de offentlige valideringsankrene, ærlighetsregisteret, utvekslings- og standardformatet og distribusjonskanalene forblir åpne. Å sulte den åpne kjernen er den ene fatale feilen i åpen kjerne-modellen, og det er uaktuelt.

seg-947b3e9b1b2d = Utgivelser

seg-73e2bca0310d = <b>Semantisk versjonering.</b> Før 1.0 kan scenario- og resultatskjemaet endres; brytende endringer varsles tydelig, og versjonen av utvekslingsskjemaet (<c1/>) er den eneste kilden til sannhet for kompatibilitet mellom artefakter.

seg-71cace8b6144 = <b>Utgivelsesmyndighet.</b> Publisering (for eksempel <c1/>) er et manuelt trinn for vedlikeholderen som krever et registertoken. CI og den tag-styrte utgivelsesarbeidsflyten publiserer <b>aldri</b> automatisk til eksterne registre — de kjører bare alle kontroller på nytt og legger ved en byggeartefakt. Se <c2/> → Commits and versioning.

seg-59c37ffa54f0 = Atferdskodeks og sikkerhet

seg-2dc8c12568bc = Atferd styres av <a1><c1/></a1>.

seg-8574b73edbbc = Sikkerhetsproblemer følger den private varslingsprosessen i <a1><c1/></a1> — ikke åpne en offentlig issue for en sårbarhet.

seg-d86d4e609713 = Varemerke

seg-cb1314b67b2f = Navnet og logoen Kshana er varemerker tilhørende Ashforde OÜ. Lisensen (AGPL-3.0, eller en kommersiell lisens) dekker <b>koden</b>, ikke merkene: en fork kan bruke koden under lisensen, men ikke navnet Kshana eller den kanoniske distribusjonsidentiteten. Dette holder Ashforde som den siterte kilden til sannhet og er en del av hvordan den åpne kjernen forblir en nøytral referanse.

seg-a678f6ed1af8 = Endring av dette dokumentet

seg-db90122245fa = Endringer i styringen foreslås selv som en pull request og avgjøres etter prosessen ovenfor. Når prosjektets størrelse endres, må du regne med at dette dokumentet får en beslutningsmodell med flere vedlikeholdere; den tekniske terskelen blir ikke senket.

seg-0a0712cca2e7 = Lett av utforming. Ærlig om i dag, med en oppgitt vei videre.

seg-4bfa7cf23a41 = <s1>Forrige</s1>Bidra

seg-f67113e34738 = <s1>Neste</s1>Atferdskodeks
