# vim syntax highlight for f2j

Highlight the f2j code in Vim editor.

## Usage

1. Make sure Vim can idenfity the \*.sf file type.

    find `$VIMRUNTIME/filetype.vim`

    add

    ```
    " f2j

    au BufNewFile,BufRead .*sf           setf f2j
    ```

    For more details, type `:help filetype` in vim.

2. Put `f2j.vim` to `$VIMRUNTIME/syntax/`
