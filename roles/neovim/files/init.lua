require('packer').startup(
  function(use)
    use({ 'wbthomason/packer.nvim' })
    -- Themes
    use({ 'navarasu/onedark.nvim' })
    use({ 'Mofiqul/vscode.nvim' })
    use({ 'arcticicestudio/nord-vim' })
    use({ 'sonph/onehalf', rtp = "vim" })
    -- Coc plugins
    use({ 'neoclide/coc.nvim', branch = 'release' })
    use({ 'neoclide/coc-highlight', run = 'yarn install --frozen-lockfile' })
    use({ 'neoclide/coc-tsserver', run = 'yarn install --frozen-lockfile' })
    use({ 'xiyaowong/coc-sumneko-lua', run = 'yarn install --frozen-lockfile' })
    use({ 'neoclide/coc-prettier', run = 'yarn install --frozen-lockfile' })
    use({ 'neoclide/coc-json', run = 'yarn install --frozen-lockfile' })
    use({ 'neoclide/coc-css', run = 'yarn install --frozen-lockfile' })
    use({ 'neoclide/coc-html', run = 'yarn install --frozen-lockfile' })
    use({ 'neoclide/coc-rls', run = 'yarn install --frozen-lockfile' })
    use({ 'neoclide/coc-python', run = 'yarn install --frozen-lockfile' })
    use({ 'neoclide/coc-eslint', run = 'yarn install --frozen-lockfile' })
    use({ 'yaegassy/coc-ansible', run = 'yarn install --frozen-lockfile' })
    use({ 'voldikss/coc-cmake', run = 'yarn install --frozen-lockfile' })
    use({ 'neoclide/coc-git', run = 'yarn install --frozen-lockfile' })
    use({ 'felippepuhle/coc-graphql', run = 'yarn install --frozen-lockfile' })
    use({ 'josa42/coc-go', run = 'yarn install --frozen-lockfile' })
    use({ 'pantharshit00/coc-prisma', run = 'yarn install --frozen-lockfile' })
    use({ 'josa42/coc-sh', run = 'yarn install --frozen-lockfile' })
    use({ 'neoclide/coc-snippets', run = 'yarn install --frozen-lockfile' })
    use({ 'iamcco/coc-svg', run = 'yarn install --frozen-lockfile' })
    use({ 'kkiyama117/coc-toml', run = 'yarn install --frozen-lockfile' })
    use({ 'neoclide/coc-yaml', run = 'yarn install --frozen-lockfile' })
    use({ 'neoclide/coc-pairs', run = 'yarn install --frozen-lockfile' })
    use({ 'iamcco/coc-spell-checker', run = 'yarn install --frozen-lockfile' })
    -- Additional language support
    use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
    use({ 'styled-components/vim-styled-components', branch = 'main' })
    use({ 'jparise/vim-graphql' })
    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install",
      setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
    -- Navigation
    use({ 'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons' } })
    use({ 'akinsho/bufferline.nvim', tag = 'v3.*', requires = { 'nvim-tree/nvim-web-devicons' } })
    use({ 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons' } })
    -- Telescope
    use({ 'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = { 'nvim-lua/plenary.nvim' } })
    use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })
    use({ 'gbprod/yanky.nvim' })
    use({ 'fannheyward/telescope-coc.nvim' })
    use({ 'rmagatti/session-lens', requires = { 'rmagatti/auto-session' } })
    -- Motions
    use({ 'ggandor/leap.nvim' })
    use({ 'mg979/vim-visual-multi' })
    -- Aditional editor plugins
    use({ 'tpope/vim-commentary' })
    use({ 'JoosepAlviste/nvim-ts-context-commentstring' })
    use({ 'tpope/vim-surround' })
    -- Tools
    use({ 'folke/which-key.nvim' })
  end
)

vim.g.python3_host_prog = "/opt/homebrew/bin/python3"

--------------------------------------
-- General settings
--------------------------------------
vim.opt.termguicolors = true
vim.opt.winblend = 15
vim.opt.relativenumber = true
vim.opt.updatetime = 200
vim.opt.mouse = 'a'

-- Use nvim tree instead
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--------------------------------------
-- Search settings
--------------------------------------
vim.opt.ignorecase = true
vim.opt.smartcase = true

--------------------------------------
-- Wrapping/linebreaks
--------------------------------------
vim.opt.showbreak = '>>'
vim.opt.breakat = '\\ :,;'
vim.opt.breakindent = true

--------------------------------------
-- Indentation/tabs
--------------------------------------
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 1
vim.opt.expandtab = true

--------------------------------------
-- Global vim remappings
--------------------------------------
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("n", "<space>", "<Nop>")
vim.keymap.set("", "<space>", "<leader>", { remap = true })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "man\\|help",
  callback = function()
    vim.keymap.set('n', 'gd', function()
      vim.cmd({ cmd = "tag", args = { vim.fn.expand("<cword>") } })
    end, { desc = 'Go to defintion' })
  end,
  desc = "Go to definition on help files"
})
--------------------------------------
-- Global mappings
--------------------------------------
vim.keymap.set(
  "",
  "<leader>/",
  ":noh<CR>",
  { desc = "Hide highlights" }
)

