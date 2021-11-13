let b:ale_linters = ['eslint']
let b:ale_fixers = ['eslint']

noremap <buffer>  <leader>b :call JsBeautify()<cr>
setlocal ts=2 sts=2 sw=2 expandtab
