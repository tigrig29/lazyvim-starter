return {
  {
    "isakbm/gitgraph.nvim",
    dependencies = { "sindrets/diffview.nvim" },
    keys = {
      {
        "<leader>gl",
        function()
          require("gitgraph").draw({}, { "log", "--oneline", "--graph", "--all", "--decorate" })
        end,
        desc = "GitGraph Draw",
      },
    },
    opts = {
      symbols = {
        merge_commit = "M",
        commit = "*",
      },
      format = {
        timestamp = "%Y-%m-%d %H:%M:%S",
        fields = { "hash", "timestamp", "author", "branch_name", "tag" },
      },
      hooks = {
        -- Diffview.nvim と連携させる設定
        on_select_commit = function(commit)
          vim.notify("DiffviewOpen " .. commit.hash .. "^!")
          vim.cmd("DiffviewOpen " .. commit.hash .. "^!")
        end,
        on_select_range_commit = function(from, to)
          vim.notify("DiffviewOpen " .. from.hash .. ".." .. to.hash)
          vim.cmd("DiffviewOpen " .. from.hash .. ".." .. to.hash)
        end,
      },
    },
  },
}
