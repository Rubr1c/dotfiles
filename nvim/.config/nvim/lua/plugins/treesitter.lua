return {
  {
   "nvim-treesitter/nvim-treesitter",
   build = ":TSUpdate",
   config = function()
     require("nvim-treesitter.configs").setup({
       ensure_installed = {
	 "lua", "python", "javascript", "tsx", "json", "html", "css", "bash", "c", "cpp", "rust", "go"
       },
       highlight = {
	 enable = true,
       },
       indent = {
	 enable = true,
       },
     })
     end
  }
}
