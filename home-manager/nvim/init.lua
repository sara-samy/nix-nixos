local vim = vim
local opt = vim.opt
local api = vim.api

-- Set theme
vim.cmd('colorscheme tokyonight-moon')
-- Set airline theme
vim.g.airline_theme = 'deus'
-- Airline configuration
vim.g.airline_powerline_fonts = 1
vim.g.webdevicons_enable_airline_tabline = 1

-- Buffer navigation using Alt+Arrows
api.nvim_set_keymap('n', '<A-Up>', '<C-w>k', { noremap = true })
api.nvim_set_keymap('n', '<A-Down>', '<C-w>j', { noremap = true })
api.nvim_set_keymap('n', '<A-Left>', '<C-w>h', { noremap = true })
api.nvim_set_keymap('n', '<A-Right>', '<C-w>l', { noremap = true })

-- Indent line
require("ibl").setup {}

-- Hex code colorizer
require('colorizer').setup {}

-- Scroll bar
require("scrollbar").setup {}
require("scrollbar.handlers.gitsigns").setup {}

-- mini.nvim modules
-- animation
require('mini.animate').setup {
    -- Window open
    open = { enable = false },
    -- Cursor path
    cursor = { enable = true },
    -- Vertical scroll
    scroll = { enable = true },
    -- Window resize
    resize = { enable = true },
    -- Window close
    close = { enable = false }
}
-- tabline
require('mini.tabline').setup {
  show_icons = true,
  set_vim_settings = true,
  tabpage_section = 'left',
}

-- Setup hlslens
require('hlslens').setup()
local kopts = {noremap = true, silent = true}
api.nvim_set_keymap('n', 'n',
    [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts)
api.nvim_set_keymap('n', 'N',
    [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts)
api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)
api.nvim_set_keymap('n', '<Leader>l', '<Cmd>noh<CR>', kopts)

-- Autopairs
require("nvim-autopairs").setup {
    map_cr=false
}

-- Boolean toggle
require('boole').setup({
  mappings = {
    increment = '<C-a>',
    decrement = '<C-x>'
    }
  })

-- Icons, lua fork of vim-devicons
require'nvim-web-devicons'.setup {
 color_icons = true;
 default = true;
 strict = true;
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    cterm_color = "65",
    name = "Zsh"
  }
 };
 -- same as `override` but specifically for overrides by filename
 -- takes effect when `strict` is true
 override_by_filename = {
  [".gitignore"] = {
    icon = "",
    color = "#f1502f",
    name = "Gitignore"
  }
 };
 override_by_extension = {
  ["log"] = {
    icon = "",
    color = "#81e043",
    name = "Log"
  },
 };
}

-- Telescope main config
require('telescope').setup {
  pickers = {
     find_files = {
         path_display = { "truncate" }
    }
  },
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--hidden'
    },
    mappings = {
        i = {
            ["<Esc>"] = require('telescope.actions').close
        },
    },
    extensions = {
        coc = {
            theme = 'ivy',
            prefer_locations = true,
        }
    },
    color_devicons = true,
    prompt_prefix = '🔭 ',
    scroll_strategy = 'cycle',
    sorting_strategy = 'ascending',
    layout_strategy = 'flex',
    file_ignore_patterns = { '.git' },
    layout_config = {
      prompt_position = 'top',
      horizontal = {
        mirror = true,
        preview_cutoff = 100,
        preview_width = 0.5,
      },
      vertical = {
        mirror = true,
        preview_cutoff = 0.4,
      },
      flex = {
        flip_columns = 110,
      },
      height = 0.94,
      width = 0.86,
    },
  },
}

-- Load and setup fuzzy finder
require('telescope').load_extension('fzf')
require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    }
  }
}

-- Load file browser
require('telescope').load_extension('file_browser')

-- Load coc search
require('telescope').load_extension('coc')

-- Load aerial
require("telescope").load_extension("aerial")

-- Define keymappings
-- Defined also in init.vim
api.nvim_set_keymap('n', 'fc', '<cmd>Telescope coc<cr>', { noremap = true, silent = true })
api.nvim_set_keymap('n', 'fk', '<cmd>Telescope keymaps<cr>', { noremap = true, silent = true })
api.nvim_set_keymap('n', 'fs', '<cmd>Telescope aerial<cr>', { noremap = true, silent = true })
api.nvim_set_keymap('n', 'fb', '<cmd>Telescope file_browser<cr>', { noremap = true, silent = true })

-- Treesitter
require("nvim-treesitter.configs").setup {
  sync_install = false,
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "latex" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  autopairs = {
    enable = false,
  },
  indent = {
    enable = false,
  },
  rainbow = {
    enable = false,
  }
}

-- Set up folding with treesitter
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Configure Treesitter text objects
require'nvim-treesitter.configs'.setup {
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["ak"] = "@conditional.outer",
        ["ik"] = "@conditional.inner",
        ["ap"] = "@parameter.outer",
        ["ip"] = "@parameter.inner",
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["at"] = "@comment.outer",
        ["aC"] = "@class.outer",
        ["iC"] = "@class.inner",
        ["ab"] = "@block.outer",
        ["ib"] = "@block.inner",
        ["al"] = "@loop.outer",
        ["il"] = "@loop.inner"
      },
    },
  },
}
-- Configure Treesitter playground
require "nvim-treesitter.configs".setup {
  playground = {
    enable = true,
    disable = {},
    updatetime = 25,
    persist_queries = false,
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  }
}

-- Configure aerial
require("aerial").setup({
  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
    vim.keymap.set("n", "<C-p>", "<cmd>AerialPrev<CR>", { buffer = bufnr })
    vim.keymap.set("n", "<C-n>", "<cmd>AerialNext<CR>", { buffer = bufnr })
  end,
  backends = { "treesitter", "lsp", "markdown", "man" },
  layout = {
    max_width = { 40, 0.2 },
    width = nil,
    min_width = 10,
    win_opts = {},
    -- Enum: prefer_right, prefer_left, right, left, float
    default_direction = "left",
    placement = "window",
    resize_to_content = true,
    preserve_equality = false,
  },
})

-- Configure gitsigns
require("gitsigns").setup {}
