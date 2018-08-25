if !has("python3") == 1
    echo "Python 3 support is required. You can test this in Vim by calling ':has(\"Python3\")'"
endif

" Root path to this file:
let g:vim_sql_script_path = expand('<sfile>:p:h')

if has("win32")
    let g:vim_sql_script_path = g:vim_sql_script_path. "\\hello\\"
else
    let g:vim_sql_script_path = g:vim_sql_script_path. "/hello/"
endif

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

" let g:vim_sql_script_path = g:vim_sql_script_path. "\\hello\\"

if has("win32")
    exec "py3file ". g:vim_sql_script_path. "\\hello.py"
else
    exec "py3file ". g:vim_sql_script_path. "/hello.py"
endif

" Add commands we can keybind, to make life easier:
" command! -range VimSqlServers py3 vimsql.show_database_list() 
" command! -range VimSqlExecuteBuffer py3 vimsql.execute_buffer() 
" map <leader>wq :VimSqlServer<cr>
" map <leader>ww :VimSqlExecuteBuffer<cr>

