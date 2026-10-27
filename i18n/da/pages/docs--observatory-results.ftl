# docs--observatory-results: translations (da)

seg-69304b8b186b = Kilde: <c1/>

seg-df5b53307f50 = Observatoriets resultater: 30 dages baltisk tilbagekatalog og følsomhedsstudie

seg-072bdea11014 = Version <c1/> over <c2/> (parametre præregistreret i grundmetoden, uændrede). MODELLED: der er ingen ekstern uafhængig reference, ingen grundsandhed og ingen tilskrivning af årsag. En forringet celle betyder, at en høj andel af de fly, der blev stikprøvet dér, den dag rapporterede lav navigationsnøjagtighed; den siger ikke hvorfor. En celle, der ikke er observeret eller er fraværende, blev ikke vurderet, hvilket ikke er det samme som klar.

seg-0d1eeedcab3a = Hvad der blev kørt

seg-df6ddf801a25 = <b>Kilde:</b> adsb.lol readsb-historik (ODbL { "1.0" }), GitHub-udgivelse <c1/> af <c2/>, hentet af <c3/> én del ad gangen (omkring { "3.4" } GB om dagen, { "2" } dele). Udgiveren angiver ingen kontrolsummer, så SHA-256 af hver del er optaget i <c4/>.

seg-9fa2d2319ed3 = <b>Region og dage:</b> boksen { "53.5" }, { "9.0" }, { "66.0" }, { "31.0" } (syd, vest, nord, øst: Østersøen og dens kyster), { "30" } UTC-dage fra 2026-09-15 til 2026-10-14, celler på { "0.5" } grad, ved <c1/> (én dag ad gangen, rå filer slettet efter hver dag).

seg-8b65d148bbd8 = <b>Udgivelsesregler:</b> den nyeste dag (2026-10-14) var mere end { "24" } t forbi sin afslutning, da den blev produceret; kommandoen afviser det ellers. Regionale kørsler beregner udstyrsbaselinen og dagens baggrund kun ud fra boksens rapporter (<c1/>).

seg-64581554e84a = <b>Filer:</b> de { "120" } produktfiler (GeoJSON, PNG, hændelses-JSON, manifest pr. dag) er <b>ikke i git</b>. Hashværdien af hver fil står i <c1/>, og en dag kan genopbygges fra sit arkiv og sammenlignes.

seg-c89b88dc3d3b = Eksempel på, hvad en dag læser: den 2026-09-15 indeholdt arkivet { "110,619,797" } positionsrækker i { "79,826" } sporfiler; { "103.0" } millioner lå uden for boksen, { "5.6" } millioner var ikke ADS-B, { "1.2" } millioner var på jorden eller under { "5,000" } ft, { "0.6" } millioner bar intet nøjagtighedsfelt, og { "212,426" } blev aggregeret (<c1/>-inputtællere).

seg-cc590aa74075 = Tre dage (2026-09-18, 2026-09-26, 2026-10-03) blev hentet igen fra arkivet og kørt en anden gang: GeoJSON, PNG og hændelsesfilen er <b>byte-identiske</b> med den første kørsel (SHA-256 ens), så produktet er deterministisk, selv om saltet til identifikatorhashen er tilfældigt pr. kørsel.

seg-3532be519183 = Oversigt over tilbagekataloget

seg-56aae646318e = UTC-dag

seg-42784010b115 = udgivne celler

seg-2672b7f55371 = forringet

seg-378ee89e4bd3 = ikke forringet

seg-14783d89f2fe = ikke observeret (udgivet)

seg-711d143678ae = hændelser

seg-0f1ffe21d381 = { "30" } dage: { "96" } forringede celler i alt, { "28" } af de { "30" } dage med mindst én, { "70" } hændelser (klynger af sammenhængende forringede celler), ingen dag med en effekt for hele dagen. Den mediane celleandel af påvirkede fly (dagens baggrund) er { "0" } på { "29" } dage og { "0.006" } på én, så baggrundsværnet (en celle skal overstige baggrunden med { "0.15" }) ændrede aldrig en afgørelse i denne region. Antallet af forringede celler pr. dag ligger fra { "0" } til { "8" } (gennemsnit { "3.2" }). Omkring en tredjedel af de udgivne celler hver dag er <c1/> (for få fly stikprøvet): dækningen er dette produkts grænse, ikke himlen.

