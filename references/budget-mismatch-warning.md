# Budget/Traveler Mismatch — Real-World Warning

## Barcelona, July 2026

Barcelona was the agent's top recommendation: cheap flight (CHF 127) + best mix of city/beach/culture.

**Problem:** Hotels with pool + breakfast in July start at CHF 130-180/night — far above the user's budget. The cheap flight masked a destination mismatch.

## Rule

**Before crowning a winner, cross-check hotel prices against the user's daily budget.** If the cheapest 3★ hotel exceeds 40% of the daily budget, flag it immediately:

> "Barcelona ist verlockend günstig im Flug — aber die Hotels fressen das Budget auf. Mallorca und Antalya haben bessere Hotels für weniger Geld."

Mallorca: CHF 107/night 3★ → Total CHF 1.100
Barcelona: CHF 89+/night 3★ (no pool) → Total CHF 1.450+
Antalya: CHF 34/night 4★ → Total CHF 1.100

## Checklist Addition

- [ ] Before crowning winner: hotel price × 7 + flight × 2 < user's implied total budget?
- [ ] If no: warn user, offer alternatives with better hotel value