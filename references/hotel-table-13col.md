# 13-Column Hotel Table — Exact Template

Mandatory column order. Copy this structure for every destination.

## Column Headers

```markdown
| Hotel (★ + Name) | Preis (€/N) | Pool | Strand (m) | Frühstück | Lage (km) | Bewertung | Empfehlung | Warnung (⚠️) | Google Maps | Buchung | Bemerkung |
|------------------|-------------|------|------------|-----------|-----------|-----------|------------|-------------|-------------|---------|-----------|
```

## Example Row (Antalya, Lara Park Hotel)

```markdown
| **[Lara Park Hotel](https://www.google.com/maps/search/Lara+Park+Hotel,+Antalya)** ★★★★ | 74€ | ✅ | 0m Direkt | ✅ Gratis | 12km | ⭐8.6 (2.1k) | PERFEKT für Familien! | 12km vom Zentrum – Mietwagen nötig | [🗺️](https://www.google.com/maps/search/Lara+Park+Hotel,+Antalya) | [🔗](https://www.google.com/travel/hotels/Lara+Park+Hotel+Antalya/entity/...) | Google Hotels, 7 Nächte |
```

## Column Definitions

| # | Column | Content | Format |
|---|--------|---------|--------|
| 1 | Hotel | ★ + Name, linked to Google Maps | `**[Name](google-maps-link)** ★★★★` |
| 2 | Preis | Per night in EUR | `74€` or `~120€` (estimated) |
| 3 | Pool | ✅ / ❌ / SPA | Emoji + text if relevant |
| 4 | Strand | Distance in meters | `0m Direkt`, `200m`, `1.5km` |
| 5 | Frühstück | ✅ Gratis / ❌ / €X extra | Clear yes/no/price |
| 6 | Lage | km to city center/old town | `12km`, `0.3km (Altstadt)` |
| 7 | Bewertung | ⭐ + rating + review count | `⭐8.6 (2.1k)` |
| 8 | Empfehlung | Traveler persona fit | `PERFEKT für Paare!`, `HIDDEN GEM!` |
| 9 | Warnung | ⚠️ MANDATORY — trade-off info | `KEIN Pool – €287 günstiger`, `Weit vom Strand: 2km` |
| 10 | Google Maps | 🗺️ emoji linked to maps search | `[🗺️](https://www.google.com/maps/search/Name,+City)` |
| 11 | Buchung | 🔗 emoji linked to exact booking | `[🔗](google-hotels-deep-link-with-dates)` |
| 12 | Bemerkung | Source + duration + notes | `Google Hotels, 7 Nächte` |

## Rules

- **Warnung is NEVER empty.** "Top-Lage, kein Nachteil" is the minimum.
- **Buchung links must be exact hotel URLs** — never generic destination pages.
- **Bemerkung always includes price source** — "Google Hotels", "Trivago", "Expedia".
- **Never write "trvl" as source** — it's the messenger, not the provider.
