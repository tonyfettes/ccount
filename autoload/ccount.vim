" Chinese charactor count
function! ccount#ChineseCount()
  let cmessage = execute('%s/[\u4E00-\u9FCC]//gn')
  let cc = split(cmessage, '[\n ]')[0]
  echo "Count of Chinese charasters is:" cc
endfunc

" By skywind3000
" https://www.zhihu.com/question/54118781/answer/137982087

function! ccount#ChineseCountRange() range
  let save = @z
  silent exec 'normal! gv"zy'
  let text = @z
  let @z = save
  silent exec 'normal! gv'
  for char in split(text, '\zs')
    if char2nr(char) >= 0x4E00 && char2nr(char) <= 0x9FCC
      let cc += 1
    endif
  endfor
  echo "Count of Chinese charasters is:" cc
endfunc

function! ccount#ChineseCountPunct()
  let cmessage = execute('%s/[\u2000-\uFFCC]//gn')
  let cc = split(cmessage, '[\n ]')[0]
  echo "Count of Chinese charasters (with punctuation) is:" cc
endfunc

" By skywind3000
" https://www.zhihu.com/question/54118781/answer/137982087

function! ccount#ChineseCountPunctRange() range
  let save = @z
  silent exec 'normal! gv"zy'
  let text = @z
  let @z = save
  silent exec 'normal! gv'
  let cc = 0
  for char in split(text, '\zs')
    if char2nr(char) >= 0x2000
      let cc += 1
    endif
  endfor
  echo "Count of Chinese charasters (with punctuation) is:" cc
endfunc
