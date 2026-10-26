# docs--araim-reference: translations (da)

seg-c316596d7ec8 = Kilde: <c1/>

seg-4768b19aaed7 = ARAIM-reference — beskyttelsesniveauer i advanced RAIM i Kshana

seg-93c83a737a43 = Denne note dokumenterer Kshanas åbne implementering af <b>Advanced Receiver Autonomous Integrity Monitoring (ARAIM)</b>: algoritmen, hver antagelse, den integritetsstøttebesked, den bruger, og valideringsstatus. Implementeringen findes i <a1><c1/></a1>; dette dokument er den løbende tekst, som en auditor (eller en indkøbsgennemgang) kan læse ved siden af koden.

seg-f5a7abecc2df = ARAIM er den dobbeltkonstellations-, multifrekvente efterfølger til klassisk RAIM, som GPS (Global Positioning System)–Galileo Working Group C (WG-C) definerede til at understøtte horisontal og vertikal vejledning ned til LPV-200 (LPV: localizer performance with vertical guidance). Den besvarer ét enkelt spørgsmål for hver epoke:

seg-252dac107a2a = Hvor stor skal positionsfejlens grænse (<em>beskyttelsesniveauet</em>) være, for at den resterende sandsynlighed for <em>farligt vildledende information</em> — en fejl større end grænsen, mens grænsen stadig ligger inden for alarmgrænsen — holder sig under integritetsrisikobudgettet <c1/>?

seg-04299e9742b7 = { "1" }. Integritetsstøttebeskeden (ISM)

seg-717bea7d6bc8 = ISM er det parametersæt pr. konstellation, som brugeren anvender. Den modelleres eksplicit af <a1><c1/></a1>:

seg-fffbeccd4266 = Symbol

seg-2247a2344710 = Betydning

seg-d7e49778bed2 = σ_URE / SISE (signal-in-space error)

seg-b1b5bca63e21 = RMS af afstandsfejl (root mean square) brugt til <b>nøjagtighed og kontinuitet</b>

seg-8ff2973d7f5b = σ_URA / SISA (signal-in-space accuracy)

seg-f993962a5c9b = grænse for afstandsfejl brugt til <b>integritet</b> (≥ σ_URE)

seg-727c7fbe1b01 = maksimal nominel afstandsbias, foldet ensidigt ind i integritetsgrænsen (<c1/>); se §{ "3" }

seg-a79e42c29c46 = a priori-sandsynlighed for en uopdaget fejl i én satellit

seg-78c45312d2ff = a priori-sandsynlighed for en fejl i hele konstellationen

seg-19cc5ff2e541 = <c1/> returnerer de offentliggjorte referenceværdier fra WG-C: <b>σ_URA = { "0.75" } m</b>, <b>σ_URE = { "0.67" } m</b>, <b>b_nom = { "0.75" } m</b>, <b>P_sat = { "1" }×{ "10" }⁻⁵</b>, <b>P_const = { "1" }×{ "10" }⁻⁴</b> over eksponeringsintervallet. Det er de værdier, der bruges til at dimensionere ARAIM-tilgængelighed i referencelitteraturen; den operationelle ISM udsendes/samles på jorden og kan konfigureres pr. konstellation. Forskellen mellem σ_URA (integritet) og σ_URE (nøjagtighed) er bevidst og er det definerende kendetegn ved ISM-konceptet.
