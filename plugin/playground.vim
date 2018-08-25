if !has("python3") == 1
    echo "Python 3 support is required. You can test this in Vim by calling ':has(\"Python3\")'"
endif

let g:os_sep = "/"
if has("win32")
    let g:os_sep = "\\"
endif

" Root path to this file:
let g:vim_sql_script_path = expand('<sfile>:p:h')

" Set import path to include plugin directory.
py3 << py3eof
# import os
import sys
import vim

# # Add Vim script path to module path so we can actually load:
VIM_SQL_SCRIPT_PATH = vim.eval("g:vim_sql_script_path")

if VIM_SQL_SCRIPT_PATH not in sys.path:
    sys.path += [VIM_SQL_SCRIPT_PATH]

# vim.command("let g:vim_sql_script_path="+VIM_SQL_SCRIPT_PATH)
py3eof

exec "py3file " . g:vim_sql_script_path . g:os_sep . "hello" . g:os_sep . "hello.py"

" Add commands we can keybind, to make life easier:
" command! -range VimSqlServers py3 vimsql.show_database_list() 
" command! -range VimSqlExecuteBuffer py3 vimsql.execute_buffer() 
" map <leader>wq :VimSqlServer<cr>
" map <leader>ww :VimSqlExecuteBuffer<cr>

