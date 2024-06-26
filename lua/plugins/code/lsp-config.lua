return {
	{
		"williamboman/mason.nvim",
		-- lazy = false,
		event = "VeryLazy",
		config = function()
			require("mason").setup()
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		-- lazy = false,
		event = "VeryLazy",
		opts = {
			-- auto_install = true,
		},
	},

	{
		"neovim/nvim-lspconfig",
		-- lazy = false,
		event = "BufRead",
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",

			-- Useful status updates for LSP
			-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
			{ "j-hui/fidget.nvim",       opts = {} },

			-- Additional lua configuration, makes nvim stuff amazing!
			"folke/neodev.nvim",
		},
		opts = {
			servers = {
				clangd = {
					capabilities = {
						offsetEncoding = { "utf-16" },
					},
					cmd = {
						"clangd",
						"--offset-encoding=utf-16",
						"--clang-tidy",
					},
				},
			},
		},
		config = function()
			local servers = {
				-- jdtls = {
				-- 	filetypes = { "java" },
				-- },
				clangd = {
					capabilities = {
						offsetEncoding = { "utf-16" },
					},
					cmd = {
						"clangd",
						"--offset-encoding=utf-16",
					},
					on_attach = function(client, bufnr)
						vim.keymap.set(
							"n",
							"<leader>ch",
							"<cmd>ClangdSwitchSourceHeader<CR>",
							{ desc = "ClangdSwitchSourceHeader" }
						)
					end,
				},
				-- gopls = {},
				pylsp = {},
				-- rust_analyzer = {},
				-- tsserver = {},
				-- html = { filetypes = { 'html', 'twig', 'hbs'} },

				ocamllsp = {
					on_attach = function(client, bufnr)
						if client.server_capabilities.codeLensProvider then
							vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave" }, {
								buffer = bufnr,
								callback = function()
									vim.lsp.codelens.refresh()
								end,
							})
						end
					end,

					-- This doesn't seem to be working eh
					settings = {
						extendedHover = { enable = true },
						codelens = { enable = true },
						inlayHints = { enable = true },
						syntaxDocumentation = { enable = true },
					},
				},
				texlab = {
					chktex = {
						onOpenAndSave = true,
						onEdit = true,
					},
				},

				lua_ls = {
					Lua = {
						workspace = { checkThirdParty = false },
						telemetry = { enable = false },
						-- NOTE: toggle below to ignore Lua_LS's noisy `missing-fields` warnings
						diagnostics = {
							globals = { "vim" },
							disable = { "missing-fields" },
						},
					},
				},
			}

			-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			-- Ensure the servers above are installed
			local mason_lspconfig = require("mason-lspconfig")

			mason_lspconfig.setup({
				ensure_installed = vim.tbl_keys(servers or {}),
			})

			mason_lspconfig.setup({
				handlers = {
					function(server_name)
						if server_name == "rust_analyzer" then
							return
						end

						local server = servers[server_name] or {}
						-- This handles overriding only values explicitly passed
						-- by the server configuration above. Useful when disabling
						-- certain features of an LSP (for example, turning off formatting for tsserver)
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})

			vim.api.nvim_create_autocmd({ "BufEnter" }, {
				pattern = "*",
				callback = function()
					vim.lsp.inlay_hint.enable()
					-- vim.lsp.codelens.refresh()
				end,
			})

			vim.keymap.set("n", "<Leader>ci", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
			end, { desc = "Toggle [i]nlay hints" })
			vim.keymap.set("n", "<leader>cl", vim.lsp.codelens.refresh, { desc = "[C]ode [L]ens", silent = true })
			vim.keymap.set("n", "<leader>cL", vim.lsp.codelens.clear, { desc = "[C]ode [L]ens Clear", silent = true })

			vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "[R]ename" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })
			vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "[C]ode [F]ormat" })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show [K]ind" })
			vim.keymap.set("i", "<C-k>", vim.lsp.buf.hover, { desc = "Show [K]ind" })

			vim.keymap.set("n", "<leader>cs", vim.lsp.buf.document_symbol, { desc = "[C]ode Document [S]ymbols" })
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "[G]o [D]efinition" })
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "[G]o [R]eferences" })
			vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, { desc = "[G]o [I]mplementation" })
			vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, { desc = "[G]o [T]ype Definition" })
			vim.keymap.set("n", "<leader>gs", vim.lsp.buf.signature_help, { desc = "[G]o [S]ignature Help" })
		end,
	},
}
