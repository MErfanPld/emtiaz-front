---
name: Arkan Architectural Real Estate
colors:
  surface: '#f7faf7'
  surface-dim: '#d8dbd7'
  surface-bright: '#f7faf7'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#f1f4f1'
  surface-container: '#ecefeb'
  surface-container-high: '#e6e9e5'
  surface-container-highest: '#e0e3e0'
  on-surface: '#181c1b'
  on-surface-variant: '#414845'
  inverse-surface: '#2d312f'
  inverse-on-surface: '#eef1ee'
  outline: '#717975'
  outline-variant: '#c1c8c4'
  surface-tint: '#42655b'
  primary: '#00251d'
  on-primary: '#ffffff'
  primary-container: '#183b32'
  on-primary-container: '#81a599'
  inverse-primary: '#a9cec2'
  secondary: '#745a27'
  on-secondary: '#ffffff'
  secondary-container: '#ffdb9b'
  on-secondary-container: '#795f2b'
  tertiary: '#20201c'
  on-tertiary: '#ffffff'
  tertiary-container: '#353530'
  on-tertiary-container: '#9f9d97'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#c5ebdd'
  primary-fixed-dim: '#a9cec2'
  on-primary-fixed: '#002019'
  on-primary-fixed-variant: '#2b4d43'
  secondary-fixed: '#ffdea5'
  secondary-fixed-dim: '#e4c284'
  on-secondary-fixed: '#261900'
  on-secondary-fixed-variant: '#5a4311'
  tertiary-fixed: '#e5e2db'
  tertiary-fixed-dim: '#c9c6c0'
  on-tertiary-fixed: '#1c1c18'
  on-tertiary-fixed-variant: '#474742'
  background: '#f7faf7'
  on-background: '#181c1b'
  surface-variant: '#e0e3e0'
typography:
  display-hero:
    fontFamily: Vazirmatn
    fontSize: 48px
    fontWeight: '800'
    lineHeight: 68px
  display-hero-mobile:
    fontFamily: Vazirmatn
    fontSize: 32px
    fontWeight: '800'
    lineHeight: 48px
  headline-lg:
    fontFamily: Vazirmatn
    fontSize: 36px
    fontWeight: '700'
    lineHeight: 52px
  headline-lg-mobile:
    fontFamily: Vazirmatn
    fontSize: 26px
    fontWeight: '700'
    lineHeight: 38px
  headline-md:
    fontFamily: Vazirmatn
    fontSize: 24px
    fontWeight: '600'
    lineHeight: 36px
  headline-sm:
    fontFamily: Vazirmatn
    fontSize: 20px
    fontWeight: '600'
    lineHeight: 30px
  title-md:
    fontFamily: Vazirmatn
    fontSize: 18px
    fontWeight: '600'
    lineHeight: 28px
  body-lg:
    fontFamily: Vazirmatn
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 28px
  body-md:
    fontFamily: Vazirmatn
    fontSize: 14px
    fontWeight: '400'
    lineHeight: 24px
  body-sm:
    fontFamily: Vazirmatn
    fontSize: 12px
    fontWeight: '400'
    lineHeight: 20px
  label-lg:
    fontFamily: Vazirmatn
    fontSize: 14px
    fontWeight: '600'
    lineHeight: 20px
  label-md:
    fontFamily: Vazirmatn
    fontSize: 12px
    fontWeight: '500'
    lineHeight: 18px
  label-sm:
    fontFamily: Vazirmatn
    fontSize: 10px
    fontWeight: '600'
    lineHeight: 16px
rounded:
  sm: 0.125rem
  DEFAULT: 0.25rem
  md: 0.375rem
  lg: 0.5rem
  xl: 0.75rem
  full: 9999px
spacing:
  gutter: 1.5rem
  gutter-mobile: 1rem
  margin: 3rem
  margin-mobile: 1.25rem
  space-xs: 0.375rem
  space-sm: 0.75rem
  space-md: 1.25rem
  space-lg: 2rem
  space-xl: 3rem
---

## Brand & Style

This design system embodies high-prestige Iranian architectural real estate curation, drawing aesthetic cues from premier regional developers such as Emaar and high-end editorial property showcases. The visual language conveys institutional trust, architectural permanence, and understated bespoke luxury. 

The styling balances classical Persian architectural symmetry with modern minimalist editorial design. Clean spatial proportions, warm tactile surfaces, and subtle metallic gilding replace ephemeral tech trends. Interfaces must avoid neon glows, oversaturated gradients, and generic software dashboards; instead, every screen should evoke an architectural monograph or private property salon.

## Colors

The palette establishes an atmosphere of permanence, luxury, and warmth through balanced light-mode values:

- **Primary Deep Forest Green (`#183B32`)**: Serves as the primary anchor for dominant structural elements, primary CTA states, header framing, and formal brand presence.
- **Champagne Gold Accent (`#C6A66B`)**: Applied purposefully for architectural highlights, badges of exclusivity, interactive focus indicators, and delicate borders. Used sparingly to preserve value.
- **Warm Ivory / Cream Canvas (`#F5F2EB`)**: The foundational canvas color across all screens, creating a natural limestone or fine parchment feel rather than sterile digital white.
- **Card & Elevated Surface (`#FFFFFF`)**: Pure crisp white reserved strictly for elevated property cards, modals, and focus containers to separate architectural photography from background canvas.
- **Dark Charcoal Text (`#292D2B`)**: Softened high-legibility dark neutral for editorial typography, avoiding harsh pure black.
- **Subtle Warm Border (`#DDD6C7` / `#E5DFD3`)**: Framing lines that mimic mortar lines, stone joints, and fine metallic inlay.

