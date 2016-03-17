au BufRead,BufNewFile /usr/local/etc/nginx/*,/etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif
