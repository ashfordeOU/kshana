# docs--observatory-results: translations (nb)

seg-69304b8b186b = Kilde: <c1/>

seg-df5b53307f50 = Observatorieresultater: 30 dagers baltisk etterkatalog og sensitivitetsstudie

seg-072bdea11014 = Versjon <c1/> over <c2/> (parametrene er forhåndsregistrert i grunnmetoden, uendret). MODELLED: det finnes ingen ekstern uavhengig referanse, ingen referansesannhet og ingen årsakstilskriving. En degradert celle betyr at en høy andel av flyene som ble samplet der, rapporterte lav navigasjonsnøyaktighet den dagen; den sier ikke hvorfor. En celle som ikke er observert, eller som mangler, ble ikke vurdert, og det er ikke det samme som klar.

seg-0d1eeedcab3a = Hva som ble kjørt

seg-df6ddf801a25 = <b>Kilde:</b> adsb.lol readsb-historikk (ODbL { "1.0" }), GitHub-utgivelse <c1/> av <c2/>, hentet med <c3/> én del om gangen (omtrent { "3.4" } GB per dag, { "2" } deler). Utgiveren oppgir ingen sjekksummer, så SHA-256 for hver del er registrert i <c4/>.

seg-9fa2d2319ed3 = <b>Region og dager:</b> boksen { "53.5" }, { "9.0" }, { "66.0" }, { "31.0" } (sør, vest, nord, øst: Østersjøen og kystene rundt), { "30" } UTC-dager fra 2026-09-15 til 2026-10-14, celler på { "0.5" } grad, med <c1/> (én dag om gangen, rå filer slettet etter hver dag).

seg-8b65d148bbd8 = <b>Utgivelsesregler:</b> den nyeste dagen (2026-10-14) var mer enn { "24" } t forbi slutten da den ble produsert; kommandoen avviser ellers. Regionale kjøringer beregner utstyrsgrunnlinjen og dagens bakgrunn bare fra rapportene i boksen (<c1/>).

seg-64581554e84a = <b>Filer:</b> de { "120" } produktfilene (GeoJSON, PNG, hendelses-JSON, manifest per dag) er <b>ikke i git</b>. Hashen til hver fil står i <c1/>, og en dag kan bygges opp igjen fra arkivet sitt og sammenlignes.

seg-c89b88dc3d3b = Eksempel på hva en dag leser: 2026-09-15 inneholdt arkivet { "110,619,797" } posisjonsrader i { "79,826" } sporfiler; { "103.0" } millioner var utenfor boksen, { "5.6" } millioner var ikke ADS-B, { "1.2" } millioner var på bakken eller under { "5,000" } ft, { "0.6" } millioner hadde ikke noe nøyaktighetsfelt, og { "212,426" } ble aggregert (inndatatellerne i <c1/>).

seg-cc590aa74075 = Tre dager (2026-09-18, 2026-09-26, 2026-10-03) ble hentet på nytt fra arkivet og kjørt en gang til: GeoJSON, PNG og hendelsesfilen er <b>byte-identiske</b> med første kjøring (SHA-256 lik), så produktet er deterministisk selv om saltet for identifikatorhashen er tilfeldig per kjøring.

seg-3532be519183 = Sammendrag av etterkatalogen

seg-56aae646318e = UTC-dag

seg-42784010b115 = publiserte celler

seg-2672b7f55371 = degradert

seg-378ee89e4bd3 = ikke degradert

seg-14783d89f2fe = ikke observert (publisert)

seg-711d143678ae = hendelser

seg-0f1ffe21d381 = { "30" } dager: { "96" } degraderte celler til sammen, { "28" } av de { "30" } dagene med minst én, { "70" } hendelser (klynger av degraderte celler som berører hverandre), ingen dag med dagsomfattende effekt. Medianandelen av berørte fly per celle (dagens bakgrunn) er { "0" } på { "29" } dager og { "0.006" } på én, så bakgrunnsvernet (en celle må overstige bakgrunnen med { "0.15" }) endret aldri en vurdering i denne regionen. Antallet degraderte celler per dag går fra { "0" } til { "8" } (gjennomsnitt { "3.2" }). Omtrent en tredjedel av de publiserte cellene hver dag er <c1/> (for få fly samplet): dekning er grensen for dette produktet, ikke himmelen.

