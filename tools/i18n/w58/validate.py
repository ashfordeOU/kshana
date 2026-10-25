#!/usr/bin/env python3
"""Validate a translated engine.ftl chunk against its English chunk.
usage: validate.py en-chunk.ftl translated.ftl
A translated message may be omitted (English is shown); a present one must keep: the id, the set of $variables, the
string-literal placeables, the backtick spans, the digits, the tier and verdict words and the line count."""
import sys, re, collections, os
REPO=os.environ.get('I18N_REPO',os.getcwd())
COUNTS=set(l.split(':')[0].strip() for l in open(REPO+'/i18n/en/engine-counts.txt') if l.strip() and not l.startswith('#'))
from fluent.syntax import parse, ast
from fluent.syntax.visitor import Visitor

class V(Visitor):
    def __init__(s): s.vars=set(); s.lits=[]
    def visit_VariableReference(s,n): s.vars.add(n.id.name)
    def visit_StringLiteral(s,n): s.lits.append(n.value)
    def visit_NumberLiteral(s,n): s.lits.append(n.value)

def load(path):
    text=open(path).read()
    res=parse(text)
    msgs={}; junk=[]
    for e in res.body:
        if isinstance(e,ast.Junk): junk.append(e.content[:100].replace('\n',' '))
        elif isinstance(e,ast.Message):
            v=V(); v.visit(e)
            raw=text[e.span.start:e.span.end]
            # a leading comment (the `# legal: native review` line) is not part of the message: do not count it as a line
            raw=re.sub(r'\A(?:[ \t]*#[^\n]*\n)+','',raw)
            val=raw.split('=',1)[1]
            plain=re.sub(r'\{[^{}]*\}',' ',val)
            msgs[e.id.name]=dict(plain=plain,vars=v.vars,lits=collections.Counter(v.lits),
                lines=len(raw.rstrip('\n').split('\n')),
                ticks=collections.Counter(re.findall(r'`[^`]*`',plain)),
                digits=collections.Counter(re.findall(r'\d+',plain)),
                tiers=collections.Counter(re.findall(r'(?<![A-Za-z])(?:NOT MET|MET|MODELLED|VALIDATED|PARTNER|EXPLORATORY|PREDICTION|NOT CORROBORATED|CORROBORATED|REFUSED|DEGRADED|DEFICIENT|OBSERVED|LOST|MISMATCH)(?![A-Za-z])',plain)))
    return msgs,junk
en,ej=load(sys.argv[1]); tr,tj=load(sys.argv[2])
bad=[]
for j in tj: bad.append(f'syntax error near: {j}')
for k,m in tr.items():
    if k not in en: bad.append(f'{k}: no such English message'); continue
    e=en[k]
    if m['vars']!=e['vars']: bad.append(f'{k}: variables differ (en {sorted(e["vars"])}, tr {sorted(m["vars"])})')
    cnt = k.removeprefix('engine-') in COUNTS or any(k=='engine-'+c or k.startswith('engine-'+c[:60]) for c in ())
    if cnt:
        # a plural selector repeats text per variant: compare sets, not counts, and ignore the layout
        for f in ('lits','ticks','digits','tiers'):
            if set(m[f])!=set(e[f]): bad.append(f'{k}: {f} differ (count message, set comparison)')
        continue
    if m['lits']!=e['lits']: bad.append(f'{k}: string-literal placeables differ')
    if m['lines']!=e['lines']: bad.append(f'{k}: line count {m["lines"]} != {e["lines"]}')
    if m['ticks']!=e['ticks']: bad.append(f'{k}: backtick spans differ')
    # ja and zh-Hans write a month or a count as a numeral (June -> 6月, four -> 4つ): extra digits there are not a problem
    cjk = bool(re.search(r'[\u3040-\u30ff\u4e00-\u9fff]', m['plain'])) and not (e['digits']-m['digits'])
    if m['digits']!=e['digits'] and not cjk: bad.append(f'{k}: numbers differ')
    if m['tiers']!=e['tiers']: bad.append(f'{k}: tier/verdict words differ')
missing=[k for k in en if k not in tr]
print(f'{len(tr)} translated, {len(missing)} omitted of {len(en)}; {len(bad)} problems')
for b in bad[:60]: print('  ',b)
if len(bad)>60: print('   ...')
sys.exit(1 if bad else 0)
