#!/usr/bin/env python3
"""Find words that mix Latin and Cyrillic letters in i18n/<lang>/pages/*.ftl (typing slips such as a Latin "a" inside a Cyrillic word).

Usage: python3 tools/i18n/mixed_script_scan.py <lang> [--fix] [--root i18n]
Lists file and word; --fix rewrites a word to all-Cyrillic by mapping look-alike Latin letters (a o i c e p x n), except the words
in SPECIAL below. Only meaningful for ru and uk (other scripts mix Latin legitimately).
"""
import re, glob, sys

SPECIAL = {}  # word -> replacement, add per case if a word is a real Latin identifier
CYR = 'А-Яа-яІіЇїЄєҐґЁё'
MAP = str.maketrans({'a': 'а', 'o': 'о', 'i': 'і', 'c': 'с', 'e': 'е', 'p': 'р', 'x': 'х', 'n': 'н',
                     'A': 'А', 'O': 'О', 'C': 'С', 'E': 'Е', 'P': 'Р', 'X': 'Х', 'I': 'І', 'H': 'Н', 'K': 'К', 'M': 'М', 'T': 'Т', 'B': 'В'})

def main():
    args = sys.argv[1:]
    if not args:
        sys.exit(__doc__)
    lang = args[0]
    fix = '--fix' in args
    root = args[args.index('--root') + 1] if '--root' in args else 'i18n'
    n = 0
    for f in sorted(glob.glob(f'{root}/{lang}/pages/*.ftl')):
        s = open(f, encoding='utf8').read()
        def sub(m):
            nonlocal n
            w = m.group(0)
            if w.startswith('seg') or not (re.search('[A-Za-z]', w) and re.search(f'[{CYR}]', w)):
                return w
            n += 1
            print(f.split('/')[-1], w)
            return SPECIAL.get(w, w.translate(MAP)) if fix else w
        t = re.sub(rf'[A-Za-z{CYR}]+', sub, s)
        if fix and t != s:
            open(f, 'w', encoding='utf8').write(t)
    print(f'{n} mixed-script words')
    sys.exit(1 if n and not fix else 0)

main()
