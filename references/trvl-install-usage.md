# trvl MCP Server — Install & Usage

## What is trvl?

`trvl` (MikkoParkkola/trvl, GitHub ⭐33+) is a Go binary that serves as a canonical travel MCP server. 43 MCP tools, 22 providers (Google Flights, Skyscanner, Kayak, Trivago, Expedia, Skiplagged, HomeToGo...), zero API keys for core search. Also works as standalone CLI with 56 commands.

## Install

```bash
# Download latest Linux AMD64 binary
TRVL_VER=$(curl -sL https://api.github.com/repos/MikkoParkkola/trvl/releases/latest | python3 -c "import json,sys; print(json.load(sys.stdin)['tag_name'])")
curl -sLO "https://github.com/MikkoParkkola/trvl/releases/download/${TRVL_VER}/trvl_${TRVL_VER#v}_linux_amd64.tar.gz"
tar xzf trvl_*.tar.gz
mkdir -p ~/.local/bin && mv trvl ~/.local/bin/
```

## Hermes MCP Config

Add to `~/.hermes/config.yaml` under `mcp_servers`:

```yaml
  trvl:
    command: /home/agent/.local/bin/trvl
    args:
      - mcp
    timeout: 120
```

## CLI Usage

```bash
# Flights: returns price, airline, flight number, aircraft, duration, booking links
trvl flights ZRH AYT 2026-07-15 --return 2026-07-22 --stops nonstop

# Hotels: returns name, stars, rating, reviews, price/night, amenities, savings
trvl hotels "Antalya" --checkin 2026-07-15 --checkout 2026-07-22 --stars 4

# Weather (via tools, not CLI directly — use wttr.in for CLI)
curl wttr.in/Antalya?format=3

# Compare multiple destinations in parallel
for dest in AYT HRG LPA TFS SID; do
  trvl flights ZRH $dest 2026-07-15 --return 2026-07-22 &
done
wait
```

## Live Test Results (07.06.2026)

| Destination | Flight | Hotel 4★ (lowest) |
|------------|--------|-------------------|
| Antalya | €254 SunExpress XQ123 direct 3h15 | €37 Hotel Luna |
| Hurghada | €666 Chair CS444 direct 4h25 | €28 Royal Beach |
| Tenerife | €692 Edelweiss WK214 direct 4h30 | — |
| Gran Canaria | €717 Edelweiss WK200 direct 4h30 | — |

## Providers

Google Flights, Skyscanner, Kayak, Trivago, Expedia, Skiplagged, HomeToGo, Booking, Trip.com, and 13 more. See `trvl providers` for full list.

## Pitfalls

- **skiplagged 429**: trvl falls back to other providers, works fine
- **hometogo 403**: hotel search still works via Google/Trivago
- **Hotels timeout with many results**: limit with `--stars` filter
- **No sudo on this system**: install to `~/.local/bin/` not `/usr/local/bin/`
