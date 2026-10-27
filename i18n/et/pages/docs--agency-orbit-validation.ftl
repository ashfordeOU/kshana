# docs--agency-orbit-validation: translations (et)

# text
seg-31d58f23c0a2 = Käivita

# text
# c1: docs/AGENCY-ORBIT-VALIDATION.md
seg-fbe4b3eb7310 = Allikas: <c1/>

# text
seg-87910a33b87b = Jõumudeli valideerimine efemeriidi sobitamise teel — metoodika ja valideeritud jäägid

# text
# c1: src/precise_od.rs
seg-09a1b1b673fb = Kshana täisjõumootor (<c1/>) sobitatud <b>päris agentuuride täppisorbiidi toodetega</b>, ausate, viidatavate ja commit-räsiga markeeritud jääkidega. See on teekaardi verstaposti P4 („Täppisastrodünaamika: kõrge järgu gravitatsioon, SRP (päikesekiirguse rõhk), valideerimine agentuuride andmestike vastu“) valideerimiskirje.

# text
seg-90f366667f78 = Mida valideeritud jääk siin tähendab

# text
# c1: docs/design/2026-06-09-precise-astrodynamics-design.md
seg-3861b68a03e2 = Jääk esitatakse ainult siis, kui kõik järgnev kehtib (kavand <c1/>):

# text
# c1: src/tides.rs
# c2: C_R
# c3: src/forces.rs
seg-954f4f934461 = <b>Jõumudel</b> sisaldab kõiki häiringuid, mis sihttäpsusel loevad: EGM2008 (Earth Gravitational Model { "2008" }) kõrgjärgu geopotentsiaal (kärbitud väidetud järgu/astme juures, d/o), tahke + ookeani + atmosfääri <b>looded</b> (<c1/>, IERS (International Earth Rotation and Reference Systems Service) Conventions { "2010" } Ch. { "6" }), Päikese/Kuu kolmas keha, kahurikuuli SRP koonusvarjuga + hinnatud <c2/>, takistus (ainult LEO (madal Maa orbiit)), Schwarzschildi + Lense–Thirringi üldrelatiivsusteooria (GR) liikmed (<c3/>).

# text
# c1: 1/σ²
seg-710f89c088cc = <b>Hinnang</b> on päris Gauss–Newtoni partiiväikseimruutude meetod variatsioonilise <b>olekuülemineku maatriksiga</b> (ristkontrollitud terve kaare lõplike vahede vastu täpsuseni < { "1e-6" }), <c1/> vaatluste kaalumine ja n-sigma kõrvalekallete redigeerimine.

# text
# c1: src/eop.rs
# c2: src/cio.rs
# c3: timescales::gps_to_tt
seg-dd5dcc66ed22 = <b>Tugisüsteemid/aeg</b> kasutavad <b>päris IERS finals2000A Maa orientatsiooni parameetreid (EOP)</b> (UT1 (Universal Time { "1" }, Maa pöörlemise aeg)−UTC (koordineeritud maailmaaeg), poolusliikumine; <c1/>) läbi valideeritud IAU (International Astronomical Union) 2006/2000A CIO (Celestial Intermediate Origin) ahela (<c2/>). SP3 (Standard Product { "3" }, täppisorbiidi vorming) GPS (Global Positioning System) aeg → TT (Terrestrial Time) fikseeritud { "51.184" } s nihke kaudu (<c3/>).

# text
seg-665bb53b81fb = <b>Jäägid</b> esitatakse <b>RTN</b>-is (radiaalne/piki rada/risti rada) ja 3-D-s, <b>koos empiiriliste kiirendustega ja ilma nendeta</b>, koos töötlemata (sobitamata) kattuvusega.

# text
seg-fea4515ba842 = Iga arv on <b>reprodutseeritav</b> (avaandmete CI (pidev integratsioon) värav) ja <b>viidatav</b> (commit-räsi + andmestiku viide + fikstuuri SHA-256 (SHA: Secure Hash Algorithm)).

# text
seg-fa98a174e799 = Meetod, andmestiku kaupa

# text
seg-a98b098e815a = Parsi SP3 täppisorbiit; valitud satelliidi jaoks võta iga ITRF (International Terrestrial Reference Frame) asukohalahend.

# text
# c1: (UT1, xₚ, yₚ)
seg-a25f69a48b5a = Teisenda SP3 GPS epohh → TT; lahenda <c1/> failist finals2000A sellel epohhil.

