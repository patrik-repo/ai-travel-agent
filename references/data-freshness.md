# Data Freshness Rules

Every Notion page created by the Travel Agent must include a "Daten-Frische" block.

## Format

```markdown
## Daten-Frische (Stand: DD.MM.YYYY)

| Daten | Quelle | Methode | Zeitstempel |
|-------|--------|---------|------------|
| Flight prices (target) | Google Flights | Browser live | 06.06.2026 ~20:00 |
| Flight prices (others) | Google Flights | Browser live | 06.06.2026 |
| Hotel prices (target) | Google Hotels | Browser live | 06.06.2026 ~20:15 |
| Hotel prices (others) | Knowledge base | Estimate | Stand 06.06.2026 |
| Restaurant prices | Knowledge base | Estimate | Stand 06.06.2026 |
```

## Rules

1. **LIVE** = fetched from Google Flights/Hotels via browser in this session
2. **Estimate** = from the 92-destination knowledge base (`references/destinations.yaml`)
3. Timestamps use format: `DD.MM.YYYY HH:MM`
4. If Google Hotels blocks a destination, state it explicitly: "Google Hotels blocked for [city] — estimate used"
5. Prices in tables: no prefix = LIVE. `~` prefix = estimate.
6. This block must be the SECOND block on the page, after the title
