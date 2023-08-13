local set = vim.opt

set.expandtab = true
set.smarttab = true
set.shiftwidth = 2
set.tabstop = 2

set.hlsearch = true
set.ignorecase = true
set.incsearch = true
set.smartcase = true

set.breakindent = true
set.conceallevel = 2
set.fileencoding = "utf-8"
set.scrolloff = 5
set.showmode = false
set.splitbelow = true
set.splitright = true
set.termguicolors = true
set.wrap = false

set.completeopt = "menuone,noselect"
set.cursorline = true
set.relativenumber = true
set.wildmenu = true

set.hidden = true
set.mouse = "a"

set.fillchars = "eob: "

set.guifont = {
    "Iosevka Term", ":h14"
}

vim.cmd([[
    colorscheme gruvbox-material
]])

vim.g.gruvbox_material_enable_italic = 1

vim.notify = require("notify")

-- vimtex config
vim.g.vimtex_view_method = "zathura"

-- vim.g.goyo_height = 90

--> LanguageTool configs
-- vim.cmd([[
--     autocmd User LanguageToolCheckDone LanguageToolSummary
--     autocmd Filetype tex LanguageToolSetUp
--     autocmd Filetype norg LanguageToolSetUp
-- ]])
