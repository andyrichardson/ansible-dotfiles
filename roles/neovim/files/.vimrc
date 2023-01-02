"""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')
  "{Theming}"
  Plug 'navarasu/onedark.nvim'
  Plug 'sonph/onehalf', { 'rtp': 'vim' }
  Plug 'Mofiqul/vscode.nvim'
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
  Plug 'weirongxu/coc-webview', {'do': 'yarn install --frozen-lockfile'}
  Plug 'pantharshit00/coc-prisma', {'do': 'yarn install --frozen-lockfile'}
  Plug 'josa42/coc-sh', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
  Plug 'iamcco/coc-svg', {'do': 'yarn install --frozen-lockfile'}
  Plug 'kkiyama117/coc-toml', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}
  Plug 'iamcco/coc-spell-checker', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-pairs', {'do': 'yarn install --frozen-lockfile'}
  "{Additional lang support}"
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  Plug 'jparise/vim-graphql'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  "{VimTree}"
  Plug 'ryanoasis/vim-devicons'
  Plug 'nvim-tree/nvim-web-devicons'
  Plug 'nvim-tree/nvim-tree.lua'
  "{Clap}"
  Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
  Plug 'gbprod/yanky.nvim'
  Plug 'fannheyward/telescope-coc.nvim'

  "{Other}"
  Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }
  Plug 'folke/which-key.nvim'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'tpope/vim-commentary'
  Plug 'ggandor/leap.nvim'
call plug#end()


"""""""""""""""""""""""""""""""""""""""
" General settings
"""""""""""""""""""""""""""""""""""""""
set termguicolors
set winblend=15
set relativenumber
set updatetime=750
set mouse=a

"""""""""""""""""""""""""""""""""""""""
" Search settings
"""""""""""""""""""""""""""""""""""""""
set ignorecase
set smartcase

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
" Lualine
"""""""""""""""""""""""""""""""""""""""
lua << END
  require('lualine').setup()
END

"""""""""""""""""""""""""""""""""""""""
" Theme
"""""""""""""""""""""""""""""""""""""""
syntax on
colorscheme onedark
lua << END
  require('onedark').load()
END
  
"""""""""""""""""""""""""""""""""""""""
" Bufferline
"""""""""""""""""""""""""""""""""""""""
lua << END
  require("bufferline").setup({
    options = {
      mode = "tabs",
      separator_style = "slant"
    }
  })
END


"""""""""""""""""""""""""""""""""""""""
" Bufferline
"""""""""""""""""""""""""""""""""""""""
lua << END
  require("bufferline").setup({
    options = {
      mode = "tabs",
      separator_style = "slant"
    }
  })
END

"""""""""""""""""""""""""""""""""""""""
" Leap
"""""""""""""""""""""""""""""""""""""""
lua << END
  require("leap").add_default_mappings(true);
  local dark1 = '#252932'
  local dark2 = '#20252c'

  local LeapTheme = {
    LeapLabelPrimary = { link = "Substitute" },
  }
  for hl, col in pairs(LeapTheme) do
      vim.api.nvim_set_hl(0, hl, col)
  end
END

"""""""""""""""""""""""""""""""""""""""
" Nvim Tree (tree view/file explorer)
"""""""""""""""""""""""""""""""""""""""
map <C-N> :NvimTreeFindFileToggle<CR>
lua << END
  local function find_in_folder(node)
    local path = (node.type == "file") and node.parent.absolute_path or node.absolute_path;
    require("telescope.builtin").live_grep({
      cwd = path
    })
  end 
  
  -- disable netrw at the very start of your init.lua (strongly advised)
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1
  require("nvim-tree").setup({
    view = {
      mappings = {
        list = {
          { key = "<C-s>", action = "split" },
          { key = "<C-g>", action = "find_in_folder", action_cb = find_in_folder }
        }
      }
    } 
  })
END

"""""""""""""""""""""""""""""""""""""""
" Treesitter
"""""""""""""""""""""""""""""""""""""""
lua << END
  -- Treesitter (syntax highlighting)
  require('nvim-treesitter.configs').setup({
    -- A list of parser names, or "all"
    ensure_installed = 'all',
    sync_install = false,
    auto_install = true,

    -- List of parsers to ignore installing (for "all")
    -- ignore_install = { "javascript" },
    highlight = {
      -- `false` will disable the whole extension
      enable = true,

      -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
      -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
      -- the name of the parser)
      -- list of language that will be disabled
      -- disable = { "c", "rust" },
      -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
      disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
              return true
          end
      end,

      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = false,
    },
  })
END

"""""""""""""""""""""""""""""""""""""""
" Yanky
"""""""""""""""""""""""""""""""""""""""
lua << END
  require("yanky").setup({}) 
END

"""""""""""""""""""""""""""""""""""""""
" Clap (telescope)
"""""""""""""""""""""""""""""""""""""""
map <leader>ll :Telescope builtin include_extensions=true<CR>
map <leader>lf :Telescope fd<CR>
map <leader>lg :Telescope live_grep<CR>
map <leader>ly :Telescope yank_history<CR>
map <leader>lr :Telescope registers<CR>
map <leader>lv :Telescope git_bcommits<CR>
map <leader>lj :Telescope jumplist<CR>
map <leader>lm :Telescope keymaps<CR>

lua << END
  local telescope = require('telescope')
  telescope.setup({
    defaults = {
      winblend = 5,
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.6,
        }
      },
      borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      results_title = false,
      mappings = {
        i = {
          ["<C-s>"] = require('telescope.actions').select_horizontal
        }
      }
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case"
      }
    } 
  })
  telescope.load_extension('fzf')
  telescope.load_extension("yank_history")
  telescope.load_extension("coc")

  -- Theme overrides
  local dark1 = '#252932'
  local dark2 = '#20252c'

  local TelescopePrompt = {
    TelescopeNormal = {
      bg = dark1,
    },
    TelescopePromptNormal = {
      bg = dark2,
    },
    TelescopePromptBorder = {
      bg = dark2,
      fg = dark2,
    },
    TelescopePreviewBorder = {
      bg = dark1,
      fg = dark1,
    },
    TelescopeResultsBorder = {
      bg = dark1,
      fg = dark1,
    },
    TelescopePromptTitle = { link = 'debugBreakpoint' },
    TelescopePreviewTitle = { link = 'Substitute' },
  }
  for hl, col in pairs(TelescopePrompt) do
      vim.api.nvim_set_hl(0, hl, col)
  end
END


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

inoremap <silent><expr> <C-k> coc#refresh()

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

" Comment toggles
vnoremap <leader>c/ <Plug>Commentary
nnoremap <leader>c/ <Plug>CommentaryLine

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
      j = "jumps",
      m = "maps"
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

