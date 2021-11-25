" no vi-compatible
set nocompatible

" git plugins not managed by Vundle
" git clone https://github.com/vim-scripts/mutt-aliases.git ~/.vim/scripts/mutt-aliases

let g:mutt_aliases_file = '~/.mutt/aliases'
augroup mutt_alias
    autocmd!
    autocmd BufRead /tmp/mutt-* source ~/.vim/scripts/mutt-aliases/plugin/mutt-aliases.vim
    autocmd BufRead /tmp/neomutt-* source ~/.vim/scripts/mutt-aliases/plugin/mutt-aliases.vim
    autocmd BufRead /tmp/*/mutt-* source ~/.vim/scripts/mutt-aliases/plugin/mutt-aliases.vim
    autocmd BufRead /tmp/*/neomutt-* source ~/.vim/scripts/mutt-aliases/plugin/mutt-aliases.vim
augroup END

" per system plugin configurations:

function! UpdateRPlugin(info)
    if has('nvim')
        silent UpdateRemotePlugins
        echomsg 'rplugin updated: ' . a:info['name'] . ', restart vim for changes'
    endif
endfunction

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')

""
" Basic configurations
""

Plug 'ciaranm/securemodelines'
" A secure alternative to Vim modelines

Plug 'tpope/vim-sensible'
" Defaults everyone can agree on
" See the source for the authoritative list of features.  (Don't worry, it's
" mostly :set calls.)  Here's a taste:
" * 'backspace': Backspace through anything in insert mode.
" * 'incsearch': Start searching before pressing enter.
" * 'listchars': Makes :set list (visible whitespace) prettier.
" * 'scrolloff': Always show at least one line above/below the cursor.
" * 'directory': Dump swap files under ~/.cache/vim/swap (only if that
"                directory already exists).  Also 'backupdir' and 'undodir'.
"                Try `mkdir -p  ~/.cache/vim/{swap,backup,undo}`.
" * nmap Y y$: Make Y behave like C and D.
" * runtime! macros/matchit.vim: Load the version of matchit.vim that ships
"            with Vim.

if has('multi_byte')
    set listchars=tab:▸\ ,trail:Ξ,extends:>,precedes:<,nbsp:␠,eol:¶
    if has("patch-7.4.826")
        set listchars+=space:·
    endif
endif

Plug 'andymass/vim-matchup'
" vim match-up: even better % :facepunch: navigate and highlight matching words :facepunch: modern matchit a
" https://vimawesome.com/plugin/vim-matchup

Plug 'tpope/vim-repeat'
" Repeat

Plug 'tpope/vim-abolish'
" Abolish

" :Abolish {despa,sepe}rat{e,es,ed,ing,ely,ion,ions,or}  {despe,sepa}rat{}
" :%Subvert/facilit{y,ies}/building{,s}/g

" Want to turn fooBar into foo_bar? Press crs (coerce to snake_case).
" MixedCase (crm), camelCase (crc), snake_case (crs), and UPPER_CASE (cru) are
" all just 3 keystrokes away.

Plug 'tpope/vim-endwise'
" wisely add "end" in ruby. endfunction/endif/more in vim script, etc

Plug 'tpope/vim-surround'
" surround.vim: quoting/parenthesizing made simple

" cs'<q> change surround from ' to <q> </q>
" cst" change surround to "
" ds" delete surrounding "
" ysiw] you surround inside word ]
" cs]{  change surround to { and adds spaces
" yssb  you surround line with braces
"
"  "Hello *world!"           ds"         Hello world!
"  (123+4*56)/2              ds)         123+456/2
"  <div>Yo!*</div>           dst         Yo!
"
"  "Hello *world!"           cs"'        'Hello world!'
"  "Hello *world!"           cs"<q>      <q>Hello world!</q>
"  (123+4*56)/2              cs)]        [123+456]/2
"  (123+4*56)/2              cs)[        [ 123+456 ]/2
"  <div>Yo!*</div>           cst<p>      <p>Yo!</p>
"
"  Hello w*orld!             ysiw)       Hello (world)!
"      Hello w*orld!         yssB            {Hello world!}

" There is also *yS* and *ySS* which indent the surrounded text and place it
" on a line of its own.

" In visual mode, a simple "S" with an argument wraps the selection.  This is
" referred to as the *vS* mapping, although ordinarily there will be
" additional keystrokes between the v and S.  In linewise visual mode, the
" surroundings are placed on separate lines and indented.  In blockwise visual
" mode, each line is surrounded.

" A "gS" in visual mode, known as *vgS* , behaves similarly.  In linewise visual
" mode, the automatic indenting is suppressed.  In blockwise visual mode, this
" enables surrounding past the end of the line with 'virtualedit' set (there
" seems to be no way in Vim Script to differentiate between a jagged end of line
" selection and a virtual block selected past the end of the line, so two maps
" were needed).

"                                                 *i_CTRL-G_s* *i_CTRL-G_S*
" Finally, there is an experimental insert mode mapping on <C-G>s and <C-S>.
" Beware that the latter won't work on terminals with flow control (if you
" accidentally freeze your terminal, use <C-Q> to unfreeze it).  The mapping
" inserts the specified surroundings and puts the cursor between them.  If,
" immediately after the mapping and before the replacement, a second <C-S> or
" carriage return is pressed, the prefix, cursor, and suffix will be placed on
" three separate lines.  <C-G>S (not <C-G>s) also exhibits this behavior.

Plug 'tpope/vim-unimpaired'
" pairs of handy bracket mappings

