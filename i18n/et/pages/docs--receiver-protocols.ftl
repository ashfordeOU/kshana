# docs--receiver-protocols: translations (et)

# text
seg-99427ab75a03 = väli

# text
# c1: docs/RECEIVER-PROTOCOLS.md
seg-75e6589cf544 = Allikas: <c1/>

# text
seg-4540630d4859 = Vastuvõtja protokollid, mida loeb receiver-trust ({ "0.38" })

# text
seg-906a5f9e6cd9 = Kõikjal ainult lugemine: siin ei kirjutata vastuvõtjale ühtegi baiti ning mingit edastusteed ei ole. Nõuandev tarkvara, mitte tüübikinnitust omav navigatsiooniseade (IEC { "61108" }, IEC { "61162" }): vastutab jätkuvalt operaator.

# text
seg-a44353d98d6c = Vastuvõtja enda spuufimise ja segamise lipud (UBX)

# text
seg-b58d3a8f292c = sõnum

# text
seg-24c57b65b8f7 = loetakse kui

# text
seg-bb61c4d9a33e = UBX-NAV-STATUS (0x01 0x03), { "16" } baiti

# text
# c1: flags2
# c2: spoofDetState
seg-3fb608c6c3ea = <c1/> bait nihkel { "7" }, bitid { "4" }..3: <c2/>

# text
seg-54d4cf306b49 = { "0" } teadmata või deaktiveeritud, { "1" } spuufimist ei näidata, { "2" } spuufimine näidatud, { "3" } mitu spuufimise näitu (protokoll { "18" } ja hilisem; u-blox F9 HPG { "1.32" } liidese kirjeldus, jaotis { "3.15.20" })

# text
seg-36d4d1d82f3d = UBX-SEC-SIG (0x27 0x09) versioon { "1" }, { "12" } baiti

# text
# c1: jamFlags
# c2: spfFlags
seg-e7e262087849 = <c1/> nihkel { "4" } (bitt { "0" } jamDetEnabled, bitid { "2" }..1 jammingState); <c2/> nihkel { "8" } (bitt { "0" } spfDetEnabled, bitid { "3" }..1 spoofingState)

# text
seg-3e117e319518 = olekuid loetakse ainult seal, kus detektor on lubatud; { "0" } teadmata, { "1" } puudub, { "2" } hoiatus või näidatud, { "3" } kriitiline või kinnitatud

# text
seg-8a5a59761cd0 = UBX-SEC-SIG versioon { "2" }

# text
# c1: sigSecFlags
# c2: jamNumCentFreqs
seg-9626adf4a5e7 = <c1/> nihkel { "1" } (bitt { "0" } jamDetEnabled, bitid { "2" }..1 jammingState, bitt { "3" } spfDetEnabled, bitid { "6" }..4 spoofingState); <c2/> nihkel { "3" } ja nii palju 4-baidiseid rühmi (ei kasutata)

# text
seg-e0eb14018b2c = nagu ülal

# text
# c1: SEC-SIG-V1
# c2: SEC-SIG-V2
# c3: tests/receiver_trust_self_report.rs
seg-b0c1eaeb4185 = <b>SEC-SIG paigutuse allikas.</b> Selle kirjutamise ajal allalaaditavad u-blox F9 HPG { "1.32" } ja M10 SPG { "5.10" } liidesekirjeldused nimetavad UBX-SEC-SIG-i, kuid ei defineeri seda. Ülaltoodud paigutused on hilisemate u-blox liidesekirjelduste omad, nagu need on ümber kirjutatud teegis pyubx2 (BSD-3-Clause, <c1/> ja <c2/>); failis <c3/> olevad fikstuuritestid on ehitatud sellest paigutusest, mitte reaalse vastuvõtja väljundist. Paigutus avatud ümberkirjutusest, mida ei ole praeguse tootja juhendi vastu kontrollitud: kontrollige seda praeguse u-blox liidesekirjelduse vastu enne, kui SEC-SIG-ile toetute.

# text
seg-6af7d45be34d = SEC-SIG-il ei ole nädalasisest aega; see kuulub jooksvale navigatsiooniepohhile. Epohhil juba loetud olek säilitatakse, kui hilisem ei ole halvem.

# text
# c1: receiver-self-report
seg-f1cf7ee27cb1 = Võrdlus <c1/>

