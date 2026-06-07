# Price Display Rules

See also: `hotel-display-rules.md` for hotel-specific formatting, cool comments, and source attribution rules.

## Price Overview (always at top)

The first section after Data Freshness must be a clear price summary:

```
## Preis-Ubersicht

- Flight: EUR 253 p.P. (Airline, Route, direct/indirect)
- Hotel: EUR 52/night (Hotel name, stars, EUR 364/7N)
- Flight+Hotel: EUR 870 (2 persons)
- Total with food & activities: EUR 1,470 (EUR 735 p.P.)
```

## Tables over Bullet Lists

NEVER hide prices in paragraph text. Always use Notion tables:

Flight table:
| Route | Airline | Depart | Arrive | Duration | Type | Price p.P. | Source |
|-------|---------|--------|--------|----------|------|-----------|--------|

Hotel table:
| Hotel | Stars | Rating | EUR/night | EUR/7N | Pool | Beach | Breakfast | All-Inc | Source Prices | Source Amenities |
|-------|-------|--------|-----------|--------|------|-------|-----------|---------|--------------|-----------------|

**Hotel table MUST include Pool, Beach, Breakfast columns.** Users want to know if they can swim, how far the beach is, and if breakfast is included. Add All-Inc if available.

Budget table:
| Item | Amount | Details |
|------|--------|---------|

Comparison table:
| Destination | Flight p.P. | Flight total | Hotel/night | Hotel/7N | Total | Direct? | Source |

## Calculation Checklist

Before pushing, verify:
- [ ] Flight: `price_per_person * number_of_people = total` (e.g., EUR 253 * 2 = EUR 506)
- [ ] Hotel: `price_per_night * number_of_nights = total` (e.g., EUR 52 * 7 = EUR 364)
- [ ] Flight+Hotel: `flight_total + hotel_total = combined` (e.g., EUR 506 + EUR 364 = EUR 870)
- [ ] Grand total: `combined + food + activities + transport = final` (e.g., EUR 870 + EUR 350 + EUR 200 + EUR 50 = EUR 1,470)

## Per-Person Prices

Always show BOTH total and per-person. Format: `EUR 1,470 (EUR 735 p.P.)`

## Source Column

Every table must have a "Source" column showing where the price came from:
- `Google Flights` — live query
- `Google Hotels` — live query
- `~Schatzung` — knowledge base estimate
