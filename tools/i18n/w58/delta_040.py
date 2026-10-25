#!/usr/bin/env python3
"""delta_040.py OUT.txt: the ids the 0.40 delta must translate in at least one language: every id of the current English
catalogue that some language's engine.ftl (or, for pl cs uk ru fi et ja zh-Hans, done-ids-0f6fb1fa.txt) does not yet handle, plus the ids
whose English text changed since a9eb2213 (i18n/en/engine-changes-since-a9eb2213.txt) and the ids of i18n/en/engine-numbers.txt (their literal
decimals became placeables). Prints the counts. Run from the repo root."""
import re, sys, collections
rd = lambda p: set(re.findall(r'^(engine-[a-z0-9-]+) =', open(p).read(), re.M))
cur = rd('i18n/en/engine.ftl')
done = set(x.strip() for x in open('tools/i18n/w58/done-ids-0f6fb1fa.txt') if x.strip())
c = collections.defaultdict(set)
for l in open('i18n/en/engine-changes-since-a9eb2213.txt'):
    if l.strip() and not l.startswith('#'):
        k, i = l.strip().split(':', 1); c[k].add('engine-' + i)
nums = set('engine-' + l.split(':')[0].strip() for l in open('i18n/en/engine-numbers.txt') if l.strip() and not l.startswith('#'))
need = cur - done
for l in 'de fr es pt-BR pt-PT nl da sv nb'.split():
    need |= cur - rd(f'i18n/{l}/engine.ftl')
ret = (c['changed'] | nums) & cur
ids = sorted((need | ret), key=lambda x: x)
open(sys.argv[1], 'w').write('\n'.join(i[len('engine-'):] for i in ids) + '\n')
print(len(need), 'unhandled,', len(ret), 'to retranslate,', len(ids), 'in all;', len(c['removed']), 'removed ids')
