" Map leader key
let mapleader = "<"

syntax on
syntax enable
filetype plugin indent on

set title
set hidden
set mouse=v
set noswapfile
set noshowmatch

" True color support
set termguicolors

" Coc
set signcolumn=yes
set updatetime=300

set nolazyredraw
set conceallevel=2

set number relativenumber
set whichwrap+=<,>,h,l,[,]

" Basic search setting
set smartcase
set ignorecase
set shortmess-=S
set inccommand=nosplit

" Tab and Indent configuration
set expandtab
set tabstop=4
set shiftwidth=4

" Command line and status
set showcmd
set noshowmode
set cmdheight=1

" Highlight yanked
hi HighlightedyankRegion cterm=reverse gui=reverse
let g:highlightedyank_highlight_duration = 1000

" Set backup with meaningful backup name
set backup
set writebackup
set backupdir=~/.config/nvim/backup/
au BufWritePre * let &bex = '@' . strftime("%F.%H:%M")

let g:rooter_patterns = ['.git', '.svn', 'package.json', '!node_modules', '.idea', '.obsidian', 'pyproject.toml']

" Keybindings
nnoremap __ :split<CR>
nnoremap t :tabnew<CR>
nnoremap Z :vsplit<CR>
" Redo with U instead of <C-R>
noremap U <C-R>
" Jump backwards with <C-l> as we do forward with <C-o>
nnoremap <C-l> <C-i>
" Open folds with <space>
nnoremap <Space> zA
" Scroll with <C-n> as we do with <C-e>
nnoremap <C-n> <C-e>
" Use <shift-*> then <C-R> to replace
nnoremap <c-r> :%s/<C-R>///g<Left><Left>
" Toggle search highlighting
nnoremap <silent> <A-m> :set hlsearch!<CR>
" Use double-Esc to clear the search buffer
nnoremap <silent> <Esc><Esc> :let @/ = ""<CR>
" Remove trailing whitespace at end of lines
nnoremap <A-t> :%s/\s\+$//e<CR>
" Reize window vertically and horizontally
nnoremap <leader><Right> :vertical resize +5<CR>
nnoremap <leader><Left> :vertical resize -5<CR>
nnoremap <leader><Down> :resize +5<CR>
nnoremap <leader><Up> :resize -5<CR>
" Move lines up and down on shift+arrows
inoremap <S-Down> <Esc>:m .+1<CR>==gi
inoremap <S-Up>   <Esc>:m .-2<CR>==gi
nnoremap <S-Down> :m .+1<CR>==
nnoremap <S-Up>   :m .-2<CR>==
vnoremap <S-Down> :m '>+1<CR>gv=gv
vnoremap <S-Up>   :m '<-2<CR>gv=gv

" Define telescope keymappings
nnoremap <expr> ff ':Telescope find_files cwd='.FindRootDirectory().' hidden=true/<cr>'
nnoremap <expr> fg ':Telescope live_grep  cwd='.FindRootDirectory().'/<cr>'
nnoremap <expr> ft ':Telescope buffers    cwd='.FindRootDirectory().'/<cr>'
