" My neovim configuration!
"
" --- Plugins with vim-plug plugin manager
"
" Plugins will be downloaded under the specified directory.

call plug#begin('~/.config/nvim/plugged')
" Declare the list of plugins.
Plug 'tpope/vim-surround' " Surround text easily.
Plug 'godlygeek/tabular' " allign text
Plug 'plasticboy/vim-markdown' " Automatically fold using tabular in md
Plug 'flazz/vim-colorschemes' " Huge set of colorschemes
Plug 'sickill/vim-monokai'
Plug 'tpope/vim-sensible' "Defaults
Plug 'joshdick/onedark.vim' "Theme
Plug 'altercation/vim-colors-solarized' "Theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'zanglg/nova.vim' "Theme
Plug 'jiangmiao/auto-pairs' "Insert brackets in pairs
Plug 'tpope/vim-commentary' "Comments with gc command
Plug 'tpope/vim-sleuth' "Automatically change tab settings based on file
Plug 'junegunn/limelight.vim' "For writing in vim
Plug 'junegunn/goyo.vim' "For writing in vim
Plug 'sickill/vim-pasta' "Context aware pasting
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter' "Gitgutter
Plug 'rakr/vim-one' " Theme
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Autocompletion
Plug 'Shougo/neco-syntax' " Completion for many languages
Plug 'zchee/deoplete-clang' " Completion for C language family
Plug 'eagletmt/neco-ghc' " Completion for Haskell
Plug 'wokalski/autocomplete-flow' " Completion for JavaScript
Plug 'Shougo/neosnippet' " Snippet suppurt with deoplete
Plug 'Shougo/neosnippet-snippets' " Default snippets
Plug 'ryanoasis/vim-devicons'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'zchee/deoplete-jedi' " Python Completion, must always be at the end
call plug#end()

" --- End of plugins config

" General Config
set mouse=a
set ignorecase "for case insensitive searching
set smartcase  "when search contains casing search is case sensitive
set hlsearch   "Highlight search results
set incsearch  "Start search before hitting enter
set magic      "for regex
set noerrorbells "No auditive cue when mistakes
set visualbell   "Set visual cue when mistakes
set tabstop=4
set softtabstop=0
set noexpandtab
set shiftwidth=4
set textwidth=80
" Appearance
set number relativenumber "Hybrid numbering
set wrap                  "Turn on line wrapping
set wrapmargin=8          "8 characters to the right when wrapping
set linebreak             "set soft wrapping
set autoindent            "autoindent new lines
set laststatus=2          "show status line all the time
set so=7                  "7 lines to cursor when moving vertical
set wildmenu              "command line completion
set showcmd               "show incomplete commands
set colorcolumn=80
set cursorline
"set noshowmode           "dont show which mode disabled for Powerline
set wildmode=list:longest "complete filenames like shell
set showmatch             "show matching brackets
"show invisibles
set list
set listchars=tab:▶\ ,trail:⋅,extends:❯,precedes:❮
set showbreak=↪
" setting clipboard
set clipboard=unnamed
vnoremap <C-c> "*y
" Set terminal mode
tnoremap <Esc> <C-\><C-n>

"Terminal colors and cholorscheme
set encoding=utf-8
syntax on
set t_Co=256
set background=dark
let g:solarized_termtrans = 1
set termguicolors
colorscheme gruvbox
highlight Comment cterm=italic
highlight htmlArg cterm=italic
highlight xmlAttrib cterm=italic
highlight Type cterm=italic
" highlight Normal ctermbg=none
"Config airline
let g:airline_powerline_symbols='unicode'
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
" enable airline tabline
let g:airline#extensions#tabline#enabled = 1
" only show tabline if tabs are being used (more than 1 tab open)
let g:airline#extensions#tabline#tab_min_count = 2
" do not show open buffers in tabline
let g:airline#extensions#tabline#show_buffers = 0
" Show errors in airline from ALE
let g:airline#extensions#ale#enabled = 1
" Fix limelight for other themes
let g:limelight_conceal_ctermfg = 240
" Map Nerdtree keystroke
map <C-n> :NERDTreeToggle<CR>
" Set Nerdtree symbols
let NERDTreeShowHidden=0
let g:NERDTreeIndicatorMapCustom = {
\ "Modified"  : "✹",
\ "Staged"	  : "✚",
\ "Untracked" : "✭",
\ "Renamed"   : "➜",
\ "Unmerged"  : "═",
\ "Deleted"   : "✖",
\ "Dirty"	  : "✗",
\ "Clean"	  : "✔︎",
\ 'Ignored'   : '☒',
\ "Unknown"   : "?"
\ }

"Config snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Configure autocompletion with deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:neosnippet#enable_completed_snippet = 1
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
set ts=2 sw=2
let g:indent_guide_start_level = 2
" Change highlight in solarized
highlight Visual cterm=NONE ctermbg=0 ctermfg=NONE guibg=Grey40
