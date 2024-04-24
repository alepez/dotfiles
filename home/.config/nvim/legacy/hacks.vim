" Highlight yanked text
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
augroup END


" turn off search highlight and close quickfix
fu! SmartRefresh()
  " Close quickfix window
  ccl
  " Close location window
  lcl
  " Check for file changes
  checktime
  " Redraw
  redraw!
endf

" Ignore these files
set wildignore+=*/tmp/*
set wildignore+=*.so,*.o,*.d,*.gcda,*.gcno
set wildignore+=*.zip,*.tar,*.tar.gz,*.tar.bz2,*.tgz
set wildignore+=*/__pycache__
set wildignore+=*.pyc,*.pyo
set wildignore+=*.jsc,*.qmlc,*.jsc.*,*.qmlc.*
set wildignore+=*/node_modules

if executable("rg")
  set grepprg=rg\ --vimgrep\ --smart-case\ --hidden\ -g\ '!.git/'
  set grepformat=%f:%l:%c:%m
endif

