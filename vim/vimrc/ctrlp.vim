" Ctrlp

let g:ctrlp_map = '<C-p>' " If it's called ctrlp...
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_by_filename = 0 " 0: use full path, 1: use filename only
let g:ctrlp_switch_buffer = 'E' " Jump to the file with <CR>
let g:ctrlp_root_markers = ['.ycm_extra_conf.py', '.git', '.svn', '.rootdir'] " ctrlp uses .git, .svn, ... as project root. Use these markers too
let g:ctrlp_open_multiple_files = 'i' " open selected files in hidden buffers

" The Silver Searcher
" See https://robots.thoughtbot.com/faster-grepping-in-vim
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
