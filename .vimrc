call plug#begin('~/.vim/plug')

"Plug 'mileszs/ack.vim'
"Plug 'rking/ag.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kana/vim-arpeggio'
Plug 'jiangmiao/auto-pairs'
Plug 'bling/vim-bufferline'
"Plug 'itchyny/calendar.vim'
"Plug 'gorodinskiy/vim-coloresque'
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-commentary'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/vim-easy-align'
Plug 'easymotion/vim-easymotion'
"Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'lilydjwg/fcitx.vim'
"Plug 'junegunn/vim-fnr'
Plug 'drmikehenry/vim-fontsize'
Plug 'tpope/vim-fugitive'
Plug 'haya14busa/incsearch.vim'
"Plug 'eagletmt/ghcmod-vim'
"Plug 'junegunn/goyo.vim'
"Plug 'Twinside/vim-haskellFold'
"Plug 'inkarkat/vim-ingo-library'
"Plug 'Valloric/MatchTagAlways'
"Plug 'eagletmt/neco-ghc'
"Plug 'Shougo/neocomplete.vim'
Plug 'osyo-manga/vim-over'
"Plug 'frigoeu/psc-ide-vim'
Plug 'junegunn/vim-pseudocl'
"Plug 'raichoo/purescript-vim'
Plug 'tpope/vim-repeat'
"Plug 'xolox/vim-session'
"Plug 'inkarkat/vim-SpellCheck'
"Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
"Plug 'godlygeek/tabular'
"Plug 'majutsushi/tagbar'
"Plug 'itchyny/thumbnail.vim'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-unimpaired'
"Plug 'Shougo/unite.vim'
Plug 'xolox/vim-misc'
"Plug 'Shougo/vimproc', {'do': 'make'}
"Plug 'Shougo/vimshell'

call plug#end()


filetype plugin indent on
syntax on


set nocompatible
set clipboard+=unnamed

set foldmethod=syntax
set foldnestmax=3
set foldlevel=10
set foldenable

set autowrite
set noruler
set timeoutlen=500
set hidden

set tabstop=2
set shiftwidth=2
set softtabstop=2
set backspace=2
set expandtab

set virtualedit=all

set cursorline
set showcmd
set number
set relativenumber

set smartindent
set autoindent

set noshowmode
set laststatus=2
set linespace=0

set nowrap
set textwidth=80
" set colorcolumn=80
set formatoptions=qrn1

set mousehide
set dictionary+=/home/v/.vim/dict.txt

set history=1000
set listchars=tab:›\ ,trail:·
set list

set smarttab
set incsearch
set ignorecase smartcase
set hlsearch

set scrolloff=5
set sidescrolloff=10
set sidescroll=1

set matchtime=2
set showmatch

set splitbelow

set wildmode=list:longest
set wildmenu
set wildignore=*.o,*~,*.hi,*.bin,*.cfg,*.pdf,*.ps,*.swp,*.class

set spelllang=en_us,hun-de-DE-frami,cjk
set complete+=kspell


iab lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
iab llorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.


let mapleader = ','

