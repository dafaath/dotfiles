let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Project/Startup-Campus/frontend
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +17 ~/Project/Startup-Campus/frontend/next.config.js
badd +112 pages/index.js
badd +43 ~/Project/Startup-Campus/frontend/components/LandingPage/Section6.js
badd +21 ~/Project/Startup-Campus/frontend/components/LandingPage/Section7.js
badd +31 ~/Project/Startup-Campus/frontend/components/LandingPage/Section5.js
badd +1 ~/Project/Startup-Campus/frontend/content/benefit.js
badd +25 ~/Project/Startup-Campus/frontend/components/MySwiper.js
argglobal
%argdel
$argadd .
edit pages/index.js
argglobal
balt ~/Project/Startup-Campus/frontend/components/LandingPage/Section6.js
let s:l = 112 - ((20 * winheight(0) + 19) / 39)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 112
normal! 010|
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
