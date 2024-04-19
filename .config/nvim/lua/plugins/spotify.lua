return {
  "Z3rio/spotify.nvim",

  config = function()
    require("spotify").setup({
      debug = false,
      clientId = "",
      clientSecret = ""
    })
  end,

  lazy = false
}
