
" Author:  Cornelius  <cornelius.howl@gmail.com>
" Date: 一 12/21 20:29:23 2009
" Script type: plugin

" filetype completion hacks
fun! FiletypeCompletion(lead,cmd,pos)
  let list = glob(expand('$VIMRUNTIME/syntax'). '/*.vim')
  let items = split(list,"\n")
  cal map(items,'matchstr(v:val,''\w\+\(.vim$\)\@='')')
  cal filter(items,"v:val =~ '^" . a:lead . "'")
  return items
endf
com! -complete=customlist,FiletypeCompletion -nargs=1 SetFiletype :setf <args>
cabbr sft SetFiletype



