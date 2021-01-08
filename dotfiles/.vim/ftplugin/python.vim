let pipenv_venv_path = system('pipenv --venv')
if shell_error == 0
	let venv_path = substitute(pipenv_venv_path, '\n', '', '')
	let g:ycm_python_binary_path = venv_path . '/bin/python'
else
	let g:ycm_python_binary_path = 'python'
endif

let python_highlight_all=1
let g:SimpylFold_docstring_preview=1

autocmd BufWritePost *.py execute ':Black'
autocmd BufWritePost *.py execute ':Isort'
autocmd BufWritePost *.py execute ':Mypy'

