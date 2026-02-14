return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      -- 全体的なピッカーの設定
      win = {
        input = {
          keys = {
            -- 実行中に "ctrl-h" で隠しファイルの表示/非表示を切り替えたい場合（便利です）
            ["<C-h>"] = { "toggle_hidden", mode = { "i", "n" } },
          },
        },
      },
      -- 各ソースごとのデフォルト設定
      sources = {
        files = {
          hidden = true,
        },
      },
    },
  },
}
