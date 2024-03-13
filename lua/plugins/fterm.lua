return {
	"numToStr/FTerm.nvim",
	event = "VeryLazy",
	config = function()
		vim.keymap.set("n", "<A-i>", '<CMD>lua require("FTerm").toggle()<CR>')
		vim.keymap.set("t", "<A-i>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
	end,
}
