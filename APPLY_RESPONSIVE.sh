#!/bin/bash
set -e
cd "$(dirname "$0")"

echo "=== Applying Emtiyaz responsive fixes ==="

# Ensure assets exist
mkdir -p assets
curl -sL -o assets/responsive.css "https://raw.githubusercontent.com/MErfanPld/emtiaz-front/master/assets/responsive.css" || true
curl -sL -o assets/mobile-menu.js "https://raw.githubusercontent.com/MErfanPld/emtiaz-front/master/assets/mobile-menu.js" || true
curl -sL -o assets/logo.svg "https://raw.githubusercontent.com/MErfanPld/emtiaz-front/master/assets/logo.svg" || true

python3 << 'ENDPY'
from pathlib import Path
import re

RESPONSIVE_CSS = r'''
    /* ===== Responsive base ===== */
    html { scroll-behavior: smooth; }
    body { overflow-x: hidden; max-width: 100vw; }
    img, video, iframe { max-width: 100%; height: auto; }
    table { display: block; max-width: 100%; overflow-x: auto; }
    h1, h2, h3, h4, p, a, span, li { overflow-wrap: anywhere; word-break: break-word; }
    @media (max-width: 1023px) {
      a, button { min-height: 44px; }
    }
    @media (max-width: 480px) {
      .text-display-hero, .font-display-hero { font-size: 1.75rem !important; line-height: 2.25rem !important; }
      .text-headline-lg, .font-headline-lg { font-size: 1.35rem !important; line-height: 1.85rem !important; }
      header img.h-14, header img.h-16 { height: 2.75rem !important; }
    }
    #mobile-menu-panel {
      transform: translateX(100%);
      transition: transform 0.28s ease;
    }
    #mobile-menu-panel.open { transform: translateX(0); }
    #mobile-menu-backdrop {
      opacity: 0; visibility: hidden;
      transition: opacity 0.28s ease, visibility 0.28s ease;
    }
    #mobile-menu-backdrop.open { opacity: 1; visibility: visible; }
    body.menu-open { overflow: hidden; }
'''

MOBILE_MENU_BTN = '''\n<button type="button" id="mobile-menu-btn" class="lg:hidden inline-flex items-center justify-center w-11 h-11 rounded-lg border border-outline-variant/50 text-primary hover:bg-surface-container transition-colors" aria-label="باز کردن منو" aria-expanded="false" aria-controls="mobile-menu-panel">\n<span class="material-symbols-outlined text-[26px]" id="mobile-menu-icon">menu</span>\n</button>\n'''

LINKS = [
    ('صفحه اصلی', 'index.html'),
    ('معرفی مجتمع', 'info.html'),
    ('املاک', 'homes.html'),
    ('مقالات', 'blogs.html'),
    ('تماس با ما', 'about.html'),
]

def drawer():
    items = '\\n'.join(
        f'<a class="block py-3 px-2 text-label-lg font-label-lg text-on-surface border-b border-outline-variant/30 hover:text-primary transition-colors" href="{h}">{l}</a>'
        for l, h in LINKS
    )
    return f'''\n<div id="mobile-menu-backdrop" class="fixed inset-0 z-[90] bg-black/45 lg:hidden" aria-hidden="true"></div>\n<div id="mobile-menu-panel" class="fixed top-0 right-0 z-[100] h-full w-[min(100%,300px)] bg-surface shadow-2xl lg:hidden flex flex-col" role="dialog" aria-modal="true" aria-label="منوی اصلی">\n<div class="flex items-center justify-between p-4 border-b border-outline-variant/40">\n<a href="index.html" class="flex items-center gap-2"><img src="assets/logo.svg" alt="املاک امتیاز" class="h-10 w-auto object-contain" width="40" height="40" /></a>\n<button type="button" id="mobile-menu-close" class="inline-flex items-center justify-center w-10 h-10 rounded-lg text-primary hover:bg-surface-container" aria-label="بستن منو"><span class="material-symbols-outlined text-[24px]">close</span></button>\n</div>\n<nav class="flex-1 overflow-y-auto p-4 space-y-1">{items}</nav>\n<div class="p-4 border-t border-outline-variant/40 space-y-3">\n<a href="tel:02122008890" class="flex items-center justify-center gap-2 w-full py-3 rounded-lg bg-surface-container text-primary text-label-md font-semibold border border-outline-variant/40"><span class="material-symbols-outlined text-[20px]">call</span><span dir="ltr">۰۲۱-۲۲۰۰۸۸۹۰</span></a>\n<a href="about.html" class="flex items-center justify-center gap-2 w-full py-3 rounded-lg bg-primary text-white text-label-md font-semibold"><span class="material-symbols-outlined text-[20px]">support_agent</span><span>تماس با مجتمع</span></a>\n</div>\n</div>\n'''

