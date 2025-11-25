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
map("i", "<A-n>", "<C-o>zj", { desc = "Jump to next fold (stay in insert)" })
map("i", "<A-p>", "<C-o>zk", { desc = "Jump to previous fold (stay in insert)" })

-- Fold management (Ctrl + Alt + Key)
map("n", "<C-A-c>", "zf", { desc = "Create fold over motion" }) -- Ctrl+Alt+C
map("v", "<C-A-c>", "zf", { desc = "Create fold over selection" }) -- Ctrl+Alt+C
map("n", "<C-A-d>", "zd", { desc = "Delete fold under cursor" }) -- Ctrl+Alt+D
map("n", "<C-A-t>", "za", { desc = "Toggle fold under cursor" }) -- Ctrl+Alt+T
map("n", "<C-A-o>", "zo", { desc = "Open fold under cursor" }) -- Ctrl+Alt+O
map("n", "<C-A-x>", "zc", { desc = "Close fold under cursor" }) -- Ctrl+Alt+X
map("i", "<A-f>", "<C-o>zfip", { desc = "Create fold over inner paragraph (stay in insert)" }) -- Keep Alt+F
map("n", "<C-A-O>", function()
  require("ufo").openAllFolds()
end, { desc = "Open all folds" }) -- Ctrl+Alt+Shift+O
map("n", "<C-A-C>", function()
  require("ufo").closeAllFolds()
end, { desc = "Close all folds" }) -- Ctrl+Alt+Shift+C

-- Alt + Arrows = expand selection for quick copy/paste
map({ "n", "i" }, "<A-Left>", "<Esc>v<Left>", { noremap = true, silent = true, desc = "Select left" })
map({ "n", "i" }, "<A-Right>", "<Esc>v<Right>", { noremap = true, silent = true, desc = "Select right" })
map({ "n", "i" }, "<A-Up>", "<Esc>v<Up>", { noremap = true, silent = true, desc = "Select up" })
map({ "n", "i" }, "<A-Down>", "<Esc>v<Down>", { noremap = true, silent = true, desc = "Select down" })

-- Normal mode
map("n", "<C-c>", '"+y', { noremap = true, silent = true, desc = "Copy to system clipboard" })
map("n", "<C-v>", '"+p', { noremap = true, silent = true, desc = "Paste from system clipboard" })
map("n", "<C-a>", "ggVG", { noremap = true, silent = true, desc = "Select all" })

-- Insert mode
map("i", "<A-y>", "[✓]", { noremap = true, silent = true, desc = "Insert checkmark" }) -- Moved from <C-y>
map("i", "<A-t>", "[✘]", { noremap = true, silent = true, desc = "Insert x" }) -- Moved from <C-t>
map("i", "<A-b>", "**``**<Left><Left><Left><Left>", { noremap = true, silent = true, desc = "Insert Markdown bold" }) -- Moved from <C-b>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Visual mode
map("v", "<C-c>", '"+y', { noremap = true, silent = true, desc = "Copy to system clipboard" })
map("v", "<C-v>", '"+p', { noremap = true, silent = true, desc = "Paste from system clipboard" })

-- Bufferline
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer" })
map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
map("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer" })
map("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
map("n", "<S-A>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
map("n", "<Tab><Right>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer (Tab + Right)" })
map("n", "<Tab><Left>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer (Tab + Left)" })

-- Neo-tree
map("n", "<C-e>", ":Neotree filesystem reveal left<CR>", { desc = "Open file explorer" })
map("n", "<C-t>", ":Neotree toggle<CR>", { desc = "Toggle file explorer" })
map("n", "<C-q>", ":q<CR>", { desc = "Quit" })
map("n", "<C-w>", ":w<CR>", { desc = "Save file" })

-- Gitsigns
map("n", "]h", function()
  require("gitsigns").next_hunk()
end, { desc = "Next hunk" })
map("n", "[h", function()
  require("gitsigns").prev_hunk()
end, { desc = "Previous hunk" })
map({ "n", "v" }, "<C-g>s", ":Gitsigns stage_hunk<CR>", { desc = "Stage hunk" }) -- Changed from <leader>ghs
map({ "n", "v" }, "<C-g>r", ":Gitsigns reset_hunk<CR>", { desc = "Reset hunk" }) -- Changed from <leader>ghr
map("n", "<C-g>S", function()
  require("gitsigns").stage_buffer()
end, { desc = "Stage buffer" }) -- Changed from <leader>ghS
map("n", "<C-g>u", function()
  require("gitsigns").undo_stage_hunk()
end, { desc = "Undo stage hunk" }) -- Changed from <leader>ghu
map("n", "<C-g>R", function()
  require("gitsigns").reset_buffer()
end, { desc = "Reset buffer" }) -- Changed from <leader>ghR
map("n", "<C-g>p", function()
  require("gitsigns").preview_hunk_inline()
end, { desc = "Preview hunk inline" }) -- Changed from <leader>ghp
map("n", "<C-g>b", function()
  require("gitsigns").blame_line({ full = true })
end, { desc = "Blame line" }) -- Changed from <leader>ghb
map("n", "<C-g>d", function()
  require("gitsigns").diffthis()
end, { desc = "Diff this" }) -- Changed from <leader>ghd
map("n", "<C-g>D", function()
  require("gitsigns").diffthis("~")
end, { desc = "Diff this ~" }) -- Changed from <leader>ghD
map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select hunk" })

-- LSP
map("n", "K", vim.lsp.buf.hover, { desc = "Show hover information" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map({ "n", "v" }, "<C-l>", vim.lsp.buf.code_action, { desc = "Code actions" }) -- Changed from <leader>nl
map("n", "<C-d>", vim.diagnostic.open_float, { desc = "Open diagnostic float" }) -- Changed from <leader>e (conflicts with Neo-tree)
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map("n", "<C-m>", vim.diagnostic.setloclist, { desc = "Set diagnostic location list" }) -- Changed from <leader>m

-- Rust-analyzer specific
map("n", "<C-S-s>", vim.lsp.buf.hover, { desc = "Rust: Show type/docs" })
map("n", "<C-S-e>", vim.diagnostic.open_float, { desc = "Rust: Show error details" })
map("n", "<C-S-f>", vim.lsp.buf.code_action, { desc = "Rust: Fix/refactor code" })
map("n", "<C-S-d>", vim.lsp.buf.definition, { desc = "Rust: Go to definition" })
map("n", "<C-S-r>", vim.lsp.buf.references, { desc = "Rust: Find references" })
map("n", "<C-S-o>", function()
  vim.lsp.buf.execute_command({ command = "rust-analyzer.openDocs" })
end, { desc = "Rust: Open external docs" })
map("n", "<C-S-h>", vim.lsp.buf.signature_help, { desc = "Rust: Show signature help" })

-- Formatting Markdown
map(
  "i",
  "<A-b>",
  "**``**<Left><Left><Left><Left>",
  { noremap = true, silent = true, desc = "Insert Markdown inline code formatting" }
)
