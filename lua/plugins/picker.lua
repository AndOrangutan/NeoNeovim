return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      winopts = {
        border = "none"
      },
    },
    lazy = true,
    cmd = {
      "FzfLua"
    },
    keys = {
      {"<leader>pf", "<cmd>lua require('fzf-lua').files()<cr>", desc = "[p]icker [f]iles" },
      {"<leader>pg", "<cmd>lua require('fzf-lua').live_grep()<cr>", desc = "[p]icker [g]rep" },
      {"<leader>pa", "<cmd>lua require('fzf-lua').builtin()<cr>", desc = "[p]icker All" },
    },
  },
}