--------------------------------------
-- Theme
--------------------------------------
vim.cmd.syntax("on")
vim.cmd.colorscheme('onedark')
require("onedark").load()

--------------------------------------
-- Leap
--------------------------------------
require("leap").add_default_mappings(true);
local LeapTheme = {
  LeapLabelPrimary = { link = "Substitute" },
}
for hl, col in pairs(LeapTheme) do
  vim.api.nvim_set_hl(0, hl, col)
end

--------------------------------------
-- WhichKey
--------------------------------------
local wk = require("which-key")
local presets = require('which-key.plugins.presets.init')
local wkopts = {
  operators = {
    ['<leader>zy'] = "surround",
    ['<leader>zY'] = "surround",
    ['<leader>zc'] = "surround",
    ['<leader>zC'] = "surround",
  }
}
wk.setup(wkopts)

-- Add motions and operators
presets.motions["s"] = "Leap to"
presets.motions["S"] = "Leap to (reverse)"
presets.motions["x"] = "Leap until"
presets.motions["X"] = "Leap until (reverse)"
presets.setup(wk, presets, wkopts)

--------------------------------------
-- Lualine
--------------------------------------
require("lualine").setup({
  options = {
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' }
  }
})

--------------------------------------
-- Bufferline
--------------------------------------
require("bufferline").setup({
  options = {
    mode = "tabs",
    diagnostics = "coc",
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        separator = true
      }
    },
    indicator = { style = "none" },
    -- Prevent NvimTree being used for tab name
    custom_filter = function(buf)
      return vim.bo[buf].filetype ~= "NvimTree"
    end
  }
})

--------------------------------------
-- Yanky
--------------------------------------
local mapping = require("yanky.telescope.mapping")
require("yanky").setup({
  picker = {
    telescope = {
      mappings = {
        i = {
          ["<CR>"] = mapping.put('p'),
          ["<S-CR>"] = mapping.put('P')
        }
      }
    }
  }
})

--------------------------------------
-- Sessions
--------------------------------------
require('auto-session').setup({})
require("session-lens").setup({})

--------------------------------------
-- Nvim tree view
--------------------------------------
vim.keymap.set(
  "",
  "<C-n>",
  ":NvimTreeFindFileToggle<CR>",
  { desc = "Tree view toggle (on current file)" }
)

-- Add telescope grep integration
local function find_in_folder(node)
  local path = (node.type == "file") and node.parent.absolute_path or node.absolute_path;
  require("telescope.builtin").live_grep({
    cwd = path
  })
end

require("nvim-tree").setup({
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true
  },
  git = {
    ignore = false
  },
  select_prompts = true, -- TODO: find out what this does
  remove_keymaps = { "s" }, -- allow leap in tree
  tab = {
    sync = {
      open = true,
      close = true
    }
  },
  view = {
    hide_root_folder = true,
    adaptive_size = true,
    relativenumber = true,
    mappings = {
      list = {
        { key = "<C-s>", action = "split" },
        { key = "<C-g>", action = "find_in_folder", action_cb = find_in_folder }
      }
    },
  }
})

--------------------------------------
-- Vim surround
--------------------------------------
vim.g.surround_no_mappings = 1
wk.register({ ["<leader>z"] = { name = "Surround" } }, { mode = { "n", "v" } })
vim.keymap.set(
  "n",
  "<leader>zd",
  "<Plug>Dsurround",
  { remap = true, desc = "Delete surround" }
)
vim.keymap.set(
  "n",
  "<leader>zc",
  "<Plug>Csurround",
  { remap = true, desc = "Change surround" }
)
vim.keymap.set(
  "n",
  "<leader>zC",
  "<Plug>CSurround",
  { remap = true, desc = "Change surround (wrap)" }
)
vim.keymap.set(
  "n",
  "<leader>zy",
  "<Plug>Ysurround",
  { remap = true, desc = "Add surround" }
)
vim.keymap.set(
  "n",
  "<leader>zY",
  "<Plug>YSurround",
  { remap = true, desc = "Add surround (wrap)" }
)
vim.keymap.set(
  "x",
  "<leader>zy",
  "<Plug>Vsurround",
  { remap = true, desc = "Add surround" }
)
vim.keymap.set(
  "x",
  "<leader>zY",
  "<Plug>VgSurround",
  { remap = true, desc = "Add surround (wrap)" }
)

