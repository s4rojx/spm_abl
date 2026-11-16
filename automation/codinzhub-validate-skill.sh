#!/usr/bin/env bash
# Developed by Coder Coder | Find more projects: https://www.codinzhub.com/projects

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VENV_PYTHON="${ROOT_DIR}/../.venv-jira-tools/bin/python"
VALIDATOR="/Users/ghansgup/.codex/skills/.system/skill-creator/scripts/quick_validate.py"
TARGET="${1:-$ROOT_DIR}"

if [[ ! -x "$VENV_PYTHON" ]]; then
  printf 'Missing venv python at %s\n' "$VENV_PYTHON" >&2
  exit 1
fi

exec "$VENV_PYTHON" "$VALIDATOR" "$TARGET"
