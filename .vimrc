" Ensures that a whole bunch of nice Vim-specific features are on by default.
set nocompatible

"" Bundles, via https://github.com/gmarik/vundle
""
"" You should run
""
""    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
"" 
"" to get Vundle then
""
""    vim +BundleInstall +qall
""
"" initially and whenever a packages is added.

filetype off 
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'

Bundle 'mileszs/ack.vim'
Bundle 'ctrlp.vim'

Bundle 'UltiSnips'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'

Bundle 'Zenburn'
Bundle 'Lokaltog/vim-powerline'

Bundle 'vimwiki'

Bundle 'jnwhiteh/vim-golang'

Bundle 'flazz/vim-colorschemes'

filetype plugin indent on
"" End of Bundles

" Use 256 colors + Zenburn + syntax highlighting.
set t_Co=256
colorscheme zenburn
syntax enable

"" Indents and spacing:
" Expand tabs to 4 spaces. (Ctrl-V<Tab> inserts a real tab.)
set et ts=4 sw=4
" Disables C indenting, because I find that it gets in the way.
set nocindent

" Turn on line numbering in files.
set number

" Disable the menu bar and toolbar (the one with icons) for GVim.
set guioptions=

" Use Inconsolata in GVim.
set guifont=Inconsolata\ 10

" Powerline:
set laststatus=2

" Use a comma as the prefix for buffer-local mappings.
let maplocalleader = ","

" Vertical line at 80 cols. (238 = #444444)
" set cc=80
" hi ColorColumn guibg=#3c3c3c ctermbg=238

" Highlight the current line.
set cursorline
hi CursorLine guibg=#3c3c3c

" Prefix wrapped lines with '> '
set showbreak=>\ 

" Put .swp files in ~/tmp
set directory=~/tmp,.
set backupdir=~/tmp,.

" Enable incremental search w/smartcase
set incsearch ignorecase smartcase

" For syntax highlighting
autocmd BufEnter * :syntax sync fromstart

" Auto-completion
set ofu=syntaxcomplete#Complete

" I mistype import, a lot
iabbrev improt import

" Tmux
" <leader>r will re-run the last command in pane #1
nnoremap <leader>r :silent execute "!tmux send-keys -t 1 Up && tmux send-keys -t 1 Enter"<CR>

" Filetypes
autocmd FileType html setlocal sw=2 ts=2 et
autocmd FileType javascript setlocal sw=2 ts=2 et
autocmd FileType python setlocal sw=4 ts=4 et
autocmd FileType python,html,javascript autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType go setlocal sw=4 ts=4 noet

"" Ctrl-P
" Files to ignore in Ctrl-P
set wildignore=*.pyc,*.tar,*.tar.*,*.log*
" Bind C-\ to tag view
nnoremap <C-\> :CtrlPTag<CR>
let g:ctrlp_working_path_mode = 'ra'

" Set the window title in tmux
let &titlestring = expand("%:t")
if &term == "screen"
    set t_ts=]2;
    set t_fs=\\
endif
set title
