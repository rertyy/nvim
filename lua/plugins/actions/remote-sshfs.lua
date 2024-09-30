return {
	"nosduco/remote-sshfs.nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
	lazy = true,
	keys = {
		{ "<leader>Sc", "require('remote-sshfs.api').connect()", desc = "Connect to remote" },
		{ "<leader>Sd", "require('remote-sshfs.api').disconnect()", desc = "Disconnect from remote" },
		{ "<leader>Se", "require('remote-sshfs.api').edit()", desc = "Edit remote" },
	},
	cmd = {
		"RemoteSSHFSConnect",
	},
	config = function(_, opts)
		require("remote-sshfs").setup(opts)
		require("telescope").load_extension("remote-sshfs")
		local api = require("remote-sshfs.api")
		vim.keymap.set("n", "<leader>Sc", api.connect, { desc = "Connect to remote" })
		vim.keymap.set("n", "<leader>Sd", api.disconnect, { desc = "Disconnect from remote" })
		vim.keymap.set("n", "<leader>Se", api.edit, { desc = "Edit remote" })

		-- (optional) Override telescope find_files and live_grep to make dynamic based on if connected to host
		local builtin = require("telescope.builtin")
		local connections = require("remote-sshfs.connections")
		vim.keymap.set("n", "<leader>ff", function()
			if connections.is_connected then
				api.find_files()
			else
				builtin.find_files()
			end
		end, {})
		vim.keymap.set("n", "<leader>fg", function()
			if connections.is_connected then
				api.live_grep()
			else
				builtin.live_grep()
			end
		end, {})
	end,
}
