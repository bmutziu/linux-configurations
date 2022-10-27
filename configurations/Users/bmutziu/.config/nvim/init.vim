" --- General 

let mapleader = ";"

set termguicolors
set tabstop=4 
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set numberwidth=1
set relativenumber
set signcolumn=yes
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set nohlsearch
set ignorecase
set smartcase
set nowrap
set scrolloff=999
set noshowmode
set updatetime=250 
set encoding=UTF-8

" Options
set clipboard=unnamedplus " Enables the clipboard between Vim/Neovim and other applications.
" set completeopt=noinsert,menuone,noselect " Modifies the auto-complete menu to behave more like an IDE.
set cursorline " Highlights the current line in the editor
set hidden " Hide unused buffers
set autoindent " Indent a new line
set inccommand=split " Show replacements in a split screen
set mouse=a " Allow to use the mouse in the editor
set number " Shows the line numbers
set splitbelow splitright " Change the split screen behavior
set title " Show file title
set wildmenu " Show a more advance menu
set cc=80 " Show at 80 column a border for good code style
filetype plugin indent on   " Allow auto-indenting depending on file type
syntax on
set spell " enable spell check (may need to download language package)
set ttyfast " Speed up scrolling in Vim
set foldmethod=expr "nvim-treesitter folding
set foldexpr=nvim_treesitter#foldexpr()
set foldlevelstart=20

call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'

" Indent Blankline
Plug 'lukas-reineke/indent-blankline.nvim'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Lsp
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'm-demare/hlargs.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'

" Diagnostics
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'

" Autocompletion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'petertriho/cmp-git'

Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'onsails/lspkind-nvim'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

Plug 'j-hui/fidget.nvim'
Plug 'kosayoda/nvim-lightbulb'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'weilbith/nvim-code-action-menu'

" Git
Plug 'pwntester/octo.nvim'

Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'nvim-telescope/telescope-dap.nvim'
Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make' } " float term, codeaction and codelens gui support
Plug 'ray-x/navigator.lua'

Plug 'ray-x/go.nvim'
Plug 'ray-x/aurora'

" Terraform + HCL
Plug 'hashivim/vim-terraform'

" TabNine
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }

" CoPilot
Plug 'github/copilot.vim'
Plug 'zbirenbaum/copilot.lua'
Plug 'zbirenbaum/copilot-cmp'

" Initialize plugin system
call plug#end()

lua require('bmutziu')

" --- Colors
let g:aurora_italic = 1
let g:aurora_bold = 1
colorscheme aurora

let g:bargreybars_auto=0
let g:airline_solorized_bg='dark'
let g:airline_powerline_fonts=1
let g:airline#extension#tabline#enable=1
let g:airline#extension#tabline#left_sep=' '
let g:airline#extension#tabline#left_alt_sep='|'
let g:airline#extension#tabline#formatter='unique_tail'
let NERDTreeQuitOnOpen=1

" Terraform + HCL
let g:terraform_align=1
let g:terraform_fmt_on_save=1
let g:terraform_fold_sections=1

nnoremap <C-q> :q!<CR>
nnoremap <leader>bd :bd<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <F15> :sp<CR>:terminal<CR>

" Tabs
nnoremap <S-Tab> gT
nnoremap <Tab> gt
nnoremap <silent> <S-t> :tabnew<CR>

" ------------------------------------
" j-hui/fidget.nvim
" ------------------------------------
"
lua require("fidget").setup()

" ------------------------------------
" kosayoda/nvim-lightbulb
" ------------------------------------
"
autocmd CursorHold,CursorHoldI * lua require('nvim-lightbulb').update_lightbulb()

" ------------------------------------
" weilbith/nvim-code-action-menu
" ------------------------------------
"
let g:code_action_menu_window_border = 'single'

" ------------------------------------
" folke/trouble.nvim
" ------------------------------------
"
lua require("trouble").setup()

autocmd FileType go map <buffer> <leader>p :call append(".", "fmt.Printf(\"%+v\\n\", )")<CR> <bar> :norm $a<CR><esc>j==$i
autocmd FileType go map <buffer> <leader>e :call append(".", "if err != nil {return err}")<CR> <bar> :w<CR>
autocmd BufWritePre *.go :silent! lua require('go.format').goimport()
autocmd BufWritePost *.go :cex system('revive '..expand('%:p')) | cwindow

lua <<EOF

