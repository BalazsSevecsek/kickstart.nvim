return {
  -- Main LSP Configuration
  'neovim/nvim-lspconfig',
  dependencies = {
    "folke/neodev.nvim",
    --Mason is the plugin manager for installing lsp plugins
    { 'williamboman/mason.nvim', opts = {} },
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',

    -- status updates
    { 'j-hui/fidget.nvim',       opts = {} },

    -- Allows extra capabilities provided by nvim-cmp
    'hrsh7th/cmp-nvim-lsp',

    -- Autoformatting
    "stevearc/conform.nvim",

    -- Schema information
    "b0o/SchemaStore.nvim",

    -- 'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  config = function()
    require("neodev").setup()
    local lspconfig = require('lspconfig')
    -- Change diagnostic symbols in the sign column (gutter)
    if vim.g.have_nerd_font then
      local signs = {
        ERROR = '✖', -- Cross mark for errors
        WARN  = '⚠', -- Warning triangle
        INFO  = 'i', -- Information symbol
        HINT  = '💡' -- Light bulb for hints
      }
      local diagnostic_signs = {}
      for type, icon in pairs(signs) do
        diagnostic_signs[vim.diagnostic.severity[type]] = icon
      end
      vim.diagnostic.config { signs = { text = diagnostic_signs } }
    end

    -- Enable the following language servers
    -- example https://github.com/pmizio/typescript-tools.nvim
    local servers = {
      lua_ls = {
        -- cmd = { ... },
        -- filetypes = { ... },
        -- capabilities = {},
        settings = {
          Lua = {
            completion = {
              callSnippet = 'Replace',
            },
            -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
            -- diagnostics = { disable = { 'missing-fields' } },
          },
        },
      },
      ts_ls = {
        root_dir = require('lspconfig.util').root_pattern("package.json", "tsconfig.json", "jsconfig.json"),
        single_file_support = false,
        format = false
      },
      biome = {},
      eslint = {},
      pylsp = {},
      rust_analyzer = {},
      jsonls = {},
      dockerls = {},
      docker_compose_language_service = {},
      basedpyright = {},
      bashls = {},
      sqls = {},
      gopls = {},
      html = {},
      -- denols = {},
      -- htmx = {},
      cssls = {},
    }

    -- Ensure the servers and tools above are installed by Mason
    local ensure_installed_servers = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed_servers, {
      --add additional components
    })

    --  Add additional capabilities to the server
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())


    require('mason-lspconfig').setup({
      automatic_installation = true,
      ensure_installed = ensure_installed_servers,
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    })
  end,
}

--not sure I need this
-- vim.list_extend(ensure_installed, {
--   'stylua',
-- })

-- require('mason-tool-installer').setup { ensure_installed = ensure_installed }
