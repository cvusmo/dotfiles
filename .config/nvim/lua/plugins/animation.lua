-- ~/.config/nvim/lua/plugins/animation.lua

return {
  {
		"echasnovski/mini.animate",
		event = "VeryLazy",
		opts = function(_, opts)
			opts.scroll = {
				enable = false,
			}	
		end,
  },
}
