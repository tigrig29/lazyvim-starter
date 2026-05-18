return {
  {
    "nvim-treesitter/nvim-treesitter",
    enabled = true,
    build = ":TSUpdate",
    opts = function(_, opts)
      -- C# (c_sharp) が確実にインストールされるようにする
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "c_sharp" })

      -- 【重要】プラグイン側の機能はすべてオフにし、ネイティブ(Neovim本体)に任せる
      opts.highlight = { enable = false }
      opts.indent = { enable = false }
      opts.incremental_selection = { enable = false }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    enabled = false,
  },
}
