return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    dependencies = {
        "OXY2DEV/markview.nvim"
    },
    lazy = false,
    config = function()
        local ts = require("nvim-treesitter")
        local available = {}
        for _, lang in ipairs(ts.get_available()) do
            available[lang] = true
        end

        local function start(buf)
            if vim.api.nvim_buf_is_valid(buf) then
                pcall(vim.treesitter.start, buf)
            end
        end

        -- Enable highlighting per buffer and install missing parsers on demand
        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                local lang = vim.treesitter.language.get_lang(args.match)
                if not lang or not available[lang] then
                    return
                end

                if vim.list_contains(ts.get_installed("parsers"), lang) then
                    start(args.buf)
                    return
                end

                ts.install(lang):await(function(err)
                    if not err then
                        vim.schedule(function() start(args.buf) end)
                    end
                end)
            end,
        })
    end,
}
