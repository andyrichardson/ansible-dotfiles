"""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""
call plug#begin()
  "{Theming}"
  Plug 'navarasu/onedark.nvim'
  "{Coc plugins}"
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
  Plug 'weirongxu/coc-explorer', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-rls', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
  Plug 'yaegassy/coc-ansible', {'do': 'yarn install --frozen-lockfile'}
  Plug 'voldikss/coc-cmake', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-git', {'do': 'yarn install --frozen-lockfile'}
  Plug 'felippepuhle/coc-graphql', {'do': 'yarn install --frozen-lockfile'}
  Plug 'josa42/coc-go', {'do': 'yarn install --frozen-lockfile'}
  Plug 'weirongxu/coc-markdown-preview-enhanced', {'do': 'yarn install --frozen-lockfile'}
  Plug 'pantharshit00/coc-prisma', {'do': 'yarn install --frozen-lockfile'}
  Plug 'josa42/coc-sh', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
  Plug 'iamcco/coc-svg', {'do': 'yarn install --frozen-lockfile'}
  Plug 'kkiyama117/coc-toml', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}
  Plug 'iamcco/coc-spell-checker', {'do': 'yarn install --frozen-lockfile'}
  "{Additional lang support}"
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  Plug 'jparise/vim-graphql'
  "{Other}"
  Plug 'folke/which-key.nvim'
  Plug 'preservim/nerdtree'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'ryanoasis/vim-devicons'
  Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
  Plug 'vn-ki/coc-clap'
call plug#end()



"""""""""""""""""""""""""""""""""""""""
" General settings
"""""""""""""""""""""""""""""""""""""""
colorscheme onedark
syntax on
set winblend=15
set relativenumber
set updatetime=750
set mouse=a

"""""""""""""""""""""""""""""""""""""""
" Wrapping/linebreaks
"""""""""""""""""""""""""""""""""""""""
set showbreak=>>
set breakat=\ :,; 
set breakindent

"""""""""""""""""""""""""""""""""""""""
" Indentation/tabs
"""""""""""""""""""""""""""""""""""""""
set tabstop=2 
set shiftwidth=2 
set softtabstop
set expandtab

"""""""""""""""""""""""""""""""""""""""
" Remappings
"""""""""""""""""""""""""""""""""""""""
imap jj <Esc>
nnoremap <space> <Nop>
map <space> <leader>

"""""""""""""""""""""""""""""""""""""""
" Global mappings
"""""""""""""""""""""""""""""""""""""""
nnoremap <leader>_ :source ~/.vimrc<CR>
nnoremap <leader>/ :noh<return>

"""""""""""""""""""""""""""""""""""""""
" CocExplorer/List
"""""""""""""""""""""""""""""""""""""""
let g:coc_disable_transparent_cursor = 1
"map <C-N> :CocCommand explorer :getcwd() --position floating<CR>
map <C-N> :NERDTreeToggle<CR>

let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeShowHidden=1
let g:NERDTreeMapOpenSplit="os"
let g:NERDTreeMapOpenVSplit="ov"

map <leader>ll :Clap<CR>
map <leader>lf :Clap files<CR>
map <leader>lg :Clap grep2<CR>
map <leader>lb :Clap blines<CR>
map <leader>ly :Clap yanks<CR>
map <leader>lr :Clap registers<CR>
map <leader>lv :Clap bcommits<CR>
map <leader>lj :Clap jumps<CR>

"""""""""""""""""""""""""""""""""""""""
" Coc mappings
"""""""""""""""""""""""""""""""""""""""
" Definition traversal
fun! GoToDefinition()
  if &ft =~ 'man\|help'
    execute 'tag '.expand('<cword>')
    return
  endif
 
  execute "normal \<Plug>(coc-definition)"
endfun

nmap <silent> gd :call GoToDefinition()<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Changing operations
nmap <leader>cf <Plug>(coc-format-selected) 
nmap <leader>cF <Plug>(coc-format)
nmap <leader>cr <Plug>(coc-rename)
xmap <leader>ca <Plug>(coc-codeaction-selected)
nmap <leader>ca v<Plug>(coc-codeaction-selected)

" Git commands
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
nmap [c <Plug>(coc-git-prevconflict)
nmap ]c <Plug>(coc-git-nextconflict)
omap ig <Plug>(coc-git-chunk-inner)
xmap ig <Plug>(coc-git-chunk-inner)
omap ag <Plug>(coc-git-chunk-outer)
xmap ag <Plug>(coc-git-chunk-outer)

" Git leader commands
nnoremap <leader>vw :CocCommand git.copyUrl<CR>
nnoremap <leader>v, :CocCommand git.keepIncoming<CR>
nnoremap <leader>v. :CocCommand git.keepCurrent<CR>
nnoremap <leader>va :CocCommand git.chunkStage<CR>
nnoremap <leader>vc <Plug>(coc-git-commit)

"""""""""""""""""""""""""""""""""""""""
" WhichKey
"""""""""""""""""""""""""""""""""""""""
map <backspace> :WhichKey<CR>

" Setup + prompts
lua << EOF
  local wk = require("which-key")
  wk.setup {
  }

  wk.register({
	  name = "Leader",
    ["/"] = "Hide highlighting",
    ["_"] = "Reload .vimrc",
		l = {
      name = "+List",
      l = "clap providers",
      f = "files",
      g = "grep",
      b = "grep (buffer)",
      y = "yanks",
      r = "registers",
      v = "vcs commits",
      j = "jumps"
		},
	  c = {
			name = "+Change",
			a = "action",
			f = "format (line/selection)",
			F = "format (file)",
		  r = "rename symbol"	
		},
    v = {
      name = "+VersionControl",
      a = "Stage chunk (add)",
      c = "Commit",
      w = "Copy url",
      [","] = "Keep incoming (conflict)",
      ["."] = "Keep current (conflict)"
    }
	}, { prefix = "<leader>" })

  wk.register({
    d = "definition (lang server)",
		y = "type definition (lang server)",
		i = "implementation (lang server)",
		r = "references (lang server)"
	}, { prefix = "g" })

  wk.register({
    K = "Show documentation (lang server)"
	})
EOF

""""""""""""""""""""""""""""""""""""""""
" Coc functions
"""""""""""""""""""""""""""""""""""""""
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Make <CR> auto-select the first completion item 
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm(): "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use K to show documentation in preview window.
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
nnoremap <silent> K :call <SID>show_documentation()<CR>

