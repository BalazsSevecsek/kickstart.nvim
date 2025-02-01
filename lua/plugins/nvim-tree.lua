return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'akinsho/bufferline.nvim', -- having tabs for buffers
  },
  config = function()
    local function my_on_attach(bufnr)
      local api = require "nvim-tree.api"

      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- default mappings
      api.config.mappings.default_on_attach(bufnr)

      -- custom mappings
      vim.keymap.set('n', '<leader>ft', ':NvimTreeToggle<CR>', opts('[N]vim [T]ree toggle'))
    end

    -- OR setup with some options
    require("nvim-tree").setup({
      on_attach = my_on_attach,
      update_focused_file = {
        enable = true,
        update_cwd = true,
      },
      view = {
        adaptive_size=true
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = false,
      },
    })
    require("bufferline").setup({
      options = {
        offsets = {
          {
            filetype = "NvimTree",
            text = "Nvim Tree",
            separator = true,
            text_align = "left"
          }
        },
      }
    })
  end,
}
