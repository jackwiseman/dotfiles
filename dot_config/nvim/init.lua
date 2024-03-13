require('jackwiseman.core')
require('jackwiseman.lazy')

-- local dap = require('dap')

-- dap.adapters.go = function(callback, _)
--   local host = "127.0.0.1"
--   local port = 2345
--   callback({type = "server", host = host, port = port})
-- end

-- dap.configurations.go = {
--   {
--     name = "Connect to Remote Delve",
--     type = "go",
--     request = "attach",
--     mode = "remote",
--     cwd = vim.fn.getenv("GOPATH") .. "/src/github.com/ezoic/sol",
--     port = 2345,
--     host = "127.0.0.1",
--     apiVersion = 2,
--     substitutePath = {
--       {
--         from = "${env:GOPATH}",
--         to = "/var/go"
--       }
--     },
--     showLog = true,
--     trace = "warn", -- Note: `trace` option handling depends on the `nvim-dap` implementation and might not directly map from VS Code.
--   },
-- }

-- Debugging
-- vim.keymap.set('n', '<Leader>db', function() require('dap').toggle_breakpoint() end)
-- vim.keymap.set('n', '<Leader>dc', function() require('dap').continue() end)
-- vim.keymap.set('n', '<Leader>dt', function() require('dapui').toggle() end)
