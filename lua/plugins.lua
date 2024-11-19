vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
      -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use "rebelot/kanagawa.nvim"
    use ('Tsuzat/NeoSolarized.nvim')
    use ("folke/tokyonight.nvim")
    use ('vim-airline/vim-airline')
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use('nvim-treesitter/nvim-treesitter')
    use('tpope/vim-fugitive')
    use('lewis6991/gitsigns.nvim')
    use { "catppuccin/nvim", as = "catppuccin" }
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }
    use { "ellisonleao/gruvbox.nvim" }

    use('hrsh7th/nvim-cmp')
    use('hrsh7th/cmp-nvim-lsp') 
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment these if you want to manage LSP servers from neovim
            -- {'williamboman/mason.nvim'},
            -- {'williamboman/mason-lspconfig.nvim'},

            -- LSP Support
            {'neovim/nvim-lspconfig'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        }
    }
    use 'ThePrimeagen/vim-be-good'
    use 'Omnisharp/omnisharp-vim'
    use 'EdenEast/nightfox.nvim'
end)

