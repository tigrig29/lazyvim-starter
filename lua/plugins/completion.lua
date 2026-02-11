return {
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      -- 既存 keymap を保持しつつ拡張する
      opts.keymap = opts.keymap or {}

      -- 補完メニューを手動表示
      -- 元々 <C-Space> に割り当てられているが、Windowsに吸われてしまうため、<C-j> に変更
      opts.keymap["<C-j>"] = { "show" }

      return opts
    end,
  },
}
