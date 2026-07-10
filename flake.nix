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
          test -s "$src/prompts/intent-admission/nota-output.md"
          test -s "$src/prompts/referent-registration/system.md"
          test -s "$src/fixtures/intent-admission/conservative-refusal.nota"
          test -s "$src/fixtures/intent-admission/privacy-boundary.nota"
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
          while IFS= read -r path; do
            test -f "$src/$path" || { echo "manifest path missing: $path" >&2; exit 1; }
          done < <(grep -oE '(prompts|fixtures)/[^ )]+' "$src/manifest.nota" | sort -u)
          grep -q "Test material only" "$src/fixtures/intent-admission/clear-judge-testing.fixture.nota"
          grep -q "does not claim durable Spirit intent" "$src/fixtures/intent-admission/clear-judge-testing.fixture.nota"
          grep -q "Relevant existing records" "$src/prompts/intent-admission/user-template.md"
          grep -q "Already-registered referents" "$src/prompts/referent-registration/user-template.md"
          grep -q "default verdict on any candidate is REJECT" "$src/prompts/intent-admission/checklist.md"
          grep -q "redacted" "$src/prompts/diagnostics.md"
          grep -q "(Production gpt-5.6-terra Medium)" "$src/config/provider-policy.nota"
          grep -q "(CompatibilityTest gpt-5.6-luna Medium)" "$src/config/provider-policy.nota"
          grep -q "no credential values" "$src/fixtures/diagnostics/redacted-diagnostics.nota"
          touch "$out"
        '';
      });
}
