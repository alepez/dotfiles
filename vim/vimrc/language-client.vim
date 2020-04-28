let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
    \ 'cpp': ['clangd'],
    \ 'haskell': ['hie-wrapper', '--lsp'],
    \ }
let g:LanguageClient_loggingLevel = 'INFO'
let g:LanguageClient_virtualTextPrefix = ''
let g:LanguageClient_loggingFile =  expand('~/.local/share/nvim/LanguageClient.log')
let g:LanguageClient_serverStderr = expand('~/.local/share/nvim/LanguageServer.log')

let g:LanguageClient_autoStart = 1

set cmdheight=2 " Required by echodot
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'signature'

function SetLSPShortcuts()
  nnoremap <F1> :call LanguageClient#textDocument_hover()<CR>
  nnoremap <F2> :call LanguageClient#textDocument_rename()<CR>
  " TODO Not yet implemented
  " nnoremap <F4> :call LanguageClient#textDocument_switchSourceHeader()<CR>
  nnoremap <F5> :call LanguageClient_contextMenu()<CR>

  nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>

  nnoremap <leader>af :call LanguageClient#textDocument_formatting()<CR>
  nnoremap <leader>yt :call LanguageClient#textDocument_typeDefinition()<CR>
  nnoremap <leader>yr :call LanguageClient#textDocument_references()<CR>
  nnoremap <leader>ya :call LanguageClient_workspace_applyEdit()<CR>
  nnoremap <leader>yc :call LanguageClient#textDocument_completion()<CR>
  nnoremap <leader>ys :call LanguageClient_textDocument_documentSymbol()<CR>
endfunction()

augroup LSP
  autocmd!
  autocmd FileType cpp,c,rust,haskell call SetLSPShortcuts()
augroup END

highlight LSCError ctermbg=none cterm=underline
highlight LSCWarning ctermbg=none cterm=underline
highlight LSCInfo ctermbg=none cterm=underline
highlight link LSCErrorSign GruvboxRedSign
highlight link LSCWarningSign GruvboxYellowSign
highlight link LSCInfoSign GruvboxBlueSign

let diagnosticsDisplaySettings={
  \       '1': {
  \           'name': 'Error',
  \           'texthl': 'LSCError',
  \           'signText': '✖',
  \           'signTexthl': 'LSCErrorSign',
  \       },
  \       '2': {
  \           'name': 'Warning',
  \           'texthl': 'LSCWarning',
  \           'signText': '⚠',
  \           'signTexthl': 'LSCWarningSign',
  \       },
  \       '3': {
  \           'name': 'Information',
  \           'texthl': 'LSCInfo',
  \           'signText': 'ℹ',
  \           'signTexthl': 'LSCInfoSign',
  \       },
  \       '4': {
  \           'name': 'Hint',
  \           'texthl': 'LSCInfo',
  \           'signText': '➤',
  \           'signTexthl': 'LSCInfoSign',
  \       },
  \  }

let g:LanguageClient_diagnosticsDisplay=diagnosticsDisplaySettings
