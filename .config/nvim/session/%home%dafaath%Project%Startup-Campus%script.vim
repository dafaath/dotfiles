let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Project/Startup-Campus/script
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +83 ~/Project/Startup-Campus/script/send_email/main.py
badd +1 ~/Project/Startup-Campus/script/send_email/mail.py
badd +2 ~/Project/Startup-Campus/script/send_email/.env
argglobal
%argdel
$argadd .
edit ~/Project/Startup-Campus/script/send_email/mail.py
argglobal
balt ~/Project/Startup-Campus/script/send_email/main.py
let s:l = 273 - ((19 * winheight(0) + 15) / 31)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 273
let s:c = 69 - ((33 * winwidth(0) + 80) / 160)
if s:c > 0
  exe 'normal! ' . s:c . '|zs' . 69 . '|'
else
  normal! 069|
endif
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
