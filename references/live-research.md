# Live Flight & Hotel Research via Browser

How to fetch real-time prices from Google Flights and Google Hotels using the Hermes browser tool.

## Google Flights

### URL Pattern

```
https://www.google.com/travel/flights?q=flights+<origin>+to+<dest>+<departure>+<return>
```

Example: `flights+zurich+to+antalya+july+15+2026+return+july+22+2026`

### Steps

1. Navigate to the URL
2. Cookie wall appears → accept with JS: `for(var f of document.querySelectorAll('form')){var b=f.querySelector('button');if(b&&b.textContent.includes('Accept')){f.submit();break;}}`
3. Snapshot shows flight results with prices in EUR
4. Extract: cheapest price from tab, individual flights from list items

### What You Get

- Exact flight times (departure/arrival)
- Airline name
- Duration
- Number of stops (direct/1 stop/etc.)
- Price per person in EUR
- Multiple flight options (3-5 best flights)

### Limitations

- Works perfectly for ANY origin/destination combination
- Prices shown are for 1 adult, basic fare (no baggage)
- July 2026 data IS available (contrary to assumption it's too far out)

## Google Hotels

### URL Pattern

Hotels are trickier — they don't work via URL alone because the search context defaults to "near Germany" with wrong dates.

### Steps

1. Navigate to Google Flights FIRST for the destination
2. Accept cookies
3. Click the "Hotels" tab in the navigation
4. **IMPORTANT**: The Hotels tab often does NOT inherit the destination from Flights
5. Type the destination name in the hotels search box (e.g., "Antalya 4 star hotels")
6. Press Enter
7. Snapshot shows hotel results

### What You Get (when it works)

- Hotel name
- Price per night
- Star rating + review count
- Amenities (pool, beach, breakfast, all-inclusive)
- Eco-certification status

### Limitations

- **ONLY works for some destinations** (Antalya worked, Hurghada and Gran Canaria did not)
- Google Hotels blocks direct URL access without manual date input
- Dates shown may default to wrong values (check-in/out fields)
- Fallback: use knowledge base estimates for blocked destinations

## Common Pitfalls

1. **Cookie wall every time** — always run the JS acceptance script first
2. **Hotels tab doesn't inherit location** — need to manually type destination
3. **Dates reset** — hotels tab often shows wrong/default dates
4. **Currency** — prices are in EUR for European searches, USD for others
5. **"No results"** — means the destination needs manual date input in the hotels search

## Data Freshness

Always record:
- Timestamp of query (DD.MM.YYYY ~HH:MM UTC)
- Which tool was used (browser_navigate, browser_snapshot)
- What was extracted (flight prices, hotel prices)
- Whether Google Hotels succeeded or fell back to knowledge base
