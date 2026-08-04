# spirit-judge-config

Public prompt and configuration data for the admission-only Spirit judge.

The pack teaches the current four-field `Entry` contract: domains, kind,
description, and importance. It contains no certainty, privacy, or referent
policy, and no referent-registration pack. Provider confidentiality remains an
adapter concern: diagnostics must be redacted and must not include credentials,
raw provider output, or live corpus material.

Prompt prose is Markdown, indexed by the canonical NOTA manifest. Prompt edits
do not require rebuilding Spirit binaries, but they do change the live
admission curriculum; review them against `signal-spirit-judge` before release.
Fixtures are synthetic test material, not durable Spirit records.

See [ARCHITECTURE.md](ARCHITECTURE.md) for the boundary and
[`spirit`'s manual](https://github.com/LiGoldragon/spirit/blob/main/manual.md)
for ordinary and owner CLI use.
