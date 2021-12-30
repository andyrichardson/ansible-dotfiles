call plug#begin()
Plug 'navarasu/onedark.nvim'
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
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'folke/which-key.nvim'
call plug#end()

colorscheme onedark
"set termguicolors
set winblend=15
set relativenumber
set updatetime=750
set mouse=a
"set clipboard=unnamedplus
set showbreak=>> breakat=\ :,; breakindent
set tabstop=2 shiftwidth=2 softtabstop expandtab
syntax on

let g:coc_disable_transparent_cursor = 1

imap jj <Esc>

" let mapleader = "\<space>"
nnoremap <space> <Nop>
map <space> <leader>
map <backspace> :WhichKey<CR>

" Reload config
nnoremap <leader>_ :source ~/.vimrc<CR>

map <C-N> :CocCommand explorer<CR>
map <A-N> :CocCommand explorer<CR>

" File name + content search
map <leader>lf :CocList files<CR>
map <leader>lt :CocList grep<CR>

" Definition traversal
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Changing operations
nmap <leader>cf <Plug>(coc-format-selected) 
nmap <leader>cF <Plug>(coc-format)
nmap <leader>cr <Plug>(coc-rename)
xmap <leader>ca <Plug>(coc-codeaction-selected)
nmap <leader>ca v<Plug>(coc-codeaction-selected)

" Clear search
nnoremap <leader>/ :noh<return>

" Make <CR> auto-select the first completion item 
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Git commands
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
nmap [c <Plug>(coc-git-prevconflict)
nmap ]c <Plug>(coc-git-nextconflict)
" show chunk diff at current position
nmap gs <Plug>(coc-git-chunkinfo)
" show commit contains current position
nmap gc <Plug>(coc-git-commit)
" create text object for git chunks
omap ig <Plug>(coc-git-chunk-inner)
xmap ig <Plug>(coc-git-chunk-inner)
omap ag <Plug>(coc-git-chunk-outer)
xmap ag <Plug>(coc-git-chunk-outer)

nnoremap <leader>vw :CocCommand git.copyUrl<CR>
nnoremap <leader>v, :CocCommand git.keepIncoming<CR>
nnoremap <leader>v. :CocCommand git.keepCurrent<CR>
nnoremap <leader>va :CocCommand git.chunkStage<CR>
nnoremap <leader>vc <Plug>(coc-git-commit)

lua << EOF
  local wk = require("which-key")
  wk.setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }

  wk.register({
	  name = "Leader",
    ["/"] = "Hide highlighting",
    ["_"] = "Reload .vimrc",
		l = {
 			name = "+List",
		  f = "files",
			t = "text"
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
