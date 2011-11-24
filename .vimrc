let mapleader = ","

" Automatically reload .vimrc when changing
autocmd! bufwritepost .vimrc source! %

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
filetype plugin on        " file type based syntax highliht
filetype indent on

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

"---------------------------------------------------
" File name completion - Wild menu options
set wildmenu                   " show menu (bash-like) on tab
set wildignore=*.o,*~          " ignor on wildmenu
set wildmode=longest:full

"--------------------------------------------------
" Word completion on <TAB>
function! InsertTabWrapper(direction)
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  elseif "backward" == a:direction
    return "\<c-p>"
  else
    return "\<c-n>"
  endif
endfunction;
inoremap <Tab> <C-R>=InsertTabWrapper("backward")<CR>
inoremap <S-Tab> <C-R>=InsertTabWrapper("forward")<CR>


"--------------------------------------------------
" File tree optins on F7
nnoremap <silent> <F7> :NERDTreeToggle<CR>
let NERDTreeMapActivateNode=''

"--------------------------------------------------
" Open in last edit place
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

"--------------------------------------------------
" Syntax coloring (~/.vim/colors/)
" available colors: `ls /usr/share/vim/vim??/colors`
"colorscheme soruby
colorscheme default

"---------------------------------------------------
" Ctags options
set tags=./tags,tags;
nmap <Leader>t :!(cd %:p:h;ctags -f tags -h ".php" -R --exclude="\.svn" --totals=yes --tag-relative=yes --fields=+afkst --PHP-kinds=+cf-v)&

"---------------------------------------------------
" Taglist options on F8
nnoremap <silent> <F8> :Tlist<CR>

" tags list on right window
let Tlist_Use_Right_Window = 1
"" set the names of flags
let tlist_php_settings = 'php;c:class;f:function;d:constant'
" close all folds except for current file
let Tlist_File_Fold_Auto_Close = 1
" " make tlist pane active when opened
let Tlist_GainFocus_On_ToggleOpen = 1
" " width of window
let Tlist_WinWidth = 40
" " close tlist when a selection is made
"let Tlist_Close_On_Select = 1

"---------------------------------------------------
" Grep options on F3
let Grep_Skip_Dirs = '.svn'
let Grep_Default_Filelist = '*.php *.inc *.js *.ini'
let Grep_Default_Options = '-i'
nnoremap <silent> <F3> :Rgrep<CR>

"--------------------------------------------------
" Shortcuts
"
" comment/uncoment a block
map <Leader>/ :s/^/\/\//<CR>
map <Leader>\ :s/^\/\///<CR>

nmap <Leader>w :w<CR>
nmap <Leader>q :q!<CR>

imap ;; <Esc>

