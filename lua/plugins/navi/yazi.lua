return {
	{
		"mikavilpas/yazi.nvim",
		-- event = "VeryLazy",
		cmd = "Yazi",
		lazy = true,
		keys = {
			-- 👇 in this section, choose your own keymappings!
			{
				"<leader>y",
				"<cmd>Yazi toggle<cr>",
				desc = "Open yazi filetree",
			},
			{
				-- Open in the current working directory
				"<leader>Y",
				"<cmd>Yazi cwd<cr>",
				desc = "Open yazi filetree (cwd)",
			},
		},
		opts = {
			-- if you want to open yazi instead of netrw, see below for more info
			open_for_directories = false,
			keymaps = {
				show_help = "<f1>",
				open_file_in_vertical_split = "<c-v>",
				open_file_in_horizontal_split = "<c-x>",
				open_file_in_tab = "<c-t>",
				grep_in_directory = "<c-s>",
				replace_in_directory = "<c-g>",
				cycle_open_buffers = "<tab>",
				copy_relative_path_to_selected_files = "<c-y>",
				send_to_quickfix_list = "<c-q>",
				change_working_directory = "<c-\\>",
			},
		},
	},
}