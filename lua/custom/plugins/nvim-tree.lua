return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'akinsho/bufferline.nvim',
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

      -- Move between buffers
      -- Move between buffers
      vim.keymap.set("n", "<leader><Tab>", ":BufferLineCycleNext<CR>", { silent = true, desc = "Next Buffer" })
      vim.keymap.set("n", "<leader><S-Tab>", ":BufferLineCyclePrev<CR>", { silent = true, desc = "Previous Buffer" })

      -- Close buffer
      vim.keymap.set("n", "<leader>c", ":bdelete<CR>", { silent = true, desc = "Close Buffer" })
    end

    -- OR setup with some options
    require("nvim-tree").setup({
      on_attach = my_on_attach,
      update_focused_file = {
        enable = true,
        update_cwd = true,
      },
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = true,
      },
    })
    require("bufferline").setup({
      options = {
        diagnostics = "nvim_lsp", -- Show LSP diagnostics in bufferline
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
