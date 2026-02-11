-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- インサートモードで Ctrl + V を押した時にクリップボードの内容を貼り付ける
vim.keymap.set("i", "<C-v>", "<C-r><C-o>+", { desc = "Paste from system clipboard" })
-- コマンドラインモード（: を押した後）での貼り付け
vim.keymap.set("c", "<C-v>", "<C-r>+", { desc = "Paste from system clipboard" })

-- ターミナルキー設定
vim.keymap.del("n", "<leader>ft")
vim.keymap.del("n", "<leader>fT")
vim.keymap.set("n", "<leader>t", function()
  Snacks.terminal()
end, { desc = "Terminal (Root Dir)" })
vim.keymap.set("n", "<leader>T", function()
  Snacks.terminal(nil, { cwd = vim.uv.cwd() })
end, { desc = "Terminal (cwd)" })
