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
      },
    },
  },
}