seg-606aed861c95 = Hvad dette ikke siger: de dage med flere forringede celler er ikke "værre" i nogen fysisk forstand, et vedvarende påvirket område ville blive undervurderet (fly, der kun flyver inde i det hele dagen, har ingen baseline uden for det og tælles ikke med), og intet her siger, hvem eller hvad der forårsagede lav nøjagtighed.

seg-ef37626a4c47 = Følsomhedsstudie (tre dage)

seg-aacbb761ee19 = <c1/> afspiller én dags optagne rapporter igen under ændringer af de registrerede parametre én ad gangen (to værdier hver, plus et gitter på { "1.0" } grad). Dage: 2026-09-18 (de fleste forringede celler, { "8" }), 2026-09-26 ({ "1" } forringet celle) og 2026-10-03 ({ "0" }). Fulde rapporter: <c2/> ({ "23" } varianter hver; { "2.2" }, { "1.7" } og { "1.7" } millioner rækker afspillet igen). Forringede celler under hver variant (registreret værdi i parentes; det registrerede resultat er { "8" }, { "1" } og { "0" } forringede celler):

seg-dfced7e594d2 = parameter (registreret)

seg-2ac3e771679d = værdi

seg-0953dbfd76db = gitter { "0.5" } grad

seg-bf5746d1a110 = { "2" } (grovere celler)

seg-e4016df2fcd3 = At læse det uden at udpege en vinder:

seg-81cfcbf0de89 = Afgørelserne er følsomme over for tærsklerne for nøjagtighedskoderne og for stikprøvereglerne, og de små tal rykker sig meget.

seg-097ed1aa1504 = <c1/>, <c2/> og <c3/> ændrer hver antallet af forringede celler med en faktor to eller mere hver dag; at lempe <c4/> til { "6" } gør { "1" } forringet celle til { "12" } den 09-26 (Jaccard med det registrerede sæt { "0.08" }). Den 09-18 beholder en forhøjelse af <c5/> til { "0.4" } { "1" } af de { "8" } (Jaccard { "0.125" }). En celleafgørelse nær tærsklerne er lige så meget en udtalelse om tærsklerne som om dataene.

seg-0d0c96099d30 = <b><c1/> flytter mest celler mellem ikke forringet og ikke observeret</b>: den 09-18 lader den antallet af forringede stå på { "8" }, mens { "21" } til { "56" } celler skifter tilstand.

seg-04cc05318a5d = <b>Tre værn er inaktive her</b>: <c1/>, <c2/> og <c3/> ændrer intet på nogen af de tre dage (baggrundsandelen er { "0" }), så denne region og periode siger intet om, hvor godt de virker. De ville have betydning, hvor en regional effekt hæver baggrunden.

seg-7ba403b84fbd = <b>Et grovere gitter ({ "1.0" } grad) ændrer billedet</b> ({ "2" }, { "3" } og { "1" } forringede celler; de udgivne celler falder til omkring en tredjedel, { "226" } mod { "694" } den 09-18, fordi hver celle er fire gange så stor): cellestørrelse er et metodevalg, og observatoriet fastsætter den til { "0.5" } grad.

seg-4db2f5313410 = En dag uden registreret forringet celle (10-03) har forringede celler under { "9" } af de { "22" } varianter uden gitter (op til { "8" } med <c1/> { "6" }): "ingen forringet celle" er også en tærskelafhængig udtalelse.

seg-a818be844f3a = Ingen variant er et valideret alternativ, og den registrerede regel er uændret af dette studie. Studiet siger ikke, hvilke parameterværdier der er rigtige.

seg-98c799bfbc25 = <s1>Forrige</s1>Interferensobservatoriet: metode

seg-5d0c003e73dc = <s1>Næste</s1>kshana-bench
