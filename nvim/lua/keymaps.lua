-----------------------------------------------------------
-- Keymaps configuration file: keymaps of neovim
-- and plugins.
-----------------------------------------------------------

local map = vim.api.nvim_set_keymap
local unmap = vim.api.nvim_del_keymap
local default_opts = { noremap = true, silent = true }

-----------------------------------------------------------
-- Neovim shortcuts:
-----------------------------------------------------------

-- clear search highlighting
map("n", "<leader>c", ":nohl<CR>", default_opts)

-- fast saving with <leader> and s
map("n", "<leader>s", ":w<CR>", default_opts)

-- move around splits using Ctrl + {h,j,k,l}
map("n", "<C-h>", "<C-w>h", default_opts)
map("n", "<C-j>", "<C-w>j", default_opts)
map("n", "<C-k>", "<C-w>k", default_opts)
map("n", "<C-l>", "<C-w>l", default_opts)

-- buffer management
map("n", "<leader>n", "<C-^>", default_opts)
map("n", "<leader>x", ":bd", default_opts)

-- paste
map("n", "<leader>p", '"_dP', default_opts)

--  easier colon
map("n", ";", ":", {})

-----------------------------------------------------------
-- Applications & Plugins shortcuts:
-----------------------------------------------------------
-- clear buffergator maps
unmap("n", "<leader>t")
unmap("n", "<leader>T")
unmap("n", "<leader>B")

-- nvim-tree
map("n", "<leader>e", ":Neotree toggle<CR>", default_opts) -- open/close

-- Vista tag-viewer
-- map('n', '<C-m>', ':Vista!!<CR>', default_opts)   -- open/close

-- telescope
map("n", "<leader>o", ":Telescope find_files<CR>", default_opts)
map("n", "<leader>l", ":Telescope live_grep<CR>", default_opts)

--lsp
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", default_opts)

--lazygit
map("n", "<leader>gg", ":LazyGit<CR>", default_opts) -- open/close

-- trouble
map("n", "<leader>t", "<cmd>Trouble diagnostics<cr>", { silent = true, noremap = true })
