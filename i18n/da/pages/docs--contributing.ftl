# docs--contributing: translations (da)

seg-c3c260b7063e = Tests

seg-5dce5694e6ec = Kilde: <c1/>

seg-3fa173b79e8f = Bidrag til Kshana

seg-c3a47c614836 = Tak for din interesse. Kshana sigter mod at være en <b>neutral, reproducerbar, ærligt valideret</b> reference for hybrid kvante-/klassisk PNT. Bidrag holdes op mod den tærskel: korrekthed, henvisninger og reproducerbarhed frem for bredde.

seg-5a82a55f7fb2 = Hvordan projektet styres, altså hvem der beslutter, den tekniske tærskel og grænsen mellem åbent og lukket, er beskrevet i <a1><c1/></a1>.

seg-cc8491af7a6f = Udvikling

seg-0163ccdfaa2b = De valgfrie sprogbindinger er feature-gated og slået fra som standard (så buildet ovenfor og afhængighedsrevisionsgaten aldrig berører dem). Sådan arbejder du på dem:

seg-edc8bbab6e92 = Før hver commit: den hurtige løkke

seg-6a7eda7d82b7 = Disse tager sekunder. De er en delmængde af jobbet <c2/> i <c1/>, i samme rækkefølge, så en fejl her er en fejl dér:

seg-d62c1fe22fc4 = <b>Reproducerbarhed er en hård invariant.</b> En ændring, der gør <c1/> ikke-deterministisk, er en fejl. Tilfældighed skal gå gennem den seedede RNG; kvante- og klassiske kørsler bruger uafhængige, deterministisk udledte seeds.

seg-66ea0748c10f = <b>Repository-hygiejne.</b> Commits og indhold må ikke bære attributionsafsnit eller sidefødder fra automatiserede værktøjer og må ikke nævne en AI-assistent som forfatter nogen steder i indhold, filnavne eller historik. Vagten håndhæver det.

seg-fbf423f6fb31 = Før du pusher: den fulde gate

seg-a9176352d3b4 = <c1/> er den kanoniske gate: den kører <c2/> uforkortet og derefter <c3/> for at køre biblioteks-suiten et par gange mere, fordi et kapløb mellem tråde er usynligt ved en enkelt kørsel. Først ved succes skriver den <c4/> (ikke sporet: maskintilstand om én kørsel, ikke indhold).

seg-29815bd89ce2 = Den er langsom med vilje: 62-79 minutter i sund stabil tilstand, ifølge headeren i <c1/>, som bærer det aktuelle tal, og der er ingen timeout, fordi en timeout, der var kort nok til at være nyttig, ville dræbe en sund kørsel. En delmængdekørsel, der kom tilbage grøn, er ikke en gate: begge de fejl, denne mekanisme findes for, nåede igennem på den måde.

seg-408da9a8b8bb = Bidragydere, der arbejder fra en fork, behøver ikke kvitteringskrogen: det er en lokal vedligeholdergate, og <b>CI er det, der faktisk gater en pull request</b>. At køre <c1/>, før du åbner en, betyder blot, at CI ikke fortæller dig noget, du ikke allerede vidste.

seg-9394727b21c3 = Tilføjelse eller ændring af en sensormodel

seg-d9c891ca6827 = <b>Hver numerisk parameter har brug for proveniens.</b> Skriv henvisningen i modellens <c1/>-streng og i scenariefilen. Ingen anonyme konstanter.

seg-d30cb836d4c4 = <b>Valider mod standardrelationen,</b> ikke kun intern konsistens: for eksempel Allan-deviation for ure, Groves' fejlvækst ved dødregning for inertial, omregningen fra tidssynkronisering til afstandsmåling for tidsoverførsel. Tilføj en test af, at det simulerede output gengiver den offentliggjorte værdi eller relationsværdien inden for en angivet tolerance.

seg-b52dd0dd550e = <b>Vær ærlig om modenhed.</b> Statusregistret er <c1/>: tilføj eller ret rækken dér, nævn dens eksterne uafhængige reference (eller sig tydeligt, at der ingen er, hvilket gør den til <c2/>), og generér derefter de offentliggjorte artefakter igen med <c3/>. <c4/>, <c5/> og <c6/> er alle genereret af den funktion og siger »må ikke redigeres i hånden« af en grund. Opdatér også fortællingen i <c7/>, når prosaen har brug for det, og mærk tal, der er mål eller resultater fra jorddemonstratorer, som sådanne.

seg-34b9c8b6f70c = Testdrevet: skriv først den fejlende test, med den forventede værdi <b>udledt i hånden</b> af fysikken eller relationen, før du implementerer.

