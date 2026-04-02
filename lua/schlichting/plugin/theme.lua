return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
        flavour = "mocha",
        styles = {
            comments = { "italic" },
        },
        integrations = {
            -- TODO: add all plugin interopts here
            telescope = { enabled = true },
        },
    },
    config = function(_, opts)
	    require("catppuccin").setup(opts)
	    vim.cmd.colorscheme("catppuccin")
    end,
}
