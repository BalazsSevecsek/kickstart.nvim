return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      -- `cond` is a condition used to determine whether this plugin should be installed and loaded.
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    --supports mutliple project telescope history
    { "nvim-telescope/telescope-smart-history.nvim" },
    --neede for smart history
    { "kkharji/sqlite.lua" },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    {
      'nvim-tree/nvim-web-devicons',
      enabled = vim.g.have_nerd_font
    },
  },
  config = function()
    require("telescope").setup {
      extensions = {
        fzf = {},
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
        wrap_results = true,
        history = {
          limit = 100,
        },
      },
      vimgrep_arguments = {
        'rg',
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--smart-case',
        '--hidden',
      },
    }
  end,
}
