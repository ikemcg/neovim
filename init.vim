set encoding=utf-8

" start vim-plug
call plug#begin('~/.config/nvim/plugged')

" let Vundle manage Vundle, required
Plug 'altercation/vim-colors-solarized'   " Soraized theme
Plug 'tpope/vim-surround'                 " Mappings for editing surroundings
Plug 'tpope/vim-repeat'                   " Extend . command support for vim-surroung
Plug 'dense-analysis/ale'                 " Asynchronous Lint Engine
Plug 'scrooloose/nerdtree'                " Filesystem tree explorer
Plug 'scrooloose/nerdcommenter'           " Commenting powers
Plug 'majutsushi/tagbar'                  " Class outline viewer based on ctags
Plug 'godlygeek/tabular'                  " Text alignment
Plug 'mattn/emmet-vim'                    " Expands abbreviations
Plug 'maksimr/vim-jsbeautify'             " Beautify JS and CSS
Plug 'honza/vim-snippets'                 " Snippet repository for UltiSnips
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'editorconfig/editorconfig-vim'      " Set editing prefs based on .editorconfig file
Plug 'pangloss/vim-javascript'            " Improved Javascript indentation and syntax support
Plug 'mxw/vim-jsx'                        " JSX syntax highlighting
Plug 'heavenshell/vim-jsdoc'              " Generate JSDoc
Plug 'tobyS/vmustache'
Plug 'tobyS/pdv'                          " PHP Documentor
Plug 'groenewege/vim-less'                " Indentation and highlighing for LESS files
Plug 'tpope/vim-markdown'                 " Syntax for Markdown
Plug 'jwalton512/vim-blade'               " Syntax for Blade files
Plug 'posva/vim-vue'                      " Syntax for Vue.js components
Plug 'junegunn/fzf'                       " Fuzzy finder for vim
Plug 'junegunn/fzf.vim'                   " Fuzzy finder for vim
Plug 'vim-airline/vim-airline'            " Lean & mean status/tabline
Plug 'vim-airline/vim-airline-themes'     " Airline themes
Plug 'hashivim/vim-terraform'             " Indentation and highlighting for Terraform files 

call plug#end()
" end vim-plug

" colors
syntax on
set background=dark
colorscheme solarized

" Turn on at 120 cols
highlight ColorColumn guibg=#002b36
let &colorcolumn=join(range(121,999),",")

filetype plugin indent on       " turn on filetype, filetype plugins, and filetype indent
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set hlsearch            " highlight search matches
set incsearch           " incremental search
set showmode            " always show what mode we're in
set nobackup            " do not keep a backup file, use versions instead
set history=1000        " a more reasonable history
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set incsearch           " do incremental searching
set nofoldenable        " disable folding
set laststatus=2        " airline plugin requires that we always show the status line, hidden except for splits othewise
set wildmenu            " tab completion for opening files
set autowrite           " save on buffer switch
set clipboard=unnamed   " enables clipboard sharing in osx
set tabstop=2           " a tab is four spaces
set shiftwidth=2        " spaces to use for autoindenting
set softtabstop=2       " when hitting <BS>, pretend like a tab is removed event if spaces
set expandtab           " expands tabs into spaces, no tab chars
set wrapscan
set autoindent          " always set autoindenting on
set smartindent         " syntax adaptive autoindenting, does not obviate the need for autoindent
set number              " always show line numbers
set signcolumn=number   " show line number in sign column
set ignorecase          " ignore case when searching
set smartcase           " turns off ignore case when pattern contains uppercase letter
set visualbell          " don't beep
set noerrorbells        " don't beep
set title               " display file name in osx terminal's top window bar
set hidden              " allows files in buffers to remain open; also, required for vim-coc
set scrolloff=3         " maintains 3 lines below cursor as cursor moved outside viewport

highlight clear SignColumn

" `a returns to line and column marked by ma, and so is more usefull.  make it
" easier to use, by swapping with '
nnoremap ' `
nnoremap ` '

" toggle spelling with F5
"imap <F5> <C-o>:setlocal spell! spelllang=en_us<CR>
"inoremap <F5> <C-\><C-O>:setlocal spelllang=en_us spell! spell?<CR>
imap <Leader>s <C-o>:setlocal spell! spelllang=en_us<CR>
nmap <Leader>s :setlocal spell! spelllang=en_us<CR>

" set leader to comma
let mapleader = ","
let g:mapleader = ","

" keep comma as repeat find character reverse
noremap \ ,

" fast saves
nmap <leader>w :w!<cr>

"Auto change directory to match current file ,cd
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

set pastetoggle=<leader>p

" jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal g'\"" | endif
endif

" open splits
nmap vs :vsplit<cr>
nmap sp :split<cr>

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
      \ | wincmd p | diffthis
endif

" simplify moving between windows
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
noremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>

" source .vimrc
:nnoremap <Leader>sv :so $MYVIMRC<CR>
:nnoremap <leader>ev :e $MYVIMRC<CR>

" source worklog
:nnoremap <Leader>wl :e ~/code/worklog<cr>

" delete buffer without removing split
nmap <silent> <leader>d :bp\|bd #<CR>

"---------------------------- plugins ----------------------------"

" don't enable jsx highlighting on js files, require jsx
let g:jsx_ext_required = 1

" trigger emmet with ,,
let g:user_emmet_leader_key=','

" airline
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1

" ALE - Asynchronous Linting Engine
let g:ale_disable_lsp = 1  " Leave lsp to coc.nvim
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

:nnoremap <Leader>af :ALEFix<CR>
nmap <silent> <leader>aj :ALENext<cr>
nmap <silent> <leader>ak :ALEPrevious<cr>

nnoremap <c-l> :bnext<CR>
nnoremap <c-h> :bprevious<CR>

" pluggin mappings
nnoremap <silent> <Leader>n :NERDTreeToggle<CR>
nnoremap <silent> <Leader>t :TagbarToggle<CR>

" mappings for tabularize
nmap <Leader>tb= :Tabularize /=<CR>
vmap <Leader>tb= :Tabularize /=<CR>
nmap <Leader>tb> :Tabularize /=><CR>
vmap <Leader>tb> :Tabularize /=><CR>
nmap <Leader>tb: :Tabularize /:\zs<CR>
vmap <Leader>tb: :Tabularize /:\zs<CR>

" SQL Formatter
nmap <leader>sf <Plug>SQLU_Formatter<CR>
vmap <leader>sf <Plug>SQLU_Formatter<CR>

" JsDoc
map <Leader>jd :JsDoc<cr>

" Fzf
noremap <silent> <c-p> :Files<CR>

" search recusively upwards for tags file
set tags=tags;/

" -----------------------------------------------------------------------------
" Start Coc config
" -----------------------------------------------------------------------------

set updatetime=300  " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays
set shortmess+=c    " Don't pass messages to |ins-completion-menu|.

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

let g:coc_snippet_next = '<tab>'


" -----------------------------------------------------------------------------
" End Coc config
" -----------------------------------------------------------------------------
