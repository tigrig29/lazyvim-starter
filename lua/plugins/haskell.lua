return {
  {
    "mrcjkb/haskell-tools.nvim",
    version = "^4",
    init = function()
      vim.g.haskell_tools = {
        hls = {
          on_attach = function(client, bufnr, ht)
            -- cabalファイルで inlay hints によるエラーが発生するのを防ぐため無効化する
            if vim.bo[bufnr].filetype == "cabal" then
              vim.schedule(function()
                if vim.lsp.inlay_hint then
                  vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })
                end
              end)
            end
          end,
        },
      }
    end,
  },
}
