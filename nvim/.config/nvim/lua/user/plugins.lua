-- lazy bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim", lazypath })
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup({
  { "folke/tokyonight.nvim", lazy = false, priority = 1000,
    config = function() vim.cmd.colorscheme("tokyonight-night") end },

  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function() require("lualine").setup({}) end },

  { "folke/which-key.nvim", config = true },
  { "numToStr/Comment.nvim", config = true },
  { "lewis6991/gitsigns.nvim", config = true },

  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local t = require("telescope")
      t.setup({})
      local map = vim.keymap.set
      map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
      map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>",  { desc = "Live grep" })
      map("n", "<leader>fb", "<cmd>Telescope buffers<cr>",    { desc = "Buffers" })
      map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>",  { desc = "Help" })
    end
  },
  -- 任意で FZF
  -- { "nvim-telescope/telescope-fzf-native.nvim", build = "make",
  --   config = function() require("telescope").load_extension("fzf") end },

  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "go", "typescript", "javascript", "tsx", "json", "html", "css", "c_sharp" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },

  { "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup()
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end
  },

  { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        view = { width = 30 },
        filters = { dotfiles = false },
      })
      vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file explorer" })
    end
  },
})

