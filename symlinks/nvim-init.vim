" Plugins (vim-plug)

call plug#begin('~/.local/share/nvim/plugged')

" It's the sensible thing to do
Plug 'tpope/vim-sensible'

" Helps writing comments
Plug 'tpope/vim-commentary'

" Allows to repeat not only basic vim commands
Plug 'tpope/vim-repeat'

" Utilities to deal with parenthesis, brackets and other open/close character
" pairs
Plug 'tpope/vim-surround'

" Make tmux and vim terminal work better together
Plug 'tmux-plugins/vim-tmux-focus-events'
" Seamless pane navigation between vim and tmux
Plug 'christoomey/vim-tmux-navigator'

" Nicer status bar
Plug 'vim-airline/vim-airline'

" Awesome fuzzy finder.
" I mainly use it to find files and do text searches
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim', { 'do': { -> fzf#install() } }

" Extens fzf files list with latest updated files
Plug 'tweekmonster/fzf-filemru'

" Provides commands to deal with git
Plug 'tpope/vim-fugitive'

" Adds a vertical line that indicates which lines have been modified
Plug 'airblade/vim-gitgutter'

" Displays indentation symbols
Plug 'Yggdroot/indentLine'

" Adds useful commands like `:Delete`, `:Rename`, etc.
Plug 'tpope/vim-eunuch'

" Insert/delete pairs automatically
Plug 'jiangmiao/auto-pairs'

" Utility mappings (<]-Space> to prepend a line, etc.)
Plug 'tpope/vim-unimpaired'

" Exchange motion. Great to substitute text.
Plug 'tommcdo/vim-exchange'

" Utility to format list of arguments
Plug 'foosoft/vim-argwrap'

" Support for multiple cursors
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" Navigate through the file like a pro
Plug 'easymotion/vim-easymotion'

" To navigate/create `alternate` files (e.g. go from source to test files)
Plug 'tpope/vim-projectionist'

" Better `f` and `t`
Plug 'rhysd/clever-f.vim'

" Save & restore coding sessions
" To start nvim with an existing session: `nvim -S <path/to/session.vim>`
" Steps to having a session per tmuxinator project:
" 1) Open nvim
" 2) Run `:Obsession ~/.config/nvim/sessions/<project_name>.vim`
" 3) Edit tmuxinator .yml file and replace `nvim` for
"    `nvim -S ~/.config/nvim/sessions/<project_name>.vim`
" 4) Celebrate! From now on, vim-obsession will autosave the session and when
"    starting via tmuxinator the session will be restored.
Plug 'tpope/vim-obsession'

" Zoom in/out panes
Plug 'troydm/zoomwintab.vim'

" Enlarge the focused pane
Plug 'roman/golden-ratio'

" Smooth scrolling
Plug 'psliwka/vim-smoothie'

" Dims the panes that aren't active, making more visible the active pane
Plug 'blueyed/vim-diminactive'

" Remember the last place I was when I re-open a file
Plug 'farmergreg/vim-lastplace'

" Typescript syntax
Plug 'leafgarland/typescript-vim'

" IDE like features (code completion, find usages, etc.)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Fixes conceal issue between `Yggdroot/indentLine` and `json.vim` syntax
Plug 'elzr/vim-json'

" Favourite theme
Plug 'chriskempson/base16-vim'

call plug#end()

set autoread

" Because "\" is too far away
let mapleader = " "

" Time in ms when user (me) is considered to be idle
" (it triggers CursorHold and other events)
set updatetime=500

colorscheme base16-phd

set termguicolors

set tabstop=2
set shiftwidth=2
set expandtab
set splitright
set splitbelow
" Too annonying and so far it hasn't been useful
set noswapfile
set clipboard=unnamed

set colorcolumn=80
set cursorline
set noshowmode

" Trim whitespace on save
fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()

" Recognize syntax for .tsx files
augroup SyntaxSettings
    autocmd!
    autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
augroup END

"
" Vim Tmux Navigator settings
"
" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1

"
" IndentLine settings
"
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

"
" ArgWrap settings
"
let g:argwrap_padded_braces = '{'
let g:argwrap_tail_comma = 1
nnoremap <silent> <leader>a :ArgWrap<CR>

"
" ZoomWinTab settings
"
nnoremap <silent> <leader>z: :ZoomWinTabToggle<CR>

"
" Vim Airline settings
"
let g:airline_mode_map = {
  \ '__' : '-',
  \ 'c'  : 'C',
  \ 'i'  : 'I',
  \ 'ic' : 'I',
  \ 'ix' : 'I',
  \ 'n'  : 'N',
  \ 'ni' : 'N',
  \ 'no' : 'N',
  \ 'R'  : 'R',
  \ 'Rv' : 'R',
  \ 's'  : 'S',
  \ 'S'  : 'S',
  \ '^S' : 'S',
  \ 't'  : 'T',
  \ 'v'  : 'v',
  \ 'V'  : 'V',
  \ '^V' : 'V',
  \ }

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
" Trying to figure out if I need all these extra characters.
" Removed for now because they take space I need for the file name.
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''
let g:airline#parts#ffenc#skip_expected_string = 'utf-8[unix]'
" It looks like the above trick doesn't work for 'filetype' part
let g:airline#parts#ffenc#skip_expected_string = 'typescript'
let g:airline#extensions#branch#format = 1
" Hide filetype section
let g:airline_section_x = ''
let g:airline_section_b = ''
" Remove percentage and column information to get extra space for the filename
let g:airline_section_z=airline#section#create(['linenr', 'maxlinenr'])
" It will display "Z" message on airline when the tab is zoomed in
let g:airline#extensions#zoomwintab#enabled = 1
let g:airline#extensions#zoomwintab#status_zoom_in = 'Z'

"
" Fzf
"
" More info about how to customize FZF UI:
" https://github.com/junegunn/fzf/blob/master/README-VIM.md
let g:fzf_layout = { 'down': '~80%' }

function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
      \ 'source': s:list_buffers(),
      \ 'sink*': { lines -> s:delete_buffers(lines) },
      \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
      \ }))

nnoremap <silent> <C-p> :FilesMru --tiebreak=end<CR>
nnoremap <silent> <C-c> :Commands<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>w :Windows<CR>
nnoremap <silent> <leader>l :Lines<CR>

"
" CoC
"
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>fr <Plug>(coc-references)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>so :CocList outline<CR>

"
" vim-json settings
"
let g:vim_json_syntax_conceal = 0

"
" Global key bindings
"

" Save on Ctrl+s
nmap <C-s> :w<cr>
imap <C-s> <esc>:w<cr>
