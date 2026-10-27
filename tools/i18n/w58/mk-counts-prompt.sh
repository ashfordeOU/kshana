#!/bin/bash
# usage: mk-counts-prompt.sh LANG "Language name" "plural categories"  (after counts.py LANG)
HERE="$(cd "$(dirname "$0")" && pwd)"; WORK="${I18N_WORK:-/tmp/i18n-work}"; mkdir -p "$WORK/prompts"
sed -e "s#LANGNAME#$2#g" -e "s#(code LANG)#(code $1)#" -e "s#cur-LANG#cur-$1#g" -e "s#out-LANG#out-$1#g" -e "s#for LANG:#for $1:#" -e "s#of LANG#of $1#g" \
    -e "s#GUIDE#$HERE/guides/$1.md#" -e "s#CATS#$3#" -e "s#CD/#$WORK/counts/#g" -e "s#VALIDATE#$HERE/validate.py#" \
    -e "s#\$REPO#${I18N_REPO:-$PWD}#g" "$HERE/prompt-counts.md" > "$WORK/prompts/counts_$1.txt"
echo "$WORK/prompts/counts_$1.txt"
