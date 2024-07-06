return {
	"lervag/vimtex",
	init = function()
		-- Use init for configuration, don't use the more common "config".

		vim.g.vimtex_view_general_viewer = "SumatraPDF.exe"
		vim.g.vimtex_view_general_options = "-reuse-instance -forward-search @tex @line @pdf"

		vim.g.vimtex_compiler_latexmk = {
			aux_dir = "build",
			out_dir = "out",
		}
		-- vim.o.conceallevel = 1
	end,
}