# text
seg-e5338b713d88 = Pööra iga ITRF lahend GCRS-i (Geocentric Celestial Reference System) läbi CIO ahela nende EOP-dega — inertsiaalsed asukohavaatlused. Dünaamika kasutab geopotentsiaali Maaga seotud pöörde jaoks <em>sama</em> EOP-i, nii et vaatlused ja jõud jagavad üht tugisüsteemi.

# text
# c1: [r, v, C_R]
seg-ce987e4dda40 = Algväärtusta epohhi olek (asukoht = esimene lahend; kiirus = 2. järku lõplik vahe) ja sobita partiina <c1/> (aste { "1" }), seejärel lisaks { "9" } RTN tsükkel-pöörde-kohta (CPR) empiirilist kiirendust (aste { "2" }, eelnevalt piiratud).

# text
seg-22f839d05292 = Esita järelsobituse RTN + 3-D RMS (ruutkeskmine) mõlema astme ja töötlemata kattuvuse kohta.

# text
seg-64e2c3662a27 = Galileo keskmine Maa orbiit — <b>GREEN</b> (lävi < { "5" } m)

# text
# c1: ESA0MGNFIN
seg-e77e8e35ba80 = <b>Andmestik:</b> ESA/ESOC (ESA: Euroopa Kosmoseagentuur; ESOC: Euroopa Kosmoseoperatsioonide Keskus) lõplik multi-GNSS (GNSS: ülemaailmne satelliitnavigatsioonisüsteem) orbiit <c1/>, ITRF, 5-minutiline diskreetimine, satelliit <b>E11</b> (GSAT0101, Galileo In-Orbit Validation (IOV), nominaalne MEO (keskmine Maa orbiit)), 2022-01-01.

# text
# c1: navigation-office.esa.int/products/gnss-products/2190/
# c2: datacenter.iers.org/data/9/finals2000A.all
seg-f90d848e7a46 = <b>Avatud allikas (sisselogimist pole):</b> ESA Navigation Office'i peegel, <c1/>. EOP: IERS <c2/>.

# text
seg-ec7195b80bad = Valideerimise commit:

# text
# c1: e7297f4c…d3a24a3
# c2: 6b781d36…cb2ed00f
# c3: tests/fixtures/agency/NOTICE.md
seg-c2ad9f9cc050 = <b>Fikstuurid (SHA-256):</b> SP3 <c1/>; EOP <c2/> (<c3/>).

# text
seg-de3df1639939 = Kaar

# text
seg-7db37f753fc1 = 3-D RMS

# text
seg-d39e59df38c0 = RTN (R, T, N)

# text
seg-5ad814c7ef9e = Märkused

# text
# c1: C_R
seg-bced8a114852 = CI fikstuur, aste { "1" } (jõud + <c1/>)

# text
seg-f040df9ee966 = { "8" } h

# text
seg-459900054e0e = { "0.133" } m

# text
seg-994f50a24ab7 = { "0.105" }, { "0.067" }, { "0.047" } m

# text
seg-d15ea658058b = töötlemata kattuvus { "78.7" } km

# text
seg-1ce1bc363541 = CI fikstuur, aste { "2" } (+ empiiriline CPR)

# text
seg-461105b5c2f3 = { "0.070" } m

# text
seg-073166a26523 = { "0.048" }, { "0.044" }, { "0.027" } m

# text
seg-224a7fc75354 = poolitab jäägi

# text
seg-1b422bc76914 = Täiskaare väljasaatmine, aste { "1" } (enne parandust†)

# text
seg-f57ee3b36d92 = { "24" } h

# text
seg-5fee750a5e30 = { "0.611" } m

# text
seg-b3a99e7a6724 = { "0.276" }, { "0.381" }, { "0.390" } m

# text
# c1: xval/s2-air-tide-fix/
# c2: workflow_dispatch
seg-95879df86618 = CI fikstuuri arvud ülal salvestati uuesti versioonis { "0.36" } pärast S2 õhulooted parandust (<c1/>): Galileo aste { "1" } liikus { "0.132" } → { "0.133" } m (C_R { "1.1744" } → { "1.1743" }), Swarm-A N komponendid { "1" }–{ "2" } mm võrra; täiskaare väljasaatmise arve ei käivitatud uuesti. † <b>Enne parandust:</b> täiskaare väljasaatmise arv salvestati enne versiooni { "0.36" } S2 õhulooted parandust ja seda ei ole parandatud koodil uuesti käivitatud (täispäeva tooted tõmbab väljasaatmise töövoog, need ei olnud parandust teinud seansis saadaval). CI fikstuuridel nihutas parandus Galileo 3-D RMS-i vähem kui { "1" } mm ja Swarm-A komponente { "1" }–{ "2" } mm, seega oodatakse sama suurusjärku muutust; järgmine <c2/> käivitus salvestab selle uuesti.

