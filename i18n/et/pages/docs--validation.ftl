# docs--validation: translations (et)

# text
seg-70860389903a = Kell

# text
seg-583dc9ff6178 = Teek

# attr:aria-label, text
seg-d01db1c2710a = Teatmik

# text
seg-619f89bf160c = Kuu tugisüsteemi realisatsioon

# text
seg-2db69c58f694 = Kuu diferentsiaalne PNT

# text
seg-2eb6d1b0483d = RAIM / ARAIM

# text
seg-da3532b1444d = SBAS / DO-229E

# text
seg-d3af26f389f5 = IONEX / Klobuchar

# text
seg-d6476863f862 = Võimekus

# text
seg-ad856ad710eb = Staatus

# text
seg-d12d4565b01d = Kuu geodeetiline VLBI, kernelitee

# text
seg-5ed34a5b402e = Kuu ühine mitmetehnikaline OD + kell

# text
seg-4bcec6e2dd9f = Kuu navigatsiooniteenuse ruumala

# text
seg-c04a3591074c = Kuu koostalitlusvõime eksport

# text
seg-20fee61b3107 = Kvantseadmete veamudelite teek

# text
seg-eaf341ff4522 = GNSS-ita kvantnavigatsioon

# text
seg-75636f9419b2 = Teadaolevad piirangud

# text
seg-9c0eb89a2fbe = Pakett

# text
seg-f63dd3d7aad4 = Allikas

# text
seg-638b8d451550 = Sensor

# text
seg-04f69a0edb2f = tüüp

# text
seg-b03d56f501c3 = Liik

# text
seg-35bf9a48e566 = Termin

# text
seg-f3526b0d95f8 = Mõõdetud

# text
seg-7634c6f4b32c = Link

# text
seg-b966dd26caa6 = Andmestik

# text
seg-4fe4920a3fa1 = Standard

# text
# c1: docs/VALIDATION.md
seg-84430d202cd4 = Source: <c1/>

# text
seg-028f26d1374e = <b>Tolerantside kohta.</b> „Valideeritud“ tähendab allpool, et kalibreerimistest kinnitab, et simuleeritud statistik ühtib etalonseosega <b>jõustatud värava</b> piires, praegu <b>{ "20" }–{ "25" }% suhteline viga</b> (algväärtuste (seed) keskmisena) Alani/müraeelarve seoste puhul. Mediaanselt täheldatud ühtivus on sageli palju tihedam (mõni protsent), kuid <em>garanteeritud</em> piir on värav, mitte mediaan. Kui ilmub arv nagu „~{ "2" }%“, on see tüüpiline vaatlus, mitte jõustatud tolerants. Vt <a1>Väited versus tegelikkus</a1>.

# text
seg-94a480ed9ccb = Ülendamise reegel

# text
# c1: src/verification.rs
seg-a550784412a6 = Masinkontrollitud kontrollimaatriksi rida (<c1/>) on VALIDATED ainult siis, kui oraakel (sõltumatu etalon), mis on <b>Kshanast sõltumatu</b>, ühtib realisatsiooniga <b>enne võrdluse käivitamist öeldud tolerantsi piires</b>, testis, mis käivitub väravas. See jaotis on ainus koht, kus reegel on kirja pandud; maatriks, ridade kaupa proosa ja väljalaskemärkmed toetuvad sellele.

# text
seg-5e14faed9f05 = Aktsepteeritud sõltumatu etaloni liigid

# text
seg-4297b6a1b385 = Mis loeb

# text
seg-a42c0c36b37f = Näited, mis on juba maatriksis

# text
seg-e39aeb132e03 = Tegelikud mõõdetud andmed suuruse kohta, mida rida väidab: füüsilise maailma vaatlus, mitte mudeli väljund.

# text
seg-e77977db9de1 = Tõelise tseesiumkella salvestuse tagasihoitud kaks kolmandikku; arhiveeritud Kuu laserkaugusmõõtmise normaalpunktid; BIPM (Rahvusvaheline Kaalude ja Mõõtude Büroo) Circular T UTC(k) seeria; SRTM (Shuttle Radar Topography Mission) maastikuruut.

# text
seg-6325fe1fafaf = Sõltumatu kolmanda osapoole teek või tööriist, mis arvutab samadel sisenditel <b>üheselt defineeritud</b> suuruse, kus teek realiseerib valdkonna arvutuse ise. Teegi ja teegi vaheline ühtivus on tõeline kontroll ainult seetõttu, et suurusel on üks õige vastus.

# text
seg-a9cd35495601 = allantools, Orekit, ANISE, RTKLIB, gnss_lib_py, lamberthub, pymcdm, scikit-learn, SciPy statistilised jaotused.

# text
seg-056adffae706 = Avaldatud etalonvektorid, tabelid või kontrollnäited: arvud, mille standard, amet või etalontekst trükib, et realisatsioone nende vastu kontrollida.

# text
seg-991fb822e99c = SOFA/ERFA (Standards of Fundamental Astronomy) vektorid, AIAA (American Institute of Aeronautics and Astronautics) SGP4 kontrollvektorid, ITU-R (International Telecommunication Union, Radiocommunication Sector) valideerimisnäited, töörühma C ARAIM läbitöötatud näide, JPL (Jet Propulsion Laboratory) Horizons.

# text
seg-2a774e48055a = Kaks täiendavat standardit otsustavad piirjuhtumid. Mõlemad on vastu võetud väljalaske { "0.30" } jaoks.

# text
seg-f5c6cf536ba1 = <b>P1, avaldatud läbitöötatud väärtus.</b> Avaldatud läbitöötatud väärtus, mis on arvutatud samast suletud kujust, mida rida realiseerib, loetakse avaldatud etalonvektoriks, kui väljaanne on Kshanast sõltumatu ja võrdlus fikseerib öeldud tolerantsi. Väärtus peab olema väljaandes trükitud arvuna (graafikult maha loetud väärtus loeb ainult siis, kui lugemise määramatus on öeldud tolerantsi sees) ja test peab panema Kshana selle väljaande sisenditest arvutama; konstandi võrdlemine dokumendiga, millest see kopeeriti, on ärakirja kontroll, mitte P1.

# text
seg-0b043b552e76 = <b>P2, sõltumatu numbriteek.</b> Sõltumatu numbriteek nagu numpy või LAPACK (Linear Algebra PACKage), mis arvutab uuesti üheselt defineeritud lineaaralgebra suuruse öeldud sisenditel, loetakse sõltumatuks teegiks. Teek peab sooritama lahutuse, pöörde, lahendi või vähimruutude sammu oma algoritmiga, fikseeritud testandmetega kaasa pandud sisenditel; valideeritud väide on siis lineaaralgebra neil sisenditel, mitte esindusliku stsenaariumi füüsikalised suurused. Skript, mis hindab skalaarset suletud kuju uuesti numpy aritmeetikaga, on meie enda teine realisatsioon, mitte P2.

# text
seg-b7911d589f7a = Tingimused, mis kehtivad igale liigile: oraakel (sõltumatu etalon) ei ole selle projekti kirjutatud, käivitatud ega avaldatud (selle hoidla enda artiklisari ei ole seega sellest sõltumatu); tolerants on testis ja see fikseeriti enne esimest võrdlust; andmepiiranguga test, mis jäetakse vahele, kui selle avalikke andmeid ei ole, ütleb seda vahele jätmisel.

# text
seg-7e6057a2cad7 = Mis ei loe

# text
# c1: ReferenceImpl
seg-80cfbb204767 = <b>Meie enda teine realisatsioon</b>: teine koodirada selles kastis (<c1/>) või skript selles hoidlas, mis hindab sama suletud kuju uuesti.

# text
seg-d6efaf8399f9 = <b>Ühtivus meie enda varasema väljundiga</b>: golden-failid, regressioonifikseeringud, hetktõmmised või tabel selle projekti enda artiklitest.

# text
seg-4d0365b383e5 = <b>Viite konstantide ärakiri</b>: koefitsiendi, eelseadistuse, andmelehe arvu või parameetrilehe kontrollimine dokumendi vastu, millest see kopeeriti.

# text
seg-3bf8025077fb = <b>Kavandusvalik</b>: jaotus, kaalumine, lävi, häirepiir või esindusstsenaarium. Valiku jaoks pole välist tõde.

# text
seg-4f0aafd7166e = <b>Sisemine samasus</b>: arvuline integraal oma analüütilise kuju vastu, edasi-tagasi tsükkel, pööramine, omaduse või monotoonsuse test.

# text
# c1: IntegrationRun
# c2: IntegrationRun
# c3: integration_run_only_on_modelled_rows
# c4: src/verification.rs
# c5: validated_rows_require_an_external_oracle
# c6: ExternalDataset
seg-4f4408e4ebab = <b>Integratsioonikäivitus tegeliku hosti vastu</b> (<c1/>): pistikprogrammi laadimine tegelikku Signal K serverisse või OpenCPN-i või tegeliku värava väljundi andmine TCP tarbijale ja kontrollimine, et host võtab sisendi vastu ja näitab oodatud olekut. See näitab, et juhtmestik töötab. Host ei ole oraakel (sõltumatu etalon) ühegi väärtuse jaoks, mida integratsioon kannab, seega pole millegagi välist võrrelda ja selline rida (mereintegratsioonide rida) on MODELLED, mitte VALIDATED. <c2/> on oma sõltumatu etaloni liik, lubatud ainult MODELLED ridadel: <c3/> failis <c4/> ebaõnnestub, kui VALIDATED rida seda kannab, ja <c5/> nõuab juba, et iga VALIDATED rida oleks <c6/>.

# text
seg-a39a87c56a16 = <b>Usutavus tegelikel sisenditel</b>: tegelikud andmed, mida kasutatakse ainult sisendina, suurusjärgu väidetega, mitte võrdlusena välise väärtuse vastu.

# text
seg-db6f5d98b4ef = Tolerants, mis on valitud pärast võrdluse nägemist.

# text
seg-f4f18b7549df = Kuidas reeglit jõustatakse

# text
# c1: validated_oracle_basis()
# c2: src/verification.rs
# c3: tests/verification_rows_declare_an_oracle_basis.rs
# c4: #[test]
seg-19a62c7e0aee = Iga VALIDATED rida deklareerib failis <c1/> kaustas <c2/>, millisele liigile see toetub (Measured, Library, Reference, P1 või P2), sõltumatu allika (tsiteeritud rea enda sõltumatu etaloni tekstist) ja ühe testi, mis kannab võrdlust. Tabeli kõrval olevad ühiktestid ebaõnnestuvad, kui VALIDATED rida on deklareerimata või deklareeritud kaks korda, kui deklaratsioon nimetab rida, mis ei ole VALIDATED, kui deklareeritud allikas ei ole see, mille rea enda tekst nimetab, või on Kshana ise, kui deklareeritud test ei ole see, mida rida viitab, või kui P2 rida ei nimeta sõltumatut numbriteeki. <c3/> nõuab seejärel, et deklareeritud test oleks kettal olemas tegeliku <c4/>-na, mida ei ignoreerita. Mida masin kontrollida ei saa, on see, kas nimetatud test võrdleb deklareeritud allika vastu; see jääb inimese lugemiseks. Liigi kaupa arve siia ei trükita: allikas on tabel.

# text
seg-e8ae3e380f40 = Olemasolevad VALIDATED read, mis on reegli all uuesti üle vaadatud

# text
seg-1dd44545a67a = Reeglit rakendati olemasolevatele ridadele samamoodi nagu tulevastele ülendamistele.

# text
seg-38db7b6e7053 = <b>P1 read, mille nimetas valideerimisuuring { "0.30" }, kõik toetatud:</b> Ühesuunaline sidelingi eelarve (JPL Pub 82-76 Galileo X-riba disaini kontrolltabel, kokku pandud selle reaosadest { "4.6e-3" } dB vabaruumi kadu täpsusega); Ribapiiratud suletud kujud mis tahes kaugusmõõtmise signaali jaoks ({ "90.3" } protsenti peasagara võimsusest ja avaldatud koherentne varajase-hilise värin); Madala Maa orbiidi navigatsioonisatelliidi maksimaalne Doppler (avaldatud Xona Pulsar X1 ja Iridiumi arvud); Maksimaalne Doppler, mida staatiline kasutaja LEO või MEO orbiidilt näeb (Pulsari artikli tabel { "1" }, { "20" } väärtust); Doppler, mida maapealne vastuvõtja peab LEO navigatsioonisatelliidilt käsitlema (samad avaldatud arvud lennanud orbiidilt). Iga väljaanne on Kshanast sõltumatu, trükib oma arvud ja test esitab oma tolerantsi.

# text
seg-8e38103d05d6 = <b>Täiendavad read, mis toetuvad P1-le, leitud uuesti ülevaatamisel, kõik toetatud:</b> Kaugusmõõtmise koodi kavandamise kompromiss (avaldatud −{ "23.9" } dB Goldi ristkorrelatsioon); Kuu koordinaataeg (Ashby ja Patla { "2024" }, mille Kuu kiiruse ristkontroll DE440 vastu on teegi kontroll); Suletud kujul L-riba signaali võimsusspektritihedused (Kaplani ja Hegarty Q väärtused); Esimest järku ionosfääri viivitus riba kohta (IS-GPS-200 grupiviivituse suhe); Ülemaailmse keskmise signaal-ruumis kauguse vea kaalud (Montenbruck, Steigenberger ja Hauschild { "2018" } tabel).

# text
# c1: eigh
# c2: inv
seg-0014c53752ac = <b>P2 read, mille nimetas uuring, kõik toetatud:</b> Fisheri informatsioon ja Cramér–Rao jälgitavus (numpy <c1/>/<c2/>); Kuu andmesüsteemi identifitseeritavus; Seotud Kuu raamistiku ja ajaskaala gauge; Autonoomne vaba võrgu rikete jälgitavuse torujuhe (numpy/SciPy SVD, singulaarväärtuste lahutus). Iga arvutab üheselt defineeritud lineaaralgebra suuruse uuesti kinnitatud sisenditel teise algoritmiga kui Kshana Jacobi omaväärtuslahendaja.

# text
# c1: expm
seg-e9d01633d002 = <b>Täiendavad read, mis toetuvad P2-le, leitud uuesti ülevaatamisel, kõik toetatud:</b> MCDA (mitme kriteeriumiga otsuseanalüüs) prioriteetide tuletamine (AHP, analüütiline hierarhiaprotsess, omavektor SciPy/LAPACK-i poolt; Random Index tabel, mille see samuti reprodutseerib, on ärakiri ja seda ei loeta); Kella holdover-i veeremise dispersioon (SciPy <c1/> Van Loani laiendatud maatriksist); Kuu tugisüsteemi realisatsioon (numpy SVD Umeyama lahend); CRPA (juhitava vastuvõtumustriga antenn) kiirvormimine (LAPACK kompleksne lahend); Kuu ARAIM kaitsetaseme tuum (RTKLIB LU pööre SciPy kvantiilidega); Pakkujatevaheline Kuu raamistiku/dünaamika kooskõla (numpy SVD vähimruutude sobitus kolmele avaldatud efemeriidile).

# text
# c1: validated_oracle_basis()
seg-1fd94e94e89d = <b>Esimesel läbimisel märgitud, { "0.30" } käivituse { "2" }. voorus uuesti toetatud.</b> Kolm rida märgiti kui kirjutatud reegliga toetamata. Igaüks toetub nüüd võrdlusele, mis eelregistreeriti enne selle testandmete toomist, nii et ükski rida ei ole märgitud; üksuse <c1/> kõrval olev ühikutest fikseerib (nüüd tühja) loendi.

# text
# c1: raim_fde
# c2: raim::araim_raim
# c3: raim::araim_dual_raim
seg-3ef9479dea55 = <b>Terviklikkus (RAIM/ARAIM/SBAS).</b> Viidatud testid kinnitasid varem ainult usutavust tegelikul IGS (International GNSS Service) geomeetrial. Rida toetub nüüd kolmele teegi oraaklile (sõltumatu etalon): Airborne Design Document v4.2 ARAIM mitme hüpoteesi lahenduste eraldamine Stanford MAAST-i vastu ARAIM { "2" } jaoks ({ "270" } tegelikku juhtu, halvim VPL erinevus { "2.2e-3" } m versus { "0.05" } m); hetktõmmise RAIM tuvastamine ja välistamine RTKLIB <c1/> vastu ({ "2016" } { "2016" } otsusest identsed) kalde kaitsetasemega; ning SBAS DO-229E L1 kaitsetasemed Stanford MAAST-i vastu tegelikel WAAS edastustel ({ "2868" } paari täpsusega { "1.6e-5" } m). Rida ütleb otse, et ühtlase sigmaga funktsioonid <c2/> ja <c3/> ei järgi ADD-d ning et kahesageduslik L5 SBAS võrdlus on leid.

# text
seg-16a4261c77ec = <b>Planeetide asukohad üle päikesesüsteemi JPL Standishi Kepleri elementidest.</b> Nominaalvea kahekordne post-hoc lävi on asendatud eelregistreeritud lävega: RMS kuni Explanatory Supplement tabeli { "8.10.1" } arv planeedi ja komponendi kohta, JPL Horizons DE441 vastu, kus Maa jaotus ja ICRF pööre on kaetud.

# text
seg-8d5b51a942e0 = <b>Valguse aeg päikesesüsteemi kehade vahel.</b> Valguse aja lahendajat võrreldakse nüüd Horizonsi valguse aegadega täpsusega { "1e-6" } s DE441 asukohtadel, eelregistreeritud lävi, mis ei päri asukoha läve.

# text
seg-e96900bc322f = <b>MODELLED read, mille need kaks poliitikat teevad ülendatavaks</b> (ainult rida-realt { "0.30" } käivituse kaudu, mitte kunagi selle tekstiga): P1 all TDOA/FDOA (saabumisaja ja -sageduse erinevus) emitteri geolokatsiooni piir, relativistliku kellakiiruse ja raamistiku sidestus, ITU-T (Telecommunication Standardization Sector) sünkroniseerimismaskid (ainult maskiväärtuste jaoks, mida soovitused trükivad arvudena; iseendaga kontrollitud ärakirjastatud murdepunktid ei loe) ja 5G mitte-maapealse võrgu positsioneerimise piir (ainult siis, kui leitakse avaldatud läbitöötatud arv); P2 all ühisrežiimi terviklikkuse pimedus, skalaarne MHSS (mitme hüpoteesi lahenduste eraldamine) ajastuse kaitsetase ja GLS (üldistatud vähimruutude) valgendamine. Kaks ajastuse terviklikkuse bench-rida (Stanfordi terviklikkusdiagrammi klassifikaator ja terviklikkuse katvuse hindaja) on reeglipõhine klassifitseerimine, mitte lineaaralgebra, seega P2 neid ei ulatu; need vajavad sõltumatut tööriista ja ainus leitud (gLAB) kannab mitteärilist litsentsi.

# text
seg-50a08fe5918b = <b>Kooskõla varasemate keeldumistega.</b> Stardiakna rea Vallado kontroll kvalifitseeruks nüüd P1 all, kui selle test arvutab trükitud läbitöötatud näite; { "0.30" } kava ülendab selle selle asemel Orekiti kaudu. Kellaklassi kaupa Kuu aja ristumistabel jääb MODELLED: tabel, mida see reprodutseerib, pärineb selle projekti enda artiklist, mis ei ole sõltumatu.

# text
seg-02423542480f = Müra liige

# text
seg-2bd49b92f14b = Alani hindaja pariteet (ADEV/MDEV/TDEV/OHDEV (ADEV: Alani hälve; MDEV: modifitseeritud Alani hälve; OHDEV: kattuv Hadamardi hälve))

# text
# c1: tests/allan_reference.rs
# c2: tests/allan_nist_sp1065_1000point.rs
# c3: tests/nbs14
seg-c429a25d17ae = Kaks esmaallika kontrolli <b>NIST (National Institute of Standards and Technology) SP (Special Publication) { "1065" }</b> (Riley, <em>Handbook of Frequency Stability Analysis</em>, { "2008" }) vastu, mõlemad suhtelise tolerantsiga <b>{ "1e-4" }</b>. ({ "1" }) <c1/>: kattuv ADEV, modifitseeritud ADEV, ajahälve ja kattuv Hadamardi hindaja reprodutseerivad kanoonilise 10-punktilise <b>NBS14</b> andmekogumi hälbed (<b>SP { "1065" } tabel 29/30, lk { "107" }</b>) tau = { "1" }, { "2" } juures — ühtivus on tegelikult ~{ "1e-6" } (nt kattuv ADEV (OADEV) τ = { "2" } juures: { "85.952868" } vs { "85.95287" }). ({ "2" }) <c2/>: samad neli hindajat reprodutseerivad <b>SP { "1065" } §{ "12.4" } 1000-punktilise andmekogumi</b> (<b>tabel { "31" }, lk { "108" }</b>) keskmistamisteguritel { "1" } / { "10" } / { "100" }, kus andmekogum genereeritakse koodis uuesti SP { "1065" } LCG-st (valem { "73" }) — hermeetiline, testandmeid pole. Samad andmed ja tabeli 31 arvud on regressiooni siht projektis aewallin/allantools (<c3/>), siin reprodutseeritud ilma kolmanda osapoole koodita. See fikseerib <em>hindaja matemaatika</em> etaloni vastu, erinevalt allolevatest müra-<em>kalibreerimise</em> ridadest.

# text
seg-79e6f7d1e7f0 = Alani hindaja pariteet <b>tegeliku mõõdetud riistvara</b> korral

# text
# c1: tests/cs5071a_reference.rs
# c2: allantools
# c3: scripts/fetch_cs5071a.sh
# c4: tests/fixtures/cs5071a/
seg-8c72a9df2547 = <c1/>: kattuv Alani ja kattuv Hadamardi hindaja reprodutseerivad <b>Stable32</b> etalonhälbed <b>tegeliku 5071A tseesiumi primaarstandardi kohta, mida mõõdeti vesinikmaseri vastu</b> ({ "556 990" } faasinäidist τ₀ = { "1" } s juures; { "1" } PPS (impulss sekundis) 53230A loendurisse, veebruar { "2014" }; kogunud A. Wallin, jaotatud koos <c2/>). Kontrollitud <b>kogu dekaadi τ redelil ({ "16" } keskmistamistegurit, τ = { "1" } s … { "4" }×10⁴ s)</b>: hästi diskreetitud tegurid suhtelise väravaga <b>{ "1e-3" }</b> (täheldatud ühtivus on tegelikult ≤ { "3e-5" }, nt OADEV({ "1" } s) { "3.317111e-10" } vs Stable32 { "3.3171e-10" }), pika τ hõredad tegurid peavad jääma Stable32 trükitud { "1" }‑σ usaldusvahemikku. See täiendab ülaltoodud sünteetilist NBS14 pariteeti mõõdetud kella kontrolliga. Toores faasifail on kolmanda osapoole andmed ilma levitamislitsentsita, seega on see git-ignoreeritud; <c3/> reprodutseerib selle ja test trükib vahelejätmise teate (CI (pidev integratsioon) jääb roheliseks), kui seda ei ole. Kinnitatud on ainult avalikud Stable32 etalonarvud (<c4/>); kolmanda osapoole koodi ei kasutata.

# text
seg-1a7f0e741913 = Alani hindaja pariteet <b>kanoonilisel Stable32 PHASE.DAT-il</b>

# text
# c1: tests/phasedat_reference.rs
# c2: allantools
# c3: scripts/fetch_phasedat.sh
# c4: tests/fixtures/phasedat/
seg-00e382874a00 = <c1/>: kattuv Alani, modifitseeritud Alani ja ajahälbe hindaja reprodutseerivad <b>Stable32</b> etalonhälbed faili <b>PHASE.DAT</b> kohta — Stable32-ga jaotatud 1001-punktiline seeria, mida sõltumatud tööriistad (nt <c2/>) kasutavad oma standardse regressioonisihina — <b>kogu keskmistamisteguri redelil ({ "139" } tegurit)</b> suhtelise väravaga <b>{ "1e-3" }</b> (täheldatud ≤ { "5e-5" }). Teine, sõltumatu tegelik etalonseeria ülaltoodud mõõdetud tseesiumi kontrolli kõrval. PHASE.DAT tuleb kaubandusliku Stable32 tööriistaga, seega on toores seeria git-ignoreeritud; <c3/> reprodutseerib selle ja test jäetakse vahele rohelisena (CI jääb roheliseks), kui seda ei ole. Kinnitatud on ainult avalikud Stable32 etalonarvud (<c4/>); kolmanda osapoole koodi ei kasutata.

# text
seg-9dde9e0c8055 = Optilise kella stabiilsus <b>tegelikul mõõdetud kõveral</b>

# text
# c1: tests/optical_clock_adev_reference.rs
# c2: quantum_trade::qparams_from_adev_curve
# c3: tests/fixtures/optical_clock_adev/
seg-ea908ba3a79f = <c1/>: kellamüra parameetrite pööramine (<c2/>) reprodutseerib <b>avaldatud ⁸⁸Sr optilise võrekella σ_y(τ) väljaandest Norcia et al., <em>Science</em> { "366" }:{ "93" } ({ "2019" })</b> (Zenodo 10.5281/zenodo.3382347, <b>CC-BY-4.0</b> (Creative Commons Attribution { "4.0" }), kõver kaasatud asukohas <c3/>): taastatud valge sagedusmüra koefitsient √q_wf ≈ { "4.33e-16" } ühtib artikli ≈4.7e-16/√τ lühiajalise stabiilsusega (~{ "10" }% RMS (ruutkeskmine) üle kõvera) ja sobitus tuvastab nullist erineva mõõdetud põhja (q_rw > { "0" }). See fikseerib <b>mõõdetud ADEV → müraparameetrite pööramise tegeliku optilise kella vastu</b>; sellele ehitatud holdover-i läveni kasu jääb MODELLED.

# text
seg-e1e930dcd0a1 = Anomaaliatuvastuse ROC (vastuvõtja töökarakteristik) AUC (kõvera alune pindala) <b>tegelikul ESA (Euroopa Kosmoseagentuur) OPS-SAT telemeetrial</b>

# text
# c1: validated
seg-2b637daa985c = <c1/> (reprodutseerib sildid)

# text
# c1: tests/opssat_ad_reference.rs
# c2: impairment_eval::auc
# c3: roc_auc_score
# c4: eval_stats::bootstrap_auc_ci
# c5: tests/fixtures/opssat/
# c6: generate_opssat_oracle.py
seg-c667434b580d = <c1/>: <b>OPSSAT-AD</b> andmestikul (Ruszczak et al. { "2025" }, Zenodo 10.5281/zenodo.12588359, <b>CC BY { "4.0" }</b>) — tegelikud OPS-SAT majapidamissegmendid tõeliste anomaaliasiltidega — reprodutseerib Kshana Mann–Whitney ROC AUC (<c2/>) <b>scikit-learn <c3/></b> täpsusega <b>< { "1e-9" }</b> tagasihoitud testjaotusel ({ "529" } segmenti, { "113" } anomaaliat), kahe deterministliku skoori puhul: läbipaistev ühe tunnusega detektor (segmendi tippude arv, <b>AUC ≈ { "0.851" }</b>) ja normaalsetel treeningsegmentidel sobitatud 8-tunnuseline diagonaalne Mahalanobise skoor (AUC ≈ { "0.556" }); <c4/> ümbritseb punkthinnangu alampiiriga, mis ületab juhuse. See valideerib <b>AUC arvutuse tegelikel ESA andmetel</b> ja läbipaistva detektori <b>sildistatud eristuse</b> — see <b>ei</b> reprodutseeri OPSSAT-AD artikli parimat avaldatud mõõdikut (juhendatud FCNN (täielikult ühendatud närvivõrk), F1 ≈ { "0.95" }), mis vajab nende treenitud mudelit. CC-BY andmed on kaasatud (<c5/>, hermeetiline); oraakel (sõltumatu etalon) genereeritakse uuesti käsuga <c6/>.

# text
seg-5f2d41617fb2 = Gravitatsioonivälja funktsionaalide süntees (gravitatsioonitoega / GNSS-vaba (GNSS: ülemaailmne satelliitnavigatsioonisüsteem) navigatsioonikaart)

# text
# c1: tests/icgem_gravity_reference.rs
# c2: gravity_sh::gravity_magnitude
# c3: gravity_disturbance_mgal
# c4: from_gfc
# c5: tests/agency_lro.rs
seg-4c1126137428 = <c1/>: sfäärilise harmoonilise gravitatsioonifunktsionaali tuum (<c2/> / <c3/>) — „kaardilugeja“, mida gravitatsioonitoega navigaator sobitab — on valideeritud <b>GRS80 (Geodetic Reference System { "1980" }) normaalgravitatsiooni standardi</b> vastu (Moritz { "1980" }, IAG poolt vastu võetud (IAG: Rahvusvaheline Geodeesia Assotsiatsioon)). GRS80 normaalvälja ehitamine selle avaldatud paarisvööndiharmoonilistest J₂…J₈ ja gravitatsiooni (külgetõmme + tsentrifugaal) süntees ellipsoidil reprodutseerib suletud kujul <b>Somigliana</b> normaalgravitatsiooni ning avaldatud ekvaatori-/poolusväärtused γ_e = { "9.7803267715" } / γ_p = { "9.8321863685" } m/s² suhtelise täpsusega <b>{ "3.5e-12" }</b> kõigil laiuskraadidel (värav { "1e-9" }). Sama tuum laadib lipulaeva <b>tegeliku ICGEM (International Centre for Global Earth Models) Maa mudeli EGM2008 (Earth Gravitational Model { "2008" })</b> (NGA (National Geospatial-Intelligence Agency) avalik omand ICGEM-i kaudu; lugejat <c4/> katsetatakse ka GRAIL (Gravity Recovery and Interior Laboratory) Kuu väljal failis <c5/>) ja toodab füüsikaliselt piiratud gravitatsioonihäiringu kaardi (RMS ≈ { "26" } mGal, maks ≈ { "89" } mGal d/o { "70" } juures). Valideerib <b>sünteesikoodi õigsust</b>; gravitatsioonitoega <em>navigatsioonifiksi täpsus</em> jääb MODELLED (avalikku platvormil gravimeetri trajektoori tõelise väärtusega pole).

# text
seg-7dc3ff4c6eea = Mürategi-spetsiifiline edf (usaldusvahemikud)

# text
# c1: src/allan.rs
# c2: tests/allan_nist_sp1065_1000point.rs
seg-7e8a93fb2eea = <c1/>: χ² usaldusvahemik iga kattuva ADEV punkti kohta kasutab mürategi-spetsiifilisi efektiivseid vabadusastmeid (NIST SP { "1065" } tabeli { "5" } suletud kujud valge ja flicker faasimodulatsiooni, valge ja flicker sagedusmodulatsiooni ning juhusliku käidu sagedusmodulatsiooni (WPM/FPM/WFM/FFM/RWFM) jaoks — Stable32 lihtne komplekt), salvestuse astmeseaduse tüüp tuvastatakse selle MDEV log-log tõusust. Kolm sõltumatut kontrolli: (a) viis valemit reprodutseerivad käsitsi hinnatud väärtused N={ "64" },m={ "4" } juures täpsusega { "1e-12" }; (b) <b>Monte Carlo valge-FM (FM: sagedusmodulatsioon) ansambel</b> ({ "4 000" } salvestust) mõõdab hindaja tegelikku hii-ruut edf = { "2" }·mean²/Var(σ²) ja ühtib valemiga { "20" }% piires (ning ületab oluliselt konservatiivset mittekattuvat loendust); (c) <c2/> reprodutseerib trükitud <b>SP { "1065" } tabeli { "32" } (lk { "109" })</b> edf = { "146.177" } 1000-punktilise andmekogumi jaoks m={ "10" } (valge FM) juures täpsusega { "5e-3" } ning tabeli { "95" }% usaldusvahemiku piirid ({ "8.223942e-2" } / { "1.035201e-1" }) täpsusega <{ "0.2" }% (väike jääk on Wilson-Hilferty χ² lähendus versus NIST-i täpne χ²). Eksporditud ADEV kõver kannab iga τ kohta tuvastatud mürategi, edf-i ja { "95" }% vahemikku.

