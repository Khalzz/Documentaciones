# nvimConfig

~~~
let g:deoplete#enable_at_startup = 1
let g:OmniSharp_server_stdio = 1
set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax enable
set showcmd
set ruler
set encoding=utf-8
set showmatch
set sw=2
set relativenumber
set laststatus=2
set updatetime=250

call plug#begin('~/.vim/plugged')

" Temas
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'

" IDE
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'zchee/deoplete-jedi'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neco-syntax'
Plug 'sheerun/vim-polyglot'
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'OmniSharp/omnisharp-vim'
Plug 'mattn/emmet-vim'

call plug#end()

colorscheme gruvbox
let g:gruvbox_contrast_dark = "hard"
let g:airline_contrast_dark = "hard"
let g:indentLine_fileTypeExclude = ['text', 'sh', 'help', 'terminal']
let g:indentLine_bufNameExclude = ['NERD_tree.*', 'term:.*']
let mapleader=" "
let g:deoplete#enable_at_startup = 1
let g:user_emmet_leader_key=','

"atajos de teclado de pluggins
nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>nt :NERDTreeFind<CR>

"atajos de teclado
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>pp "*p<CR>
nmap <Leader>yy "*yy<CR>



augroup deopleteCompleteDoneAu
  autocmd!
  autocmd CompleteDone * silent! pclose!
augroup END

nnoremap <F5> :vsplit term://python3 %<cr>
~~~
this is my vim/nvim config in the ~/.vimrc file uwu
