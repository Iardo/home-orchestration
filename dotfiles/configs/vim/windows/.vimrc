"   _    ________  _______  ______
"  | |  / /  _/  |/  / __ \/ ____/
"  | | / // // /|_/ / /_/ / /     
"  | |/ // // /  / / _, _/ /___   
"  |___/___/_/  /_/_/ |_|\____/   
"


"  ___  ___ ___ _  _   _ _  _____ ___ 
" |   \| __| __/_\| | | | ||_   _/ __|
" | |) | _|| _/ _ \ |_| | |__| | \__ \
" |___/|___|_/_/ \_\___/|____|_| |___/
" 
" // cSpell:disable
set background=dark
" set colorcolumn=80
set complete+=kspell
set completeopt=menuone,longest
set expandtab
set guifont=Iosevka\ SS02\ Semibold:h14
set incsearch
set jumpoptions+=stack
set langmenu=en_US 
let $LANG = 'en_US'
set ma
set mouse=a
set number
set nobackup
set nobomb
set noerrorbells
set noswapfile
set nowrap
set nu rnu
set number relativenumber
set smartcase
set shiftwidth=4
set shortmess+=c
set tabstop=4 softtabstop=4
set undodir=~/.vim/undodir
set undofile
set ve+=onemore
set fillchars-=vert:\|
set fillchars+=vert:\ 

" disable only ligatures and accents 
let g:tex_conceal = 'bdmgs'

" LEADER
let mapleader = ","


" NODEJS
" If :checkhealth says that npm is not recognized then
" Run the following command:
"   -> npm install -g neovim
if has('win32')
    " expand('~/AppData/Roaming/nvm/v12.22.1/node64.exe)
    " //wsl$/Ubuntu-20.04/home/iardo/docker/bin-nodejs/node_versions/v14.17.3/bin/node
    let g:coc_node_path = '\\wsl$\Ubuntu-20.04\home\iardo\docker\bin-nodejs\node_versions\v14.17.3\bin\node'
endif

" PYTHON
" If you encounter an error like this:
"   -> [ function provider#python#Call[9]..remote#host#Require[13]..provider#pythonx#Require, line 15 ]
" Run this command 
"   -> pip install --upgrade --force-reinstall neovim --user
if has('win32')
    " expand('~/AppData/Local/Programs/Python/Python39/python.exe')
    let g:python3_host_prog = expand('~/AppData/Local/Programs/Python/Python39/python.exe')
endif

" TRUE COLORS
if (has("nvim"))
  " For Neovim 0.1.3 and 0.1.4
  " https://github.com/neovim/neovim/pull/2198
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" For Neovim > 0.1.5 and Vim > patch 7.4.1799 > https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162
" based on Vim patch 7.4.1770 (`guicolors` option) > https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd
" https://github.com/neovim/neovim/wiki/Following-HEAD#20160511
if (has("termguicolors"))
  set termguicolors
endif

" SHELL | Powershell
if has('win32')
    let &shell = has('win32') ? 'powershell' : 'pwsh'
    let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command'
    let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
    let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
    set shellquote= shellxquote=
endif

"  __   _____ __  __     ___ _   _   _  ___ 
"  \ \ / /_ _|  \/  |___| _ \ | | | | |/ __|
"   \ V / | || |\/| |___|  _/ |_| |_| | (_ |
"    \_/ |___|_|  |_|   |_| |____\___/ \___|
"                                                  
" For more information go to https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'jremmen/vim-ripgrep', {'do': 'yes \| choco install ripgrep'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'lyuts/vim-rtags'
Plug 'mbbill/undotree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'severin-lemaignan/vim-minimap'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-utils/vim-man'
Plug 'vim-vdebug/vdebug'
call plug#end()


"   ___ _   _   _  ___ ___ _  _ ___    ___ ___  _  _ ___ ___ ___ 
"  | _ \ | | | | |/ __|_ _| \| / __|  / __/ _ \| \| | __|_ _/ __|
"  |  _/ |_| |_| | (_ || || .` \__ \ | (_| (_) | .` | _| | | (_ |
"  |_| |____\___/ \___|___|_|\_|___/  \___\___/|_|\_|_| |___\___|
" 
" AIRLINE
" Set the theme
let g:airline_theme = "palenight"

