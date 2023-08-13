local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd [[packadd packer.nvim]]
end

require("packer-config")

if is_bootstrap then
    require('packer').sync()
end

-- when we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- you'll need to restart nvim, and then it will work.
if is_bootstrap then
    print '=================================='
    print '    Plugins are being installed'
    print '    Wait until Packer completes,'
    print '       then restart nvim'
    print '=================================='
    return
end

-- automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | silent! LspStop | silent! LspStart | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})


-- 
require("nvim-options")
require("keymap-config")

require("autopairs-config")
require("barbar-config")
require("colorizer-config")
-- require("colors-config.nightfox")
require("comment-nvim-config")
require("indent-blankline-config")
require("lsp-config.completion")
require("lsp-config.language-servers")
require("lsp-config.lspsaga")
require("lsp-config.null-ls")
require("lualine-config")
-- require("neorg-config")
require("nvim-tree-config")
-- require("shade-config")
require("startup-config")
require("telescope-config")
require("toggleterm-config")
require("treesitter-config")
