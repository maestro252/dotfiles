-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--
banner_jony = { -- banner to add in lvims dashboard file
  "                                                     ",
  "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
  "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
  "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
  "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
  "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
  "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
  "                                                     ",
}

-- {{ Plugins }}
lvim.plugins = {
  {
    'gorbit99/codewindow.nvim',
    config = function()
      local codewindow = require('codewindow')
      codewindow.setup()
      codewindow.apply_default_keybinds()
    end,
  },
  -- Colorschemes
  {
    "Mofiqul/vscode.nvim"
  },
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
  },
  { "catppuccin/nvim",            name = "catppuccin", priority = 1000 },
  -- { 'rafi/awesome-vim-colorschemes' },
  { 'oxfist/night-owl.nvim' },
  -- { 'ribru17/bamboo.nvim' },
  { 'rebelot/kanagawa.nvim' },
  { 'folke/lsp-colors.nvim' },
  { 'Shatur/neovim-ayu' },
  -- { "joshdick/onedark.vim" },
  { 'navarasu/onedark.nvim' },
  { "sainnhe/sonokai" },
  { "Mofiqul/dracula.nvim" },
  { "projekt0n/github-nvim-theme" },
  { "NTBBloodbath/doom-one.nvim" },
  { "titanzero/zephyrium" },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  { 'sainnhe/gruvbox-material' },
  { 'EdenEast/nightfox.nvim' },
  { 'ishan9299/nvim-solarized-lua' },
  -- tmux navigator
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  -- Restore nvim session on tmux session resurrect
  {
    'rmagatti/auto-session',
    lazy = false,

    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
      -- log_level = 'debug',
    }
  },
  -- obsidian
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = false,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    --   "BufReadPre path/to/my-vault/**.md",
    --   "BufNewFile path/to/my-vault/**.md",
    -- },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",

      -- see below for full list of optional dependencies 👇
    },
    opts = {
      workspaces = {
        {
          name = "personal",
          path = "/mnt/c/Users/jonathan_eidelman/Documents/obsidian-vault/",
        },
      },
      note_id_func = function(title)
        -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
        -- In this case a note with the title 'My new note' will be given an ID that looks
        -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
        local suffix = ""
        if title ~= nil then
          -- If title is given, transform it into valid file name.
          suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
          suffix = 'Untitled'
        end
        return suffix
      end,
      attachments = {
        img_folder = "/mnt/c/Users/jonathan_eidelman/Documents/obsidian-vault/assets/imgs/"
      }

      -- see below for full list of options 👇
    },
  },
  -- scala
  {
    "scalameta/nvim-metals",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    ft = { "scala", "sbt", "java" },
    opts = function()
      local metals_config = require("metals").bare_config()
      metals_config.on_attach = function(client, bufnr)
        -- your on_attach function
      end

      return metals_config
    end,
    config = function(self, metals_config)
      local dap = require("dap")

      dap.configurations.scala = {
        {
          type = "scala",
          request = "launch",
          name = "RunOrTest",
          metals = {
            runType = "runOrTestFile",
            --args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
          },
        },
        {
          type = "scala",
          request = "launch",
          name = "Test Target",
          metals = {
            runType = "testTarget",
          },
        },
      }

      metals_config.on_attach = function(client, bufnr)
        require("metals").setup_dap()
      end

      local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = self.ft,
        callback = function()
          require("metals").initialize_or_attach(metals_config)
        end,
        group = nvim_metals_group,
      })
    end
  },
  -- Git
  { 'akinsho/git-conflict.nvim', version = "*", config = true },
  { 'sindrets/diffview.nvim' },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",  -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed, not both.
      "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua",              -- optional
    },
    config = true
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  },
  {
    'ThePrimeagen/git-worktree.nvim'
  },
  -- Scope to manage tabs and buffers independently
  {
    "tiagovla/scope.nvim",
    config = function()
      require("scope").setup({
      })
    end
  },
  {
    'dhruvasagar/vim-table-mode'
  },
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }
  },
  {
    'mbbill/undotree'
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },
  {
    'smoka7/hop.nvim',
    version = "*",
    opts = {},
  },
  {
    "booperlv/nvim-gomove",
  },
  {
    "AckslD/nvim-neoclip.lua",
  },
  {
    "szw/vim-maximizer"
  },
  {
    "sotte/presenting.nvim",
    opts = {
      -- fill in your options here
      -- see :help Presenting.config
    },
    cmd = { "Presenting" },
  },
  {
    "vhyrro/luarocks.nvim",
    priority = 1001, -- this plugin needs to run before anything else
    opts = {
      rocks = { "magick" },
    },
  },
  {
    "3rd/image.nvim",
    dependencies = { "luarocks.nvim" },
    config = function()
      -- ...
    end
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  {
    'anuvyklack/pretty-fold.nvim',
    config = function()
      require('pretty-fold').setup()
    end
  },
  {
    'anuvyklack/fold-preview.nvim',
    dependencies = { 'anuvyklack/keymap-amend.nvim' },
    config = function()
      require('fold-preview').setup({
        -- Your configuration goes here.
      })
    end
  },
  {
    'vim-scripts/restore_view.vim'
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "leoluz/nvim-dap-go",
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
      "williamboman/mason.nvim",
    },
    config = function()
      local dap = require "dap"
      local ui = require "dapui"

      require("dapui").setup()
      require("dap-go").setup()

      dap.adapters.debugpy = {
        type = 'executable',
        command = "python",
        args = { '-m', 'debugpy.adapter' },
      }

      dap.configurations.python = {
        {
          type = 'debugpy',
          request = 'launch',
          name = "Launch file",
          program = "${file}",
          pythonPath = 'python',
          cwd = "/"
        }
      }

      dap.listeners.before.attach.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        ui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        ui.close()
      end
    end,
  },
  -- Breadcrums
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "SmiteshP/nvim-navbuddy",
        dependencies = {
          "SmiteshP/nvim-navic",
          "MunifTanjim/nui.nvim"
        },
        opts = { lsp = { auto_attach = true } }
      }
    },
    -- your lsp config or other stuff
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    },
  },
  {
    'nvim-pack/nvim-spectre'
  },
  {
    'stevearc/aerial.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
  },
  {
    'jpalardy/vim-slime'
  },
  {
    'pappasam/nvim-repl'
  },
  {
    'sigmasd/deno-nvim'
  },
  {
    'ColaMint/pokemon.nvim'
  },
  {
    "tversteeg/registers.nvim",
    cmd = "Registers",
    config = true,
    keys = {
      { "\"",    mode = { "n", "v" } },
      { "<C-R>", mode = "i" }
    },
    name = "registers",
  },
  {
    "junegunn/vim-easy-align"
  }
}