--------------------------------------
-- Vim multi cursor
--------------------------------------
wk.register({
  ['<leader>n'] = {
    name = "Multi cursor", {
      n = "Match forward",
      N = "Match backward",
      q = "Skip forward",
      Q = "Skip backward"
    }
  },
}, { mode = { "n", "v" } })
vim.g.VM_maps = {
  ['Find Under'] = '<leader>n',
  ['Find Subword Under'] = '<leader>n'
}
vim.keymap.set(
  "",
  "<C-c>",
  ":VMClear<CR>",
  { silent = true }
)

--------------------------------------
-- Telescope
--------------------------------------
-- Keymaps
wk.register({ ["<leader>l"] = { name = "Telescope", } }, { mode = { "n", "v" } })
vim.keymap.set(
  '',
  '<leader>ll',
  ':Telescope builtin include_extensions=true<CR>',
  { desc = 'List pickers' }
)
vim.keymap.set(
  '',
  '<leader>lf',
  ':Telescope fd<CR>',
  { desc = 'List files' }
)
vim.keymap.set(
  '',
  '<leader>lg',
  ':Telescope live_grep<CR>',
  { desc = 'Grep files' }
)
vim.keymap.set(
  '',
  '<leader>ly',
  ':Telescope yank_history<CR>',
  { desc = 'List yanks' }
)
vim.keymap.set(
  '',
  '<leader>lr',
  ':Telescope registers<CR>',
  { desc = 'List registers' }
)
vim.keymap.set(
  '',
  '<leader>lv',
  ':Telescope git_bcommits<CR>',
  { desc = 'List git commits' }
)
vim.keymap.set(
  '',
  '<leader>lj',
  ':Telescope jumplist<CR>',
  { desc = 'List jumps' }
)
vim.keymap.set(
  '',
  '<leader>lm',
  ':Telescope keymaps<CR>',
  { desc = 'List keymaps' }
)
vim.keymap.set(
  '',
  '<leader>lh',
  ':Telescope coc mru<CR>',
  { desc = 'List recently used (history)' }
)
vim.keymap.set(
  '',
  '<leader>lp',
  ':Telescope session-lens search_session<CR>',
  { desc = "List sessions" }
)

-- Init
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
    },
    pickers = {
      find_files = {
        hidden = true,
        find_command = { "aa" }
      }
    },
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
telescope.load_extension("session-lens")

-- Theme
function setTelescopeTheme()
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
end

setTelescopeTheme()