" COC

" Go to definition
nnoremap <leader>gd <Plug>(coc-definition)
" Show a list with all the references
nnoremap <leader>gr <Plug>(coc-references)
" 
nnoremap <C-p> :GFiles<CR>
let g:coc_start_at_startup = 1
" The extensions declared on the following array are going to be installed automatically
let g:coc_global_extensions = [
    \'coc-browser',
    \'coc-cssmodules',
    \'coc-emmet',
    \'coc-flutter',
    \'coc-fzf-preview',
    \'coc-gist',
    \'coc-graphql',
    \'coc-highlight',
    \'coc-html',
    \'coc-htmlhint',
    \'coc-html-css-support',
    \'@yaegassy/coc-intelephense',
    \'coc-java',
    \'coc-json',
    \'coc-julia',
    \'coc-omnisharp',
    \'coc-php-cs-fixer',
    \'coc-phpls',
    \'coc-powershell',
    \'coc-python',
    \'coc-rls',
    \'coc-rome',
    \'coc-sh',
    \'coc-stylelintplus',
    \'coc-stylelint',
    \'coc-sourcekit',
    \'coc-spell-checker',
    \'coc-sql',
    \'coc-sqlfluff',
    \'coc-svelte',
    \'coc-svg',
    \'coc-swagger',
    \'coc-tailwindcss',
    \'coc-texlab',
    \'coc-tsserver',
    \'coc-vetur',
    \'coc-xml',
    \'coc-yaml',
\ ]
let g:coc_user_config = {
    \'coc.preferences': {
        \'suggest.noselect': v:false,
        \'suggest.enablePreselect': v:false,
    \}
\}

" CTRLP
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" <ag> is fast enough that ctrlp doesn't need to cache
let g:ctrlp_use_caching = 0

" FZF
" This is the default option:
"   - Preview window on the right with 50% width
"   - CTRL-/ will toggle preview window.
" - Note that this array is passed as arguments to fzf#vim#with_preview function.
" - To learn more about preview window options, see `--preview-window` section of `man fzf`.
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" LIGHTLINE
" Set the theme
let g:lightline = { 'colorscheme': 'palenight' }

" TELESCOPE
" Find files
nnoremap <leader>ff <cmd>Telescope find_files<cr>
" 
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" 
nnoremap <leader>fb <cmd>Telescope buffers<cr>
" 
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" UNDOTREE
" 
nnoremap <leader>u :UndotreeShow<CR>
let g:netrw_browse_split = 2
let g:netrw_banner = 0

" VIM-RIPGREP
nnoremap <leader>ps :Rg<SPACE>
if executable('rg')
    let g:rg_derive_root = 'true'
endif


"   _  _______   __  __  __   _   ___ ___ ___ _  _  ___ ___ 
"  | |/ / __\ \ / / |  \/  | /_\ | _ \ _ \_ _| \| |/ __/ __|
"  | ' <| _| \ V /  | |\/| |/ _ \|  _/  _/| || .` | (_ \__ \
"  |_|\_\___| |_|   |_|  |_/_/ \_\_| |_| |___|_|\_|\___|___/
" 
" BUFFERS
" Allow to move between buffers more easily
nnoremap <S-A-h> :wincmd h<CR>
nnoremap <S-A-j> :wincmd j<CR>
nnoremap <S-A-k> :wincmd k<CR>
nnoremap <S-A-l> :wincmd l<CR>
nnoremap <S-A-Left> :wincmd h<CR>
nnoremap <S-A-Down> :wincmd j<CR>
nnoremap <S-A-Up> :wincmd k<CR>
nnoremap <S-A-Right> :wincmd l<CR>
" Show the filetree in a new buffer
nnoremap <leader>pv :wincmd v<bar> :Ex<bar> :vertical resize 30<CR>
" Close active buffer
nnoremap <C-w> :q<CR>

