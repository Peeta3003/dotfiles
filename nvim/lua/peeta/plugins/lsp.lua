return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig", -- supplies the default server configs
		},
		opts = {
			ensure_installed = { "gopls", "basedpyright", "clangd", "lua_ls" },
			-- automatic_enable defaults to true: installed servers get vim.lsp.enable()'d
		},
		config = function(_, opts)
			-- per-server overrides use the built-in API
			vim.lsp.config("gopls", {
				settings = {
					gopls = {
						gofumpt = true,
						staticcheck = true,
					},
				},
			})

			vim.lsp.config("basedpyright", {
				settings = {
					basedpyright = {
						analysis = {
							typeCheckingMode = "standard",
						},
					},
				},
			})

			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
					},
				},
			})

			vim.lsp.config("*", {
				capabilities = require("blink.cmp").get_lsp_capabilities(),
			})

			require("mason-lspconfig").setup(opts)

			vim.diagnostic.config({
				virtual_text = true,
				severity_sort = true,
				float = { border = "rounded" },
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("peeta-lsp-attach", { clear = true }),
				callback = function(ev)
					local map = function(keys, fn, desc)
						vim.keymap.set("n", keys, fn, { buffer = ev.buf, desc = "LSP: " .. desc })
					end

					map("gd", vim.lsp.buf.definition, "Go to definition")
					map("gD", vim.lsp.buf.declaration, "Go to declaration")
					map("<leader>e", vim.diagnostic.open_float, "Line diagnostics")
				end,
			})
		end,
	},
}
