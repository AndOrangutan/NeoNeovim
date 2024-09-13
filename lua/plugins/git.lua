return {
    {
        "sindrets/diffview.nvim",
        lazy = true,
        cmd = {
            "DiffviewOpen",
            "DiffviewClose",
            "DiffviewToggleFiles",
            "DiffviewFocusFiles",
            "DiffviewRefresh",
        },
    },
    {
        "lewis6991/gitsigns.nvim",
        event = {"BufReadPost", "BufNewFile", "BufWritePre"},
        opts = {
            signs = {
                add = { text = "▎" },
                change = { text = "▎" },
                delete = { text = "" },
                topdelete = { text = "" },
                changedelete = { text = "▎" },
                untracked = { text = "▎" },
            },
            signs_staged = {
                add = { text = "▎" },
                change = { text = "▎" },
                delete = { text = "" },
                topdelete = { text = "" },
                changedelete = { text = "▎" },
            }, 
        },
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
            "ibhagwan/fzf-lua",
        },
        lazy = true,
        opts = {
            integrations = {
                diffview = true,
                fzf_lua = nil,
                mini_pick = nil,
            },
        },
        keys = {
            { '<leader>gg', '<cmd>Neogit<cr>', desc = '[g]it [g]ui'},
        },
    },
}