# text
seg-5141c1811e35 = MEO väli on gravitatsiooniliselt koondunud astmeks { "8" } ({ "8" } h 1. astme tulemus on identne d/o { "8" }, { "10" } ja { "12" } juures millimeetri täpsusega), seega CI fikstuuri d/o-12 kärpimine on tühine; väljasaatmise töö käivitab täieliku d/o-70. { "8" } h sobitus jõuab <b>{ "13" } cm</b> puhta jõu ja <b>{ "7" } cm</b> empiirilise astmega; täielik { "24" } h kaar (rohkem SRP/varjutuse koormust, pikem dünaamiline ulatus) on <b>{ "61" } cm</b> — kõik kaugelt läve { "5" } m sees.

# text
seg-45a95547dbcc = Swarm-A LEO — <b>GREEN</b> (lävi < { "5" } m)

# text
# c1: SW_OPER_SP3ACOM_2_
# c2: RDOD_AR
# c3: L47
seg-cba2e4a9b9b1 = <b>Andmestik:</b> ESA Swarm 2. taseme redutseeritud dünaamiline täppisteadusorbiit <c1/> (<c2/>, GPS-ist tuletatud, ITRF / IGb14, ~{ "2" } cm, Delfti Tehnikaülikooli töötlus), satelliit <b>Swarm-A</b> (SP3 id <c3/>, ~{ "430" } km LEO), 2022-01-01.

# text
# c1: https://swarm-diss.eo.esa.int/
# c2: Level2daily/Latest_baselines/POD/RD/Sat_A/
# c3: finals2000A
seg-f66ad1515550 = <b>Avatud allikas (sisselogimist pole):</b> ESA Swarmi levitusserver <c1/> → <c2/> (avatud ESA andmepoliitika all). EOP: sama IERS <c3/> 2022-001 seeria.

# text
# c1: 6cd84b78…acb733e
# c2: tests/fixtures/agency/NOTICE.md
seg-4de8b64c0bf0 = <b>Fikstuur (SHA-256):</b> SP3 <c1/> (<c2/>).

# text
# c1: C_R
seg-b46c7e1d476d = LEO kaar lisab jõumudelile <b>atmosfääritakistuse</b>. Kuna tiheduse mudel on <em>staatiline</em> tükiti eksponentsiaalne, sobitatakse orbiit kahes astmes: <b>dünaamiline</b> aste (hinda ainult epohhi olek; <c1/> hoitakse väärtusel { "1" }, sest LEO-l domineerib takistus ja SRP-d on lühikesel kaarel halvasti eristada) ja <b>redutseeritud dünaamiline</b> aste, mis lisab empiirilised tsükkel-pöörde-kohta kiirendused, mis kannavad modelleerimata takistust — operatiivselt tähenduslik LEO orbiit.

# text
# c1: C_R
seg-dac35ad223dd = CI fikstuur, dünaamiline (<c1/>={ "1" })

# text
seg-0652aa62d459 = { "3" } h

# text
seg-cc0a14ba2b40 = { "2.687" } m

# text
seg-3288b1f0615f = { "0.925" }, { "2.522" }, { "0.045" } m

# text
seg-555712268929 = jääk ≈ puhtalt piki rada (takistus)

# text
seg-4f8e7956aa78 = CI fikstuur, redutseeritud dünaamiline (+empiiriline)

# text
seg-aa5f651bcfab = { "0.098" } m

# text
seg-147b4eca7fcf = { "0.026" }, { "0.092" }, { "0.025" } m

# text
seg-82a3e25da2bf = empiiriline neelab takistuse

