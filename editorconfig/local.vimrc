" quartz-warriors/local.vimrc
" License: The Unlicense {
" This is free and unencumbered software released into the public domain.
"
" Anyone is free to copy, modify, publish, use, compile, sell, or
" distribute this software, either in source code form or as a compiled
" binary, for any purpose, commercial or non-commercial, and by any
" means.
"
" In jurisdictions that recognize copyright laws, the author or authors
" of this software dedicate any and all copyright interest in the
" software to the public domain. We make this dedication for the benefit
" of the public at large and to the detriment of our heirs and
" successors. We intend this dedication to be an overt act of
" relinquishment in perpetuity of all present and future rights to this
" software under copyright law.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
" EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
" MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
" IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
" OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
" ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
" OTHER DEALINGS IN THE SOFTWARE.
"
" For more information, please refer to <http://unlicense.org/>
" }

if ! get(s:, 'defined', 0) " -- prevents the function from being redefined after compiling
	function! BuildDebug()
		let s:defined = 1

		wall
		cd ./debug

		if exists(':Make')
			:Make -j 3 all check
			cd ..
		else
			make -j 3 all check
			vert botright copen
			vert resize +100
		endif

	endfunction
endif

nnoremap <leader>bd :call BuildDebug()<CR>

set path+=src

" vim: set ts=4 sts=4 noet sw=4 foldmethod=marker foldmarker={,} :
