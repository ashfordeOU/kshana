# docs--kind-aperture-duty-cycle: translations (nb)

seg-99ef7c1d552c = Scenariotype i motoren v{ $version }, familien <a1>Oppdragsanalyse, linker og romoperasjoner</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en tjeneste der liv og sikkerhet står på spill. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett oppnås: avsnittet Evidence i README).

seg-8f1e7d3f5a07 = Familieside: <a1>Oppdragsanalyse, linker og romoperasjoner</a1>

seg-4b695c0dfc9f = Kilde: <c1/>

seg-632c0a545845 = <c1/> (scenariotype)

seg-0cef33b41040 = Apertur-driftssyklus: tidsfordelingen mellom navigasjon og kommunikasjon som en kontaktplan innebærer for en pool av styrbare aperturer. Tar en kontaktplan (en liste med <c1/> aos_s/los_s-vinduer, der hvert ber om navigasjon eller kommunikasjon — det samme aos_s/los_s-vokabularet som <c2/>-prediktoren sender ut), et antall aperturer og en ARBITRERINGSPOLICY (navigasjonsprioritet som standard, eller kommunikasjonsprioritet, eller ikke-forkjøpende først-til-mølla), og rapporterer navigasjonsandelen, kommunikasjonsandelen, ledig andel og avbruddet per økt — kontakttiden en økt ba om og ingen apertur betjente. En nøyaktig intervallsveiping over vindusgrensene, slik at vinduer som tangerer hverandre aldri konkurrerer og ingen apertursekund telles to ganger; apertursekunder for navigasjon, kommunikasjon og ledighet akkumuleres uavhengig og lukkes mot apertures*horizon_s. Rapporten oppgir den løste policyen, dens fulle definisjon og definisjonene av andel og avbrudd, fordi en andel oppgitt uten sin arbitreringspolicy ikke er reproduserbar. MODELLED planleggingsaritmetikk: ingen sving-, omstillings- eller byttetid belastes når en apertur bytter tjeneste eller økt, og ingen datavolum, bufferstatus, energibudsjett eller linklukking inngår i avgjørelsen, og kontaktvinduene er inndata — geometrien deres er det som frembrakte dem. Ikke et planleggingsprodukt for bakkesegmentet.

seg-a8d79b8a96bc = Én kjøring av <c1/> oppsummeres som: aperture-duty-cycle: { "6" } session(s) on { "2" } aperture(s) under navigation-priority -> navigation duty { "0.1167" }, communications duty { "0.2667" }, idle { "0.6167" }; { "0" } s of { "6900" } s requested lost to contention (MODELLED)

seg-67c665d5c8c0 = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

seg-60f25ccdab6e = Eksempelet <c1/> setter blant annet:

seg-bf51947657c0 = navigasjon

seg-b4ff1d640bdf = kommunikasjon

seg-2e78730d0737 = aperture*s

seg-330cbcd04718 = andel (uten enhet)

seg-0ef5875db338 = Resultatetikett (motorens): MODELLED — aperture scheduling arithmetic over a supplied contact plan: an exact interval sweep of navigation-versus-communications time-share and per-session contention loss under a named arbitration policy. No slew / retune / changeover time is charged when an aperture changes service or session,

seg-a8b38ed8e029 = Diagrammet motoren skriver for scenarios/aperture-duty-cycle.toml, typen aperture-duty-cycle

seg-4636d450ef60 = <b>MODELLED</b> Én kjøring tar en kontaktplan (en liste med aos_s/los_s-vinduer, der hvert ber aperturen om navigasjon eller kommunikasjon — det samme vindusvokabularet som <c1/> sender ut, konvertert av <c2/>), et apert

seg-7a5aa78533d3 = <b>MODELLED</b> Én kjøring tar en kontaktplan (en liste med aos_s/los_s-vinduer, der hvert ber aperturen om navigasjon eller kommunikasjon — det samme vindusvokabularet som `passes::pre. Uavhengig referanse (InternalConsistency): Intern konsistens, fra tre størrelser beregnet med ulike uttrykk i samme sveip og deretter krevd å lukke. Apertursekunder for navigasjon, kommunikasjon og ledighet akkumuleres hver for seg — ledighet fra (apertures − |served|) per elementærintervall, aldri som en rest — og summen deres kontrolleres mot apertures × horizon_s, noe en feilplassert grense, en dobbelt-c

seg-a388c24fec99 = MODELLED — aperture scheduling arithmetic over a supplied contact plan: an exact interval sweep of navigation-versus-communications time-share and per-session contention loss under a named arbitration policy. No slew / retune / changeover time is charged when an aperture changes service or session, no data volume, buffer state, energy budget or link closure enters the decision, and the contact windows are inputs — th (resultat <c1/>)

seg-e689f30b268a = MODELLED planleggingsaritmetikk: ingen sving-, omstillings- eller byttetid belastes når en apertur bytter tjeneste eller økt, og ingen datavolum, bufferstatus, energibudsjett eller linklukking inngår i avgjørelsen, og kontaktvinduene er inndata — geometrien deres er det som frembrakte dem. (typekatalog (<c1/>))

seg-4aa40af30bd2 = HONEST SCOPE: MODELLED planleggingsaritmetikk over de oppgitte vinduene. Ingen sving-, omstillings- eller byttetid belastes når en apertur bytter tjeneste eller økt; ingen datavolum, bufferstatus, energibudsjett eller linklukking inngår i avgjørelsen; og kontaktvinduene er inndata -- geometrien deres er det som frembrakte dem (scenarioet <c1/> sender ut det samme aos_s / los_s-vokabularet). Ikke et planleggingsprodukt for bakkesegmentet (kommentar i scenariofilen, linje { "18" } til { "24" })

seg-0b7f8d86e5d5 = Apertur-driftssyklus for navigasjon mot kommunikasjon er MODELLED, ikke validert: kontrollert mot sin egen lukkede/analytiske identitet – fanger opp transkripsjons- og koeffisientfeil, men er ikke en uavhengig ekstern referanse. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-dbbefaba93dc = <s1>Forrige</s1>aocs

seg-5b4fd889fdff = <s1>Neste</s1>araim-reference-check
