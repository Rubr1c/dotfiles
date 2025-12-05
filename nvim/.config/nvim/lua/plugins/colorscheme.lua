return {
  {
   "neanias/everforest-nvim",
   lazy = false,
   priority = 1000,
   config = function()
     require("everforest").setup({
       background = "medium",
       transparent_background_level = 0.5,
       italics = false,
       disable_italic_comments = false,
     })
     vim.cmd("colorscheme everforest")
    end,
  },
}
