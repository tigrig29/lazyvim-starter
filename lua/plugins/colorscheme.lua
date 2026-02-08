return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    opts = {
      -- 透過設定
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      on_highlights = function(hl, c)
        -- ウィンドウの境界線を見やすくする
        hl.WinSeparator = {
          fg = c.border_highlight, -- カラースキームが持つ強調色を使用
          bold = true,
        }
      end,
    },
  },
}
