augroup session
  autocmd!
  autocmd VimLeave * mksession! ~/.vim/session.vim
  autocmd VimEnter * call timer_start(1000, 'LoadSession') 
augroup END

function! LoadSession(timer_id)
  if filereadable(expand("~/.vim/session.vim"))
    source ~/.vim/session.vim
  endif
endfunction
