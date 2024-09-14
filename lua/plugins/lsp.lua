return {
    {
        "neovim/nvim-lspconfig",
        event = {"BufReadPost", "BufNewFile", "BufWritePre"},
        opts = function()
            local icons = require("config.icons")

        end,
		config = function(_, opts)
			local icons = require("config.icons")
			local lsp = require("util.lsp")
			local defaults = require("config.defaults")
			local lspconfig = require("lspconfig")

            lsp.setup_on_attach()

            -- Override border
            local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
            function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
                opts = opts or {}
                opts.border = opts.border or defaults.border
                return orig_util_open_floating_preview(contents, syntax, opts, ...)
            end

            -- Set up kind icons
            local kinds = vim.lsp.protocol.CompletionItemKind
            for i, kind in ipairs(kinds) do
                kinds[i] = icons.kind[kind] or kind
            end

            for type, icon in pairs(icons.diagnostics) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            end

            vim.diagnostic.config({
                -- prefix = '■', -- Could be '●', '▎', 'x'
                -- virtual_text = true,
                float = {
                    source = "always",
                },
                signs = true,
                underline = true,
                update_in_insert = false,
                severity_sort = false,
            })

            local servers = { "lua_ls" }


            for _, lsp in ipairs(servers) do
                local has_lsp_config, lsp_config = pcall("config.lsp."..lsp)
                local config = {
                    -- on_attach = my_custom_on_attach,
                    capabilities = lsp.gen_capabilities,
                }
                if has_lsp_config then
                    config = lsp_config
                end
                lspconfig[lsp].setup(config)
            end
		end,
        keys = {
            {"<leader>e", "<cmd>lua vim.diagnostic.open_float()<cr>", desc = "LSP [e]pand Diagnostics"},
            {"[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "LSP Goto Prev [d]iagnostic"},
            {"[d", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "LSP Goto prev [d]iagnostic"},
            -- TODO: Research loclist
            -- {"<leader>q", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = ""},
        },
    }
}