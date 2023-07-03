-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer itself
    use 'wbthomason/packer.nvim'

    -- Highlighting Color
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Color Scheme
    use({
        'https://github.com/EdenEast/nightfox.nvim',
        as = 'nightfox',
        config = function()
            require("nightfox").setup()
            vim.cmd('colorscheme nightfox')
        end
    })

    -- Comment plugin
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    -- LSP config setup, order important
    use { "williamboman/mason.nvim" }
    use ( "williamboman/mason-lspconfig.nvim" )
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
            'williamboman/mason.nvim',
            run = function()
                pcall(vim.cmd, 'MasonUpdate')
            end,
        },
        -- Might be deprecated, maintainer gone
        -- {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},     -- Required
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'L3MON4D3/LuaSnip'},     -- Required
    }}

    -- Git
    use('lewis6991/gitsigns.nvim')
    use('tpope/vim-fugitive')

    -- Tree Setup
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }

    -- LSP
    require'lspconfig'.pyright.setup{}
    require'lspconfig'.gopls.setup{}
    
    -- Debugging
    use 'mfussenegger/nvim-dap'
    use 'leoluz/nvim-dap-go'
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
    use 'theHamsta/nvim-dap-virtual-text'
    use 'nvim-telescope/telescope-dap.nvim'
    require('telescope').load_extension('dap')

    -- Auto Align
    use 'echasnovski/mini.nvim'
    require('mini.align').setup()

    -- Auto pairs both sides with brackets
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
end)