# text
seg-7048ac695b99 = Valge FM (lühiajaline)

# text
# c1: tests/calibration.rs
seg-b6982cb2ca25 = <c1/>: simuleeritud kattuv ADEV reprodutseerib avaldatud sigma_y({ "1" } s) — tavaliselt mõne protsendi piires, <b>jõustatud värav { "20" }%</b> (CSAC ja optilise võrekella siht) — ning valge-FM kõvera sigma_y(tau)=sigma_y(1s)/sqrt(tau) üle tau = { "1" }, { "10" }, { "100" } s <b>{ "25" }% värava</b> piires (ühtib CSAC (kiibimõõtmeline aatomkell) andmelehe { "3e-10" } / { "1e-10" } / { "3e-11" } arvudega).

# text
seg-11fc7c4b61ff = Juhusliku käidu FM (pikaajaline)

# text
# c1: tests/calibration.rs
seg-1e211f342e79 = <c1/>: simuleeritud ADEV ühtib sigma_y^{ "2" }(tau)=q_rw*tau/3 (Riley NIST SP { "1065" }) ligikaudu { "20" }% täpsusega (algväärtuste (seed) keskmisena).

# text
seg-dcfca4041429 = Vananemine / lineaarne triiv

# text
# c1: modeled
seg-2d5c6a44cbdb = <c1/> + välja kalibreeritud

# text
# c1: src/estimator.rs
# c2: src/models.rs
seg-492f91ba2f79 = Deterministlik; holdover-i hindaja eemaldab nihke ja vananemise ruutprognoosijaga, nii et jääk on stohhastiline piir. Testitud failides <c1/> / <c2/>.

# text
seg-2ea6a14cac1c = Kalmani hindaja + terviklikkuse piir

# text
# c1: src/kalman.rs
# c2: q_wf*T + q_rw*T^3/3
# c3: P⁺ = (I−KH)P(I−KH)ᵀ + KRKᵀ
# c4: R=1e-26 / Q≈1e-30
# c5: src/run.rs
seg-8c8f8a5eba5a = <c1/>: kahe olekuga (faas, sagedus) filter, mille täpne van Loani protsessimüra ühtib tõe mudeliga; veerumine reprodutseerib analüütilise holdover-i dispersiooni <c2/> täpsusega { "1e-9" }. Kovariatsiooni uuendus on <b>Josephi stabiliseeritud kujul</b> <c3/>, mis jääb positiivselt poolmääratuks (Choleskyga kontrollitud) läbi { "500" } ennustus-/uuendussammu äärmusliku <c4/> suhte juures ja ühtib naiivse kujuga täpsusega { "1e-9" }, kus viimane on hästi tingimustatud. Käivituskiht esitab terviklikkuse katkestuse näidiste osana 3-sigma kaitsepiiri sees (<c5/>).

# text
seg-f332f06e80f9 = Filtri enda kooskõla (NIS (normaliseeritud innovatsiooni ruut) / NEES (normaliseeritud hinnanguvea ruut))

# text
# c1: validated
seg-333e1701b6d0 = <c1/> (mudel)

# text
# c1: src/filter_health.rs
# c2: consistent=true
# c3: consistent=false
# c4: filter_health
# c5: detection::chi2_inv_cdf
seg-c1304de95180 = <c1/>: Monte Carlo kooskõlahinnang (Bar-Shalom §{ "5.4" }). Sobiva filtri koondatud <b>NIS → { "1" }</b> ja <b>NEES → { "2" }</b> jäävad oma { "95" }% χ² vahemikku (NIS vahemik kasutab koondatud valge innovatsiooni arvu; NEES vahemik sõltumatute käivituste arvu, kuna hinnanguvead on ajaliselt korreleeritud). <b>Q/R mittevastavuse pühkimise</b> test kontrollib, et monitoor teatab <c2/> ainult ühikhäälestuse korral ja <c3/> häälestuse ×0.1/×0.5/×2/×{ "10" } korral, NIS skaleerub ≈1/q_factor, nagu tuletatud. Esitatud kui <c4/> kella tulemuse JSON-is (JavaScript Object Notation) ja mänguväljaku kaardil. χ² vahemikud kasutavad Wilson–Hilferty kvantiili (<c5/>, tabeliga kontrollitud).

# text
seg-078c4009b24f = Kahesuunalise aja edastamise mudel

# text
# c1: src/timetransfer.rs
# c2: (m_AB - m_BA)/2
# c3: 1/sqrt(2)
# c4: sigma_y^2(tau) = q_rw*tau/3
# c5: step()
# c6: sigma_j
# c7: q_rw
seg-22f8cdeda335 = <c1/>: vastastikune ühisrežiimi viivitus kaob hinnangus <c2/> täpselt (käsitsi tuletatud, täpne) ja kaks ühesuunalist mõõtmist keskmistuvad väärtuseks <c3/> (algväärtuste (seed) keskmisena); mittevastastikune diferentsiaalviivitus on värviline valge-FM + juhusliku käidu FM protsess, mille Alani hälve järgib <c4/> (algväärtuste keskmisena, ~{ "20" }%, lingi enda <c5/> kaudu). <em>Parameetrid</em> (lingi kohta <c6/>, <c7/>) on esindavad TWSTFT/optilised (TWSTFT: kahesuunaline satelliidi aja ja sageduse edastus) arvud, mida ei ole konkreetse terminali jaoks sobitatud.

# text
seg-6ab219622143 = Turvalisus (spuufimise tuvastuse skoor)

# text
# c1: src/security.rs
# c2: sqrt(r/m + q_wf*tau + q_rw*tau^3/3)
# c3: k
# c4: [0,1]
# c5: tau
# c6: k
# c7: r
seg-29dd10011ed1 = <c1/>: monitoori 1-sigma põhi <c2/> ning sellest tulenev <c3/>-sigma minimaalselt tuvastatav nihe ja <c4/> skoor on käsitsi tuletatud ja ühiktestitud. Mudel (innovatsioon / RAIM-laadne (RAIM: vastuvõtja autonoomne terviklikkuse seire) kellatoega tuvastus) on usaldusväärne; <em>parameetrid</em> (seirraam <c5/>, tuvastuskordaja <c6/>, mõõtemüra <c7/>) on esindavad, mitte konkreetse vastuvõtja jaoks sobitatud.

# text
seg-ca51e4f1e19c = Spuufimisrünnaku tuvastamine

# text
# c1: src/spoof.rs
# c2: start + bound/rate
# c3: representative-parameters
seg-e991f5b2fdb2 = <c1/>: kasvav vale-aja spuufimine märgitakse, kui selle nihe ületab kella tuvastuspiiri; tuvastusaeg ühtib käsitsi tuletatud <c2/> ühe ruudustiku sammu täpsusega ning kell, mille piir ületab spetsifikatsiooni, laseb spuufimisel jõuda lävendini märkamatult. Sama <c3/> hoiatus mis turvalisuse skooril.

# text
seg-3d2f6d2b7722 = Flicker FM (põhi)

# text
# c1: modeled
seg-55697d598918 = <c1/> (vaikimisi väljas)

# text
# c1: src/models.rs
# c2: flicker_floor
seg-55000870c060 = Sünteesitud logaritmilise vahega Ornstein-Uhlenbecki (OU) protsesside summana, mis on kalibreeritud seadistatava tasase ADEV põhja järgi; <c1/> valideerib, et põhi on tasane üle keskmistamisaja ja asub seadistatud tasemel (algväärtuste (seed) keskmisena). Lubatud kella kohta käsuga <c2/>. Viidatud võrdlusstsenaariumid jätavad selle välja: CSAC on valge-FM-i domineeritud kogu oma andmelehe vahemikus (1-1000 s) ja optilise kella süstemaatiline põhi (~{ "5e-17" }) on esitatud selle täpsusarvuga.

# text
seg-e2e3de9a61a4 = Monte Carlo ansambli statistika

# text
# c1: validated
seg-9785d05ec5a7 = <c1/> (koondamine)

# text
# c1: src/ensemble.rs
# c2: runs
# c3: p05 <= p50 <= p95
seg-cc6c6bb5eb83 = <c1/>: lähima järgu protsentiilid ja keskmine üle <c2/> reprodutseeritava realisatsiooni; üksik käivitus varistab hajuvuse kokku, ajasammu kaupa vahemik on järjestatud <c3/> ja kordusjooksud on bitt-bitilt identsed. See on statistiline koondamine juba valideeritud üksikkäivituse üle, mitte uus füüsikaline mudel.

# text
seg-72a9d5de61f5 = sigma_y({ "1" } s)

# text
seg-ebbe708d9cbc = csac-sa45s (CSAC)

# text
seg-c43fe67d4200 = Microchip SA65 / SA.45s andmeleht

# text
seg-e3bde4355d78 = optical-sr-lattice (Sr võrekell)

# text
seg-87793f684233 = strontsiumi optiline võrekell, kosmosele suunatud siht, arXiv:{ "1503.08457" }

# text
seg-b03f5856d451 = Olek: valge FM ja juhusliku käidu FM valideeritud; vananemine modelleeritud ja välja kalibreeritud; flicker FM modelleeritud ja valideeritud (viidatud stsenaariumides vaikimisi väljas).

# text
seg-c5ff448dcb88 = Küpsus: optilise kella arvud on <em>kosmosele suunatud siht</em> maapealse riistvara kohta -- ükski strontsiumi optiline kell ei ole lennanud. Laboratoorsed Sr kellad jõuavad väärtuseni { "4.8e-17" } (Oelker et al. { "2019" }, Nature Photonics). CSAC arvud pärinevad kasutusel olevast kaubanduslikust osast.

# text
seg-b59a4b8e6d88 = Seosed: Riley, NIST SP { "1065" }, valem { "67" } -- valge FM sigma_y^{ "2" }(tau)=h0/({ "2" } tau); juhusliku käidu FM sigma_y^{ "2" }(tau)=({ "2" } pi^2/3) h_-2 tau, samaväärselt q_rw*tau/3 sageduse Wieneri protsessi jaoks difusiooniga q_rw.

# text
seg-dca7ee671d91 = Pakett { "2" } — inertsiaalne dead-reckoning (kvantinertsmõõteseade)

# text
seg-98452a081241 = Konstantne/jääknihe -> asukoht

# text
# c1: src/inertial/mod.rs
seg-6aa386251acf = asukohaviga = { "0.5" }<em>b</em>T^{ "2" } pere (Groves AESS (Aerospace and Electronic Systems Society) Tutorial); käsitsi tuletatud diskreetne test failis <c1/>.

# text
seg-c60c0b54c485 = Kiiruse juhuskäik (valge kiirendus)

# text
# c1: src/inertial/mod.rs
seg-7ce1f40566cf = <c1/>: simuleeritud asukohavea SD (standardhälve) ühtib sigma_x(T)=sqrt(S_a*T^3/3) (Groves valem 54) ligikaudu { "12" }% täheldatud täpsusega (algväärtuste (seed) keskmisena; jõustatud värav { "20" }%).

# text
seg-8ac776795d40 = Külmatoomse interferomeetri (CAI) kiirendusmõõturi füüsika (esimestest printsiipidest)

# text
# c1: src/inertial/quantum_imu.rs
# c2: k_eff = 4pi/lambda ~ 1.611e7 rad/m
# c3: Phi = k_eff*a*T^2 ~ 1.580e4 rad
# c4: T = 10 ms
# c5: sigma_Phi = 1/(C*sqrt(N)) = 2e-3 rad
# c6: C = 0.5
# c7: N = 1e6
# c8: sigma_a ~ 1.24e-6 m/s^2
# c9: 1/T^2
# c10: 1/sqrt(N)
# c11: q_va()
# c12: AccelModel
# c13: QUANTUM.md
seg-4eafc81873ed = <c1/>: kolmeimpulsiline Mach-Zehnderi külmatoomne interferomeeter. Käsitsi kontrollitud õpiku geomeetria vastu — Rb-87 <c2/>; <c3/> { "1" } g juures, <c4/>; projektsioonimüra <c5/> juures <c6/>, <c7/>; ühe laske kohta <c8/>; skaleerimisseadused <c9/> ja <c10/>; eksponentsiaalne kontrasti vähenemine. <c11/> <b>tuletab</b> valge kiirenduse PSD (võimsusspektritiheduse), mida klassikaline <c12/> tarbib. Aus ulatus: ainult <b>kvantprojektsioonimüra põhi</b> (~{ "0.09" } ug/sqrtHz siin) — kaugelt alla tegelike, vibratsioonipiiratud seadmete (1-50 ug/sqrtHz); vibratsioonitensorit, Coriolise ja valgusnihke süstemaatikat ei ole veel modelleeritud (vt <a1><c13/></a1>).

# text
seg-ed78f40a8d80 = Güroskoobi nihe + nurkne juhuskäik (ARW) -> kalle -> gravitatsiooni sidestus

# text
# c1: g*theta
# c2: src/inertial/mod.rs
# c3: gyro_bias
# c4: q_arw
seg-a73e97ac4a0e = Jääk-güroskoobinihe ja ARW ajavad asendivea; kalle sidestab gravitatsiooni (<c1/>) horisontaalsesse erijõu viga. <c2/> valideerib puhta nihke kuupasukoha kasvu täpselt ja ARW asendi kasvu Wieneri protsessina (algväärtuste (seed) keskmisena). Lubatud anduri kohta käskudega <c3/> ja <c4/>; viidatud ainult kiirendusmõõturiga stsenaariumides väljas.

# text
seg-e68d093e952a = Nihke ebastabiilsus (1/f flicker-põhi)

# text
# c1: src/inertial/mod.rs
# c2: bias_instability
seg-5ad1e7d55d07 = <c1/>: 1/f flicker-protsess (sama OU süntees, mis on kella jaoks valideeritud), mille tasane Alani hälbe põhi asub nihke ebastabiilsuse koefitsiendil; null on tühitoiming, nullist erinev põhi muudab trajektoori, mõlemad reprodutseeritavad. Lubatud anduri kohta käsuga <c2/>.

# text
seg-b631c1bfce05 = Kiirenduse juhuskäik (kiiruse juhuskäik)

# text
# c1: src/inertial/mod.rs
# c2: Var(bias_rw(T)) = q_aa*T
# c3: q_aa
seg-4a4a70363412 = <c1/>: nihe on Wieneri protsess, mille <c2/>, kontrollitud algväärtuste (seed) keskmisena ligikaudu { "20" }% täpsusega. Lubatud anduri kohta käsuga <c3/>.

# text
seg-49c4a2532dca = NaveGo ristvalideerimine (IMU (inertsmõõteseade) müra koefitsiendid)

# text
# c1: tests/navego_imu_crossval.rs
# c2: github.com/rodralez/NaveGo
# c3: navego_example_allan.m
# c4: ADEV(1 s) = σ·√dt
# c5: < 5%
# c6: .mat
seg-e558aa705560 = <c1/>: väline ristkontroll <b>NaveGo</b> vastu (R. Gonzalez, avatud lähtekoodiga INS/GNSS (INS: inertsiaalnavigatsioonisüsteem) tööriistakomplekt, <c2/>). Reprodutseerib NaveGo <c3/> sünteetilise edasi-tagasi tsükli selle <b>avaldatud Microstrain 3DM-GX3-35 etalonprofiilil</b>: meie (NBS14/Stable32-ga valideeritud) kattuva ADEV hindaja juhtimine valge anduri müraga NaveGo 1-σ tasemetel taastab kiiruse ja nurga juhuskäigu (VRW, ARW) koefitsiendid (<c4/>) täpsusega <c5/> (tegelik ~{ "0.4" }%), valge müra haru −1/2 tõusul. Kinnitab, et meie Alani torujuhe ja NaveGo VRW/ARW definitsioonid ühtivad. { "40" } MB salvestatud STIM300 <c6/> logi ei loeta sisse (binaarvorminguga piiratud).

# text
seg-171b215f0526 = Skaalategur, peenemad ristteljeliikmed

# text
# c1: not modeled
seg-b690ed87f493 = <c1/> selles 1-DOF (üks vabadusaste) paketis

# text
# c1: gnss-ins
# c2: src/inertial/imu_errors.rs
seg-c1bd4e24c091 = Pärandi ühetelgsel paketil ei ole skaalateguri ega ristsidestuse viga. Kolmetelgne strapdown-teek ja <c1/> pakett modelleerivad skaalategurit, nihkejoondust, g-tundlikkust, kvantimist ja kiiruse ramp'i (<c2/>; vt allolevat väidete tabelit).

# text
seg-ce2b3237acfe = nihke stabiilsus

# text
seg-129dc6af8f10 = müra juur-PSD

# text
seg-7109e60b8c9b = cold-atom-quat (kvant)

# text
seg-5f5690d74918 = { "5.88e-7" } m/s^{ "2" } ({ "60" } ng, { "24" } h)

# text
seg-8e83c799fb03 = { "22" } ug/sqrtHz = { "2.16e-4" } (m/s^{ "2" })/sqrtHz

# text
seg-b52686064c43 = Templier et al. { "2022" }, Science Advances (arXiv:{ "2209.13209" })

# text
seg-09b42bed82c9 = nav-grade-quartz (klassikaline)

# text
seg-fa9adbe58c2f = { "1.57e-3" } m/s^{ "2" } (~{ "160" } ug)

# text
seg-63f64f576abc = ~{ "20" } ug/sqrtHz = { "1.96e-4" } (m/s^{ "2" })/sqrtHz

# text
seg-8714c547449a = Honeywell QA-2000 / Groves AESS Tutorial

# text
seg-79fc524162b5 = Aus raamistus: külmatoomse eelis on <b>pikaajaline nihke stabiilsus</b> (~2600x madalam), mis domineerib pikka GNSS katkestust läbi { "0.5" }<em>b</em>T^{ "2" }. Lühiajaline müra on võrreldav (kvant ~{ "22" } vs klassikaline ~{ "20" } ug/sqrtHz) — kvantandur võidab maratoni, mitte sprinti. Küpsus: külmatoomsed kiirendusmõõturid on laboratoorsed/varajased (JRC122785), navigatsiooniklassi kvarts on kasutusel.

# text
seg-e02e93f4f30a = Pakett { "3" } — aja edastamine (optiline vs raadiosagedus (RF), optiline satelliitidevaheline link)

# text
seg-2b87e5f0ba7e = Valge ajastusvärin -> sünkroonimise korduvtäpsus

# text
# c1: src/timetransfer.rs
seg-229295aa1f70 = <c1/>: simuleeritud sünkroonimise RMS reprodutseerib lingi värina sigma_j; näidiste keskmine keskmistub kui sigma/sqrt(N) täpsusega <{ "20" }% (algväärtuste (seed) keskmisena).

# text
seg-4325ec478bca = Ajastus -> ühesuunaline kaugusmõõtmine

# text
seg-aa7a1f463683 = kaugus = c * dt, c={ "299792458" } m/s; { "1" } ps = { "0.299792458" } mm (täpne, käsitsi tuletatud test).

# text
seg-7ad8bb95bf35 = Flicker/TDEV põhi, kahesuunalise vastastikkuse jääk

# text
# c1: src/twstft_budget.rs
# c2: time-transfer-budget
# c3: timetransfer
seg-5bf72778b6c2 = <c1/> (liik <c2/>): flicker-faasimüra (Kasdin–Walter, tasane TDEV), ööpäevane mittevastastikkus ja konstantne vastastikkuse jääk kahesuunalisel real; valge värina pakett <c3/> on muutmata.

# text
seg-dae3fa0375fe = ühe näidise värin

# text
seg-4a141a45a8ff = allikas

# text
seg-ee136a1d0051 = { "1" } ps ({ "1e-12" } s)

# text
seg-c78abd60ec97 = orbiidil usutav siht

# text
seg-9dfc1d4334a3 = optiline satelliitidevaheline link, pikosekundiline sünkroonimise siht; labori O-TWTFT (TWTFT: kahesuunaline aja ja sageduse edastus) ~{ "1" } fs (Giorgetta { "2013" } / Deschenes { "2016" })

# text
seg-4f3d23d83190 = { "0.5" } ns ({ "5e-10" } s)

# text
seg-0e730e8e2237 = mõõdetud üksik seanss

# text
seg-b9faad47d802 = BIPM/PTB/NIST (BIPM: Rahvusvaheline Kaalude ja Mõõtude Büroo; PTB: Physikalisch-Technische Bundesanstalt, Saksamaa riiklik metroloogiainstituut) TWSTFT

# text
seg-51e2e5782c96 = Aus raamistus: optiline arv on pikosekundilise tasemega orbiidil sünkroonimise siht (mitte lennanud). Maapealne optiline labori põhi on ~{ "1" } fs (palju parem); hästi projekteeritud mikrolainelink (ACES (Atomic Clock Ensemble in Space) mikrolainelink (MWL), ~{ "0.3" } ps) võib optilisega võistelda, nii et „RF = { "0.5" } ns“ lähtetase on konkreetselt tavaline TWSTFT. Kauguse teisendus on ühesuunaline (kaugus = c<em>dt); kahesuunaline/edasi-tagasi poolitab selle (kaugus = c</em>dt/2).

# text
seg-5fa72f18f983 = Pakett { "4" } — hübriidliitmine (kokkuvõte)

# text
# c1: pnt_holdover_s
seg-3de12b094504 = Koostab paketi { "1" } (kell), paketi { "2" } (inertsiaal) ja paketi { "3" } (aja edastamine) üheks PNT (positsioneerimine, navigatsioon ja aeg) komplektiks. Komplekt peab hoidma piirides MÕLEMAD ajastuse (< ajastusspetsifikatsioon) ja asukoha (< asukohaspetsifikatsioon); <c1/> on aeg, kuni üks neist rikutakse. Valikuline optiline satelliitidevaheline link (ISL) aja edastamine sünkroniseerib kella katkestuse ajal uuesti (ainult ajaabi — asukohta ei sünkroniseerita uuesti, sest aja edastamine annab aega, mitte asukohta).

# text
seg-4f7cd8f86565 = Aspekt

# text
seg-19deb2a3537c = Kombineeritud PNT hindamine (ajastus JA asukoht)

# text
# c1: src/hybrid.rs
# c2: score_hybrid
seg-77a7595ffad7 = <c1/> käsitsi tuletatud <c2/> test (pnt_holdover = esimene ajastusest/asukohast, mis rikub).

# text
seg-d0e39bf123d8 = Terviklikkus + turvalisus hübriidpaketi jaoks

# text
# c1: src/hybrid.rs
seg-3fb63eb2b6b8 = <c1/>: Kalmani ajastushindaja, mis on distsiplineeritud tõe suhtes (nominaalne) ja ankurdatud uuesti iga optilise uuestisünkroonimisega; terviklikkus on kaitsepiiri sisalduvus (piir sisaldab lingi värina põhja), turvalisus spuufimise tuvastuse skoor. Testitud mõlema komplekti jaoks, sealhulgas lingiabiga juhtum.

# text
seg-c3be96b7cb41 = Ühine liitmishindaja

# text
# c1: src/fusion/mod.rs
seg-e9d5448ea06c = <c1/>: üksik ühine Kalmani filter ([faas, sagedus] ⊕ [asukoht, kiirus]) on navigaator, mida distsiplineerib GNSS (õppides nihked nullist erinevast algkovariatsioonist) ja mida toetab aja edastamine; ühine kovariatsioon annab ühise terviklikkuse, mis on testitult usaldusväärne (≥{ "0.9" }) mõlema komplekti jaoks müraga kooskõlaliste anduritega. Pakett vaatleb asukohta ja aega <b>eraldi</b>, mille jaoks optimaalne filter on plokk-diagonaalne; liitoleku konstantse nihke hindamine ja dünaamiline ristabi on tulevane töö.

# text
seg-915ec766439f = Sidestatud kell+asukoht filter (plokkidevaheline kovariatsioon)

# text
# c1: CoupledPntFilter
# c2: [pos, vel, phase, freq]
# c3: ρ = g·pos + c·phase + noise
# c4: P[pos,phase]
seg-fd718a51859a = <c1/>: üksik virnastatud <c2/> Kalmani filter (Josephi kujuga uuendused), mille <b>pseudovahemaa</b> mõõtmine <c3/> sidestab asukoha ja kella plokid. Testid: jagatud pseudovahemaa ajab <c4/> nullist erinevaks (lahtisidestatud filtrid hoiavad selle täpselt { "0" }); kaks erinevat geomeetriat lahendavad ühiselt süstitud asukoha ja kella nihked, mida üksik kaugus eraldada ei saa; <b>ainult kella</b> fiks teravdab <b>asukohta</b> ristkovariatsiooni kaudu (kasu, mida sidestus annab ja lahtisidestatud filtrid ei saa); ning Monte Carlo <b>NEES on χ²({ "4" })-kooskõlaline</b> (Bar-Shalom §{ "5.4" }, käivitustel põhinev vahemik). 1-DOF (paketi dimensionaalsus); veel ei ole käitatavasse paketti ühendatud ja 3-D 8-olekuga laiendus on tulevane töö.

# text
seg-31ecf062b941 = Valideeritud alammudelite koostis

# text
seg-9b849cb4fe8d = pärib

# text
seg-4e1c8b6791f3 = kella/inertsiaalsed/aja edastamise liikmed on valideeritud nende endi pakettides.

# text
# c1: gnss-ins
seg-b672e5499976 = Lõdvalt seotud GNSS/INS (pakett <c1/>)

# text
# c1: src/fusion/{gnss_ins_ekf,closed_loop,pack}.rs
# c2: closed_loop::tests::gyro_bias_coupling_predicts_the_strapdown_attitude_error
seg-277425f2cbcf = <c1/>: 15-olekuline veaoleku EKF (δp, δv, ψ, kiirendus-/güroskoobinihe; Groves §{ "14" }) juhib kolmetelgset strapdown-navigaatorit tagasisidega. Testid: süstitud asukohaviga nullitakse täieliku tõe abi korral; abistatud lahend jääb meetripiiratuks, samal ajal kui vabalt töötav INS hälbib üle { "100" } m; ja liidetud asukoha RMS { "60" } s katkestuse jooksul ületab abistamata dead-reckoning-i ansambli testi piiri võrra (~{ "4" }×, kui mõõdetud enne { "0.27.3" }; varu on suurem allpool oleva parandusega). Güroskoobinihke sidestust kontrollitakse strapdown-i enda vastu: teadaolev jääk-güroskoobinihe peab tekitama asendivea, mida filter ennustab (<c2/>), ja lai eeljaotus peab õppima lennujuhtkontrolleri klassi güroskoobinihke, jäädes piiratuks; mõlemad ebaõnnestuvad enne 0.27.3 märgiga. <b>Muudetud versioonis { "0.27.3" }:</b> sellel sidestusel oli vale märk, nii et güroskoobinihke hinnangud lükkasid vales suunas ja ainult range eeljaotus hoidis paketi stabiilsena; avaldatud katkestuse arvud muutusid (CHANGELOG, Fixed). Aus piir: lõdvalt seotud kiirenduse nihke/kalde on nõrgalt eraldatavad, seega ei väideta nihkepõhist kalibreerimist.

# text
seg-1c9a9f76a432 = Tihedalt seotud GNSS/INS (pseudovahemaa)

# text
# c1: update_tightly_coupled
# c2: closed_loop.rs
# c3: fuse_tightly_coupled
seg-b4ccc12229c4 = <c1/> + <c2/> <c3/>: innovatsioon moodustatakse kaugusvaldkonnas (nähtavusjoone Jacobi δp-l). Testid: neli satelliiti nullivad süstitud { "8" } m/−{ "5" } m horisontaalse vea täpsusega < { "0.1" } m; <b>kaks satelliiti</b> (asukoha, kiiruse ja aja (PVT) fiksi pole võimalik) vähendavad siiski horisontaalset viga rohkem kui { "5" }×; üksik pea kohal olev satelliit vaatleb ainult nähtavusjoone suunalist (vertikaalset) komponenti ja jätab horisontaalse puutumata; vigased sisendid lükatakse tagasi. Ainult pseudovahemaa — kandelaine faas ja selge vastuvõtja kella olek on teekaardil.

# text
seg-240b681b6021 = Andurite ristabi täpsus (täielik Kalmani/faktorgraafi liitmine)

# text
# c1: not modeled
# c2: hybrid
seg-efe7e288276b = <c1/> paketis <c2/>

# text
# c1: gnss-ins
# c2: hybrid-ukf
seg-e5371874c57d = Hübriidpakett on süsteemitaseme koostis + ajaabi, mitte optimaalne hindaja. Filtrid on olemas mujal: pakett <c1/> lõdvalt ja tihedalt seotud EKF (laiendatud Kalmani filter) (read ülal) ja liigi <c2/> 17-olekuline UKF (unscented Kalmani filter (UKF)). Faktorgraafi silurit ei modelleerita.

# text
seg-189758709fd2 = Tulemus: täis-kvantkomplekt hoiab täielikku PNT-d läbi { "1.8" } h katkestuse; täis-klassikaline komplekt on <b>asukohast piiratud</b> (navigatsiooniklassi IMU rikub esimesena). Optiline ISL aja edastamine hoiab lukus isegi klassikalise KELLA, eraldades inertsiaalanduri klassikalise komplekti nõrga lülina — põhiargument kvantinertsiaali ja optilise ajastuse koos kasuks.

# text
seg-a4c5b45ea8a5 = Geomeetria — GNSS kättesaadavus orbiitidelt

# text
seg-d347bb63c1fd = Ringikujuline kahekeha propageerimine

# text
# c1: src/orbit.rs
# c2: T=2 pi sqrt(r^3/mu)
seg-60c369fbbd97 = <c1/>: periood <c2/> (mu = { "3.986004418e14" }), asukoht naaseb ühe perioodi järel, ekvatoriaal-/polaartasapinnalisus — käsitsi tuletatud testid.

# text
seg-1260a2fef95f = Ekstsentriline (Kepleri) propageerimine

# text
# c1: src/orbit.rs
# c2: M = E - e sin E
# c3: a(1∓e)
seg-49df9d526f9c = <c1/>: Kepleri võrrand <c2/> lahendatud Newtoniga (jääk < { "1e-12" }); perigeumi/apogeumi raadiused <c3/>; ringjuht ühtib suletud kujul teega täpsusega { "1e-9" }.

# text
seg-958f03424508 = J2 sekulaarne sõlme-/apsiidide triiv

# text
# c1: src/orbit.rs
# c2: Omega_dot = -1.5 n J2 (Re/p)^2 cos i
# c3: argp_dot = 0.75 n J2 (Re/p)^2 (5cos^2 i - 1)
seg-336b9581c47c = <c1/>: <c2/>, <c3/> (Vallado); sõlm taganeb (prograadne) / edeneb (retrograadne) / on paigal (polaarne) ja apsiidid külmuvad kriitilisel kaldel { "63.4" } kraadi — käsitsi tuletatud märgi-/nullitestid. Ainult kahekeha + sekulaarne, mitte oskuleeriv.

# text
seg-dcba8d368326 = Nähtavus vaatejoonel (Maa varjamine + kõrgusnurga mask)

