# Home and People Refresh Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Correct homepage copy and convert People profiles to a responsive two-column card layout.

**Architecture:** Keep member data in the existing YAML files and limit implementation changes to the two page templates. Use page-scoped CSS in `people.md` so the visual change does not affect other site pages.

**Tech Stack:** Jekyll, Liquid, HTML, CSS, Playwright

---

### Task 1: Refresh homepage copy

**Files:**
- Modify: `_pages/home.md`

- [ ] Replace the hardware-accelerator topic wording.
- [ ] Rewrite the prospective-student paragraph with the full lab name and collective voice.
- [ ] Replace the ranking note with current official UCI and CSUF facts.
- [ ] Run `bundle exec jekyll build` and confirm the generated homepage contains the new values.

### Task 2: Build responsive member cards

**Files:**
- Modify: `_pages/people.md`

- [ ] Replace the current flex sizing with a two-column desktop grid and one-column responsive fallback.
- [ ] Apply the member-card visual treatment to PI, Ph.D., and master's profiles.
- [ ] Preserve portrait dimensions, inline links, section logos, education, and research-interest content.
- [ ] Build the site and inspect generated People markup.

### Task 3: Verify and publish

**Files:**
- Verify: `_site/index.html`
- Verify: `_site/people/index.html`

- [ ] Use Playwright to check desktop and mobile layout, wrapping, alignment, and overflow.
- [ ] Confirm only the intended files are staged.
- [ ] Commit and push to `main`.
- [ ] Wait for GitHub Pages deployment and verify the production pages.

