return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    { "<leader>e", "<cmd>Neotree toggle <cr>", desc = "NeoTree" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,
  opts = {
    enable_git_status = true,
    enable_diagnostics = true,
    window = {
      position = "right",
      width = 25,
    },
    filesystem = {
      follow_current_file = {
        enabled = true,
      },
    },
    -- Add the autocmd within the opts table (Lazy-style)
    setup = function()
      -- Disable folding specifically for Neo-tree filetype
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "neo-tree",
        callback = function()
          vim.opt_local.foldenable = false
          vim.opt_local.foldmethod = "manual"
        end,
      })
    end,
  },
}

