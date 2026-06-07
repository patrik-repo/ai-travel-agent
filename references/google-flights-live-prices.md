# Google Flights Live Price Verification

## How to get live flight prices via browser

### Step 1: Navigate with correct URL
```
https://www.google.com/travel/flights?q=flights+from+zurich+to+antalya+july+15+2026+return+july+22+2026
```
URL format: `flights+from+<origin>+to+<dest>+<month>+<day>+<year>+return+<month>+<day>+<year>`

### Step 2: Bypass cookie consent
Google shows a cookie wall. Submit the "Accept all" form via JS:
```javascript
for(var f of document.querySelectorAll('form')){var b=f.querySelector('button');if(b&&b.textContent.includes('Accept')){f.submit();break;}}
```

### Step 3: Extract prices from snapshot
The page snapshot shows:
- Tab "Cheapest from €XXX" — lowest round-trip price
- Flight list with airline names, times, durations, stops
- "Nonstop" or "1 stop" indicators

### Step 4: Get hotel prices
Click the "Hotels" tab (NOT direct URL) — this inherits the correct dates from flights. Apply 4-star filter. Snapshot shows "Prices starting from €XX" per hotel with ratings and amenities.

## Known Working Destinations (tested July 15-22 2026 from ZRH)

| Destination | Cheapest | Airline | Stops | Duration |
|------------|----------|---------|-------|----------|
| Antalya (AYT) | €253 | SunExpress | Nonstop | 3h15 |
| Hurghada (HRG) | €341 | Pegasus | 1 stop | 9h45 |
| Gazipasa/Alanya (GZP) | €467 | Turkish | 1 stop | 6h05 |
| Gran Canaria (LPA) | €331 | Vueling | 1 stop | 10h25 |
| Bodrum (BJV) | €335 | AJet/Turkish | 1 stop | 6h05 |

## Known Working Destinations (tested July 15-22 2026 from BSL/EAP)

| Destination | Cheapest | Airline | Stops | Duration |
|------------|----------|---------|-------|----------|
| Antalya (AYT) | €265 | SunExpress | Nonstop | 3h20 |

**Key finding:** ZRH is slightly cheaper than BSL (€253 vs €265 to Antalya). Both have direct SunExpress flights. ZRH has more flight options and times.

**Alanya Hack:** Google itself suggests "Fly to AYT for €254" when searching GZP. Flying to Antalya + 2h bus (€10) is cheaper than flying directly to Gazipasa (€467+).

## Hotels (4★ Antalya, live from Google)

| Hotel | €/Night | Rating | Pool | Beach | Breakfast |
|-------|---------|--------|------|-------|-----------|
| Can Adalya Palace | €52 | 4.2★ | ❌ | ❌ | Free |
| Lara Park Hotel | €74 | 4.3★ | ✅ | ❌ | Paid |
| Qinn Hotels | €78 | 4.3★ | ✅ | ✅ | Free |
| Hampton by Hilton | €104 | 4.7★ | ❌ | ❌ | Free |

## Pitfalls

- Google Hotels direct URL search returns "No results" — always navigate from Flights tab
- Google Hotels and Google Flights are COMPLETELY separate modules — Hotels tab does NOT inherit destination from Flights tab URL, only dates
- Hotel search by city+checkin URL parameters is ignored — manual search box input required
- Cookies must be accepted each session
- Prices are per person for flights, per night for hotels
- Some flights exclude carry-on (SunExpress Basic) — check bag fees
- Always check both departure airports (ZRH + BSL) — user may have preference
