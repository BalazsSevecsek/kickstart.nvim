  -- NOTE: Plugins can also be configured to run Lua code when they are loaded.
  --
  -- This is often very useful to both group configuration, as well as handle
  -- lazy loading plugins that don't need to be loaded immediately at startup.
  --
  -- For example, in the following configuration, we use:
  --  event = 'VimEnter'
  --
  -- which loads which-key before all the UI elements are loaded. Events can be
  -- normal autocommands events (`:help autocmd-events`).
  --
  -- Then, because we use the `config` key, the configuration only runs
  -- after the plugin has been loaded:
  --  config = function() ... end

  return { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup()
  
      local wk = require("which-key")
  
      -- Define groups and key bindings
      wk.add({
        -- Group definitions
        { '<leader>c', group = '[C]ode' },
        { '<leader>d', group = '[D]ocument' },
        { '<leader>r', group = '[R]ename' },
        { '<leader>s', group = '[S]earch' },
        { '<leader>w', group = '[W]orkspace' },
        { '<leader>b', group = '[B]uffers' },
        { '<leader>f', group = '[F]ile Tree' },
  
        -- Add individual mappings (if needed, examples below)
        -- { '<leader>cf', '<cmd>SomeCommand<cr>', desc = 'Format Code' },
        -- { '<leader>ds', '<cmd>SomeOtherCommand<cr>', desc = 'Show Documentation' },
      })
    end,  
  }