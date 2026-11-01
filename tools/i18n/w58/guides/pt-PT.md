# Guide for European Portuguese (pt-PT)

## Terms (English -> rendering)
- scenario -> cenário
- evidence pack -> pacote de evidências
- ledger -> registo
- verification matrix -> matriz de verificação
- interference -> interferência
- integrity -> integridade
- trust score -> pontuação de confiança
- receiver -> recetor
- clock -> relógio
- timing -> temporização
- orbit determination -> determinação de órbita
- ephemeris -> efemérides
- carrier phase -> fase da portadora
- integer ambiguity -> ambiguidade inteira
- Love number -> número de Love
- libration -> libração
- reference frame -> referencial
- pre-registration -> pré-registo
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
- fixed phrase for 'supports evidence for': {"supports evidence for": "fornece elementos de prova em apoio de"}

## Linguistic notes
- locale: pt-PT (European Portuguese, AO90 spelling: recetor, objetivo, caráter, registo)
- plural_categories: one, many, other
- plural_note: 'one' is exactly 1 (integers); 0 and 2+ are 'other'; 'many' applies to exact multiples of a million ('1 000 000 de ...'). Unlike pt-BR, 0 is not 'one'.
- grammatical_case_and_gender: No case; gender and number agreement and contractions (do/da/no/na/pelo): a placeable noun needs its gender fixed in the message. European vocabulary: registo, ecrã, ficheiro, utilizador, recetor, ligação, predefinição, descarregar, aparelho or equipamento; progressive aspect with 'a' + infinitive ('está a processar'), not the gerund.
- address_register: Formal or impersonal: third person or impersonal phrasing ('o utilizador', 'pode configurar', infinitive in instructions); avoid 'tu' and avoid the Brazilian 'você'.
- decimal_separator: ,
- thousands_separator: U+00A0 no-break space; Intl does not group 4-digit numbers in pt-PT
- numbers: Numbers and units are formatted by Intl at runtime through Fluent placeables ({ NUMBER($n) }); never write a number into a translated string. Where a count changes the wording, use a Fluent selector over the plural categories above, not string concatenation.

## Advisory sentences (use exactly when an English message embeds the English sentence)
- EN: Advisory software, not type-approved navigation equipment (IEC 61108, IEC 61162): the operator remains responsible for the navigation of the vessel.
  pt-PT: Software de caráter consultivo, não um equipamento de navegação homologado (IEC 61108, IEC 61162): o operador continua a ser responsável pela navegação da embarcação.
- EN: Advisory software, not type-approved equipment.
  pt-PT: Software de caráter consultivo, não um equipamento homologado.
- EN: Advisory software for research, simulation and test. It is not type-approved equipment and does not rate or approve a receiver, a clock or a laboratory.
  pt-PT: Software de caráter consultivo para investigação, simulação e ensaio. Não é um equipamento homologado e não classifica nem aprova um recetor, um relógio ou um laboratório.
- EN: Advisory only: not type-approved navigation equipment; the operator remains responsible. Evidence tier: MODELLED.
  pt-PT: Apenas consultivo: não é um equipamento de navegação homologado; o operador continua a ser responsável. Nível de evidência: MODELLED.
- Machine translation notice: Tradução automática, não revista por um falante nativo. O inglês é a referência.

## Extra per-language brief from the earlier translator (terms and conventions to keep)
# pt-PT adaptation brief (add to RULES.md; read RULES.md first, including rule 8)
Produce the EUROPEAN Portuguese (pt-PT, AO90 spelling) version of batch NN by ADAPTING the finished Brazilian translation /tmp/claude-0/i18n/out/pt-BR_NN.ftl, message by message, against the English /tmp/claude-0/i18n/batches/en_NN.ftl. Output /tmp/claude-0/i18n/out/pt-PT_NN.ftl (same ids, order, placeables, line counts). Glossary: /workspace/kshana-pro/site/i18n-0.40/i18n/glossary/pt-PT.json. Finished sample: pt-PT_01.ftl (its choices apply: ligação, andares/estágios as fits, cronologia, seguimento, veículos espaciais).
Real adaptation, reading every message: registo, recetor, ecrã, ficheiro, utilizador, ligação, predefinição, descarregar, grelha, contacto, detetar, ótico, fotogramas, seguimento, bloqueio, varrimento, marca temporal, 'pelo menos', controlo de versões, descolagem; 'a + infinitive' for the progressive; 'continua a ser'; European clitic placement; 'face a'/'relativamente a' for 'em relação a'; third-person/impersonal formal register, never 'você'/'tu'. Keep the pt-BR term decisions unless Brazilian-only: 'bytes'; 'verificação de formato'; 'conjunto reservado'; 'linha de base'; 'limiar' for bar; 'projeto' for design; 'solução de posição' for fix; 'predefinição'; 'referência' for truth; jamming, spoofing, holdover English; CORROBORATED / NOT CORROBORATED and tier words English. No forbidden_translations words as claims; negations kept exactly.
Then run python3 /tmp/claude-0/i18n/tools.py check <en file> <out file> until OK. Report in one or two lines: OK and unsure ids.

