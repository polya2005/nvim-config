return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"clangd",
				"pyright",
				"lua_ls",
				"ts_ls",
				"html",
				"cssls",
				"tailwindcss",
				"eslint-lsp",
				"json-lsp",
				"yamlls",
				"cmake",
				"texlab",
				"stylua",
			},
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		config = function()
			vim.diagnostic.config({
				virtual_text = true,
				underline = true,
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			-- C/C++
			vim.lsp.config("clangd", {
				cmd = {
					"clangd",
					"--background-index",
					"--clang-tidy",
				},
				filetypes = { "c", "cpp" },
				capabilities = capabilities,
			})
			vim.lsp.enable("clangd")

			-- Assembly
			vim.lsp.config("asm-lsp", {
				capabilities = capabilities,
			})
			vim.lsp.enable("asm-lsp")

			-- Lua
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
				capabilities = capabilities,
			})
			vim.lsp.enable("lua_ls")

			-- Python
			vim.lsp.config("pyright", {
				cmd = { "pyright-langserver", "--stdio" },
				filetypes = { "python" },
				settings = {
					pyright = {
						analysis = {
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
							diagnosticMode = "workspace",
						},
					},
				},
				capabilities = capabilities,
			})
			vim.lsp.enable("pyright")

			-- Web dev
			vim.lsp.config("ts_ls", {
				init_options = {
					hostInfo = "neovim",
				},
				capabilities = capabilities,
			})
			vim.lsp.config("html", {
				capabilities = capabilities,
			})
			vim.lsp.config("cssls", {
				capabilities = capabilities,
			})
			vim.lsp.config("tailwindcss", {
				capabilities = capabilities,
			})
			vim.lsp.config("eslint", {
				capabilities = capabilities,
			})
			vim.lsp.config("jsonls", {
				capabilities = capabilities,
			})
			vim.lsp.enable("ts_ls")
			vim.lsp.enable("html")
			vim.lsp.enable("cssls")
			vim.lsp.enable("tailwindcss")
			vim.lsp.enable("eslint")
			vim.lsp.enable("jsonls")

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event)
					local opts = { buffer = event.buf }

					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

					vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
					vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
					vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
				end,
			})
		end,
	},
}
