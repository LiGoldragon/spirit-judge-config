# skills — spirit-judge-config

- Markdown is the prompt prose format.
- NOTA is the manifest and fixture format.
- Prompt edits should not require rebuilding `spirit` or any Spirit judge
  adapter.
- Keep the pack Spirit-specific; do not generalize it into a judge-anything
  prompt repository.
- Never commit secrets, private examples, provider tokens, live eval output, or
  claimed Spirit intent records.
- Fixtures are test material. Label live-like examples as fixtures, not durable
  intent.
