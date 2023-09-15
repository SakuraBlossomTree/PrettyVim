local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
  return
end

return packer.startup(function(use)
    
    use("wbthomason/packer.nvim") -- packer itself

    use("nvim-lua/plenary.nvim") -- lua functions that many plugins use

    use("nvim-tree/nvim-web-devicons") -- icons for file explorer

    use("MunifTanjim/nui.nvim")

    use("catppuccin/nvim") -- colorscheme

    -- essential plugins

    use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)

    use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion)

    use("numToStr/Comment.nvim") -- commenting with gc

    use("ojroques/nvim-hardline") -- statusline

    -- startup

    use {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
                -- config
            }
        end,
    }

    use("nvim-telescope/telescope.nvim") -- telescope

    -- autocompletion

    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")

    require('cmp').setup({
        sources = {
            { name = 'orgmode' }
        }
    })

    -- snippets
   
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    use("rafamadriz/friendly-snippets")

    -- managing & installing lsp servers

    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")

    -- configuring lsp servers

    use("neovim/nvim-lspconfig")
    use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
    use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
    use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
    use("onsails/lspkind.nvim")

    use { 'gen740/SmoothCursor.nvim',
        config = function()
            require('smoothcursor').setup()
        end
    }

    use("m4xshen/autoclose.nvim")

    use("dstein64/nvim-scrollview")

    use("ray-x/web-tools.nvim")

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        highlight = {

            enable = true,

            additional_vim_regex_highlighting = { "markdown" }

        }
    }

    require('nvim-treesitter.configs').setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop,
  -- highlighting will fallback to default Vim syntax highlighting
        highlight = {
            enable = true,
            -- Required for spellcheck, some LaTex highlights and
            -- code block highlights that do not have ts grammar
            additional_vim_regex_highlighting = {'org'},
        },
        ensure_installed = {'org'}, -- Or run :TSUpdate org
    }

    use('andweeb/presence.nvim')

    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end}

    -- install without yarn or npm
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = { 
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            }
        }

    require('orgmode').setup_ts_grammar()

    use {'nvim-orgmode/orgmode', config = function()
            require('orgmode').setup{}
        
        end
        }

    require('orgmode').setup({
            org_agenda_files = {'~/my-orgs/**/*'},
            org_default_notes_file = '~/my-orgs/note.org',
        })

    if packer_bootstrap then
        require("packer").sync()
    end

end)
