" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" change the mapleader from \ to ,
let mapleader = ","

" Automatically reload .vimrc when changing
autocmd! bufwritepost .vimrc source! %

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

"--------------------------------------------------
" Character encoding
set termencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8

"--------------------------------------------------
" Base settings
set nocompatible          " We're running Vim, not Vi!
syntax on                 " syntax highlingting
set backspace=2           " backspace del all
set history=500           " history of commands
set autoread              " Set to auto read when a file is changed from the outside
set wmh=0                 " minimal number of lines used for any window
set nu                    " show numbers
set showcmd               " show typed commands in bottom right corcer

"---------------------------------------------------
" Indentation and tab related
set ai                       " auto indent
set si                       " smart indent
set tabstop=4                " Force tabs to be displayed/expanded to 4 spaces (instead of default 8).
"set expandtab                " Turn Tab keypresses into spaces. You can still insert real Tabs as [Ctrl]-V [Tab].
set shiftwidth=4             " When auto-indenting, indent by this much. (Use spaces/tabs per expandtab.)
retab                        " Change all the existing tab characters to match the current tab settings

"set some file type specific settings
autocmd filetype python set expandtab

"---------------------------------------------------
" Folding stuff
nnoremap <silent> <Space> @=(foldlevel('.')?'za':'l')<CR>
vnoremap <Space> zf

"--------------------------------------------------
" reformat status line
set statusline=%<%f\ (%{&encoding})\ %h%m%r%=%-14.(%l,%c%V%)\ %P         " reformat status line
set laststatus=2          " always show status line

"--------------------------------------------------
" enable filetype
filetype plugin on        " file type based syntax highlight
filetype indent on

"--------------------------------------------------
" toggling between paste mode
set pastetoggle=<F2>

"--------------------------------------------------
" Searching
set sm                       " jump to matches during entering the pattern
set hls                      " highlight all matches
set incsearch                " and also during entering the pattern

"--------------------------------------------------
" wrap
set whichwrap+=<,>,[,]    " where wrap long lines
set textwidth=2048        " text witdth
"set nowrap               " do not wrap lines

"--------------------------------------------------
" Easy mulyiple window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"---------------------------------------------------
" File name completion - Wild menu options
set wildmenu                            " show menu (bash-like) on tab
set wildignore=*.o,*~,tags,.svn,vendor  " ignor on wildmenu
set wildmode=longest:full

"--------------------------------------------------
function! RunPhpcs()
    let l:filename=@%
    let l:phpcs_output=system('phpcs --report=csv '.l:filename)
"    echo l:phpcs_output
    let l:phpcs_list=split(l:phpcs_output, "\n")
    unlet l:phpcs_list[0]
    cexpr l:phpcs_list
    cwindow
endfunction

set errorformat+=\"%f\"\\,%l\\,%c\\,%t%*[a-zA-Z]\\,\"%m\"
command! Phpcs execute RunPhpcs()

"--------------------------------------------------
" Word completion on <TAB>
"function! InsertTabWrapper(direction)
"  let col = col('.') - 1
"  if !col || getline('.')[col - 1] !~ '\k'
"    return "\<tab>"
"  elseif "backward" == a:direction
"    return "\<c-p>"
"  else
"    return "\<c-n>"
"  endif
"endfunction
"inoremap <Tab> <C-R>=InsertTabWrapper("backward")<CR>
"inoremap <S-Tab> <C-R>=InsertTabWrapper("forward")<CR>

"--------------------------------------------------
function! <SID>StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
nmap <silent> <Leader><space> :call <SID>StripTrailingWhitespace()<CR>

"--------------------------------------------------
" Open in last edit place
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

"--------------------------------------------------
" Syntax coloring (~/.vim/colors/)
" available colors: `ls /usr/share/vim/vimXX/colors`
set t_Co=256
colorscheme mustang
"colorscheme default

"---------------------------------------------------
" Ctags options
set tags=./tags,tags;
nmap <Leader>c :!(cd %:p:h;ctags -f tags -h ".php" -R --exclude="\.svn" --totals=yes --tag-relative=yes --fields=+afkst --PHP-kinds=+cf-v)&

"---------------------------------------------------
" Taglist options on F8
nnoremap <silent> <F8> :Tlist<CR>

" tags list on right window
let Tlist_Use_Right_Window = 1
" set the names of flags
let tlist_php_settings = 'php;c:class;f:function;d:constant'
" make tlist pane active when opened
let Tlist_GainFocus_On_ToggleOpen = 1
" width of window
let Tlist_WinWidth = 40
" close tlist when a selection is made
"let Tlist_Close_On_Select = 1
" Show tags for the current buffer only
let Tlist_Show_One_File = 1

"---------------------------------------------------
" LustyJuggler
let g:LustyJugglerSuppressRubyWarning = 1

"---------------------------------------------------
" Grep options on F3
let Grep_Skip_Dirs = '.svn'
let Grep_Default_Filelist = '*.php *.inc *.js *.rb'
let Grep_Default_Options = '-i'
nnoremap <silent> <F3> :Rgrep<CR>

"---------------------------------------------------
" Command-t
let g:CommandTMatchWindowReverse=1  " show best match at the bottom
let g:CommandTMaxFiles=50000 

"---------------------------------------------------
" TaskList
map <leader>td <Plug>TaskList

"---------------------------------------------------
" snipMate
let g:snips_author = 'Nuhaa All Bakry <nuhaa.bakry@my.experian.com>'
let g:snips_copyright = 'Experian Hitwise'

"--------------------------------------------------
" Shortcuts

" jump to function in a new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" comment/uncoment a block
map <Leader>/ :s/^/\/\//<CR>
map <Leader>\ :s/^\/\///<CR>

nmap <Leader>w :w<CR>
nmap <Leader>q :q!<CR>

imap ;; <Esc>