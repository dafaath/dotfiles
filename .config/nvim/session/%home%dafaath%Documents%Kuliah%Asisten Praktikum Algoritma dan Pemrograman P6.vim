let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Documents/Kuliah/Asisten\ Praktikum\ Algoritma\ dan\ Pemrograman\ P6
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +29 ~/Documents/Kuliah/Asisten\ Praktikum\ Algoritma\ dan\ Pemrograman\ P6/Pertemuan\ 14/1.c
badd +1 ~/Documents/Kuliah/Asisten\ Praktikum\ Algoritma\ dan\ Pemrograman\ P6/Pertemuan\ 14/1.txt
badd +16 ~/Documents/Kuliah/Asisten\ Praktikum\ Algoritma\ dan\ Pemrograman\ P6/Pertemuan\ 13/2.c
badd +61 ~/Documents/Kuliah/Asisten\ Praktikum\ Algoritma\ dan\ Pemrograman\ P6/Pertemuan\ 14/2.c
badd +1 ~/Documents/Kuliah/Asisten\ Praktikum\ Algoritma\ dan\ Pemrograman\ P6/Pertemuan\ 14/2.txt
badd +61 ~/Documents/Kuliah/Asisten\ Praktikum\ Algoritma\ dan\ Pemrograman\ P6/Pertemuan\ 14/3.c
argglobal
%argdel
$argadd .
edit ~/Documents/Kuliah/Asisten\ Praktikum\ Algoritma\ dan\ Pemrograman\ P6/Pertemuan\ 14/2.c
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
balt ~/Documents/Kuliah/Asisten\ Praktikum\ Algoritma\ dan\ Pemrograman\ P6/Pertemuan\ 14/3.c
let s:l = 61 - ((10 * winheight(0) + 8) / 17)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 61
normal! 0
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