JS = r'''\n<script>\n(function(){var btn=document.getElementById("mobile-menu-btn");var panel=document.getElementById("mobile-menu-panel");var backdrop=document.getElementById("mobile-menu-backdrop");var closeBtn=document.getElementById("mobile-menu-close");var icon=document.getElementById("mobile-menu-icon");if(!btn||!panel)return;function openMenu(){panel.classList.add("open");if(backdrop)backdrop.classList.add("open");document.body.classList.add("menu-open");btn.setAttribute("aria-expanded","true");if(icon)icon.textContent="close";}function closeMenu(){panel.classList.remove("open");if(backdrop)backdrop.classList.remove("open");document.body.classList.remove("menu-open");btn.setAttribute("aria-expanded","false");if(icon)icon.textContent="menu";}btn.addEventListener("click",function(){if(panel.classList.contains("open"))closeMenu();else openMenu();});if(closeBtn)closeBtn.addEventListener("click",closeMenu);if(backdrop)backdrop.addEventListener("click",closeMenu);panel.querySelectorAll("a").forEach(function(a){a.addEventListener("click",closeMenu);});document.addEventListener("keydown",function(e){if(e.key==="Escape")closeMenu();});})();\n</script>\n'''

PUBLIC = ['index.html','info.html','homes.html','home_detail.html','blogs.html','blog_detail.html','about.html']

for page in PUBLIC:
    path = Path(page)
    if not path.exists():
        print('skip', page); continue
    html = path.read_text(encoding='utf-8')
    if '/* ===== Responsive base ===== */' not in html:
        idx = html.find('</style>')
        if idx != -1:
            html = html[:idx] + RESPONSIVE_CSS + html[idx:]
        else:
            html = html.replace('</head>', '<style>' + RESPONSIVE_CSS + '</style></head>')
    html = html.replace('flex items-center justify-between h-20 rtl', 'flex items-center justify-between min-h-[72px] md:min-h-[80px] py-2 rtl')
    html = html.replace('min-h-[640px] md:min-h-[720px]', 'min-h-[520px] sm:min-h-[600px] md:min-h-[720px]')
    html = re.sub(r'class="(w-full )?max-w-\\[1320px\\] mx-auto px-6 md:px-12', r'class="\\1max-w-[1320px] mx-auto px-4 sm:px-6 md:px-12', html)
    for old, new in [
        ('href="#">صفحه اصلی</a>', 'href="index.html">صفحه اصلی</a>'),
        ('href="#">معرفی مجتمع</a>', 'href="info.html">معرفی مجتمع</a>'),
        ('href="#">دفاتر املاک</a>', 'href="info.html#offices">دفاتر املاک</a>'),
        ('href="#">املاک</a>', 'href="homes.html">املاک</a>'),
        ('href="#">مقالات</a>', 'href="blogs.html">مقالات</a>'),
        ('href="#">تماس با ما</a>', 'href="about.html">تماس با ما</a>'),
    ]:
        html = html.replace(old, new)
    if 'id="mobile-menu-btn"' not in html:
        parts = list(re.finditer(r'<div class="flex items-center gap-[34]">', html[:html.find('</header>') if '</header>' in html else 5000]))
        if parts:
            pos = parts[-1].end()
            html = html[:pos] + MOBILE_MENU_BTN + html[pos:]
        else:
            html = html.replace('</header>', '<div class="lg:hidden">' + MOBILE_MENU_BTN + '</div></header>', 1)
    if 'id="mobile-menu-panel"' not in html:
        he = html.find('</header>')
        if he != -1:
            html = html[:he+len('</header>')] + drawer() + html[he+len('</header>'):]
    if 'function openMenu' not in html and 'mobile-menu-btn' in html:
        html = html.replace('</body>', JS + '</body>', 1)
    html = html.replace('min-w-[200px]', 'min-w-0 sm:min-w-[200px]')
    path.write_text(html, encoding='utf-8')
    print('OK', page)

for page in ['login.html', 'dashboard.html']:
    path = Path(page)
    if not path.exists(): continue
    html = path.read_text(encoding='utf-8')
    if '/* ===== Responsive base ===== */' not in html:
        idx = html.find('</style>')
        if idx != -1:
            html = html[:idx] + RESPONSIVE_CSS + html[idx:]
            path.write_text(html, encoding='utf-8')
    print('OK', page)

print('Responsive fixes applied.')
ENDPY

git add -A
git status --short
git commit -m "fix: make all Emtiyaz pages fully responsive with mobile menu" || true
git push origin master
echo "=== DONE ==="
git log --oneline -3