" CLIPBOARD
" Allow to use ctrl-c and ctrl-v for copy and paste actions
nmap <c-c> "+y
vmap <c-c> "+y
nmap <c-v> "+p
inoremap <c-v> <c-r>+
cnoremap <c-v> <c-r>+
" Insert original character without triggering things like auto-pairs
inoremap <c-r> <c-v>

" LINE COMMENTS
" Swap line into comments (OS dependendent)
if has('win32')
  nmap <C-/> :Commentary<CR>
  vmap <C-/> :Commentary<CR>
else
  nmap <c>/ :Commentary<CR>
  vmap <c>/ :Commentary<CR>
endif

" LINE MOVE
" Move the actual line up
nnoremap <S-Up> :m-2<CR>
vnoremap <S-Up> <Esc>:m-2<CR>
nnoremap <S-k> :m-2<CR>
vnoremap <S-k> <Esc>:m-2<CR>
" Move the actual line down
nnoremap <S-Down> :m+<CR>
vnoremap <S-Down> <Esc>:m+<CR>
nnoremap <S-j> :m+<CR>
vnoremap <S-j> <Esc>:m+<CR>

" NAVIGATION
" Go to the start of the file
" TODO: add mapping
" Go to the beggining of the line
nnoremap <S-H> 0
vnoremap <S-H> 0
" Go to the end of the line
nnoremap <S-L> $l
vnoremap <S-L> $l
" Go to end of file
nnoremap <S-e> :$<CR> $l

" MINIMAP
" Show minimap
nnoremap <Leader>mm g:minimap_show<CR
" Close minimap
nnoremap <Leader>mc g:minimap_close<CR>

" SEARCH
" Turn off highlightning until the next search
nnoremap <leader>hh <cmd>noh<cr>

" TERMINAL
" TODO: search what is this about
" vim-powered terminal in split window
map <Leader>t :term ++close<cr>
tmap <Leader>t <c-w>:term ++close<cr>

" VIMRC
" In order to open my VIMRC In a split window only if the current buffer isn't really empty
let vimrc=expand('<sfile>:p')
nnoremap ,vu :source <C-R>=vimrc<CR><CR>
nnoremap ,ve :call <sid>OpenVimrc()<cr>




" TODO: investigar para que son los siguientes comandos
" Navigate the complete menu items like CTRL+n / CTRL+p would.
inoremap <expr> <Down> pumvisible() ? "<C-n>" :"<Down>"
inoremap <expr> <Up> pumvisible() ? "<C-p>" : "<Up>"

" Select the complete menu item like CTRL+y would.
inoremap <expr> <Right> pumvisible() ? "<C-y>" : "<Right>"
inoremap <expr> <CR> pumvisible() ? "<C-y>" :"<CR>"

" Cancel the complete menu item like CTRL+e would.
inoremap <expr> <Left> pumvisible() ? "<C-e>" : "<Left>"

" File Navigation
" Go to the last edited file in buffer
nnoremap gb :e#<CR>


"   ___ _   _ _  _  ___ _____ ___ ___  _  _ ___ 
"  | __| | | | \| |/ __|_   _|_ _/ _ \| \| / __|
"  | _|| |_| | .` | (__  | |  | | (_) | .` \__ \
"  |_|  \___/|_|\_|\___| |_| |___\___/|_|\_|___/
" 
" Edit the VIMRC file in place
function! s:OpenVimrc()
  if (0==strlen(bufname('%'))) && (1==line('$')) && (0==strlen(getline('$')))
    exe "e ".g:vimrc
  else
    exe "sp ".g:vimrc
  endif
endfunction

" TODO: Revisar esta funcion nuevamente
" https://www.reddit.com/r/neovim/comments/ev7w8u/possible_to_configure_cocnvim_to_autoaccept_fill/
" coc.nvim to auto-accept / fill on <tab> when a single choice exists
" function! s:tab_completion()
"   let info = complete_info(['pum_visible', 'items'])

"   if info.pum_visible
"     if len(info.items) <= 1
"       return "\<C-y>"
"     else
"       return "\<C-n>"
"     endif
"   endif

"   return "\<C-g>u\<TAB>"
" endfunction

" inoremap <silent><expr> <TAB> <SID>tab_completion()
" inoremap <silent><expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>


" Set the theme
colorscheme palenight


