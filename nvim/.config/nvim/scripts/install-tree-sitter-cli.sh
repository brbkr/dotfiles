#!/usr/bin/env bash
# Build tree-sitter CLI v0.26.3 for this machine (needed by nvim-treesitter rewrite).
# Prebuilt GitHub binaries require glibc >= 2.29; RHEL8 has 2.28, so we use cargo.
set -euo pipefail

export PATH="${HOME}/.cargo/bin:${PATH}"

if command -v tree-sitter >/dev/null && tree-sitter --version 2>/dev/null | grep -q '0.26'; then
  echo "tree-sitter already installed: $(command -v tree-sitter)"
  tree-sitter --version
  exit 0
fi

if ! command -v cargo >/dev/null; then
  echo "Installing rustup (one-time)..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain stable
  # shellcheck source=/dev/null
  source "${HOME}/cargo/env"
fi

echo "Installing tree-sitter-cli 0.26.3..."
cargo install tree-sitter-cli --locked --version 0.26.3

echo "Done. Ensure ~/.cargo/bin is on PATH, then in Neovim run: :TSInstall! ${*:bash c cpp lua markdown nix python query vim vimdoc}"
tree-sitter --version
