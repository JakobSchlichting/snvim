return {
    "lervag/vimtex",
    -- vimtex must not be lazy-loaded, otherwise inverse search breaks
    lazy = false,
    init = function()
        vim.g.maplocalleader = " "
        vim.g.vimtex_view_method = "zathura"

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "tex",
            callback = function()
                vim.opt_local.foldmethod = "expr"
                vim.opt_local.foldexpr = "vimtex#fold#level(v:lnum)"
                vim.opt_local.foldtext = "vimtex#fold#text()"
                vim.opt_local.foldlevel = 2
            end,
        })
    end,
}
