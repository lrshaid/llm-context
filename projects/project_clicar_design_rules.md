---
created: 2026-03-16
updated: 2026-03-16
tags:
  - type/project
  - clicar
  - design
  - shopify
aliases:
  - clicar design
  - clicar_design_rules
---

# Clicar.studio -- Design Rules

Reference for all future development on clicar.studio. Every UI change, new page, or component must follow these rules to maintain visual consistency.

---

## Tech Stack

- **Framework**: Next.js (App Router, SSR)
- **CSS**: Tailwind CSS v4.1
- **Components**: shadcn/ui
- **Builder**: v0.app
- **Fonts**: Self-hosted WOFF2 via Next.js font optimization
- **Hosting**: Vercel (implied by Next.js + v0)

---

## Color Palette

### Primary Colors

| Name | Value | Usage |
|------|-------|-------|
| Brand Green | `#96BF48` | Logo, primary accent, CTA emphasis. Aligned with Shopify's brand green -- intentional ecosystem signal. |
| Black | `#000000` | Primary text, dark sections, dark-mode background |
| White | `#FFFFFF` | Page background, inverse text, light-mode default |

### Secondary / UI Colors

| Name | Value | Usage |
|------|-------|-------|
| Light border | `rgba(0,0,0,0.3)` | Borders, dividers (light mode) |
| Dark border | `rgba(255,255,255,0.3)` | Borders, dividers (dark mode) |
| Transparent | `#0000` | Overlay resets |

### Theme Tokens (shadcn/ui)

These CSS variables must be defined in the theme config. Current site uses a monochrome base with green accent:

```
--primary
--secondary
--accent
--destructive
--muted
--background
--foreground
--card
--border
--input
--ring
--popover
```

### Dark Mode

Supported via `@media (prefers-color-scheme: dark)`. Colors invert: background becomes black, text becomes white, borders swap to white-alpha.

### Color Rules

- The site is **monochrome-dominant**. Avoid introducing new hues.
- `#96BF48` is the only accent color. Use it sparingly for emphasis -- never as a large background fill.
- Metrics and proof points can use green to draw attention.
- Do not use red, blue, or other colors unless for semantic meaning (errors, links to external sites).

---

## Typography

### Font Stack

| Role | Font | Fallback |
|------|------|----------|
| Headings | **Montserrat** | Arial, system-ui, sans-serif |
| Body | **Open Sans** | Arial, system-ui, sans-serif |

Both fonts are loaded via `next/font` with `font-display: swap`.

### Weights

| Weight | Value | Usage |
|--------|-------|-------|
| Regular | 400 | Body text, descriptions |
| Medium | 500 | Subtle emphasis, labels |
| Semibold | 600 | Subheadings, feature titles |
| Bold | 700 | Section headings, CTAs |
| Black | 900 | Hero headline only |

### Sizing

Follow Tailwind's default type scale:

| Token | Size | Usage |
|-------|------|-------|
| text-sm | 0.875rem | Captions, metadata |
| text-base | 1rem | Body copy |
| text-lg | 1.125rem | Feature descriptions |
| text-xl--2xl | 1.25--1.5rem | Subheadings |
| text-3xl--4xl | 1.875--2.25rem | Section titles |
| text-5xl+ | 3rem+ | Hero headline |

### Letter Spacing

- **Headings**: `-0.025em` (tracking-tight) -- gives density and weight
- **Body**: default (0)
- **Labels/caps**: `0.025em` to `0.1em` (tracking-wide/widest) when using uppercase

### Rendering

Always apply `antialiased` on the html element for smooth font rendering.

---

## Layout

### Breakpoints

| Name | Width | Description |
|------|-------|-------------|
| sm | 640px | Mobile landscape |
| md | 768px | Tablet |
| lg | 1024px | Desktop |
| xl | 1280px | Wide desktop |

### Spacing

Base unit: `0.25rem` (4px). All spacing should use Tailwind's spacing scale (multiples of 4px).

Common values used on the site:

| Use case | Value |
|----------|-------|
| Tight gaps (icon + label) | 0.5rem (2) |
| Card internal padding | 1--1.5rem (4--6) |
| Section padding vertical | 3--5rem (12--20) |
| Section padding horizontal | 1--2rem (4--8), wider on lg+ |
| Between sections | 4--6rem (16--24) |

### Layout Model

- **Flexbox** for all layouts. Column-based section stacking.
- No CSS Grid usage observed -- keep it flex-based for consistency.
- Content is **vertically stacked** -- single-column hero, then alternating content sections.

---

## Page Structure

The site follows a strict vertical section pattern. Any new page should maintain this rhythm:

```
1. Navbar         -- Logo (left) + single CTA link (right)
2. Hero           -- Large headline + subtitle + primary CTA
3. Feature blocks -- Grouped by theme, cards with icon/title/description
4. Social proof   -- Metrics dashboard or case studies with numbers
5. Final CTA      -- Headline + subtitle + primary CTA (repeat)
6. Footer         -- Logo + copyright line
```

### Navigation