--------------------------------------
-- Treesitter
--------------------------------------
require('nvim-treesitter.configs').setup({
  context_commentstring = {
    enable = true,
  },
  -- A list of parser names, or 'all'
  ensure_installed = 'all',
  sync_install = false,
  auto_install = true,

  -- List of parsers to ignore installing (for 'all')
  -- ignore_install = { 'javascript' },
  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { 'c', 'rust' },
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

--------------------------------------
-- Commentary
--------------------------------------
-- Use contextual commentary mappings
-- See - https://github.com/JoosepAlviste/nvim-ts-context-commentstring/pull/57
vim.keymap.set(
  "n",
  "g/",
  '<Plug>ContextCommentaryLine',
  { silent = true, desc = "Comment line" }
)
vim.keymap.set(
  "v",
  "g/",
  "<Plug>ContextCommentary",
  { silent = true, desc = "Comment selection" }
)

--------------------------------------
-- Coc
--------------------------------------
-- Coc code actions
wk.register({ ["<leader>c"] = { name = "Change", } }, { mode = { "n" } })
vim.keymap.set(
  "n",
  "<leader>ca",
  "<Plug>(coc-codeaction-selected)",
  { silent = true, desc = "Code action (coc)" }
)
vim.keymap.set(
  "x",
  "<leader>ca",
  "<Plug>(coc-codeaction-selected)",
  { silent = true, desc = "Code action (coc)" }
)
vim.keymap.set(
  "n",
  "<leader>cr",
  "<Plug>(coc-rename)",
  { silent = true, desc = "Code action rename (coc)" }
)
vim.keymap.set(
  "n",
  "<leader>cf",
  "<Plug>(coc-format-selection)",
  { silent = true, desc = "Format selection (coc)" }
)
vim.keymap.set(
  "n",
  "<leader>cF",
  "<Plug>(coc-format)",
  { silent = true, desc = "Format document (coc)" }
)

-- Telescope coc actions
vim.keymap.set(
  'n',
  'gd',
  ':Telescope coc definitions<CR>',
  { silent = true, desc = 'Go to definition', }
)
vim.keymap.set(
  'n',
  'gy',
  ':Telescope coc type_definitions<CR>',
  { silent = true, desc = 'Go to type defintion' }
)
vim.keymap.set(
  'n',
  'gi',
  ':Telescope coc implementations<CR>',
  { silent = true, desc = 'Go to implementation' }
)
vim.keymap.set(
  'n',
  'gr',
  ':Telescope coc references<CR>',
  { silent = true, desc = 'Go to references' }
)

-- Open prompt
vim.keymap.set(
  "i",
  "<c-space>",
  "coc#refresh()",
  { silent = true, expr = true, desc = 'Coc completion' }
)
vim.keymap.set(
  "i",
  "<c-k>",
  "coc#refresh()",
  { silent = true, expr = true, desc = 'Coc completion' }
)

-- Confirm prompt
-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice
vim.keymap.set(
  "i",
  "<cr>",
  -- DELETE ON ENTER IF INDENTATION STILL SUCKS
  'coc#pum#visible() ? coc#pum#confirm() : "<cr>"',
  { silent = true, expr = true }
)

-- Navigate prompt
vim.keymap.set(
  "i",
  "<tab>",
  'coc#pum#visible() ? coc#pum#next(1) : "<tab>"',
  { silent = true, expr = true, replace_keycodes = false }
)
vim.keymap.set(
  "i",
  "<c-j>",
  'coc#pum#visible() ? coc#pum#next(1) : "<c-j>"',
  { silent = true, expr = true, replace_keycodes = false }
)
vim.keymap.set(
  "i",
  "<s-tab>",
  'coc#pum#visible() ? coc#pum#prev(1) : "<S-TAB>"',
  { silent = true, expr = true, replace_keycodes = false }
)
vim.keymap.set(
  "i",
  "<c-k>",
  'coc#pum#visible() ? coc#pum#prev(1) : "<c-k>"',
  { silent = true, expr = true, replace_keycodes = false }
)

-- Git
vim.keymap.set(
  "n",
  "[g",
  "<Plug>(coc-git-prevchunk)",
  { desc = "Git prev chunk" }
)
vim.keymap.set(
  "n",
  "]g",
  "<Plug>(coc-git-nextchunk)",
  { desc = "Git next chunk" }
)
vim.keymap.set(
  "n",
  "[c",
  "<Plug>(coc-git-prevconflict)",
  { desc = "Git previous conflict" }
)
vim.keymap.set(
  "n",
  "]c",
  "<Plug>(coc-git-nextconflict)",
  { desc = "Git next conflict" }
)
vim.keymap.set(
  "o",
  "ig",
  "<Plug>(coc-git-chunk-inner)",
  { desc = "Git innner chunk" }
)
vim.keymap.set(
  "x",
  "ig",
  "<Plug>(coc-git-chunk-inner)",
  { desc = "Git inner chunk" }
)
vim.keymap.set(
  "o",
  "ag",
  "<Plug>(coc-git-chunk-outer)",
  { desc = "Git outer chunk" }
)
vim.keymap.set(
  "x",
  "ag",
  "<Plug>(coc-git-chunk-outer)",
  { desc = "Git outer chunk" }
)

wk.register({ ["<leader>v"] = { name = "Version control", } }, { mode = { "n" } })
vim.keymap.set(
  'n',
  '<leader>vw',
  ':CocCommand git.copyUrl<CR>',
  { desc = 'Git copy url' }
)
vim.keymap.set(
  'n',
  '<leader>v.',
  ':CocCommand git.keepIncoming<CR>',
  { desc = 'Git keep incoming (bottom)' }
)
vim.keymap.set(
  'n',
  '<leader>v,',
  ':CocCommand git.keepCurrent<CR>',
  { desc = 'Git keep current (top)' }
)
vim.keymap.set(
  'n',
  '<leader>va',
  ':CocCommand git.chunkStage<CR>',
  { desc = 'Git stage chunk' }
)
vim.keymap.set(
  'n',
  '<leader>vc',
  '<Plug>(coc-git-commit)',
  { desc = 'Git commit' }
)

-- docs
vim.keymap.set(
  'n',
  'K',
  function()
    local cw = vim.fn.expand('<cword>')
    if vim.api.nvim_eval('coc#rpc#ready()') then
      vim.fn.CocActionAsync('doHover')
    else
      vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
  end,
  { silent = true, desc = "Show documentation" }
)

-- Highlight current word
vim.api.nvim_set_hl(0, 'CocHighlightText', { link = "DiffText" })
vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
  group = "CocGroup",
  command = "silent call CocActionAsync('highlight')",
  desc = "Highlight symbol under cursor on CursorHold"
})

--------------------------------------
-- Coc (defaults)
--------------------------------------
-- Some servers have issues with backup files, see #649
vim.opt.backup = false
vim.opt.writebackup = false

-- Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
-- delays and poor user experience
vim.opt.updatetime = 300

-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appeared/became resolved
vim.opt.signcolumn = "yes"

-- Add `:Format` command to format current buffer
vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

-- Add `:OR` command for organize imports of the current buffer
vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})