# text
# c1: swarm_full_arc_dispatch
# c2: KSHANA_SWARM_SP3
seg-ff834d33ae70 = Dünaamiline sobitus ületab läve { "5" } m, jäägiga peaaegu täielikult piki rada — õpikunäide takistuse signatuurist kõrgusel ~{ "430" } km. Empiiriline aste neelab selle piki-raja vea ({ "2.52" } → { "0.09" } m), andes <b>~{ "10" } cm</b> redutseeritud dünaamilise sobituse ESA enda ~{ "2" } cm orbiidi vastu. Täispäeva täisastmeline käivitus on ignoreeritud <c1/> (levitusserver serveerib toodet oma failibrauseri seansi kaudu, nii et asutaja laadib päeva SP3 alla ja suunab <c2/> sellele). NRLMSISE-00 (NRLMSISE: Naval Research Laboratory Mass Spectrometer and Incoherent Scatter Radar Extended atmosfäärimudel) koos kosmoseilma sisenditega on märgitud täiendus, mis kitsendaks <em>dünaamilist</em> astet veelgi.

# text
seg-e8f5c385de62 = LRO Kuu — valideeritud, <b>üle</b> läve { "5" } m (ausalt) (P4 W4b)

# text
seg-8a22ef5d3765 = <b>Andmestik:</b> päris NASA/JPL (NASA: National Aeronautics and Space Administration; JPL: Jet Propulsion Laboratory) <b>Lunar Reconnaissance Orbiter</b> (LRO; NAIF (Navigation and Ancillary Information Facility) −{ "85" }) rekonstrueeritud trajektoor JPL Horizonsist, geomeetrilised Kuu-kesksed olekuvektorid ICRF-is (International Celestial Reference Frame), 2022-01-01, ~{ "98" } km kõrgus, 1-minutiline diskreetimine ({ "241" } epohhi, { "4" } h, ~{ "2" } tiiru). Horizonsi tekstivektorite kasutamine <b>ei vaja SPK/SPICE (SPK: planeetide efemeriidi tuum; SPICE: Spacecraft, Planet, Instrument, C-matrix, Events) lugejat</b>.

# text
seg-2bcf078de340 = <b>Gravitatsioon:</b> GRAIL (Gravity Recovery and Interior Laboratory) <b>GRGM660PRIM</b> väli (NASA Goddard Space Flight Center, aste { "660" }), kärbitud d/o { "150" } ja sobitatud d/o { "100" } juures, hinnatud Kuuga seotud <b>peatelgede</b> tugisüsteemis.

# text
# c1: ssd.jpl.nasa.gov/api/horizons.api
# c2: icgem.gfz-potsdam.de
seg-1454f78e9ca4 = <b>Avatud allikas (sisselogimist pole):</b> Horizonsi API (rakendusliides) <c1/>; gravitatsioon ICGEM (International Centre for Global Earth Models) kaudu <c2/>.

# text
# c1: 574e3518…d100f0
# c2: 0ff04184…f029977ae
# c3: tests/fixtures/agency/NOTICE.md
seg-306ffeb843a9 = <b>Fikstuurid (SHA-256):</b> LRO <c1/>; GRGM <c2/> (<c3/>).

# text
# c1: src/lunar_od.rs
# c2: src/lunar_frame.rs
# c3: precise_od::ForceModel
seg-65ff0c37dd74 = See on <b>Kuu-keskne</b> dünaamika — eraldiseisev jõumudel (<c1/>): GRGM väli Kuuga seotud tugisüsteemis (IAU { "2015" } keskmise Maa orientatsioon <c2/> koos fikseeritud DE421 (Development Ephemeris { "421" }) keskmine Maa → peatelg (ME→PA) nihkega), pluss Maa (domineeriv Kuu orbiidi häiring) ja Päikese kolmandad kehad, sobitatud läbi <em>sama</em> üldise täpse Gauss–Newtoni hinnangu, mida Maa andmestikud kasutavad (tunnus <c3/>).

# text
seg-68f1894a1fa5 = CI fikstuur, dünaamiline (ainult olek)

# text
seg-0f055118d77a = { "4" } h

# text
seg-c94fc5bf792b = { "12.05" } m

# text
seg-addd9519ffe6 = { "2.91" }, { "10.11" }, { "5.88" } m

# text
seg-af395226ca52 = töötlemata kattuvus { "39.9" } m

# text
seg-2923b4d58878 = CI fikstuur, redutseeritud dünaamiline (+empiiriline { "1" }+2/rev)

# text
seg-19167d54b4ad = { "6.67" } m

# text
seg-f23cb77888a5 = { "3.41" }, { "4.58" }, { "3.44" } m

# text
seg-706a4d52f6c5 = 1- ja 2-per-rev empiiriline neelab piki-raja