# text
seg-2eee9a8f894b = Antipoodil asuv satelliit on varjatud, radiaalselt väljapoole suunatud satelliit on { "90" } kraadi kõrgusel, tangentsiaalne satelliit on horisondil — täpsed käsitsi tuletatud testid.

# text
seg-f251c75eb367 = Nähtavus -> GNSS-i olek -> ajatelg

# text
# c1: >=4
seg-70fbb9f3cc2b = <c1/> nähtavat = nominaalne, 1–3 halvenenud, { "0" } keelatud; Walker-delta generaator; integratsioonitest juhib holdover-i (aja hoidmine ilma välise etalonita) käitust tuletatud ajateljelt.

# text
seg-988d3fedb7f5 = Satelliidikonstellatsiooni kavandamise optimeerija + kattuvusribade (streets-of-coverage) geomeetria

# text
# c1: src/walker.rs
# c2: optimize_walker_design
# c3: {planes × sats × inclination}
# c4: DesignObjective
# c5: coverage_half_angle_rad
# c6: λ = arccos(Re/r·cos ε) − ε
# c7: street_half_width_rad
# c8: cos c = cos λ / cos(π/s)
# c9: λ < π/s ⇒ None
seg-2a636487a4e6 = <c1/>: <c2/> otsib läbi <c3/> ruudustiku ja tagastab ruudu, mis täidab kõige paremini eesmärgi <c4/> (vähim satelliite katvuse sihtmäärani / suurim katvus / vähim halvim PDOP (PDOP: positsiooni täpsuse halvenemise tegur)) — test kinnitab, et valik võrdub sama läbivaatuse sõltumatu jõumeetodil tehtud skaneerimisega, ning läbitöötatud näide kinnitab, et GPS-i (Global Positioning System) Walkeri 24/6/1 kavand katab vähemalt sama hästi kui hõrendatud 18 satelliidiga kavand. Analüütilised <b>kattuvusribade (streets-of-coverage)</b> suletud kujul valemid (<c5/> <c6/>; <c7/> <c8/>, Rider/Beste) on käsitsi kontrollitud õpikugeomeetriaga (GPS { "5" }° maskiga: λ ≈ { "71.16" }°, 4 satelliidi riba poolilaius ≈ { "62.83" }°) ning tuvastavad alatäitumise lünga (<c9/>). Rideri täielik vähima satelliidiarvuga <em>globaalse</em> katvuse lahendaja (õmblustundlik tasandite arv) ei ole veel realiseeritud.

# text
seg-a1c1364cc45a = Täpsuse halvenemise tegur (GDOP/PDOP/HDOP/VDOP/TDOP (GDOP: geomeetriline täpsuse halvenemise tegur; HDOP: horisontaalne täpsuse halvenemise tegur; VDOP: vertikaalne täpsuse halvenemise tegur; TDOP: aja täpsuse halvenemise tegur)) -> positsiooni täpsus

# text
# c1: src/orbit.rs
# c2: Q=(HᵀH)⁻¹
# c3: tests/dop_reference.rs
# c4: tests/fixtures/dop/
seg-a1706d47f895 = <c1/>: <c2/> vaatejoone kavandimaatriksist. <b>Väline oraakel (sõltumatu etalon)</b> (<c3/>): viis DOP-tegurit reprodutseerivad tulemused, mille arvutas <b>gnss_lib_py { "1.0.4" }</b> (Stanford NAV Lab — sõltumatu, eelretsenseeritud GNSS-i teek, mida siin kasutatakse samamoodi nagu ERFA-t (Essential Routines for Fundamental Astronomy) tugisüsteemide jaoks) <b>{ "8" } geomeetria</b> korral, mis ulatuvad hästi tinglikest peaaegu singulaarseteni (DOP sadades), täpsusega <b>{ "1e-6" }</b> suhtelist viga; päritolu ja taasgenereerimine asuvad failis <c4/>. Täiendava suletud kujul kontrollina reprodutseerib korrapärase tetraeedri geomeetria analüütilised DOP-id (PDOP { "1.5" }, TDOP { "0.5" }, GDOP √{ "2.5" }, HDOP √{ "1.5" }, VDOP √{ "0.75" }) täpsusega { "1e-9" }. Positsiooni sigma = PDOP × kasutajaekvivalentne vahemaaviga.

# text
seg-504d5aa92cbc = Positsioonivead = σ_UERE × DOP mootori enda vähimruutude lahendi korral

# text
# c1: src/dop_error_mc.rs
# c2: tests/uere_dop_monte_carlo.rs
# c3: pvt::solve_spp
# c4: tests/fixtures/dop/dop_reference.csv
# c5: orbit::dop
# c6: orbit::dop_cofactor
# c7: src/dop_error_ci.rs
# c8: tests/position_error_dop_ci.rs
seg-fc3443210358 = <c1/>, <c2/>: algväärtusega (seed) Monte Carlo (N = { "20,000" } epohhi geomeetria kohta, σ = { "1.5" } m, ChaCha8 algväärtus (seed) { "36" } + i) funktsioonist <c3/> ühikkaaludega, lahendatud tegelikust asukohast, <b>faili <c4/> { "8" } geomeetria</b> korral (need, mille DOP on gnss_lib_py-ga kooskõlas), võrreldes suurusega σ²·Q, kus Q on <c5/> tuuma enda kovariatsioonitegur (<c6/>, sama aritmeetika). <b>Tolerantsid on eelregistreeritud</b> (commit e50c88d2, enne esimest käitust, vastavalt { "0.36" } geomeetria kavandi märkuse jaotisele { "5.2" }), kõik standardvigade arvuna: ida, põhja, üles ja kella dispersioonid { "5" } % piires; H/V/P RMS { "2.5" } % piires; ida–põhja korrelatsioon { "0.035" } piires; keskmised { "5" } standardvea piires; { "95" } % horisontaalse ellipsi osakaal { "0.95" } ± { "0.0077" } piires. Esimene käitus: kõik { "104" } kontrolli läbitakse (halvim dispersioon { "3.2" } %, RMS { "1.6" } %, korrelatsioon { "0.012" }, keskmine { "2.2" } standardviga, ellips { "0.0039" }). <b>Negatiivsed kontrollid</b> ebaõnnestuvad nõutud viisil: kahekordistatud PDOP ebaõnnestub igal geomeetrial; vead, mis kasvavad kui 1/sin(kõrgusnurk) kaalumata Q suhtes, ebaõnnestuvad dispersioonikontrollis igal geomeetrial, mille madalaim satelliit on alla { "20" }°. <b>Kuidas see seostub ülaltoodud reaga:</b> see rida valideerib nende geomeetriate DOP-i gnss_lib_py vastu; see lisab sammu nendest teguritest meetriteni mootori lahendaja kaudu. <b>Esimene, eraldiseisev kontroll on selle kõrval säilitatud</b> (<c7/>, <c8/>, tehtud enne eelregistreerimist ja nii ka esitatud): neli käsitsi valitud taevast (lage, koondunud, kanjon, pooltaevas; σ { "1" } m) hii-ruut usaldusvahemikega { "1e-6" } koguvea juures { "20" } kontrolli kohta; suhted { "0.987" } kuni { "1.009" } ning selle enda negatiivsed kontrollid ({ "10" } % DOP-viga, 1/sin(kõrgusnurk) vead) ebaõnnestuvad nõutud viisil. <b>Miks MODELLED:</b> väline andmestik puudub; see ei näita, et päris vastuvõtja viga järgib mudelit, ning σ_UERE on sisend.

# text
seg-94bffbd8385b = Mitme konstellatsiooni kättesaadavus

# text
# c1: src/orbit.rs
# c2: [[constellations]]
seg-a40eab03bbbe = <c1/>: täiendavad <c2/> liidetakse nähtavuse/DOP-i jaoks üheks satelliidihulgaks; kombineeritud arvu test kinnitab ühendit.

# text
seg-0b905100d91c = Edastatav ionosfäär (Klobuchar, IS-GPS-200 (IS: Interface Specification)) → L1 kaldviivitus

# text
# c1: src/gnss_sim.rs
# c2: klobuchar_delay_m
# c3: tests/klobuchar_reference.rs
# c4: ionmodel
# c5: src/rtkcmn.c
# c6: src/ionex.rs
# c7: parse_ionex
seg-05e278f04770 = <c1/>: <c2/>, kaheksa koefitsiendiga edastatav ühesageduslik mudel. <b>Väline oraakel (sõltumatu etalon)</b> (<c3/>): kalde-L1 viivitus reprodutseerib <b>RTKLIB-i (avatud lähtekoodiga reaalaja kinemaatilise positsioneerimise teek) <c4/></b> (tomojitakasu/RTKLIB, <c5/> — de facto avatud GNSS-i etalon, lähtekoodist kompileeritud ja sõltumatult käitatud) <b>{ "10" } juhul</b>, mis hõlmavad kõrgusnurka, asimuuti, kohalikku aega ja kahte koefitsientide komplekti (kshana vaikimisi + RTKLIB-i), täpsusega <b>< { "1e-4" } m</b>. IONEX-i (IONosphere map EXchange format) TEC-kaardi (TEC: total electron content) lugeja GIM-failide (global ionosphere map) jaoks on nüüd olemas (<c6/>, <c7/> bilineaarse ruumilise ja ajalise interpolatsiooniga ning kaldkaardistusega, ühiktestitud pakis); selle interpolatsiooni ristkontroll tõelise CODE (Center for Orbit Determination in Europe) GIM-tootega on endiselt järgmine samm. Edastatav mudel ise on väliselt valideeritud.

# text
seg-39e235557ecc = RAIM/ARAIM (ARAIM: advanced receiver autonomous integrity monitoring) tuvastustuum (χ² / mittetsentraalne χ² / normaal) → lävendid ja kordistid

# text
# c1: src/raim.rs
# c2: chi2_quantile
# c3: pbias=√λ
# c4: noncentral_chi2_cdf
# c5: normal_quantile
# c6: tests/raim_reference.rs
# c7: scipy.stats.chi2
# c8: .ncx2
# c9: .norm
# c10: optimize.brentq
# c11: (GᵀG)⁻¹
# c12: tests/araim_reference_vectors.rs
# c13: ARAIM_REFERENCE.md
seg-8906f922b9b9 = <c1/>: hetktõmmise / lahenduse eraldamise / ARAIM-i tuvastuslävi (<c2/>), tuvastamata jäänud sündmuse mittetsentraalsus <c3/> (<c4/>) ning K_fa/K_md/K_V kordistid (<c5/>) arvutatakse kõik sõltuvusteta regulariseeritud mittetäieliku gammafunktsiooni abil. <b>Väline oraakel (sõltumatu etalon)</b> (<c6/>): <b>{ "171" } juhtu</b> reprodutseerivad <b>SciPy { "1.17.0" }</b> (<c7/>/<c8/>/<c9/> + <c10/> — sõltumatu Cephes/Boost realisatsioon, teistsugune algoritm) P_fa / P_md / liiasuse töövahemikes, täpsusega <b>≤ { "1e-6" } suhtelist viga</b>. Tuuma ümbritsev geomeetria (tõus/kovariatsioon avaldisest <c11/>) on gnss_lib_py-ga valideeritud DOP-i tuum. <b>Ulatus:</b> see rida fikseerib <em>statistilise tuuma</em>. ARAIM-i MHSS-i (multiple-hypothesis solution separation) jaotuse kaitsetaseme <em>väärtus</em> on eraldi fikseeritud WG-C (Working Group C) ARAIM-i tehnilise allrühma avaldatud läbitöötatud näite vastu (<c12/>, VPL (vertikaalne kaitsetase) { "18.2926" } m vs { "18.3" } m, HPL (horisontaalne kaitsetase) { "13.4063" } m vs { "13.45" } m, etaloni enda { "0.05" } m tolerantsi piires; vt allolevat standardite märkust ja <a1><c13/></a1>).

# text
seg-b17f1501a267 = SBAS-i (satellite-based augmentation system) kaitsetase (DO-229E lisa J) → horisontaalne / vertikaalne kaitsetase (HPL / VPL)

# text
# c1: src/sbas.rs
# c2: sbas_protection_level
# c3: D=(GᵀWG)⁻¹
# c4: tests/sbas_reference.rs
# c5: zsiki/rtklib_ws
# c6: waasprotlevels()
# c7: rnx2rtkp -ws
# c8: core/filter.c
# c9: Φ⁻¹(1−5e-8)=5.3267
# c10: d_U
seg-abe00b67e4cb = <c1/>: <c2/>, kaalutud vähimruutude (LS: least squares) <c3/> → horisontaalse veaellipsi peatelg + vertikaalne σ, skaleeritud DO-229E K-teguritega. <b>Väline oraakel (sõltumatu etalon)</b> (<c4/>): kshana HPL reprodutseerib <b>RTKLIB-i SBAS-PL-i haru</b> (<c5/> <c6/>, Siki ja Takácsi { "2017" } „DO-229D lisa J“ realisatsioon), mida käitab <c7/> <b>päris EGNOS-i (European Geostationary Navigation Overlay Service) andmetel</b> (GEO (geostatsionaarne orbiit) PRN120 edastatud sõnumid + päris BUTE/Budapesti RINEX (Receiver Independent Exchange Format), 2017-02-19) <b>{ "6" } epohhi</b> korral täpsusega <b>< { "2e-3" } m</b>. Iga satelliidi σ on etaloni enda täielik SBAS-i eelarve (UDRE (user differential range error) + GIVE (grid ionospheric vertical error) ionosfäär + troposfäär + õhusõiduki oma). ESA gLAB { "v6.0.0" } (<c8/>) kompileeriti ja kinnitati kasutavat identset konventsiooni. <b>K_V märkus:</b> mõlemad etalonid ümardavad MOPS-i (minimum operational performance standards) K_V → { "5.33" }; kshana kasutab täpset <c9/> (~{ "0.06" } % väiksem VPL), seega vertikaal on valideeritud K-teguriga vabana <c10/> (= etaloni VPL / { "5.33" }). HPL on sobitatud otse (K_H = { "6.0" } mõlemal poolel).

# text
seg-fd16d642cafd = Tegelik konstellatsiooni geomeetria TLE-dest (rida 2 / Kepleri)

# text
# c1: validated
seg-1311ef1cb4bb = <c1/> (parsimine)

# text
# c1: src/tle.rs
seg-5117debbce89 = <c1/>: parsib rea 2 keskmised Kepleri elemendid (pooltelg keskmisest liikumisest); tuntud ISS-i (International Space Station) elemendikomplekt läbib edasi-tagasi teisenduse õigete elementide ja perioodini. Ainult rea 2 ploki korral on levitamine mootori kahe keha (+ valikuline J2) levitamine <em>keskmistest</em> elementidest — sobib ühise epohhi hetktõmmiseks, kuid ajas triivib SGP4-st (Simplified General Perturbations { "4" }) eemale.

# text
seg-26d22e76e28d = SGP4 / SDP4 (Simplified Deep-space Perturbations { "4" }) levitamine (täielikud TLE-d)