" Much of unimpaired.vim was extracted from my vimrc when I noticed a pattern:
" complementary pairs of mappings. They mostly fall into four categories.
"
" There are mappings which are simply short normal mode aliases for commonly
" used ex commands. ]q is :cnext. [q is :cprevious. ]a is :next. [b is
" :bprevious. See the documentation for the full set of 20 mappings and
" mnemonics. All of them take a count.
"
" There are linewise mappings. [<Space> and ]<Space> add newlines before and
" after the cursor line. [e and ]e exchange the current line with the one
" above or below it.
"
" There are mappings for toggling options. [os, ]os, and cos perform :set
" spell, :set nospell, and :set invspell, respectively. There's also l (list),
" n (number), w (wrap), x (cursorline cursorcolumn), and several others, plus
" mappings to help alleviate the set paste dance. Consult the documentation.
"
" There are mappings for encoding and decoding. [x and ]x encode and decode
" XML (and HTML). [u and ]u encode and decode URLs. [y and ]y do C String
" style escaping.
"
" And in the miscellaneous category, there's [f and ]f to go to the
" next/previous file in the directory, and [n and ]n to jump between SCM
" conflict markers.
"
" The . command works with all operator mappings, and will work with the
" linewise mappings as well if you install repeat.vim.

Plug 'tpope/vim-rsi'
" rsi.vim: Readline style insertion

" This plugin provides Readline (Emacs) mappings for insert and command line
" mode that try not to overlap with built-in Vim functionality.

" <C-a>                   Go to beginning of line.
" <C-x><C-a>              Access Vim's built-in |i_CTRL-A| or |c_CTRL-A|.
" <C-b>                   Go backwards one character.  On a blank line, kill it
"                         and go back to the previous line.
" <C-d>                   Delete character in front of cursor.  Falls back to
"                         |i_CTRL-D| or |c_CTRL-D| at the end of the line.
" <C-e>                   Go to end of line.  Falls back to |i_CTRL-E| if
"                         already at the end of the line.  (|c_CTRL-E| already
"                         goes to end of line, so it is not mapped.)
" <C-f>                   Move forward one character.  Falls back to
"                         |i_CTRL-F| or |c_CTRL-F| at the end of the line.
" <C-g>                   Return to normal mode from the |cmdline|.
" <C-t>                   Transpose two characters.  This is mapped in command
"                         line mode only, as |i_CTRL-T| is too important to
"                         clobber.
" <M-BS>                  Delete backward one word.
" <M-b>                   Go backwards one word.
" <M-d>                   Delete forwards one word.
" <M-f>                   Go forwards one word.
" <M-n>                   Equivalent to |c_<Down>| or |i_<Down>|.
" <M-p>                   Equivalent to |c_<Up>| or |i_<Up>|.

Plug 'tpope/vim-characterize'
" characterize.vim: Unicode character metadata

" In Vim, pressing ga on a character reveals its representation in decimal, octal, and hex. Characterize.vim modernizes this with the following additions:

" Unicode character names: U+00A9 COPYRIGHT SYMBOL
" Vim digraphs (type after <C-K> to insert the character): Co, cO
" Emoji codes: :copyright:
" HTML entities: &copy;

" Plug 'tpope/vim-obsession'
" obsession.vim: continuously updated session files
"
" Use :Obsess (with optional file/directory name) to start recording to a
" session file and :Obsess! to stop and throw it away. That's it. Load a
" session in the usual manner: vim -S, or :source it.

Plug 'dietsche/vim-lastplace'
" Intelligently reopen files at your last edit position.

Plug 'lambdalisue/suda.vim'
"An alternative sudo.vim for Vim and Neovim, limited support sudo in Windows

" " Use suda:// prefix in read, edit, write, or saveas commands.
"
" " Open a current file with sudo
" :e suda://%
"
" " Save a current file with sudo
" :w suda://%
"
" " Edit /etc/sudoers
" :e suda:///etc/sudoers
"
" " Read /etc/sudoers (insert content under the cursor)
" :r suda:///etc/sudoers
"
" " Read /etc/sudoers at the end
" :$r suda:///etc/sudoers
"
" " Write contents to /etc/profile
" :w suda:///etc/profile
"
" " Save contents to /etc/profile
" :saveas suda:///etc/profile
"
" You can change the protocol prefix with g:suda#prefix.
"
" let g:suda#prefix = 'suda://'
" " multiple protocols can be defined too
" let g:suda#prefix = ['suda://', 'sudo://', '_://']
" let g:suda#prefix = ['suda://', 'sudo://']

" save as sudo
" cabbrev w!! w !sudo tee "%" > /dev/null


Plug 'vim-scripts/a.vim'
" Alternate Files quickly (.c --> .h etc)
"
" A few of quick commands to swtich between source files and header files quickly.

" :A switches to the header file corresponding to the current file being edited (or vise versa)
" :AS splits and switches
" :AV vertical splits and switches
" :AT new tab and switches
" :AN cycles through matches
" :IH switches to file under cursor
" :IHS splits and switches
" :IHV vertical splits and switches
" :IHT new tab and switches
" :IHN cycles through matches
" <Leader>ih switches to file under cursor
" <Leader>is switches to the alternate file of file under cursor (e.g. on  <foo.h> switches to foo.cpp)
" <Leader>ihn cycles through matches

Plug 'vim-scripts/Align'
" Help folks to align text, eqns, declarations, tables, etc

" EXAMPLES:

" :5,10Align =
"     Align on '=' signs

" :'<,'>Align = + - \* /
"     Align on any of the five separator characters shown.
"     Note that visual block mode was used to fire off Align.

" :AlignCtrl =lp1P1I
"     which means:
"     = all separators are equivalent
"     l fields will be left-justified
"     p1 pad one space before each separator
"     P1 pad one space after each separator
"     I  preserve and apply the first line's leading white space to all
"        Align'd lines

" :help align
"     Gives help for Align

" AlignMaps.vim provides a number of maps which make using this package easy.
" They typically either apply to the range 'a,. (from mark a to current line)
" or use the visual-selection (V, v, or ctrl-v selected):

