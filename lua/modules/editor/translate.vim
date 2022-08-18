" set translator proxy url
let g:translator_proxy_url = 'socks5://127.0.0.1:7891'
let g:translator_window_type = 'preview'
" Display translation in a window
nmap <silent> gt <Plug>TranslateW
vmap <silent> gt <Plug>TranslateWV
" Text highlight of translator window
hi def link TranslatorQuery             Identifier
hi def link TranslatorDelimiter         WarningMsg
hi def link TranslatorExplain           ModeMsg
