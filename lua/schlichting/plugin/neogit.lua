return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",         -- required
        "nvim-telescope/telescope.nvim", -- optional
        "sindrets/diffview.nvim",        -- optional
    },
    keys = {
        {"<leader>gc", function() require("neogit").open({"commit"}) end, desc = "open neogit commit window"},
        {"<leader>go", function() require("neogit").open() end, desc = "open neogit window"},
    },
    opts = {
        integrations = {
            telescope = true,
            diffview = true,
        },
    },
}
