-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- コメントの自動継続を無効化
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    -- r: Enter時の継続をオフ
    -- o: o, Oでの継続をオフ
    vim.opt_local.formatoptions:remove({ "r", "o" })
  end,
})

-- ターミナルモードから脱出するための設定
vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom_terminal_keymaps", { clear = true }),
  callback = function()
    -- バッファローカルな設定として適用することでグローバルな競合を回避
    vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { buffer = 0, desc = "Exit terminal mode", nowait = true })
  end,
})
