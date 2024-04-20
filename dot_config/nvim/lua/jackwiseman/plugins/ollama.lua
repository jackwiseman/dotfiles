return {
	"nomnivore/ollama.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		'stevearc/dressing.nvim',
	},
	cmd = { "Ollama", "OllamaModel", "OllamaServe", "OllamaServeStop" },
	keys = {
		{
			"<leader>ll",
			":Ollama<CR>",
			desc = "o[ll]ama prompt",
			mode = { "n", "v" },
		},
	},
	opts = {
		model = "llama3:8b",
		url = "https://ollama.wiseman.sh",
		prompts = {
			Context_aware_generate = {
				prompt = "given the file $fname of contents $buf, $input\nReturn ONLY the new code that has been added. Do not include the entire file in your response and return in this format: ```$ftype```",
				model = "llama3:8b",
				action = "insert",
				extract = "```$ftype\n(.-)```"
			},
			Ask_about_file = {
				prompt = "given the file $fname of contents $buf, $input",
				model = "llama3:8b",
				action = "display",
			}
		}
	}
}
