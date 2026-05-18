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

-- ==============================================================================
-- IME自動オフ制御 (Windows / WSL環境用)
-- ==============================================================================
local function set_ime_off()
  local is_win = vim.fn.has("win32") == 1
  local is_wsl = vim.fn.has("wsl") == 1

  -- WindowsまたはWSL環境でのみ実行
  if is_win or is_wsl then
    -- Neovimの非同期APIを利用
    if vim.system then
      -- im-select.exe の代わりに zenhan を使用
      vim.system({ "zenhan", "0" })
    else
      vim.fn.jobstart({ "zenhan", "0" })
    end
  end
end

-- IME制御用のAutocmdグループを作成
local ime_group = vim.api.nvim_create_augroup("AutoImeOff", { clear = true })

-- 1. インサートモード、およびコマンドラインモード(:や/など)を抜けた瞬間にOFF
vim.api.nvim_create_autocmd({ "InsertLeave", "CmdlineLeave" }, {
  group = ime_group,
  pattern = "*",
  callback = set_ime_off,
})

-- 2. Neovimにフォーカスが戻ってきた時（WezTermで別アプリから戻った時など）
-- その時ノーマルモードであれば、念のためIMEをOFFにしておく
vim.api.nvim_create_autocmd("FocusGained", {
  group = ime_group,
  pattern = "*",
  callback = function()
    if vim.fn.mode() == "n" then
      set_ime_off()
    end
  end,
})
