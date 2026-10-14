# Logo size update

Navbar logo: `h-14 md:h-16` (56-64px)
Footer logo: `h-16 md:h-20` (64-80px)

Run locally if HTML not yet updated:
```bash
# Navbar
sed -i 's/class="h-11 md:h-12 w-auto object-contain" width="48" height="48"/class="h-14 md:h-16 w-auto object-contain" width="64" height="64"/g' *.html
# Footer
sed -i 's/class="h-14 w-auto object-contain brightness-0 invert" width="56" height="56"/class="h-16 md:h-20 w-auto object-contain brightness-0 invert" width="80" height="80"/g' *.html
git add -A && git commit -m "style: enlarge logo" && git push origin master
```
