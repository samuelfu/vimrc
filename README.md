Must have: atuin (ctrl-r), fzf, ripgrep, bat



gd (Normal mode): Go to Definition

This command jumps to the definition of the symbol under the cursor.
Usage: Place your cursor on a variable, function, or type and press gd.


K (Normal mode): Hover Information

This displays information about the symbol under the cursor in a floating window.
Usage: Place your cursor on any symbol and press K.


<leader>vws: Workspace Symbol Search

This opens a list of all symbols in the current workspace.
Usage: Press <leader>vws (your leader key followed by vws).


<leader>vd: Open Diagnostic Float

This shows diagnostic information (errors, warnings) for the current line in a floating window.
Usage: Press <leader>vd when on a line with diagnostics.


[d: Go to Next Diagnostic

This moves the cursor to the next diagnostic in the file.
Usage: Press [d to jump to the next error or warning.


]d: Go to Previous Diagnostic

This moves the cursor to the previous diagnostic in the file.
Usage: Press ]d to jump to the previous error or warning.


<leader>vca: Code Action

This shows available code actions for the current context.
Usage: Press <leader>vca when your cursor is on a piece of code that might have actions available.


<leader>vrr: Show References

This lists all references to the symbol under the cursor.
Usage: Place your cursor on a symbol and press <leader>vrr.


<leader>vrn: Rename Symbol

This allows you to rename the symbol under the cursor across the entire project.
Usage: Place your cursor on a symbol and press <leader>vrn, then type the new name.


<C-h> (Insert mode): Signature Help

This shows information about function signatures when you're typing function arguments.
Usage: Press Ctrl+h while in insert mode inside function parentheses.



Additional LSP-related commands (not mapped to keys but available):

:LspInfo: Shows information about active language servers for the current buffer.
:LspStart: Manually starts the language server for the current file type.
:LspStop: Stops the language server for the current buffer.
:LspRestart: Restarts the language server for the current buffer.