vim.g.repl_filetype_commands = {
  bash = 'bash',
  javascript = 'node',
  python =
  'ipython --quiet --no-autoindent',
  sh = 'sh',
  vim = 'nvim --clean -ERM',
  zsh = 'zsh',
  julia = 'julia'
}
--   'ipython --quiet --no-autoindent',
-- {{ plugins }}

-- {{ UI and general configs }}
-- Set colorscheme
-- lvim.colorscheme = Favorites [catppuccin-macchiato, nightfox, everforest, ayu-mirage, night-owl, gruvbox-material, onedark]
vim.o.conceallevel = 1
lvim.colorscheme = 'everforest'
vim.o.background = 'dark'
-- Set lualine style
lvim.builtin.lualine.style = "default"
lvim.builtin.lualine.options.component_separators = ''
lvim.builtin.lualine.tabline = {
  lualine_a = { 'buffers' },
  lualine_b = {},
  lualine_c = {},
  lualine_x = {},
  lualine_y = {},
  lualine_z = { 'tabs' }
}
-- { left = '', right = '' }{ left = '', right = '' }
lvim.builtin.lualine.options.section_separators = { left = '', right = '' }
-- "slant" | "slope" | "thick" | "thin"
lvim.builtin.bufferline.options.separator_style = 'thin'
lvim.builtin.bufferline.options.show_tab_indicators = false
lvim.builtin.bufferline.options.always_show_bufferline = true
vim.o.textwidth = 0
vim.o.wrapmargin = 0
vim.o.wrap = true
vim.o.linebreak = true -- breaks by word rather than character
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.opt.relativenumber = true

vim.o.viewoptions = "cursor,folds,slash,unix"
vim.g.slime_target = "neovim"
-- {{ UI and general configs }}

