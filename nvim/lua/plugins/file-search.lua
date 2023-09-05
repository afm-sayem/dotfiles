return  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      pickers = {
        find_files = {
          theme = "ivy",
        },
        live_grep = {
          theme = "ivy"
        }
      }
    }
  }

