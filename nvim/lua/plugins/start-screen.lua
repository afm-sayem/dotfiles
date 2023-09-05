-----------------------------------------------------------
-- Dashboard configuration file
-----------------------------------------------------------

-- Plugin: alpha-nvim
-- https://github.com/goolord/alpha-nvim


return {
    'goolord/alpha-nvim',
    event = "VimEnter",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require'alpha'.setup(require'alpha.themes.startify'.opts)
    end,
}