nnoremap \q gqip
nnoremap \ft Vatzf
nnoremap \J mqgg=G`qzz

nmap \t :tabnew<cr>
nmap \h :w<cr>
nmap \c :wq<cr>
nmap \x :q!<cr>
nmap \v "+gP
nmap \/ :noh<cr>
nmap \\ gcc
vmap \\ gc

nmap Y y$
nmap ,n :NERDTreeToggle<cr>
nmap ,m :TagbarOpenAutoClose<cr>
nmap <F8> :TagbarToggle<cr>

nmap ,f :set guifont=Source\ Code\ Pro\ Regular\ 

nmap ,h <c-w>h
nmap ,j <c-w>j
nmap ,k <c-w>k
nmap ,l <c-w>l

nmap ,ev :tabedit $MYVIMRC<cr>
nmap <return> :CtrlPMRUFiles<cr>
nmap <c-b> :CtrlPBuffer<cr>
nmap <space> :

imap <m-o> <esc>o
imap <c-space> <c-x><c-o>

cmap ww %!sudo tee % > /dev/null


augroup VimStartup
    autocmd!
    autocmd VimEnter * sil! iunmap <c-k>
augroup end

let g:UltiSnipsExpandTrigger        = '<s-space>'
let g:UltiSnipsJumpBackwardTrigger  = '<c-b>'


let g:session_autosave  = 'no'
let g:bufferline_echo   = 0


let g:ctrlp_match_window        = 'bottom,order:btt,min:0,max:20,results:20'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_show_hidden         = 1


" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


let g:EasyMotion_do_mapping = 1
let g:EasyMotion_smartcase  = 1
let g:EasyMotion_use_migemo = 1
nmap s <Plug>(easymotion-overwin-f)
map \j <Plug>(easymotion-j)
map \k <Plug>(easymotion-k)


map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)


let g:syntastic_aggregate_errors      = 1
let g:syntastic_auto_jump             = 0
let g:syntastic_check_on_open         = 0
let g:syntastic_check_on_wq           = 0
let g:syntastic_enable_signs          = 1
let g:syntastic_enable_balloons       = 0
let g:syntastic_echo_current_error    = 1
let g:syntastic_enable_highlighting   = 0
let g:syntastic_quiet_messages        = { 'level': 'warnings' }

let g:syntastic_error_symbol          = '・'  "〉
let g:syntastic_style_error_symbol    = '・'
let g:syntastic_warning_symbol        = '・'
let g:syntastic_style_warning_symbol  = '・'
" let g:syntastic_error_symbol          = '　'  "〉
" let g:syntastic_style_error_symbol    = '　'
" let g:syntastic_warning_symbol        = '　'
" let g:syntastic_style_warning_symbol  = '　'

let g:syntastic_stl_format            = '%F '
let g:syntastic_c_compiler_options    = '-ansi -pedantic -Wall -Wextra'
let g:syntastic_haskell_checkers      = ['ghc_mod', 'hlint']


let g:ghcmod_open_quickfix_function = 'GhcModCtrlP'

function! GhcModCtrlP()
  CtrlPQuickfix
endfunction


let g:airline_theme     = 'bubblegum'
let g:airline_left_sep  = ''
let g:airline_right_sep = ''
let g:airline_section_y = '%{strlen(&fenc) > 0 ? &fenc . " " : ""}%{strlen(&ff) > 0 ? &ff : ""}'
let g:airline_section_z = '%3l %3c %3p'
let g:airline_mode_map  = {
      \ 'n' : 'ノ',
      \ 'i' : 'イ',
      \ 'R' : 'リ',
      \ 'v' : 'ビ',
      \ 'V' : '行',
      \ '': '矩',
      \ 's' : 'セ',
      \ 'S' : '行',
      \ '': '矩',
      \ 'c' : 'コ',
      \ }


" let g:languagetool_jar  = '/usr/share/java/languagetool/languagetool-commandline.jar'
" let g:calendar_google_calendar = 0
" let g:ycm_semantic_triggers = { 'haskell': ['.'] }


autocmd FileType cabal      setlocal commentstring=--\ %s
autocmd FileType conkyrc    setlocal commentstring=#\ %s
autocmd FileType xdefaults  setlocal commentstring=!\ %s
autocmd FileType java       setlocal sw=4
autocmd FileType scala      setlocal sw=4
autocmd FileType html       setlocal sw=4

autocmd FileType haskell    call Haskell()
function Haskell()
  setlocal sw=4
  setlocal omnifunc=necoghc#omnifunc
  nmap \/ :noh<cr>:GhcModTypeClear<cr>
endfunction


set background=dark
colorscheme bubblegum_nb

if has ("gui_running")
  " function! IsDay(dawn, dusk)
  "   return index (map (range (a:dawn, a:dusk), 'string (v:val)'), strftime ("%H")) >= 0
  " endfunction

  " if IsDay (6, 15)
  "   set background=light
  "   colorscheme solarized
  "   let g:airline_theme = 'solarized'
  " endif

  let size = system ("omo
    \ 'kaze::echo -n 10'
    \ 'sora::echo -n 10'")

  let &guifont     = "Source\ Code\ Pro\ Regular\ "   . 14
  let &guifontwide = "Noto\ Sans\ CJK\ JP\ " . 14

  set guicursor=a:blinkon0
  set guioptions-=m
  set guioptions-=T
  set guioptions-=r
  set guioptions-=L
endif

" if &term =~ '256color'
"   " disable Background Color Erase (BCE) so that color schemes
"   " render properly when inside 256-color tmux and GNU screen.
"   " see also https://sunaku.github./vim-256color-bce.html
"   set t_ut=
" endif

" let $PATH = $PATH . ':' . expand ("~/ご")
