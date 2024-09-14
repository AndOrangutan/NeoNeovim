return {
    {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = function ()
			local defaults = require("config.defaults")
			return {
				winopts = {
					border = defaults.border,
				},
			}
		end,
        lazy = true,
        cmd = {
            "FzfLua"
        },
        keys = {
            {"<leader>pf", "<cmd>lua require('fzf-lua').files()<cr>", desc = "[p]icker [f]iles" },
            {"<leader>pg", "<cmd>lua require('fzf-lua').live_grep()<cr>", desc = "[p]icker [g]rep" },
            {"<leader>ph", "<cmd>lua require('fzf-lua').helptags()<cr>", desc = "[p]icker [g]rep" },
            {"<leader>pa", "<cmd>lua require('fzf-lua').builtin()<cr>", desc = "[p]icker All" },
        },
    },
}
