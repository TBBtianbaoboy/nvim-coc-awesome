" Executive used when opening vista sidebar without specifying it. See all the avaliable executives via `:echo g:vista#executives`.
" I set this, because my executives is coc 
let g:vista_default_executive = 'coc'

" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
" let g:vista#renderer#icons = {
" \   "function": "\uf794",
" \   "variable": "\uf71b",
" \  }

" set sidebar width to the default open
let g:vista_sidebar_open_cmd = '40vsplit'

" set echo delay is 0
let g:vista_cursor_delay = 0

" set echo type is scrolling
let g:vista_echo_cursor_strategy = 'scroll'

" disable blinking after jump to the source line
let g:vista_blink = [0,0]
