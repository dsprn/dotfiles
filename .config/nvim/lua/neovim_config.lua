-- --- PACKER CONFIG ---
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
end
vim.api.nvim_command("packadd packer.nvim")
require('packer').startup({
    function(use)
        -- Packer can manage itself
        use{'wbthomason/packer.nvim'}
		use{'base16-project/base16-vim'}
		use{'terrortylor/nvim-comment'}
        use{'Olical/conjure'}
        use{'nvim-treesitter/nvim-treesitter'}
        if packer_bootstrap then
            require("packer").sync()
        end
    end,
    config = {
        profile = {
            enable = true,
            threshold = 1, -- the amount in ms that a plugins load time must be over for it to be included in the profile
        },
    },
})

-- --- TREESITTER CONFIG ---
-- treesitter expand region/selection settings
require('nvim-treesitter.configs').setup({
    ensure_installed = "all",
    highlight = {
        -- enable = false,
        enable = true,
        -- additional_vim_regex_highlighting = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<M-=>",
            node_incremental = "<M-=>",
            node_decremental = "<M-->",
        },
    },
    yati = { enable = true },
})

-- --- COMMENT PLUGIN CONFIG ---
require('nvim_comment').setup()
