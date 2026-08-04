# spirit-judge-config — architecture

`spirit-judge-config` owns public prompt and configuration data for the
admission-only Spirit judge.

Prompts are Markdown files grouped by admission concern and indexed by a NOTA
manifest. `spirit-judge` loads the pack at runtime; the daemon never embeds or
interprets this prose. The pack is public, while provider diagnostics and any
content that crosses the provider boundary are handled by the adapter's
redaction rules.

## Boundary

Owned here:

- public prompt prose for the Spirit intent-admission judge and its current
  four-field `Entry` contract (domains, kind, description, importance);
- NOTA manifests that name prompt files, prompt order, and fixture files;
- non-secret provider and model-selection configuration data when the adapter
  needs it;
- test fixtures that exercise prompt/config boundaries without claiming their
  content as durable Spirit intent.

Not owned here:

- provider credentials, tokens, or secret values;
- executable daemon or adapter code;
- Spirit storage, retrieval, or admission-operation implementation;
- live Spirit intent records;
- certainty, privacy, or referent policy, including referent-registration
  prompts;
- generic judge-anything prompt packs.

## Fixture rule

Fixture files are synthetic test material. They may validate the judge boundary,
but they are never evidence that any example is accepted durable Spirit intent.