seg-606aed861c95 = Hva dette ikke sier: dagene med flere degraderte celler er ikke «verre» i noen fysisk forstand, et vedvarende påvirket område ville bli undervurdert (fly som bare flyr innenfor det hele dagen har ingen grunnlinje utenfor og telles ikke), og ingenting her sier hvem eller hva som forårsaket lav nøyaktighet.

seg-ef37626a4c47 = Sensitivitetsstudie (tre dager)

seg-aacbb761ee19 = <c1/> spiller av én dags registrerte rapporter på nytt under endringer av de registrerte parametrene én om gangen (to verdier hver, pluss et rutenett på { "1.0" } grad). Dager: 2026-09-18 (flest degraderte celler, { "8" }), 2026-09-26 ({ "1" } degradert celle) og 2026-10-03 ({ "0" }). Fullstendige rapporter: <c2/> ({ "23" } varianter hver; { "2.2" }, { "1.7" } og { "1.7" } millioner rader spilt av på nytt). Degraderte celler under hver variant (registrert verdi i parentes; det registrerte resultatet er { "8" }, { "1" } og { "0" } degraderte celler):

seg-dfced7e594d2 = parameter (registrert)

seg-2ac3e771679d = verdi

seg-0953dbfd76db = rutenett { "0.5" } grader

seg-bf5746d1a110 = { "2" } (grovere celler)

seg-e4016df2fcd3 = Slik leser vi det, uten å utpeke en vinner:

seg-81cfcbf0de89 = Vurderingene er følsomme for nøyaktighetskodeterskelene og samplingsreglene, og de små tallene flytter seg mye.

seg-097ed1aa1504 = <c1/>, <c2/> og <c3/> endrer hver antallet degraderte celler med en faktor på to eller mer hver dag; å slakke <c4/> til { "6" } gjør { "1" } degradert celle til { "12" } 09-26 (Jaccard med det registrerte settet { "0.08" }). 09-18 beholder { "1" } av de { "8" } når <c5/> heves til { "0.4" } (Jaccard { "0.125" }). En cellevurdering nær terskelverdiene er like mye en påstand om terskelverdiene som om dataene.

seg-0d0c96099d30 = <b><c1/> flytter mest celler mellom ikke degradert og ikke observert</b>: 09-18 lar den antallet degraderte stå på { "8" } mens { "21" } til { "56" } celler skifter tilstand.

seg-04cc05318a5d = <b>Tre vern er inaktive her</b>: <c1/>, <c2/> og <c3/> endrer ingenting noen av de tre dagene (bakgrunnsandelen er { "0" }), så denne regionen og perioden sier ingenting om hvor godt de virker. De ville ha betydning der en regional effekt hever bakgrunnen.

seg-7ba403b84fbd = <b>Et grovere rutenett ({ "1.0" } grad) endrer bildet</b> ({ "2" }, { "3" } og { "1" } degraderte celler; de publiserte cellene faller til omtrent en tredjedel, { "226" } mot { "694" } 09-18, fordi hver celle er fire ganger større): cellestørrelse er et metodevalg, og observatoriet fastsetter den til { "0.5" } grader.

seg-4db2f5313410 = En dag uten registrert degradert celle (10-03) har degraderte celler under { "9" } av de { "22" } variantene som ikke gjelder rutenettet (opptil { "8" } med <c1/> { "6" }): «ingen degradert celle» er også en terskelavhengig påstand.

seg-a818be844f3a = Ingen variant er et validert alternativ, og den registrerte regelen er uendret av denne studien. Studien sier ikke hvilke parameterverdier som er riktige.

seg-98c799bfbc25 = <s1>Forrige</s1>Interferensobservatoriet: metode

seg-5d0c003e73dc = <s1>Neste</s1>kshana-bench
