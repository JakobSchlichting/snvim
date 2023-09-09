return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "nvim-treesitter/nvim-treesitter",
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
    },
    keys = {
        {"<leader>ff", function() require("telescope.builtin").find_files() end, desc = "find files"},
        {"<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "find string"},
        {"<leader>fm", "<cmd>Telescope harpoon marks<cr>", desc = "find telescope marks"},
        {"<leader>fw", function() require("telescope").extensions.git_worktree.git_worktrees() end, desc = "select git worktree"},
        {"<leader>cw", function() require("telescope").extensions.git_worktree.create_git_worktree() end, desc = "create a git worktree"},
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local builtin = require("telescope.builtin")
        local keymap = vim.keymap


        telescope.setup({
            defaults = {
                -- path_display = { "truncate" },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-j>"] = actions.move_selection_next,
                    },
                },
            },
        })

        -- telescope.load_extension("fzf")
        telescope.load_extension("todo-comments")
        telescope.load_extension("harpoon")
        telescope.load_extension("git_worktree")
    end,
}
