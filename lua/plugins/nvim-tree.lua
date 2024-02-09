return {
  --[[
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<leader>n", ":Neotree toggle=true <CR>", {silent = true, desc = "Open [N]eotree"})
		vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {silent=true, desc="Open [b]uffers [f]loat"})
	end,
  --]]
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local function on_attach_change(bufnr)
      local api = require("nvim-tree.api")

      local function opts(desc)
        return {
          desc = "nvim-tree: " .. desc,
          buffer = bufnr,
          noremap = true,
          silent = true,
          nowait = true,
        }
      end

      api.config.mappings.default_on_attach(bufnr)

      vim.keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>", { silent = true, desc = "Ope[n] file tree" })
      vim.keymap.set("n", ".", api.tree.change_root_to_node, opts("CD"))
      vim.keymap.set("n", "<BS>", api.tree.change_root_to_parent, opts("Up"))
      vim.keymap.set("n", ",", api.node.run.cmd, opts("Run Command"))
      vim.keymap.set("n", "C-S", api.node.open.vertical, opts("Open: Vertical"))
      vim.keymap.set("n", "<C-s>", api.node.open.horizontal, opts("Open: Horizontal"))
    end

    require("nvim-tree").setup({
      on_attach = on_attach_change,
      --[[
      update_focused_file = {
				enable = true,
				update_root = true,
			},
      --]]
      filters = {
        dotfiles = true,
        git_ignored = false,
      },
    })
  end,
}
