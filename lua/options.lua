--terminal colors
vim.opt.termguicolors = true

--tab handling
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

--#cursor style for windows
vim.opt.guicursor = ""

--line numbers
vim.opt.number = true
-- vim.wo.relativenumber = true

vim.opt.smartindent = true

--no wrapping of lines
vim.opt.wrap = false
--if indent would be switched on, it would indent the wrapped line
--vim.opt.breakindent = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

--disable swapfile - important at crashes creates .swap files
vim.opt.swapfile = false
--backup files used at before overwriting a file
vim.opt.backup = false

--create persistent undo history between restarts
--vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

--incremental highlighted search
vim.opt.hlsearch = true
vim.opt.incsearch = true
-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

--ignore case
vim.opt.ignorecase = true
vim.opt.smartcase = true

--keep 8 lines always visible for better
vim.opt.scrolloff = 10
--always show the sign column (debug symbols, git symbols)
vim.opt.signcolumn = "yes"

--treats @ as part of the file
vim.opt.isfname:append("@-@")

--reduces time before triggering events
vim.opt.updatetime = 250
-- sequence time to wait for key sequences
vim.opt.timeoutlen = 250

-- disable netrw (file manager)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--make autocomplete less noisy -suppress completion messages (popups when typing)
vim.opt.shortmess = vim.opt.shortmess + 'c'

--spell checking
vim.opt.spell = true

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

--vim.cmd('colorscheme monokai-pro')

vim.g.have_nerd_font = false


-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }


-- Show which line your cursor is on
--vim.opt.cursorline = true
