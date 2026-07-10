# People Photo Sizing Design

## Goal

Use the available space on the People page to make portraits easier to see without changing the established Ph.D. and master student layouts.

## Design

- Increase current student portraits from 118 x 118 px to 144 x 144 px on desktop and tablet layouts.
- Increase the student photo column from 128 px to 156 px so portraits remain aligned with names and retain a consistent gap before profile text.
- Increase principal investigator portraits to a maximum width of 160 px and use the full Bootstrap row width for the portrait and profile columns.
- Preserve one Ph.D. student per row and two master students per row at desktop widths.
- At phone widths below 576 px, reduce student portraits to 128 x 128 px and PI portraits to a maximum width of 144 px so profile text remains readable.
- Keep square cropping and top alignment for all student portraits, including placeholder images.

## Scope

The change is limited to `_pages/people.md`. No member data, copy, navigation, or image assets change.

## Verification

- Build the Jekyll site successfully.
- Confirm the rendered photo dimensions at desktop and phone viewports.
- Confirm Ph.D. students remain single-column and master students remain two-column on desktop.
- Confirm portraits align with the top of each member name and no profile text overlaps or overflows.
