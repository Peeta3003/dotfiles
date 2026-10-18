local opt = vim.opt

-- UI
opt.number = true
opt.relativenumber = true
opt.cursorline = true
--opt.colorcolumn = "100"
opt.list = true
opt.fillchars = { eob = " " }
opt.winborder = "rounded"

-- Editing behavior
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
opt.breakindent = true
opt.iskeyword:append("-")
opt.mouse = "a" -- "" mouse support ("" to disable)
opt.confirm = true

-- Scrolling and navigation
opt.wrap = false
opt.scrolloff = 4
opt.sidescrolloff = 8
opt.signcolumn = "yes"
opt.termguicolors = true

-- Search and replace
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = false
opt.inccommand = "split"

-- Files and backups
opt.undofile = true
opt.swapfile = false
opt.undolevels = 10000
opt.autoread = true
opt.autowrite = true
opt.backup = false
opt.writebackup = false

-- Misc
opt.updatetime = 250
opt.splitright = true
opt.splitbelow = true
opt.clipboard = "unnamedplus"
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldlevelstart = 99 -- open all folds by default

-- Quick highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Stop comments from continuing on new lines
vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})
