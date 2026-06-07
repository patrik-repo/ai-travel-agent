# Python Coding Pitfalls for Notion API Scripts

## 1. format() inside t() — SyntaxError

**Symptom:**
```
AttributeError: 'dict' object has no attribute 'format'
```

**Cause:**
```python
# WRONG — t() returns a dict, so .format() fails
t("Price: {}".format(value))

# RIGHT — format the string first, then pass to t()
t("Price: {}".format(value))
```

The `t()` function returns `{"type": "text", "text": {"content": text}}` — a dict. Calling `.format()` on a dict raises `AttributeError`.

**Rule:** Always apply `.format()` to the STRING, then pass the result to `t()`.

## 2. Notion API callout emoji — 400 Bad Request

**Symptom:**
```
HTTP Error 400: Bad Request
```
No clear error message in response body.

**Cause:** Empty or invalid emoji in callout block's `icon.emoji` field.

```python
# WRONG — empty string or text (e.g., "LIVE")
"icon": {"emoji": ""}
"icon": {"emoji": "LIVE"}

# RIGHT — single valid emoji character
"icon": {"emoji": "\u26a1"}        # ⚡
"icon": {"emoji": "\U0001f916"}    # 🤖
```

Notion validates the emoji field strictly — it must be a single emoji character, not text.

## 3. Hardcoded database IDs — 404 Not Found

Database IDs change between sessions. Always create or look up the database dynamically:

```python
# Create a new DB — reliable
db = {"parent": {"type": "page_id", "page_id": PAGE_ID}, ...}
req = urllib.request.Request("https://api.notion.com/v1/databases", ...)
db_id = json.loads(urllib.request.urlopen(req).read())["id"]
```

## 4. Security filter redacts token in write_file

When writing a Python script via `write_file()`, the token line `TOKEN = f.read().strip()` may appear corrupted in the tool output log (e.g., `TOKEN=f.read...DERS = {`), but the ACTUAL file on disk is correct. Always verify with `read_file()` before assuming corruption.

**Rule:** The `write_file` output is a LOG REDACTION only. The file content is correct. Use `read_file(limit=6)` to verify before running.

## 5. `t()` helper function signature

```python
def t(text):
    return {"type": "text", "text": {"content": text}}
```

Always keep this helper defined. The `b()` helper for blocks:
```python
def b(typ, data):
    return {"object": "block", "type": typ, typ: data}
```

## 6. Notion table block — 400 Bad Request from complex tables

Tables with 10+ columns or special characters can trigger 400 errors.
Simplify to bullet lists if a table fails. Diagnose: remove blocks one at a time
to find the problem block.

## 7. Token security filter affects ALL tool types

`ntn_*` / `secret_*` tokens are redacted in:
- `terminal()` commands (including heredocs)
- `execute_code()` scripts
- `write_file()` log output (but NOT the actual file content)
- `delegate_task()` context

The ONLY reliable way: read token from file at runtime with `open('/tmp/notion_token.txt').read().strip()`.