# text
# c1: pxform('MOON_ME','MOON_PA')
# c2: tests/lunar_me_pa_offset_spice_oracle.rs
# c3: docs/design/evidence/fut05b-me-pa-offset-sign/
seg-3f33d99fd643 = Versiooni { "0.36" } parandus: kuni versioonini { "0.36" } rakendati DE421 ME→PA nihet vales suunas (ja vales Euleri järjekorras), mis viis analüütilise PA tugisüsteemi umbes { "208" }″ kaugusele PA-st selle asemel, et olla sellel. Nüüd on see ümber kirjutatud nii, nagu SPICE seda defineerib (kontrollitud <c1/> vastu täpsuseni { "2.6e-16" } rad, <c2/>; <c3/>). Ülaltoodud arvud on pärast parandust; enne seda olid need { "53.8" } m töötlemata, <b>{ "12.6" } m</b> dünaamiline ({ "3.07" }, { "10.19" }, { "6.81" } m) ja <b>{ "6.65" } m</b> redutseeritud dünaamiline ({ "3.49" }, { "4.56" }, { "3.35" } m).

# text
seg-925d1445fccb = Need jäägid on <b>üle</b> läve { "5" } m, mille Galileo ({ "0.13" } m) ja Swarm-A ({ "0.10" } m) ületavad, ja neid esitatakse ausalt.

# text
seg-c414e14eaaea = Mis tegelikult põranda määrab — DE-taseme ristvalideerimine (ja parandus)

# text
# c1: MOON_PA
# c2: xval/anise-lunar-od
# c3: moon_pa_de440_200625.bpc
# c4: de440s.bsp
# c5: ae96a29
# c6: c1c7fee…
# c7: 60cd55a…
seg-72b06bac7f6b = Püstitasime hüpoteesi, et piiravaks teguriks oli <b>analüütilise Kuu orientatsiooni ja efemeriidi</b> täpsus (IAU libratsiooniseeria, täpne kümnete kaaresekundite täpsusega JPL DE (Development Ephemeris) numbriliselt integreeritud <c1/> vastu, ja Montenbruck–Gill Maa/Päikese efemeriid, ~{ "0.3" }° DE/SPICE tuuma vastu). Selle otseseks testimiseks vahetab töökoha-väline ristvalideerimise crate <c2/> <b>ainult</b> need kaks sisendit <b>DE-taseme</b> sisendite vastu — DE440 (Development Ephemeris { "440" }) Kuu peatelje orientatsioon (<c3/>) ja DE440 efemeriid (<c4/>), loetud ANISE (Attitude, Navigation, Instrument, Spacecraft, Ephemeris — puhtalt Rustis SPICE-tuumade lugeja) kaudu — ning käivitab uuesti <em>sama</em> hinnangu (commit <c5/>, tuuma SHA-256 <c6/> / <c7/>):

# text
seg-3a0e724a8a2b = Aste

# text
seg-c1ce24cd6008 = analüütiline

# text
seg-7d04fb530a3a = töötlemata kattuvus

# text
seg-d9ce88edb49e = { "53.8" } m

# text
seg-55dc7c7d84f0 = { "41.5" } m

# text
seg-7def7880e134 = dünaamiline

# text
seg-83e37e5e9b3e = { "12.6" } m

# text
seg-c421a0a20278 = { "12.0" } m

# text
seg-f70309824f25 = redutseeritud dünaamiline ({ "1" }+2/rev)

# text
seg-b8ada0c5fab3 = { "6.65" } m

# text
seg-b6d3daff2f23 = <b>Versiooni { "0.36" } märkus: enamik allolevast dünaamilise astme kasust oli nihke viga, mitte DE-taseme sisendid.</b> Parandatud ME→PA nihkega annab analüütiline kuhi { "39.9" } m töötlemata, { "12.05" } m dünaamiline ja { "6.67" } m redutseeritud dünaamiline, DE-taseme { "41.5" }, { "12.0" } ja { "6.67" } m vastu: analüütiline ja DE-taseme sobitus nõustuvad nüüd igal astmel. Alloleva tabeli { "0.30" } lugem järgneb, jäetud sellisena, nagu see kirjutati.

