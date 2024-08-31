return {
  "Wansmer/treesj",
  lazy = true,
  keys = {
    {
      "<leader>j",
      "<cmd>TSJToggle<cr>",
      desc = "Splitjoin",
    },
  },
  dependencies = { "nvim-treesitter/nvim-treesitter" }, -- if you install parsers with `nvim-treesitter`
  opts = {
    use_default_keymaps = false,
  },
  -- config = function()
  --   require("treesj").setup({ --[[ your config ]]
  --     use_defa
  --   })
  -- end,
}