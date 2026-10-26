# docs--machine-inputs: translations (da)

seg-e9650a618b38 = ID

seg-b9f561201fda = Kilde: <c1/>

seg-536f71da4541 = Maskin- og sensorinput ({ "0.38" })

seg-3176ffff1e44 = <b>Vejledende software.</b> Ikke typegodkendt navigationsudstyr. Operatøren er fortsat ansvarlig for fartøjets sikre navigation.

seg-367ac9b4a8a6 = Hvad `kshana imu-fit` aflæser af en IMU-log fra stilstand, fra en rigtig kørsel af motor v{ $version } på en opdigtet log ({ "20,000" } sampler ved { "100" } Hz, { "200" } s): accelerometerets hastigheds-random-walk q_va = { "4.02e-06" }, gyroens vinkel-random-walk q_arw = { "9e-08" }, biasustabiliteten { "0.00296" } og de tidlige Allan-hældninger (-0.51 og -0.49; cirka -0.5, hvor hvid støj dominerer). Tabellen ved siden af er den TOML, kommandoen udskriver. Estimatoren er kun kontrolleret på syntetiske logs. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en livsvigtig sikkerhedstjeneste (safety-of-life).

seg-a048ba8ff88e = RTKLIB <c1/> (<c2/>)

seg-3ba911ed9541 = Løsningsfilen, som RTKLIB's <c1/> og RTKPOST skriver. Læst: tiden (kalender <c2/> eller GPS-uge og sekunder i ugen), positionen (breddegrad og længdegrad i grader med højde eller ECEF X/Y/Z konverteret til geodætisk) og antallet af satellitter. Tidsskalaen i kolonneoverskriften (<c3/>, <c4/>, <c5/>) bæres i etiketten. Filer med grader-minutter-sekunder afvises. Linjer, der begynder med <c6/>, er headerlinjer.

seg-24ebc9ea6e4e = NovAtel OEM7 (<c1/>)

seg-b73d1465ed67 = ASCII-logs (<c1/>) og binære logs (<c2/>-header), frit blandet. Layoutene følger den offentlige OEM7-dokumentation (docs.novatel.com): meddelelsesheaderne, 32-bit CRC og felttabellerne for tre logs. Poster, hvis CRC ikke stemmer, springes over og tælles.

seg-078e047b9f82 = Log

seg-5b59f661e68b = Brugt

seg-286c3fb8ac5c = løsningsstatus (kun <c1/> giver en positionsbestemmelse), breddegrad, længdegrad, højde over middelhavets overflade plus undulation (positionsbestemmelsens højde er ellipsoidal), brugte satellitter

seg-3edaffed5d65 = C/No pr. signal (dB-Hz); system fra sporingsstatusbit 16-18, signaltype fra bit 21-25

seg-5663c6812797 = modtagerstatusbit { "15" } (jammer opdaget) bliver epokens <c1/> (jamming { "2" } markeret, { "1" } ikke; RXSTATUS har intet spoofing-flag), sammenlignet med Kshanas alarmer af <c2/>; de { "1" } hjælpebit for jammer (RF1-RF6) returneres i <c3/>
