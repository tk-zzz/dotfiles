vim.g.mapleader = " "
require("user.options")
require("user.keymaps")
require("user.plugins")
-- マシン固有はお守り読み込み
pcall(function() require("user.local") end)