seg-5322d5b2188c = Deterministiske tests kontrollerer eksakte (håndudledte) værdier; statistiske tests kontrollerer en angivet tolerance og midler helst over seeds for at holde spredningen i skak.

seg-7f76a26c4d5f = Commits og versionering

seg-a1cfb9064694 = <b>Conventional Commits</b> (<c1/>, <c2/>, <c3/>, <c4/>, <c5/> …).

seg-1a13616ca0ac = <b>Semantic Versioning.</b> Før 1.0 kan scenarie- og resultatskemaet ændre sig; fremhæv ændringer, der bryder kompatibilitet.

seg-0e3036c27aa8 = <b>Udgivelser udløses af et <c1/>-tag, og publiceringen er automatisk, men ordnet.</b> Auto-tag-workflowet pusher tagget, når CI er grøn på <c2/> ved et versionsspring. Release-workflowet kører den fulde verifikation på det taggede commit, og først når den består, publicerer det til crates.io, Python Package Index (PyPI), npm, ghcr.io, Model Context Protocol (MCP)-registret og JetBrains Marketplace; derefter kontrollerer det, at hver kanal serverer versionen, og genopbygger kshana.dev fra tagget. Ingen kører <c3/> i hånden. Trinene og hvordan en mislykket publicering forsøges igen står i <a1><c4/></a1>.

seg-18ca89a2c573 = Vedligeholdelse af changelog (påkrævet)

seg-1f7e1d73c2ef = Hver ændring, brugeren kan se, opdaterer <a1><c1/></a1>:

seg-1448e96afbbc = Tilføj en post under afsnittet <b><c1/></b>, i den rigtige gruppe (<c2/> / <c3/> / <c4/> / <c5/> / <c6/> / <c7/>).

seg-76ddc53c752e = Ved udgivelse omdøbes <c1/> til den nye <c2/>, der startes en ny <c3/>, hæves <c4/> i <c5/> (så <c6/> i resultat-JSON svarer til), opdateres sammenligningslinkene nederst, og <c7/> tagges.

seg-ed680e59377c = Hold poster korte og brugerrettede; link til issues/PR'er, hvor det er nyttigt.

seg-fe83216ebeed = En pull request, der ændrer adfærd uden en post i changelog, er ufuldstændig.

seg-776cd2ef0b0c = Eksportkontrol

seg-d0f1db9798a6 = PNT-robusthed og kvantesensorer kan berøre eksportkontrol af produkter med dobbelt anvendelse. Hold det offentlige repository til generiske, offentliggjorte modeller og metoder. Alt, der ligner eksportfølsom dybde i robusthed eller anti-spoofing, hører hjemme i det private overlay, ikke her. Er du i tvivl, så spørg, før du bidrager med det.

seg-506a29aafc12 = Licens

seg-c0409a1226ca = Kshana har dobbelt licens (AGPL-3.0 <b>eller</b> en kommerciel licens fra Ashforde OÜ, se <a1><c1/></a1>). For at det kan blive ved med at fungere, skal bidrag kunne bruges under <b>begge</b> licenser. Ved at bidrage accepterer du derfor, at:

seg-da7b02ac890c = dit bidrag licenseres indgående under <b>AGPL-3.0-only</b>; og

seg-8d6ed0d3a17f = du <b>også giver Ashforde OÜ</b> en evig, verdensomspændende, royaltyfri, uigenkaldelig licens til at bruge, ændre og <b>relicensere dit bidrag som en del af Kshanas kommercielt licenserede udgave</b> (dvs. også at distribuere det på kommercielle vilkår, der ikke er AGPL). Du beholder ophavsretten til dit bidrag.

seg-3b1a0dd6b5aa = Denne lette dobbeltlicenstildeling, som ikke er en overdragelse af ophavsret, er det, der lader projektet være åbent <em>og</em> tilbyde en kommerciel udgave. Hvis du ikke kan give ({ "2" }) (for eksempel kode, der ejes af en arbejdsgiver), så sig det i din pull request, før du bidrager.

seg-6630d0ac4ad5 = <b>Undtagelse: <c1/>.</b> Den mappe er licenseret under <b>GPL-3.0-or-later</b> (se dens <c2/>) og ligger udenfor den kommercielle licens. Bidrag til den licenseres indgående kun under GPL-3.0-or-later <b>only</b>; tildeling ({ "2" }) gælder ikke for dem.

seg-0a78a12b1188 = Underskriv hvert commit for at bekræfte <a1>Developer Certificate of Origin</a1>: <c1/> (tilføjer en linje <c2/>).

seg-9f86d8f58b17 = <s1>Forrige</s1>Sikkerhed

seg-fc760238e9a5 = <s1>Næste</s1>Styring
