" Ctrlp

let g:ctrlp_map = '<C-p>' " If it's called ctrlp...
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_by_filename = 0 " 0: use full path, 1: use filename only
let g:ctrlp_switch_buffer = 'E' " Jump to the file with <CR>
let g:ctrlp_root_markers = ['.ycm_extra_conf.py', '.git', '.svn', '.rootdir'] " ctrlp uses .git, .svn, ... as project root. Use these markers too
let g:ctrlp_open_multiple_files = 'i' " open selected files in hidden buffers

" Use ag, the silver searcher, for ctrlp search.
" Note: wildignore doesn't apply with this option, you need .agignore file
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  " fix for neovim: cd to current directory and launch ag to omit relative
  " path from results.
  let g:ctrlp_user_command = '( cd %s && ag -l --nocolor -g "" )'
endif
