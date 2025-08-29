-- ========== 基本設定 ==========
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.updatetime = 300
vim.opt.splitright = true
vim.opt.splitbelow = true

-- ちょい便利キーマップ
local map = vim.keymap.set
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Write" })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
map("n", "<leader>h", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })
map("n", "<leader>rn", function() vim.opt.relativenumber = not vim.opt.relativenumber:get() end,
  { desc = "Toggle relative number" })

-- ========== lazy.nvim bootstrap ==========
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim", lazypath })
end
vim.opt.runtimepath:prepend(lazypath)

-- ========== プラグイン（言語依存なしのQoLのみ） ==========
require("lazy").setup({
  -- ステータスライン
  { "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function() require("lualine").setup({}) end
  },
  -- which-key（ショートカットのヒント）
  { "folke/which-key.nvim", config = true },
  -- コメントトグル
  { "numToStr/Comment.nvim", config = true },
  -- Git差分サイン
  { "lewis6991/gitsigns.nvim", config = true },
  -- なんでも検索（ファイル/バッファ/grep）
  { "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local t = require("telescope")
      t.setup({})
      map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
      map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>",  { desc = "Live grep" })
      map("n", "<leader>fb", "<cmd>Telescope buffers<cr>",    { desc = "Buffers" })
      map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>",  { desc = "Help" })
    end
  },
  
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "go", "typescript", "javascript", "tsx", "json", "html", "css", "c_sharp" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
  {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup()
      -- 「-」キーで現在のファイルの親ディレクトリを開く
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end,
  },
  {
  "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        view = { width = 30 },
        filters = { dotfiles = false },
      })
      vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file explorer" })
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,      -- 起動時に必ず読み込む
    priority = 1000,   -- 他のテーマより優先してロード
    config = function()
      vim.cmd([[colorscheme tokyonight-night]])
    end,
  },
})

