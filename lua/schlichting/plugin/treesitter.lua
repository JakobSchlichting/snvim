return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require("nvim-treesitter.configs").setup({
            sync_installed = false,
            auto_install = true,
            highlight = {
                -- `false` will disable the whole extension
                enable = true,

                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = { 'org' },
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
