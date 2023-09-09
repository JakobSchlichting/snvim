local mark = "harpoon.mark"
local ui = "harpoon.ui"

return {
    "ThePrimeagen/harpoon",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = {
        {"<leader>a", function() require(mark).add_file() end, desc = "harpoon current file"},
        {"<C-e>", function() require(ui).toggle_quick_menu() end, desc = "toggle harpoon menu"},
        {"<C-h>", function() require(ui).nav_file(1) end, desc = "go to harpoon 1"},
        {"<C-t>", function() require(ui).nav_file(2) end, desc = "go to harpoon 2"},
        {"<C-n>", function() require(ui).nav_file(3) end, desc = "go to harpoon 3"},
        {"<C-s>", function() require(ui).nav_file(4) end, desc = "go to harpoon 4"},

    },
}
