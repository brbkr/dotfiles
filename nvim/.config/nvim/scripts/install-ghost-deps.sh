#!/usr/bin/env bash
# Python deps for nvim-ghost script mode (bundled binary needs glibc >= 2.33).
set -euo pipefail

PYTHON="${GHOST_PYTHON:-/depot/Python-3.10/bin/python3}"
if ! command -v "$PYTHON" >/dev/null; then
  echo "Python 3.10+ not found at $PYTHON (set GHOST_PYTHON=...)" >&2
  exit 1
fi

REQ="${XDG_DATA_HOME:-$HOME/.local/share}/nvim/lazy/nvim-ghost.nvim/requirements.txt"
if [[ ! -f "$REQ" ]]; then
  echo "nvim-ghost.nvim not found at $REQ (run :Lazy sync first)" >&2
  exit 1
fi

"$PYTHON" -m pip install --user -r "$REQ"
echo "Done. Restart Neovim; set GhostText extension port to 31415."
