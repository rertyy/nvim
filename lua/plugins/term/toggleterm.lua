return {}
-- return {
-- 	{
-- 		"akinsho/toggleterm.nvim",
-- 		version = "*",
-- 		lazy = true,
-- 		opts = {
-- 			float_opts = {
-- 				border = "curved",
-- 				width = math.floor(0.8 * vim.o.columns),
-- 				height = math.floor(0.8 * vim.o.lines),
-- 			},
-- 		},
-- 		cmd = "ToggleTerm",
-- 		-- opts = { --[[ things you want to change go here]]
-- 		-- },
-- 		keys = {
-- 			-- { "<M-i>", "<cmd>ToggleTerm dir=git_dir direction=float<CR>", desc = "Open toggleterm" },
-- 			-- { "<M-i>", "<C-\\><C-n><cmd>ToggleTerm<CR>", mode = "t", desc = "Close toggleterm" },
-- 			{ "<M-g>", "<cmd>lua Lazygit_toggle()<CR>", desc = "Open lazygit" },
-- 			{
-- 				"<leader>t1",
-- 				"<cmd>1ToggleTerm dir=git_dir, direction=vertical<CR>",
-- 				desc = "Open vertical terminal",
-- 			},
-- 			{
-- 				"<leader>t2",
-- 				"<cmd>2ToggleTerm dir=git_dir, direction=vertical<CR>",
-- 				desc = "Open vertical terminal",
-- 			},
-- 			{
-- 				"<leader>t3",
-- 				"<cmd>3ToggleTerm dir=git_dir, direction=horizontal<CR>",
-- 				desc = "Open vertical terminal",
-- 			},
-- 			{
-- 				"<leader>t4",
-- 				"<cmd>4ToggleTerm dir=git_dir, direction=horizontal<CR>",
-- 				desc = "Open vertical terminal",
-- 			},
-- 		},
-- 		config = function(_, opts)
-- 			require("toggleterm").setup(opts)
--
-- 			local Terminal = require("toggleterm.terminal").Terminal
-- 			local lazygit = Terminal:new({
-- 				cmd = "lazygit",
-- 				dir = "git_dir",
-- 				direction = "float",
-- 				float_opts = {
-- 					border = "double",
-- 				},
-- 				-- function to run on opening the terminal
-- 				on_open = function(term)
-- 					vim.cmd("startinsert!")
-- 					vim.api.nvim_buf_set_keymap(
-- 						term.bufnr,
-- 						"n",
-- 						"q",
-- 						"<cmd>close<CR>",
-- 						{ noremap = true, silent = true }
-- 					)
-- 				end,
-- 				-- function to run on closing the terminal
-- 				on_close = function(term)
-- 					vim.cmd("startinsert!")
-- 				end,
-- 			})
--
-- 			function Lazygit_toggle()
-- 				lazygit:toggle()
-- 			end
-- 		end,
-- 	},
-- }
