# docs--resilience-crosswalk: translations (sv)

seg-88372b30ed79 = Gräns

seg-aab745a65e76 = Modul

seg-ad856ad710eb = Status

seg-b03d56f501c3 = Typ

seg-4dbf41c0ec3b = Funktion

seg-f472e43c1100 = Vad den visar

seg-fa4468d4cb80 = Tillgänglighet

seg-fe4d868448ef = Källa: <c1/>

seg-d745715d5332 = Korstabell mot ramverk för PNT-resiliens

seg-aa1c24d63df5 = <b>Anpassad till, inte betygsatt eller godkänd.</b> Den här tabellen kopplar Kshanas simulerade förmågor till de publicerade ramverken för PNT-resiliens (PNT: positionering, navigering och tidssynkronisering). Den är en <em>simuleringsbaserad självbedömning som är anpassad till</em> DHS/CISA (DHS: Department of Homeland Security; CISA: Cybersecurity and Infrastructure Security Agency) Resilient PNT Conformance Framework (RPCF) v2.0, modellen Resist-Detect-Respond-Recover (RDRR) från RethinkPNT/Firesmith och Yang Yuanxis kriterier för resilient PNT. Den är <b>inte</b> ett betyg, ett godkännande, en ackreditering eller ett compliance-uttalande, och den bär inget stöd från DHS, IEEE (Institute of Electrical and Electronics Engineers) eller någon myndighet. Varje rad är märkt med sin ärliga verifieringsstatus (<c1/> mot en extern oberoende referens, eller <c2/> utifrån grundprinciper med tester); själva lagret för resiliensbedömning är <b>MODELLED</b>. Två av dess kärnor har egna VALIDATED-rader i verifieringsmatrisen, kärnan för invers-Simpson-diversitet (<c3/>) och kärnan för rangordningsstatistik (<c4/>); det validerar aritmetiken, inte de poäng som bygger på den.

seg-652fcf3ec12d = Bedömningsmotorn (<c1/>) förbrukar dessa förmågor och ger delpoäng per dimension, aldrig ett enda fantomtal. Se <c2/> för de maskinkontrollerade statusinvarianterna.

seg-7a71de89a9fd = DHS RPCF v2.0: vad ramverket definierar, och Kshanas egna delpoängskategorier

seg-1985dbfe351d = Det publicerade ramverket (Resilient PNT Conformance Framework, Version { "2.0" }, { "26" } april { "2022" }, DHS Science and Technology Directorate med CISA) definierar tre <b>kärnfunktioner</b> (avsnitt { "5.2" }: Prevent, Respond, Recover), <b>resiliensnivåer { "0" } till { "4" }</b> (avsnitt { "5.3" }) och <b>åtta numrerade minimikrav</b> fördelade över nivåerna { "1" } till { "4" } (avsnitt { "5.3" }, återgivna i { "5.5" }), plus ett utvärderingsupplägg (avsnitt { "8" }). Det definierar <b>inte</b> en lista med sju tekniska kategorier. En tidigare version av den här sidan, och kommentarerna i resiliensmodulen, beskrev sju "RPCF technique categories"; orden Obfuscate och Diversify förekommer inte i v2.0. Dokumentets text lästes om den 2026-10-09 och ingen sådan lista hittades.

seg-178d1e119dce = De sju delpoängsnamn som bedömningsmotorn ger (Obfuscate, Limit, Verify, Isolate, Diversify, Mitigate, Recover; "OLVIDMR" är vår minnesregel) är därför <b>Kshanas egna bedömningskategorier</b>, bevarade för stabil utdata. De är inte DHS-termer och raderna nedan säger inte att DHS kräver dem. Där en kategori motsvarar ett krav i ramverket anger sista kolumnen det; där den inte gör det står det "none".

seg-5a9eb11bb965 = Kshanas delpoängskategori

seg-e117e6f71845 = Kshana-förmåga som används som drivare

seg-7677dafa7016 = Närmaste referens i RPCF v2.0

seg-27e0f6b39605 = Obfuscate

seg-7327b9cbc106 = Deklarerad teknik × källkvalitet (ingen direkt beteendedrivare)

seg-b63e61fa5fa2 = none (en förebyggande teknik; avsnitt { "5.2" }, Prevent)

seg-7ed4f2e21189 = Deklarerad teknik × källkvalitet

seg-8579207ae2e5 = Verify

seg-30b8cb030965 = AUC (area under kurvan) för störningsdetektorn under scenariot (monitorer för spoofing/jamming/meaconing)

seg-3d358c029f50 = Nivå { "2" } krav { "4" }; nivå { "3" } krav { "7" }

seg-fcb8cb7d4c97 = Isolate

seg-b3cd355743da = Nivå { "3" } krav { "6" }

seg-ffa87d149a20 = Diversify

seg-1282685a888b = Antal oberoende grupper → effektiv diversitet enligt invers Simpson

seg-f0dd4c4ef1c5 = Nivå { "4" } krav { "8" }; avsnitt { "5.5" } (gemensamt läge)

seg-2d91b12a9e56 = Mitigate

seg-d183b552df76 = Tillgänglighet under nekande

seg-c337df73e231 = avsnitt { "5.2" }, Respond

seg-2da4df22d35d = Recover

seg-85d7e3292549 = Holdover-svängning × spärr för begränsad försämring

seg-3aec9f076902 = Nivå { "2" } krav { "5" }; avsnitt { "5.2" }, Recover

