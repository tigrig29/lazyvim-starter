-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- インサートモードで Ctrl + V を押した時にクリップボードの内容を貼り付ける
vim.keymap.set("i", "<C-v>", "<C-r><C-o>+", { desc = "Paste from system clipboard" })
-- コマンドラインモード（: を押した後）での貼り付け
vim.keymap.set("c", "<C-v>", "<C-r>+", { desc = "Paste from system clipboard" })

-- <C-q> で :qa
vim.keymap.set("n", "Q", "<cmd>qa<cr>", { desc = "Quit all" })

-- <C-s> で保存
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- <C-p> でファイル検索
vim.keymap.del("n", "<leader><leader>")
vim.keymap.set("n", "<C-p>", function()
  Snacks.picker.files()
end, { desc = "Find Files" })

-- U で redo
vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })

-- dやxなどの削除操作でクリップボード（ヤンク）にコピーしないようにする
vim.keymap.set({ "n", "v" }, "d", '"_d', { desc = "Delete without copying" })
vim.keymap.set({ "n", "v" }, "D", '"_D', { desc = "Delete without copying" })
vim.keymap.set({ "n", "v" }, "x", '"_x', { desc = "Delete character without copying" })

-- 自動補完のトグル
vim.keymap.set("n", "<leader>uc", function()
  vim.g.blink_auto_show = not vim.g.blink_auto_show
  if vim.g.blink_auto_show then
    vim.notify("Auto completion ENABLED", vim.log.levels.INFO)
  else
    vim.notify("Auto completion DISABLED", vim.log.levels.WARN)
  end
end, { desc = "Toggle Auto Completion (Copilot/IntelliSense)" })
