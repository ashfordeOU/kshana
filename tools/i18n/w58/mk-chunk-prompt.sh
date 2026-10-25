#!/bin/bash
# usage: mk-chunk-prompt.sh LANG "Language name" "NN NN ..."  -> writes $WORK/prompts/chunk_<lang>_<first>.txt and prints its path
# Needs I18N_WORK (default /tmp/i18n-work) with chunks/en-NN.ftl; guides live next to this script.
HERE="$(cd "$(dirname "$0")" && pwd)"; WORK="${I18N_WORK:-/tmp/i18n-work}"; mkdir -p "$WORK/prompts" "$WORK/out"
first=$(echo $3 | cut -d' ' -f1)
sed -e "s#LANGNAME#$2#g" -e "s#(code LANG)#(code $1)#" -e "s#LANG-NN#$1-NN#g" -e "s#GUIDE#$HERE/guides/$1.md#" -e "s#CHUNKS#$3#" \
    -e "s#CH/#$WORK/chunks/#g" -e "s#OUT/#$WORK/out/#g" -e "s#VALIDATE#$HERE/validate.py#" \
    -e "s#\$REPO#${I18N_REPO:-$PWD}#g" "$HERE/prompt-chunk.md" > "$WORK/prompts/chunk_$1_$first.txt"
echo "$WORK/prompts/chunk_$1_$first.txt"
