return {
  -- snacks.explorer の無効化とキーマップの削除
  {
    "folke/snacks.nvim",
    opts = {
      explorer = { enabled = false },
      picker = { explorer = { enabled = false } },
    },
    keys = {
      -- デフォルトのキーマップを無効化
      { "<leader>e", false },
      { "<leader>E", false },
    },
  },
  -- oil.nvim の追加と設定
  {
    "stevearc/oil.nvim",
    -- 起動時に確実に読み込む
    lazy = false,
    opts = {
      -- デフォルトで netrw を置き換える
      default_file_explorer = true,
      -- アイコン表示の設定
      columns = {
        "icon",
      },
      -- プレビュー設定など
      view_options = {
        show_hidden = true,
      },
      keymaps = {
        ["<C-s>"] = false, -- デフォルトの垂直分割を無効化（保存キーと競合するため）
        ["<C-v>"] = "actions.select_vsplit", -- 垂直分割で開く
        ["<C-p>"] = function()
          Snacks.picker.files()
        end,
        ["K"] = "actions.preview",
      },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
      { "<leader>e", "<cmd>Oil<cr>", desc = "Open file explorer (Oil)" },
    },
  },
}
