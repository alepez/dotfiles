let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
    \ 'cpp': ['clangd'],
    \ }
let g:LanguageClient_loggingLevel = 'INFO'
let g:LanguageClient_virtualTextPrefix = ''
let g:LanguageClient_loggingFile =  expand('~/.local/share/nvim/LanguageClient.log')
let g:LanguageClient_serverStderr = expand('~/.local/share/nvim/LanguageServer.log')

let g:LanguageClient_autoStart = 1

set cmdheight=2 " Required by echodot
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'signature'