"         \t=  : align assignments (don't count logic, like == or !=)
"         \t,  : align on commas
"         \t|  : align on vertical bars (|)
"         \tsp : align on whitespace
"         \tt  : align LaTeX tabular tables

" AlignMaps also provides some internally complex maps for aligning C
" declarations, Ansi C function arguments, html tables, LaTeX tabulars, and
" trailing comments:

"         \acom : align comments
"         \adec : align C declarations (one variable per line)
"         \afnc : align ansi-style C function input arguments
"         \Htd  : align html tables

""
" Text handling
""

Plug 'ntpeters/vim-better-whitespace'
" Better whitespace highlighting for Vim

Plug 'tomtom/tcomment_vim'
" An extensible & universal comment vim-plugin that also handles embedded
" filetypes

"     gc{motion}   :: Toggle comments (for small comments within one line
"                     the &filetype_inline style will be used, if
"                     defined)
"     gc<Count>c{motion} :: Toggle comment text with count argument
"                     (see |tcomment#Comment()|)
"     gcc          :: Toggle comment for the current line

" Explicit commenting/uncommenting:

"     g<{motion}   :: Uncomment region
"     g<c          :: Uncomment the current line
"     g<b          :: Uncomment the current region as block

"     g>{motion}   :: Comment region
"     g>c          :: Comment the current line
"     g>b          :: Comment the current region as block

" In visual mode:

"     gc           :: Toggle comments
"     g>           :: Comment selected text

" Primary key maps for normal and insert mode:

"     <c-_><c-_>   :: :TComment
"     <c-_><space> :: :TComment <QUERY COMMENT-BEGIN ?COMMENT-END>
"     <c-_>b       :: :TCommentBlock
"                     In insert mode, the cursor will be positioned inside
"                     the comment. In normal mode, the cursor will stay
"                     put.
"     <c-_>a       :: :TCommentAs <QUERY COMMENT TYPE>
"     <c-_>n       :: :TCommentAs &filetype <QUERY COUNT>
"     <c-_>s       :: :TCommentAs &filetype_<QUERY COMMENT SUBTYPE>
"     <c-_>i       :: :TCommentInline (in normal and insert mode, this map will
"                     create an empty inline comment, which isn't suitable for
"                     all filetypes though)
"                     In insert mode, the cursor will be positioned inside
"                     the comment. In normal mode, the cursor will stay
"                     put.
"     <c-_>r       :: :TCommentRight
"     <c-_>p       :: Comment the current inner paragraph
"     <c-_><Count> :: Set the count argument (a number from 1 to 9) for use with
"                     the subsequent tcomment map/command (see
"                     |tcomment#Comment()|)
"                     E.g. in JavaScript, in order to get an empty /** */
"                     comment for documentation purposes, in insert mode type
"                     <c-_>2<c-_>i
"                     In order to get an empty block comment like >
"                       /**
"                        *
"                        */
" <                   type <c-_>2<c-_>b

" Most of the above maps are also available in visual mode.

" A secondary set of key maps is defined for normal and insert mode:

"     <Leader>__       :: :TComment
"     <Leader>_p       :: Comment the current inner paragraph
"     <Leader>_<space> :: :TComment <QUERY COMMENT-BEGIN ?COMMENT-END>
"     <Leader>_i       :: :TCommentInline
"     <Leader>_r       :: :TCommentRight
"     <Leader>_b       :: :TCommentBlock
"     <Leader>_a       :: :TCommentAs <QUERY COMMENT TYPE>
"     <Leader>_n       :: :TCommentAs &filetype <QUERY COUNT>
"     <Leader>_s       :: :TCommentAs &filetype_<QUERY COMMENT SUBTYPE>

" ... and for select mode:

"     <Leader>__       :: :TComment
"     <Leader>_i       :: :TCommentInline

" Plug 'tommcdo/vim-exchange'
" Easy text exchange operator for Vim

" Mappings

" cx  On the first use, define the first {motion} to exchange. On the second
"     use, define the second {motion} and perform the exchange.
" cxx Like cx, but use the current line.
" X   Like cx, but for Visual mode.
" cxc Clear any {motion} pending for exchange.

Plug 'kana/vim-textobj-user'
" Vim plugin: Create your own text objects

Plug 'kana/vim-textobj-entire'
" Vim plugin: Text objects for entire buffer

" vim-textobj-entire is a Vim plugin to provide text objects (ae and ie by
" default) to select the entire content of a buffer.

""
" Indentation
""

Plug 'ogier/guessindent'
" The Guess Indent Plugin
let g:guessindent_prefer_tabs = 0

" Part of the guessindent plugin, needs to be after the filetype is enabled
autocmd BufReadPost * :GuessIndent

Plug 'nathanaelkane/vim-indent-guides'
" A Vim plugin for visually displaying indent levels in code

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent  = 7

let g:indent_guides_auto_colors = 1

Plug 'michaeljsmith/vim-indent-object'
" Indent text object
" [<,>]
" <count>ai         (A)n (I)ndentation level and line above.
" <count>ii         (I)nner (I)ndentation level (no line above).
" <count>aI         (A)n (I)ndentation level and lines above/below.
" <count>iI         (I)nner (I)ndentation level (no lines above/below).

""
" Search
""

