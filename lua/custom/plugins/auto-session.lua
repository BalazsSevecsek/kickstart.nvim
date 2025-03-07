return {
  'rmagatti/auto-session',
  lazy = false,

  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
    --log_level = 'debug',
    use_git_branch = true,
    auto_restore_last_session = true,
    post_restore_cmds = {
      "NvimTreeOpen", -- Open nvim-tree after restoring session
      "wincmd p"      -- Focus on the last active window (previous file)
    },
  }
}
