# HTML Output Rules

## Golden Rule

HTML-first. Never generate PDF or Notion unless user explicitly asks. The user prefers HTML with an embedded PDF button.

## Page Structure (10 sections — MUST follow this order)

1. **Header** — Destination + Dates + "📕 Als PDF speichern" button
2. **Comparison Table** — ALL destinations with emojis, flags, stars (user sees WHY winner was chosen)
3. **Why Winner Won** — Reasoning as emoji bullet list
4. **Flexible Dates** — If applicable, with savings callout
5. **Budget** — 3 variants (Spar/Mittel/Komfort), flexbox layout
6. **Flights** — Table with Hin-/Rückflug, flight numbers, prices
7. **Hotels** — 10+ hotels, full table with Lage column, pool, breakfast, rating
8. **Itinerary** — 7-day plan with todo checkboxes
9. **Tips** — Reise-Infos, Transfer, Wetter, Packliste, Insider-Tipps
10. **Price Alert** — Yellow callout box

## Style Requirements

- Orange gradient header (#f97316 → #ef4444)
- Green badges for JA/✅, red for NEIN/❌
- Purple text for gems (HIDDEN GEM!, TOP-RATING!)
- Green prices (.price class, #059669)
- Hover effect on table rows (background #fff7ed)
- @media print hides .noprint elements
- 3-column flexbox for budget variants
- Winner row in hotel table: green background

## PDF Button

```html
<a href="javascript:window.print()" class="noprint" 
   style="display:inline-block;background:white;color:#f97316;padding:8px 20px;
          border-radius:6px;text-decoration:none;font-weight:700;font-size:0.9em">
   📕 Als PDF speichern
</a>
```

With CSS: `.noprint, .noprint * { display: none !important; visibility: hidden !important; }` inside `@media print`.

## Budget Variants (always 3)

Three columns, differing only in hotel. Food, activities, transport = identical:

| Variant | Hotel | Color |
|---------|-------|-------|
| 🟢 Spar | Cheapest 3★ | Green border, #f0fdf4 bg |
| 🟡 Mittel | Best value 3-4★ | Yellow border, #fef3c7 bg |
| 🔴 Komfort | Best 4-5★ with pool/beach | Red border, #fee2e2 bg |

## Cool Comments (use in hotel tables)

- HIDDEN GEM! — 3★ with rating > 8.5
- SCHNÄPPCHEN! / LUXUS-DEAL! — 5★ under CHF 60/night
- TOP-RATING! — any with rating > 8.5
- GÜNSTIGSTES! — cheapest option
- PERFEKT für [Persona]! — best match
