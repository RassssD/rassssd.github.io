# Site roadmap & known issues

Running log of bugs, in-progress features, and ideas for rassssd.github.io. Not published navigation — just a working notes file.

## Known issues

- [x] `_layouts/default.html` referenced `assets/js/pdf_gallery.js`, `assets/js/scale.fix.js`, and unused React CDN scripts — none of these files existed in the repo (not even in git history), so every page silently 404'd on them. Removed the dead `<script>` tags (2026-09-28). If a PDF gallery or scale-fix behaviour is wanted later, build it deliberately rather than resurrecting the old references.
- [x] Checked whether `resources/papers/Resume_Rasmus_Duret.pdf` was stale relative to `Resume_Rasmus_Duret.typ` — compiled the `.typ` locally with `typst compile` and diffed against the committed PDF; only trivial metadata bytes differ, content matches. No fix needed (2026-09-28).
- [x] `_config.yml` had `include: assets/data`, but `assets/data/` doesn't exist. Removed (2026-09-28).
- [x] `_layouts/default.html` also carried an unused `button.accordion`/`button.accordion2`/`div.panel` CSS block plus a JS click-toggle script — the only page using it was `pages/research.md`'s old abstract accordion. Removed both, and switched `research.md` to native `<details>/<summary>` (styled as a chip) instead (2026-09-28) — no JS needed, matches the tommharris reference pattern.
- [x] Reworked `pages/research.md` into consistent paper "cards" (badge → title → authors/year → link chips → abstract → text+image body), styled via new `.paper*` rules in `assets/css/styles.css`. The text+image body is now a responsive flexbox that stacks under 700px, fixing the old fixed 50/70% inline-style split that had no mobile breakpoint (2026-09-28).
- [x] Tracking scaffolded: swapped the dead Google Analytics conditional (its `analytics.html` include never existed, so enabling it would have broken the build) for a GoatCounter script block, gated the same way via `site.goatcounter` in `_config.yml` (2026-09-28). **Action needed from you**: sign up free at https://www.goatcounter.com, then uncomment `goatcounter: your-code` in `_config.yml` and set it to your site code — I can't create the account for you. Until then tracking stays off (config unset), nothing is broken.
- [ ] Some images are uncompressed/large for a personal site (e.g. `images/portrait_2024_Round.png` at ~7.3MB). Decided to keep as-is for now — convenient way to keep high-res source images available.
- [ ] No local Jekyll build/preview set up — broken links or layout issues currently only surface after pushing live. (Couldn't verify the research page rewrite with a local Jekyll build for the same reason — no Ruby/Jekyll installed in this environment. Markup follows the same raw-HTML-block pattern kramdown was already rendering correctly on this page, so risk is low, but worth eyeballing the live page after deploy.)
- Publications gallery for papers/slides (thumbnail + inline viewer instead of plain external links) — flagged as a "maybe later" idea, not started. For now, plain external links to PDFs are fine.
- Overall page layout/banner rework — planned for later, using the tommharris reference below as partial inspiration. Not started.

## In progress

- (none tracked yet — add here as you start things)

## Ideas / improvement backlog

- (add ideas here as they come up)

## Design reference: tommharris.github.io

Rasmus flagged this site (https://github.com/TomMHarris/tommharris.github.io) as a layout he likes, especially the research page (`research.html`). Notes for when we revisit our own layout — not yet acted on.

What's good about it:

- **Structure per paper**: venue badge (e.g. "SSRN") → title → authors → year → a row of pill-style link buttons (Abstract, Paper, Data, Interactive Map) → optional media-coverage line → image. Consistent, scannable pattern regardless of paper type.
- **Abstracts as native `<details>/<summary>`**, styled as a bordered chip that expands inline — no custom JS needed (our current accordion uses a hand-rolled JS toggle + `.active`/`.show` classes for the same effect). Simpler and more robust.
- **Author list with progressive disclosure**: long author lists collapse to "and 9 more authors", click to expand — keeps papers with big author lists from dominating the page.
- **Three clean sections**: Working Papers / Work in Progress / Policy Papers. We already split Working papers / Older papers; their explicit "Work in Progress" section (title + one-line description, no abstract chip) is a nice lighter-weight format for papers that aren't public yet — could fit the Estonia fertility paper's current "very early-stage" note.
- **Clickable images**: when a figure has an interactive online version, the image itself is a link (`paper-image-link`), with the border firming up on hover to signal it's clickable — no separate "click here" text needed.
- **Media coverage row**: outlet name links, colored in the outlet's own brand color only on hover (FT blue-on-pink, Economist red, etc.) — restrained, not present until you notice it.
- **Design system via CSS custom properties**: one shared `style.css` defines `--bg`, `--text`, `--text-dim`, `--rule`, serif/sans font stacks once; each page's own `<style>` block only has page-specific rules. Lightweight, no build step, easy to keep visually consistent across pages.
- **Overall layout**: top nav (serif wordmark left, links right, no boxed bar) instead of our current fixed left sidebar with portrait photo; single centered column (`max-width: 820px`); generous whitespace; single responsive breakpoint at 600px that stacks the nav and lets images go full-width.
- **Analytics**: GoatCounter, see visitor-stats note above.

Not everything here needs adopting wholesale — our sidebar-with-portrait layout has its own identity — but the research-page card pattern (badge/title/authors/year/link-chips/media/image) and the `<details>`-based abstract are the two most directly reusable ideas if/when we redo `pages/research.md`.

## Notes

- Site is built with Jekyll (`minima` theme) on GitHub Pages, no custom CI.
- Nav lives in `_layouts/default.html` (sidenav hardcoded, not data-driven).
- Content pages are Markdown in `pages/`; Jekyll auto-converts `.md` → `.html`, which is why links like `/pages/research.html` work despite the source being `research.md`.