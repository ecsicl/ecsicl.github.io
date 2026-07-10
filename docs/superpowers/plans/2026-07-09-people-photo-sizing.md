# People Photo Sizing Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Enlarge PI and current student portraits on the People page while preserving the established desktop grids and readable mobile profile text.

**Architecture:** Keep the change local to the existing inline People page styles and PI markup. Use fixed desktop portrait dimensions for visual consistency and one phone breakpoint to reduce the dimensions on narrow screens.

**Tech Stack:** Jekyll, Liquid, Bootstrap grid classes, CSS, Ruby assertions, Playwright browser verification

---

### Task 1: Add portrait sizing assertions

**Files:**
- Modify: `_pages/people.md:8-106`
- Test: one-off Ruby source assertion

- [x] **Step 1: Run a failing source assertion**

```bash
ruby -e 'text=File.read("_pages/people.md"); expected=["width: 144px;", "height: 144px;", "max-width: 144px;", "flex: 0 0 156px;", "max-width: 160px;", "@media (max-width: 575px)", "class=\"team-pi-photo\""]; missing=expected.reject{|item| text.include?(item)}; abort("missing: #{missing.join(", ")}") unless missing.empty?'
```

Expected: FAIL and list the new sizing rules that are not yet present.

### Task 2: Implement responsive portrait sizes

**Files:**
- Modify: `_pages/people.md:8-106`

- [x] **Step 1: Update current student portrait styles**

Set the desktop student dimensions and photo column to:

```css
.team-student-photo {
  width: 144px;
  height: 144px;
  max-width: 144px;
  object-fit: cover;
  display: block;
}

.team-member-photo-col {
  flex: 0 0 156px;
}
```

- [x] **Step 2: Add PI and phone styles**

```css
.team-pi-photo {
  width: 100%;
  max-width: 160px;
  height: auto;
  display: block;
}

@media (max-width: 575px) {
  .team-student-photo {
    width: 128px;
    height: 128px;
    max-width: 128px;
  }
  .team-member-photo-col {
    flex-basis: 140px;
  }
  .team-pi-photo {
    max-width: 144px;
  }
}
```

- [x] **Step 3: Use the full PI Bootstrap row and image class**

Change the PI portrait column and image markup to:

```html
<div class="col-sm-3 col-xs-12">
  <img class="team-pi-photo" src="{{ site.url }}{{ site.baseurl }}/images/{{ member.photo }}" alt="{{ member.name }}"/>
</div>
<div class="col-sm-9 col-xs-12">
```

- [x] **Step 4: Run the source assertion again**

Run the Task 1 command.

Expected: PASS with exit code 0.

### Task 3: Build and inspect generated output

**Files:**
- Test: `_site/people/index.html`

- [x] **Step 1: Build the Jekyll site**

```bash
bundle exec jekyll build
```

Expected: exit code 0 and `done` in the output.

- [x] **Step 2: Check the patch for whitespace errors**

```bash
git diff --check
```

Expected: exit code 0 with no output.

### Task 4: Verify layout in a browser

**Files:**
- Test: rendered `/people/` page

- [x] **Step 1: Start a local Jekyll server**

```bash
bundle exec jekyll serve --host 127.0.0.1 --port 4011 --no-watch
```

Expected: the People page is available at `http://127.0.0.1:4011/people/`.

- [x] **Step 2: Inspect desktop viewport at 1440 x 1000**

Confirm student portraits render at 144 x 144 px, PI portraits do not exceed 160 px, Ph.D. rows use the full content width, master rows remain two columns, and photo/name top offsets differ by no more than 1 px.

- [x] **Step 3: Inspect phone viewport at 390 x 844**

Confirm student portraits render at 128 x 128 px, PI portraits do not exceed 144 px, master rows collapse to one column, and no text or portrait overflows horizontally.

### Task 5: Commit and publish

**Files:**
- Modify: `_pages/people.md`
- Create: `docs/superpowers/plans/2026-07-09-people-photo-sizing.md`

- [ ] **Step 1: Stage only the intended files**

```bash
git add _pages/people.md docs/superpowers/plans/2026-07-09-people-photo-sizing.md
```

- [ ] **Step 2: Commit the implementation**

```bash
git commit -m "Enlarge People page portraits"
```

- [ ] **Step 3: Push the main branch**

```bash
git push origin main
```

- [ ] **Step 4: Verify the deployed People page**

Confirm `https://ecsicl.github.io/people/` contains the new `144px`, `160px`, and phone breakpoint rules after GitHub Pages finishes deploying.
