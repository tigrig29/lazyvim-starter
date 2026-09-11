return {
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      -- デフォルトは自動補完（メニュー表示＆ゴーストテキスト）を無効化
      if vim.g.blink_auto_show == nil then
        vim.g.blink_auto_show = false
      end

      opts.completion = opts.completion or {}
      
      opts.completion.menu = opts.completion.menu or {}
      opts.completion.menu.auto_show = function(ctx)
        return vim.g.blink_auto_show
      end

      opts.completion.ghost_text = opts.completion.ghost_text or {}
      opts.completion.ghost_text.enabled = function()
        return vim.g.blink_auto_show
      end

      -- 既存 keymap を保持しつつ拡張する
      opts.keymap = opts.keymap or {}

      -- 補完メニューを手動表示
      -- 元々 <C-Space> に割り当てられているが、Windowsに吸われてしまうため、<C-j> に変更
      opts.keymap["<C-j>"] = { "show" }

      return opts
    end,
  },
}
