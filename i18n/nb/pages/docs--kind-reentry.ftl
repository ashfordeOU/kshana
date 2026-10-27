# docs--kind-reentry: translations (nb)

seg-99ef7c1d552c = Scenariotype i motoren v{ $version }, familien <a1>Oppdragsanalyse, linker og romoperasjoner</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en tjeneste der liv og sikkerhet står på spill. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett oppnås: avsnittet Evidence i README).

seg-8f1e7d3f5a07 = Familieside: <a1>Oppdragsanalyse, linker og romoperasjoner</a1>

seg-3a3ee499961e = <b>MODELLED</b> Plan gravitasjonssving-oppskyting av et flertrinns fartøy over en ikke-roterende, sfærisk jord gjennom US Standard Atmosphere { "1976" } (tetthet og trykk), med en pitch-spark, skyv redusert av dysens mottrykk, trinnenes brenntid slutt ved eksakt s

seg-8e62cc4af6ea = Temaside: <a1>ENTRY-EO-ASCENT.md</a1>

seg-05ce408c2dbb = kg/m^{ "2" }

seg-195347c63a8a = m/s^{ "2" }

seg-c95aec0d2943 = Kilde: <c1/>

seg-91424dc65b3e = <c1/> (scenariotype)

seg-039f77066d97 = Ballistisk gjeninntrengingskorridor etter Allen-Eggers: maksimal retardasjon (uavhengig av ballistisk koeffisient, V_e^{ "2" } sin|γ|/(2eH)), hastigheten og høyden ved maksimal g, og hastigheten ved maksimal oppvarming, for en inntrengingshastighet, banevinkel og ballistisk koeffisient gjennom en eksponentiell atmosfære, pluss en plan punktmasseintegrasjon av den samme ballistiske inntrengingen med tyngdekraft, jordkrumning og US Standard Atmosphere { "1976" } (maksimal retardasjon, fart, høyde og tid ved maksimum). MODELLED ballistisk inntrenging (uten løft); oppvarmingsutdataene er HASTIGHETEN ved maksimal oppvarming, ikke en varmefluks (ingen aerotermisk modell eller TPS-modell).

seg-9908d06c50eb = En kjøring av <c1/> oppsummeres slik: reentry (Allen–Eggers): V_e { "7800" } m/s, γ { "6.0" }° -> peak { "16.6" } g at { "49" } km, { "4731" } m/s; heating peaks at { "6603" } m/s; point mass (gravity, curvature, US76) peak { "16.4" } g (MODELLED ballistic, no aerothermal)

seg-f057c2a160e7 = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-576245fd5b70 = Eksempelet <c1/> angir blant annet:

seg-0b7769c97ff3 = Resultatetikett (motorens): MODELLED — ballistisk inntrenging (uten løft) etter Allen–Eggers, eksponentiell isoterm atmosfære, konstant banevinkel; maksimal g er uavhengig av ballistisk koeffisient; oppvarmingen er HASTIGHETEN ved maksimal oppvarming, IKKE en varmefluks (ingen aerotermisk modell eller TPS-modell)

seg-b0109481e8ff = Diagrammet motoren skriver for scenarios/reentry.toml, type reentry

seg-c860b8679b47 = <b>MODELLED</b> Maksimal retardasjon (uavhengig av ballistisk koeffisient), hastighet + høyde ved maksimal g og hastighet ved maksimal oppvarming for en ballistisk inntrenging i eksponentiell atmosfære. Tester: <a1>reentry_point_mass_accelerometer_oracle.rs</a1>.

seg-84abc0b9f859 = <b>MODELLED</b> Maksimal retardasjon (uavhengig av ballistisk koeffisient), hastighet + høyde ved maksimal g og hastighet ved maksimal oppvarming for en ballistisk inntrenging i eksponentiell atmosfære. R. Uavhengig referanse (InternalConsistency): lukket analytisk inntrenging etter Allen–Eggers, i tillegg kontrollert mot en numerisk integrasjon med scipy { "1.18" } solve_ivp (DOP853) av den SAMME differensialligningen for inntrenging med kun luftmotstand (tests/ballistic_re_entry_corridor_reference.rs, { "36" } tilfeller, verste a_max rel { "2.9e-9" }): en kontroll av numerisk integral mot egen analytisk form, så fortsatt InternalConsistency, IKKE en ekstern validering. MODELLED ballistisk (uten løft), ingen aerotermisk modell eller TPS-modell: oppvarmingsutdataene er en ve

seg-8b9d3db5d563 = MODELLED — ballistisk inntrenging (uten løft) etter Allen–Eggers, eksponentiell isoterm atmosfære, konstant banevinkel; maksimal g er uavhengig av ballistisk koeffisient; oppvarmingen er HASTIGHETEN ved maksimal oppvarming, IKKE en varmefluks (ingen aerotermisk modell eller TPS-modell) (resultat <c1/>)

seg-82de2275c919 = MODELLED ballistisk inntrenging (uten løft); oppvarmingsutdataene er HASTIGHETEN ved maksimal oppvarming, ikke en varmefluks (ingen aerotermisk modell eller TPS-modell). (typekatalog (<c1/>))

seg-080b28422342 = ÆRLIG AVGRENSNING: MODELLED ballistisk (uten løft), eksponentiell isoterm atmosfære, konstant banevinkel. Ingen aerotermisk modell eller TPS-modell: oppvarmingsutdataene er HASTIGHETEN ved maksimal oppvarming, ikke en varmefluks. Ikke en bane med 3 eller 6 frihetsgrader. Kjør: kshana scenarios/reentry.toml (kommentar i scenariofilen, linje { "8" } til { "11" })

seg-cfc345f0dc0d = Ballistisk gjeninntrengingskorridor (Allen–Eggers) er MODELLED, ikke validert: kontrollert mot sin egen lukkede eller analytiske identitet, som fanger opp transkripsjons- og koeffisientfeil, men ikke er en ekstern uavhengig referanse. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-a4b7c16e3fea = <s1>Forrige</s1>realtime-frame-eop

seg-6166a1c21525 = <s1>Neste</s1>slot-timing
