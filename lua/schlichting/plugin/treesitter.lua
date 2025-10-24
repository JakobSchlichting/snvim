return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "OXY2DEV/markview.nvim"
    },
    lazy = false,
    config = function()
        require("nvim-treesitter.configs").setup({
            sync_installed = false,
            auto_install = true,
            highlight = {
                enable = true,
            },
        })
        local parser_config = require'nvim-treesitter.parsers'.get_parser_configs()
        -- Register the language
        vim.filetype.add {
            extension = {
                templ = "templ"
            }
        }
        parser_config.templ = {
            install_info = {
                url = "https://github.com/vrischmann/tree-sitter-templ.git",
                files = { "src/parser.c", "src/scanner.c" },
                branch = "master",
            },
            filetype = "gotmpl",
            used_by = {"gohtmltmpl", "gotexttmpl", "gotmpl"}
        }
        vim.treesitter.language.register('templ', 'templ')
    end,
}
