":so % to reload config from vim

runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

set nocompatible
set hidden
filetype plugin indent on " required
let mapleader=","

" set omnifunc=syntaxcomplete#Complete

" solarized
set t_Co=16 " some terminals seem to set this to 8, which breaks solarize
syntax enable
set background=dark
let g:solarized_visibility='high'
colorscheme solarized

" Tabs are eight columns wide. Each indentation level is one tab.
" :set tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
" Tabs are four columns wide. Each indentation level is one tab.
" :set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
" Each indentation level is four spaces. Tabs are not used.
" :set softtabstop=4 shiftwidth=4 expandtab

set tabstop=4 " how many columns a tab counts for. This is the only command that will affect how existing text displays
set shiftwidth=4 " how many columns text is indended with >> and << and cindent
set noexpandtab
set softtabstop=4
set cindent
" exhuberant ctags + tagbar
set tags=./tags
nnoremap <silent> <F9> :TagbarToggle<CR>

" cscope
if filereadable("cscope.out")
    cs add cscope.out
    " else add database pointed to by environment
 elseif $CSCOPE_DB != ""
     cs add $CSCOPE_DB
endif
set cscopetag " use :cstag for lookups, uses ctags and cscope databases

" disabled for powerline
" set statusline=%F\ %m%r\%h\%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L] 
set laststatus=2 " enable statusline
set encoding=utf-8
let g:Powerline_symbols = 'unicode'
let g:Powerline_colorscheme = 'solarized16_dark'

"set grepprg=ack-grep\ --cpp\ --cc\ --perl\ --python\ --make
set grepprg=ack-grep
:nmap <leader>g :grep -n <C-R>=expand("<cword>")<CR><CR>
:nmap <leader>G :grep <C-R>=expand("<cword>")<CR><CR>

" buftabs
nnoremap <C-n> :bprev<CR>
nnoremap <C-p> :bnext<CR>

" keystrokes
:nmap <Space> <PageDown>
:nmap <BS> <PageUp>
" allow <BkSpc> to delete line breaks, start of insertion, and indents
set backspace=eol,start,indent
" be able to scroll through opened files easily with ctrl+j/k
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l
" set cwd to current buffer path
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" when moving up/down, don't line-wrap 
:nmap j gj
:nmap k gk

noremap H ^
noremap L $
set ignorecase
set smartcase " honour case if uppercase character used
"set incsearch

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" might come in useful, reformatting code with weird tab/spacing
":nmap \t :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
":nmap \T :set expandtab tabstop=8 shiftwidth=8 softtabstop=4<CR>
":nmap \M :set noexpandtab tabstop=8 softtabstop=4 shiftwidth=4<CR>
":nmap \m :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>

:nmap <leader>l :setlocal number!<CR>
:nmap <leader>p :set paste!<CR>
:nmap <leader>n :NERDTreeToggle<CR>
:nmap <leader>b :CtrlPBuffer<CR>
let g:ctrlp_map = ',f'
let g:ctrlp_cmd = 'CtrlP'

" :cwindow to bring up quicfix window, navigation shortcuts below
":nmap <leader>e :botright cwindow<CR>
":nmap [q :cprev<CR>
":nmap ]q :cnext<CR>

" Syntastic
:nmap <leader>sc :SyntasticCheck<CR> :SyntasticToggleMode<CR>
:nmap <leader>se :Errors<CR>
:nmap [s :lprev<CR>
:nmap ]s :lnext<CR>
:nmap [S :lfirst<CR>
:nmap ]S :llast<CR>
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
let g:syntastic_always_populate_loc_list = 1