if executable('fzf')

    if filereadable("/usr/share/doc/fzf/examples/fzf.vim")
        source /usr/share/doc/fzf/examples/fzf.vim
    elseif filereadable("/usr/share/vim/vimfiles/plugin/fzf.vim")
        source /usr/share/vim/vimfiles/plugin/fzf.vim
    endif

    Plug 'junegunn/fzf.vim'
    " :cherry_blossom: A command-line fuzzy finder

    command! -bang -nargs=? -complete=dir Files
        \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

    nnoremap <leader>sf :Files<cr>
    nnoremap <leader>st :Tags<cr>
    nnoremap <leader>sj :call fzf#vim#tags("'".expand('<cword>'))<cr>
    nnoremap <leader>sl :Lines<cr>
    nnoremap <Leader>sa :Ag<CR>
    nnoremap <Leader>se :FZF<CR>
    nnoremap <Leader>sb :Buffers<CR>

    " " file finder mapping
    " nmap <leader>e :Files<CR>
    " " tags (symbols) in current file finder mapping
    " nmap <leader>g :BTag<CR>
    " " tags (symbols) in all files finder mapping
    " nmap <leader>G :Tag<CR>
    " " general code finder in current file mapping
    " nmap <leader>f :BLines<CR>
    " " general code finder in all files mapping
    " nmap <leader>F :Lines<CR>
    " " commands finder mapping
    " nmap <leader>c :Commands<CR>

    " Mapping selecting mappings
    nmap <leader><tab> <plug>(fzf-maps-n)
    xmap <leader><tab> <plug>(fzf-maps-x)
    omap <leader><tab> <plug>(fzf-maps-o)
    " imap <leader><tab> <plug>(fzf-maps-i)

    " Insert mode completion
    imap <c-x><c-k> <plug>(fzf-complete-word)
    imap <c-x><c-f> <plug>(fzf-complete-path)
    imap <c-x><c-j> <plug>(fzf-complete-file-ag)
    imap <c-x><c-l> <plug>(fzf-complete-line)

    " Advanced customization using autoload functions
    " inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

else
    Plug 'ctrlpvim/ctrlp.vim'
    " Active fork of kien/ctrlp.vim—Fuzzy file, buffer, mru, tag, etc finder.

    " Once CtrlP is open:
    "
    " Press <F5> to purge the cache for the current directory to get new files,
    " remove deleted files and apply new ignore options.
    " Press <c-f> and <c-b> to cycle between modes.
    " Press <c-d> to switch to filename only search instead of full path.
    " Press <c-r> to switch to regexp mode.
    " Use <c-j>, <c-k> or the arrow keys to navigate the result list.
    " Use <c-t> or <c-v>, <c-x> to open the selected entry in a new tab or in a
    " new split.
    " Use <c-n>, <c-p> to select the next/previous string in the prompt's history.
    " Use <c-y> to create a new file and its parent directories.
    " Use <c-z> to mark/unmark multiple files and <c-o> to open them.

    function! CtrlPWithSearchText(search_text, ctrlp_command_end)
        execute ':CtrlP' . a:ctrlp_command_end
        call feedkeys(a:search_text)
    endfunction
    " CtrlP with default text
    " nmap <Leader>wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
    " nmap <Leader>wG :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
    " nmap <Leader>wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
    " nmap <Leader>sw :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
    " nmap <Leader>sf :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
    " nmap <Leader>wm :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<CR>
    " Easy bindings for its various modes
    " nmap <Leader>sb :CtrlPBuffer<CR>
    " nmap <Leader>sm :CtrlPMixed<CR>
    " nmap <Leader>sr :CtrlPMRU<CR>
    " nmap <Leader>sl :CtrlPLine<CR>

    " Ignore files on fuzzy finder
    let g:ctrlp_custom_ignore = {
        \ 'dir':  '\v[\/]\.(git|hg|svn)$',
        \ 'file': '\v\.(exe|so|dll|png|jpg|jpeg|pyc|pyo)$',
        \ }

    Plug 'fisadev/vim-ctrlp-cmdpalette'
    " ctrlp fuzzy command finder

    " commands finder mapping
    " nmap <Leader>sk :CtrlPCmdPalette<CR>

    Plug 'tacahiroy/ctrlp-funky'
    " Very simple function nativator for ctrlp.vim
    " Search definitions
    " nmap <Leader>sd :CtrlPFunky<CR>
    " narrow the list down with a word under cursor
    " nmap <Leader>sD :execute 'CtrlPFunky ' . expand('<cword>')<CR>

    Plug 'ivan-cukic/vim-ctrlp-switcher'
    " extension for switching between header and source files which supports
    " private classes
    " nmap <Leader>sS :CtrlPSwitch<CR>

    let g:ctrlp_extensions = ['funky', 'switcher']

endif

Plug 'nelstrom/vim-visual-star-search'
" Start a * or # search from a visual block

" This allows you to select some text using Vim's visual mode and then hit *
" and # to search for it elsewhere in the file.  For example, hit V, select
" a strange sequence of characters like "$! $!", and hit star.  You'll find
" all other runs of "$! $!" in the file.

" If you hit <leader>* ("\*" unless you changed the mapleader), vim will
" recursively vimgrep for the word under the cursor or the visual selection.

" Vim's default behavior is to just extend the visual selection to the next
" word that matches the word under the cursor.  Doesn't seem very useful.

Plug 'henrik/vim-indexed-search'
" Search results counter

""
" Languages
""

Plug 'sheerun/vim-polyglot'
" A solid language pack for Vim.

let g:polyglot_disabled = ['sensible']

" Individual language packs can be disabled by setting g:polyglot_disabled.
" let g:polyglot_disabled = ['css']

if has("patch-7.4.826")
    Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
    " UltiSnips - The ultimate snippet solution for Vim. Send pull requests to SirVer/ultisnips
    " vim-snipmate default snippets (Previously snipmate-snippets)
    let g:UltiSnipsExpandTrigger        = "<C-j>"
    let g:UltiSnipsJumpForwardTrigger	= "<C-j>"
    let g:UltiSnipsJumpBackwardTrigger	= "<C-k>"
    let g:UltiSnipsRemoveSelectModeMappings = 0
