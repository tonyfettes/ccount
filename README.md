# ccount.vim

This is a vim plugin that helps you count the number of Chinese characters.

## Installation

```vim
Plug 'tonyfettes/ccount.vim'
```

## Command

```vim
" Chinese characters without punctuation
:ChineseCount

" Chinese characters with punctuation
:ChineseCountPunct
```

## Plan

Support CJK characters counting.

## Acknowledgment

This whole plugin is based on [skywind3000](https://github.com/skywind3000)'s
answer on Zhihu, and [here is the link](https://www.zhihu.com/question/54118781/answer/137982087)

Here is the original code from skywind3000.

```vim
function! ChineseCount() range
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
  echo "Count of Chinese charasters is:"
  echo cc
endfunc

vnoremap <F7> :call ChineseCount()<cr>
```