require('nvim-treesitter.configs').setup {
  ensure_installed = { "bash", "c", "cmake", "css", "dockerfile", "go", "gomod", "gowork", "hcl", "help", "html", "http", "javascript", "json", "lua", "make", "markdown", "python", "regex", "ruby", "rust", "toml", "vim", "yaml", "zig" },
  highlight = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
  incremental_selection = {
    enable = enable,
    keymaps = {
      -- mappings for incremental selection (visual mappings)
      init_selection = "gnn", -- maps in normal mode to init the node/scope selection
      node_incremental = "grn", -- increment to the upper named parent
      scope_incremental = "grc", -- increment to the upper scope (as defined in locals.scm)
      node_decremental = "grm", -- decrement to the previous node
    }
  },
  textobjects = {
	-- syntax-aware textobjects
	enable = true,
	lsp_interop = {
	  enable = true,
	  peek_definition_code = {
	    ["<leader>df"] = "@function.outer",
		["<leader>dF"] = "@class.outer"
	  }
	},
    keymaps = {
      -- or you use the queries from supported languages with textobjects.scm
      ["af"] = "@function.outer",
      ["if"] = "@function.inner",
      ["aC"] = "@class.outer",
      ["iC"] = "@class.inner",
      ["ac"] = "@conditional.outer",
      ["ic"] = "@conditional.inner",
      ["ae"] = "@block.outer",
      ["ie"] = "@block.inner",
      ["al"] = "@loop.outer",
      ["il"] = "@loop.inner",
      ["is"] = "@statement.inner",
      ["as"] = "@statement.outer",
      ["ad"] = "@comment.outer",
      ["am"] = "@call.outer",
      ["im"] = "@call.inner"
    },
    move = {
      enable = enable,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]O"] = "@class.outer"
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer"
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer"
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer"
      }
    },
    select = {
      enable = true,
      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      }
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>xp"] = "@parameter.inner"
      },
      swap_previous = {
        ["<leader>xP"] = "@parameter.inner"
      }
    },
  },
}

require('hlargs').setup()

EOF

" lukas-reineke/indent-blankline.nvim
lua <<EOF

require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
}

EOF

lua <<EOF

local protocol = require'vim.lsp.protocol'

require 'go'.setup({
  gopls_cmd = {"/Users/bmutziu/go/bin/gopls", "-logfile","/Users/bmutziu/.local/state/nvim/gopls.log", "-rpc.trace"},
  goimport = 'gopls', -- if set to 'gopls' will use golsp format
  gofmt = 'gopls', -- if set to gopls will use golsp format
  max_line_len = 120,
  tag_transform = false,
  test_dir = '',
  comment_placeholder = '   ',
--  lsp_cfg = {settings={gopls={analyses={unusedparams = true,unusedwrite = true,useany = true,nilness = true,unreachable = false,shadow = true}}}}, -- false: use your own lspconfig
  lsp_cfg = true,
  lsp_gofumpt = true, -- true: set default gofmt in gopls format to gofumpt
  lsp_on_attach = true, -- use on_attach from go.nvim
  lsp_inlay_hints = {
    enable = true,

    -- Only show inlay hints for the current line
    only_current_line = false,

    -- Event which triggers a refresh of the inlay hints.
    -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
    -- not that this may cause higher CPU usage.
    -- This option is only respected when only_current_line and
    -- autoSetHints both are true.
    only_current_line_autocmd = "CursorHold",

    -- whether to show variable name before type hints with the inlay hints or not
    -- default: false
    show_variable_name = true,

    -- prefix for parameter hints
    parameter_hints_prefix = " ",
    show_parameter_hints = true,

    -- prefix for all the other hints (type, chaining)
    other_hints_prefix = "=> ",

    -- whether to align to the length of the longest line in the file
    max_len_align = false,

    -- padding from the left if max_len_align is true
    max_len_align_padding = 1,

    -- whether to align to the extreme right or not
    right_align = false,

    -- padding from the right if right_align is true
    right_align_padding = 6,

    -- The color of the hints
    highlight = "Comment",
  },
  dap_debug = true,
  dap_debug_keymap = true,
  dap_debug_gui = true,
  dap_debug_vt = true,
  lsp_codelens = false, -- use navigator
  verbose = true,
  log_path = "/tmp/gonvim.log",
})

vim.lsp.set_log_level("debug")

require'navigator'.setup({
  lsp={
    disable_lsp = {'gopls', 'yamlls'},
  }
})

EOF
