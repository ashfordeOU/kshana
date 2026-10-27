# Guide for Spanish (es)

## Terms (English -> rendering)
- scenario -> escenario
- evidence pack -> paquete de evidencias
- ledger -> registro
- verification matrix -> matriz de verificación
- interference -> interferencia
- integrity -> integridad
- trust score -> puntuación de confianza
- receiver -> receptor
- clock -> reloj
- timing -> temporización
- orbit determination -> determinación de órbita
- ephemeris -> efemérides
- carrier phase -> fase de portadora
- integer ambiguity -> ambigüedad entera
- Love number -> número de Love
- libration -> libración
- reference frame -> marco de referencia
- pre-registration -> preregistro
- oracle (independent reference) -> referencia independiente
- bar (pre-registered threshold) -> umbral (fijado de antemano)
- baseline -> línea base
- holdout (sealed set) -> conjunto reservado
- advisory -> orientativo (consultivo)
- type-approved -> homologado
- machine translation -> traducción automática
- native speaker -> hablante nativo
- reviewed -> revisada

## Kept in English: VALIDATED, MODELLED, PARTNER, NOT MET, MET, EXPLORATORY; acronyms GNSS, PNT, RAIM, ARAIM, NMEA, CUSUM, AUC, ROC, LAMBDA, DOP; by field usage: holdover, jamming, meaconing, spoofing

## Forbidden as claims about Kshana (negated use is required where the English is negated; X.509 certificate objects are fine): certified: certificado, certificación; conformant: conforme, conformidad; compliant: cumple, cumple con, cumplimiento, compatible con la norma; approved: aprobado, homologado, autorizado, aprobación
- fixed phrase for 'supports evidence for': {"supports evidence for": "aporta evidencias a favor de"}

## Linguistic notes
- locale: es (neutral international Spanish, not es-ES or es-MX specific)
- plural_categories: one, many, other
- plural_note: 'one' is exactly 1; 'many' applies to exact multiples of a million ('1 000 000 de ...'); otherwise 'other'. 0 is 'other'.
- grammatical_case_and_gender: No case; gender and number agreement (el/la/los/las, adjectives, participles) and contractions (al, del): a placeable noun needs its gender fixed in the message.
- address_register: Formal or impersonal: 'usted' forms or infinitive/impersonal phrasing; avoid 'tú' and 'vosotros'.
- decimal_separator: ,
- thousands_separator: . (period); Intl does not group 4-digit numbers in es
- numbers: Numbers and units are formatted by Intl at runtime through Fluent placeables ({ NUMBER($n) }); never write a number into a translated string. Where a count changes the wording, use a Fluent selector over the plural categories above, not string concatenation.

## Advisory sentences (use exactly when an English message embeds the English sentence)
- EN: Advisory software, not type-approved navigation equipment (IEC 61108, IEC 61162): the operator remains responsible for the navigation of the vessel.
  es: Software de carácter consultivo, no un equipo de navegación homologado (IEC 61108, IEC 61162): el operador sigue siendo responsable de la navegación del buque.
- EN: Advisory software, not type-approved equipment.
  es: Software de carácter consultivo, no un equipo homologado.
- EN: Advisory software for research, simulation and test. It is not type-approved equipment and does not rate or approve a receiver, a clock or a laboratory.
  es: Software de carácter consultivo para investigación, simulación y ensayo. No es un equipo homologado y no califica ni aprueba un receptor, un reloj ni un laboratorio.
- EN: Advisory only: not type-approved navigation equipment; the operator remains responsible. Evidence tier: MODELLED.
  es: Solo consultivo: no es un equipo de navegación homologado; el operador sigue siendo responsable. Nivel de evidencia: MODELLED.
- Machine translation notice: Traducción automática, no revisada por un hablante nativo. El inglés es la referencia.