# text
# c1: src/sgp4.rs
# c2: tests/sgp4_verification.rs
seg-1099f1bffa01 = <c1/>: täielik Maa-lähedane SGP4 + kauge kosmose SDP4 (Kuu ja Päikese sekulaarne/perioodiline + { "12" } h / { "24" } h geopotentsiaali resonants). Valideeritud failis <c2/> ametlike AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 („Revisiting Spacetrack Report #3“) vektorite vastu — kõik { "666" } etalonolekut (Maa-lähedased, kauge kosmose, resonantsed, veakoodiga juhud) langevad kokku halvima positsioonivea täpsusega ≈ { "4.1" } mm. Täielik kaherealine komplekt (rida { "1" } + rida { "2" }) levitatakse SGP4-ga; ainult rida 2 jääb Kepleri levitamiseks; neid kahte võib segada. Tugisüsteem on TEME (true equator, mean equinox), mida kasutatakse järjepidevalt kasutaja ja satelliitide jaoks (TEME→ECEF (ECEF: Earth-centred, Earth-fixed) teisendust ei ole — piisav kättesaadavuse/DOP-i geomeetria jaoks).

# text
seg-c8fc6a49d249 = IAU (International Astronomical Union) 2000A / 2000B nutatsioon + TEME→GCRS (GCRS: Geocentric Celestial Reference System) teisendus

# text
# c1: src/nutation.rs
# c2: nutation_iau2000a
# c3: nutation_iau2000b
# c4: eraNut00a
# c5: eraNut00b
# c6: nut00a
# c7: tools/gen_nut00a.py
# c8: nutation_iau2000a_data.rs
# c9: iauNumat
# c10: teme_to_gcrs
# c11: numat
# c12: tests/frame_reference_vectors.rs
seg-b31c49596100 = <c1/>: <b>täielik IAU 2000A</b> rida ({ "678" } Kuu-Päikese + { "687" } planeetide liiget, <c2/>) ja 77-liikmeline 2000B kärbe (<c3/>) on kumbki valideeritud <b>bitt-bitis</b> avaldatud SOFA/ERFA (SOFA: Standards of Fundamental Astronomy) etalonvektorite vastu hetkel JD_TT { "2453736.5" } — <c4/> annab Δψ = −{ "0.9630909107115518e-5" }, Δε = { "0.4063239174001679e-4" }; <c5/> annab Δψ = −{ "0.9632552291148363e-5" }, Δε = { "0.4063197106621160e-4" } — mõlemad täpsusega <b>{ "1e-13" } rad</b>. 2000A tabel on masinaga genereeritud ERFA <c6/> lähtekoodist skriptiga <c7/> (reprodutseerib sisseviidud <c8/> bitt-bitis). Nutatsioonimaatriks (<c9/>), pööripäevade võrrand ja täielik TEME→TOD→MOD→GCRS (TOD: true of date; MOD: mean of date) ahel (<c10/>, Vallado AIAA-2006-6980) on testitud õige pöörde / edasi-tagasi teisenduse / pretsessiooni-pluss-nutatsiooni omaduste suhtes, nutatsioonimaatriks ERFA <c11/> vastu element elemendi haaval täpsusega { "1e-14" } ning kogu TEME→GCRS ahel Vallado avaldatud TEME→GCRF näite (AIAA 2006-6753, 2004-04-06) vastu täpsusega <b>{ "0.11" } m</b> (<c12/>); kuni selle otsast-otsani kontrolli lisamiseni oli nutatsioonimaatriksis Δψ märk vale — { "2" }·Δψ (umbes { "25" }″) pööre, mida omaduste testid ei näinud (vt CHANGELOG, Unreleased, Fixed); 2000A vs 2000B on kooskõlas täpsusega < { "1" } mas, nagu nõutud. Ahel põhineb pööripäeval/GMST-l (GMST: Greenwich mean sidereal time); pööripäevast sõltumatu CIO (X,Y,s) teisendus ja selle sõltumatu ANISE/SPICE (ANISE: Attitude, Navigation, Instrument, Spacecraft, Ephemeris — puhtalt Rustis kirjutatud planeedigeomeetria tööriistakomplekt; SPICE: Spacecraft, Planet, Instrument, C-matrix, Events) arvuline ristkontroll (≤ { "3.6" } m GNSS-i orbiidil, selgelt alla < { "10" } m sihtmärgi) on allolevas CIO reas.

# text
seg-0be3c40cc81a = IGRF-14 (IGRF: International Geomagnetic Reference Field) geomagnetilise põhivälja mudel

# text
# c1: src/igrf.rs
# c2: igrf14coeffs.txt
# c3: tools/gen_igrf.py
# c4: igrf_data.rs
# c5: (B_r,B_θ,B_φ)
# c6: < 0.02°
# c7: synthesis_matches_the_official_bgs_igrf14_values_at_2025
seg-9dbb3b1b18a1 = <c1/>: IAGA (International Association of Geomagnetism and Aeronomy) Schmidti normaliseeritud sfääriliste harmooniliste väli (aste/järk { "13" }, { "2025.0" } + sekulaarne muutus; koefitsiendid masinaga genereeritud ametlikust failist <c2/> skriptiga <c3/>, reprodutseerides faili <c4/> bitt-bitis). Valideeritud viiel sõltumatul rindel: ({ "1" }) täpsed koefitsientide valikkontrollid IAGA faili vastu (g₁⁰=−{ "29350.0" }, g₁¹=−{ "1410.3" }, h₁¹={ "4545.5" } nT); ({ "2" }) 1. astme süntees reprodutseerib <b>täpse suletud kujul kaldus dipooli</b> välja <c5/> täpsusega { "1e-6" }; ({ "3" }) <b>täielik 13. astme analüütiline väli võrdub skalaarpotentsiaali −∇V-ga</b> (lõplike vahede meetodil, täpsusega { "1e-4" }) — see katsetab Legendre'i tuletisi ja 1/sinθ liiget otsast otsani; ({ "4" }) dipooli telg reprodutseerib tuntud <b>geomagnetilise põhjapooluse</b> (~{ "80.7" }°N, −{ "72.7" }°E) ja <b>dipooli tugevuse</b> (~{ "29.7" } µT) ning globaalne väli jääb füüsikalisse { "22" }–{ "67" } µT vahemikku õige poolkera kaldenurga märgiga; ja ({ "5" }) <b>väline oraakel (sõltumatu etalon)</b> — täielik süntees reprodutseerib ametliku <b>British Geological Survey IGRF-14 veebiteenuse</b> väärtused hetkel { "2025.0" } (geodeetiline, WGS-84 (WGS: World Geodetic System) kõrgus) täpsusega <b>< { "2" } nT</b> komponentidel X/Y/Z/F ja <c6/> komponentidel D/I neljas punktis, sealhulgas { "400" } km kõrgusel (<c7/>).

# text
seg-c1027d5ffc44 = CIO-põhine IAU 2006/2000A GCRS↔ITRS (ITRS: International Terrestrial Reference System) teisendus

# text
# c1: src/cio.rs
# c2: (X, Y)
# c3: s
# c4: eraXys06a
# c5: eraC2ixys
# c6: eraEra00(2400000.5, 54388.0)
# c7: s
# c8: s06.c
# c9: tools/gen_s06.py
# c10: cio_s06_data.rs
# c11: gcrs_to_itrs_matrix
# c12: eraC2tcio
# c13: xval/anise-frames/
# c14: gcrs_to_itrs_matrix
# c15: earth_latest_high_prec.bpc
# c16: finals2000A
# c17: kshana
seg-aad81285e8cf = <c1/>: pööripäevast sõltumatu taevase-maapealse süsteemi ahel. CIP (Celestial Intermediate Pole) koordinaadid <c2/> ja 66-liikmeline CIO-lokaatori <c3/> rida on valideeritud <b>bitt-bitis</b> avaldatud SOFA/ERFA <c4/> vektori vastu hetkel JD_TT { "2453736.5" } — X={ "0.5791308482835292617e-3" } ({ "1e-14" }), Y={ "0.4020580099454020310e-4" } ({ "1e-15" }), s=-0.1220032294164579896e-7 ({ "1e-18" }); GCRS→CIRS (CIRS: Celestial Intermediate Reference System) maatriks <c5/> vastu (kõik üheksa elementi täpsusega { "1e-12" }); Maa pöördenurk (ERA) vastu <c6/> = { "0.4022837240028158102" } ({ "1e-12" }). Tabel <c7/> on masinaga genereeritud ERFA <c8/> etalonist skriptiga <c9/> (reprodutseerib faili <c10/> bitt-bitis). Täielik <c11/> (CIO <c12/> = poolusliikumine · ERA · GCRS→CIRS) on testitud õige pöörde ja edasi-tagasi teisenduse suhtes ning näidatud kooskõlas olevat vana pööripäeva/GMST-1982 TEME teisendusega { "1" } m piires { "7 000" } km raadiusel (konventsioonid erinevad seal umbes { "5" } cm). <b>Sõltumatu kolmanda osapoole ristkontroll (<c13/>):</b> sama <c14/> võrreldakse <b>ANISE-ga</b> (puhtalt Rustis NAIF/SPICE (NAIF: Navigation and Ancillary Information Facility) uusrealisatsioon), mis pöörab GCRF→ITRF93 (GCRF: Geocentric Celestial Reference Frame; ITRF93: International Terrestrial Reference Frame { "1993" }) JPL-i (Jet Propulsion Laboratory) failist <c15/>, kusjuures <b>mõlemale poolele antakse identsed IERS-i (International Earth Rotation and Reference Systems Service) <c16/> Maa orientatsiooni parameetrid</b>, kaheksal kvartaalsel epohhil { "2020" }–{ "2023" }. Need kaks sõltumatut tugisüsteemi realisatsiooni on kooskõlas <b>suurima suhtelise pöördega { "0.028" }″ — ≤ { "0.86" } m maapinnal, ≤ { "0.93" } m LEO-l (low Earth orbit), ≤ { "3.6" } m GNSS-i orbiidil</b> (keskmine nurk { "0.023" }″). See on ROADMAP-i „< { "10" } m“ tugisüsteemi ristkontroll, <b>täidetud</b>; jääk on oodatav ITRF93 vs IERS-2010-CIO mudeli/datumi erinevus, mitte viga (bitt-bitis ankur jääb ülaltoodud SOFA/ERFA vektoriteks). ANISE on MPL-2.0 (MPL: Mozilla Public License) / edition-2024 pakett, seega asub kontroll eraldiseisvas, töökohast välja jäetud alampakis, mis ei puutu kunagi avaldatud <c17/> sõltuvusgraafi ega ühtegi vaikimisi CI-värava.

# text
seg-fa5889f379d2 = SP3 (Standard Product { "3" }, täpse orbiidi vorming) ekspordi edasi-tagasi teisendus (konstellatsioon → SP3-c → uuesti parsimine)

# text
# c1: tests/sp3_export_roundtrip.rs
# c2: gps-ops
# c3: Sp3File::from_propagators
# c4: to_sp3_string
# c5: parse_sp3
# c6: --export-sp3
seg-cd53434eba3a = <c1/>: päris Celestraki <c2/> hetktõmmis ({ "30" } GPS-i satelliiti) levitatakse SGP4-ga, eksporditakse SP3-c-sse (<c3/> → <c4/>), parsitakse uuesti (<c5/>) ning taastatud ECEF-i asukohti võrreldakse SGP4 tõega igal epohhil { "24" } h jooksul — halvim jääk <b>< { "0.5" } m</b> (kirjutaja millimeetriline serialiseerimine; verstaposti { "10" } m TLE-klassi (TLE: two-line element set) tolerants on täidetud suure varuga). Kaetud on ka CLI (command-line interface) <c6/> tee: kaasasolev orbiidi stsenaarium eksportib uuesti parsitava 30 satelliidiga SP3, ning mitteorbiidi stsenaarium lükatakse tagasi.

# text
seg-fa5ee52e59aa = Tegelik GPS-i konstellatsiooni geomeetria TLE-dest (SGP4 → ECEF)

# text
# c1: tests/igs_real_data.rs
# c2: gps-ops
# c3: tests/fixtures/celestrak/NOTICE
seg-1329a53ca94c = <c1/>: ehtne <b>Celestraki <c2/> hetktõmmis</b> (2021-07-28, { "30" } töötavat GPS-i satelliiti; päritolu failis <c3/>) parsitakse ning iga satelliit levitatakse valideeritud SGP4 tuuma kaudu ühise hetkeni, pööratuna TEME→ECEF. Kontrollitakse, et kogu konstellatsioon langeb GPS-i MEO (medium Earth orbit) kihile { "1" }% piires ning et keskmise laiuskraadi lagedalt kohalt annab tegelik kõikide nähtavate (üheksa satelliiti) vaade PDOP-i { "1.64" }, kusjuures vertikaalne halvenemine ületab horisontaalset (nagu maapealse kasutaja puhul peabki). See katsetab SGP4-d tõelisel konstellatsioonil, SP3 (täpse) ja RINEX-i (edastatava) tegelike andmete teede kõrval.

# text
seg-a1b7d74bbe02 = SGP4 keskmiste elementide Walkeri generaator

# text
# c1: src/walker.rs
seg-01f1635b75e4 = <c1/>: kavandatud Walker-delta muster väljastatakse SGP4 keskmiste elementidena (Kozai keskmine liikumine valitud nii, et SGP4 pooltelg langeb sihtkihile) ja levitatakse valideeritud tuuma kaudu. Testid: 24 satelliidiga GPS-i-laadne Walker asub MEO kihil { "1" }% piires, tasandid on RAAN-is (right ascension of the ascending node) orbiidi normaalidest taastatuna paigutatud täpselt { "90" }° vahedega ning keskmine liikumine reprodutseerib GPS-i kihi ~{ "718" } min perioodi.

# text
seg-6e8c472ec9fa = Konstellatsiooni PDOP-i pühkimine + katvuse/korduvkülastuse FoM-id (figures of merit)

# text
# c1: validated
seg-dcdbf9c78ca5 = <c1/> (monotoonsus)

# text
# c1: src/walker.rs
# c2: pdop_sweep
# c3: {planes × sats × inclination}
# c4: coverage_revisit
seg-5a70f090db45 = <c1/>: <c2/> tabuleerib katvuse ning mediaan-/halvima PDOP-i <c3/> ruudustikul; <c4/> annab katvuse osakaalu ja korduvkülastuse vahed maapealses punktis. Valideeritud füüsikaliste monotoonsustega, mida kavandi kompromiss peab täitma: satelliitide lisamine ei vähenda kunagi katvust ja vähendab rangelt mediaan-PDOP-i (täielik 24 satelliidiga kavand katab pidevalt PDOP-iga ~{ "1.7" }) ning hõrendatud konstellatsiooni tihendamine vähendab rangelt halvimat korduvkülastuse vahet. Keskmine korduvkülastuse vahe ei ületa kunagi maksimumi. Need on geomeetria kompromissitabelid, mitte sertifitseeritud sidelingi/katvuse eelarve.

# text
# c1: orbit-gnss-challenged.toml
seg-9f0747d71ecc = Aus raamistus: see on deterministlik geomeetriakiht (ringorbiidid, sfääriline Maa keskmise raadiusega { "6371" } km, puhas vaatejoon). See määrab <em>kättesaadavuse</em> ja <em>geomeetrilise</em> positsioonitäpsuse (täpsuse halvenemise tegur × esinduslik vahemaavea eelarve) tegelikust geomeetriast, mitte täpse efemeriidi navigatsioonilahendi. Etalon <c1/> paigutab kosmoselaeva GNSS-i kihi sisse: see hoiab lahendit vaid ~{ "59" }% ööpäevast, kvantkell hoiab { "5" } ns ajalahendit läbi kõigi lünkade (kättesaadavus { "1.0" }), samal ajal kui kiibi-skaalaga kell hoiab ~{ "0.73" }.

# text
seg-e2c433c35ba8 = Numbriline (Cowelli) levitaja ja jõumudel

# text
# c1: src/propagator.rs
# c2: src/forces.rs
# c3: src/integrator.rs
# c4: tests/numerical_cowell_propagator_reference.rs
seg-20ace4e0a710 = Numbriline levitaja (<c1/>) integreerib hierarhilise jõumudeli (<c2/>) adaptiivsete integraatoritega (<c3/>). Iga allolev liige on valideeritud analüütilise tõe või käsitsi tuletatud suletud kujul valemi vastu; häired on <b>vaikimisi välja lülitatud</b>, seega väljastatud etalontulemused jäävad puutumata. Komposiitmudelit kontrollitakse ristiga ka teise tööriista vastu: <c4/> käitab { "11" } LEO ja GTO (geostationary transfer orbit) juhtu, { "275" } tunnipõhist epohhi, Orekit { "12.2" } DormandPrince853 levitaja vastu ning konservatiivsed tasemed (kaks keha → J2–J6 → Päike/Kuu → kuulikujuline SRP) on kooskõlas halvimaga { "0.08" } m { "24" } h jooksul (VALIDATED maatriksis); õhutakistuse tase on vaid iseloomustatud ({ "333" } m) ja jääb MODELLED-iks.

# text
seg-ec74e57ff801 = Cowelli levitaja vs analüütiline Kepleri tõde

# text
# c1: src/propagator.rs
# c2: j2_secular_rates
# c3: solve_kepler_checked
# c4: Err
# c5: solve_kepler_robust
# c6: src/kepler.rs
# c7: tests/kepler_mpmath_oracle.rs
seg-8d773778ff0e = <c1/>: häirimata (kahe keha) orbiit reprodutseerib <b>täpset universaalmuutujate Kepleri lahendit alla meetri täpsusega { "24" } h LEO orbiidil</b> (rangem värav kui „vs numbriline etalon < { "10" } m“); erienergia ja nurkmoment säilivad ~{ "1e-9" } suhtelise täpsusega; J2 sõlme regressioon reprodutseerib suletud kujul <c2/> esimese järgu teooria täpsusega ({ "2" } % piires, O(J2²) jääk). <c3/> tagastab <c4/> vaikselt vale vastuse asemel, kui Newtoni meetod ei koondu (periheeli lähedal e = { "0.999" }). Töökindel <c5/> (Markley { "1995" } algväärtus, <c6/>) koondub seal ja kogu vahemikus { "0" } ≤ e ≤ { "0.999999" }, { "0.9" } ε·|E| piires 50-kohaliste mpmath-juurte suhtes (<c7/>).

# text
seg-549d15780f79 = Adaptiivsed integraatorid (RK4 (neljanda järgu Runge–Kutta) sammu kahekordistamine + Dormand–Prince RK5({ "4" }) manustatud paar, DP5({ "4" }) allpool)

# text
# c1: src/integrator.rs
# c2: y' = y → e
# c3: propagate_dopri
# c4: integrate_dop853
# c5: tests/dop853_scipy_oracle.rs
seg-1fcc7553c627 = <c1/>: RK4 integreerib <c2/> täpsusega < { "1e-9" }, näitab ~{ "16" }× vea langust iga poolitatud sammu kohta (4. järgu koondumine) ning säilitab harmoonilise ostsillaatori ühe perioodi jooksul. DP5({ "4" }) manustatud veahinnang on <b>O(h⁵)</b> (sammu poolitamine vähendab seda ~{ "32" }×), integreerib ostsillaatorit { "50" } perioodi, säilitades energia täpsusega < { "1e-6" }, ning jõuab sama tolerantsi juures samasse lõpp-punkti <b>vähemate funktsioonihindamistega</b> kui sammu kahekordistamine; <c3/> läbib sama alla meetri Kepleri värava ja on RK4 teega kooskõlas täpsusega < { "1" } m J2..J6 orbiidil. <b>DOP853</b> (<c4/>): Hairer'i { "8" }({ "5,3" }) paar tihe väljundiga reprodutseerib SciPy { "1.18.1" } DOP853 samm-sammult (üks samm { "5.6e-15" } piires; identsed sammude arvud e = { "0.7" } ja Arenstorfi käitustel, üks vastuvõtmise/tagasilükkamise erinevus { "501" } sammus LEO käitusel; lõppolekud { "1.6e-12" } piires) ja ühtib täpse Kepleri lahendiga sama hästi kui SciPy (<c5/>).

# text
seg-345ae1eb05ec = J2–J6 tsonaalharmooniliste väli

# text
# c1: src/forces.rs
# c2: zonal_accel
# c3: j2_accel
# c4: [J2]
# c5: J3
# c6: J2
# c7: J4..J6
# c8: z → −z
seg-a88e67186e69 = <c1/>: <c2/> on kontrollitud kolmel viisil — see <b>taandub 666 vektoriga valideeritud <c3/>-ks masinatäpsuseni</b>, kui piirata <c4/>-ga; see <b>ühtib oma tsonaalpotentsiaali numbrilise gradiendiga</b> kogu J2..J6 välja ulatuses (konservatiivse välja kuldstandard); ning paaritu <c5/> vs paaris <c6/>/<c7/> liikmed näitavad iseloomulikku põhja–lõuna (anti)sümmeetriat teisenduse <c8/> all. Levitatud J2..J6 orbiit säilitab koguenergia ~{ "1e-8" } täpsusega ööpäeva jooksul.

# text
seg-5536986d9c8f = Kolmanda keha (Päike ja Kuu) gravitatsioon

# text
# c1: src/forces.rs
# c2: src/ephem.rs
# c3: third_body_accel
# c4: third_body_accel
seg-04388d03e696 = <c1/> + <c2/>: <c3/> <b>ühtib oma häiritava potentsiaali täpse gradiendiga</b>, kaob geotsentris ja tabab õpikulisi LEO suurusjärke (~{ "5e-7" } m/s² Päike, ~{ "1.1e-6" } m/s² Kuu). Madala täpsusega Montenbruck–Gilli Päikese efemeriid tabab käsitsi tuletatud J2000 ankruid (periheeli kaugus ≈ { "1.471e11" } m, ~−{ "23" }° pööripäeva deklinatsioon, ~{ "1" }°/ööpäevas liikumine); Kuu efemeriid jääb perigee/apogee ümbrisesse, taastab ~{ "384 400" } km keskmise kauguse, ei ületa kunagi { "5.3" }° kaldet ning naaseb ühe sideerilise kuu järel { "1" }° piiresse. Epohhiga juhitud parema poole (RHS (right-hand side)) ühendus on <b>bitt-bitis täpne</b> (RHS-liige võrdub <c4/> valitud asukohas hetkedel t = { "0" } ja t = { "1" } ööpäev) ning veerandaasta epohhinihe annab erineva trajektoori.

# text
seg-9c8756f9d534 = Päikesekiirguse rõhk (SRP) + koonuseline vari

# text
# c1: src/forces.rs
# c2: srp_accel
# c3: ν·P☉·cᵣ·(A/m)·(AU/d)²·d̂
# c4: conical_shadow
# c5: ν = 1
# c6: ν = 0
# c7: [b−a, b+a]
seg-e6110e015204 = <c1/>: <c2/> (kuulikujuline <c3/>) on täies päikesevalguses <b>bitt-identne</b> suletud kujul valemiga, fikseerib <b>1 AU (AU: astronoomiline ühik) kiirgusrõhu ≈ { "4.5398e-6" } N/m²</b>, asub ~{ "1.36e-7" } m/s² LEO vahemikus Päikesest eemale surudes, neljandikustub, kui Päikese kaugus kahekordistub (pöördruut), ning on umbra sügavuses <b>täpselt null</b>. <c4/> annab <c5/> täies päikesevalguses ja <c6/> täielikus umbras (täpne), sujuva monotoonse poolvarju, mis tõuseb { "0" } → { "1" } üle <c7/> vööndi ja <b>ulatub umbra silindrist kaugemale</b>.

# text
seg-17b48db4038b = Atmosfäärihõõrdumine (esimene kiirusest sõltuv liige)

# text
# c1: src/forces.rs
# c2: atmospheric_density
# c3: drag_accel
seg-4e6c2d0fff55 = <c1/>: <c2/> (Vallado tabel 8-4 tükiti eksponentsiaalne) <b>ankurdub merepinnal väärtusel { "1.225" } kg/m³</b>, piirab pinnast allapoole, väheneb monotoonselt läbi LEO, asub { "400" } km kõrgusel ~{ "1e-12" } kg/m³ vahemikus füüsikalise taastatud ~{ "58" } km skaalakõrgusega; <c3/> töötab vastu kaaspöörleva suhtelise kiirusega ~{ "2e-6" } m/s² LEO suurusjärgus. Iseloomulik kontroll: { "300" } km orbiit kaotab erienergiat <b>monotoonselt</b> ja selle pooltelg väheneb piiratud ~km/ööpäevas, samal ajal kui vaakumi lähtetase säilitab energia täpsusega < { "1e-9" }.

# text
seg-133eed361425 = Post-Newtoni (Schwarzschildi) relativistlik parandus

# text
# c1: src/forces.rs
# c2: relativistic_accel
# c3: β = γ = 1
# c4: a = (μ/c²r³)·{[4μ/r − v²]·r + 4(r·v)·v}
# c5: 3μ²/(c²r³)·r̂
# c6: ≈1.9e-9
# c7: μ(4μ + 3v²r)/(c²r³)
seg-c8e26480f148 = <c1/>: <c2/> (IERS <c3/> kuju <c4/>) taandub ringorbiidil suletud kujul valemiks <c5/> (radiaalne, <b>väljapoole</b>, teljest väljas olevad komponendid täpselt null), näitab õpikulist <b><c6/> LEO suhet kahe keha mudelisse</b>, ühtib käsitsi lihtsustatud radiaalkiiruse kujuga <c7/> täpsusega < { "1e-12" } ning levitajas <b>häirib orbiiti, hoides samal ajal pooltelge alla meetri ööpäevas</b> — hõõrdumise kahanemise konservatiivne vastand.

# text
# c1: ForceModel
# c2: src/gravity_sh.rs
# c3: src/tides.rs
# c4: src/precise_od.rs
# c5: ForceModel
# c6: propagator::Geopotential
# c7: HolmesFeatherstoneAttractionModel
# c8: tests/cowell_tesseral_orekit_oracle.rs
# c9: acceleration
# c10: acceleration_hf
# c11: from_gfc_file
# c12: scripts/fetch_egm2008.sh
# c13: acceleration_hf
# c14: xval/high-degree-gravity/
# c15: xval/cowell-tesseral-200-orekit/
# c16: src/nrlmsise00.rs
# c17: tests/nrlmsise00_reference.rs
# c18: forces::DensityModel
# c19: ForceModel::drag_density
# c20: ForceModel::with_ephemeris
# c21: ForceModel::srp_shadow
# c22: tests/srp_oblate_shadow_orekit_oracle.rs
# c23: tests/drag_tier_orekit_oracle.rs
seg-d39e75019595 = Aus ulatus: väljastatud <c1/> vaikeseaded integreerivad tsonaalvälja. Kõrge astmega EGM2008 <b>tesseraalväli</b> (<c2/>, aste/järk { "70" }), tahke/ookeani/atmosfääri <b>looded</b> (<c3/>) ja <b>Lense–Thirringi</b> tugisüsteemi kaasaviimise liige on nüüd realiseeritud ning komponeeritud täpse efemeriidi sobitamise jõumudelisse (<c4/> — vt allpool). Tesseraalväli on ka Cowelli <c5/> (<c6/>, vaikimisi väljas) vabatahtlik liige, valideeritud Orekit { "12.2" } <c7/> vastu astmeni/järguni { "70" } ({ "6" } juhtu { "24" } h jooksul, halvim |Δr| { "0.036" } m; <c8/>). Välja hindajaid on kaks: ajalooline <c9/> (sfäärilised osatuletised; kehtib astmeni ~{ "180" } pooluste eest eemal; väljundid fikseeritud) ja <c10/> (Holmes–Featherstone { "2002" } modifitseeritud edasisuunaline veerg, gradient ilma 1/cos φ-ta; kehtib astmeni { "2190" } igal laiuskraadil). EGM2008 kuni { "2190" } laaditakse käitusajal (<c11/>, <c12/>, ei ole kaasas). <c13/> on Orekit { "12.2" }-ga kooskõlas täpsusega { "7.3e-17" } m/s² kaheksas punktis kuni astmeni { "2190" }; see jääb MODELLED-iks, sest pyshtools ei täitnud eelregistreeritud pooluse-lähedast lävi (mpmathi kontroll paigutab vea pyshtoolsi; <c14/>). { "24" } h { "200" }×{ "200" } orbiit on Orekitiga kooskõlas täpsusega { "0.13" } m, kuid selle eelregistreeritud astme-70 tundlikkuse kontroll jäi täitmata ({ "0.73" } m < { "1" } m), mistõttu astmed { "71" }–{ "200" } on orbiidil iseloomustatud, mitte valideeritud (<c15/>). NRLMSISE-00 (NRLMSISE: Naval Research Laboratory Mass Spectrometer and Incoherent Scatter Radar Extended atmosphere model) termosfääri tihedus on porditud (<c16/>: bitt-identne avalikus omandis oleva C-pordiga { "720" } punktis, pymsisega suhtelise täpsusega { "1.9e-6" }, kõik { "17" } avaldatud testjuhtu reprodutseeritud; <c17/>) ja on vabatahtlik õhutakistuse tiheduse tase (<c18/>, <c19/>; vaikimisi jääb staatiline Vallado mudel). See valideerib porti, mitte mudeli täpsust mõõdetud tiheduse suhtes. DE440 (DE: Development Ephemeris) Päike ja Kuu on vabatahtlik efemeriidi tase (<c20/>). WGS-84 lapiku Maa SRP vari on vabatahtlik (<c21/>), kooskõlas Orekit { "12.2" } valgustussuhtega { "7.4e-9" } piires { "2400" } geomeetria korral (<c22/>); selle servatumenduse variandil puudub väline sõltumatu etalon (MODELLED). NRLMSISE-00 õhutakistuse tase on kooskõlas Orekit { "12.2" } enda NRLMSISE-00 õhutakistusega { "24" } h jooksul täpsusega { "0.03" } m kuni { "142" } km õhutakistuse nihke korral (<c23/>, VALIDATED ühiste konventsioonide all). GMAT-i (General Mission Analysis Tool) ristkontroll jääb järgmiseks sammuks.

# text
# c1: src/tides.rs
seg-46d06796e0e4 = Geopotentsiaali looded (<c1/>)

# text
seg-81b18c4caad3 = Ajas muutuvad parandused ΔC̄_nm, ΔS̄_nm Stokesi koefitsientidele (IERS-i konventsioonid { "2010" }, peatükk { "6" }), valideeritud konventsioonide enda avaldatud arvude vastu — mitte teise tööriista vastu.

# text
seg-78dc5baf4d9d = Panus

# text
seg-7c6c910bbf89 = Tahke Maa tõus (IERS-i valem { "6.6" } / 6.8b / { "6.14" })

# text
# c1: tests/tides_iers.rs
seg-ac1dbcc895f0 = <c1/>: alaline (nullsagedusega) tõus ΔC̄₂₀ jääb { "1" } % piiresse IERS-i avaldatud väärtusest −{ "4.1736" }×{ "10" }⁻⁹ (anelastsed Love'i arvud); <b>2. sammu K1 läbitöötatud näide reprodutseeritakse bitt-bitis</b> (sin/cos amplituudid { "470.9" } / −{ "30.2" } ×{ "10" }⁻¹² täpsusega { "0.1" }×{ "10" }⁻¹²); normaliseeritud Legendre'i tee on fikseeritud rekursioonist sõltumatute suletud kujul käsitsi väärtustega.

# text
seg-f2e2c5334721 = Ookeani tõus (IERS-i valem { "6.15" }, FES2004 (Finite Element Solution { "2004" } tõusuatlas), { "8" } komponenti)

# text
# c1: tools/gen_fes2004.py
# c2: src/fes2004_data.rs
seg-0369f153806f = Kaasatud FES2004 alamhulk (<c1/> → <c2/>, Doodsoni→kordaja parsimine) reprodutseerib allika M2 ({ "2,2" }) koefitsiendid täpselt; K1 Doodsoni faas võrdub θ_g + π; 2. astme sektoriaalne suurus on füüsikaline ja suurusjärgu võrra väiksem kui tahke Maa tõus.

# text
seg-52a19a291a41 = Atmosfääri S2 õhutõus (Ray { "2001" }, NASA (National Aeronautics and Space Administration) GSFC (Goddard Space Flight Center))

# text
seg-86b3d3a39bc7 = Kaasatud Ray harmoonilised teisendatakse pinnakoormuse seose kaudu (valem { "6.21" }) tipp-ΔC̄₂₂ ≈ { "4" }×{ "10" }⁻¹¹ (~{ "10" } % ookeani M2 liikmest). Aus märkus: <b>õhutõusu jaoks puudub avaldatud geopotentsiaali koefitsientide sõltumatu etalon</b>, seega on see valideeritud allika terviklikkuse + suuruse kaudu, mis on nõrgem lävi kui tahke Maa/ookeani tõusude puhul.

# text
# c1: src/maneuver.rs
seg-63ac45ba51dc = Manöövrid ja trajektoori kavandamine (<c1/>)

# text
seg-a2ff4b0619d4 = Impulsiivne ΔV + kovariatsiooni levitamine

# text
seg-12f469864d28 = Kiiruse katkevus edasi kantud { "6" }×{ "6" } kovariatsiooniga (deterministlik põlemine ⇒ ühik-STM (state-transition matrix); täitmisvea kovariatsioon pöördub põlemise tugisüsteemist — ECI (Earth-centred inertial) või LVLH (local vertical, local horizontal) — kiiruseplokki).

# text
seg-f3f0e4a7ec05 = Lõpliku põlemise integreerimine vs Tsiolkovski

# text
seg-f7b35b7acdba = Konstantse tõukejõuga integreerimine põlemiskaare ulatuses (mass olekuna), mille saavutatud ΔV ühtib suletud kujul <b>Tsiolkovski</b> raketivõrrandiga <b>paremini kui { "0.01" } %</b>.

# text
seg-46ae334a0604 = Lamberti lahendaja (Izzo { "2015" }) edasi-tagasi teisendus

# text
# c1: r1
# c2: r2
# c3: v1
# c4: v2
# c5: r2
seg-3e2b483cd1b7 = Ühe tiiru Lamberti väljund (<c1/>, <c2/>, lennuaeg ⇒ <c3/>, <c4/>) on <b>teisendatud edasi-tagasi läbi täpse universaalmuutujate Kepleri levitaja</b> — see peab maanduma tagasi väärtusele <c5/>.

# text
seg-04d69337acb3 = Porkchop-pühkimine vs Hohmanni põhi

# text
seg-fb5298b7983c = Stardi × saabumise C3 / saabumis-V∞ ruudustiku miinimumi kontrollitakse kahe samatasandilise ringorbiidi <b>analüütilise Hohmanni siirde C3 põhja</b> vastu.

# text
seg-bf2eb36e3eb6 = Lamberti lahendaja vs sõltumatu teek

# text
# c1: tests/lambert_reference.rs
# c2: izzo2015
seg-40511ea76e12 = <c1/>: { "13" } ühe tiiru siiret LEO-st GEO-ni ja heliotsentriliseni, päri- ja vastassuunas, lamberthub { "1.0.0" } <c2/> vastu; halvim piirkiiruse erinevus { "7e-12" } m/s.

# text
seg-164d7ea14d4e = Aus ulatus: trajektoori optimeerijat ei ole, mitme tiiru Lamberti harusid ei ole ning heliotsentriline mudel on sünteetiline samatasandiline ringmudel (planeetide DE efemeriidi ei ole, seega GMAT-i Maa–Marsi C3 ristkontrolli ei ole tehtud).

# text
# c1: src/orbit_determination.rs
# c2: src/batch_ls.rs
seg-9d2d78ad22c4 = Orbiidi määramine (OD) (<c1/>, <c2/>)

# text
seg-95d5ac7f6c29 = Gauss–Newtoni paketikorrektor

# text
# c1: gauss_newton
# c2: a·exp(b·t)
seg-3fe29c4621b2 = Üldine <c1/> lahendaja jõuab lineaarsel sobitusel täpse kaalutud vähimruutude lahendini, taastab tegelikud parameetrid mittelineaarsel <c2/> sobitusel ning lahendab müravabadest vahemaadest 3-D vahemaa-multilateratsiooni.

# text
seg-b31d1ffa99b1 = Paketi orbiidi määramine vahemaadest

# text
# c1: determine_orbit_batch
# c2: [r, v]
seg-0b37139dffa9 = <c1/> taastab <c2/> maajaama vahemaajälgimisest (levitatud kahe keha + J2 jõumudelil) <b>alla meetri / mm·s⁻¹ müravabadest vahemaadest</b> ja <b>~{ "2" } m täpsusega sobitusjärgse jäägiga { "5" } m mürapõhja juures</b> — järjepideva vähimruutude sobituse tunnus.

# text
seg-fb29199bf8bd = Järjestikune (unscented-filtri) OD

# text
# c1: determine_orbit_sequential
seg-3c1f33052d48 = <c1/> taastab oleku rekursiivselt kümnete meetrite täpsusega samal dünaamikal ja vahemaamudelil.

# text
seg-7a636cc9eef0 = Paketi ja järjestikune OD vs sõltumatu hindaja

# text
# c1: tests/batch_sequential_orbit_determination_reference.rs
seg-68bf6e73c582 = <c1/>: { "8" } stsenaariumi ({ "6" } müravaba LEO/MEO/ekstsentrilist { "3" }–{ "4" } jaamaga, { "2" } juures σ = { "5" } m) Orekit { "12.2" } paketi vähimruutude ja Kalmani hindajate vastu sobitatud jõumudelil; halvim pakett { "1e-3" } m / { "1e-6" } m/s, järjestikune { "0.9" } m.

# text
# c1: modelled
# c2: tests/od_tracking_measurements_reference.rs
# c3: xval/od-measurements-orekit/RESULTS.md
seg-55a86bc79831 = | Vahemaakiiruse / asimuudi-kõrgusnurga paketi OD kõrgusnurga maskiga | <c1/> (väline võrdlus, üks eelregistreeritud lävi jäi täitmata) | <c2/>: { "8" } stsenaariumi Orekit { "12.2" } paketi vähimruutudega kohandatud hetkeliste geomeetriliste mõõtmistega; nähtavad hulgad identsed, mõõteväärtused { "5.8e-8" } m / { "6.3e-10" } m/s / { "1.4e-13" } rad piires, olekuüleminekumaatriks { "1.2e-14" } piires, mürased olekud { "1.74" } cm piires ja tüübipõhine RMS { "2.7e-4" } piires; eelregistreeritud müravaba ≤ { "1" } cm oleku lävi jääb täitmata { "2" } stsenaariumil { "4" }-st ({ "1.46" } ja { "1.74" } cm; Orekiti enda hinnang asub selle võrra oma simuleeritud tõest eemal, kshana oma { "1e-8" } m piires). Vt <c3/>. |

# text
seg-35a85fb744cd = Aus ulatus: õppe-OD kasutab fikseeritud inertsiaaljaamu, sfäärilise Maa topotsentrilist tugisüsteemi ja hetkelisi geomeetrilisi mõõtmisi (ilma valgusajata, aberratsioonita, refraktsioonita ega Maa pöörlemiseta); vahemaakiiruse/nurga tee olekuüleminekumaatriks on variatsiooniline (RK4-ga integreeritud analüütiliste kahe keha + J2 osatuletistega), mitte suletud kujul; vahemaakiiruse ega nurkade jaoks ei ole järjestikust filtrit. Ainult vahemaa tee säilitab oma lõplike vahede Jacobi maatriksi. (Allpool olev täisjõu efemeriidi sobitamise mootor kannab oma variatsioonilist olekuüleminekumaatriksit.)

# text
# c1: src/precise_od.rs
seg-8f425e278f7c = Jõumudeli valideerimine efemeriidi sobitamisega (<c1/>)

# text
seg-9207d7139b87 = Täpne, täisjõuline positsioonivaatluste paketi vähimruutude hindaja: EGM2008 tesseraalne geopotentsiaal (hinnatud Maaga seotud tugisüsteemis CIO teisenduse kaudu) koos Päikese/Kuu kolmanda kehaga, SRP, õhutakistuse, Schwarzschildi/Lense–Thirringi GR-i (general relativity) ja ülaltoodud tõusudega, sobitatud inertsiaalsete positsioonifiksatsioonide jadale variatsioonilise olekuüleminekumaatriksi Jacobi maatriksiga. Valideeritud <b>sünteetilistel</b> andmetel, kus tõeks on Kshana enda integraator, nii et iga jääk on hindaja, mitte dünaamika oma.

# text
seg-fc676106563e = Täpse jõumudeli koostamine

# text
# c1: tests/precise_od_synth.rs
seg-57726d970436 = <c1/>: astme-0 väli on igal epohhil täpne punktmass (tsentraalliige on pöördeinvariantne); aste-8 lisab J2-vööndi lapikuse; Päikese kolmas keha ja tõusuliige ühendatakse bitt-täpselt; konstantne radiaalne empiiriline kiirendus on RTN-is (radiaalne, transversaalne, normaalne) puhtalt radiaalne.

# text
seg-98b036354077 = Variatsiooniline olekuüleminekumaatriks

# text
seg-71787d9334db = Φ iga veerg pooleks LEO orbiidiks (aste-8 geopotentsiaal + Päike + Kuu) on kooskõlas sõltumatu <b>kogu kaare tsentraalse lõplike vahede (FD) meetodiga</b> uuesti levitamisega <b>< { "1" }×{ "10" }⁻⁶ suhtelise täpsusega</b> nii positsiooni kui kiiruse vastuses — dokumenteeritud STM↔FD ristkontroll. Φ({ "0" }) = I; täiendatud ja tavalised levitajad on kooskõlas alla millimeetri täpsusega.

# text
seg-0b453776136b = Paketi-LS-i enesetaastamine

# text
seg-c651db308332 = Müravabalt vaadeldud 1-tunnine Kshana kaar (aste-6 + Päike + Kuu) taastatakse { "150" } m / { "0.1" } m·s⁻¹ nihkest <b>epohhi olekuni { "1" }×{ "10" }⁻² m piires</b> peaaegu nullise sobitusjärgse RMS-iga; { "5" } m valge müraga settib sobitusjärgne 3-D RMS <b>~σ mürapõhja</b> juures, nihketa. SRP <b>C_R taastatakse väärtusest { "1.0" } { "1" } % piires</b> tõelisest { "1.4" }-st.

# text
seg-06bd2857f832 = Kõrvalekallete redigeerimine ja RTN-i aruandlus

# text
seg-8b9dea5c0727 = { "500" } m jäme eksimus lükatakse 5-σ sobitusjärgse redigeerimisega tagasi (täpselt üks vaatlus), jättes puhta millimeetritasemel sobituse; jäägid esitatakse lahutatuna radiaalseks/transversaalseks/normaalseks ning ka 3-D-na.

# text
seg-e3969a15df96 = Empiirilise kiirenduse tase (RTN konstant + 1-CPR (CPR: tsükkel-pöörde kohta))

# text
seg-c46af7926511 = Üheksa eelinfoga piiratud empiirilist parameetrit jäävad empiiriliste liikmeteta tõe korral alla { "1" }×{ "10" }⁻⁸ m·s⁻², häirimata sobitust; tõesse süstitud konstantne { "3" }×{ "10" }⁻⁸ m·s⁻² ristsuunaline kiirendus taastatakse { "20" } % piires.

# text
# c1: src/eop.rs
# c2: tests/agency_galileo.rs
# c3: tests/agency_swarm.rs
# c4: tests/agency_lro.rs
seg-fd79199b52d1 = Aus ulatus: sünteetiline laine kasutab nominaalseid Maa orientatsiooni parameetreid (EOP: UT1 (Universal Time { "1" }, Maa pöörlemise aeg) ≈ TT (Terrestrial Time), poolusliikumist ei ole) — enesetaastamise jaoks täpne, sest sama mudel genereerib ja sobitab kaare. Ametkondade andmekogumite valideerimised kihistavad selle mootori peale <b>päris</b> finals2000A EOP ja SP3/SPK (SPK: planeedi efemeriidi tuum) tõe CIO tugisüsteemi ahela kaudu (<c1/>, <c2/>, <c3/>, <c4/>).

# text
# c1: tests/agency_galileo.rs
# c2: tests/agency_swarm.rs
# c3: tests/agency_lro.rs
seg-934f0f8e4f5f = Tegelikud ametkondade täpsed orbiidid (<c1/>, <c2/>, <c3/>)

# text
seg-721a27294813 = Galileo MEO — < { "5" } m GREEN

# text
# c1: ESA0MGNFIN
# c2: C_R
# c3: C_R
# c4: workflow_dispatch
# c5: tests/fixtures/agency/NOTICE.md
# c6: docs/AGENCY-ORBIT-VALIDATION.md
seg-14a2999d0739 = Kshana täisjõu mootor sobitatud <b>ESA/ESOC-i (ESOC: European Space Operations Centre) enda lõpliku orbiidi</b> sõna-sõnalise lõigu külge (<c1/>, ITRF (International Terrestrial Reference Frame)) Galileo <b>E11</b> jaoks { "8" } h jooksul, iga ITRF-i fiksatsioon pööratud GCRS-i päris finals2000A EOP-iga: sobitusjärgne <b>3-D RMS { "0.133" } m</b> puhas jõud + <c2/> (RTN 0.105/0.067/0.047 m, <c3/> { "1.174" }), <b>{ "0.070" } m</b> empiirilise tasemega, { "78.7" } km toore kattuvuse põhjal. Täielik { "24" } h kaar on <b>{ "0.611" } m</b>. Kõik selgelt { "5" } m läve sees. Välja gravitatsioon koondunud d/o-8 juures (identne d/o 8/10/12 korral); töö <c4/> käitab täielikku d/o-70. Päritolu + SHA-256 (SHA: Secure Hash Algorithm) failis <c5/>; täielik kirje failis <c6/>.

# text
seg-d5ed0783432e = Swarm-A LEO — < { "5" } m GREEN

# text
# c1: SW_OPER_SP3ACOM_2_
# c2: C_R
# c3: 2.522
# c4: tests/fixtures/agency/NOTICE.md
# c5: docs/AGENCY-ORBIT-VALIDATION.md
seg-403b15ec1b9b = Täisjõu mootor (+ atmosfäärihõõrdumine) sobitatud <b>ESA enda Swarm-A redutseeritud dünaamikaga täpse orbiidi</b> sõna-sõnalise lõigu külge (<c1/>, L47, ITRF, ~{ "430" } km, ~{ "2" } cm) { "3" } h jooksul d/o-70 juures, päris finals2000A EOP CIO ahela kaudu: <b>dünaamiline</b> tase (ainult olek, staatiline tihedus, <c2/>={ "1" }) sobitusjärgne <b>3-D RMS { "2.687" } m</b> (RTN 0.925/<c3/>/0.045 m — jääk ≈ puhas piki-trajektoori õhutakistus), <b>redutseeritud dünaamikaga</b> tase (+ empiirilised CPR kiirendused) <b>{ "0.098" } m</b> (RTN 0.026/0.092/0.025 m) — ~{ "10" } cm ESA ~{ "2" } cm orbiidi suhtes. Päritolu + SHA-256 failis <c4/>; täielik kirje failis <c5/>.

# text
seg-3be5a6bee187 = LRO (Lunar Reconnaissance Orbiter) Kuu — valideeritud, üle { "5" } m (aus)

# text
# c1: src/lunar_od.rs
# c2: src/lunar_frame.rs
# c3: atol
# c4: xval/anise-lunar-od
# c5: tests/fixtures/agency/NOTICE.md
# c6: docs/AGENCY-ORBIT-VALIDATION.md
seg-d2be90186a89 = <b>Kuukeskne</b> jõumudeli sobitus (<c1/>): GRAIL-i <b>GRGM660PRIM</b> gravitatsiooniväli (d/o { "100" }) Kuuga seotud peatelgede tugisüsteemis (<c2/>, IAU { "2015" } keskmine Maa + fikseeritud DE421 (Development Ephemeris { "421" }) keskmine Maa → peatelg (ME→PA) nihe, rakendatud nii nagu SPICE seda defineerib alates { "0.36" }: seni rakendati seda vales suunas, umbes { "208" }″ nihkega) + Maa/Päikese kolmas keha, sobitatud <em>sama</em> üldise Gauss–Newtoni hindajaga nagu Maa andmekogumid päris <b>JPL Horizons LRO</b> (NAIF −{ "85" }) rekonstrueeritud orbiidile, { "4" } h / { "241" } epohhi, ~{ "98" } km. Aus sobitusjärgne ({ "0.36" }): <b>dünaamiline { "12.05" } m</b> (RTN 2.91/10.11/5.88), <b>redutseeritud dünaamikaga { "6.67" } m</b> (RTN 3.41/4.58/3.44, { "1" }+2-pöörde-kohta empiiriline), { "39.9" } m toore kattuvuse põhjal (enne ME→PA parandust: { "12.6" } m, { "6.65" } m, { "53.8" } m) — <b>üle</b> < { "5" } m läve, mitte hindaja süü (identne d/o 100/150 ja <c3/> 1e-6/1e-9 korral). <b>DE-klassi ristvalideerimine</b> (<c4/>: DE440 (Development Ephemeris { "440" }) Kuu PA orientatsioon + DE440 efemeriid ANISE kaudu) <b>parandas</b> piiravat tegurit puudutavat väidet — see andis { "12.0" } m dünaamilise ja { "6.67" } m redutseeritud dünaamikaga, millega parandatud analüütiline pakk nüüd mõlemal tasemel ühtib (varasem dünaamiline lõhe, { "12.6" } → { "12.0" } m, oli ME→PA nihke viga), seega operatiivne põhi <b>ei ole</b> analüütiline orientatsioon/efemeriid, vaid empiirilise tasemega mittevähendatav jääk (kõige kooskõlalisem modelleerimata LRO mittegravitatsiooniliste dünaamikatega lühikesel kaarel); lihtne analüütiline pakk ühtib juba redutseeritud dünaamikaga orbiidi puhul DE-klassiga. Päritolu + SHA-256 failis <c5/>; täielik kirje failis <c6/>. <b>Valideeritud tegeliku ametkonna tõe vastu: { "3" } { "3" }-st; täidab < { "5" } m: { "2" } { "3" }-st.</b>

# text
# c1: src/gravimeter.rs
# c2: src/mapmatch.rs
# c3: src/particle_filter.rs
# c4: src/altpnt/terrain.rs
seg-3d3cbf5f043d = Gravitatsioonikaardi / alt-PNT navigatsioon (<c1/>, <c2/>, <c3/>, <c4/>)

# text
seg-89f2cbf55842 = Sfääriliste harmooniliste gravitatsioonianomaalia väli

# text
# c1: src/gravimeter.rs
# c2: P̄₁₁ = √3·cosφ
# c3: P̄₂₀ = (√5/2)(3sin²φ−1)
# c4: P̄₂₂ = (√15/2)cos²φ
seg-76cae5c530f2 = <c1/>: madala astmega täielikult normaliseeritud väli, mida on kontrollitud suletud kujul Legendre'i funktsioonide (<c2/>, <c3/>, <c4/>) ja käsitsi tuletatud ühe liikme anomaaliaga { "1.897" } mGal vastu.

# text
seg-f00f82b70e6e = Külmaatom-gravimeetri mõõtmismudel

# text
# c1: σ = ASD/√τ
seg-49090598c525 = Valge müra põhi tuletatakse CAI kiirendusmõõturi ASD-st (<c1/>), süstitakse deterministliku algväärtusega (seed) jadana (sobitajale ei anta kunagi müravaba tõde, kuid käitus on bitt-reprodutseeritav).

# text
seg-0556db62c45f = Järjestikuse tähtsusvalikuga uuestivalimise osakeste filter

# text
# c1: src/particle_filter.rs
seg-3df4251aedbd = <c1/>: deterministlik tuum on fikseeritud täpselt — ESS (efektiivne valimisuurus) ulatudes { "1" }…N, süstemaatiline uuestivalimine, mis valib indeksid kaaluga võrdeliselt, kaalutud keskmise kumer kombinatsioon, Gaussi tõepära, mis tõmbab hinnangu mõõtmise peale, ja algväärtusega (seed) ennustuse determinism.

# text
seg-7dca80b16a00 = Kaardisobitamise tõepära + taastamine

# text
# c1: src/mapmatch.rs
# c2: field_likelihood
# c3: e^(−½)
seg-eb40ab2607ae = <c1/>: <c2/> saavutab tipu (= { "1" }) täiusliku sobivuse korral ja langeb ühe sigma juures väärtusele <c3/>; osakeste filter eristuval sünteetilise maastiku lapil taastab tegeliku positsiooni { "0.1" } piires.

# text
seg-446d9f03a860 = 60-minutiline GPS-ita bench

# text
# c1: run_gps_denied_gravity_nav
# c2: scenarios/gps-denied-gravity-nav.toml
seg-ed29fb24d9d5 = <c1/> (<c2/>): ~{ "700" } km / üheatunnine katkestus, kus inertsiaallahend triivib <b>≈ { "70" } km</b>-ni, taastatakse <b>≈ { "145" } m (< { "500" } m)</b> täpsusega hierarhilise jämedast peeneni sobitajaga — bitt-reprodutseeritav, stabiilne müra realisatsioonide lõikes ja tõestatavalt täpsustusega piiratud (üks jäme ruudustik jääb kinni ~{ "2" } km juures).

# text
# c1: .hgt
seg-81a2963c26cc = SRTM (Shuttle Radar Topography Mission) <c1/> DEM-i (digital elevation model) laadija + bilineaarne valim (ORACLE A)

# text
# c1: src/altpnt/terrain.rs
# c2: tests/terrain_nav_validation.rs
# c3: .hgt
# c4: tools/gen_terrain_fixture.py
# c5: tests/fixtures/terrain/N36W117_sub6.hgt
# c6: real_srtm_committed_badwater_tile_reads_real_relief
# c7: #[ignore]
seg-5e7bbf951faf = <c1/> / <c2/>: käsitsi ehitatud { "2" }×{ "2" } <c3/> puhver nurkadega [{ "100,200" };{ "300,400" }] interpoleeritakse bilineaarselt <b>täpselt väärtuseks { "250.0" }</b> ruudu keskel (suletud kujul sõltumatu etalon), 16-bitine big-endian edasi-tagasi teisendus on täpne ning ridade ümberpööramine paigutab põhjapoolseima faili rea kõrgeimale salvestatud laiuskraadile — kõik <b>GDAL-i (Geospatial Data Abstraction Library) SRTMHGT (Shuttle Radar Topography Mission height-file format) draiveri spetsifikatsiooni</b> vastu (16-bitine märgiga big-endian, reapõhine, põhjarida esimesena, tühi väärtus -32768, <a1>https://gdal.org/en/stable/drivers/raster/srtmhgt.html</a1>). Sisseviidud { "11" }×{ "11" } fikstuur (<c4/>) katsetab parserit CI-s; ning <b>sisseviidud päris avalikus omandis NASA/USGS (USGS: United States Geological Survey) SRTM v3 plaat</b> (N36W117, Death Valley, harvendatud 6 kaaresekundini, { "722" } KB, <c5/>) loetakse CI-s (mitte-ignoreeritud, <c6/>), paigutades <b>Badwater Basini ≈ −{ "78" } m dokumenteeritud [−{ "95" },−{ "70" }] m vahemikku</b> (NGS/NOAA (NGS: National Geodetic Survey; NOAA: National Oceanic and Atmospheric Administration) mõõdistus ≈ −{ "86" } m) plaadi maksimumiga ≈ { "2161" } m — tõe allikas on mõõdistus, DEM on katsetatav (mitteringjas). Suuremad avaldatud kõrgusväärtused (Mount Whitney { "4421" } m) jäävad <c7/>-väravaga täisplaatide testidesse.

# text
seg-80f985ea3e11 = Maastikureferentsiga navigatsiooni (TERCOM/SITAN (TERCOM: terrain contour matching; SITAN: Sandia Inertial Terrain-Aided Navigation)) koondumine (ORACLE B)

# text
# c1: run_terrain_nav
# c2: scenarios/terrain-nav.toml
# c3: search_step/factor² ≈ 140 m
seg-9ad7bf3a8c3e = <c1/> (<c2/>): <b>käsitsi tuletatud</b> süstitud INS-i triiv ({ "0.5" }°N, −{ "0.4" }°E ≈ { "70" } km ~{ "12" }° laiusel, arvutatud kui triiv° × M_per_deg × cos lat) taastatakse täpsusega <b>< { "500" } m</b> (ruudustiku eraldusvõime põhja <c3/> piires), > { "100" }× vähendus vabainertsiaalse suhtes — kontrollitud <em>süstitud</em> arvu, mitte kunagi DEM-i vastu (mitteringjas), bitt-reprodutseeritav ja stabiilne müra algväärtuste (seed) lõikes.

# text
seg-5b7c1dc72436 = Kombineeritud gravitatsiooni+magnetismi+maastiku liitmise võit (ORACLE C)

# text
# c1: run_combined_altpnt
# c2: scenarios/combined-altpnt.toml
seg-7e3818f2ee2b = <c1/> (<c2/>): kolm skalaarset kanalit (Δg · |B| maakoore anomaalia · kõrgus), liidetud korrutiseline tõepära, annavad 60-minutilise katkestuse jooksul <b>piiratud < { "500" } m</b> jäägi, mis algväärtuste keskmisena on <b>mitte halvem kui parim üksikkanal</b> (informatsiooni additiivsus / madalam CRLB (Cramér–Rao lower bound)). Asub avaldatud TERCOM / maastikureferentsiga navigatsiooni (TRN) „kümnete meetrite“ CEP (circular error probable) režiimis (<a1>https://en.wikipedia.org/wiki/TERCOM</a1>; PeerJ { "2024" } ESKF-TERCOM (ESKF: error-state Kalman filter), <a2>https://peerj.com/articles/cs-3118/</a2>).

# text
# c1: .hgt
# c2: #[ignore]
# c3: kind=
# c4: gravity-map
# c5: terrain-nav
# c6: combined-altpnt
seg-fe23ff839bce = Aus ulatus: gravitatsiooniväli on madala astmega + sünteetilised massikontsentratsioonid, <b>mitte</b> täielik EGM2008/EIGEN (EIGEN: European Improved Gravity model of the Earth by New techniques) koefitsientide komplekt; magnetkanal tugineb sujuvale IGRF-i põhiväljale pluss <b>sünteetilistele</b> maakoore anomaalia massikontsentratsioonidele (päris kõrgsageduslik maakoore kaart on järgmine samm); <em>navigatsioonifiksatsiooni</em> benchide CI maastikuväli on iseseisev sünteetiline DEM, samal ajal kui <c1/> lugejat ennast valideeritakse nüüd CI-s sisseviidud päris SRTM v3 plaadi vastu (ülal); täieraldusvõimega päris plaadid jäävad <c2/>-väravaga. Kaardi esituse vea Monte Carlo jääb järgmiseks sammuks. Kõik kolm navigaatorit on nüüd stsenaariumimootoris ühendatud stsenaariumi <c3/>-idega (<c4/>, <c5/>, <c6/>).

# text
# c1: src/inertial/
seg-d9f7e199e5d0 = INS / IMU veamudel — andmelehega seotud valideerimine (<c1/>)

# text
# c1: N
# c2: tests/imu_allan_spec.rs
seg-48266c2faaed = IMU stohhastiline veamudel on valideeritud <b>avaldatud tootja andmelehtede / andmekogumite spetsifikatsioonide</b> vastu — mitte kunagi väärtuse vastu, mille Kshana ise tekitas. Sild välijiku spetsifikatsioonist SI (International System of Units) müramudelini on standardne Alani hälbe identifitseerimine (Riley, NIST SP { "1065" } §{ "5" }; IEEE (Institute of Electrical and Electronics Engineers) Std { "952" }): juhukõnni koefitsient <c1/> on kattuv ADEV, loetuna hetkel τ = { "1" } s τ⁻¹ᐟ² kallakul, ning nihke ebastabiilsuse koefitsient on lame Alani platoo (<c2/>, hermeetiline — allalaadimist ei ole).

# text
seg-702de63000d2 = Tõend / sõltumatu etalon

# text
seg-c3fed48b98b1 = Ühikute teisendamise kiht (#1 mitteringsuse risk)

# text
seg-6cdc88d36bfd = Käsitsi kontrollitud: { "0.15" } deg/√hr = { "4.3633e-5" } rad/√s; { "3.6" } µg = { "3.5304e-5" } m/s²; { "2.0" } deg/hr = { "9.6963e-6" } rad/s.

# text
seg-75afa5abcd08 = Güroskoobi nurga juhukõnd

# text
seg-d5fd60857e4d = ADIS16465 ARW { "0.15" } deg/√hr (Analog Devicesi andmeleht) taastatud ADEV({ "1" } s)-st täpsusega < { "5" }%.

# text
seg-c5e2d361b83f = Kiirendusmõõturi kiiruse juhukõnd

# text
seg-4413d3bb39b4 = ADIS16465 VRW { "0.1" } m/s/√hr taastatud täpsusega < { "5" }%.

# text
seg-ebeb0bb0e0fb = Valge müra Alani tõus

# text
seg-f674ce82dc2c = ADIS16460 valge haru log-log tõus −{ "0.5" } ± { "0.05" }.

# text
seg-40afd130f31d = Käitusaegse nihke ebastabiilsuse platoo

# text
seg-94acb18a94cb = ADIS16465 güroskoobi nihke ebastabiilsus (BI) { "2.0" } deg/hr taastatud lameda Alani miinimumina täpsusega < { "15" }%.

# text
seg-b359e0e92e20 = Teine IMU profiil

# text
seg-1a304949bcf9 = NaveGo ADIS16488 (ARW { "0.3" } deg/√hr, VRW { "0.029" } m/s/√hr) mõlemad taastatud täpsusega < { "5" }%.

# text
# c1: KSHANA_KFGINS_DIR
seg-fea9287d6533 = Aus ulatus: see valideerib <b>stohhastilist veamudelit</b> andmelehe Alani koefitsientide vastu. i2Nav-WHU (WHU: Wuhani Ülikool) <b>KF-GINS</b> sõidukiandmekogumit kasutatakse eraldi, andmetest sõltuva kontrollina: lõdvalt seotud suletud ahelaga veaoleku EKF GNSS-i hoovavarre mudeliga on <a1>kontrollimaatriksi</a1> VALIDATED rida (<em>Lõdvalt seotud GNSS/INS EKF hoovavarrega KF-GINS andmekogumil</em>), võrdluses KF-GINS C++ etalontrajektooriga enne käitust registreeritud lävede all. See käivitub ainult seal, kuhu andmekogum on antud (<c1/>); ilma selleta käivituvad sünteetilise laadija ja hoovavarre testid. Tihedalt seotud ja kandelaine faasi variante see rida ei hõlma (kandelaine faasiga tihedalt seotud GNSS/INS rida on MODELLED).

# text
# c1: src/body.rs
# c2: src/mars_frame.rs
# c3: src/ephem_provider.rs
# c4: src/radiometric.rs
# c5: src/timescales.rs
seg-f0ab98c1a79d = Kauge kosmose ja Marsi PNT — D0 alus (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>)

# text
# c1: tests/cross_platform_golden.rs
# c2: tests/golden.rs
seg-bd222b27949c = Kauge kosmose navigatsioonimootori esimene verstapost: Maa-kesksest tuumast üldistamine suvalisele keskkehale, Marsi dünaamika, efemeriidi pakkuja liidese, alla mikrosekundi aja ning valgusaja/relativistliku viivituse primitiivide lisamine. <b>Iga olemasolev Maa stsenaarium on bait-baidis identne</b> — platvormideülesed reprodutseeritavuse etalontulemused (<c1/>, <c2/>) läbitakse muutmata, ilma taasgenereerimiseta, jõustatuna igal commit'il.

# text
seg-e0cdbfcbb28a = Keskkeha abstraktsioon (Maa bait-baidis identne)

# text
# c1: src/body.rs
# c2: Body{mu,re,zonals,gravity,rotation,IAU-pole}
# c3: earth()/mars()/moon()/sun()
# c4: tests/mars_dynamics.rs
# c5: two_body_accel_body(r,&Body::earth())
# c6: zonal_accel_body
# c7: assert_eq!
# c8: ForceModel
seg-7d20649189fa = <c1/>: <c2/> koos <c3/>. <c4/> kinnitab, et <c5/> ja <c6/> on varasemate Maa funktsioonidega <b>täpselt bitt-võrdsed</b> (<c7/>) ja vaike-<c8/> Maa kaar on bait-baidis identne — reprodutseeritavuse etalontulemused on muutumatud (sama SHA, taasgenereerimist ei ole).

# text
seg-658acc8112e3 = Marsi gravitatsioon (GMM-3 (GMM: Goddard Mars Model) tesseraalne, kehaga seotud)

# text
# c1: Body::mars_gmm3(nmax)
# c2: C̄n0=−Jn/√(2n+1)
# c3: tests/mars_dynamics.rs
# c4: .gfc
# c5: gravity_sh::from_gfc
seg-9b058665cf4b = <c1/>: tsonaalid C̄20/C̄30/C̄{ "40" } MRO110 (Mars Reconnaissance Orbiter gravitatsioonilahend) J2/J3/J4-st (<c2/>, J2 teisendub edasi-tagasi väärtuseks { "1.9604e-3" }) + MRO110B2 sektoriaalsed/tesseraalsed C̄22/S̄{ "22" }, C̄32/S̄{ "32" } (Konopliv et al. { "2011" }; tabuleeritud Liu, Baoyin & Ma { "2012" }), hinnatud IAU Marsiga seotud tugisüsteemis. <c3/> kontrollib edasi-tagasi teisendust, J2-skaala kõrvalekallet punktmassist ning seda, et väli on tõepoolest kehaga seotud (Marsi ööpäeva veerandi võrra ümberorienteerimine muudab inertsiaalset kiirendust). Kõrgem aste/järk laaditakse kaasatud failist <c4/> funktsiooni <c5/> kaudu.

# text
seg-1dcbee768418 = Marsiga seotud tugisüsteem (IAU pool)

# text
# c1: src/mars_frame.rs
# c2: R3(W)·R1(90°−δ0)·R3(90°+α0)
# c3: lunar_frame.rs
# c4: prime_w_dot
seg-0708e5b37d69 = <c1/>: IAU 3-1-3 pööre <c2/> (WGCCRE/NAIF (WGCCRE: Working Group on Cartographic Coordinates and Rotational Elements) konventsioon, sama mis failis <c3/>). Testid: ortonormaalne täpsusega { "1e-12" } determinandiga +{ "1" }, edasi-tagasi identiteet, nullmeridiaan edeneb kiirusega <c4/> ööpäevas.

# text
seg-5b6355a143c7 = Marsi / Päikese-kesksed levitamine

# text
# c1: validated
seg-4ab87f666765 = <c1/> (sisemine kooskõla)

# text
# c1: tests/mars_propagation.rs
seg-12e3d173340b = <c1/>: madala Marsi orbiit naaseb algpunkti ühe Kepleri perioodi järel (sulgumine); erienergia ε=v²/2−μ/r triivib kaare ulatuses <{ "1e-9" }; Marsi-J2 sekulaarne sõlme regressioon ühtib analüütilise Vallado kiirusega (arvutatud sõltumatult ≈ −{ "5.15" } °/ööpäevas { "60" }° kaldel) täpsusega { "3" }%; heliotsentriline orbiit taastab ~687-päevase Marsi aasta (vis-viva + sõltumatu perioodi taastamine kaarest). Väliseid andmeid ei ole.

# text
seg-acff4c016089 = DE440 ristvalideerimine (heliotsentriline Mars)

# text
# c1: xval/anise-mars-od/
# c2: xval/anise-lunar-od
# c3: de440s.bsp
# c4: c1c7fee…b260a49f2
# c5: $KSHANA_ANISE_DE440S
# c6: workflow_dispatch
seg-ed164e298754 = <c1/> (töökohast VÄLJA JÄETUD; MPL-2.0 ANISE piiratud oma Cargo.lock-iga; peegeldab <c2/>): võrdleb Kshana Päikese-keskset Marsi levitamist JPL DE440-ga (ANISE kaudu), Horizonsi tõde on viidatud sõna-sõnalt (päritolu + SHA-256). <b>Reprodutseeritud tulemus</b> (algväärtus (seed) JD (Julian date) { "2459580.5" } TDB (Barycentric Dynamical Time), <c3/> SHA-256 <c4/>): positsioonijääk <b>{ "137" } m @ 1-päevane kaar</b> ({ "5.97" }×{ "10" }⁻¹⁰ heliotsentrilisest kaugusest { "2.299" }×10¹¹ m), kasvades { "3.3" } km @ { "5" } p, { "87.9" } km @ { "30" } p, { "1.71" } Mm @ { "90" } p — jääk <em>kasvab</em> kaare pikkusega, sest Päikese-kesksel kahe keha mudelil puuduvad tahtlikult planeetide häired (peamiselt Jupiter) ja Marsi süsteemi sisemine liikumine, mida DE440 barütsentri efemeriid kannab, seega on kasv modelleerimata n keha dünaamika aus tunnus, mitte integraatori viga; lühike kaar, mis jääb heliotsentrilise kauguse tühiseks murdosaks, kinnitab, et Päikese-kesksed mehhanismid on õiged. Käivitub ainult siis, kui DE440 tuum on olemas (<c5/>, või automaatselt alla laaditud ~{ "32" } MB) — käsitsi / <c6/> DE-klassi kontroll, <b>mitte</b> vaikimisi CI värav, seega avaldatud pakett ja iga vaikeväravas jäävad bait-baidis puutumata.

# text
seg-a7d79066a53b = Valgusaeg + Shapiro viivitus

# text
# c1: src/radiometric.rs
seg-798148171dab = <c1/>: iteratiivne hilistunud epohhi valgusaja lahend (koondub |Δτ|<{ "1e-12" } s, piiratud) ja Shapiro viivitus Δt=(2μ/c³)·ln[(r1+r2+r12)/(r1+r2−r12)]. Testid: Maa–Päike ≈ { "499" } s ja Maa–Kuu ≈ { "1.28" } s sisseehitatud efemeriidi kaudu; sünteetiline konstantse kiirusega kiirgur taastab analüütilise hilistunud lahendi täpsusega <{ "1e-9" } s (lahendaja tõestatult sõltumatu mis tahes tegelikust efemeriidist); Shapiro ühtib käsitsi arvutatud väärtusega täpselt ja annab ~{ "100" }–{ "250" } µs Maa–Marsi ülemise konjunktsiooni riivava kiire jaoks.

# text
seg-1bc28f6bdc8f = Efemeriidi pakkuja liides

# text
# c1: src/ephem_provider.rs
# c2: trait EphemerisProvider
# c3: BuiltinEphemeris
# c4: None
# c5: LunarEnvironment
# c6: AniseLunarEnvironment
seg-34d6a07ad252 = <c1/>: <c2/> + tuumavaba <c3/> (Montenbruck–Gill Päike/Kuu, geotsentriline); tagastab <c4/> kehade jaoks, millel sellel rida ei ole (nt Mars), mille jaoks on tee DE-klassi ANISE pakkuja — sama sisseehitatud-vs-ANISE jaotus nagu <c5/>/<c6/>.

# text
seg-5e1fed7a98c0 = Kaheosaline aeg + TT↔TDB

# text
# c1: src/timescales.rs
# c2: TwoPartJd{day,frac}
# c3: tt_to_tdb
# c4: tdb_to_tt
seg-5ebca9b5f2db = <c1/>: <c2/> Knuthi kahe summa kogumisega taastab alla mikrosekundi intervallid, mille ühe f64 JD kaotab J2000 lähedal (>{ "1000" }× parem, testitud); <c3/>/<c4/> kasutavad domineerivat Fairhead–Bretagnoni perioodilist rida (|TDB−TT|≲{ "1.7" } ms, käsitsi kontrollitud hetkel J2000). Lisanduv — olemasolev ühe f64 ajatee on muutumatu.

# text
# c1: src/radiometric.rs
# c2: src/ccsds_tdm.rs
seg-d2da2e1d1711 = Kauge kosmose radiomeetrilised vaadeldavad ja CCSDS jälgimisandmete sõnum — D1 (<c1/>, <c2/>)

# text
# c1: sigma
seg-b98f508f2375 = Kauge kosmose navigatsioonimootori teine verstapost: <b>vaadeldavate mudel</b>, mis muudab D0 valgusaja/relativistliku viivituse tuuma tegelikeks suurusteks, mida Deep Space Network (DSN) või ESTRACK (European Space Tracking network) jälgimisseanss teatab — vahemaa, ühe/kahe/kolme tee Doppler, koherentne transponderi ümberpööre, regeneratiivne/PN (PN: pseudojuhuslik müra) vahemaamõõtmine, Δ-DOR (DOR: differential one-way ranging) ja levikeskkonnad — pluss <b>CCSDS (Consultative Committee for Space Data Systems) 503.0-B jälgimisandmete sõnumi (TDM)</b> sisend/väljund, mis võtab vastu/väljastab standardse ametkonna jälgimisfaili. <b>Aus ulatus:</b> need on <b>täpsed geomeetrilised mudelid</b>, mis järgivad Moyeri / CCSDS konventsioone; mõõtmise <em>müra</em> on helistaja antud vaatluspõhine <c1/>, mitte mudelisse sisse ehitatud. <em>Konkreetse tegeliku jälgimisseansi</em> reprodutseerimine vajab tegelikke TDM-andmeid pluss kauge kosmose orbiidi määramise lahendajat — see on <b>D2</b>, mitte D1. Kõik allolev on lisanduv (reprodutseeritavuse etalontulemused on muutumatud; sama SHA, taasgenereerimist ei ole).

# text
seg-d1d2dc7906c8 = Vahemaa ja 1/2/3-tee Doppler (Moyeri kahe haru lahend)

# text
# c1: src/radiometric.rs
# c2: one_way_range
# c3: two_way_range
# c4: ρ₂ = c·(τ_up + τ_down)
# c5: one_way_doppler
# c6: two_way_doppler
# c7: three_way_doppler
# c8: f_D = −(M·f_ul/c)·(ρ̇_up + ρ̇_down)
# c9: c·τ
# c10: −(f/c)·ρ̇
seg-e2176b844df8 = <c1/>: <c2/>/<c3/> koostavad D0 hilistunud (allalingi) ja ettejõudnud (ülalingi) valgusaja lahendid; täielik edasi-tagasi konventsioon on <c4/> (m), dokumenteeritud ja järjekindel. <c5/>/<c6/>/<c7/> moodustavad kandesageduse nihke <c8/> (Hz) vaatejoone vahemaakiirusest, <b>märgikonventsioon: lähenev kosmoselaev annab positiivse (sinise) nihke</b>. Testid: kahe tee vahemaa = harude summa täpsusega <{ "1" } mm (~{ "2" } AU Maa–Päike edasi-tagasi tee); ühe tee vahemaa = <c9/> täpselt; ühe tee Doppler ühtib analüütilise <c10/>-ga radiaalse konstantse kiirusega kiirgurile ppt täpsusega; kolme tee kooskõlas asuvate jaamadega taandub bait-baidis kahe teeni.

# text
seg-638697be5b5b = Koherentne transponderi ümberpööre (täpsed DSN-i suhted)

# text
# c1: turnaround_ratio
# c2: M = f_down/f_up
# c3: two_way_doppler_coherent
# c4: two_way_doppler
seg-781aa4041c58 = <c1/>: täpsed ratsionaalsed DSN/CCSDS ümberpöörde arvud <c2/> (Moyer §{ "13" }; DSN 810-005 moodul 201/214) — S/S 240/221, S/X 880/221, X/S 240/749, X/X 880/749, X/Ka 3344/749, Ka/Ka 3360/3599. Testitud täpse võrdsuse suhtes; määratlemata sagedusalapaar <b>paneb paanikasse</b> (ebaõnnestub valjusti, ei leiuta kunagi suhet). <c3/> rakendab sagedusala kandesagedust + suhet otsast otsani ja võrdub ilmutatud <c4/>-ga masinatäpsuseni.

# text
seg-f24f9da1570c = Regeneratiivne / PN vahemaamõõtmine (CCSDS { "414" }; mitmetähenduslikkus)

# text
# c1: src/radiometric.rs
# c2: regenerative_range_ambiguity
# c3: c/(2·chip_rate)
# c4: pn_range_ambiguity
# c5: c·L/(2·f_chip)
seg-1abd8c221e8d = <c1/>: <c2/> = <c3/> (kiibi kohta eraldusskaala üheselt mõistetav vahemaa) ja <c4/> = see × koodi pikkus (täielik PN-koodi üheselt mõistetav vahemaa <c5/>), vastavalt CCSDS 414.1-B-le. Testitud: { "1" } MHz vahemaakell annab ~{ "149.9" } m; CCSDS-414.1 kaalutud hääletuse PN-kood ({ "1 009 470" } kiipi) kiirusel { "1" } Mkiipi/s annab ~{ "151 000" } km kavandatud üheselt mõistetava vahemaa; kiibikiiruse kahekordistamine poolitab kiibi kohta mitmetähenduslikkuse.

# text
seg-16b9fdd916a7 = Δ-DOR (CCSDS { "506" } taevatasandil)

# text
# c1: delta_dor
# c2: Δτ = −B⃗·(ŝ_sc − ŝ_quasar)/c
# c3: B⃗
# c4: −B·sin(Δθ)/c
# c5: |Δτ| ≈ B·Δθ/c
seg-93055e944306 = <c1/>: diferentsiaalne taevatasandi viivitus <c2/> (s) interferomeetri baasjoone <c3/> jaoks (CCSDS 506.1-B). Testitud: ühtib täpse analüütilise projektsiooniga <c4/> teadaoleva baasjoonega joondatud nihke jaoks täpsusega { "1e-15" } s, väikese nurga suurusega <c5/> ja <b>nulliga</b> (kvasariga kaasjoondatud kosmoselaev annab täpselt nullise diferentsiaalse viivituse).

# text
seg-4e5258bb04d5 = Plasma 1/f² kahe sagedusega kalibreerimine

# text
# c1: src/radiometric.rs
# c2: solar_plasma_delay
# c3: K_PLASMA·TEC/(c·f²)
# c4: 1/f²
# c5: K_PLASMA = 40.3 m·Hz²·TECU⁻¹
# c6: coronal_tec_from_sep
# c7: TEC ∝ 1/sin(SEP)
# c8: dual_freq_plasma_calibration
# c9: K_disp = (Δt_X−Δt_Ka)/(1/f_X²−1/f_Ka²)
# c10: d_X/d_Ka = (f_Ka/f_X)²
# c11: dual_frequency_recovers_injected_plasma
seg-e3b340103825 = <c1/>: <c2/> = <c3/> (dispersiivne <c4/> laetud osakeste rühmaviivitus, <c5/>); <c6/> Cassini-klassi <c7/> koroona sammas (analüütiline asendaja, mitte kalibreeritud koroona); <c8/> <c9/> dispersiooni pöördamine, mida DSN kasutab plasma eemaldamiseks. Testitud: 1/f² seadus <c10/>; koroona tõuseb konjunktsiooni poole; ning <b>süstitud TEC taastatakse täpsusega <{ "1" } %</b> (tegelikult ≪ { "1e-9" } müravabalt) — <c11/>.

# text
seg-e1e265ab499a = Tropo / iono keskkonnad (GNSS-i mudelite taaskasutus)

# text
# c1: tropo_delay
# c2: iono_delay
# c3: gnss_sim::tropo_delay_m
# c4: gnss_sim::klobuchar_delay_m
seg-2d9aa52f318b = <c1/>/<c2/>: kauge kosmose maajaama segment läbib sama Maa atmosfääri, mida GNSS-i pakett juba modelleerib, seega need delegeerivad funktsioonidele <c3/> (Saastamoinen-seniit + Niell-kaardistus, mittedispersiivne) ja <c4/> (edastatav iono). Testitud ühendatuna + füüsikaliselt märgistatuna: tropo positiivne ja madalal kõrgusnurgal suurem kui seniidis; iono mittenegatiivne kaldviivitus (arvuline täpsus on GNSS-i paketi enda andmelehega seotud testide asi).

# text
seg-44ba6e0411fd = CCSDS-TDM { "503" } parsimine / väljastamine + radiomeetriline sild

# text
# c1: src/ccsds_tdm.rs
# c2: META_START…META_STOP
# c3: DATA_START…DATA_STOP
# c4: RANGE
# c5: DOPPLER_*
# c6: ANGLE_*
# c7: *_FREQ
# c8: #[cfg(test)]
# c9: tests/fixtures/deepspace/reference.tdm
# c10: to_radiometric_obs
# c11: RANGE
# c12: DOPPLER_*
# c13: RadiometricObs
# c14: PATH
# c15: 1,2
# c16: 1,2,1
# c17: 1,2,3
# c18: TRANSMIT_BAND
# c19: sigma
# c20: 0.0
seg-18eafe936dcb = <c1/>: CCSDS 503.0-B-2 KVN (keyword-value notation) lugeja <b>ja</b> kirjutaja (päis + <c2/> / <c3/> segmendid; <c4/>/<c5/>/<c6/>/<c7/> kirjed). Testid (<c8/> + <c9/>): etalonfikstuur parsitakse oodatavateks nimega väljadeks; <b>parsimine→väljastamine→parsimine on võrdne struktuur</b> (semantiline edasi-tagasi teisendus); sild <c10/> kujutab üheselt mõistetavad <c11/>/<c12/> kirjed tüübiks <c13/> (tee väljalt <c14/> <c15/>/<c16/>/<c17/>, sagedusala väljalt <c18/>, km→m); mitmesegmendiline fail lähtestab olekumasina. <b>Aus vahelejätmine, mitte aimamine:</b> nurgad/sagedused, tundmatud sagedusalad, aasta-päeva epohhid ja tundmatud ajasüsteemid <b>jäetakse vahele</b>, mitte kunagi valesti ei kaardistata, ning <c19/> jäetakse väärtusele <c20/> helistaja kaalutavaks.

# text
seg-e8ca55dd29b1 = DSN/ESTRACK bench (mudeli täpsus ≫ avaldatud põhi)

# text
# c1: tests/radiometric_benchmark.rs
# c2: v/(1+v/c)
seg-247b9e7b2be8 = <c1/>: vaadeldavad on täpsed geomeetrilised arvutused, seega aus bench on see, et <b>mudeli enda arvuline viga on avaldatud DSN/ESTRACK mõõtmise põhjast kaugelt allpool</b> — mudel ei ole täpsuse kitsaskoht, helistaja antud σ on. Iga test arvutab vaadeldava kahel sõltumatul viisil (või taastab süstitud tõe) ja kinnitab, et jääk on põhjast allpool: <b>vahemaa</b> teisendub edasi-tagasi täpsusega <{ "1" } mm ≪ ~{ "1" } m PN-vahemaamõõtmise põhi (DSN 810-005 mod. { "214" } / CCSDS 414.1-B); <b>Doppler</b> ühtib täpse suletud kujul hilistunud vahemaakiirusega <c2/> täpsusega ~{ "10" }⁻⁶ m/s, mitu korda ~{ "0.05" } mm/s X-sagedusala põhjast allpool (DSN 810-005 mod. { "203" } / Moyer) — jääk on f64 vahemaa diferentseerimise põhi ~{ "1" } AU juures, arvuline omadus, mitte modelleerimisviga; <b>Δ-DOR</b> reprodutseerib suletud kujul projektsiooni ekvivalentse taevatasandi nurgaga ≪ { "1" } nrad ≪ ~{ "1" }–{ "10" } nrad põhi (DSN 810-005 mod. { "210" } / CCSDS 506.1-B); <b>plasma</b> kahe sagedusega taastab süstitud viivituse täpsusega ≪ { "1" } %; ning <b>Shapiro</b> viivitus jääb avaldatud ~{ "100" }–{ "250" } µs Maa–Marsi konjunktsiooni vahemikku. Avaldatud arvud on esitatud ja märgistatud <b>suurusjärgu</b> DSN-i spetsifikatsioonidena, mitte väljamõeldud täpsete arvudena, ning mooduli dokumentatsioon ütleb selgelt, et see bench hindab MUDELI TÄPSUST, mitte tegeliku seansi reprodutseerimist (see on D2 + tegelik TDM).

# text
# c1: src/deepspace_od.rs
# c2: src/clock_state.rs
# c3: src/mars_atmos.rs
seg-2a25e6a8a5b1 = Kauge kosmose redutseeritud dünaamikaga OD — D2 (<c1/>, <c2/>, <c3/>)

# text
# c1: xval/anise-mars-od
seg-0d7a1b75a0ea = Kauge kosmose navigatsioonimootori kolmas verstapost: <b>hindaja</b>, mis muudab D1 radiomeetrilised vaadeldavad taastatud trajektooriks — arvuliselt töökindel ruutjuure informatsioonifilter (SRIF) redutseeritud dünaamikaga empiiriliste kiirendustega, kolme olekuga pardakell, Marsi õhutakistuse mudel ja radiomeetrilised mõõteosatuletised, mis seovad vahemaa/Doppleri filtri olekuga, suletud otsast otsani sünteetilise madala Marsi orbiidi (LMO) orbiidi määramise taastamisega. <b>Aus ulatus:</b> taastamine on <b>sünteetiline suletud ahel</b> (tõel ja filtril on sama Marsi levitaja ning vaatlused on sama geomeetriline vaadeldavate mudel, mida filter pöörab, pluss süstitud Gaussi müra) — see valideerib <b>hindaja mehhanismi</b>, mitte Marsi jõumudeli absoluutset täpsust; DE-klassi väline ristkontroll on tuumast sõltuv <c1/> pakett (D0.8b). Kõik allolev on lisanduv (reprodutseeritavuse etalontulemused on muutumatud; sama SHA, taasgenereerimist ei ole).

# text
seg-51f203291066 = SRIF-i tuum (ruutjuure informatsioonifilter)

# text
# c1: Srif
# c2: R
# c3: Λ = RᵀR
# c4: b
# c5: Vec<f64>
# c6: gauss_newton
# c7: srif_matches_batch_on_linear
# c8: P = R⁻¹R⁻ᵀ
# c9: srif_covariance_is_spd
# c10: P
seg-9d5fd8c1d37d = <c1/>: käsitsi kirjutatud Biermani ruutjuure informatsioonifilter — ülemine kolmnurkne <c2/> koos <c3/>, infovektor <c4/>, Householderi mõõte-/ajauuendused, paljas <c5/> aritmeetika (nalgebrat ei ole). Testid: järjestikune SRIF ühtib paketi kaalutud vähimruutude (<c6/>) lahendiga <b>nii olekus kui kovariatsioonis täpsusega { "1e-9" }</b> kavandatud lineaarse Gaussi ülesande korral (<c7/>); taastatud kovariatsioon <c8/> on pärast pikka mõõte-/ajauuenduste jada <b>sümmeetriline ({ "1e-12" }) ja konstruktsiooni poolest positiivselt määratud</b> (<c9/>, Choleski õnnestub); ning informatsioon koguneb (<c10/> jälg väheneb monotoonselt, kui identse geomeetriaga mõõtmisi sisse voldida).

# text
seg-f9ffa1ef4688 = Redutseeritud dünaamikaga empiirilised kiirendused (kruiis↔LMO häälestamine)

# text
# c1: ReducedDynamicOd
# c2: [r; v; a_emp]
# c3: dynamic_tightness
# c4: reduced_dynamic_tracks_maneuver
# c5: tuning_is_a_continuum
seg-b0612a7140c3 = <c1/>: üheksa olekuga <c2/> filter RTN empiiriliste kiirendustega esimese järgu Gauss–Markovi protsessi olekutena, JPL/ESOC redutseeritud dünaamika tehnika, mis on avatud ühe <c3/> regulaatorina (peaaegu dünaamiline ⇒ silub müra ballistilisel kaarel; peaaegu kinemaatiline ⇒ empiiriline tase neelab modelleerimata manöövri/õhutakistuse). Testid: peaaegu kinemaatiline filter jälgib <b>astmelist (tõukuri) manöövrit</b> <½ jäägiga võrreldes peaaegu dünaamilisega, samal ajal kui peaaegu dünaamiline filter <b>silub müraka ballistilise kaare</b> paremini (<c4/>); tihedusastme pühkimine liigutab sobitusjärgset jääki <b>monotoonselt</b>, pidev skaala, mitte lüliti (<c5/>).

# text
seg-9d5db4d63990 = 3-olekuline pardakell (faas/sagedus/triiv, van Loani Q, Alan)

# text
# c1: ClockState3
# c2: Q
# c3: T⁵
# c4: Q/R
# c5: ClockClass
# c6: σ_y(1 s)
# c7: Δv = c·σ_y
seg-fe5beef74e24 = <c1/>: faasi + suhtelise sageduse + sageduse triivi veaolek koos <b>täpse van Loani diskreetse protsessimüraga</b> ja Josephi stabiliseeritud uuendusega. Testid: diskretiseeritud <c2/> ühtib käsitsi tuletatud van Loani polünoomiga <b>täpsusega { "1e-12" }</b> ning <b>taandub täpselt kahe olekuga KalmanClocki Q-ks, kui triiv = { "0" }</b> (range ülemhulk); mitmesammuline vabajooks kasvatab faasi dispersiooni analüütilise NIST SP { "1065" } holdover-i (aja hoidmine ilma välise etalonita) seoseni läbi <c3/> juhusliku jooksu liikme; triivi olek <b>taastab tõelise vananemisrambi täpsusega <{ "5" } %</b>; <b>USO-klassi Alani profiil taastatakse</b> (kattuv ADEV hetkel τ={ "1" } s kalibreerimisväravas) ja hindaja jääb NEES-kooskõlliseks (>{ "95" } % 3σ sees) ning PSD-ks läbi karmi-<c4/> käituse. <c5/> kannab viidatud CSAC/USO/DSAC (USO: ultra-stable oscillator; DSAC: Deep Space Atomic Clock) <c6/> arve ja <c7/> Doppleri põhja.

# text
seg-8666d18daa2b = Marsi atmosfäärihõõrdumine (Mars-GRAM-lite (GRAM: Global Reference Atmospheric Model))

# text
# c1: src/mars_atmos.rs
# c2: ..._scaled
seg-6a64c2b9e553 = <c1/>: tükiti eksponentsiaalne Marsi neutraaltiheduse profiil (pind ~{ "0.020" } kg/m³, pinnalähedane skaalakõrgus ~{ "11" } km, Mars-GRAM { "2010" } / MCD (Mars Climate Database) vähese tolmu keskmine) ja ruutkiirendus õhutakistusele, võetuna <b>kaaspöörleva</b> Marsi atmosfääri suhtes, pluss <c2/> variant, mida SRIF saab kordistada. Testid: tihedus väheneb monotoonselt ja pidevalt üle vööndite, taastatud pinnalähedane skaalakõrgus on füüsikaline ~{ "11" } km, õhutakistus on <b>rangelt suhtelise kiirusega vastassuunaline</b> (ristkorrutis kaob täpsusega { "1e-12" }) mõistliku ~{ "3e-4" } m/s² LMO suurusjärguga ning on lineaarne ballistilise liikme suhtes. <b>Aus ulatus:</b> esinduslik inseneriatmosfäär, mitte lennul valideeritud Mars-GRAM/MCD tolmu/aastaaja/kohaliku aja sõltuvusega.

# text
seg-452f32dace80 = Radiomeetrilised mõõteosatuletised (vahemaa/Doppler) SRIF-i jaoks

# text
# c1: range_observable
# c2: range_rate_observable
# c3: ρ = |r_sc − r_sta|
# c4: ρ̇ = û·(v_sc − v_sta)
# c5: ∂ρ̇_obs/∂y = c
# c6: range_partial_matches_finite_difference
# c7: range_rate_partials_match_finite_difference
# c8: radiometric_update_reduces_covariance_in_observed_direction
# c9: range_rate_update_observes_velocity
seg-6661d241cdaf = <c1/> / <c2/>: vaatejoone vahemaa <c3/> (∂ρ/∂r = û, ∂ρ/∂v = { "0" }) ja vahemaakiiruse <c4/> (∂ρ̇/∂v = û, ∂ρ̇/∂r = (v_rel − ρ̇·û)/ρ) osatuletised, mis seovad D1 vaadeldavad filtri olekuga, pluss ühe tee Doppleri kell-sageduse osatuletis <c5/>. Testid: mõlemad osatuletised ühtivad <b>vaadeldava tsentraalse lõplike vahede meetodiga täpsusega { "1e-6" }</b> (<c6/>, <c7/>); üksik vahemaauuendus <b>vähendab kovariatsiooni vaadeldavas (vaatejoone, LOS) suunas ≫{ "1000" }×</b> ja hoiab selle positiivselt määratuna (PD), ning Doppleri uuendus vähendab LOS-i <b>kiiruse</b> dispersiooni (<c8/>, <c9/>).

# text
seg-9a2cb6292477 = Mars-LMO otsast otsani OD radiomeetrilistest andmetest

# text
# c1: tests/mars_lmo_od.rs
# c2: Body::mars_gmm3(4)
# c3: xval/anise-mars-od
seg-6318968b683a = <c1/>: <c2/> gravitatsiooni all levitatud tõene madala Marsi orbiidi kaar genereerib mürase kahe tee <b>vahemaa (σ={ "1" } m) + Doppleri (σ={ "0.1" } mm/s)</b> kahele jälgimisjaamale; redutseeritud dünaamikaga SRIF taastab selle <b>~{ "2.7" } km häiritud</b> algolekust. Saavutatud: koondunud positsiooni <b>RMS ≈ { "0.2" } m</b> (alla meetri, selgelt meetrite-kuni-kümnete-meetrite lõpetamiskriteeriumi sees) 3-orbiidilisel, { "30" } s taktiga kaarel, kusjuures <b>faktoriseeritud kovariatsioon on igal epohhil positiivselt määratud</b> (SRIF-i garantii, kinnitatud kogu käigus). <b>Kruiis→LMO häälestuse pidevus</b> on käitatud otsast otsani: modelleerimata õhutakistusega tõe korral, mida filtri mall ei sisalda, taastab redutseeritud dünaamikaga regulaator (tihedusaste { "1" }) ~{ "14" } m täpsusega vs ~{ "677" } m peaaegu dünaamilise (tihedusaste { "0" }) käituse korral — { "48" }× paranemine tänu empiirilisele tasemele, mis neelab õhutakistuse. <b>Aus ulatus:</b> sünteetiline suletud ahel (tõde = sama levitaja, mida filter kasutab); DE-klassi väline ristkontroll on tuumast sõltuv <c3/> (D0.8b), mida siin kunagi ei käitata, võrku ei ole.

# text
# c1: src/mars_pnt.rs
# c2: src/deepspace_od.rs
seg-559176eb1a82 = Kauge kosmose PNT stsenaarium ja ühe tee + kahe tee liitmine — D3 (<c1/>, <c2/>)

# text
# c1: mars-pnt
seg-bdb5da496071 = Kauge kosmose navigatsioonimootori neljas verstapost: käitatav <b>Marsi PNT toote stsenaarium</b>, mis seob D0 Marsi keha / tugisüsteemi, D1 radiomeetrilised vaadeldavad ja D2 redutseeritud dünaamikaga OD-i üheks <c1/> stsenaariumi liigiks. See modelleerib väikest <b>MARCONI-stiilis relee konstellatsiooni</b>, mis edastab ühe tee (kellaga seotud) signaali kosmoses ning relee kahe tee (koherentse, kellavaba) lingi kauge kosmose jaamale, ning navigeerib kolme etalonkasutajat (Marsi siire, madala Marsi orbiidi orbiiter, fikseeritud pinnapunkt) läbi <b>D3.1 ühiselt ühe tee + kahe tee liitmise hindaja</b> — kaheteistkümne olekuga SRIF, mis täiendab D2 redutseeritud dünaamikaga orbiidi/empiirilist plokki kolme olekuga pardakellaga. <b>Aus ulatus:</b> iga näitaja (FoM) on hindaja <b>formaalne kovariatsioonipiir</b> (epohhipõhine 1σ / 3σ positsioon) ja saavutatud RMS <b>sünteetilise suletud ahela</b> tõe vastu (tõel ja filtril on sama Marsi dünaamika ja sama geomeetriline vaadeldavate mudel, pluss süstitud Gaussi müra) — simuleeritud navigatsiooni FoM, <b>MITTE</b> lennunduses sertifitseeritud kaitsetase ja <b>MITTE</b> lennu väide (sertifitseeritud rikkemudelit, terviklikkuse monitori ega tegelikke jälgimisandmeid ei ole). Kõik allolev on lisanduv (reprodutseeritavuse etalontulemused on muutumatud; sama SHA, taasgenereerimist ei ole).

# text
seg-b81920d2df82 = Ühine ühe tee + kahe tee radiomeetriline liitmine (liidetud võidab kumbagi üksi)

# text
# c1: FusionOd
# c2: ClockState3
# c3: ∂ρ̇_obs/∂y = c
# c4: fused_observable
# c5: src/deepspace_od.rs
# c6: #[cfg(test)]
seg-cd9d2a7dd08f = <c1/>: D2.2 redutseeritud dünaamikaga SRIF, täiendatud kolme pardakella olekuga (<c2/>), võttes sisse <b>kahe tee</b> (kellavaba, orbiiti fikseeriv — osatuletises nullkella veerud) ja <b>ühe tee</b> (kellaga seotud — <c3/> sageduse osatuletis) vahemaa/Doppleri segajada funktsiooni <c4/> kaudu. Kalibreeri-siis-vabajooks struktuur: kahe tee seansid fikseerivad orbiidi, ühe tee andmed kalibreerivad seejärel kella ja hoiavad orbiiti seansside vahel vabajooksus veaga, mida piirab kella Alani stabiilsus. Testitud failis <c5/> <c6/>: <b>liidetud</b> lahend võidab <b>kumbagi lingi tüüpi üksi</b>; ainult ühe tee käituse vabajooksu viga kasvab kahe tee seansside vahelise pausiga kooskõlas kellaklassi Alani piiriga; ühine kovariatsioon jääb SPD (sümmeetriline positiivselt määratud) kogu aeg.

# text
seg-26a4bfa8e6ad = MARCONI konstellatsioon (areostatsionaarne raadius, varjutus)

# text
# c1: MarconiConstellation
# c2: r = (μ/ω²)^{1/3} ≈ 20 428 km
# c3: mars_gmm3
# c4: chord_clears_sphere
seg-f2c2e1b83411 = <c1/>: viiest releest koosnev komplekt — kolm <b>areostatsionaarset</b> releed kohas <c2/> (Marsi sünkroonne raadius avaldatud μ/pöörlemiskiirusest; testitud <b>{ "20 400" }–{ "20 500" } km</b> vahemikus), mis on pikkuskraadil võrdselt { "120" }° vahedega ja { "5" }° kaldega, pluss kaks releed kõrgemal ({ "1.4" }× areostatsionaarne) { "60" }°-kaldega ringorbiidil taevatasandi katvuse jaoks. Epohhipõhised releeolekud integreeritakse edasi <c3/> gravitatsiooni all; <b>Marsi varjutuse</b> nähtavustest on kõõlu-läbib-sfääri geomeetria (<c4/>, testitud: diametraalselt vastasasuv relee on varjatud, ülalolev relee on nähtav). <b>Aus ulatus:</b> minimaalne esinduslik edastus-pluss-relee geomeetria, ehitatud avaldatud Marsi konstantidest — mitte konkreetne lennu konstellatsiooni kavand.

# text
# c1: mars-pnt
seg-b53ea4dd9f7d = <c1/> stsenaarium kättesaadav CLI / Pythoni / WASM-i (WebAssembly) / MCP (Model Context Protocol) kaudu

# text
# c1: MarsScenario
# c2: run_mars_pnt
# c3: kind = "mars-pnt"
# c4: src/api.rs
# c5: mars_pnt_kind_round_trips_through_the_dispatch
# c6: scenarios/mars-pnt-lmo.toml
# c7: scenarios/mars-pnt-surface.toml
# c8: scenarios/mars-pnt-transfer.toml
# c9: fom_note
# c10: summary
# c11: to_svg
seg-3a01d13ad2e7 = <c1/> / <c2/> on ühendatud kui <c3/> stsenaarium kõigil pindadel (D3.3): CLI käivitaja, Pythoni sidumine, WASM-i/mänguväljaku ehitus ja MCP serveri jaotaja suunavad kõik selle poole (<c4/> edasi-tagasi test <c5/>). Tarnitud etalonstsenaariumid: <c6/>, <c7/>, <c8/>. Tulemus kannab selget <c9/>, mis sildistab FoM-i kovariatsioonipiiriks (mitte sertifitseeritud PL), ning väljundid <c10/> / <c11/> kordavad aususe märgistust.

# text
seg-28a49a455a74 = MARCONI / LightShip sihid reprodutseeritud: <b>< { "100" } m orbiiter</b>, <b>< { "15" } m rover</b>

# text
# c1: tests/mars_pnt_targets.rs
seg-28da71940857 = <c1/>: avaldatud MARCONI / LightShip programmi eesmärgid (orbiiter < { "100" } m, pind/rover < { "15" } m) reprodutseeritud simulatsioonis. <b>Ühised eeldused:</b> viiest releest koosnev vaikimisi MARCONI konstellatsioon; iga nähtavas olev relee annab epohhi kohta ühe tee vahemaa+Doppleri; koherentne kahe tee jaamaseanss iga <b>{ "30" } min</b> järel; DSN-klassi müra (<b>vahemaa σ = { "1" } m, Doppler σ = { "0.1" } mm/s</b>); ühine redutseeritud dünaamikaga orbiidi + 3-olekulise kella liitmise filter, mille algväärtus (seed) on <b>~{ "2.7" } km</b> häiritud eelinfo olek (tihedusaste { "0.1" }); FoM = koondunud kaare tagumise poole 3-D positsiooni RMS vs sünteetiline tõde. <b>Orbiiter</b> (LMO ~{ "400" } km / { "60" }° kalle, <b>USO</b> kell, { "60" } s takt, ~{ "2" } h ≈ ühe orbiidi kaar): saavutatud koondunud RMS <b>≈ { "0.40" } m</b> ≪ { "100" } m siht (keskmiselt { "3.1" } releed nähtaval, kovariatsioon SPD kogu aeg). <b>Rover</b> (fikseeritud ekvatoriaalne pinnapunkt, <b>USO</b> kell, { "30" } s takt, ~{ "2" } h kaar): saavutatud koondunud RMS <b>≈ { "5.1" } m</b> < { "15" } m siht (keskmiselt { "3.0" } releed nähtaval, kovariatsioon SPD). <b>Mõlemad sihid täideti ühtki kinnitust lõdvendamata</b> — USO on realistlikest pardakellaklassidest <em>vähem</em> võimekas (DSAC ainult aitaks) ja 30-minutiline kahe tee takt on tavapärase releevõrgu ajakava jaoks konservatiivne, seega on eeldused füüsikaliselt õiglased MARCONI-klassi süsteemi jaoks, mitte läbimiseks häälestatud. <b>Aus ulatus:</b> simuleeritud reprodutseerimine esitatud eelduste all, MITTE lennu väide ega sertifitseeritud kaitsetase; sünteetiline suletud ahela tõde jagab filtriga sama Marsi dünaamikat ja vaadeldavate mudelit.

# text
# c1: src/lunar_time.rs
seg-37b2bad62854 = Kuu koordinaataeg — relativistlik Maa–Kuu kella käigu kiirus (<c1/>)

# text
# c1: src/lunar_time.rs
# c2: L_G
# c3: W0 = L_G·c² ≈ 6.26369e7 m²/s²
# c4: GM_moon/R_moon ≈ 2.822e6 m²/s²
# c5: −<v²>/2c²
# c6: src/ephem.rs
# c7: lunar-time-offset
seg-787705fa0fac = Kuu koordinaataja skaala (LTC/TCL (TCL: Temps-Coordonnée Lunaire, Kuu koordinaataja prantsuskeelne nimi)) nõuab sekulaarset kiirust, millega Kuu pinna kell käib Maa geoidi (TT) kella suhtes. <c1/> arvutab selle esimestest printsiipidest: esimese post-Newtoni samasus, mis liidab <b>omapotentsiaali erinevuse</b> (IAU <c2/> tavapärane geoidi potentsiaal <c3/> miinus Kuu pinna omapotentsiaal <c4/>) ja <b>kineetilise (teist järku Doppleri) liikme</b> <c5/> geotsentrilisest Kuu kiirusest (lõplike vahedega failis <c6/> olevast Montenbruck-Gilli Kuu reast). Domineeriv omapotentsiaali liige annab <b>≈ { "57.5" } µs/ööpäevas</b>, kineetiline liige <b>≈ −{ "0.5" } µs/ööpäevas</b>, kokku <b>≈ { "57" } µs/ööpäevas</b>. Stsenaarium <c7/> teatab selle kiiruse, kogunenud LTC−TT nihke horisondi ulatuses ning toetab minimaalset pöördvariatsiooni ansamblit (Kuu paberkell); TT↔LTC teisendused on edasi-tagasi täpsusega < { "1" } ns/ööpäevas.

# text
seg-beeb6561ef6b = Sõltumatu etalon / aus ulatus

# text
seg-4500e65ede97 = Relativistlik Maa–Kuu kella käigu kiirus (LTC/TCL)

# text
# c1: lunar_rate_breakdown
# c2: tt_to_ltc
# c3: ltc_to_tt
# c4: lunar_ensemble
# c5: LunarTimeScenario
# c6: L_G
# c7: lunar_time::tests
# c8: W0
# c9: Modelled
seg-4c7a29bc3003 = <c1/>, <c2/>/<c3/>, <c4/>, <c5/>. <b>Oraakel (sõltumatu etalon): sisemine suletud kujul relativistlik samasus</b> (IAU <c6/> / IERS-i konventsioonide geopotentsiaal ja GM/r (GM: gravitatsiooniparameeter, G korrutatud massiga) omapotentsiaal), <b>ristkontrollitud avaldatud Kuu kella käigu kiiruse vahemiku [{ "56" }, { "59" }] µs/ööpäevas vastu</b>. Testid (<c7/>): omapotentsiaali liige ≈ { "57.5" } µs/ööpäevas, Kuu kiirus ≈ { "1" } km/s, kineetiline liige väike negatiivne, kogusumma vahemikus nimetatud liikmete summana, 1-päevane LTC−TT nihe ≈ { "57" } µs ning < { "1" } ns/ööpäevas TT↔LTC edasi-tagasi teisendus. <b>Aus ulatus:</b> põhiline µs/ööpäevas arv on <b>etalonist sõltuv</b> — see sõltub valitud etalonpindadest (Maa geoid <c8/> vs Kuu selenoid), ajalise keskmistamise aknast ning tähelepanuta jäetud alla µs/ööpäevas tsentrifugaal-/J₂ parandustest — mistõttu avaldatud väljund on <b>vahemik</b>, mitte üksainus sertifitseeritud arv. See on <c9/> sisemise kooskõla kontroll, <b>MITTE</b> väline valideerimine, <b>MITTE</b> alla nanosekundi absoluutne täpsus ja <b>MITTE</b> sertifitseeritud operatiivseks ajahoidmiseks.

# text
# c1: src/lunar_vlbi.rs
seg-b4e3228c84b8 = Kuu geodeetiline VLBI — lähivälja viivitus Maa baasjoonele, mis vaatleb Kuu majakat (<c1/>)

# text
# c1: tau_geom = (|r2 − r_B| − |r1 − r_B|)/c
# c2: src/radiometric.rs
# c3: src/frames.rs
# c4: src/cio.rs
# c5: src/ephem.rs
# c6: src/lunar.rs
# c7: src/lunar_frame.rs
# c8: lunar-vlbi
seg-bbb634953ebf = Geodeetiline VLBI (very-long-baseline interferometry) vaadeldav kahele Maa maajaamale (baasjoon), mis vaatlevad Kuu pinnal asuva NovaMoon-klassi saatja ühe tee signaali. Kuu on <b>lähiväljas</b>, mitte tasalaine, seega on geomeetriline viivitus täpne kahe vahemaa vahe <c1/>, mitte taevatasandi projektsioon. Täielik vaadeldav lisab jaamakellade nihke vahe ja diferentseeritud Maa potentsiaali Shapiro liikme (taaskasutatud failist <c2/>). Jaamad paigutatakse geotsentrilistesse inertsiaalsetesse (GCRS) koordinaatidesse failide <c3/> + <c4/> kaudu; majakas failide <c5/> (geotsentriline Kuu) + <c6/> (selenograafiline→MCMF (MCMF: Moon-centred, Moon-fixed)) + <c7/> (IAU-2015 ME kehaga seotud→inertsiaalne) kaudu. Stsenaarium <c8/> valib viivituse, selle lõplike vahede kiiruse ja lähivälja parandi seansi ulatuses.

# text
# c1: delta_dor
# c2: src/radiometric.rs
# c3: −(B·ŝ_B)/c = delta_dor(r_B, [0,0,0], B)
# c4: dtau/dr_B = ((r_B−r2)/|r_B−r2| − (r_B−r1)/|r_B−r1|)/c
seg-b2b758337ebc = <b>Oraakel (sõltumatu etalon)</b> on sama koodibaasi tasalaine Δ-DOR vaadeldav <c1/> failis <c2/>: kauge välja piiris (sünteetiline majakas kaugusel { "1e15" } m) peab geomeetriline viivitus taanduma väärtuseks <c3/> masinatäpsuseni; tegeliku Kuu kauguse korral on lainefrondi kõveruse lähivälja paranduses nullist erinev (kümneid kuni sadu µs). Majaka osatuletised <c4/> (ja jaama osatuletised) kontrollitakse tsentraalse lõplike vahede meetodiga (suhteline viga < { "1e-5" }).

# text
seg-107b9d328f69 = Kuu geodeetiline VLBI viivitus + osatuletised

# text
# c1: geometric_delay_s
# c2: vlbi_delay_s
# c3: delay_partials_beacon
# c4: _station1
# c5: _station2
# c6: near_field_correction_s
# c7: LunarVlbiScenario
# c8: ReferenceImpl
# c9: delta_dor
# c10: src/radiometric.rs
# c11: lunar_vlbi::tests
# c12: delta_dor
# c13: run_toml
# c14: Modelled
# c15: xp = yp = 0
# c16: jd_tdb ≈ jd_tt
seg-acee0ad60cf4 = <c1/>, <c2/>, <c3/>/<c4/>/<c5/>, <c6/>, <c7/>. <b>Oraakel (sõltumatu etalon): <c8/></b> — sama koodibaasi tasalaine <c9/> (<c10/>) kauge välja piiris, pluss <b>lõplike vahede osatuletised</b>. Testid (<c11/>): jaama suurus ≈ Maa raadius, majaka kaugus Kuu kaugusel ({ "356" }–{ "407" } Mm), kauge välja geomeetriline viivitus ühtib funktsiooniga <c12/> täpsusega < { "1e-9" } s, nullist erinev lähivälja parand Kuu kaugusel, FD majaka/jaama osatuletised { "1e-5" } suhtelise täpsuse piires, täpne kella liige ning lõplik stsenaariumi käitus, mis jaotatakse funktsiooni <c13/> kaudu. <b>Aus ulatus:</b> <c14/>, <b>MITTE</b> valideeritud tegelike VLBI andmete vastu. Poolusliikumine jäetakse välja (<c15/>), seega kannavad jaamade inertsiaalsed positsioonid mõne meetri suuruse tugisüsteemi vea; majakas segab kuupäeva keskmise ekvaatoriga Kuu rida ICRF-i (International Celestial Reference Frame) kehaga seotud nihkega (<c16/>), tugisüsteemi kooskõla lahknevus on allpool mudeli täpsust, kuid mitte range; ning valgusaja iteratsiooni, Maa pöörlemist valgusaja jooksul, keskkonna (tropo/iono/plasma) ega aberratsiooni liiget peale diferentseeritud Shapiro ei ole. TRL-i (technology readiness level), lennu pärandit ega ametkonna heakskiitu ei väideta. { "0.30" }: ANISE valgusaegade vastu läbi DE440 ei ole selle analüütilise tee ükski viivitus { "1" } ps piires (suurim lõhe { "24" } µs); tulemus on fikseeritud.

# text
# c1: KernelGeometry
# c2: lunar-vlbi
seg-d90c67f098f7 = <c1/> (DE440 Maa ja Kuu, DE440 Kuu peatelge, ITRF93 Maa orientatsioon, iga valgusaeg koondatud barütsentrilises tugisüsteemis), mida käitab stsenaarium <c2/>, kui kolm tuuma teed on seatud. <b>Oraakel (sõltumatu etalon): teek</b> — NAIF SPICE Toolkit N0067 (spiceypy { "8.2.0" }) koondatud valgusajad DSS-14/43/63-ni, eelregistreeritud: { "75" } viivitust { "1" } ps piires (halvim { "0.06" } ps), majaka ja jaama osatuletised { "1e-6" } piires, { "25" } epohhil J2000 lähedal (muudatus pärast seda, kui { "2024" } epohhi ebaõnnestusid SPICE enda kahekordse täpsusega emissiooni epohhil, umbes { "6" } ps, avalikustatud ja fikseeritud). Stsenaariumi diferentseeritud Shapiro liiget, viivituse kiirust ja lähivälja parandit ei võrrelda.

# text
# c1: src/lunar_combination.rs
seg-8bed75c5402d = Kuu ühine mitmetehnikaline OD + kell — simuleeritud suletud ahela taastamine (<c1/>)

# text
# c1: crate::batch_ls::gauss_newton_qr
# c2: src/lunar_vlbi.rs
# c3: [station_pos(3), {sat_pos(3)}×N_sat, station_clk, {sat_clk}×N_sat]
# c4: lunar-joint-od-clock
seg-d518eead07c4 = Ühe epohhi (hetktõmmise) paketi vähimruutude sobitus (<c1/>, Householderi QR samm alates { "0.30" }), mis <b>liidab geodeetilise VLBI, radiomeetrilise/Kuu-kohaliku vahemaamõõtmise ja satelliitidevahelise vahemaamõõtmise tehnikad</b> SIMULEERITUD Kuu võrgus, et taastada <em>koos</em> Kuu pinna jaama 3-D positsioon, väikese konstellatsiooni satelliitide positsioonid ja iga vahendi kella nihe. Vaadeldavad on: ({ "1" }) Maa baasjoone geodeetilise VLBI viivitused Kuu jaamale, mida käsitletakse majakana (taaskasutades faili <c2/>, geotsentriline inertsiaalne) — põhitehnika; ({ "2" }) Maa jaam→satelliit geotsentrilised radiomeetrilised vahemaad (mis multilateratsiooniga määravad konstellatsiooni hästi hajutatud Maa jaamadest) ja jaam↔satelliit Kuu-kohalikud vahemaad (MCI (Moon-centred inertial) eukleidiline kaugus pluss diferentseeritud kella liige); ({ "3" }) satelliitidevahelised vahemaad (sama kuju); pluss üks jaamakella sünkroniseerimise pseudovaatlus, mis ankurdab muidu vaadeldamatu ühise kella nihke. Olekuvektor on <c3/>. Lahendaja sees <b>jõumudeli levitamist ei ole</b> — satelliidid on fikseeritud, erinevad, illustratiivsed punktid esinduslikul Kuu orbiidil; see on tahtlikult puhas hetktõmmise sobitus. Sisemiselt skaleeritakse positsioonid ja kellad hinnatakse vahemaaekvivalentsetes meetrites, nii et normaalmaatriks jääb f64-s hästi tinglikuks; VLBI ja Kuu kauguse vahemaadelt eemaldatakse keskmine nominaalse geomeetria ümber, nii et lõplike vahede Jacobi maatriks ei kannata katastroofilise kaotuse all. Stsenaarium <c4/> käitab lahenduse VLBI haruga ja ilma sama algväärtuse (seed)/tõega ning teatab mõlemad lahendid pluss jaama jälgitavuse paranemise teguri.

# text
# c1: vlbi_restores_station_observability
seg-f634e976b583 = <b>Peamine aus tulemus</b>: Kuu-kohalik vahemaamõõtmine polaarjaamast käputäiele satelliitidele, mis kõik asuvad taeva ühel poolel, jätab jaama positsiooni <b>nõrgalt vaadeldavaks ühes suunas</b>, seega on ainult vahemaa lahend halvasti tingitud ja taastatud jaama 3-D viga on suur (või lahend ei koondu). <b>Maa baasjoone VLBI viivituste lisamine muudab jaama täieliku 3-D positsiooni vaadeldavaks</b> ja taastatud jaama viga langeb meetritasemele. Test <c1/> kinnitab, et VLBI-ga jaama viga on märgatavalt (≥{ "5" }×) väiksem kui ainult vahemaa viga identse süstitud tõe korral — muidu vaadeldamatu jaama suuna taastamine VLBI-ga on selle faasi mõte.

# text
# c1: 1/σ²
# c2: Δxᵀ(HᵀWH)Δx
# c3: formal_covariance_nees
# c4: n_params
seg-d5feea2381b7 = <b>Oraakel (sõltumatu etalon)</b> on sisemine kooskõla: süstitud tõene olek (jaam ~{ "50" } m/telje kohta, satelliidid ~{ "30" } m/telje kohta, kellad ~{ "1e-7" } s, algväärtusega (seed) komponendipõhise värinaga) kujutatakse sünteetilisteks vaadeldavateks <em>sama</em> geomeetriamudeli kaudu, mida lahendaja pöörab, lisatakse algväärtusega (seed) Gaussi müra (illustratiivsed vaikeväärtused: VLBI σ ≈ { "1e-11" } s, vahemaa σ ≈ { "0.1" } m, ISL σ ≈ { "0.1" } m; kaalud <c1/>) ja hindaja peab taastama süstitud tõe müra piires nullide algsest oletusest. Monte Carlo keskmine NEES <c2/> algväärtuste (seed) lõikes (<c3/>) jääb lõdva vahemiku sisse suuruse <c4/> ümber, kovariatsiooni realismi kontroll.

# text
# c1: validated
seg-abc40f1f301a = <c1/> ({ "0.30" }, P2: lahendi lineaaralgebra)

# text
# c1: estimate
# c2: formal_covariance_nees
# c3: LunarCombinationScenario
# c4: tests/lunar_joint_od_numpy_oracle.rs
# c5: InternalConsistency
# c6: lunar_combination::tests
# c7: n_params
# c8: run_toml
seg-87de27c2421a = <c1/>, <c2/>, <c3/>. <b>{ "0.30" } oraakel (sõltumatu etalon): P2</b> — numpy { "2.4.6" } (LAPACK gelsd ja inv) arvutab uuesti iga Gauss-Newtoni sammu, koondunud kaalutud lahendi, formaalsed sigmad ja jaama vea kuue võrgu sisseviidud Jacobi maatriksitel (<c4/>, sammud { "2.4e-11" } piires, sigmad { "1.3e-11" } piires); füüsikalised vaatlusmudelid ja suurusjärgud jäävad MODELLED-iks. <b>Varasem sõltumatu etalon: <c5/></b> — süstitud simuleeritud tõe taastamine + NEES kovariatsiooni kooskõla. Testid (<c6/>): täielik liitmine taastab tõe (jaam < { "5" } m, sat RMS < { "5" } m, kellad < { "1e-8" } s, koondunud); VLBI taastab jaama 3-D vaadeldavuse (jaama viga ≥{ "5" }× väiksem VLBI-ga kui ainult vahemaaga samal tõel); deterministlik (sama algväärtus (seed) → bitt-identne lahend, erinev algväärtus (seed) → erinev, kuid taastatud); keskmine NEES lõdva vahemiku sees suuruse <c7/> ümber; lõplikud/kaitstud teatatud arvud ka siis, kui ainult vahemaa on halvasti tingitud; stsenaarium jaotatud funktsiooni <c8/> kaudu. <b>Aus ulatus:</b> see on <b>simuleeritud suletud ahela taastamine</b> — tõel on vaatlusmudel ühine — <b>MITTE</b> tegelike andmete valideerimine; lahendaja sees jõumudeli levitamist ei ole; satelliitide positsioonid ja Maa/Kuu jaama geomeetria on illustratiivsed. TRL-i, lennu pärandit ega ametkonna heakskiitu ei väideta.

# text
# c1: src/lunar_frame_realise.rs
seg-7620f3a821f6 = Kuu tugisüsteemi realiseerimine — 7-parameetriline Helmerti datumi sobitus (<c1/>)

# text
# c1: src/lunar_frame.rs
# c2: p_i
# c3: q_i
# c4: q_i = t + (1 + s)·R(θ)·p_i
# c5: R(θ) = rz(θz)·ry(θy)·rx(θx)
# c6: crate::precession::{rx, ry, rz, matmul, mat_vec}
# c7: [tx, ty, tz, θx, θy, θz, s]
# c8: crate::batch_ls::gauss_newton
# c9: q_i
# c10: p_i
# c11: z
# c12: 1/σ²
# c13: x0 = zeros
# c14: icrf_orientation_tie
# c15: transpose(crate::lunar_frame::icrf_to_iau_moon(jd_tdb))
seg-240271b9d7de = Kui <c1/> <em>rakendab</em> IAU { "2015" } WGCCRE Kuu keha orientatsiooni (otsemudel), siis see moodul <em>hindab</em> (realiseerib) Kuu tugisüsteemi datumiga seotud hinnatud punktikoordinaatide võrgust. Hindamise tuum on klassikaline <b>7-parameetriline sarnasus- (Helmerti) teisendus</b> — kolm nihet, kolm väikese nurga pööret ja üks skaalaparameeter — kujutades punktid <c2/> (hinnatud tugisüsteem) punktideks <c3/> (datumi tugisüsteem) kujul <c4/>, kus <c5/> on ehitatud funktsioonist <c6/>. Seitse parameetrit <c7/> hinnatakse ≥ { "3" } mittekollineaarsest punktipaarist kaalutud vähimruutudega funktsiooni <c8/> kaudu: otsemudel ennustab iga <c9/> väärtuse <c10/>-st ja lamendab kõigi punktide kõik kolm komponenti vaadeldavate vektoriks, vaadeldud datumi koordinaadid moodustavad <c11/>, kaalud on <c12/> ja lahendus algab väärtusest <c13/>. Pöördenurki hinnatakse µrad-des ja skaalat ppb-des, nii et lõplike vahede Jacobi maatriks jääb Kuu pinna koordinaadi suurusjärgus (~{ "1.7e6" } m) hästi skaleerituks. Väike <c14/> komponeerib realiseeritud väikese pöörde läbi IAU keha→ICRF orientatsiooni (<c15/>) ja tagastab realiseeritud tugisüsteemi jääkse väikese nurga nihke ICRF-i telgede ümber — tahtlikult lihtne väljenduse tugisüsteemi muutus, <b>mitte</b> Kuu pooluse sõltumatu hinnang.

# text
# c1: lunar-frame-realisation
seg-75769fc9671c = <b>Oraakel (sõltumatu etalon)</b> on sisemine kooskõla: teadaolev Helmerti teisendus (nihe ~kümneid m, pööre ~µrad, skaala ~{ "1e-7" }) <em>süstitakse</em> hästi hajutatud sünteetilisse punktivõrku (varieeruv selenograafiline laius/pikkus → MCMF, mõned punktid kõrgusel), lisatakse algväärtusega (seed) Gaussi müra ning sobitus peab süstitud parameetrid taastama. Müravabadel andmetel on taastamine ~masinatäpsusega (nihe < { "1e-6" } m, pööre < { "1e-9" } rad, skaala < { "1e-12" }); meetrise mürariga jäävad taastatud parameetrid mõne × formaalse σ piiresse ja sobitusjärgne RMS jääk on mürataseme lähedal. Stsenaarium <c1/> teatab taastatud datumi, parameetripõhise taastamisvea vs süstitud tõde, sobitusjärgse RMS jäägi ja realiseeritud pöörde ICRF orientatsiooni sideme.

# text
# c1: helmert_fit
# c2: apply_helmert
# c3: realise_frame
# c4: icrf_orientation_tie
# c5: LunarFrameRealiseScenario
# c6: InternalConsistency
# c7: apply_helmert
# c8: lunar_frame_realise::tests
# c9: run_toml
seg-3768ce021e23 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>. <b>Oraakel (sõltumatu etalon): <c6/></b> — süstitud 7-parameetrilise sarnasusteisenduse taastamine pluss funktsiooni <c7/> algebraline edasi-tagasi samasus. Testid (<c8/>): süstitud teisenduse müravaba taastamine (nihe < { "1e-6" } m, pööre < { "1e-9" } rad, skaala < { "1e-12" }); mürariga taastamine mõne × σ piires ja RMS jääk mürataseme lähedal; rakenda-siis-pööra edasi-tagasi teisendus; deterministlik (sama algväärtus (seed) → bitt-identne, erinev algväärtus (seed) → erinev, kuid taastatud); nullpöörde ICRF side on null ja side säilitab pöörde suuruse; stsenaarium jaotatud funktsiooni <c9/> kaudu. <b>Aus ulatus:</b> see on <b>sisemise kooskõla</b> kontroll — see taastab <em>süstitud</em> teisenduse <em>sünteetilisel</em> võrgul — <b>MITTE</b> Kuu tugisüsteemi realiseerimine tegelike jälgimis-/VLBI andmete vastu ega väida absoluutset tugisüsteemi täpsust. ICRF orientatsiooni side on lihtne väljenduse muutus, mitte sõltumatu pooluse hinnang. TRL-i, lennu pärandit ega ametkonna heakskiitu ei väideta.

# text
# c1: src/lunar_service.rs
seg-f14930d33f47 = Kuu navigatsiooni teenindusmaht — DOP / katvus / kättesaadavus + üldistatud Kuu ARAIM PL (<c1/>)

# text
# c1: crate::orbit::dop
# c2: service_dop
# c3: service_dop
# c4: orbit::dop
# c5: crate::lunar::lunar_araim
# c6: P_sat
# c7: lunar_protection_level
# c8: lunar::lunar_araim
seg-9b4f13e138e4 = See moodul <em>komponeerib</em> juba ehitatud osad Kuu navigatsiooni <b>teenindusmahu</b> analüüsiks: see pühib selenograafilist laiuse/pikkuse ruudustikku ajahorisondi ulatuses <b>illustratiivse, avalikest allikatest pärit Moonlight / LCNS-klassi</b> (LCNS: Lunar Communications and Navigation Services) Kuu orbiidi konstellatsiooni vastu ning teatab DOP / katvuse / kättesaadavuse pluss üldistatud Kuu ARAIM kaitsetaseme ümbriku. Kaks taaskasutust on kandvad ja selged. <b>DOP geomeetria</b> on <b>VALIDATED</b> (vs gnss_lib_py) tuum <c1/> — <c2/> on õhuke kõrgusnurga maski filter pluss see tuum ning test kinnitab samasust (<c3/> võrdub otsese <c4/> kutsega samadel nähtavatel positsioonidel). <b>Terviklikkus</b> taaskasutab LunaNet LNIS (LunaNet Interoperability Specification) Kuu ARAIM mehhanismi <c5/> (σ_URE ≈ { "30" } m, <c6/> ≈ { "1e-4" }); <c7/> üldistab olemasoleva lõunapooluse kaitsetaseme suvalisele pinnapunktile ning test kinnitab, et see <b>taandub lõunapooluse juhule</b> (lõunapoolusel sama geomeetria/eelarvega tagastab see täpselt olemasoleva <c8/> tulemuse täpsusega < { "1e-9" }).

# text
# c1: moonlight-service-volume.toml
# c2: moonlight-service-volume
seg-456bf257f689 = Konstellatsiooni parameetrid on <b>illustratiivne lähendus avalikest ESA kirjeldustest</b> süsteemiklassi kohta (≈ { "4" } satelliiti elliptilistel Kuu külmutatud orbiitidel, mis eelistavad lõunapooluse katvust — apolune lõunapoolkera kohal; { "4" } on teegi vaikeväärtus ja kaasasolev <c1/> seab { "8" }, sest kaitsetase vajab vähemalt { "6" } nähtavat). Need <b>ei ole</b> tegelik Moonlight/LCNS efemeriid ega vihja <b>mingile</b> sidemele, heakskiidule, pärandile, sertifitseerimisele ega TRL-ile. Koostis (katvus / kättesaadavus / terviklikkus) on <b>MODELLED</b>: ring-/elliptiline-Kepleri releekomplekt (mitte diferentsiaalselt parandatud LCNS / { "9" }:{ "2" } NRHO (near-rectilinear halo orbit) efemeriid), keskmise pöörlemisega Kuu (füüsikalist libratsiooni / pretsesseeruvat poolust ei ole) ja avaldatud LunaNet LNIS terviklikkuse parameetrid. See demonstreerib teenindusmahu <em>meetodit</em>, mitte operatiivset kättesaadavuse arvu. Deterministlik (puhas geomeetria; juhuslikkust ei ole). Stsenaarium <c2/> teatab katvuse protsendi, nähtavate arvu ja PDOP ümbrikud, HPL/VPL ümbriku üle mahu ning kaitsetaseme kättesaadavuse häirelävendi suhtes.

# text
# c1: LunarConstellation
# c2: visible_sats
# c3: service_dop
# c4: coverage
# c5: lunar_protection_level
# c6: LunarServiceScenario
# c7: crate::orbit::dop
# c8: crate::lunar::lunar_araim
# c9: lunar_service::tests
# c10: service_dop
# c11: lunar_protection_level
# c12: lunar::lunar_araim
# c13: run_toml
seg-c28e56391894 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. <b>DOP geomeetria valideeritud taaskasutusega</b> gnss_lib_py-ga valideeritud tuumast <c7/>; terviklikkus taaskasutab avaldatud LunaNet/LNIS Kuu ARAIM-i (<c8/>, σ_URE ≈ { "30" } m). Testid (<c9/>): <c10/> on samasus valideeritud tuumal; <c11/> lõunapoolusel võrdub olemasoleva <c12/> PL-iga täpsusega < { "1e-9" } (taandub lõunapooluse juhule); katvus ei vähene konstellatsiooni suuruse kasvades; nähtavus arvestab kõrgusnurga maski; stsenaarium on deterministlik ja jaotatud funktsiooni <c13/> kaudu. <b>Aus ulatus:</b> konstellatsioon on <b>illustratiivne, avalikest allikatest pärit, ESA-ga MITTE seotud</b> — mitte tegelik Moonlight/LCNS efemeriid; katvuse/kättesaadavuse/terviklikkuse koostis on <b>MODELLED</b> (ring-/elliptiline-Kepleri releed, keskmise pöörlemisega Kuu, avaldatud LNIS parameetrid), <b>MITTE</b> operatiivne Moonlighti kättesaadavuse arv. TRL-i, lennu pärandit ega ametkonna heakskiitu ei väideta.

# text
# c1: src/lunar_dpnt.rs
seg-4ff4929f71df = Kuu diferentsiaal-PNT — ühisrežiimi tühistamine + baasjoonega kasvav jääk + DGNSS kaitsetasemed (<c1/>)

# text
# c1: i
# c2: e_i
# c3: c_i
# c4: −e_i · û_ref,i + c_i
# c5: −e_i · û_user,i + c_i
# c6: −e_i · (û_user,i − û_ref,i)
# c7: c_i
# c8: [x, y, z, clock]
# c9: crate::orbit::invert4
# c10: crate::sbas::sbas_protection_level
seg-8f94c4bf3fe6 = Kuu DGNSS (diferentsiaalne satelliitnavigatsioon) / SBAS-i analoog: <em>teadaolevas</em> selenograafilises asukohas asuv <b>NovaMoon-klassi etalonjaam</b> arvutab satelliidipõhised diferentsiaalparandused <b>illustratiivsest, avalikest allikatest pärit Moonlight / LCNS-klassi</b> konstellatsioonist ning temast baasjoone võrra eemal asuv liikuv kasutaja rakendab neid, nii et <b>ühisrežiimi</b> edastatud efemeriidi vead tühistuvad. Iga satelliit <c1/> kannab süstitud ühist 3-D orbiidi veavektorit <c2/> ja ühist kella viga <c3/>. Etalonjaama pseudovahemaa jääk on parand <c4/>; kasutaja toorviga on <c5/>; parandatud kasutaja viga on nende vahe <c6/>. <b>Kella liige <c7/> tühistub täpselt</b> (see on mõlemas vaatluses identne) ja <b>orbiidi liige taandub projektsiooniks kahe vaatejoone ühikvektori vahele</b>, mis → { "0" }, kui baasjoon → { "0" } (ruumilise dekorrelatsiooni põhi) ja kasvab ≈ lineaarselt baasjoonega. Satelliidipõhised parandatud vahemaavead kujutatakse läbi kasutaja geomeetria väikese sõltuvustevaese kaalutud vähimruutude hetktõmmise lahendajaga (<c8/> olek funktsiooni <c9/> kaudu; konstantse vahemaa nihke neelab kella tundmatu, mitte ei riku see lahendit), et anda kasutaja <b>positsiooni</b> viga. Kasutaja <b>kaitsetase taaskasutab DO-229E SBAS-i kaitsetaseme mehhanismi</b> (<c10/>, täppissihtimise K-tegurid), kus diferentsiaaljäägi σ on iga satelliidi 1-σ veaeelarve.

# text
# c1: crate::lunar_service::LunarConstellation
# c2: lunar-differential-pnt
seg-06978cfaebe3 = NovaMoonile viidatakse <b>ainult süsteemiklassina</b> (Kuu etalonjaama avalik kirjeldus); konstellatsioon taaskasutab illustratiivset avalikest allikatest pärinevat <c1/>. Need on illustratiivsed parameetrid diferentsiaal<em>meetodi</em> katsetamiseks, <b>mitte</b> tegelik efemeriid, ega vihja <b>mingile</b> sidemele, heakskiidule, pärandile, sertifitseerimisele ega TRL-ile. Stsenaarium <c2/> teatab kasutaja positsiooni vea parandustega vs ilma, vähenemise teguri, vea vs baasjoone kõvera ja kaitsetaseme. Vaikekonfiguratsioonis on parandatud kasutaja viga { "50" } km baasjoone korral ≈ { "0.008" } m vs ≈ { "24" } m parandamata (~{ "3000" }× vähenemine) ja ≈ { "0" } nullbaasjoone korral.

# text
# c1: noise = 0
seg-6bb4dbe998f9 = <b>Oraakel (sõltumatu etalon)</b> on sisemine kooskõla: ühisrežiimi tühistamine on <b>täpne algebraline samasus</b> (<c1/> korral parandatud viga < { "1e-6" } m nullbaasjoone juures; kella liige tühistub masinatäpsuseni igal baasjoonel), jääk <b>kasvab monotoonselt baasjoonega</b> ja kaitsetase on <b>sama DO-229E algoritm</b>, mille vastu SBAS-i pakk on fikseeritud. Ruumilise dekorrelatsiooni jääk on <b>esimese järgu</b> geomeetriline mudel, <b>mitte</b> tegelikust Kuu jälgimisest sobitatud dekorrelatsioonimudel.

# text
# c1: differential_corrections
# c2: corrected_user_range_errors
# c3: user_position_error_m
# c4: lunar_dgnss_protection_level
# c5: LunarDpntScenario
# c6: InternalConsistency
# c7: crate::sbas
# c8: lunar_dpnt::tests
# c9: sbas::sbas_protection_level
# c10: None
# c11: run_toml
seg-fd282b10cc77 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>. <b>Oraakel (sõltumatu etalon): <c6/></b> — diferentsiaalse vea tühistamise samasus pluss DO-229E SBAS-i kaitsetaseme mehhanismi taaskasutus (<c7/>). Testid (<c8/>): nullbaasjoone juures on parandatud kasutaja viga ja iga parandatud satelliidipõhine vahemaaviga ~{ "0" } (< { "1e-6" } m) ja ≪ parandamata viga; kella liige tühistub täpselt igal baasjoonel (nullorbiidivea juht); parandatud viga kasvab monotoonselt baasjoonega, jäädes mõõdukatel baasjoontel ≪ parandamata veast; diferentsiaal võidab üksiküksi selge varuga (> { "2" }×); kaitsetase võrdub otsese <c9/> kutsega ja skaleerub jäägi σ-ga; alamääratud geomeetria tagastab <c10/>; stsenaarium on deterministlik (algväärtusega (seed)) ja jaotatud funktsiooni <c11/> kaudu. <b>Aus ulatus:</b> <b>MODELLED</b> — ühisrežiimi tühistamine on täpne samasus, kuid ruumilise dekorrelatsiooni jääk on <b>esimese järgu</b> geomeetriline mudel, <b>MITTE</b> tegelikust Kuu jälgimisest sobitatud dekorrelatsioonimudel ning see <b>EI OLE</b> tegelike andmetega valideeritud. NovaMoonile viidatakse <b>ainult süsteemiklassina</b> (illustratiivne, avalikest allikatest pärit, <b>ESA-ga mitte seotud</b>). TRL-i, lennu pärandit ega ametkonna heakskiitu ei väideta.

# text
# c1: src/lunar_interop.rs
seg-08e8a73f3426 = Kuu koostalitlusvõime eksport — LunaNet/IOAG-ga joondatud CCSDS OEM + KIF edasi-tagasi standardi järgimisega (<c1/>)

# text
# c1: crate::oem::OemFile::to_oem_string
# c2: crate::oem::parse_oem
# c3: crate::interchange::Envelope
# c4: export_lunar_oem
# c5: REF_FRAME
# c6: MOON_ME
# c7: MOON_PA
# c8: TIME_SYSTEM
# c9: LTC
# c10: TCL
# c11: UTC
# c12: CENTER_NAME
# c13: MOON
# c14: crate::lunar_service::LunarSat::position_mci
# c15: export_lunar_time_metadata
# c16: crate::lunar_time::lunar_rate_breakdown
# c17: export_kif_lunar
seg-39b875078d27 = Kuu tugisüsteem, Kuu ajaskaala ja Kuu efemeriid eksporditakse <b>LunaNet/IOAG-ga (IOAG: Interagency Operations Advisory Group) joondatud CCSDS-põhistes vahetusvormides</b>. See faas <b>ei</b> leiuta andmevormingut: see <b>taaskasutab</b> paketi olemasolevat CCSDS OEM (Orbit Ephemeris Message) { "2.0" } väljastajat ja parserit (<c1/> / <c2/>) ning Kshana Interchange Formati ümbrikku (<c3/>), uuesti sildistatuna Kuu konteksti jaoks. <c4/> seab OEM-i <c5/> väärtuseks <b>IAU { "2015" } WGCCRE Kuu kehaga seotud tugisüsteemi</b> (<c6/> keskmine Maa või <c7/> peatelg), <c8/> väärtuseks <b>Kuu ajaskaala</b> (<c9/> / <c10/> / <c11/>) ja <c12/> väärtuseks <c13/>, <b>illustratiivse, avalikest allikatest pärit LCNS-klassi</b> efemeriidi näite korral (positsioonid funktsioonist <c14/>, kiirus tsentraalse lõplike vahede meetodiga). <c15/> väljastab LunaNet/IOAG-ga joondatud Kuu aja kirjelduse (skaala id, sekulaarne kiirus µs/ööpäevas funktsioonist <c16/>, avaldatud { "56" }–{ "59" } µs/ööpäevas vahemik, etalonpind), mis teisendub edasi-tagasi läbi serde_json-i. <c17/> pakendab OEM-i + kirjelduse + tugisüsteemi sildi olemasolevasse KIF ümbrikku MODELLED aususe sildiga.

# text
# c1: oem.rs
# c2: crate::oem::parse_oem
# c3: oem_conformance
# c4: REF_FRAME
# c5: MOON_*
# c6: TIME_SYSTEM
# c7: META_START … META_STOP
# c8: TIME_SYSTEM
# c9: parse_lunar_time_metadata
# c10: Envelope::parse
seg-bbfce5323abb = <b>Sõltumatu etalon</b> (oraakel) on edasi-tagasi / väljade standardi järgimine. Kuna <c1/> pakub <em>mõlemat</em> suunda, teisendatakse OEM edasi-tagasi läbi <c2/> (tagasi võrdseks segmendiks, Kuu tugisüsteem/aeg ja olekute arv säilinud) <b>ja</b> kontrollitakse sõltumatult funktsiooniga <c3/>, mis kontrollib, et iga nõutav CCSDS/LunaNet päisevõtmesõna on olemas, et <c4/> kannab Kuu <c5/> märki ja <c6/> ei ole tühi, et <c7/> raamistus peab ning et positsiooni+kiiruse andmerida on korrektselt vormistatud — tagastades struktureeritud läbimise pluss olemasolevate/puuduvate väljade loendi, nii et katkine eksport (nt kadunud <c8/>) tabatakse ja nimetatakse. Aja metaandmed teisenduvad edasi-tagasi läbi <c9/> ning KIF ümbrik teisendub edasi-tagasi läbi <c10/> võrdseteks artefaktideks, mis kannavad MODELLED silti.

# text
# c1: export_lunar_oem
# c2: export_lunar_time_metadata
# c3: parse_lunar_time_metadata
# c4: export_kif_lunar
# c5: oem_conformance
# c6: LunarInteropScenario
# c7: InternalConsistency
# c8: crate::oem::parse_oem
# c9: crate::interchange::Envelope::parse
# c10: lunar_interop::tests
# c11: REF_FRAME
# c12: MOON_ME
# c13: MOON_PA
# c14: TIME_SYSTEM
# c15: LTC
# c16: TCL
# c17: CENTER_NAME = MOON
# c18: TIME_SYSTEM
# c19: oem_conformance
# c20: run_toml
seg-cb9dfbed826d = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. <b>Oraakel (sõltumatu etalon): <c7/></b> — deterministlik edasi-tagasi teisendus (CCSDS OEM funktsiooni <c8/> kaudu; KIF funktsiooni <c9/> kaudu; aja metaandmed serde_json-i kaudu) pluss väljanimede standardi järgimine avaldatud CCSDS OEM + LunaNet/IOAG väljasemantika suhtes. Testid (<c10/>): eksporditud OEM kannab Kuu <c11/> (<c12/>/<c13/>) ja <c14/> (<c15/>/<c16/>) märke, <c17/>, objekti ja korrektselt vormistatud andmeread; Kuu aja metaandmed teisenduvad edasi-tagasi (kiirus/vahemik/etalon) ja prügi lükatakse tagasi; KIF ümbrik serialiseeritakse ja deserialiseeritakse võrdseks väärtuseks MODELLED aususe sildiga olemas; tahtlikult katkine OEM (puudub <c18/>) ebaõnnestub funktsioonis <c19/> ja teatatakse puuduvana; stsenaarium jaotatakse funktsiooni <c20/> kaudu. <b>Aus ulatus:</b> väljade <b>nimed/ühikud</b> on joondatud <b>avalike</b> standarditega (CCSDS 502.0-B OEM, IAU WGCCRE { "2015" } Kuu tugisüsteemid, LunaNet Interoperability Specification / IOAG Kuu arhitektuur); eksport on <b>MODELLED</b> — deterministlik edasi-tagasi teisendus + väljanimede standardi järgimine on sõltumatu etalon, see on <b>MITTE</b> sertifitseeritud koostalitlusvõime standardi järgimise test, efemeriid on <b>illustratiivne, avalikest allikatest pärit, ESA-ga mitte seotud</b> ning TRL-i, lennu pärandit ega ametkonna heakskiitu ei väideta.

# text
seg-69a214b7236d = Eelregistreeritud ennustused

# text
# c1: docs/predictions/
# c2: tests/prediction_frozen.rs
seg-343fe86f6a50 = Eelregistreeritud ennustus on MODELLED tulemus, mis on külmutatud enne, kui selle hindamiseks on mingeid andmeid olemas, hindamisprotokoll fikseeritud samal ajal. See ei ole valideerimine ega lisa registrisse (ledger) rida. Igaüks asub kaustas <c1/> koos külmutatud sisendite, tulemuse ja nende SHA-256 räsidega ning <c2/> ebaõnnestub, kui mõni külmutatud bait muutub; muutunud eeldusele vastatakse uue, dateeritud ennustusega vana kõrvale, mitte kunagi vana muutmisega.

# text
seg-e65d79893e2c = Ennustus

# text
seg-f9e2d4b52b79 = Külmutatud

# text
seg-dd68891f75e2 = Hinnatud vastu

# text
seg-d5a09f26a028 = Kuu etalonjaama katvus

# text
seg-c68f124a16e7 = c05dac1d, 2026-10-12

# text
seg-293404a9cb92 = lõunapooluse Kuu diferentsiaaljaama avaldatud täpsus, kättesaadavus, katvus ja kaitsetasemed, mis tahes osapoolelt

# text
seg-4e7d9449a880 = veel hindamata (avaldatud tulemusi ei ole)

# text
# c1: src/representativeness.rs
seg-ad1995b3ed17 = Demonstratsiooni esinduslikkuse ja lennuni jäävate lünkade register (ledger) (<c1/>)

# text
# c1: Representativeness
# c2: Anchor
# c3: Gap
# c4: verification
seg-86b70551c37f = Simulatsiooni tulemus on tõendina kasulik vaid siis, kui see ütleb oma näol, millega see on ankurdatud, mida see eeldab ja mis eraldab seda veel lennusüsteemist. Esinduslikkuse register (ledger) teeb selle esimese klassi, masinaga kontrollitud väljundiks: kirje <c1/> kannab demonstratsiooni väliseid <c2/>-eid, selle modelleeritud eeldusi, selle <c3/>-e lennuni (igaühel faas/tegevus, mis selle sulgeks) ja TRL-i vahemikku, mille jaoks see on esinduslik. See on tulemusepõhine kaaslane võimetepõhisele <c4/> maatriksile.

# text
# c1: representativeness::tests
# c2: Validated
# c3: ExternalDataset
# c4: Modelled
# c5: PartnerOwned
seg-ccd039d5e6a4 = <b>Sõltumatu etalon</b> (oraakel) on suletud kujul invariantide kogum, mida jõustab <c1/>: kirje <c2/> peab loetlema vähemalt ühe <c3/> ankru (simulatsiooni ei saa valideerida iseenda vastu); kirje <c4/> peab loetlema vähemalt ühe lennuni jääva lünga ega saa väita esindusliku TRL-i vahemikku üle { "4" } (küpsemine sellest kaugemale vajab riistvara/lennu tõendeid, mis on lünk, mitte simulatsiooni väljund); TRL-i vahemik peab olema korrektselt vormistatud; ning kirje <c5/> ei tohi midagi väita. Need invariandid operatsionaliseerivad distsipliini „esinduslikkus põhjendatud + allesjäävad lüngad lennuni selgelt tuvastatud“.

# text
seg-6b29111096ca = Esinduslikkuse ja lennuni jäävate lünkade register (ledger)

# text
# c1: Representativeness
# c2: Anchor
# c3: Gap
# c4: check
# c5: is_valid
# c6: report
# c7: to_json
# c8: InternalConsistency
# c9: verification
# c10: representativeness::tests
# c11: verification
seg-f6b9a2c22ae6 = <c1/>/<c2/>/<c3/>, <c4/>/<c5/>/<c6/>/<c7/>. <b>Oraakel (sõltumatu etalon): <c8/></b> — suletud kujul aususe invariandid, seotud piiriga <c9/> staatuse/etaloni liigi vahel. Testid (<c10/>): Validated kirje ilma välise ankruta ebaõnnestub; sisemine (ReferenceImpl) ankur ei rahulda Validated-i; Modelled kirje ilma lüngata ebaõnnestub; Modelled kirje üle TRL-i { "4" } ebaõnnestub; väärvormistatud TRL-i vahemikud tabatakse; kirje serialiseeritakse JSON-iks oodatud väljadega ja renderdab loetava aruande. <b>Aus ulatus:</b> register (ledger) kontrollib tulemuse tõendi <em>klassifikatsiooni</em> — see ei tõesta, et nimetatud ankrud lahenduvad elavateks testideks (need on käsitsi koostatud, täpselt nagu <c11/> maatriks); väide „masinaga kontrollitud“ on piiratud staatuse/ankru/lünga/TRL-i invariantidega.

# text
# c1: src/qtrade.rs
seg-7e9190395eb6 = Ühtne kvant-vs-klassikaline kompromissi tõend (<c1/>)

# text
# c1: TradeEvidence
# c2: quantum_trade
# c3: crossover
seg-534e48755e2c = Iga kvant-PNT rakendusvaldkond vastab samale küsimusele samal viisil: fikseeri üks võrdlusraamistik (stsenaarium + algväärtus (seed) + mootori versioon), suuna kvantkandidaat ja klassikaline lähtetase läbi ühe neutraalse koodiraja, hinda neid ühiste näitajate (FoM) alusel ja teata — usaldusvahemiku ning ausa valideeritud/modelleeritud sildiga —, kus kvant võidab ja kus mitte. <c1/> annab sellele vastusele ühe kuju, nii et ajastuse, navigatsiooni ja anomaaliate tuvastamise vertikaalid väljastavad kõik <b>sama</b> reprodutseeritava, ausalt sildistatud objekti. See ei realiseeri uuesti ühtki kompromissi: FoM-põhised arvud tulevad olemasolevatest mootoritest (<c2/>, <c3/> ja vertikaalmoodulid); see on leping pluss reprodutseeritavuse/esinduslikkuse ümbris, ehitatud esinduslikkuse registrile (ledger) ja kontrollimise siltidele.

# text
# c1: qtrade::tests
# c2: >1
# c3: quantum_trade::TradeResult
# c4: Validated
seg-5a52fb6670d1 = <b>Sõltumatu etalon</b> (oraakel) on suletud kujul kasu/võitja samasused pluss olemasoleva kompromissi väljundi truu ümbris. <c1/>: kasu suhe on polaarsuselt õige (orienteeritud nii, et <c2/> tähendab alati, et kvantpool on parem, nii kõrgem-on-parem holdover-i (aja hoidmine ilma välise etalonita) kui madalam-on-parem vea FoM-ide jaoks); päris <c3/>-ist ehitatud tõendiobjekt reprodutseerib oma kasu suhted; ebaaus tõend lükatakse tagasi (Modelled esinduslikkus ilma lüngata või <c4/> FoM, mille kompromissikirje ei kanna välist ankrut); JSON on deterministlik ja kannab raamistiku/algväärtuse (seed)/mootori/FoM-i/esinduslikkuse väljad.

# text
seg-ae87cea429ba = Kvant-vs-klassikaline kompromissi tõend

# text
# c1: TradeEvidence
# c2: TradeFom
# c3: TradeFrame
# c4: Winner
# c5: InternalConsistency
# c6: quantum_trade::TradeResult
# c7: qtrade::tests
# c8: TradeEvidence
seg-6622ae19989c = <c1/>/<c2/>/<c3/>/<c4/>. <b>Oraakel (sõltumatu etalon): <c5/></b> — suletud kujul kasu/võitja samasused + funktsiooni <c6/> truu ümbris; ausus seotud esinduslikkuse registri (ledger) ning kontrollimise staatuse/etaloni liigi piiriga. Testid (<c7/>) nagu eespool. <b>Aus ulatus:</b> kasutuskoost standardib, <em>kuidas</em> kompromissi teatatakse ja reprodutseeritakse; aluseks olev FoM-põhine füüsika on see, mida panustav mootor pakub, kantuna selle enda valideeritud/modelleeritud sildiga — <c8/> ei tõsta modelleeritud FoM-i valideeritud tasemele.

# text
# c1: src/quantum_devices.rs
seg-ce13223e04d0 = Kvantseadmete veamudelite teek (<c1/>)

# text
# c1: DeviceCard
# c2: holdover::QuantumClockClass
# c3: clock_state::ClockClass
# c4: quantum_trade
# c5: crossover
# c6: timetransfer_adv
# c7: σ_t ≈ jitter/√(R·τ)
# c8: R
# c9: τ
# c10: √(1 + dark/R)
seg-c206fc7d58d6 = Üks koht, mis avab kvant-PNT seadmed, mida demonstraator kompromissis kaalub — optilised / lõksustatud ioonide / elavhõbeioonide kellad, klassikalised etalonkellad, külmaatom-interferomeeter ja aja edastamise lingid —, igaüks kui <c1/>, mis kannab oma põhispetsifikatsiooni ja esinduslikkuse kirjet. Enamik seadmefüüsikat on <b>taaskasutatud</b> (kellastabiilsused failidest <c2/> ja <c3/>; külmaatom-interferomeeter failidest <c4/>/<c5/>; klassikalised optilised/RF lingid failist <c6/>). Ainus tõeliselt uus mudel on <b>põimumise / ühe footoni aja edastamise link</b>, mille ajastustäpsus on lasuri-müra piiratud: <c7/> avastatud kokkulangevuse kiiruse <c8/> ja integreerimise <c9/> kaudu, halvendatud tumeloenduse karistusega <c10/> ja põhjendatud taandamatu süstemaatilise põhjaga.

# text
# c1: quantum_devices::tests
# c2: 1/√τ
seg-7e8f4f3a5442 = <b>Sõltumatu etalon</b> (oraakel) on taaskasutatud, avaldatud kella/CAI koefitsiendid pluss suletud kujul kvantmüra/kao samasused. <c1/>: taaskasutatud kella stabiilsuse järjestus on mõistlik (optiline võre < elavhõbeioon < CSAC σ_y({ "1" } s) väärtuses); põimumise täpsus paraneb kui <c2/> ({ "4" }× integreerimine poolitab σ-i), kui see on kvantmüra piiratud; avastatud kokkulangevuse kiirus langeb { "10" }× iga { "10" } dB lingi kao kohta; tumeloendused halvendavad täpsust monotoonselt; süstemaatiline põhi piirab täpsust altpoolt; iga seadmekaart on kehtiv, Modelled esinduslikkuse kirje.

# text
# c1: DeviceCard
# c2: quantum_clock_card
# c3: classical_clock_card
# c4: EntanglementTimeLink
# c5: InternalConsistency
# c6: quantum_devices::tests
seg-24dd5c3725b9 = <c1/>, <c2/>/<c3/>, <c4/>. <b>Oraakel (sõltumatu etalon): <c5/></b> — taaskasutatud avaldatud kella/CAI koefitsiendid + suletud kujul kvantmüra/kao samasused põimumise lingi jaoks. Testid (<c6/>) nagu eespool. <b>Aus ulatus:</b> kella/CAI seadme parameetrid on taaskasutatud mootori olemasolevatest avaldatud koefitsientide mudelitest; põimumise lingi mudel on MODELLED avaldatud kvantkella sünkroniseerimise käitumisest illustratiivsete avalikest allikatest pärit paarikiiruse/efektiivsuse/kao väärtustega — see <b>ei ole</b> valideeritud mõõdetud lingi vastu ning tegelik allika/kanali/detektori riistvara on nimetatud lünk lennuni.

# text
# c1: src/timetransfer_chain.rs
seg-f6d8e7ad6bec = Usaldatav kvantajastus — otsast otsani ahel, turvaline levitamine, anomaalia + kompromiss (<c1/>)

# text
# c1: quantum-time-transfer
# c2: tpl
# c3: 1 − P_md
# c4: detection
# c5: qtrade::TradeEvidence
seg-3160cfec0d1f = Stsenaarium <c1/> komponeerib ajastusahela, mida kvant-PNT demonstraator vajab: otsast otsani kasutaja aja eelarve (etalonkella vabajooksu viga ja lingi ajastustäpsus kombineeritud kvadratuuris) <b>kvantahela</b> (optilise võre kell + põimumise/ühe footoni link) vs <b>klassikalise</b> ahela (CSAC + RF kahe tee link) jaoks; <b>ajastuse kaitsetase</b> (TPL, taaskasutatud failist <c2/>), mis piirab tuvastamata ajaviga; <b>viivitus-/kordusrünnaku turvalisuse näitaja</b> <c3/> esitatud valehäire määra juures (taaskasutatud failist <c4/>); <b>kella anomaalia tuvastamise tõenäosus + CUSUM (kumulatiivne summa) muutuse tuvastamise latentsus</b>; ning kvant-vs-klassikaline võrdlus ausa <c5/> kujul, mis kannab esinduslikkuse + lennuni jäävate lünkade kirjet.

# text
seg-42a7d1170cc3 = Usaldatav kvantajastus (ahel + turvaline levitamine + anomaalia + kompromiss)

# text
# c1: QuantumTimeTransferScenario
# c2: Report
# c3: to_svg
# c4: kind="quantum-time-transfer"
# c5: InternalConsistency
# c6: timetransfer_chain::tests
# c7: quantum_devices
seg-44855d0cec4f = <c1/>/<c2/>, <c3/>; <c4/>. <b>Oraakel (sõltumatu etalon): <c5/></b> — suletud kujul kvadratuurieelarve taaskasutatud valideeritud tuumade kohal (ADEV/Stable32-NIST, TPL piir, tuvastamise analüütiline Pd/Pmd); ausus seotud esinduslikkuse registriga (ledger). Testid (<c6/>) nagu eespool. <b>Aus ulatus:</b> kella/lingi parameetrid on illustratiivsed, avalikest allikatest pärit; põimumise link on MODELLED kvantmüraga piiratud mudel failist <c7/>; see modelleerib usaldatava ajastussüsteemi <em>klassi</em> — see <b>ei ole</b> valideeritud mõõdetud otsast otsani lingi vastu ning tegelik kella/lingi/kosmosekanali riistvara on nimetatud lünk lennuni; TRL-i, lennu pärandit ega sertifitseerimist ei väideta.

# text
# c1: src/quantum_nav_od.rs
seg-c6ae292a6331 = GNSS-ita kvantnavigatsioon (<c1/>)

# text
# c1: quantum-gnss-free-nav
# c2: inertial::quantum_imu
# c3: quantum_trade
# c4: qtrade::TradeEvidence
seg-f34f784e928c = Stsenaarium <c1/> võrdleb GNSS-i katkestuse ajal arvestuslikku navigatsiooni <b>kvant</b>-inertsiaaleelarvega (külmaatom-interferomeetri kiirendusmõõtur, taaskasutatud failidest <c2/>/<c3/>, mille CAI valge müra põhi on valideeritud ~{ "2" } suurusjärgu piires Freier et al. { "2016" } suhtes) <b>klassikalise</b> navigatsiooniklassi INS-i vastu. See teatab positsioonivea kasvu vabajooksu jooksul, holdover-i (aja hoidmine ilma välise etalonita) aja positsiooniläveni ning kvant-vs-klassikalise kompromissi ausa <c4/> kujul. Vaadeldavus on esitatud ausalt: ilma välise fiksatsioonita katkestuse ajal on kiirendusmõõturi nihe vaadeldamatu, seega positsioonivea kasv on piiramatu (≈ ½·nihe·t² pluss kiiruse juhukõnni liige); madalama nihkega kvantandur <em>aeglustab</em> seda kasvu, kuid ei sulge lõhet — seda teeb ainult väline fiksatsioon.

# text
# c1: QuantumNavBudget
# c2: ClassicalInsBudget
# c3: PositionDrift
# c4: quantum_nav_od::tests
seg-4cfde3de8f94 = <b>Sõltumatu etalon</b> (oraakel) on taaskasutatud inertsiaaleelarved (<c1/>/<c2/>, mõlemad realiseerivad omadust <c3/>) pluss suletud kujul triivi samasused. <c4/>: kvanteelarve võidab klassikalist pika katkestuse jooksul (madalam viga, pikem holdover); viga kasvab katkestuse kestusega mõlemal (vaadeldavuse lõhe); eelis sõltub katkestusest, mitte konstantne võidutegur (kvantkõver on lühikesel vabajooksul müradomineeritud, pikal nihkedomineeritud); kompromissi tõend on sisemiselt aus.

# text
# c1: QuantumNavOdScenario
# c2: Report
# c3: to_svg
# c4: kind="quantum-gnss-free-nav"
# c5: InternalConsistency
# c6: quantum_nav_od::tests
seg-0488b6ec9982 = <c1/>/<c2/>, <c3/>; <c4/>. <b>Oraakel (sõltumatu etalon): <c5/></b> — taaskasutatud inertsiaaleelarved (CAI valideeritud-taaskasutusega ~{ "2" } suurusjärku vs Freier { "2016" }; klassikaline suletud kujul triiv); ausus seotud esinduslikkuse registriga (ledger). Testid (<c6/>) nagu eespool. <b>Aus ulatus:</b> staatiline arvestusliku navigatsiooni eelarve võrdlus, mitte dünaamiline filter tegelikel trajektooridel; nihke vaadeldamatus ilma fiksatsioonita on esitatud; seadme parameetrid on illustratiivsed, avalikest allikatest pärit; modelleerib GNSS-ita kvantnavigatsiooni <em>klassi</em> — tegelik külmaatom-IMU riistvara, dünaamiline platvorm ja lennukeskkond on nimetatud lüngad lennuni; TRL-i/lendu/sertifitseerimist ei väideta.

# text
# c1: src/quantum_faults.rs
seg-e23e583ecf21 = Rikete / anomaaliate tuvastamine kvant-PNT süsteemides (<c1/>)

# text
# c1: quantum-anomaly-detect
# c2: qtrade::TradeEvidence
seg-6e6df91ae779 = Stsenaarium <c1/> defineerib kvant-PNT rikete sildistatud kataloogi (kella sageduse hüpe, triiv, lukustuse kadu; anduri nihke aste, väljalangemine), hindab tuvastusstatistikut nominaalsetes vs rikkega akendes ning teatab detektori eristusvõime ROC AUC-na ja vähima tuvastatava rikke fikseeritud valehäire määra juures. Kvant-vs-klassikaline nurk: stabiilsem kvantkella etalon vähendab monitori müra σ-i, seega tuvastab see väiksemaid rikkeid — väljastatud ausa <c2/> kujul esinduslikkuse kirjega.

# text
# c1: N(0,σ)
# c2: N(μ,σ)
# c3: AUC = Φ(μ/(σ√2))
# c4: eval_stats::bootstrap_auc_ci
# c5: detection
# c6: quantum_faults::tests
seg-eeb3c7d1f507 = <b>Sõltumatu etalon</b> (oraakel) on Gaussi tuvastusstatistiku suletud kujul AUC (nominaalne <c1/>, rike <c2/> ⇒ <c3/>), ristkontrollitud väliselt valideeritud <c4/> (valideeritud vs scikit-learn) ja <c5/> analüütiliste lävedega. <c6/>: analüütiline AUC ühtib teadaolevate väärtustega ({ "0.5" } juures μ={ "0" }, →{ "1" } suure μ/σ korral, monotoonne); empiiriline bootstrap-AUC usaldusvahemik ümbritseb suletud kuju; kvantmonitoril on kõrgem AUC ja väiksem vähim tuvastatav rike; eelis kaob hiiglaslike rikete korral (mõlemad tuvastavad täiuslikult — mitte universaalne varu); kataloogil on viis sildistatud klassi; kompromiss on sisemiselt aus.

# text
seg-9dda4ab0647a = Rikete/anomaaliate tuvastamine kvant-PNT jaoks

# text
# c1: FaultKind
# c2: QuantumAnomalyScenario
# c3: Report
# c4: analytic_auc
# c5: min_detectable_fault
# c6: kind="quantum-anomaly-detect"
# c7: InternalConsistency
# c8: eval_stats
# c9: detection
# c10: quantum_faults::tests
seg-cfa7a5c43d14 = <c1/>, <c2/>/<c3/>, <c4/>, <c5/>; <c6/>. <b>Oraakel (sõltumatu etalon): <c7/></b> — suletud kujul Gaussi AUC, ristkontrollitud väliselt valideeritud <c8/> bootstrap-AUC-ga (vs scikit-learn) ja <c9/> analüütiliste lävedega. Testid (<c10/>) nagu eespool. <b>Aus ulatus:</b> tuvastusstatistik on Gaussi mudel, mitte tegelik telemeetria; rikete kataloog on sildistatud-sünteetiline; kvant-/klassikalise monitori mürataseme väärtused on illustratiivsed, avalikest allikatest pärit; modelleerib kvant-PNT anomaaliate tuvastamise <em>klassi</em> — tegelik riistvara telemeetria põhitõe siltidega on nimetatud lünk lennuni; TRL-i/lendu/sertifitseerimist ei väideta.

# text
seg-24ad75143bed = Standardite järgimine — vahetusvormingud, sidelingi eelarve ja terviklikkus (välise sõltumatu etaloni kontrollid)

# text
seg-9d31773e0ecd = Neid standardeid valideeritakse taastades <b>sõna-sõnalised läbitöötatud näited / etalonväärtused, mis on avaldatud standardites endis</b> (või sõltumatus etalonrealisatsioonis), mitte Kshana enda edasi-tagasi teisendusega. Standardi enda lisanäite taastamine on vahetusvormingu parseri jaoks tugevaim olemasolev standardi järgimise kontroll.

# text
seg-7ec3d508c64f = Väline sõltumatu etalon

# text
seg-e06aa022e7e9 = <b>CCSDS OEM</b> (502.0-B orbiidiandmete sõnumid)

# text
# c1: tests/ccsds_reference.rs
# c2: parse_oem
# c3: -063.042
# c4: tests/fixtures/ccsds/oem_502_b3_figG11.oem
seg-65de0a1335d6 = <c1/>: <c2/> taastab täpsed epohhid ja X/Y/Z/Ẋ/Ẏ/Ż olekuvektorid dokumendis <b>CCSDS 502.0-B-3, lisa G §G6, joonis G-11</b> („OEM Example with No Acceleration, No Covariance“, lk G-10) toodud KVN OEM näitest — mõlemad efemeriidi segmendid, kaasa arvatud eesnullidega lähteväärtused (<c3/>). Fikstuur <c4/> on reprodutseeritud märk-märgilt ametlikust Blue Bookist (toimetuslikud „< intervening data records omitted here >“ markerid, mis ei ole kehtivad OEM kirjed, ei ole kaasatud).

# text
seg-54cff1deebc7 = <b>CCSDS TDM</b> (503.0-B jälgimisandmete sõnum)

# text
# c1: tests/ccsds_reference.rs
# c2: TdmFile::parse
# c3: tests/fixtures/ccsds/tdm_503_b2_figE9.tdm
# c4: reference.tdm
# c5: src/ccsds_tdm.rs
seg-a5c6b58e0053 = <c1/>: <c2/> taastab kõik { "41" } RANGE kirjet (esimene { "3198.03679519614" } km, viimane { "3270.46440460551" } km) ja metaandmed dokumendis <b>CCSDS 503.0-B-2, lisa E, joonis E-9</b> („Range Data with TIMETAG_REF=TRANSMIT“, lk E-9) toodud KVN TDM näitest. Fikstuur <c3/> on sõna-sõnaline Blue Bookist. (See on avaldatud Blue Booki sõltumatu etalon olemasoleva käsitsi koostatud <c4/> edasi-tagasi teisenduse kõrval failis <c5/>.)

# text
seg-c9a23ec7956b = <b>CCSDS { "133.0" }</b> (kosmosepaketi protokoll)

# text
# c1: primary_header_matches_published_independent_test_vectors
# c2: spacepackets
# c3: tests/ccsds/test_space_packet.py
# c4: 18 02 40 34 00 16
# c5: 1F FF FF FF FF FF
seg-aaffd3d25c5f = <c1/>: kodeerija reprodutseerib sõltumatu <b><c2/> teegi</b> (us-irs/spacepackets-py, <c3/>) baidi-taseme esmase päise testvektorid — nt <c4/> ja kõik-maksimaalne <c5/> — pluss kanoonilise kõik-ühed telemeetria (TM) juhu, igaüks teisendatud edasi-tagasi läbi dekodeerimise. Bitiväljade laiused/järjestus vastavalt <b>CCSDS 133.0-B-2 §{ "4.1.3" }</b>.

# text
seg-e48472df251a = <b>CCSDS { "401" } / DSN</b> (sidelingi eelarve, DSN 810-005)

# text
# c1: link_equation_reproduces_descanso_galileo_dct
seg-c6caa639e1c6 = <c1/>: FSPL (free-space path loss) ja C/N₀ ahel reprodutseerivad avaldatud kauge kosmose telemeetria kavandi-kontrolli tabeli dokumendist <b>J. H. Yuen (toim.), <em>Deep Space Telecommunications Systems Engineering</em> (DESCANSO/JPL (DESCANSO: Deep Space Communications and Navigation Systems Center of Excellence) Pub. 82-76), tabel 1-1</b> — Galileo X-sagedusala ({ "8420.43" } MHz) allalink { "6.37" } AU juures: vabaruumi kadu <b>{ "290.54" } dB</b> (<{ "0.05" } dB) ja vastuvõetud <b>Pr/N₀ = { "54.6" } dB-Hz</b> (<{ "0.2" } dB). Sagedusala keskmed asuvad DSN/CCSDS-401 kauge kosmose allalingi jaotuste sees (DSN 810-005 moodul { "201" }). <em>Vaikimisi missiooni parameetrid</em> jäävad esindusliku (mitte kalibreeritud transponder); see, mida see fikseerib, on lingi <em>võrrand</em>.

# text
seg-c2cee7d5c7b1 = GNSS-i standardid — välise sõltumatu etaloni staatus ja ausad allesjäävad lüngad:

# text
seg-d8f653b3c955 = Staatus ja aus hoiatus

# text
# c1: tests/raim_reference.rs
# c2: src/araim_reference.rs
# c3: tests/araim_reference_vectors.rs
# c4: TOL_PL
# c5: araim-reference-check
# c6: N_fault,max = 1
# c7: ARAIM_REFERENCE.md
seg-fff735bd32a1 = <b>Tuum, geomeetria ja ARAIM kaitsetase on väliselt valideeritud.</b> Tuvastus<em>tuum</em> — χ² rikketuvastuse lävi, mittetsentraalse χ² tuvastamata jäänud sündmuse mittetsentraalsus ja normaalseaduse K-kordistid — reprodutseerib <b>SciPy</b> (<c1/>, { "171" } juhtu, ≤ { "1e-6" } suht.) ning ümbritsev geomeetria reprodutseerib <b>gnss_lib_py</b> (DOP). ARAIM kaitsetaseme (PL) <em>väärtus</em> on nüüd samuti fikseeritud: WG-C (WG: Working Group) ARAIM Reference ADD (Algorithm Description Document) v3.1 „LPV-200 (LPV: localizer performance with vertical guidance) numerical example“ vastu annavad <c2/> / <c3/> VPL { "18.2926" } m vs { "18.3" } m, HPL { "13.4063" } m vs { "13.45" } m ja σ_v,acc { "1.3694" } m vs { "1.3694" } m, etaloni enda <c4/> = { "0.05" } m piires (<c5/> liik). Ulatus: rikkerežiimid kuni ühe satelliidi või ühe konstellatsioonini (<c6/>); mitme sündmuse rikkealamhulki ja välistamist ei ole realiseeritud ning klassikalisel RAIM-il on endiselt <b>puudub kanooniline avaldatud sisend→HPL testvektor</b>. Vt <a1><c7/></a1>.

# text
# c1: sbas_protection_level
# c2: zsiki/rtklib_ws
# c3: waasprotlevels()
# c4: tests/sbas_reference.rs
# c5: core/filter.c
# c6: K_H,PA=6.0
# c7: K_V=5.33
# c8: K_H,NPA≈6.18
# c9: Φ⁻¹(1−5e-8)=5.3267
# c10: d_U
seg-e6a47dfb7e54 = <b>Kaitsetaseme algoritm on nüüd väliselt valideeritud.</b> Antud satelliidipõhise (el, az, σ) korral reprodutseerib kshana <c1/> <b>RTKLIB-i SBAS-PL-i haru</b> (<c2/> <c3/>, Siki & Takács { "2017" }, „DO-229D Appendix J“) — söödetuna selle tööriista <b>enda</b> σ, arvutatud <b>päris EGNOS-i</b> edastatud sõnumitest + päris BUTE RINEX-ist — täpsusega <b>< { "2e-3" } m HPL</b> { "6" } epohhi kohta (<c4/>); ESA gLAB { "v6.0.0" } (<c5/>) kinnitas identset konventsiooni. K-tegurid (<c6/>, <c7/>, <c8/>) ühtivad DO-229E lisaga J. <b>Mis on valideeritud ja mis mitte:</b> see fikseerib PL <em>algoritmi</em> (σ sisse → HPL/VPL välja); ülesvoolu σ-<em>modelleerimine</em> toorestest UDRE/GIVE sõnumitest jääb kshana ulatusest välja — seal erinevad sõltumatud <em>täistorustiku</em> tööriistad tegelikel andmetel endiselt meetrite võrra. K_V ühtis etaloni ümardatud väärtusega { "5.33" } (kshana täpne <c9/> → VPL ~{ "0.06" } % väiksem; vertikaal on valideeritud K-teguri vabana kui <c10/>).

# text
# c1: ionmodel
# c2: tests/klobuchar_reference.rs
# c3: src/ionex.rs
seg-4ef39e8ea75c = <b>Edastatav mudel on väliselt valideeritud.</b> Klobucharil L1 mudel reprodutseerib <b>RTKLIB-i <c1/></b> (<c2/>, < { "1e-4" } m) — <em>realisatsiooni pariteet</em> de facto avatud etaloniga, kuna ametlikku <em>mõõdetud tõe</em> läbitöötatud näidet ei ole. IONEX-i TEC-kaardi lugeja on nüüd olemas (<c3/>, ühiktestitud); allesjääv lünk on selle ristkontroll tegeliku GIM-tootega, mitte edastatav mudel. Vt Klobucharil ridu jaotises <a1>Väited vs tegelikkus</a1>.

# text
seg-fa3058dffb2a = GPS L1 C/A hajutuskood (IS-GPS-200)
