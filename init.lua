vim.g.mapleader = " "
vim.g.maplocalleader = "\\"


--Downloads lazy if the internal the respective folder in ~/.local/share/nvim does not work
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

--Add lazy to the `runtimepath` this allows nvim to load it.
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({ import = "plugins" }, {
  spec = {
    -- add your plugins here
  },
  install = { colorscheme = { "habamax" } },
  checker = { enabled = true },
})

require("options")
require("keymaps")
require("autocmds")
