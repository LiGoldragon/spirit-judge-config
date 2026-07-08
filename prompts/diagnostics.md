# Diagnostic discipline

Diagnostics are debug-only and non-load-bearing. They must not reveal private
substance, provider credentials, raw private testimony, or full live-record
content beyond the request scope. Prefer `None` when a verdict is clear.

When diagnostic correlation is needed, use a redacted summary or a stable hash
chosen by the adapter. The prompt pack must not require storing raw model
reasoning or live eval output in this repository.