## Typography

Typography relies on **Vazirmatn** (with Shabnam as a compatible alternative), configured explicitly for high-end Persian editorial readability.

- **RTL Baseline & Proportions**: Persian letterforms require expansive vertical breathing room; line heights are standardized at 1.5× to 1.75× font size to prevent collisions between ascenders, descenders, and tashkeel.
- **Editorial Contrast**: Primary headings employ rich semi-bold to extra-bold weights (`700`, `800`) anchoring the page like architectural cornerstones, while subheadings and metrics balance them with lighter, precise weights.
- **Numbers & Metrics**: Pricing, areas (متراژ), and floor plans strictly display localized Persian numeral glyphs (`fa-IR`) paired with uniform tabular spacing to preserve geometric alignment.

## Layout & Spacing

The layout philosophy mirrors architectural floor plans: deliberate, symmetrical, and unhurried. 

- **Grid Architecture**: 12-column layout on desktop (max container `1320px`), reflowing to 6 columns on tablet and 2 columns on mobile.
- **Native RTL Flow**: Visual weight begins top-right and flows diagonally to bottom-left. Key actionable elements, primary summary cards, and navigational hooks anchor rightward.
- **Editorial Margins**: Wide canvas borders on desktop (`3rem`) create a gallery-style frame around photographic showcases. Elements must maintain generous breathing room; claustrophobic grids contradict the luxury architectural ethos.

## Elevation & Depth

Visual hierarchy uses architectural layering, warm tinted drop shadows, and delicate hairline trims rather than stark drop-shadow steps:

- **Surface Layers**: 
  - Canvas base: Warm Ivory (`#F5F2EB`).
  - Active surfaces & cards: Pure White (`#FFFFFF`).
  - Overlay panels & drawers: `#FFFFFF` paired with subtle warm inner borders (`#DDD6C7`).
- **Warm Ambient Shadows**: Shadows are tinted with deep umber and forest tones rather than sterile black:
  - *Subtle Elevation (Cards, Filters)*: `0 4px 20px -2px rgba(41, 45, 43, 0.05), 0 2px 6px -1px rgba(24, 59, 50, 0.03)`
  - *Hover Elevation (Interactive Units)*: `0 12px 32px -4px rgba(41, 45, 43, 0.08), 0 4px 12px -2px rgba(198, 166, 107, 0.12)`
  - *Floating Modals & Inquiry Sheets*: `0 24px 48px -8px rgba(24, 59, 50, 0.14)`
- **Architectural Gold Trimming**: Card edges and dividing rules utilize 1px borders in `#DDD6C7`. Premier property highlights feature an accent inset or top border in Champagne Gold (`#C6A66B`).

## Shapes

The geometric framework is grounded and architectural, opting for restrained soft edges (`roundedness: 1`, base radius `0.25rem` / `4px`) for structural elements like cards, modal dialogs, and input containers. This reflects cut stone and architectural drafting.

In contrast, interactive statuses and informational metadata leverage pill contours (`9999px`) exclusively for tags, category chips, and architectural specification pills (e.g., متراژ، تعداد خواب). This distinction clearly differentiates physical content frames from metadata badges.

## Components

### Buttons
- **Primary Action (سفارش / ثبت درخواست / رزرو بازدید)**: Solid Deep Forest Green (`#183B32`) background, crisp white typography, subtle gold hover border (`1px solid #C6A66B`). Height: 48px. Base radius: 4px.
- **Secondary / Architectural Inquiry**: Transparent surface with a 1px Champagne Gold border (`#C6A66B`) and Forest Green text. On hover, transitions to a soft ivory wash (`#EFECE3`).
- **Tertiary / Inline Actions**: Text-only button in `#183B32` with an understated bottom gold border indicating link affordance, sliding from right to left on hover.

### Chips & Badges
- **Status Pills (پیش‌فروش، آماده تحویل، پنت‌هاوس)**: Full pill radius (`9999px`), padding `0.25rem 0.875rem`. 
- **Gold Tier Badge**: `#F5F2EB` background, `#C6A66B` border (1px), `#183B32` bold typography.
- **Filtering Tabs**: Pill-shaped horizontal selector list. Unselected: transparent with `#DDD6C7` outline. Active: Deep Forest Green background with pure white typography.

### Property Showcase Cards
- **Structure**: Surface `#FFFFFF`, 1px hairline border in `#E5DFD3`, 4px corner radius.
- **Imagery**: 16:10 or 4:3 architectural photo aspect ratio, zero border radius on top edges to meet outer card boundaries cleanly.
- **Metadata Layout**: Right-aligned title, unit metrics arranged in an RTL horizontal row with micro-icons (اتاق، متراژ، طبقه) in Champagne Gold (`#C6A66B`), anchored by localized Persian price tags at the bottom.

### Form Inputs & Selectors
- **Fields**: Pure White or warm ivory background, 1px `#DDD6C7` border. Focus state replaces border with `#183B32` and adds a subtle gold glow ring (`0 0 0 2px rgba(198, 166, 107, 0.25)`).
- **Labels**: Right-aligned, Dark Charcoal (`#292D2B`) at `label-md` scale, placed strictly above the input.
- **Checkboxes & Radios**: Custom square (checkbox) or circle (radio) with `#183B32` active fill, accented by a warm gold checkmark icon.

### Floor Plan & Specification Tables
- **Lists**: Alternating rows using `#FFFFFF` and `#FAF8F3`. Dividers are 1px hairlines (`#E5DFD3`).
- **Data Points**: Architectural specifications (e.g., جهت ملک، نوع سند، نوع سازه) align keys to the right in muted charcoal and values to the left in bold Forest Green.