-- {{ remaps and commands }}

-- Insert a cell block and leave you inside of it in insert mode
lvim.builtin.which_key.mappings["%"] = {
  "O# %%<esc><CR>O# %%<esc><CR><Up>i<CR><Up>", "Insert Code Cell",
}
-- Open Registers popup
lvim.builtin.which_key.mappings["R"] = {
  "<cmd>Registers<CR>", "[R]egisters",
}

-- Aerial

require("aerial").setup({
  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  on_attach = function(bufnr)
  end,
})
lvim.builtin.which_key.mappings["a"] = {
  "<cmd>AerialNavToggle<cr>", "Toggle [A]erial",
}

-- minimap / codewindow

lvim.builtin.which_key.mappings["mm"] = {
  "<cmd>lua require('codewindow').toggle_minimap()<cr>", "Toggle [M]inimap",
}


-- Hop
local hop = require('hop')
local directions = require('hop.hint').HintDirection
vim.keymap.set('', 'f',
  function()
    hop.hint_char1({
      direction = directions.AFTER_CURSOR,
      current_line_only = true
    })
  end,
  { remap = true }
)
vim.keymap.set('', 'F',
  function()
    hop.hint_char1({
      direction = directions.BEFORE_CURSOR,
      current_line_only = true
    })
  end,
  { remap = true }
)
vim.keymap.set('', 't',
  function()
    hop.hint_char1({
      direction = directions.AFTER_CURSOR,
      current_line_only = true,
      hint_offset = -1
    })
  end,
  { remap = true }
)
vim.keymap.set('', 'T',
  function()
    hop.hint_char1({
      direction = directions.BEFORE_CURSOR,
      current_line_only = true,
      hint_offset = 1
    })
  end,
  { remap = true }
)
vim.keymap.set('n', 'gw', '<cmd>HopWord<cr>', { desc = "HopWord" })

-- Spectre
lvim.builtin.which_key.mappings["S"] = {
  name = "[S]pectre",
  s = { '<cmd>lua require("spectre").toggle()<CR>', "Open [s]pectre" },
  w = { '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', "Current [w]ord" },
  f = { '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', "On current [f]ile" }
}

-- Diffview and git mappings
lvim.builtin.which_key.mappings["gF"] = {
  name = "Resolve con[f]licts",
  o = { "<cmd>GitConflictChooseOurs<CR>", "Choose [o]urs" },
  t = { "<cmd>GitConflictChooseTheirs<CR>", "Choose [t]heirs" },
  b = { "<cmd>GitConflictChooseBoth<CR>", "Choose [b]oth" },
  n = { "<cmd>GitConflictChooseNone<CR>", "Choose [n]either" },
  N = { "<cmd>GitConflictNextConflict<CR>", "[N]ext conflict" },
  P = { "<cmd>GitConflictPrevConflict<CR>", "[P]revious conflict" },
  q = { "<cmd>GitConflictListQf<CR>", "All conflicts to [Q]uick fix" }
}
lvim.builtin.which_key.mappings["gv"] = {
  name = "DiffView",
  o = { "<cmd>DiffviewOpen<CR>", "DiffView Open" },
  c = { "<cmd>DiffviewClose<CR>", "DiffView Close" },
  h = { "<cmd>DiffviewFileHistory<CR>", "DiffView file history" }
}
lvim.builtin.which_key.mappings["gf"] = {
  name = "Fugitive",
  s = { "<cmd>:Git<CR>", "Fugitive status" }
}
lvim.builtin.which_key.mappings["gn"] = {
  "<cmd>:Neogit<CR>", "Neogit"
}
lvim.builtin.which_key.mappings["gw"] = {
  "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", "switch [w]orktree"
}
lvim.builtin.which_key.mappings["gt"] = {
  "<cmd>Gitsigns toggle_current_line_blame<cr>", "Current line blame"
}
lvim.builtin.which_key.mappings["gg"] = {
  "<cmd>LazyGit<cr>", "Lazy[G]it"
}
-- Maximizer
lvim.builtin.which_key.mappings["x"] = {
  "<cmd>MaximizerToggle<cr>", "Toggle Maximize"
}

-- Undotree
lvim.builtin.which_key.mappings["u"] = {
  "<cmd>UndotreeToggle<cr>", "Toggle Undotree"
}