endif

"" " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"" let g:UltiSnipsExpandTrigger       = '<C-j>'
"" " let g:UltiSnipsListSnippets        = '<C-k>'
"" let g:UltiSnipsJumpForwardTrigger  = '<C-j>'
"" let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
""
"" " If you want :UltiSnipsEdit to split your window.
"" let g:UltiSnipsEditSplit           = 'vertical'

" html
Plug 'mattn/emmet-vim', {'for': 'html'}
" Ex Zen coding, now emmet

" haskell
if executable('ghc')
    Plug 'neovimhaskell/haskell-vim', {'for': 'haskell'}
    " Syntax Highlighting and Indentation for Haskell and Cabal
endif

" go
if executable('go')
    Plug 'fatih/vim-go', {'for': 'go'}
    " Go development plugin
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

" vim
Plug 'dahu/VimLint'
"  Plugin for checking your Vim configuration for correctness.

if executable('rustc')
    Plug 'rust-lang/rust.vim', { 'for': 'rust' }
    " Vim configuration for Rust.
    let g:rustfmt_autosave = 1

    if executable('racer')
        Plug 'racer-rust/vim-racer', { 'for': 'rust' }
        " Racer support for Vim
        let g:racer_experimental_completer = 1

        au FileType rust nmap <leader>rx <Plug>(rust-doc)
        au FileType rust nmap <leader>rd <Plug>(rust-def)
        au FileType rust nmap <leader>rs <Plug>(rust-def-split)
    endif
endif

""
" Ide like features
""

if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    " Yet Another Remote Plugin Framework for Neovim
    Plug 'roxma/vim-hug-neovim-rpc'
    " a compatibility layer for neovim rpc client working on vim8
endif
" :stars: Dark powered asynchronous completion framework for neovim

let g:deoplete#enable_at_startup = 1

" call deoplete#custom#option({
"             \ 'auto_complete_delay': 500,
"             \ 'smart_case': v:true,
"             \ 'yarp': v:true,
"             \ })

" let g:deoplete#auto_complete_delay = 500
" let g:deoplete#enable_smart_case = 1
" let g:deoplete#yarp = v:true

" Toggle popup completion
nnoremap <silent> yof :call deoplete#toggle()<cr>:echomsg "Toggling Deoplete"<cr>

Plug 'Shougo/context_filetype.vim'
" Provides functions to find fenced code blocks and their filetype.
" For example Javascript blocks inside of HTML.
" The fenced code is detected by predefined regular expressions.

Plug 'deoplete-plugins/deoplete-jedi', { 'do': function('UpdateRPlugin')}
" deoplete.nvim source for python and jedi

" if has('nvim')
"     Plug 'critiqjo/lldb.nvim', {'do': function('UpdateRPlugin')}
"     " Debugger integration with a focus on ease-of-use
" endif

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
" inoremap <expr> <CR> (pumvisible()?(empty(v:completed_item)?"\<C-y>\<CR>":"\<C-y>"):"\<CR>")
" <cr> is handled by endwise ...

" <TAB> completion
inoremap <expr> <TAB> pumvisible()   ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" experimental: avoid entering in the popup window when trying to move around
inoremap <silent> <expr> <Down> pumvisible() ? "\<C-o>gj" : "\<Down>"
inoremap <silent> <expr> <Up> pumvisible() ? "\<C-o>gk" : "\<Up>"

Plug 'wellle/tmux-complete.vim'
" Vim plugin for insert mode completion of words in adjacent tmux panes

Plug 'dense-analysis/ale'
" Asynchronous linting/fixing for Vim and Language Server Protocol (LSP) integration
"
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_delay = 1000
let g:ale_lint_on_text_changed = 'never'
" let g:ale_completion_enabled = 0
let g:ale_virtualtext_cursor = 0
" let g:ale_lint_on_insert_leave = 1
" let g:ale_lint_on_save = 0

if executable('pyflakes3')
    let g:ale_python_pyflakes_executable = 'pyflakes3'
endif
let g:ale_python_flake8_options = '--ignore=E203 --max-line-length=127'

if executable('pylint3')
    let g:ale_python_pylint_executable = 'pylint3'
endif
let g:ale_python_pylint_options = '--max-line-length=127'

if executable('yapf3')
    let g:ale_python_yapf_executable = 'yapf3'
endif

if !exists('g:ale_linters')
    let g:ale_linters = {}
endif

let g:ale_linters_ignore = {}
" let g:ale_linters_ignore.python = ['mypy']
" let g:ale_linters_ignore.json = ['jq']
let g:ale_linters_ignore.html = ['proselint', 'writegood']

let g:ale_fixers = {}
let g:ale_fixers.javascript = ['eslint', 'prettier']
let g:ale_fixers.javascriptreact = ['eslint', 'prettier']
let g:ale_fixers.typescript = ['eslint', 'prettier']
let g:ale_fixers.typescriptreact = ['eslint', 'prettier']
let g:ale_fixers.html = ['prettier']
let g:ale_fixers.css = ['prettier']
let g:ale_fixers.less = ['prettier']
let g:ale_fixers.scss = ['prettier']
let g:ale_fixers.python = ['black']

let g:ale_echo_msg_format = '[%linter%] %code: %%s'

" highlight link ALEWarningSign Todo
" highlight link ALEErrorSign WarningMsg
" highlight link ALEVirtualTextWarning Todo
" highlight link ALEVirtualTextInfo Todo
" highlight link ALEVirtualTextError WarningMsg
" highlight ALEError guibg=None
" highlight ALEWarning guibg=None

highlight link ALEError WarningMsg
highlight link ALEWarning Todo

"
" " Set this in your vimrc file to disabling highlighting
" let g:ale_set_highlights = 0

