return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v2.x",
	dependencies = {
		-- LSP Support
		{ "neovim/nvim-lspconfig" }, -- Required
		{ -- Optional
			"williamboman/mason.nvim",
			build = function()
				pcall(vim.api.nvim_command, "MasonUpdate")
			end,
		},
		{ "williamboman/mason-lspconfig.nvim" }, -- Optional

		-- Autocompletion
		{ "hrsh7th/nvim-cmp" }, -- Required
		{ "hrsh7th/cmp-nvim-lsp" }, -- Required
		{ "L3MON4D3/LuaSnip" }, -- Required

		--
		{
			"jay-babu/mason-null-ls.nvim",
			event = { "BufReadPre", "BufNewFile" },
			dependencies = {
				"williamboman/mason.nvim",
				"jose-elias-alvarez/null-ls.nvim",
			},
		},
	},
	config = function()
		local lsp = require("lsp-zero").preset({})

		lsp.on_attach(function(client, bufnr)
			-- see :help lsp-zero-keybindings
			-- to learn the available actions
			lsp.default_keymaps({ buffer = bufnr })
		end)

		require("lspconfig").perlnavigator.setup({
			settings = {
				perlnavigator = {
					perlPath = "carton",
					perlParams = { "exec", "perl" },
					enableWarnings = true,
					perlcriticEnabled = true,
				},
			},
		})

		lsp.format_on_save({
			format_opts = {
				async = false,
				timeout_ms = 10000,
			},
			servers = {
				["denols"] = { "typescript" },
				["null-ls"] = { "javascript", "lua", "css", "sql", "vue" },
				["perlnavigator"] = { "perl" },
			},
		})

		lsp.setup()

		vim.diagnostic.config({
			virtual_text = true,
		})

		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- Replace these with the tools you have installed
				-- make sure the source name is supported by null-ls
				-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.stylua,
			},
		})

		require("mason-null-ls").setup({
			ensure_installed = nil,
			automatic_installation = true,
		})

		local cmp = require("cmp")
		local cmp_action = require("lsp-zero").cmp_action()
		local luasnip = require("luasnip")

		require("luasnip.loaders.from_vscode").lazy_load()
		local function has_words_before()
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		cmp.setup({
			sources = {
				{ name = "copilot" },
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			},
			preselect = "item",
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			mapping = {
				["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
				["<Tab>"] = cmp.mapping(function(fallback)
					if require("copilot.suggestion").is_visible() then
						require("copilot.suggestion").accept()
					elseif cmp.visible() then
						cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
					elseif luasnip.expandable() then
						luasnip.expand()
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, {
					"i",
					"s",
				}),
				["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<C-f>"] = cmp_action.luasnip_jump_forward(),
				["<C-b>"] = cmp_action.luasnip_jump_backward(),
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
		})
	end,
}