- Horizontal bar, always visible
- Logo on the left, single "Book a Call" link on the right
- No dropdown menus, no hamburger menu on current design
- Keep navigation minimal -- one CTA maximum

### Footer

- Logo repeated
- "2025 All rights reserved." (update year as needed)
- No link lists, no social icons -- keep it minimal

---

## Components

### Buttons / CTAs

- Primary CTA text: **"Book a Call Now"**
- Style: Link-based, not heavy filled buttons -- keeps the consultative, premium feel
- CTA appears exactly **twice** per page: hero and pre-footer section
- Do not add more CTA instances -- scarcity creates focus

### Feature Cards

- Structure: **Title** (semibold/bold) + **Description** (regular weight, lighter tone)
- Separated by horizontal dividers
- Grouped under a section heading with intro paragraph
- No icons currently -- text-only cards

### Metrics Display

- Large number (3x, 30%, $0.0M) as the focal point
- Label/description below in smaller text
- Displayed in horizontal rows (3 per case study)
- Numbers should feel bold and immediate

### Case Study Cards

- Structure: Title + narrative paragraph + 3 metric badges
- Written as mini-stories with concrete outcomes
- Always include timeline (e.g., "6mo") for credibility

---

## Visual Effects

### Shadows

Five-tier scale (use sparingly -- site is mostly flat):

| Size | Value |
|------|-------|
| xs | `0 1px 2px 0 #0000000d` |
| sm | `0 1px 3px 0 #0000001a, 0 1px 2px -1px #0000001a` |
| md | Standard Tailwind shadow-md |
| lg | Standard Tailwind shadow-lg |
| xl | `0 20px 25px -5px #0000001a, 0 8px 10px -6px #0000001a` |

### Border Radius

Uses `--radius` CSS variable with calc-based variants:
- `calc(var(--radius) - 2px)` for inner elements
- `calc(var(--radius) + 4px)` for outer containers
- Keep consistent -- never mix arbitrary radius values

### Transitions

- Default duration: **0.15s**
- Easing: `cubic-bezier(0.4, 0, 0.2, 1)`
- Used for hover states, accordion open/close, enter/exit animations
- Keep animations subtle -- no flashy transitions

### Animations

Available (via Tailwind/shadcn):
- `accordion-up` / `accordion-down`
- `enter` / `exit`
- `spin`, `pulse`
- `caret-blink`

### Z-Index

| Layer | Value |
|-------|-------|
| Base content | 1 |
| Floating elements | 10 |
| Dropdowns/popovers | 20 |
| Modals/overlays | 50 |
| Navigation/toast | 100 |

---

## Imagery

### Logo

- File: `clicar_logo_clean.svg`
- The wordmark "Clicar" is rendered in `#96BF48` green via linear gradient
- Behind the text: 8 bar-chart rectangles in `#96BF48` at 15% opacity -- a data-visualization motif
- Font in logo: Helvetica Neue, 72px, bold, letter-spacing -2
- Always use the SVG version for crispness at any size

### Photography / Illustrations

- **Neural network visualizations** (`neural_network.png`, `neural_network_v2.png`) -- abstract, dark, data/AI aesthetic
- No product screenshots, no team photos, no stock photography
- Imagery should feel **technical and abstract**, not literal
- Dark-toned data visuals against the white page create contrast

---

## Brand Voice

### Tone

- **Enterprise-professional** with consulting credibility
- Confident but not aggressive
- Data-driven -- always back claims with numbers

### Key Vocabulary

Use: permissionless, enterprise-grade, fractional expertise, optimization, intelligence, insights, profitability, propensity, affinity, allocation
Avoid: cheap, easy, simple, basic, DIY, hack, trick

### Content Patterns

- Headlines are **conceptual** ("The Architecture of Consumer Intelligence"), not functional ("Our Analytics Dashboard")
- Descriptions are **specific and metric-rich** ("30% reduction in inventory levels over six months")
- CTAs are **consultative** ("Book a Call Now"), not transactional ("Buy Now", "Start Free Trial")
- No pricing displayed -- the model is consultation-first
- No testimonials -- credibility comes from case study metrics

### Taglines

- Primary: "Consulting-Level Analytics for Your Store"
- Meta: "Transform your Shopify data into profit-driving insights with the same frameworks top consulting firms use."

---

## Rules Summary

1. **Monochrome + green.** Black, white, and `#96BF48`. No other colors.
2. **Montserrat for headings, Open Sans for body.** No other fonts.
3. **Flat and clean.** Minimal shadows, subtle transitions, generous whitespace.
4. **Single CTA per viewport.** "Book a Call Now" -- twice on the page, no more.
5. **Metrics over testimonials.** Prove value with numbers, not quotes.
6. **Consulting tone.** Enterprise vocabulary, conceptual headlines, specific descriptions.
7. **Abstract data imagery.** Neural networks and visualizations, not stock photos.
8. **Shopify-aligned green.** The brand color is an intentional ecosystem signal -- preserve it.
9. **Vertical rhythm.** Sections stack top-to-bottom. No complex grid layouts.
10. **Keep it minimal.** When in doubt, remove -- don't add.

See also: [[user_profile]], [[clicar_content_strategy]]