# text
# c1: self_report
# c2: agreement
# c3: both
# c4: receiver-only
# c5: kshana-only
# c6: neither
# c7: calibrating
# c8: receiver_self_report
# c9: epochs[].self_report
seg-f30ddb83bf99 = Kui logi kannab neid lippe, on tulemuse igal epohhil <c1/> (kaks olekut, kas vastuvõtja annab lipu, kas mõni Kshana monitor andis häire, ja <c2/>: <c3/>, <c4/>, <c5/>, <c6/> või <c7/>) ning tulemusel on <c8/> arvude ja iga esimese epohhiga. Vastuvõtja „annab lipu“ olekul { "2" } või enam. See <b>ei tekita häiret ega muuda ühtegi skoori</b> ja kumbki pool ei ole tõe etalon: kokkulangevus ei ole valideerimine ning lahknevus ütleb, et üks detektor nägi midagi, mida teine ei näinud, mitte seda, kumb oli õige. Studio riba loeb <c9/>.

# text
# c1: format = "sbf"
seg-49ae6094c06a = Septentrio SBF (<c1/>)

# text
# c1: receiver_trust::ingest::read_sbf
# c2: sbf-tools
# c3: thiserror
# c4: deny.toml
# c5: band
# c6: L1CA
# c7: Info
# c8: rf_bands_reported
# c9: 2024-09-05T00:00:00.000 GPST
seg-4d6365d9ffd1 = <c1/> dekodeeritakse paketiga <c2/> ({ "0.4" }, <b>MIT</b>; selle ainus sõltuvus on <c3/>; lubav litsents, mida <c4/> lubab). Loetavad plokid: PVTGeodetic ({ "4007" }) lahenduse jaoks, MeasEpoch ({ "4027" }) C/N0 jaoks satelliidi ja signaali kohta (<c5/> on signaali nimi, näiteks <c6/>) ja RFStatus ({ "4092" }) nende RF-ribade arvu jaoks, mille <c7/> bait ei ole null (<c8/>, kantakse edasi ja <b>ei tõlgendata</b>: see ei lähe kunagi lipuna arvesse). Epohhid on võtmestatud nädalasisese aja ja nädalanumbri järgi ning sildistatud GPS-ajas (<c9/>). Plokk, mis ei läbi oma CRC-d või parsimist, loetakse vahelejäetud kirjeks. See lugeja ei loe AGC-d ega segamisnäitajat, seega C/N0 languse ja lukustuse kadumise monitorid töötavad, AGC ja segamisnäitaja monitorid aga mitte.

# text
# c1: sbf-tools
# c2: tests/receiver_trust_sbf.rs
seg-f86f2c25f41a = <b>Paigutuste allikas.</b> Septentrio juhendit ei olnud selle kirjutamise ajal võimalik alla laadida (server keeldus päringust), seega võeti paigutused allikast <c1/>, mis viitab juhendile, ning failis <c2/> olevad fikstuurid on sünteetilised plokid, mis on ehitatud selle paigutuse ja selle CRC-16-CCITT järgi. Ühtegi reaalset SBF-logi ei kasutatud. Paigutus avatud lähtekoodiga paketist, mida ei ole praeguse tootja juhendi vastu kontrollitud: kontrollige seda Septentrio juhendi vastu enne, kui sellele toetute.

# text
# c1: receiver-trust live --serial
seg-680fa4eea3f4 = Otsene jada- ja USB-sisend (<c1/>)

# text
# c1: --baud
# c2: --configure
# c3: live
# c4: tests/receiver_trust_live_serial.rs
seg-38fcf7d91b6e = Ainult Unix. See avab seadme lugemiseks, seab <b>kohaliku</b> liini toorrežiimi kiirusel <c1/> (vaikeväärtus { "4800" }, NMEA { "0183" } kiirus) ja loeb NMEA-ridu nagu mis tahes muud allikat. See ei kirjuta vastuvõtjale kunagi. <c2/> lükatakse tagasi selgitusega: Kshana ei seadista vastuvõtjaid; seadke vastuvõtja väljastama NMEA-d tootja enda tööriistaga ja lugege seda siis. Sööde on NMEA, nagu iga <c3/> allika puhul (UBX ja SBF loetakse failidest). Seade, mis kaob, lõpetab käsu veana (väljumine { "1" }), et järelevaataja selle uuesti käivitaks; kiht ei ühendu uuesti. Testitud pseudoterminali silmusühendusel (<c4/>), sealhulgas selle, et peapool ei saa käsult ühtegi baiti.

# text
seg-97e1ea47c2be = <s1>Eelmine</s1>Masina- ja andurisisendid

# text
seg-55ad3fc908be = <s1>Järgmine</s1>Häirevaatluskeskus: meetod

# text
seg-17c3203ee615 = Vastuvõtja enda aruande võrdlus

# text
seg-68bc6d2e1575 = Septentrio SBF (format = "sbf")

# text
seg-8444127e7ee6 = Otsene jada- ja USB-sisend (receiver-trust live --serial)