if executable('cargo-clippy')
    let g:ale_rust_cargo_use_clippy = executable('cargo-clippy')
endif

if executable('rls')
    let g:ale_linters.rust = ['rls']
    let g:ale_rust_rls_config = {
          \ 'rust': {
          \     'build_on_save': v:true,
          \     'clippy_preference': 'on'
          \ }
    \ }
endif

nnoremap <silent> <leader>ah :ALEHover<CR>
nnoremap <silent> <leader>as :ALEDetail<CR>
nnoremap <silent> <leader>ad :ALEGoToDefinition<CR>
nnoremap <silent> <leader>af :ALEFix<CR>
nnoremap <silent> <leader>ai :ALEImport<CR>

" Mappings in the style of unimpaired
nnoremap <silent> [W <Plug>(ale_first)
nnoremap <silent> [w <Plug>(ale_previous)
nnoremap <silent> ]w <Plug>(ale_next)
nnoremap <silent> ]W <Plug>(ale_last)

""
" Vcs
""

Plug 'tpope/vim-fugitive'
" a Git wrapper so awesome, it should be illegal

nnoremap <Leader>ga :Gwrite<Enter>
nnoremap <Leader>gd :Gdiffsplit<Enter>
nnoremap <Leader>gs :Git<Enter>
nnoremap <Leader>gl :Gclog<Enter>
nnoremap <Leader>gc :Git commit<Enter>
nnoremap <Leader>gp :Git pull<Enter>
nnoremap <Leader>gb :Git blame<Enter>

" <C-R><C-G>              On the command line, recall the path to the current
"                         object (that is, a representation of the object
"                         recognized by |:Gedit|).

" ["x]y<C-G>              Yank the commit SHA and path to the current object.

Plug 'airblade/vim-gitgutter'
" A Vim plugin which shows a git diff in the 'gutter' (sign column). It shows
" which lines have been added, modified, or removed. You can also preview,
" stage, and undo individual hunks.

""
" Widgets
""

Plug 'vim-airline/vim-airline'
" Airline

" vim-airline settings
if $TERM =~? '^linux'
    " Disable unicode chars in the linux term
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
    let g:airline_left_sep = '>'
    let g:airline_right_sep = '<'
    let g:airline_symbols.crypt = '#'
    let g:airline_symbols.linenr = '='
    let g:airline_symbols.maxlinenr = 'L'
    let g:airline_symbols.branch = '/'
    let g:airline_symbols.paste = 'P'
    let g:airline_symbols.spell = 'S'
    let g:airline_symbols.notexists = 'M'
    let g:airline_symbols.whitespace = 'T'
else
    let g:airline_powerline_fonts = 1
endif
" let g:airline_theme = 'solarized'
" let g:airline_theme = 'wombat'
" let g:airline_theme = 'jellybeans'
" let g:airline_theme = 'base16'
" let g:airline_theme = 'bubblegum'
" let g:airline_theme = 'distinguished'
" let g:airline#extensions#ycm#enabled = 0
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#whitespace#show_message = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 0
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" airline takes care of showing the current mode
set noshowmode

Plug 'scrooloose/nerdtree'
" Better file browser

" NERDTree (better file browser) toggle
map <F3> :NERDTreeToggle<CR>
" open nerdtree with the current file selected
nmap <Leader>f :NERDTreeFind<CR>
" Ignore files on NERDTree
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

Plug 'majutsushi/tagbar'
" Class/module browser

" toggle Tagbar display
nnoremap <F4> :TagbarToggle<CR>
" autofocus on Tagbar open
let g:tagbar_autofocus = 1

Plug 'sjl/gundo.vim'
" Graph your undo tree so you can actually USE it.
nnoremap <F6> :GundoToggle<CR>

let g:gundo_prefer_python3 = 1

Plug 'Valloric/ListToggle'
" A simple vim plugin for toggling the display of the quickfix list and the
" location-list.

let g:lt_location_list_toggle_map = '=oL'
let g:lt_quickfix_list_toggle_map = '=oC'

" By default, they are set to <leader>l and <leader>q, respectively.

Plug 'thinca/vim-quickrun'
" Run a command and show its result quickly.
let g:quickrun_no_default_key_mappings = 1
silent! nnoremap <unique> <F5> <Plug>(quickrun)
" <Leader>r                <Plug>(quickrun) " default

Plug 'machakann/vim-highlightedyank'
" Make the yanked region apparent!
if !exists('##TextYankPost')
    map y <Plug>(highlightedyank)
endif

""
" Themes
""

Plug 'vim-airline/vim-airline-themes'
" Airline Themes

" Plug 'flazz/vim-colorschemes'
" one colorscheme pack to rule them all!

Plug 'rafi/awesome-vim-colorschemes'
" Collection of awesome color schemes for Vim, merged for quick use

Plug 'hallison/vim-darkdevel'
" color scheme that supports the 8, 16 and 256 colors in XTerm mode.

" Plug 'ryanoasis/vim-devicons'
" :symbols: adds font icons (glyphs ★♨☢) to programming languages, libraries,
" and web developer filetypes for: NERDTree, powerline, vim-airline, ctrlp,
" unite, lightline.vim, vim-startify, vimfiler, and flagship

call plug#end()

" Deoplete configuration
call deoplete#custom#option({
            \ 'auto_complete_delay': 500,
            \ 'smart_case': v:true,
            \ })

" Edit vimrc
nnoremap <leader>ev :edit $MYVIMRC<cr>
nnoremap <leader>evs :source $MYVIMRC<cr>

" Terminal settings
if !has('nvim')
        \ && $TERM =~? 'mlterm\|xterm\|xterm-256color\|screen-256\|screen-256color\|rxvt-unicode-256color'
    " Use 256 colors, if possible
    let &t_Co = 256
endif

