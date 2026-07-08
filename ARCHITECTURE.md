# spirit-judge-config — architecture

`spirit-judge-config` owns public prompt and configuration data for Spirit judge
admission flows.

Prompts are Markdown files grouped by Spirit-specific judge concern and indexed
by a NOTA manifest. Prompt data stays outside Rust and Nix-built binaries so
prompt edits can be loaded by the eventual Spirit daemon without a Rust or Nix
rebuild.

This repository starts from the local `mind-judge-config` shape and adapts the
Spirit judge prompt packs formerly embedded under
`/home/li/primary/repos/spirit/src/guardian-prompts/` and
`/home/li/primary/repos/spirit/src/guardian_prompt.rs`.

## Boundary

Owned here:

- public prompt prose for Spirit intent-admission and referent-registration
  judges;
- NOTA manifests that name prompt files, prompt order, and fixture files;
- non-secret provider and model-selection configuration data when the eventual
  adapter needs it;
- test fixtures that exercise prompt/config boundaries without claiming their
  content as durable Spirit intent.

Not owned here:

- provider credentials, tokens, or secret values;
- executable daemon or adapter code;
- Spirit storage, retrieval, or admission-operation implementation;
- live Spirit intent records;
- generic judge-anything prompt packs.

## Fixture rule

Fixture files are test material. A fixture may preserve an old live-like example
such as `clear-judge-testing` only as data used to validate the judge boundary;
it is not evidence that the example is accepted durable Spirit intent.
