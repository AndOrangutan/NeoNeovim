
return {
    {
        -- "hrsh7th/nvim-cmp"
        -- Lol hopefully this isn't poisoned
        "iguanacucumber/magazine.nvim",
        name = "nvim-cmp", -- Otherwise highlighting gets messed up
        dependencies = {
            "garymjr/nvim-snippets",

            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",


            "petertriho/cmp-git",
        },
        event = { "InsertEnter", "CmdLineEnter" },
        config = function ()

            local cmp = require("cmp")
            local defaults = require("config.defaults")
            local icons = require("config.icons")

            vim.opt.completeopt = { "menu", "menuone", "noselect" }
            vim.opt.shortmess:append "c"

            cmp.setup({
                snippet = {
                    expand = function(args)
                        vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
                    end
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items


                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "snippets" },
                }, {
                    {
                        name = "buffer",
                        option = {
                            get_bufnrs = function()
                                local bufs = {}
                                for _, win in ipairs(vim.api.nvim_list_wins()) do
                                    bufs[vim.api.nvim_win_get_buf(win)] = true
                                end
                                return vim.tbl_keys(bufs)
                            end
                        }
                    },
                }),
                window = {
                    completion = {
                        winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
                        col_offset = -2,
                        side_padding = 0,
                    },
                },
                formatting = {
                    fields = { "kind", "abbr", "menu" },
                    format = function(entry, vim_item)
                        -- Kind icons
                        vim_item.kind = icons.kind[vim_item.kind]                        -- Source
                        vim_item.menu = ({
                            buffer = "(Buffer)",
                            cmdline = "",
                            git = (Git),
                            nvim_lsp = "(LSP)",
                            path = "(Path)",
                            snippets = "(Snippets)",

                            -- nvim_lua = "",
                            -- latex_symbols = "LaTeX",
                        })[entry.source.name]
                        return vim_item
                    end
                },

            })

            cmp.setup.filetype(defaults.ft_gitcommit, {
                sources = cmp.config.sources({
                    { name = 'git' },
                }, {
                    { name = 'buffer' },
                })
            })
            require("cmp_git").setup()

            cmp.setup.cmdline({ '/', '?' }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            })

            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' }
                }, {
                    { name = 'cmdline' }
                }),
                matching = { disallow_symbol_nonprefix_matching = false }
            })

        end,
    },
    {
        "garymjr/nvim-snippets",
        dependencies = {
            "rafamadriz/friendly-snippets"
        },
        lazy = true,
        opts = {
            create_cmp_source = true,
            friendly_snippets = true,
            seach_paths = {
                vim.fn.stdpath("config").."/snippets",
                vim.fn.stdpath("config").."/misc/snippets",
            },
        },
        keys = {
            {
                "<Tab>",
                function()
                    if vim.snippet.active({ direction = 1 }) then
                        vim.schedule(function()
                            vim.snippet.jump(1)
                        end)
                        return
                    end
                    return "<Tab>"
                end,
                expr = true,
                silent = true,
                mode = "i",
                desc = "Snippet Jump",
            },
            {
                "<Tab>",
                function()
                    vim.schedule(function()
                        vim.snippet.jump(1)
                    end)
                end,
                expr = true,
                silent = true,
                mode = "s",
                desc = "Snippet Jump",
            },
            {
                "<S-Tab>",
                function()
                    if vim.snippet.active({ direction = -1 }) then
                        vim.schedule(function()
                            vim.snippet.jump(-1)
                        end)
                        return
                    end
                    return "<S-Tab>"
                end,
                expr = true,
                silent = true,
                mode = { "i", "s" },
                desc = "Snippet Unjump",
            },
        },
    },
}
