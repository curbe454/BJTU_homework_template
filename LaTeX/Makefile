# Use Windows + neovim + vimtex,
# continuous mode compiling won't exit automatcally when exit neovim,
# and this lead it to a zombie process.
# I must kill it in process explorer or PowerToys.

# *vim
# augroup vimtex_autocompile
#   autocmd!
#   autocmd User VimtexEventCompileStarted let g:vimtex_compiling_continuous = 1
#   autocmd User VimtexEventCompileStopped let g:vimtex_compiling_continuous = 0
#   autocmd VimLeavePre * if exists('g:vimtex_compiling_continuous') && g:vimtex_compiling | VimtexStop | endif
# augroup END

.PHONY: clean

clean:
	-rm *.fls *.xwm
	-rm *synctex(busy)
