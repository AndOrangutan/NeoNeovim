return { { "mrjones2014/smart-splits.nvim",
        -- config = true,
        lazy = false,
        keys = {
            { '<M-h>', "<cr>lua vim.notify('Test')<cr>", desc = "Naviagte Left" },
            -- { '<M-h>', "<cr>lua require('smart-splits').move_cursor_left()<cr>", desc = "Naviagte Left" },
            { '<M-j>', "<cr>lua require('smart-splits').move_cursor_down()<cr>", desc = "Naviagte Right" },
            { '<M-k>', "<cr>lua require('smart-splits').move_cursor_up()<cr>", desc = "Naviagte Up" },
            { '<M-l>', "<cr>lua require('smart-splits').move_cursor_right()<cr>", desc = "Naviagte Down" },


            { '<M-H>', "<cr>lua require('smart-splits').resize_left()<cr>", desc = "Swap Buf Left" },
            { '<M-J>', "<cr>lua require('smart-splits').resize_down()<cr>", desc = "Swap Buf Right" },
            { '<M-K>', "<cr>lua require('smart-splits').resize_up()<cr>", desc = "Swap Buf Up" },
            { '<M-L>', "<cr>lua require('smart-splits').resize_right()<cr>", desc = "Swap Buf Down" },
        },
    },
}
