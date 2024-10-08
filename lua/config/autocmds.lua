-- This autocmd will only trigger when a file was loaded from the cmdline.
-- It will render the file as quickly as possible.
vim.api.nvim_create_autocmd("BufReadPost", {
    once = true,
    callback = function(event)
        -- Skip if we already entered vim
        if vim.v.vim_did_enter == 1 then
            return
        end

        -- Try to guess the filetype (may change later on during Neovim startup)
        local ft = vim.filetype.match({ buf = event.buf })
        if ft then
            -- Add treesitter highlights and fallback to syntax
            local lang = vim.treesitter.language.get_lang(ft)
            if not (lang and pcall(vim.treesitter.start, event.buf, lang)) then
                vim.bo[event.buf].syntax = ft
            end

            -- Trigger early redraw
            vim.cmd([[redraw]])
        end
    end,
})

-- Automattically create missing subdirectories
vim.api.nvim_create_autocmd({"BufWritePre"}, {
    pattern = "*",
    callback = function(event)
        local dir = vim.fn.fnamemodify(event.file, ":p:h")
        if vim.fn.isdirectory(dir) == 0 then
            vim.fn.mkdir(dir, "p")
        end
    end
})

