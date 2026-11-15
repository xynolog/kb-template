# Xynolog knowledge base template

A knowledge base with nothing in it yet, ready to run with the
[`xynolog` launcher](https://github.com/xynolog/cli).

## Start a knowledge base from it

- **On GitHub:** press **Use this template**. The first push runs
  `.github/workflows/template-init.yml`, which names the new knowledge base
  for its repository (`<owner>.github.io:<repo>`, the identity `xynolog init`
  derives from a git origin) and then deletes itself. Clone the new
  repository and run `xynolog start`.
- **From the launcher:** `xynolog init --from-template` copies this
  repository's `.xynolog/stack/` into a new knowledge base, and
  `--devcontainer` copies `.devcontainer/` too. `init` writes the
  knowledge base's own identity; it never copies this one.

## What is in it

- `.xynolog/config.yaml`: the knowledge base's identity.
- `.xynolog/stack/`: the stack's documents, as `xynolog init --inference
  anthropic --embedding ollama:nomic-embed-text` writes them. Anthropic
  serves inference and a local Ollama embeds.
- `.devcontainer/`: runs the stack in a GitHub codespace, for `xynolog start
  --runtime codespace`. `post-create.sh` installs the launcher from
  xynolog/cli's newest release, checked against its checksums and build
  provenance; `post-start.sh` starts the stack. The codespace reads the
  Anthropic key from the `ANTHROPIC_API_KEY` Codespaces user secret.
