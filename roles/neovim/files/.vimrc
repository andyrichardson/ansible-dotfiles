let g:coc_node_path = '~/.nvm/versions/node/v14.*/bin/node'
let g:node_host_prog = expand('~/.nvm/versions/node/v14.18.2/bin/neovim-node-host')

call plug#begin()
Plug 'preservim/nerdtree'
Plug 'navarasu/onedark.nvim'
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

colorscheme onedark
set termguicolors
set winblend=15
set relativenumber
syntax on

imap jj <Esc>
map <C-N> :NERDTreeToggle<CR>
map <A-N> :NERDTreeFocus<CR>

let mapleader = "\<space>"
nnoremap <space> <Nop>
map <space> <leader>
