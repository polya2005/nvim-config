return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-mini/mini.icons",
	},
	ft = { "markdown" },
	opts = {},
	config = function(_, opts)
		require("nvim-treesitter").install({
			"markdown",
			"markdown_inline",
		})
		require("render-markdown").setup(opts)
	end,
}
