-- LazyVim の markdown extra はデフォルトで checkbox のレンダリングを無効化しているため、
-- ここで有効化してチェックボックスをアイコン表示させる
local function toggle_checkbox()
  local line = vim.api.nvim_get_current_line()
  if line:match("%[%s?%]") then
    vim.api.nvim_set_current_line((line:gsub("%[%s?%]", "[x]", 1)))
  elseif line:match("%[[xX]%]") then
    vim.api.nvim_set_current_line((line:gsub("%[[xX]%]", "[ ]", 1)))
  end
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function(args)
    vim.keymap.set("n", "<leader>tt", toggle_checkbox, { buffer = args.buf, desc = "Toggle Checkbox" })
  end,
})

return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      checkbox = {
        enabled = true,
      },
    },
  },
}
