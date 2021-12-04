if executable('go')
    " vim-go plugin configuration

    " Features
    "     Improved Syntax highlighting, such as Functions, Operators, Methods..
    "     Auto completion support via gocode
    "     Better gofmt on save, keeps cursor position and doesn't break your undo
    "     history
    "     Go to symbol/declaration with :GoDef
    "     Look up documentation with :GoDoc inside Vim or open it in browser.
    "     Automatically import packages via :GoImport or plug it into autosave
    "     Compile your package with :GoBuild , install it with :GoInstall
    "     :GoRun quickly your current file/files
    "     Run :GoTest and see any errors in quickfix window
    "     Automatic GOPATH detection based on the directory structure (i.e: godep
    "     vendored projects)
    "     Change GOPATH with :GoPath, restore back to original at any time with
    "     :GoPathClear
    "     Create a coverage profile and display annotated source code in browser
    "     to see which functions are covered with :GoCoverage
    "     Lint your code with :GoLint
    "     Run your code through :GoVet to catch static errors.
    "     Advanced source analysis tool with oracle, such as :GoImplements,
    "     :GoCallees, :GoReferrers
    "     Precise type-safe renaming of identifiers with :GoRename
    "     List all source files and dependencies
    "     Checking with :GoErrCheck for unchecked errors.
    "     Integrated and improved snippets. Supports ultisnips or neosnippet
    "     Share your current code to play.golang.org with :GoPlay
    "     On-the-fly type information about the word under the cursor. Plug it
    "     into your custom vim function.
    "     Tagbar support to show tags of the source code in a sidebar with gotags
    "     Custom vim text objects, such a a function or inner function

    " Mappings

    " vim-go has several <Plug> mappings which can be used to create custom
    " mappings. Below are some examples you might find useful:

    " Run commands, such as go run with <leader>r for the current file or go build
    " and go test for the current package with <leader>b and <leader>t. Display a
    " beautiful annotated source code to see which functions are covered with
    " <leader>c.

    autocmd FileType go nmap <leader>r <Plug>(go-run)
    autocmd FileType go nmap <leader>u <Plug>(go-build)
    autocmd FileType go nmap <leader>t <Plug>(go-test)
    autocmd FileType go nmap <leader>c <Plug>(go-coverage)

    " By default the mapping gd is enabled which opens the target identifier in
    " current buffer. You can also open the definition/declaration in a new
    " vertical, horizontal or tab for the word under your cursor:

    autocmd FileType go nmap <Leader>ds <Plug>(go-def-split)
    autocmd FileType go nmap <Leader>dv <Plug>(go-def-vertical)
    autocmd FileType go nmap <Leader>dt <Plug>(go-def-tab)

    " Open the relevant Godoc for the word under the cursor with <leader>dd or
    " open it vertically with <leader>dv

    autocmd FileType go nmap <Leader>dd <Plug>(go-doc)
    autocmd FileType go nmap <Leader>dv <Plug>(go-doc-vertical)

    " Or open the Godoc in browser

    autocmd FileType go nmap <Leader>db <Plug>(go-doc-browser)

    " Show a list of interfaces which is implemented by the type under your cursor
    " with <leader>s

    autocmd FileType go nmap <Leader>s <Plug>(go-implements)

    " Show type info for the word under your cursor with <leader>i (useful if you
    " have disabled auto showing type info via g:go_auto_type_info)

    autocmd FileType go nmap <Leader>i <Plug>(go-info)

    " Rename the identifier under the cursor to a new name

    autocmd FileType go nmap <Leader>e <Plug>(go-rename)

    " More <Plug> mappings can be seen with :he go-mappings. Also these are just
    " recommendations, you are free to create more advanced mappings or functions
    " based on :he go-commands.

    " Settings

    " Below are some settings you might find useful. For the full list see :he
    " go-settings.

    " Disable opening browser after posting to your snippet to play.golang.org:

    " let g:go_play_open_browser = 0

    " To show the type info for the word under the cursor

    " let g:go_auto_type_info = 1

    " By default vim-go shows errors for the fmt command, to disable it:

    " let g:go_fmt_fail_silently = 1

    " Enable goimports to automatically insert import paths instead of gofmt:

    " let g:go_fmt_command = "goimports"

    " Disable auto fmt on save:

    " let g:go_fmt_autosave = 0

    " By default binaries are installed to $GOBIN or $GOPATH/bin. To change it:

    " let g:go_bin_path = expand("~/.gotools")
    " let g:go_bin_path = "/home/fatih/.mypath"      "or give absolute path

    " By default syntax-highlighting for Functions, Methods and Structs is
    " disabled. To change it:

    " let g:go_highlight_functions = 1
    " let g:go_highlight_methods = 1
    " let g:go_highlight_structs = 1
    " let g:go_highlight_operators = 1
    " let g:go_highlight_build_constraints = 1
endif
" go fmt settings

setlocal expandtab
setlocal softtabstop=4
setlocal shiftwidth=4
