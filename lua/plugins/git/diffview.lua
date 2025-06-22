return {
  "sindrets/diffview.nvim",
  command = "DiffviewOpen",
  -- cond = is_git_root,
  opts = {
    keymaps = {
      view = {
        { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close help menu" } },
      },
      file_panel = {
        { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close help menu" } },
      },
      file_history_panel = {
        { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close help menu" } },
      },
    },
  },

  keys = {
    {
      "<leader>hvD",
      "<cmd>DiffviewOpen<cr>",
      desc = "Diff Index",
    },
    {
      "<leader>hvh",
      "<cmd>DiffviewOpen master..HEAD<cr>",
      desc = "Diff master",
    },
    {
      "<leader>hvd",
      "<cmd>DiffviewFileHistory %<cr>",
      desc = "Open diffs for current File",
    }
  }
}