-- Window movement mappings to have them available on which key menu
lvim.builtin.which_key.mappings["m"] = {
  name = "Move",
  ["<Up>"] = { "<C-w><Up>", "Go up" },
  ["<Down>"] = { "<C-w><Down>", "Go down" },
  ["<Left>"] = { "<C-w><Left>", "Go left" },
  ["<Right>"] = { "<C-w><Right>", "Go right" },
  ["k"] = { "<C-w><Up>", "Go up" },
  ["j"] = { "<C-w><Down>", "Go down" },
  ["h"] = { "<C-w><Left>", "Go left" },
  ["l"] = { "<C-w><Right>", "Go right" }
}

-- Obsidian

-- Execute lines in V-terminal
lvim.builtin.which_key.mappings["r"] = {
  name = " Run",
  -- l = {
  --   function() require('nvim-python-repl').send_statement_definition() end, "Execute Statement"
  -- },
  l = {
    '<Plug>ReplSendLine', 'Repl execute current [l]ine'
  },
  c = {
    '<Plug>ReplSendCell', "Repl execute [c]ell"
  },
  t = {
    '<cmd>ReplToggle<CR>', "Repl [t]oggle"
  },
}

lvim.builtin.which_key.vmappings["r"] = {
  v = {
    '<Plug>ReplSendVisual', 'Repl execute [v]isual lines'
  },
}

-- LSP mappings
lvim.builtin.which_key.mappings["lb"] = {
  name = "Definition & References",
  d = {
    "<cmd>Telescope lsp_definitions<cr>", "Go to definition",
  },
  r = {
    "<cmd>Telescope lsp_references<cr>", "Go to references",
  },
  s = {
    "<cmd>Telescope lsp_document_symbols<cr>", "Show symbols",
  },
}

-- Telescope search
local builtin = require 'telescope.builtin'
lvim.builtin.which_key.mappings["s/"] = {
  function()
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
      winblend = 10,
      previewer = false
    })
  end, "Search current file"
}

-- Tablemode and todos
lvim.builtin.which_key.mappings["t"] = {
  name = 'Table Mode and todo\'s',
  s = {
    "<cmd>TodoTelescope<cr>", "Open todo's in telescope"
  },
  m = {
    "<cmd>TableModeToggle<cr>", "Toggle table mode"
  },
}

-- Oil
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- {{ remaps and commands }}

-- {{ Plugins setup }}

-- {{ todo comments setup }}
require("todo-comments").setup()
-- {{ todo comments setup }}

-- {{ noice setup }}
require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
  },
  presets = {
    bottom_search = false,        -- use a classic bottom cmdline for search
    command_palette = true,       -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = true,            -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false,       -- add a border to hover docs and signature help
  },
  routes = {
    {
      view = "notify",
      filter = { event = "msg_showmode" },
    },
  },
})
-- {{ noice setup }}

-- {{ gomove setup }}
require("gomove").setup {
  map_defaults = true,
  reindent = true,
  undojoin = true,
  move_past_end_col = false,
}
-- {{ gomove setup }}

-- {{ neoclip setup }}
require("neoclip").setup()
require('telescope').load_extension('neoclip')
-- {{ neoclip setup }}

-- {{ Plugins setup }}

-- {{ disable ruff hover }}
require("lvim.lsp.manager").setup("ruff_lsp")
local on_attach = function(client, bufnr)
  -- Disable hover in favor of Pyright
  client.server_capabilities.hoverProvider = false
end
-- {{ use ruff-lsp for python diagnostics }}
require('lspconfig').ruff_lsp.setup {
  on_attach = on_attach,
}

-- {{ Disable pyright for diagnostics, but keep hover on }}
require("lvim.lsp.manager").setup('pyright', {
  settings = {
    pyright = {
      disableOrganizeImports = true, -- Using Ruff
    },
    python = {
      analysis = {
        ignore = { '*' },         -- Using Ruff
        typeCheckingMode = 'off', -- Using mypy
      },
    },
  },
})

require('lspconfig').lua_ls.setup {
  on_attach = on_attach,
  -- single_file_support = false,
}

require("scope").setup({})

require("telescope").load_extension("git_worktree")

lvim.format_on_save.enabled = true
