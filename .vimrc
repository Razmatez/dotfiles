" Plugins

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'    					" I want sane defaults
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'morhetz/gruvbox'						
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'mxw/vim-jsx', {'for': 'javascript'}
Plug 'othree/javascript-libraries-syntax.vim', {'for': 'javascript'}
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tobyS/vmustache'
Plug 'SirVer/ultisnips'
Plug 'tobyS/pdv'
Plug 'StanAngeloff/php.vim'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'mattn/emmet-vim'
Plug 'jwalton512/vim-blade'
Plug 'Valloric/MatchTagAlways'

call plug#end()

set number
let mapleader = ','
set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4
set autowriteall
set noerrorbells visualbell t_vb=               			"No damn bells!
set complete=.,w,b,u 							"Set our desired autocompletion matching.
set noswapfile

"------------------- Look and Feel ---------------------"
colorscheme gruvbox
set t_CO=256								"Use 256 colors. This is useful for Terminal Vim.
set guifont=Fira\ Code:h15						"Set the default font family and size.
set macligatures
set guioptions-=e							"We don't want Gui tabs.
"set linespace=15   						        "Macvim-specific line-height.
set guioptions-=l                                                       "Disable Gui scrollbars.
set guioptions-=L
set guioptions-=r
set guioptions-=R

"We'll fake a custom left padding for each window.
hi LineNr guibg=bg
set foldcolumn=2
hi foldcolumn guibg=bg

"Get rid of ugly split borders.
hi vertsplit guifg=bg guibg=bg

"------------------- Split management ---------------------"
set splitbelow 								"Make splits default to below...
set splitright								"And to the right. This feels more natural.

"We'll set simpler mappings to switch between splits.
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

"------------------- Mappings ---------------------"
"Make it easy to edit the Vimrc file.
nmap <Leader>ev :tabedit $MYVIMRC<cr>
nmap <Leader>es :e ~/.vim/snippets/

"Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>

"Quickly browse to any tag/symbol in the project.
"Tip: run ctags -R to regenerated the index.
nmap <Leader>f :tag<space>

"Sort PHP use statements
"http://stackoverflow.com/questions/11531073/how-do-you-sort-a-range-of-lines-by-length
vmap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>

nmap <leader>ya :!yarn add 
nmap <leader>yr :!yarn remove 
map <F7> mzgg=G`z

"------------------- Plugins ---------------------"


"------------------- vim-jsx ---------------------"
let g:jsx_ext_required = 0


"------------------- javascript-libraries-syntax.vim ---------------------"
let g:used_javascript_libs = "jquery, underscore, react, requirejs, jasmine, vue"

"------------------- vim-airline ---------------------"
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:airline_powerline_fonts = 1

"------------------- CtrlP ---------------------"
nmap <leader>e :CtrlP<cr>
nmap <D-p> :CtrlP<cr>
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

"------------------- pdv ---------------------"
let g:pdv_template_dir = $HOME ."/.vim/plugged/pdv/templates_snip"
nnoremap <leader>d :call pdv#DocumentWithSnip()<CR>

"------------------- vim-php-namespace ---------------------"
function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>ex <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>ex :call PhpExpandClass()<CR>

function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>i <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>i :call PhpInsertUse()<CR>

"------------------- emmet-vim ---------------------"
"let g:user_emmet_expandabbr_key = '<tab>'

"/
"/ Ultisnips
"/
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"------------------- MatchTagAlways ---------------------"
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'blade': 1
    \}

