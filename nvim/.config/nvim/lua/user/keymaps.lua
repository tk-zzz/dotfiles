local map = vim.keymap.set
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Write" })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
map("n", "<leader>h", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })
map("n", "<leader>rn", function()
  vim.opt.relativenumber = not vim.opt.relativenumber:get()
end, { desc = "Toggle relative number" })

-- 窓移動
map("n", "<C-h>", "<C-w>h", { silent = true })
map("n", "<C-j>", "<C-w>j", { silent = true })
map("n", "<C-k>", "<C-w>k", { silent = true })
map("n", "<C-l>", "<C-w>l", { silent = true })

-- コメントアウト
vim.keymap.set("n", "<D-/>", ":normal gcc<CR><DOWN>", { desc = "[/] 行コメントの切り替え" })
-- <Esc> - ビジュアルモードを終了。
-- :normal はノーマルモードでキーストロークを実行。
-- gv - 選択範囲を復元。
-- gc - コメントの切り替え
-- <CR> はコマンドを送信
vim.keymap.set("v", "<D-/>", "<Esc>:normal gvgc<CR>", { desc = "[/] ブロックコメントの切り替え" })
