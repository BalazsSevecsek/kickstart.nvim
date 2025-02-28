return {
  'rmagatti/auto-session',
  lazy = false,

  opts = {
    suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
    -- auto_restore_last_session = true
  },
  -- config = function()
  --for auto-session
  -- vim.o.sessionoptions = "buffers,curdir,folds,tabpages,winsize,localoptions"
  -- require('auto-session').setup({
  --   post_restore_cmds = { "NvimTreeFindFile" },
  --   pre_save_cmds = { "NvimTreeClose" },
  --   log_level = 'warn',
  -- })
  -- end
}
