return require("packer").startup(function()
    use("wbthomason/packer.nvim") --> packer plugin manager


    --> general
    use("akinsho/toggleterm.nvim") --> terminal emulator
    use("fladson/vim-kitty") --> kitty config syntax highlighting
    use("ggandor/lightspeed.nvim") --> motion plugin for unparalleled speed with near-zero cognitive effort
    -- use("jubnzv/mdeval.nvim") --> evaluates code blocks inside markdown, vimwiki, orgmode.nvim and norg docs
    use("kyazdani42/nvim-tree.lua") --> file explorer
    use("kyazdani42/nvim-web-devicons") --> enable icons
    use("lervag/vimtex") --> filetype and syntax plugin for LaTeX files
    use("lewis6991/gitsigns.nvim") --> version control signs for added, removed, and changed lines
    use("lukas-reineke/indent-blankline.nvim") --> add indentation guides even on blank lines
    use("mbbill/undotree") --> undo changes
    use("mfussenegger/nvim-dap"
  ) --> debug adapter protocol client
    use("norcalli/nvim-colorizer.lua")
    use("numToStr/Comment.nvim") --> comment visual regions/lines
    use("nvim-lua/plenary.nvim")
    use("nvim-lualine/lualine.nvim") --> statusline
    use("nvim-telescope/telescope.nvim") --> fuzzy finder
    use("rcarriga/nvim-notify") --> notifications inside neovim
    use("romgrk/barbar.nvim") --> tab navigation
    use("startup-nvim/startup.nvim") --> startup screen
    use("sunjon/shade.nvim") --> dim inactive windows
    use("tpope/vim-fugitive") --> git wrapper
    use("tpope/vim-rhubarb") --> enables open github urls
    use("tpope/vim-sleuth") --> detect tabstop and shiftwidth automatically
    use("vigoux/LanguageTool.nvim") --> grammar checker
    use("windwp/nvim-autopairs")

    -- fuzzy finder algorithm which requires local dependencies to be built, only load if `make` is available
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }


    --> colorschemes
    use("EdenEast/nightfox.nvim") --> nightfox colorscheme
    use("sainnhe/gruvbox-material") --> gruvbox colorscheme


    --> treesitter & treesitter modules/plugins
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }) --> treesitter
    use("JoosepAlviste/nvim-ts-context-commentstring")
    use("nvim-treesitter/playground")
    use("nvim-treesitter/nvim-treesitter-refactor")
    use("nvim-treesitter/nvim-treesitter-textobjects") --> textobjects
    use("nvim-treesitter/playground")
    use("p00f/nvim-ts-rainbow")

    use("nvim-neorg/neorg") --> structured note taking, project and task management, time tracking, slideshows, writing typeset documents and much more


    --> lsp
    use("folke/neodev.nvim") --> additional lua configuration, makes nvim stuff amazing
    use("hrsh7th/cmp-nvim-lsp") --> lsp source for nvim-cmp
    use("hrsh7th/nvim-cmp") --> autocompletion plugin
    use("j-hui/fidget.nvim") --> useful status updates for lsp
    use("jose-elias-alvarez/null-ls.nvim") --> inject lsp diagnostics, formattings, code actions, and more ...
    use("L3MON4D3/LuaSnip") --> snippets plugin
    use("neovim/nvim-lspconfig") --> collection of configurations for built-in lsp client
    use("onsails/lspkind-nvim") --> vscode-like pictograms for neovim lsp completion items
    use("saadparwaiz1/cmp_luasnip") --> snippets source for nvim-cmp
    use("tami5/lspsaga.nvim") --> icons for lsp diagnostics
    use("williamboman/nvim-lsp-installer") --> companion plugin for lsp-config, allows us to seamlesly install language servers
    use("williamboman/mason.nvim") --> package manager for lsp servers, dap servers, linters and formatters
    use("williamboman/mason-lspconfig.nvim")
end)
