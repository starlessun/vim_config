" required by pathogen
syntax on
filetype plugin indent on

" required by minibuffer
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModeSelTarget = 1

set colorcolumn=76
set shiftwidth=4
set expandtab

call pathogen#infect()
helptags -R .

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
nnoremap <C-]> :tabnew %<CR>g<C-]>
vnoremap <C-]> <ESC>:tabnew %<CR>gvg<C-]>

" folding
" set foldmethod=syntax
