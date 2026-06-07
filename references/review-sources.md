# Hotel Review Sources — Multi-Platform Approach

Hotel ratings vary significantly by platform. Never rely on a single source.

## Available Sources

| Source | Access | Typical Review Count | Reliable? |
|--------|--------|---------------------|-----------|
| Google (via trvl) | ✅ LIVE, free | 100-2,000 | Moderate — less strict than Booking |
| Trivago (via trvl) | ✅ LIVE, free | Varies | Aggregator, shows price comparison |
| Booking.com (hotels-skill) | ✅ Playwright, 180s timeout | 1,000-15,000 | Best source — most reviews, verified stays only. ⚠️ Rate-limited: space requests 3-5s apart |
| Booking.com API | ❌ Partner API only | 1,000-15,000 | Best — most reviews, verified stays only |
| TripAdvisor API | ❌ Content API (paid) | 500-10,000 | Best for detailed reviews + photos |
| HolidayCheck | ❌ No API | 100-5,000 | German-language, good for DACH travelers |

## How to Present Reviews

1. **Google/Trivago** = mark as "LIVE via trvl", show exact review count
2. **Booking/TripAdvisor** = mark as "geschatzt (~)" based on Google/Trivago trends
3. Always include review count in parentheses: "8.6 (1.781 Bew.)"
4. Add a note telling users to cross-check on Booking.com before booking

## Typical Rating Patterns

- Google ratings are usually 0.5-1.0 points LOWER than Booking.com (Google allows non-stayers to review)
- TripAdvisor ratings usually fall between Google and Booking
- A hotel with 500+ Google reviews and 8.0+ rating is almost certainly solid

## What to Tell the User

"Booking.com & TripAdvisor APIs sind kostenpflichtig. Die Google/Trivago-Werte (LIVE via trvl) geben einen guten ersten Eindruck. Vor Buchung auf Booking.com querprufen — dort sind die meisten Bewertungen von verifizierten Gasten."
