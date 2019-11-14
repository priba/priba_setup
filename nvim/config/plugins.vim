" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.config/priba_setup/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } "completion
Plug 'kamykn/spelunker.vim' "spell check
Plug 'zchee/deoplete-jedi' "completion
Plug 'joshdick/onedark.vim' "colortheme
Plug 'vim-airline/vim-airline' "airline bar
Plug 'tmhedberg/SimpylFold' "easy fold
Plug 'neomake/neomake' "multithreading
Plug 'python-mode/python-mode', {'branch':'develop'} "project-like behaviour for python
Plug 'kien/ctrlp.vim' "search for files
Plug 'tpope/vim-commentary' "easy comment lines
Plug 'takac/vim-hardtime' "remove bad habits
Plug 'dyng/ctrlsf.vim' "grep on steroids
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
call plug#end()

" *** Neomake ***
" When reading a buffer (after 1s), and when writing (no delay).
call neomake#configure#automake('nw', 500)
let g:neomake_open_list = 0

let g:neomake_python_pylint_maker = {
    \ 'exe': 'pylint',
    \ 'args': [
        \ '--output-format=text',
        \ '--msg-template="{path}:{line}:{column}:{C}: [{symbol}] {msg} [{msg_id}]"',
        \ '--reports=no',
        \ '--extension-pkg-whitelist=cv2',
        \ '--generated-members=numpy.*, torch.*',
        \ '--disable=C0111, C0103',
        \ '--max-line-length=88',
        \ '--jobs=0'
    \ ],
    \ 'errorformat':
        \ '%A%f:%l:%c:%t: %m,' .
        \ '%A%f:%l: %m,' .
        \ '%A%f:(%l): %m,' .
        \ '%-Z%p^%.%#,' .
        \ '%-G%.%#',
    \ 'output_stream': 'stdout',
    \ 'postprocess': [
    \   function('neomake#postprocess#generic_length'),
    \   function('neomake#makers#ft#python#PylintEntryProcess'),
    \ ]}

let g:neomake_python_enabled_makers = ['pylint']


" *** crtlp.vim ***
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=__pycache__/*
set wildignore+=.git/*
set wildignore+=*.jpg
set wildignore+=*.png
set wildignore+=*.jpeg

" *** Pymode ***
let g:pymode_python = 'python3'
let g:pymode_rope_regenerate_on_write = 0
let g:pymode_rope_lookup_project = 1
let g:pymode_rope = 1
let g:pymode_options = 0
let g:pymode_breakpoint = 0
let g:pymode_syntax_space_errors = 0
let g:pymode_lint_on_write = 0
let g:pymode_rope_completion = 0

" *** Deoplete ***
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete=1
let g:deoplete#sources#jedi#enable_typeinfo = 0 "gotta go fast

" *** Airline ***
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme = 'onedark'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1

" *** SimpylFold ***
let g:SimpylFold_docstring_preview = 1

" *** Spelunker ***
let g:spelunker_check_type = 2
set updatetime=1000

" *** HardTime ***
let g:hardtime_default_on = 1
let g:list_of_normal_keys = ["h", "j", "k", "l", "-", "+"]
let g:list_of_visual_keys = ["h", "j", "k", "l", "-", "+"]
let g:list_of_insert_keys = []
let g:hardtime_timeout = 1000
let g:hardtime_showmsg = 1
let g:hardtime_allow_different_key = 1

" *** CtrlSF ***
vmap <C-f>f <Plug>CtrlSFVwordPath
nmap <C-f>p <Plug>CtrlSFPwordPath
nmap <C-F>f <Plug>CtrlSFPrompt
nnoremap <C-f>t :CtrlSFToggle<CR>

" *** NerdTree ***
map <C-n> :NERDTreeToggle<CR>

let g:NERDTreeWinSize=30

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
