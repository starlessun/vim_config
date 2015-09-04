" required by pathogen
syntax on
filetype plugin indent on

" required by minibuffer
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModeSelTarget = 1

if exists('colorcolumn') || (v:version >= 730)
    set colorcolumn=76
endif

set shiftwidth=4
set tabstop=4
set expandtab

call pathogen#infect()
"helptags .
Helptags

"auto tab complete
function! My_TabComplete()
    let substr = strpart(getline('.'), col('.'))
    let result = match(substr, '\w\+\(\.\w*\)$')
    if (result!=-1)
        return "\<C-X>\<C-U>"
    else
        return "\<tab>"
    endfunction
    autocmd FileType java inoremap <tab> <C-R>=My_TabComplete()<CR>

    " map tl to toggle tag list
    noremap tl :TlistToggle<CR>
    " set the tag list toggle automatically gain focus
    let Tlist_GainFocus_On_ToggleOpen = 1

    " map dl to toggle NERDlist 
    noremap dl :NERDTreeToggle<CR>

    " open tag in new tab
    nnoremap <C-]> <C-w><C-]><C-w>T

    set background=dark
    " folding
    " set foldmethod=syntax
    "

    set encoding=utf-8
    set termencoding=utf-8
    set fileencodings=utf-8,gb18030,cp936,big5,euc-jp,latin1

    " pydiction settings
    " need to modify if importing to a new environment
    let g:pydiction_location = '/home/yichao/.vim/bundle/pydiction/complete-dict'

    " enable auto format
    au BufWrite * :Autoformat
