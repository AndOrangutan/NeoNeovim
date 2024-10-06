return { { "mrjones2014/smart-splits.nvim",
        -- config = true,
        -- lazy = false,
        keys = {
            { '<A-h>', "<cr>lua require('smart-splits').move_cursor_left()<cr>", desc = "Naviagte Left" },
            { '<A-j>', "<cr>lua require('smart-splits').move_cursor_down()<cr>", desc = "Naviagte Right" },
            { '<A-k>', "<cr>lua require('smart-splits').move_cursor_up()<cr>", desc = "Naviagte Up" },
            { '<A-l>', "<cr>lua require('smart-splits').move_cursor_right()<cr>", desc = "Naviagte Down" },


            { '<A-H>', "<cr>lua require('smart-splits').resize_left()<cr>", desc = "Swap Buf Left" },
            { '<A-J>', "<cr>lua require('smart-splits').resize_down()<cr>", desc = "Swap Buf Right" },
            { '<A-K>', "<cr>lua require('smart-splits').resize_up()<cr>", desc = "Swap Buf Up" },
            { '<A-L>', "<cr>lua require('smart-splits').resize_right()<cr>", desc = "Swap Buf Down" },
        },
    },
}
