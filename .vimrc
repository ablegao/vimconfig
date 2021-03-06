filetype off  

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'Shougo/neocomplcache'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'nvie/vim-flake8'
"Plugin 'winmanager'
Plugin 'majutsushi/tagbar'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'rkulla/pydiction'
Plugin 'szw/vim-tags'
Plugin 'fatih/vim-go'
Plugin 'airblade/vim-gitgutter'
Plugin 'plasticboy/vim-markdown'
call vundle#end()            " required
set nocompatible   
filetype on 
syntax on  
filetype plugin on  
filetype plugin indent on  
set backspace=indent,eol,start
set nu
set mouse=a
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
"let g:neocomplcache_dictionary_filetype_lists = {
"    \ 'default' : '',
"    \ 'vimshell' : $HOME.'/.vimshell_hist',
"    \ 'scheme' : $HOME.'/.gosh_completions'
"        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
"inoremap <expr><C-g>     neocomplcache#undo_completion()
"inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType go set omnifunc=go#complete#Complete

autocmd FileType * set tabstop=8|set shiftwidth=8|set noexpandtab
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab
" autocmd FileType go set tabstop=4|set shiftwidth=4

autocmd FileType go nmap <C-LeftMouse> :GoDef @/='\V\<'.escape(expand('<cword>'), '\').'\>' <CR>

if !exists('g:neocomplcache_force_omni_patterns')
    let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplcache_force_omni_patterns.go = '[^.[:digit:] *\t]\.'
let g:neocomplcache_force_omni_patterns.python = '[^. \t]\.\w*'
"let g:neocomplcache_omni_function.python = 'jedi#complete'


" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" map <C-n> :NERDTreeToggle<CR>
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

let g:nerdtree_tabs_open_on_console_startup=1

" autocmd BufWritePost *.py call Flake8()
let g:flake8_quickfix_location="topleft"
let g:flake8_quickfix_height=7
let g:flake8_max_line_length=120
let g:flake8_ignore=""


let g:pydiction_location="~/.vim/bundle/pydiction/complete-dict"
let g:pydiction_menu_height = 3
function HeaderPython()
	call setline(1, "#!/usr/bin/env python")
	call append(1, "# -*- coding: utf-8 -*-")
	call append(2, "# Able Gao @" . strftime('%Y-%m-%d %T', localtime()))
	call append(3, "# ablegao@gmail.com")
	normal G
	normal o
	normal o
endf

autocmd bufnewfile *.py call HeaderPython()
let g:go_fmt_autosave = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
"let g:go_term_mode = "split" 
let g:go_snippet_engine = "neosnippet"




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Config Winmanager
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:winManagerWindowLayout="NERDTree|BufExplorer|Tagbar"
"let g:winManagerWindowLayout="NERDTree|Tagbar"
let g:NERDTree_title="[NERDTree]"

let g:tagbar_title = "[Tagbar]"
let g:tagbar_vertical = 30
let g:tagbar_autofocus = 1
let g:tagbar_autoshowtag = 1


function! NERDTree_Start()  
	exe 'q'
	exe 'NERDTree'  
endfunction

function! NERDTree_IsValid()  
	return 1  
endfunction

function! Tagbar_Start()
	exe 'q'
	exe 'TagbarOpen'
endfunction
	 
function! Tagbar_IsValid()
	return 1
endfunction




function! ToggleNERDTreeAndTagbar()
    let w:jumpbacktohere = 1

    " Detect which plugins are open
    if exists('t:NERDTreeBufName')
        let nerdtree_open = bufwinnr(t:NERDTreeBufName) != -1
    else
        let nerdtree_open = 0
    endif
    let tagbar_open = bufwinnr('__Tagbar__') != -1

    " Perform the appropriate action
    if nerdtree_open && tagbar_open 
        NERDTreeClose
        TagbarClose
    elseif nerdtree_open
        TagbarOpen
    elseif tagbar_open
        NERDTree
    else
        NERDTree
        TagbarOpen
    endif

    " Jump back to the original window
    for window in range(1, winnr('$'))
        execute window . 'wincmd w'
        if exists('w:jumpbacktohere')
            unlet w:jumpbacktohere
            break
        endif
    endfor
endfunction
nmap <silent> <F8> :call ToggleNERDTreeAndTagbar()<CR>
set pastetoggle=<F9>
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : ' -sort -silent '
    \ }
set tags=tags;/

