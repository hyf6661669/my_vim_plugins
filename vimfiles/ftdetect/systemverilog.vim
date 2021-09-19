"Author: Nachum Kanovsky
"Email: nkanovsky yahoo com
"Version: 1.9

augroup filetypedetect
	au! BufNewFile,BufRead *.v,*.vh,*.vp,*.sv,*.svi,*.svh,*.svp,*.sva setfiletype systemverilog
augroup END
