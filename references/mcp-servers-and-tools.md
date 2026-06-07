# Travel MCP Ecosystem & Tool Landscape

> **Last surveyed:** 07.06.2026 via `gh search repos "travel mcp" --sort stars --limit 15`

## tl;dr: trvl is the best standalone travel MCP for Hermes

No other open-source travel MCP matches trvl's combination of: zero API keys, 22 providers, 43 tools, CLI + MCP dual-mode, and price alerts. The bigger repos are either Claude-Code-only plugins or research projects.

## Full Ecosystem (June 2026)

| Repo | ⭐ | Type | API Keys? | Hermes-Ready? |
|------|-----|------|-----------|---------------|
| 🔥 **MikkoParkkola/trvl** | 33 | Standalone Go binary, MCP+CLI | ❌ Zero | ✅ **Yes** |
| borski/travel-hacking-toolkit | 532 | Claude Code plugin, 42 skills, 6 MCPs | ❌ 5 free, 1 paid | ❌ Plugin-only |
| Haohao-end/Ctrip-Style | 55 | LangChain multi-agent research | ❌ | ❌ Research |
| tanayshah11/travel-mcp-server | 4 | Booking.com via RapidAPI + MongoDB | ✅ RapidAPI | ✅ Needs key |
| ppiova/TravelMCP | 3 | Minimal MCP, Amadeus-only | ✅ Amadeus | ✅ Needs key |
| lev-corrupted/travel-mcp-server | 3 | Basic flight search | ✅ | ✅ Needs key |
| ottotheagent/openclaw-otto-travel | 2 | OpenClaw skill | ✅ | ❌ Different platform |
| fiqcodes/amadeus-mcp-server | 1 | Amadeus GDS (backend of all airlines!) | ✅ Amadeus | ✅ Needs key |
| adrianetti/travel-search | 1 | OpenClaw skill: Kiwi+Skiplagged+Trivago+Ferryhopper | ❌ | ❌ Different platform |

### Why travel-hacking-toolkit (⭐532) doesn't replace trvl

It's the biggest travel repo on GitHub — but it's a **Claude Code plugin**, not a standalone MCP server. It installs via `/plugin marketplace add borski/travel-hacking-toolkit` inside Claude Code. Its 6 MCP servers (Skiplagged, Kiwi, Trivago, Ferryhopper, Airbnb, LiteAPI) are bundled as plugin resources, not exposed as standalone HTTP/stdio MCP endpoints that Hermes can connect to.

If the user ever moves to Claude Code, this would be a better option. For Hermes, trvl remains king.

### Discovery method

```bash
gh search repos "travel mcp" --sort stars --limit 15 --json name,owner,stargazersCount,description
```

Results cached above. Re-run when trvl updates or user asks about alternatives.

## trvl MCP Server — Setup & Usage

## Installation

```bash
# Download latest binary
curl -sLO "https://github.com/MikkoParkkola/trvl/releases/latest/download/trvl_$(curl -s https://api.github.com/repos/MikkoParkkola/trvl/releases/latest | grep tag_name | cut -d'"' -f4 | sed 's/v//')_linux_amd64.tar.gz"
tar xzf trvl_*_linux_amd64.tar.gz
cp trvl ~/.local/bin/
```

## Hermes Config

Add to `~/.hermes/config.yaml` under `mcp_servers:`:

```yaml
  trvl:
    command: /home/agent/.local/bin/trvl
    args:
      - mcp
    timeout: 120
```

## Capabilities

- **43 MCP tools** via 22 providers (Google Flights, Skyscanner, Kayak, Trivago, Expedia, etc.)
- **Flights:** `trvl flights ZRH AYT 2026-07-15 --return 2026-07-22` — returns airline, flight number, aircraft, price, duration, booking links
- **Hotels:** `trvl hotels "City" --checkin 2026-07-15 --checkout 2026-07-22 --stars 4` — returns name, rating, reviews, price, amenities
- **Weather:** Built-in weather data
- **Price alerts:** Built-in price tracking
- **Trains, buses, ferries:** Multi-modal transport
- **Zero API keys** required for core search
- **1 smart tool** with 65 compatibility aliases — 98.9% smaller context footprint

## Limitations

- Hotel amenities from trvl are unstructured (e.g., "kitchen, free_wifi, pool") — not a clean "Pool: Yes/No"
- For clean Pool/Strand/Frühstück columns, supplement with Google Hotels browser data or knowledge base
- Some providers may rate-limit (Skiplagged often returns 429)
- HomeToGo hotel search may 403 for some destinations

## Complementary: better-notion-mcp

For improved Notion API access (10 composite tools, markdown→blocks conversion):

```yaml
  better-notion:
    command: npx
    args:
      - "-y"
      - "@n24q02m/better-notion-mcp"
    env:
      NOTION_TOKEN: <your_notion_token>
    timeout: 120
```

## Complementary: hotels-skill (Booking.com via Playwright)

Browser-automation MCP server for Booking.com hotel scraping with detailed amenities:

```yaml
  hotels-skill:
    command: /tmp/hotels-skill/.venv/bin/python3
    args:
      - /tmp/hotels-skill/mcp_server.py
    timeout: 180
```

**Installation**:
```bash
git clone https://github.com/<repo>/hotels-skill /tmp/hotels-skill
cd /tmp/hotels-skill
uv venv && uv pip install -r requirements.txt
uv run playwright install chromium
```

**Capabilities**: Exact Pool/Beach/Breakfast data (structured), real-time availability, direct Booking.com prices.

**⚠️ Rate-limiting**: Booking.com blocks aggressive scraping. Space requests at least 3-5 seconds apart. Falls back to trvl hotel search if rate-limited.

## Complementary: travel-mcp-server (Booking.com Direct API)

Alternative MCP server for Booking.com via RapidAPI. Provides structured search with coordinates, dates, and amenities.

```yaml
  travel-mcp:
    command: npx
    args:
      - "-y"
      - "travel-mcp-server"
    env:
      RAPIDAPI_KEY: <your_booking_com_rapidapi_key>
    timeout: 120
```

**Tools available** (v1.0.3):
- `today` — get today's date
- `search-flights` — flights with from/to/dates/cabinClass/sort (all params required)
- `search-hotels-by-coordinates` — hotels by lat/lon with radius, adults, children, price range, currency

**⚠️ Requires RapidAPI key.** Without credentials, tools return errors — this is NOT a zero-API-key solution like trvl. The `RAPIDAPI_KEY` env var must be set to a valid Booking.com API key from rapidapi.com.

**⚠️ Stdout oddity:** The server's startup banner says "Weather MCP Server running on stdio" — this is a copy-paste artifact from its scaffolding template. Ignore it; the tools are travel-focused.

**Comparison with trvl:**
| Feature | trvl | travel-mcp-server |
|---------|------|-------------------|
| API keys | Zero | Requires RapidAPI |
| Providers | 22 (Google, Expedia, etc.) | 1 (Booking.com) |
| Flight search | ✅ Flexible params | ✅ Required params only |
| Hotel search | ✅ By city name | ✅ By coordinates (needs lat/lon lookup) |
| Amenities | Unstructured tags | Structured (via Booking.com API) |
| Price alerts | ✅ Built-in | ❌ |
| Currency | ✅ `--currency` flag | ✅ `currencyCode` param |

**Verdict:** Useful as a supplementary cross-check for hotel amenities, but trvl remains the primary tool — zero API keys, more providers, built-in price alerts.

## Complementary: wttr.in (Weather)

Free, no API key, instant weather via curl:
```bash
curl -s "wttr.in/<City>?format=3"
# Returns: "City: ☀️ +32°C"
```
