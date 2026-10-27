# Guide for Brazilian Portuguese (pt-BR)

## Terms (English -> rendering)
- scenario -> cenário
- evidence pack -> pacote de evidências
- ledger -> registro
- verification matrix -> matriz de verificação
- interference -> interferência
- integrity -> integridade
- trust score -> pontuação de confiança
- receiver -> receptor
- clock -> relógio
- timing -> temporização
- orbit determination -> determinação de órbita
- ephemeris -> efemérides
- carrier phase -> fase da portadora
- integer ambiguity -> ambiguidade inteira
- Love number -> número de Love
- libration -> libração
- reference frame -> referencial
- pre-registration -> pré-registro
- oracle (independent reference) -> referência independente
- bar (pre-registered threshold) -> limiar (fixado antecipadamente)
- baseline -> linha de base
- holdout (sealed set) -> conjunto reservado
- advisory -> consultivo
- type-approved -> homologado
- machine translation -> tradução automática
- native speaker -> falante nativo
- reviewed -> revista

## Kept in English: VALIDATED, MODELLED, PARTNER, NOT MET, MET, EXPLORATORY; acronyms GNSS, PNT, RAIM, ARAIM, NMEA, CUSUM, AUC, ROC, LAMBDA, DOP; by field usage: holdover, jamming, meaconing, spoofing

## Forbidden as claims about Kshana (negated use is required where the English is negated; X.509 certificate objects are fine): certified: certificado, certificação; conformant: conforme, em conformidade, conformidade; compliant: cumpre, em cumprimento, compatível com a norma, compliance; approved: aprovado, homologado, autorizado, aprovação
- fixed phrase for 'supports evidence for': {"supports evidence for": "fornece evidências em apoio de"}

## Linguistic notes
- locale: pt-BR (Brazilian spelling and vocabulary: registro, equipamento, arquivo, usuário, tela)
- plural_categories: one, many, other
- plural_note: 'one' covers 0 and 1 in pt-BR; 'many' applies to exact multiples of a million ('1 000 000 de ...'); otherwise 'other'. pt-PT: 'one' is exactly 1.
- grammatical_case_and_gender: No case; gender and number agreement and contractions (do/da/no/na/pelo): a placeable noun needs its gender fixed in the message.
- address_register: Formal or impersonal; avoid 'tu' and avoid mixing 'você' with the third person.
- decimal_separator: ,
- thousands_separator: . (pt-BR); non-breaking space (pt-PT)
- numbers: Numbers and units are formatted by Intl at runtime through Fluent placeables ({ NUMBER($n) }); never write a number into a translated string. Where a count changes the wording, use a Fluent selector over the plural categories above, not string concatenation.

## Advisory sentences (use exactly when an English message embeds the English sentence)
- EN: Advisory software, not type-approved navigation equipment (IEC 61108, IEC 61162): the operator remains responsible for the navigation of the vessel.
  pt-BR: Software de caráter consultivo, não um equipamento de navegação homologado (IEC 61108, IEC 61162): o operador continua responsável pela navegação da embarcação.
- EN: Advisory software, not type-approved equipment.
  pt-BR: Software de caráter consultivo, não um equipamento homologado.
- EN: Advisory software for research, simulation and test. It is not type-approved equipment and does not rate or approve a receiver, a clock or a laboratory.
  pt-BR: Software de caráter consultivo para investigação, simulação e ensaio. Não é um equipamento homologado e não classifica nem aprova um receptor, um relógio ou um laboratório.
- EN: Advisory only: not type-approved navigation equipment; the operator remains responsible. Evidence tier: MODELLED.
  pt-BR: Apenas consultivo: não é um equipamento de navegação homologado; o operador continua responsável. Nível de evidência: MODELLED.
- Machine translation notice: Tradução automática, não revista por um falante nativo. O inglês é a referência.
