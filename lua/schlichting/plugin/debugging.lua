return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        "theHamsta/nvim-dap-virtual-text",
    },
    lazy = false,
    config = function ()
        local dap, dapui = require("dap"), require("dapui")
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end
        vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
    end,
    keys = {
        { "<leader>b", function () require("dap").toggle_breakpoint() end, desc = "set/unset breakpoint here" },
        { "<leader>lp", function () require("dap").set_breakpoint(nil, nil, vim.fn.input("log point message> ")) end, desc = "set a log point" },
        { "<leader>c", function () require("dap").continue() end, desc = "debugger continue" },
        { "<leader>so", function () require("dap").step_over() end, desc = "debugger step over" },
        { "<leader>si", function () require("dap").step_into() end, desc = "debugger step into" },
        { "<leader>sx", function () require("dap").step_out() end, desc = "debugger step out" },
    }
}
