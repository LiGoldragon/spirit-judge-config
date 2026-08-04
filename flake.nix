{
  description = "spirit-judge-config — public prompt/config data for Spirit judge admission flows";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        packages.default = pkgs.runCommand "spirit-judge-config" { src = ./.; } ''
          mkdir -p "$out"
          cp -R "$src"/* "$out"/
        '';
        checks.manifest = pkgs.runCommand "spirit-judge-config-manifest-check" { src = ./.; } ''
          set -euo pipefail
          test -s "$src/manifest.nota"
          test -s "$src/prompts/intent-admission/role.md"
          test -s "$src/prompts/intent-admission/record-shape.md"
          test -s "$src/prompts/intent-admission/checklist.md"
          test -s "$src/prompts/intent-admission/nota-output.md"
          test -s "$src/fixtures/intent-admission/conservative-refusal.nota"
          test -s "$src/fixtures/intent-admission/clear-judge-testing.fixture.nota"
          test -s "$src/prompts/diagnostics.md"
          test -s "$src/config/provider-policy.nota"
          test -s "$src/fixtures/diagnostics/redacted-diagnostics.nota"
          if find "$src" \( -name '*.json' -o -name '*.yaml' -o -name '*.yml' -o -name '*.csv' \) | grep .; then
            echo "forbidden internal artifact format found" >&2
            exit 1
          fi
          if grep -n "guardian" "$src/manifest.nota"; then
            echo "manifest must use judge terminology" >&2
            exit 1
          fi
          if grep -RniE 'certainty|privacy|referent|ChangeCertainty|Overstated|UnclearPrivacy' "$src/manifest.nota" "$src/prompts" "$src/fixtures"; then
            echo "removed Spirit v1 concepts must not re-enter prompt guidance or fixtures" >&2
            exit 1
          fi
          test ! -e "$src/prompts/intent-admission/burden-ladder.md"
          test ! -e "$src/prompts/referent-registration/system.md"
          test ! -e "$src/prompts/referent-registration/user-template.md"
          test ! -e "$src/fixtures/intent-admission/privacy-boundary.nota"
          while IFS= read -r path; do
            test -f "$src/$path" || { echo "manifest path missing: $path" >&2; exit 1; }
          done < <(grep -oE '(prompts|fixtures)/[^ )]+' "$src/manifest.nota" | sort -u)
          grep -q "Test material only" "$src/fixtures/intent-admission/clear-judge-testing.fixture.nota"
          grep -q "does not claim durable Spirit intent" "$src/fixtures/intent-admission/clear-judge-testing.fixture.nota"
          grep -q "Relevant existing records" "$src/prompts/intent-admission/user-template.md"
          grep -q "exactly four positional fields: \[Domains\] Kind \[Description\] Importance" "$src/prompts/intent-admission/record-shape.md"
          grep -q "default verdict on any submission is REJECT" "$src/prompts/intent-admission/checklist.md"
          grep -q "ImportanceUnsupported" "$src/prompts/intent-admission/rejection-reasons.md"
          grep -q "redacted" "$src/prompts/diagnostics.md"
          grep -q "sensitive" "$src/prompts/diagnostics.md"
          grep -q "(AmbientSessionReference codex-login)" "$src/config/provider-policy.nota"
          grep -q "(Production gpt-5.6-luna XHigh)" "$src/config/provider-policy.nota"
          grep -q "(CompatibilityTest gpt-5.6-terra Medium)" "$src/config/provider-policy.nota"
          grep -q "no credential values" "$src/fixtures/diagnostics/redacted-diagnostics.nota"
          touch "$out"
        '';
      });
}
