return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                -- vim グローバルを認識させる
                globals = { "vim", "Snacks" },
              },
              workspace = {
                checkThirdParty = false,
              },
            },
          },
        },
        hls = {
          mason = false,
        },
      },
      setup = {
        hls = function()
          return true -- haskell-tools が独自に起動するため、lspconfigからの起動をスキップ
        end,
      },
    },
  },
}
