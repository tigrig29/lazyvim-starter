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

-- 1行を `- [ ] ` → `- ` → (なし) → `- [ ] ` の順に切り替えた文字列を返す
local function cycle_list_marker(line)
  local indent, rest = line:match("^(%s*)[-*+] %[.%] ?(.*)$")
  if indent then
    return indent .. "- " .. rest
  end
  indent, rest = line:match("^(%s*)[-*+] (.*)$")
  if indent then
    return indent .. rest
  end
  indent, rest = line:match("^(%s*)(.*)$")
  return indent .. "- [ ] " .. rest
end

local function cycle_checkbox_lines(first, last)
  local lines = vim.api.nvim_buf_get_lines(0, first - 1, last, false)
  for i, line in ipairs(lines) do
    lines[i] = cycle_list_marker(line)
  end
  vim.api.nvim_buf_set_lines(0, first - 1, last, false, lines)
end

local function cycle_checkbox()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local before = #vim.api.nvim_get_current_line()
  cycle_checkbox_lines(row, row)
  -- 記号の増減に合わせてカーソル位置をずらし、本文上の位置を保つ
  local delta = #vim.api.nvim_get_current_line() - before
  vim.api.nvim_win_set_cursor(0, { row, math.max(0, col + delta) })
end

local function cycle_checkbox_visual()
  local first, last = vim.fn.line("v"), vim.fn.line(".")
  if first > last then
    first, last = last, first
  end
  cycle_checkbox_lines(first, last)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function(args)
    -- Alt+o: チェックの ON/OFF（[ ] ⇔ [x]）
    vim.keymap.set({ "n", "i" }, "<A-o>", toggle_checkbox, { buffer = args.buf, desc = "Toggle Checkbox" })
    -- Alt+l: `- [ ] ` → `- ` → (なし) の切り替え
    vim.keymap.set({ "n", "i" }, "<A-l>", cycle_checkbox, { buffer = args.buf, desc = "Cycle Checkbox / List" })
    vim.keymap.set("x", "<A-l>", cycle_checkbox_visual, { buffer = args.buf, desc = "Cycle Checkbox / List" })
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
