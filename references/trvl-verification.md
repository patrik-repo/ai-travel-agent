# trvl Verification & Cross-Check

## Accuracy: Confirmed

trvl flight prices match Google Flights browser search **100%** (same-day cross-check):

| Date | Route | trvl | Google Browser | Delta |
|------|-------|------|---------------|-------|
| 07.06.2026 | ZRH→AYT XQ123 | EUR 253 | EUR 253 | EUR 0 |
| 07.06.2026 | ZRH→AYT XQ121 | EUR 274 | EUR 274 | EUR 0 |
| 07.06.2026 | ZRH→AYT PC5028 | EUR 317 | EUR 317 | EUR 0 |

Hotel prices: trvl = Google Hotels within 5% (Hampton: EUR 109 vs EUR 104).

## trvl Finds MORE Results

trvl discovered AJet 1-stop flights (EUR 335) that Google's "Best" tab didn't show. trvl's ranking includes more providers than the browser UI.

## When trvl Times Out

trvl hotel search can timeout (30s+) during high latency periods. Flight search is consistently fast (3-10s). If hotels timeout:
1. Retry once after 10s
2. Fall back to knowledge base (`references/destinations.yaml`)
3. Note in data freshness: "trvl timeout — used DB estimate"

## When to Cross-Check

- Always cross-check the first query of a session
- Cross-check if prices seem suspiciously high/low
- Cross-check when comparing to earlier cached prices
- Google browser search as gold standard
