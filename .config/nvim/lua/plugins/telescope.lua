--telescope config
return {
{
  'nvim-telescope/telescope.nvim', 
  tag = '0.1.6',
  dependencies = { 'nvim-lua/plenary.nvim',
                    'BurntSushi/ripgrep',
                    'sharkdp/fd',
                    'nvim-treesitter/nvim-treesitter',
                    'nvim-tree/nvim-web-devicons',
                  },  
  config = function()
    local builtin = require('telescope.builtin')
    -- keymaps:telescope
    vim.keymap.set('n', '<C-p>', builtin.find_files, {})
    vim.keymap.set('n', '<C-o>', builtin.live_grep, {})
  end
},
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require("telescope").load_extension("noice")
      require("telescope").setup ({
        extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
          },
        ["ui-select"] = {
        require("telescope.themes").get_dropdown {},
          }
        }
      })
    require("telescope").load_extension("ui-select", "fzf")
  end
  },
}
