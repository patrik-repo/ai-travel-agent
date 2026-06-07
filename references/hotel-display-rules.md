# Hotel Display Rules

## One Master Table

Every destination gets ONE hotel table. Never scatter hotel data across multiple tables. One table with ALL star levels (3★ + 4★ + 5★).

## Columns (11 minimum)

| Column | Format | Example |
|--------|--------|---------|
| Hotel | Name | "My Home Hotel" |
| ★ | Star count | 3 / 4 / 5 |
| Bewertung | "X.X (YYY)" + optional cool tag | "9.0 (369) HIDDEN GEM!" |
| EUR/N | Price per night | "EUR 35" |
| EUR/7N | Price for 7 nights | "EUR 245" |
| Pool | JA/NEIN/SPA | "JA" |
| Strand | Distance/access | "JA direkt!" / "per Bus (15 Min)" |
| Frühstück | GRATIS/EUR extra/NEIN | "GRATIS" |
| Lage (km Altstadt) | District + km | "Kaleici, 0km MITTENDRIN!" |
| Best For + Warning | Combined: positive + trade-off | "PERFEKT fur Familie! Aber: 15km zur Altstadt." |
| Quelle | Real provider, never "trvl" | "Google Hotels" |

## Cool Comments

Use these in the Bewertung or Best For column to add personality:

| Tag | When to use |
|-----|------------|
| HIDDEN GEM! | 3★ with rating > 8.5 |
| SCHNÄPPCHEN! | 5★ under EUR 60/night |
| LUXUS-DEAL! | 5★ under EUR 50/night |
| TOP-RATING! | Any hotel with rating > 8.5 |
| GUNSTIGSTES! | Cheapest in the table |
| MITTENDRIN! | 0km to city center |
| PERFEKT fur [X]! | Best match for user's persona |

## Warning Column

Always combine Best For and Warning into ONE column. Format:
```
"Perfekt fur [Persona]. Aber: [Trade-off]."
```

Examples:
- "PERFEKT fur Papa+Tochter! Aber: 5km zur Altstadt."
- "GUNSTIGSTES! Aber: KEIN Pool, KEIN Fruhstuck."
- "5* zum 4*-Preis! SCHNAPPCHEN! Aber: Weit von Altstadt."

## Source Column

NEVER write "trvl" or "trvl LIVE". Always name the actual provider:
- "Google Hotels"
- "Google Flights"
- "Trivago"
- "Expedia"
- "Skyscanner"

## Spelling

- "Flüge" not "Fluge"
- "Frühstück" not "Fruhstuck"
- All prices with "EUR" prefix, not "€"
