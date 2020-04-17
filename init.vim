" My neovim configuration!
"
" --- Plugins with vim-plug plugin manager
"
" Plugins will be downloaded under the specified directory.

call plug#begin('~/.config/nvim/plugged')
" Declare the list of plugins.
Plug 'ervandew/supertab'
Plug 'honza/vim-snippets'
Plug 'lervag/vimtex'
Plug 'sirver/UltiSnips'
Plug 'ncm2/ncm2-ultisnips'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'gaalcaras/ncm-R'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'jalvesaq/Nvim-R'
Plug 'tmhedberg/SimpylFold'
Plug 'mbbill/undotree'
Plug 'ycm-core/YouCompleteMe'
Plug 'vim-utils/vim-man'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-surround' " Surround text easily.
Plug 'godlygeek/tabular' " allign text
Plug 'plasticboy/vim-markdown' " Automatically fold using tabular in md
Plug 'tpope/vim-sensible' "Defaults
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs' "Insert brackets in pairs
Plug 'tpope/vim-commentary' "Comments with gc command
Plug 'tpope/vim-sleuth' "Automatically change tab settings based on file
Plug 'junegunn/limelight.vim' "For writing in vim
Plug 'junegunn/goyo.vim' "For writing in vim
Plug 'sickill/vim-pasta' "Context aware pasting
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter' "Gitgutter
Plug 'ryanoasis/vim-devicons'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
call plug#end()

" --- End of plugins config

" General Config

let mapleader = " "
let maplocalleader = ","
let g:ctrlp_use_caching = 0

" set foldmethod=indent
set foldlevel=99
set undodir=~/.config/nvim/undodir
set undofile
set mouse=a
set ignorecase "for case insensitive searching
set smartcase  "when search contains casing search is case sensitive
set hlsearch   "Highlight search results
set incsearch  "Start search before hitting enter
set magic      "for regex
set noerrorbells "No auditive cue when mistakes
set visualbell   "Set visual cue when mistakes
set tabstop=2
set softtabstop=2
set expandtab
set autoindent
set shiftwidth=2
set textwidth=80
set number relativenumber "Hybrid numbering
set nowrap                  "Turn on line wrapping
set autoindent            "autoindent new lines
set laststatus=2          "show status line all the time
set so=5                  "7 lines to cursor when moving vertical
set wildmenu              "command line completion
set showcmd               "show incomplete commands
set colorcolumn=80
set cursorline
set wildmode=list:longest "complete filenames like shell
set showmatch             "show matching brackets
set list
set listchars=tab:▶\ ,trail:⋅,extends:❯,precedes:❮
set showbreak=↪
set clipboard=unnamedplus
vnoremap <C-c> "*y
tnoremap <Esc> <C-\><C-n>
set encoding=utf-8
syntax on
set t_Co=256
set background=dark
set termguicolors
colorscheme gruvbox
highlight Comment cterm=italic
highlight htmlArg cterm=italic
highlight xmlAttrib cterm=italic
highlight Type cterm=italic

let g:airline_powerline_symbols='unicode'
let g:airline_powerline_fonts = 1
let g:airline_theme='luna'
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#ale#enabled = 1
let g:limelight_conceal_ctermfg = 240
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=0
let g:NERDTreeIndicatorMapCustom = {
\ "Modified"  : "✹",
\ "Staged"	  : "✚",
\ "Untracked" : "✭",
\ "Renamed"   : "➜",
\ "Unmerged"  : "═",
\ "Deleted"   : "✖",
\ "Dirty"	  : "✗",
\ "Clean"	  : "✔",
\ 'Ignored'   : '☒',
\ "Unknown"   : "?"
\ }

let g:indent_guide_start_level = 2
highlight Visual cterm=NONE ctermbg=0 ctermfg=NONE guibg=Grey40

let g:SimpylFold_docstring_preview=1

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>
nnoremap <silent> <leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>gf :YcmCompleter FixIt<CR>
nnoremap <silent> <leader>gr :YcmCompleter GoToReferences<CR>
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_python_binary_path = '/home/jonathan/miniconda3/envs/pepsico/bin/python'
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
nnoremap <leader>f za
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