if !has('nvim')
        \ && $TERM =~? 'konsole-256color\|screen-256color'
        \ && $COLORTERM =~? 'truecolor\|24bit'
    " set Vim-specific sequences for RGB colors
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

if has('nvim') && has("termguicolors") && ($COLORTERM =~? 'truecolor\|24bit' || $TERM =~? 'xterm-256color\|screen-256color')
    " Enable true color, if possible
    set termguicolors
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" From defaults.vim, otherwise vim8 starts without syntax
" Switch syntax highlighting on when the terminal has colors or when using the
" GUI (which always has colors).
if &t_Co > 2 || has("gui_running")
    " Revert with ":syntax off".
    syntax on

    " I like highlighting strings inside C comments.
    " Revert with ":unlet c_comment_strings".
    let c_comment_strings=1
endif

function! SwitchTheme(colorscheme)
    let g:switchtheme#colorscheme = a:colorscheme
    if a:colorscheme == 'afterglow'
        set background=dark
        let g:afterglow_blackout=1
        let g:afterglow_italic_comments=1
        execute "colorscheme " . a:colorscheme
        let g:airline_theme = a:colorscheme
        if exists(":AirlineTheme")
            execute "AirlineTheme " . a:colorscheme
        endif
        " highlight CursorColumn term=reverse
    elseif a:colorscheme == 'apprentice'
        set background=dark
        execute "colorscheme " . a:colorscheme
        let g:airline_theme = 'distinguished'
        if exists(":AirlineTheme")
            AirlineTheme distinguished
        endif
        highlight CursorColumn term=reverse
    elseif a:colorscheme == 'ayu'
        set background=dark
        execute "colorscheme " . a:colorscheme
        let g:airline_theme = a:colorscheme
        if exists(":AirlineTheme")
            execute AirlineTheme a:colorscheme
        endif
        " highlight CursorColumn term=reverse
    elseif a:colorscheme == 'darkdevel'
        set background=dark
        execute "colorscheme " . a:colorscheme
        let g:airline_theme = 'distinguished'
        if exists(":AirlineTheme")
            AirlineTheme distinguished
        endif
        " highlight CursorColumn term=reverse
    elseif a:colorscheme == 'focuspoint'
        set background=dark
        execute "colorscheme " . a:colorscheme
        let g:airline_theme = 'distinguished'
        if exists(":AirlineTheme")
            AirlineTheme distinguished
        endif
        " highlight CursorColumn term=reverse
    elseif a:colorscheme == 'gruvbox'
        set background=dark
        let g:gruvbox_bold=1
        let g:gruvbox_italic=1
        " let g:gruvbox_improved_strings=0
        " let g:gruvbox_improved_warnings=0
        let g:gruvbox_contrast_dark='hard'
        let g:gruvbox_contrast_light='hard'
        execute "colorscheme " . a:colorscheme
        let g:airline_theme = a:colorscheme
        if exists(":AirlineTheme")
            execute "AirlineTheme " . a:colorscheme
        endif
        " highlight CursorColumn term=reverse
    elseif a:colorscheme == 'jellybeans'
        set background=dark
        execute "colorscheme " . a:colorscheme
        let g:airline_theme = 'distinguished'
        if exists(":AirlineTheme")
            AirlineTheme distinguished
        endif
        " highlight CursorColumn term=reverse
    elseif a:colorscheme == 'minimalist'
        set background=dark
        execute "colorscheme " . a:colorscheme
        let g:airline_theme = a:colorscheme
        if exists(":AirlineTheme")
            execute AirlineTheme a:colorscheme
        endif
        " highlight CursorColumn term=reverse
    elseif a:colorscheme == 'mountaineer'
        set background=dark
        execute "colorscheme " . a:colorscheme
        let g:airline_theme = 'distinguished'
        if exists(":AirlineTheme")
            AirlineTheme distinguished
        endif
        " highlight CursorColumn term=reverse
    elseif a:colorscheme == 'purify'
        set background=dark
        execute "colorscheme " . a:colorscheme
        let g:airline_theme = a:colorscheme
        if exists(":AirlineTheme")
            execute AirlineTheme a:colorscheme
        endif
        " highlight CursorColumn term=reverse
    elseif a:colorscheme == 'rdark-terminal2'
        set background=dark
        execute "colorscheme " . a:colorscheme
        let g:airline_theme = 'distinguished'
        if exists(":AirlineTheme")
            AirlineTheme distinguished
        endif
        " highlight CursorColumn term=reverse
    elseif a:colorscheme == 'spacecamp'
        set background=dark
        colorscheme spacecamp
        " let g:airline_theme = 'distinguished'
        " if exists(":AirlineTheme")
        "     AirlineTheme distinguished
        " endif
        " highlight CursorColumn term=reverse
    elseif a:colorscheme == 'solarized_dark'
        set background=dark
        colorscheme solarized8_high
        let g:airline_theme = 'solarized'
        if exists(":AirlineTheme")
            AirlineTheme solarized
        endif
        highlight CursorColumn term=reverse
    elseif a:colorscheme == 'solarized_light'
        set background=light
        colorscheme solarized8_high
        let g:airline_theme = 'solarized'
        if exists(":AirlineTheme")
            AirlineTheme solarized
        endif
        highlight CursorColumn term=reverse
    else
        execute "colorscheme " . a:colorscheme
    endif
endfunction

function! SwitchThemeComplete(A, L, P)
    let known_opts = [
        \ 'afterglow', 'apprentice', 'ayu', 'darkdevel', 'focuspoint', 'gruvbox',
        \ 'jellybeans', 'minimalist', 'mountaineer', 'purify', 'rdark-terminal2', 'spacecamp',
        \ 'solarized_dark', 'solarized_light', 'sourcerer']
    return filter(known_opts, 'v:val =~ a:A')
