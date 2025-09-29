-- ~/.config/nvim/lua/core/keymaps.lua
local map = vim.keymap.set

-- Better up/down
map({ "n", "x" }, "j", "v:count == 2 ? 'gj' : 'j'", { expr = true, silent = true, desc = "Move down (visual line)" })
map(
  { "n", "x" },
  "<Down>",
  "v:count == 2 ? 'gj' : 'j'",
  { expr = true, silent = true, desc = "Move down (visual line)" }
)
map({ "n", "x" }, "k", "v:count == 2 ? 'gk' : 'k'", { expr = true, silent = true, desc = "Move up (visual line)" })
map({ "n", "x" }, "<Up>", "v:count == 2 ? 'gk' : 'k'", { expr = true, silent = true, desc = "Move up (visual line)" })

-- Skip lines (5 lines at a time)
map({ "n", "x" }, "<C-j>", "5j", { desc = "Skip 5 lines down" })
map({ "n", "x" }, "<C-k>", "5k", { desc = "Skip 5 lines up" })

-- Skip half a page (like scrolling)
map({ "n", "x" }, "<C-d>", "<C-d>", { desc = "Scroll half page down" })
map({ "n", "x" }, "<C-u>", "<C-u>", { desc = "Scroll half page up" })

-- Fold navigation
map("n", "]f", "zj", { desc = "Jump to next fold" })
map("n", "[f", "zk", { desc = "Jump to previous fold" })

-- Fold management
map("n", "<leader>fc", "zf", { desc = "Create fold over motion" })
map("v", "<leader>fc", "zf", { desc = "Create fold over selection" })
map("n", "<leader>fd", "zd", { desc = "Delete fold under cursor" })
map("n", "<leader>ft", "za", { desc = "Toggle fold under cursor" })
map("n", "<leader>fO", "zR", { desc = "Open all folds" })
map("n", "<leader>fC", "zM", { desc = "Close all folds" })

-- Normal mode
map("n", "<C-c>", '"+y', { noremap = true, silent = true, desc = "Copy to system clipboard" })
map("n", "<C-v>", '"+p', { noremap = true, silent = true, desc = "Paste from system clipboard" })
map("n", "<C-a>", "ggVG", { noremap = true, silent = true, desc = "Select all" })

-- Insert mode
map("i", "<C-y>", "[✓]", { noremap = true, silent = true, desc = "Insert checkmark" })
map("i", "<C-t>", "[✘]", { noremap = true, silent = true, desc = "Insert x" })
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Visual mode
map("v", "<C-c>", '"+y', { noremap = true, silent = true, desc = "Copy to system clipboard" })
map("v", "<C-v>", '"+p', { noremap = true, silent = true, desc = "Paste from system clipboard" })

-- Bufferline
map("n", "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", { desc = "Toggle pin" })
map("n", "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", { desc = "Delete non-pinned buffers" })
map("n", "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", { desc = "Delete other buffers" })
map("n", "<leader>br", "<Cmd>BufferLineCloseRight<CR>", { desc = "Delete buffers to the right" })
map("n", "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", { desc = "Delete buffers to the left" })
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer" })
map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
map("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer" })
map("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
map("n", "<S-A>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })

-- Neo-tree
map("n", "<C-t>", ":Neotree toggle<CR>", { desc = "Toggle file explorer" })
map("n", "<C-e>", ":Neotree filesystem reveal left<CR>", { desc = "Reveal filesystem left side" })
map("n", "<C-q>", ":q<CR>", { desc = "Quit" })
map("n", "<leader>w", ":w<CR>", { desc = "Save file" }) -- Changed from <C-w>

-- Gitsigns
map("n", "]h", function()
  require("gitsigns").next_hunk()
end, { desc = "Next hunk" })
map("n", "[h", function()
  require("gitsigns").prev_hunk()
end, { desc = "Previous hunk" })
map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", { desc = "Stage hunk" })
map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })
map("n", "<leader>ghS", function()
  require("gitsigns").stage_buffer()
end, { desc = "Stage buffer" })
map("n", "<leader>ghu", function()
  require("gitsigns").undo_stage_hunk()
end, { desc = "Undo stage hunk" })
map("n", "<leader>ghR", function()
  require("gitsigns").reset_buffer()
end, { desc = "Reset buffer" })
map("n", "<leader>ghp", function()
  require("gitsigns").preview_hunk_inline()
end, { desc = "Preview hunk inline" })
map("n", "<leader>ghb", function()
  require("gitsigns").blame_line({ full = true })
end, { desc = "Blame line" })
map("n", "<leader>ghd", function()
  require("gitsigns").diffthis()
end, { desc = "Diff this" })
map("n", "<leader>ghD", function()
  require("gitsigns").diffthis("~")
end, { desc = "Diff this ~" })
map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select hunk" })

-- LSP
map("n", "K", vim.lsp.buf.hover, { desc = "Show hover information" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map({ "n", "v" }, "<leader>nl", vim.lsp.buf.code_action, { desc = "Code actions" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open diagnostic float" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map("n", "<leader>m", vim.diagnostic.setloclist, { desc = "Set diagnostic location list" })

-- Rust-analyzer specific
map("n", "C-S-s", vim.lsp.buf.hover, { desc = "Rust: Show type/docs" })
map("n", "C-S-e", vim.diagnostic.open_float, { desc = "Rust: Show error details" })
map("n", "C-S-f", vim.lsp.buf.code_action, { desc = "Rust: Fix/refactor code" })
map("n", "C-S-d", vim.lsp.buf.definition, { desc = "Rust: Go to definition" })
map("n", "C-S-r", vim.lsp.buf.references, { desc = "Rust: Find references" })
map("n", "C-S-o", function()
  vim.lsp.buf.execute_command({ command = "rust-analyzer.openDocs" })
end, { desc = "Rust: Open external docs" })
map("n", "C-S-h", vim.lsp.buf.signature_help, { desc = "Rust: Show signature help" })
