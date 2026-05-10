-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- ターミナルの設定
if vim.fn.has("win32") == 1 then
  -- PowerShell の実行パスを指定（pwsh.exe がパスに通っている前提）
  local powershell_options = {
    shell = "pwsh",
    shellcmdflag = "-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
    shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
    shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; return $? ",
    shellquote = "",
    shellxquote = "",
  }

  for option, value in pairs(powershell_options) do
    vim.opt[option] = value
  end
end

-- 行をまたいでカーソル移動
vim.opt.whichwrap:append("<,>,[,],h,l")

-- エンコーディング
vim.opt.fileencodings = "utf-8,cp932"
