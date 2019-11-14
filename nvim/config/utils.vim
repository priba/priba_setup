command! Clean execute "!rm ~/.config/nvim/backup/*"

"Better navigating through completion list
function! Omnnipopup(action)
    if pumvisible()
        if a:action == 'tab'
            return "\<C-N>"
        elseif a:action == "s-tab"
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <expr><silent><tab> (pumvisible() ? '<C-R>=Omnnipopup("tab")<CR>':'<tab>')
inoremap <expr><silent><s-tab> (pumvisible() ? '<C-R>=Omnnipopup("s-tab")<CR>':'<s-tab>')
