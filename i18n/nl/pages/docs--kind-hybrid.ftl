# docs--kind-hybrid: translations (nl)

seg-03442e4be82d = Microchip SA65 / SA.45s CSAC-gegevensblad sigma_y(1s)={ "3e-10" }

seg-f4cf8b629797 = Onderwerppagina: <a1>INTEGRITY.md</a1>

seg-98151954f217 = false

seg-f70076ea4a77 = <b>VALIDATED</b> Allan-/gemodificeerde/Hadamard-deviatie + machtswetruisidentificatie met χ²-betrouwbaarheidsintervallen. Onafhankelijke referentie (ExternalDataset): NIST SP { "1065" } (Riley) / referentiedeviaties van Stable32 op NBS14

seg-5278ccdaf16f = <b>MODELLED</b> Gesloten-vorm-groei van de driftfout tijdens coasting + holdover-tot-drempel; kwantumklasseklokken. Onafhankelijke referentie (ReferenceImpl): Recursie van de covariantie van clock_state in meerdere stappen (kruiscontrole binnen dezelfde codebase); de onderliggende kernel voor coast-variantie en holdover-inversie is extern getoetst tegen scipy (zie 'Clock-holdover coast-variance & threshold inversion'). De holdovercijfers per klasse met rode-ruisbodem blijven MODELLED

seg-3ea0aa9b3907 = <b>MODELLED</b> 3-toestanden (fase/frequentie/drift) van-Loan-Kalmanklok, Joseph-gestabiliseerd. Onafhankelijke referentie (ReferenceImpl): filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), met F via scipy.linalg.expm en Q via de Van-Loan-blokmatrix van { "1978" } — een onafhankelijke referentie-implementatie die het volledige filtertraject van kshana reproduceert. Consistentie tussen implementaties: de klokfysica en de Allan-kalibratie zijn niet extern getoetst, dus dit blijft MODELLED. { "0.30" } externe vergelijking, een bevinding (blijft MODELLED): op IGS final { "30" } s-klokken van { "11" } GPS Blo

seg-e12f672ae71d = Klok-holdover bij GNSS-uitval is MODELLED, niet extern getoetst: gecontroleerd tegen een afzonderlijke implementatie in dezelfde codebase — onafhankelijk van de geteste eenheid, maar niet extern gezaghebbend. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-8de95b3a9229 = Schatting van de toestand van de boordklok is MODELLED, niet extern getoetst: gecontroleerd tegen een afzonderlijke implementatie in dezelfde codebase — onafhankelijk van de geteste eenheid, maar niet extern gezaghebbend. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-e4b64d7277da = Spoofingdetectie is MODELLED, niet extern getoetst: een deelclaim wordt extern gecontroleerd, maar de hele mogelijkheid is samengesteld uit gemodelleerde onderdelen, dus de mogelijkheid blijft gemodelleerd. (verificatiematrix (docs/MODELLED-RATIONALE.md))
