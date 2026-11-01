# docs--governance: translations (da)

seg-26440a254ba8 = Kilde: <c1/>

seg-5f8e9a4a15be = Styring af Kshana

seg-b20b74b77755 = Dette dokument fastslår, hvordan Kshana styres: hvem der træffer beslutninger, hvordan, og hvad projektet vil og ikke vil tage imod. Det er bevidst <b>let</b> — i forhold til projektets nuværende størrelse — og er ærligt om den nuværende virkelighed med én vedligeholder og om vejen mod bredere styring, efterhånden som fællesskabet vokser.

seg-1e0c276811e2 = Mission og omfang

seg-5dcc38148cf4 = Kshana er en <b>neutral, reproducerbar og ærligt valideret reference for ydeevne og robusthed i hybrid kvante-/klassisk PNT</b>. Missionen sætter tærsklen for enhver beslutning: korrekthed, kildehenvisninger og reproducerbarhed frem for bredde. Det ærlige omfang er dokumenteret i <a1><c1/></a1> og valideringsstatus i <a2><c2/></a2>; forslag vurderes i forhold til dette omfang, ikke i forhold til antal funktioner.

seg-d331a1cfc60b = Roller

seg-88bb2a831125 = <b>Vedligeholder.</b> Kshana vedligeholdes i øjeblikket af sin grundlægger, Ashforde OÜ (kontakt: <c1/>). Vedligeholderen træffer den endelige beslutning om omfang, udformning, udgivelser og hvad der flettes ind. Det er en model med en velvillig vedligeholder, fremstillet åbent frem for at være klædt ud som et udvalg, der ikke findes.

seg-8e1da46f9b0b = <b>Bidragydere.</b> Enhver, der opretter en issue eller pull request. Bidrag måles mod tærsklen i <a1><c1/></a1> — proveniens for hver numerisk parameter, validering mod en offentliggjort sammenhæng og ærlighed om modenhed.

seg-d212e17ac218 = <b>Fremtidige committere.</b> Når vedvarende bidrag af høj kvalitet berettiger til det, udvides commit-rettigheder til betroede bidragydere, og dette dokument opdateres til en model med flere vedligeholdere (beslutninger ved lazy consensus, hvor gruppen af vedligeholdere løser uenigheder). Indtil da er vejen: bidrag, opbyg en track record, og bliv inviteret.

seg-91e3f1919016 = Hvordan beslutninger træffes

seg-0d45899c92f4 = <b>Drøftelse i det åbne.</b> Væsentlige ændringer starter som en GitHub-issue, så begrundelse, alternativer og afvejninger er registreret.

seg-88916dd2357b = <b>Lazy consensus.</b> Et forslag uden vedvarende indsigelse efter rimelig tid, og som består den tekniske tærskel nedenfor, går videre.

seg-788566515dad = <b>Vedligeholderen afgør ved uenighed.</b> Hvor der ikke opnås enighed, afgør vedligeholderen og noterer begrundelsen. Uenighed afgøres ud fra missionen og den tekniske tærskel, ikke ud fra anciennitet eller mængde.

seg-e45e1b565e62 = Den tekniske tærskel (ikke til forhandling)

seg-2c397872e2f5 = Det er faste invarianter, der håndhæves af CI og gennemgang, og som ingen beslutning tilsidesætter:

seg-70cb5a174c2f = <c1/> skal gengive en kørsel bit-for-bit. En ændring, der gør dette ikke-deterministisk, er en fejl, ikke en funktion.

seg-b8733ea97546 = <b>Proveniens.</b> Ingen anonyme numeriske konstanter — hver parameter angiver en kilde.

seg-55a09b775418 = <b>Ærlighed i validering.</b> Hver funktion er mærket <c1/> (mod en uafhængig ekstern reference) eller <c2/> / <c3/>. Intet hævdes ud over sit belæg. Se den maskinkontrollerede matrix i <c4/>.

seg-dd339a396698 = <b>Hygiejne.</b> Ingen angivelse af automatiske værktøjer som ophav nogen steder i commits, indhold eller historik (håndhæves af <c1/>).

seg-45733fea1709 = En ændring, der ikke kan nå tærsklen, afvises, uanset hvor nyttig den ville være.

