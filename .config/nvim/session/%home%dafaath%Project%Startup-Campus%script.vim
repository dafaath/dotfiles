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
badd +3 ~/Project/Startup-Campus/script/create_email_and_password.py
badd +36 ~/Project/Startup-Campus/script/export_firebase_db.js
badd +1 ~/Project/Startup-Campus/script/output.json
badd +151 ~/Project/Startup-Campus/script/artificial-intelligence.json
badd +197 ~/Project/Startup-Campus/script/data-science.json
badd +237 ~/Project/Startup-Campus/script/the-founder.json
badd +167 ~/Project/Startup-Campus/script/uiux-design.json
argglobal
%argdel
$argadd .
edit ~/Project/Startup-Campus/script/the-founder.json
argglobal
balt ~/Project/Startup-Campus/script/artificial-intelligence.json
let s:l = 16 - ((15 * winheight(0) + 14) / 29)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 16
normal! 027|
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
