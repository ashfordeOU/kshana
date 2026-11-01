# docs--kind-reentry: translations (da)

seg-99ef7c1d552c = Scenarietype i motoren v{ $version }, familien <a1>Missionsanalyse, forbindelser og rumoperationer</a1>. Vejledende: analyseoutput fra et forsknings- og udviklingsværktøj, ikke typegodkendt navigationsudstyr og ikke en tjeneste til beskyttelse af menneskeliv. Hver etiket her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en etiket optjenes: afsnittet Evidence i README'en).

seg-8f1e7d3f5a07 = Familieside: <a1>Missionsanalyse, links og rumoperationer</a1>

seg-3a3ee499961e = <b>MODELLED</b> Plan opstigning med tyngdekraftsdrejning for et flertrinskøretøj over en ikke-roterende kugleformet Jord gennem US Standard Atmosphere { "1976" } (massefylde og tryk), med et pitch-kick, thrust reduceret af dysens modtryk, trinbrændud ved præcis s

seg-8e62cc4af6ea = Emneside: <a1>ENTRY-EO-ASCENT.md</a1>

seg-05ce408c2dbb = kg/m^{ "2" }

seg-195347c63a8a = m/s^{ "2" }

seg-c95aec0d2943 = Kilde: <c1/>

seg-91424dc65b3e = <c1/> (scenarietype)

seg-039f77066d97 = Korridor for ballistisk generindtræden efter Allen-Eggers: maksimal deceleration (uafhængig af ballistisk koefficient, V_e^{ "2" } sin|γ|/(2eH)), hastighed og højde ved maksimal g og hastigheden ved maksimal opvarmning, for en indtrædenshastighed, banevinkel og ballistisk koefficient gennem en eksponentiel atmosfære, plus en plan integration af et punktmassesystem af den samme ballistiske indtræden med tyngdekraft, jordens krumning og US Standard Atmosphere { "1976" } (maksimal deceleration, hastighed, højde og tid ved maksimum). MODELLED ballistisk indtræden (uden løft); opvarmningen er HASTIGHEDEN ved maksimal opvarmning, ikke en varmeflux (ingen model for aerotermi eller varmeskjold).

seg-9908d06c50eb = Én kørsel af <c1/> opsummeres som: reentry (Allen–Eggers): V_e { "7800" } m/s, γ { "6.0" }° -> maksimum { "16.6" } g ved { "49" } km, { "4731" } m/s; opvarmningen topper ved { "6603" } m/s; punktmasse (tyngdekraft, krumning, US76) maksimum { "16.4" } g (MODELLED ballistisk, ingen aerotermi)

seg-f057c2a160e7 = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-576245fd5b70 = Eksemplet <c1/> angiver blandt andet:

seg-0b7769c97ff3 = Resultatetiket (motorens egen): MODELLED — ballistisk indtræden efter Allen–Eggers (uden løft), eksponentiel isoterm atmosfære, konstant banevinkel; maksimal g er uafhængig af den ballistiske koefficient; opvarmningen er HASTIGHEDEN ved maksimal opvarmning, IKKE en varmeflux (ingen model for aerotermi eller varmeskjold)

seg-b0109481e8ff = Diagrammet, som motoren skriver for scenarios/reentry.toml, type reentry

seg-c860b8679b47 = <b>MODELLED</b> Maksimal deceleration (uafhængig af ballistisk koefficient), hastighed + højde ved maksimal g og hastighed ved maksimal opvarmning for en ballistisk indtræden i en eksponentiel atmosfære. Tests: <a1>reentry_point_mass_accelerometer_oracle.rs</a1>.

seg-84abc0b9f859 = <b>MODELLED</b> Maksimal deceleration (uafhængig af ballistisk koefficient), hastighed + højde ved maksimal g og hastighed ved maksimal opvarmning for en ballistisk indtræden i en eksponentiel atmosfære. R. Uafhængig reference (InternalConsistency): analytisk indtræden efter Allen–Eggers i lukket form, desuden krydskontrolleret mod en numerisk integration med scipy { "1.18" } solve_ivp (DOP853) af den SAMME ODE for indtræden med kun luftmodstand (tests/ballistic_re_entry_corridor_reference.rs, { "36" } tilfælde, værste a_max relativt { "2.9e-9" }) — en kontrol af numerisk integral mod egen analytisk form, så stadig InternalConsistency, IKKE en ekstern validering. MODELLED ballistisk (uden løft), ingen aerotermi eller varmeskjold — opvarmningen er en hastighed

seg-8b9d3db5d563 = MODELLED — ballistisk indtræden efter Allen–Eggers (uden løft), eksponentiel isoterm atmosfære, konstant banevinkel; maksimal g er uafhængig af den ballistiske koefficient; opvarmningen er HASTIGHEDEN ved maksimal opvarmning, IKKE en varmeflux (ingen model for aerotermi eller varmeskjold) (resultat <c1/>)

seg-82de2275c919 = MODELLED ballistisk indtræden (uden løft); opvarmningen er HASTIGHEDEN ved maksimal opvarmning, ikke en varmeflux (ingen model for aerotermi eller varmeskjold). (typekatalog (<c1/>))

seg-080b28422342 = ÆRLIG AFGRÆNSNING: MODELLED ballistisk (uden løft), eksponentiel isoterm atmosfære, konstant banevinkel. Ingen model for aerotermi eller varmeskjold -- opvarmningen er HASTIGHEDEN ved maksimal opvarmning, ikke en varmeflux. Ikke en 3-/6-DoF-bane. Kør: kshana scenarios/reentry.toml (kommentar i scenariefilen, linje { "8" } til { "11" })

seg-cfc345f0dc0d = Korridor for ballistisk generindtræden (Allen–Eggers) er MODELLED, ikke valideret: kontrolleret mod dens egen identitet i lukket/analytisk form — det fanger transskriptions- og koefficientfejl, men er ikke en ekstern uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-a4b7c16e3fea = <s1>Forrige</s1>realtime-frame-eop

seg-6166a1c21525 = <s1>Næste</s1>slot-timing

seg-33b3bf4992c9 = <b>MODELLED</b> Fasen <c1/>: returkysten for <c2/> uden brænding, der ender ved indflyvningsgrænsefladen; flyvebaneafvigelsen og dens sigma fra den fulde kovarians ved en gradient med endelig differens; sandsynligheden for, at vinklen ligger inden for en ang
