-- nvim-ghost: bundled binary needs glibc >= 2.33 (not available on RHEL8).
-- Use binary.py with Python 3.10+ instead (pynvim deps: scripts/install-ghost-deps.sh).
local ghost_python = "/depot/Python-3.10/bin/python3"
if vim.fn.executable(ghost_python) ~= 1 then
  ghost_python = vim.fn.exepath("python3")
end

vim.g.nvim_ghost_use_script = 1
vim.g.nvim_ghost_python_executable = ghost_python
-- Match this port in the GhostText browser extension (Advanced → port)
vim.g.nvim_ghost_server_port = 31415

-- Enable logging for debugging
-- vim.g.nvim_ghost_logging_enabled = 1