# text
# c1: atol
seg-691df96321d8 = <b>Hüpotees on vaid pooleldi õige ja peamine väide vajas parandamist.</b> DE-taseme orientatsioon ja efemeriid <em>parandavad</em> töötlemata kattuvust ({ "53.8" } → { "41.5" } m) ja <b>dünaamilist</b> sobitust ({ "12.6" } → { "12.0" } m) — seega on analüütilise orientatsiooni/efemeriidi viga tõeline ja piirab neid astmeid. Kuid nad jätavad <b>redutseeritud dünaamilise</b> jäägi sisuliselt <b>muutmata</b> ({ "6.65" } → { "6.67" } m): { "1" }+2-per-rev empiiriline aste neelas orientatsiooni/efemeriidi vea <em>juba</em>, nii et operatiivse ~{ "6.6" } m põranda määrab midagi muud — jääk, mida tsükkel-pöörde-kohta baas ei suuda neelata ja DE-taseme tugisüsteemid ei eemalda. Kõige kooskõlalisem seletus on <b>modelleerimata LRO mittegravitatsiooniline dünaamika</b> (soojuskiirgus, gaasi eraldumine) lühikesel { "4" } h kaarel; välja aste on välistatud (identne d/o { "100" } ja { "150" } juures) ja integraatori tolerants on välistatud (identne <c1/> { "1e-6" } vs { "1e-9" } juures). Konstruktiivne järeldus: <b>Kshana kõhn, tuumavaba analüütiline Kuu-kuhi vastab juba DE-taseme täpsusele redutseeritud dünaamilise (operatiivse) Kuu orbiidi jaoks</b> — puhta koefitsiendi vaikeseadistus ei jäta seal midagi lauale. Läve { "5" } m ületamine nõuaks LRO mittegravitatsiooniliste jõudude modelleerimist (kosmoseaparaadi-spetsiifiline kast-tiib/soojusmudel ja pikem, mitme kaarega sobitus), mitte paremaid tugisüsteeme.

# text
seg-4211fbd25380 = Ausameelsuse leping

# text
seg-f3b0a26ff5b3 = „Rohelise“ läve < { "5" } m täidavad <b>Galileo MEO</b> ({ "0.13" } m dünaamiline) ja <b>Swarm-A LEO</b> ({ "2.69" } m dünaamiline / { "0.10" } m redutseeritud dünaamiline). <b>LRO Kuu avaldatakse sellisena, nagu see on: { "12.05" } m dünaamiline / { "6.67" } m redutseeritud dünaamiline ({ "1" }+2-per-rev empiiriline) — üle läve</b> ({ "0.36" }, pärast ME→PA nihke parandust; { "12.6" } / { "6.65" } m enne seda). DE-taseme ristvalideerimine (ülal) <b>testis ja parandas</b> piirava teguri väidet: redutseeritud dünaamiline põrand <b>ei ole</b> analüütiline orientatsioon/efemeriid (DE440 tuumad jätavad selle väärtusele { "6.67" } m muutmata), seega seda ei sulge paremad tugisüsteemid, vaid LRO mittegravitatsioonilise dünaamika modelleerimine — aus, uuendatud tee meetritasemele.

# text
seg-559a269152ae = LEO puhul esitatakse <b>dünaamiline</b> (ainult olek, staatiline tihedus) ja <b>redutseeritud dünaamiline</b> (empiiriliste kiirendustega) aste alati <b>eraldi</b>, et lugeja näeks, mida empiirilised liikmed neelavad; redutseeritud dünaamiline aste on operatiivne orbiit. Sama eraldus kehtib MEO empiirilise/puhta jõu astmete kohta.

# text
seg-d20c7ef90250 = Iga jääk kannab ülal oma commit-räsi, andmestiku viidet ja fikstuuri kontrollsummat.

# text
seg-733d96129fca = <b>Päris agentuuri tõe vastu valideeritud andmestikud: { "3" } / { "3" }</b> (Galileo MEO, Swarm-A LEO, LRO Kuu). <b>Läve < { "5" } m täitjad: { "2" } / { "3" }</b> (Galileo ✓, Swarm-A ✓; LRO { "6.67" } m juures, ausalt selle kohal).

# text
seg-d7c77076c9c6 = <s1>Eelmine</s1>SGP4 valideerimine

# text
seg-d661003da754 = <s1>Järgmine</s1>Päikesesüsteem ja muud kehad

# text
seg-36a3b8105d4b = Galileo keskmine Maa orbiit — GREEN (lävi < { "5" } m)

# text
seg-b6f96cf0d55a = Swarm-A LEO — GREEN (lävi < { "5" } m)

# text
seg-9e739bda7f20 = LRO Kuu — valideeritud, üle läve { "5" } m (ausalt) (P4 W4b)
