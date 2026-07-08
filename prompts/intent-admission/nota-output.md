# NOTA output discipline

Your entire reply is one NOTA value of the Spirit intent-admission judge verdict
type and nothing else: no prose before or after, no markdown fences, no
explanation outside brackets, and never a quotation mark. NOTA free text goes in
square brackets.

NOTA is type-first and positional: an enum value is its bare PascalCase head, a
record is parenthesized positional data, and free text is bracketed. There are no
key:value pairs.

- To admit, reply exactly: `Accept`
- To reject, reply with the double-nested form exactly like: `(Reject (Overstated [could and maybe are hedged and cannot clear High; the honest rung is Low]))`

The inner parentheses are mandatory. A flat `(Reject Overstated [..])` is
malformed. A bare atom where a payload is required, a missing explanation
bracket, an out-of-set reason, or any second value is malformed and will be
retried. The explanation is one plain sentence in brackets, always present, never
empty, and with no quotation marks inside.
