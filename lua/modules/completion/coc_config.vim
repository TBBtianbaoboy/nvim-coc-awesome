set encoding=utf-8
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
            inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>rf <Plug>(coc-refactor)

" Formatting selected code.
xmap <leader>af <Plug>(coc-format-selected)
nmap <Leader>af <Plug>(coc-format)

" coc-translator
nmap gt <Plug>(coc-translator-p)
vmap gt <Plug>(coc-translator-pv)

nmap <silent> gd <Plug>(coc-definition)zz
nmap <silent> gr <Plug>(coc-references)zz
nmap <silent> gy <Plug>(coc-type-definition)zz
nmap <silent> gi <Plug>(coc-implementation)zz
nmap <silent> g[ <Plug>(coc-diagnostic-prev)
nmap <silent> g] <Plug>(coc-diagnostic-next)
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Map function and class text objects
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

"=================coc-lists========================= 
"== insert : <c-j> and <c-k> ->move
"== normal : i -> insert new words, <c-o> -> close insert
"@key 1: Manage extensions. 
nnoremap <silent><nowait> <space>le  :<C-u>CocList extensions<cr>
"@key 2: Keymapping for grep word under cursor with interactive mode (command rg need)
nnoremap <silent> <Leader>cd :exe 'CocList -I --input='.expand('<cword>').' grep'<CR>
nnoremap <silent> <space>cf :exe 'CocList -I --normal --input='.expand('<cword>').' words'<CR>

"=================coc-git========================= 
"@key 3: coc-list with coc-list for git status
nnoremap <silent> <C-g>  :<C-u>CocList --normal gstatus<CR>

"=================coc-yank========================= 
"@key 4: keep yank history.use effectively.
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

"=================coc-highlight========================= 
"@key 5: highlight hex
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

"=================coc-explorer========================= 
"@key 5: directory tree
nmap <space>e <Cmd>CocCommand explorer<CR>

let g:coc_global_extensions = [
      \'coc-lists',
      \'coc-actions',
      \'coc-pairs',
      \'coc-highlight',
      \'coc-lightbulb',
      \
      \'coc-prettier',
      \'coc-markdownlint',
      \'coc-html',
      \'coc-tsserver',
      \'coc-css',
      \'coc-eslint',
      \'coc-emmet',
      \'coc-vetur',
      \
      \'coc-clangd',
      \'coc-lua',
      \'coc-go',
      \'coc-pyright',
      \'coc-rust-analyzer',
      \
      \'coc-db',
      \'coc-json',
      \'coc-yaml',
      \'coc-git',
      \'coc-translator',
      \'coc-yank',
      \'coc-word',
      \'coc-emoji',
      \'coc-tabnine',
      \'coc-gitignore',
      \'coc-cmake'
      \]