endfunction

if ! exists("g:switchtheme#colorscheme")
    call SwitchTheme("afterglow")
    " call SwitchTheme("apprentice")
    " call SwitchTheme("spacecamp")
    " if $NVIM_TUI_ENABLE_TRUE_COLOR == 1
    "     call SwitchTheme("afterglow")
    "     call SwitchTheme("gruvbox")
    " else
    "     call SwitchTheme("focuspoint")
    "     call SwitchTheme("afterglow")
    "     call SwitchTheme("darkdevel")
    " endif
endif
:
command! -nargs=1 -complete=customlist,SwitchThemeComplete SwitchTheme call SwitchTheme(<f-args>)

" Persistent undo
try
    set undofile
catch
endtry
augroup vimrc
    autocmd!
    autocmd BufWritePre /tmp/* setlocal noundofile
augroup END

if $TERM =~? 'screen-256\|screen-256color\|screen-256color-bce\|screen'
    let &titleold=getcwd()
    exe "set title titlestring=vim:%f"
    exe "set title t_ts=\<ESC>k t_fs=\<ESC>\\"
endif

" highlighted search results
set hlsearch
" line numbers
set number
" cursor line
set cursorline

" Open new splits at the bottom, or to the right
set splitbelow
set splitright

set foldmethod=syntax
" manual (default), indent, expr, syntax, diff, marker
" zi toggle foldenable
" za toggle current fold, zA recursively
" zo open, zc close, zO and zC
" zv view cursor, unfold to reveal the cursor
" zM close all
" ]z [z zj zk move to the next, prev fold
set nofoldenable
" set mouse=
set mouse=a

" * The current buffer can be put to the background without writing to disk
" * When a background buffer becomes current again, marks and undo-history
"   are remembered.
set hidden

" These two options, when set together, will make /-style searches
" case-sensitive only if there is a capital letter in the search expression.
" *-style searches continue to be consistently case-sensitive.
set ignorecase
set smartcase

set magic

" Don't leave ~ files around
set nobackup

" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3

" autocompletion of files and commands behave like shell
" (comple only the common part, list the options that match)
set wildmode=list:longest

" tabs and spaces handling
set expandtab
set softtabstop=4
set shiftwidth=4

" tablength exceptions
autocmd FileType html            setlocal shiftwidth=2 softtabstop=2
autocmd FileType htmldjango      setlocal shiftwidth=2 softtabstop=2
autocmd FileType javascript      setlocal shiftwidth=2 softtabstop=2
autocmd FileType javascriptreact setlocal shiftwidth=2 softtabstop=2
autocmd FileType typescript      setlocal shiftwidth=2 softtabstop=2
autocmd FileType make            setlocal noexpandtab
autocmd FileType css             setlocal shiftwidth=2 softtabstop=2
autocmd FileType less            setlocal shiftwidth=2 softtabstop=2
autocmd FileType scss            setlocal shiftwidth=2 softtabstop=2
autocmd FileType yaml            setlocal expandtab

"Terminal for 80 char ? so vim can play till 79 char.
set textwidth=78
" set colorcolumn=81
call matchadd('ColorColumn', '\%>80v\%<82v.\%>81v', 100) " 012345678901234567890
call matchadd('ColorColumn', '\%>127v\%<129v.\%>128v', 100) " 012345678901234567890

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <Leader>q :bp<CR>:bd<SPACE>#<CR>

" Copy and paste from and to the clipboard
noremap <Leader>Y "+y
noremap <Leader>P "+p

" Use %% as current file directory
cabbrev <expr> %% expand('%:p:h')

" Don't use Ex mode, use Q for formatting
noremap Q gq

" Spell check
set spelllang=en_gb
" unimpaired =os to toggle
" set spelllang=en_us | set spelllang=es_ar | set spelllang=de_de
" ]s : next |  [s : prev | z= suggestions | zg ignore | zw add
" set dictionary+=/usr/share/dict/words
" dictionary completion (^x^k), sadly it loads the dictionary on startup.

" vim -b : edit binary using xxd-format!
augroup Binary
    autocmd!
    autocmd BufReadPre  *.bin let &bin=1
    autocmd BufReadPost *.bin if &bin | %!xxd
    autocmd BufReadPost *.bin set ft=xxd | endif
    autocmd BufWritePre *.bin if &bin | %!xxd -r
    autocmd BufWritePre *.bin endif
    autocmd BufWritePost *.bin if &bin | %!xxd
    autocmd BufWritePost *.bin set nomod | endif
augroup END

function! Hex2Dec()
    let lstr = getline(".")
    let hexstr = matchstr(lstr, '0x[a-fA-F0-9]\+')
    while hexstr != ""
        let hexstr = hexstr + 0
        execute 's#0x[a-fA-F0-9]\+#'.hexstr."#"
        let lstr = substitute(lstr, '0x[a-fA-F0-9]\+', hexstr, "")
        let hexstr = matchstr(lstr, '0x[a-fA-F0-9]\+')
    endwhile
endfunction

function! FixMail()
    " save cursor position
    let pos = getpos(".")
    " Drop empty quoted lines
    silent! %s/^[> ]\+$//
    " Add a space after a quote marker
    silent! %s/^[> ]*>\ze[^> ]/& /
    " compress multiple quote markers
    while search('^>\+ >', 'w') > 0
        silent! s/^>\+\zs >/>/
    endwhile
    " restore the original cursor location
    call setpos('.', pos)
endfunction

" Add format option 'w' to add trailing white space, indicating that paragraph
" continues on next line. This is to be used with mutt's 'text_flowed' option.
augroup mail_trailing_whitespace " {
    autocmd!
    autocmd FileType mail setlocal formatoptions+=w
    autocmd Filetype mail call FixMail()
augroup END " }
