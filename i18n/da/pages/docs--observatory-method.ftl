# docs--observatory-method: translations (da)

seg-0857a94a948e = Begrænsninger

seg-2247a2344710 = Betydning

seg-b652b86e6b8e = Tilstand

seg-7ca62fa39e10 = Kilde: <c1/>

seg-48e063b567d0 = Interferensobservatoriet: metodenote

seg-d0e1d6cadc10 = Version <c1/>, bygget på <c2/>. Kun vejledende: dette er en beskrivelse af, hvordan offentliggjorte positionsrapporter så ud på tidligere dage, ikke en måling af nogen modtager, ikke en prognose, ikke en bekræftelse af interferens og ikke en tilskrivning af dens årsag.

seg-c5eab49b8d6f = Hvad observatoriet udgiver

seg-165ae7646608 = Ét produkt pr. UTC-dag og region fra ét åbent arkiv over flypositioner. Hver celle i et fast bredde-længdegitter på 0.5 grad er i én af <b>tre tilstande</b>:

seg-cc07647eb12e = En høj andel af de fly, der er stikprøvet i cellen, rapporterede den dag lav navigationsnøjagtighed, tydeligt over dagens baggrund.

seg-3e1dd7caaee6 = Der var stikprøvet nok fly, og andelen opfyldte ikke reglen.

seg-8f0d9ad60d62 = Data tillod ikke en afgørelse. Dette er <b>ikke</b> "klart". Hver sådan udgivet celle bærer en dataårsag: <c1/>, <c2/> eller <c3/>. En celle uden nogen post blev set af færre end { "5" } forskellige fly og tilbageholdes.

seg-e49e05b47061 = Intet andet udgives: ingen årsag, ingen aktør, ingen post pr. fly. Årsagerne beskriver, om dagens data var tilstrækkelige, aldrig hvorfor nøjagtigheden var lav.

seg-7b251c7860e0 = Tre filer pr. dag (<c1/>):

seg-2008b0ba6ac7 = <c1/>: cellerne med <c2/> <c3/>, metoden og dens præregistrerede parametre, licensen og kildeangivelsen, udgivelsesreglen og en meddelelse.

seg-7d5b16eac4a3 = <c1/>: de samme celler som et billede (forringet, ikke forringet, ikke observeret skraveret; tomme celler blev ikke observeret). Tekstblokke i filen gentager meddelelsen og licensen.

seg-b76d2e071b16 = <c1/>: <c2/> <c3/>. Sammenhængende forringede celler (diagonaler medregnet) udgør én hændelse med en afgrænsningsboks og sine celler. <c4/> er den faste tekst <c5/>. Filen er et input til en cyklus med rapportering, bekræftelse og underretning (luftfartens rapporteringscyklus, der ender i en NOTAM); den er ikke en bekræftelse og ikke en NOTAM.

seg-49b7bdae0d6e = og en <c1/> med bytetal og SHA-256 for de tre filer, metode-id'et, inputtællerne (læste og udelukkede rækker) og datasætblokken, så et produkt kan kontrolleres og gengives.

seg-d7bb390fb986 = Udgivelsesregler (håndhævet af kommandoen)

seg-87147317f8da = <b>Mindst { "24" } t forsinkelse.</b> En dags produkt udgives tidligst ved udgangen af den UTC-dag plus <c1/> ({ "24" } eller mere; en mindre værdi afvises). Kommandoen afviser en dag, der endnu ikke kan udgives, og angiver det tidligste tidspunkt. Der er ingen kontakt til at forkorte den.

seg-43960c3f9b6c = Grove celler.

seg-1a5ff10e5240 = <c1/> under { "0.5" } afvises.

seg-e70d8d7f9980 = <b>Undertrykkelse.</b> En celle, der er set af færre end { "5" } forskellige fly, udgives ikke; et tal under { "5" } er <c1/> (nul medregnet), som i grundmetoden.