seg-36958650abc0 = Kopplingen per krav till det verkliga ramverket, med vad Kshanas utdata ger belägg för och vad som blir över, finns i <a1>compliance/dhs-rpcf.md</a1>.

seg-a085dd81c769 = RDRR-funktioner från RethinkPNT / Firesmith

seg-1b972717180b = Drivare

seg-6eaf161f8871 = Resist

seg-6046a8914dc7 = Medelvärde av delpoängen Obfuscate/Limit/Isolate/Diversify

seg-242e2c01ebc2 = Detect

seg-45c8da13581f = Delpoäng Verify (detektorns AUC)

seg-d29232baaaa6 = Respond

seg-36ab7ce187e6 = Delpoäng Mitigate (tillgänglighet)

seg-f98dc190541c = Holdover × begränsad spärr; nyckeltal (KPI:er: detect/react/recover/loss) för resiliens-tidslinjen

seg-e7190928bed6 = Yang Yuanxis kriterier (den delmängd som kvalitetsmåtten för tidssynkronisering/detektion ger underlag för)

seg-52836e247425 = Kriterium

seg-cbbe4c0baf3f = Tillförlitlighet

seg-32d64f865b21 = Andel filterintegritet

seg-214372f29bd1 = Kontinuitet

seg-ad5e76a596b8 = Holdover × begränsad spärr

seg-d92fb15e6dfa = Noggrannhet

seg-0de1f9119e0f = Ersättningsmått för tidssynkronisering/kvalitet — <b>noggrannhet i positionsdomänen ingår inte i poängen</b>. <c1/> gör en angiven positionskovarians och HPL (horisontell skyddsnivå) till CEP/SEP/2DRMS (cirkulärt sannolikt fel, sfäriskt sannolikt fel, två gånger kvadratmedelvärdet av avståndet), men inget scenario matar in den i resilienspoängen

seg-0aa925a09499 = MODELLED (endast tidssynkroniseringsdomänen)

seg-6b661e6e4399 = Vad den här korstabellen inte gör anspråk på

seg-51a48d0c718d = Ingen tilldelad RPCF-nivå. Den angivna nivån är en <em>preliminär, simuleringsbaserad</em> avläsning med en uttrycklig spärr för begränsad försämring, inte en tilldelad mognadsgrad.

seg-df73b7c76ae5 = Ingen noggrannhet i positionsdomänen i poängen. Resiliensens delpoäng byggs av mått för tidssynkronisering och detektion. Motorn beräknar visserligen positioner på andra ställen (typerna <c1/>, <c2/> och <c3/>) och skyddsnivåer (typen <c4/>), men bedömningslagret förbrukar dem inte.

seg-30a1b1a4dfea = Ingen fältvalidering. Referenspanelen och hotensemblen är syntetiska, parameterförankrade förenklingar (<c1/>), angivna som en förstklassig begränsning.

seg-83c465cd78b0 = Följestudien (<c1/>) finns just för att visa att ett hopslagande av dessa dimensioner till en enda sammansatt poäng eller en enda nivå ger ett betyg vars rangordning av arkitekturer är instabil under försvarbara viktnings- och hotval — så den här korstabellen är ett mätlager som ska läsas per dimension, inte ett enda betyg att betygsätta en produkt mot.

seg-32bd45dc031d = Resiliens- och vertikalscenarier som utnyttjar dessa lager

seg-4e36adba1c55 = De medföljande scenarierna nedan kör det hot- och återhämtningsmaskineri som raderna i korstabellen pekar på. Vart och ett är en verklig körning av den namngivna typen; varje är <b>MODELLED</b> (inga fältdata).

seg-44664e49d449 = Scenario (<c1/>)

seg-44b8d7435bfd = Skiktad PNT under ett gemensamt jamming-/spoofinghot: en seedad Monte Carlo av skiktnekande, inversvariansfusion av de överlevande, kvoten för total förlust mellan ett enskilt skikt och skiktad lösning, och hur korrelerat nekande kollapsar den kvoten. Dess identiteter mellan Monte Carlo och sluten form samt för fusionen kontrolleras av tester i craten; typen har ingen rad i verifieringsmatrisen, så den graderas MODELLED här.

seg-1734506ad287 = GNSS (globalt navigationssatellitsystem) störs ut, ett PNT-skikt i låg omloppsbana (LEO) bär användaren, integriteten bibehålls (tre faser på en tidslinje).

seg-ff8cc090bdce = En jammer mot en mottagare med fyra band; vilken spoofingmonitor som ser vilken spoofer.

seg-0a93502a4a19 = Marginalen för jammer-till-signal (J/S) utifrån mottagen effekt.

seg-f2230253bdff = Spoofingdetektion genom konsistens i Doppler och passagegeometri.

seg-d8ca900a8c14 = Tidssynkronisering för basstationer och kritisk infrastruktur i holdover, med LEO-tid.

seg-2a61d07bf177 = Användare av väg, järnväg, sjöfart, polarområden och sakernas internet (IoT) med ett LEO-skikt.

seg-8723073167ad = Dödräkning med GNSS/INS (tröghetsnavigeringssystem) genom en urban kanjon och genom jamming på ett litet obemannat flygplan.

seg-6ee1ef707b20 = Hur länge ett INS håller ett fartyg eller ett tåg inom sin gräns när GNSS nekas.

seg-7ca913e1729b = En maritim jammer; detektion av en spoofer som drar ett fartygs rapporterade position.

seg-c49548e8393b = <s1>Föregående</s1>Karta över DO-316 / DO-229E

seg-dedf3b53d31f = <s1>Nästa</s1>Mottagarförtroende