seg-3eb0831d99a2 = Grænsen mellem åbent og lukket

seg-ca7730a3d518 = Kshana er <b>open core</b>. Dette repositorium er og forbliver den komplette åbne AGPL-3.0-motor — den neutrale reference, kommercielt dobbeltlicenseret af Ashforde OÜ (se <a1><c1/></a1>). Projektet vil <b>ikke</b> tage imod følgende i det åbne repositorium:

seg-8c2a89a3a4e2 = <b>Eksportkontrolleret eller dual-use-dybde</b> — rigtige trusselsbiblioteker, modstanderes signalformer eller ydelsesparametre for anti-jam/anti-spoof. Det offentlige repositorium holder sig til generiske, offentliggjorte modeller og metoder (se <c1/> → Export control). Spørg <em>før</em> du bidrager, hvis du er i tvivl.

seg-6df31d37cfe4 = Kunde- eller partnerfortrolige data eller kalibrering.

seg-b3b4a5384199 = <b>Copyleft-<em>afhængigheder</em> (GPL/AGPL/LGPL/MPL)</b> — ikke fordi de er i konflikt med motorens egen AGPL-licens (det er de ikke), men fordi de ikke kan omlicenseres ind i den <b>kommercielle</b> udgave: vi kan kun sælge en kommerciel licens over kode, vi ejer, eller som er permissiv. En copyleft-afhængighed ville smitte den kommercielle udgave og bryde dobbeltlicensen. Afhængigheder forbliver derfor permissive (Apache/MIT/BSD/ISC), hvilket håndhæves af <a1><c1/></a1>.

seg-ce264f3e43fe = Omvendt vil projektet <b>ikke</b> udhule den åbne kerne for at skubbe proprietær værdi frem: den validerede motor, de offentlige valideringsankre, ærlighedsregisteret, udvekslings-/standardformatet og distributionskanalerne forbliver åbne. At sulte den åbne kerne er den ene skæbnesvangre fejl i open core, og den er ikke til diskussion.

seg-947b3e9b1b2d = Udgivelser

seg-73e2bca0310d = <b>Semantisk versionering.</b> Før 1.0 kan skemaet for scenarier og resultater ændres; brydende ændringer fremhæves, og udvekslingsskemaets version (<c1/>) er den eneste sandhedskilde for artefakters kompatibilitet.

seg-71cace8b6144 = <b>Udgivelsesmyndighed.</b> Publicering (for eksempel <c1/>) er et manuelt trin for vedligeholderen og kræver et registry-token. CI og den tag-styrede Release-workflow publicerer <b>aldrig</b> automatisk til eksterne registre — de kører kun alle kontroller igen og vedhæfter en build-artefakt. Se <c2/> → Commits and versioning.

seg-59c37ffa54f0 = Adfærdskodeks og sikkerhed

seg-2dc8c12568bc = Adfærd er reguleret af <a1><c1/></a1>.

seg-8574b73edbbc = Sikkerhedsproblemer følger den private indberetningsproces i <a1><c1/></a1> — opret ikke en offentlig issue for en sårbarhed.

seg-d86d4e609713 = Varemærke

seg-cb1314b67b2f = Navnet og logoet Kshana er varemærker tilhørende Ashforde OÜ. Licensen (AGPL-3.0 eller en kommerciel licens) dækker <b>koden</b>, ikke mærkerne: en fork må bruge koden under licensen, men ikke navnet Kshana eller den kanoniske distributionsidentitet. Det bevarer Ashforde som den citerede sandhedskilde og er en del af, hvordan den åbne kerne forbliver en neutral reference.

seg-a678f6ed1af8 = Ændring af dette dokument

seg-db90122245fa = Ændringer af styringen foreslås selv som en pull request og afgøres ved processen ovenfor. Når projektets omfang ændrer sig, kan man forvente, at dette dokument får en beslutningsmodel med flere vedligeholdere; den tekniske tærskel bliver ikke sænket.

seg-0a0712cca2e7 = Let af design. Ærlig om i dag, med en angivet vej mod i morgen.

seg-4bfa7cf23a41 = <s1>Forrige</s1>Bidrag

seg-f67113e34738 = <s1>Næste</s1>Adfærdskodeks
