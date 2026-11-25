return {
  "salkin-mada/openscad.nvim",
  config = function()
    vim.g.openscad_load_snippets = true
    require("openscad")
    vim.g.openscad_default_mappings = true
    vim.g.openscad_auto_open = false
  end,
  dependencies = {
    "ibhagwan/fzf-lua",
    "L3MON4D3/LuaSnip", -- optional
  },
}
