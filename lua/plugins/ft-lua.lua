return {
    {
        "folke/lazydev.nvim",
        dependencies = {
            "justinsgithub/wezterm-types",
            "Bilal2453/luvit-meta",
        },
        ft = "lua",
        opts = {
            library = {
                -- "~/projects/my-awesome-lib",
                "lazy.nvim",
                { path = "luvit-meta/library", words = { "vim%.uv" } },
                { path = "wezterm-types", mods = { "wezterm" } },
                -- Load the xmake types when opening file named `xmake.lua`
                -- Needs `LelouchHe/xmake-luals-addon` to be installed
                --{ path = "xmake-luals-addon/library", files = { "xmake.lua"
            },
        },
    },
    -- TODO: Move to completion
    -- {
    --     "hrsh7th/nvim-cmp",
    --     opts = function(_, opts)
    --         opts.sources = opts.sources or {}
    --         table.insert(opts.sources, {
    --             name = "lazydev",
    --             group_index = 0, -- set group index to 0 to skip loading LuaLS completions
    --         })
    --     end,
    -- },
}
