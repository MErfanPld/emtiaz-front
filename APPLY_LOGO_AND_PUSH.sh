#!/bin/bash
set -e
cd "$(dirname "$0")"

mkdir -p assets
if [ ! -f assets/logo.svg ]; then
  curl -sL -o assets/logo.svg "https://raw.githubusercontent.com/MErfanPld/emtiaz-front/master/assets/logo.svg"
fi

python3 << 'ENDPY'
from pathlib import Path
import re

NAV_LOGO = (
    '<a class="flex items-center gap-3 group transition-transform duration-200 '
    'active:scale-95 shrink-0" href="index.html">\n'
    '<img src="assets/logo.svg" alt="املاک امتیاز | EMTIAZ Real Estate" '
    'class="h-11 md:h-12 w-auto object-contain" width="48" height="48" />\n'
    '</a>'
)

FOOTER_LOGO = (
    '<div class="flex items-center gap-3 mb-6">\n'
    '<a href="index.html" class="inline-flex items-center gap-3 group">\n'
    '<img src="assets/logo.svg" alt="املاک امتیاز | EMTIAZ Real Estate" '
    'class="h-14 w-auto object-contain brightness-0 invert" width="56" height="56" />\n'
    '<div class="flex flex-col text-right">\n'
    '<span class="text-headline-md font-headline-md font-bold text-white tracking-tight">'
    'مجتمع تخصصی املاک امتیاز</span>\n'
    '<span class="text-label-sm font-label-sm text-white/70 mt-0.5">'
    'توسعه و اعتبار معاملات ملکی در شمال تهران</span>\n'
    '</div>\n</a>\n</div>'
)

patterns = [
    re.compile(r'<a class="flex items-center gap-3 group[^"]*"[^>]*>\s*<div class="flex flex-col text-right">.*?</div>\s*</a>', re.DOTALL),
    re.compile(r'<a class="flex items-center gap-3 group" href="#">\s*<div class="w-1[01] h-1[01][^"]*>[\s\S]*?</div>\s*<div class="flex flex-col">[\s\S]*?</div>\s*</a>', re.DOTALL),
    re.compile(r'<a class="flex items-center gap-3 group" href="#">\s*<div class="w-10 h-10[^"]*>[\s\S]*?</div>\s*<div class="flex flex-col">[\s\S]*?</div>\s*</a>', re.DOTALL),
    re.compile(r'<!-- Brand Logo & Monogram -->\s*<a class="flex items-center gap-3 group" href="#">\s*<div class="w-11 h-11[^"]*>[\s\S]*?</div>\s*<div class="flex flex-col">[\s\S]*?</div>\s*</a>', re.DOTALL),
    re.compile(r'<!-- Brand Logo & Identity -->\s*<a class="flex items-center gap-3 group focus:outline-none" href="#">\s*<div class="w-10 h-10[^"]*>[\s\S]*?</div>\s*<div class="flex flex-col text-right">[\s\S]*?</div>\s*</a>', re.DOTALL),
    re.compile(r'<a class="text-headline-sm[^"]*flex items-center gap-2"[^>]*>\s*<span class="w-2\.5 h-6[^"]*>.*?</span>\s*<span>مجتمع تخصصی ملک</span>\s*</a>', re.DOTALL),
    re.compile(r'<a class="flex items-center gap-3[^"]*"[^>]*>[\s\S]{20,500}?<span class="text-headline-sm[^"]*">مجتمع تخصصی ملک</span>[\s\S]{0,200}?</a>', re.DOTALL),
]

for fpath in Path(".").glob("*.html"):
    text = fpath.read_text(encoding="utf-8")
    changed = False
    if "assets/logo.svg" not in text:
        for pat in patterns:
            if pat.search(text):
                text = pat.sub(NAV_LOGO, text, count=1)
                changed = True
                break
    if "<footer" in text:
        start = text.find("<footer")
        end = text.find("</footer>") + len("</footer>")
        footer = text[start:end]
        if "assets/logo.svg" not in footer:
            fpat = re.compile(r'<div class="flex items-center gap-3 mb-6">\s*<div class="flex flex-col text-right">.*?</div>\s*</div>', re.DOTALL)
            if fpat.search(footer):
                footer = fpat.sub(FOOTER_LOGO, footer, count=1)
                text = text[:start] + footer + text[end:]
                changed = True
    if changed:
        fpath.write_text(text, encoding="utf-8")
        print("OK", fpath.name, text.count("assets/logo.svg"))
    else:
        print("SKIP", fpath.name, text.count("assets/logo.svg"))
print("Done")
ENDPY

git add -A
git status --short
git commit -m "feat: add official EMTIAZ logo to navbar and footer on all pages" || true
git push origin master
echo DONE
git log --oneline -3
