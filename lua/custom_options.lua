-- custom_options.lua
-- options seperated for ease of changes

return {
	user_augroup_name = "ax_augroup",
	custom_command_prefix = "ax",
	undo_files_dir = vim.fn.stdpath("cache") .. "/undofiles",
	cloak_patterns = {
		file_pattern = {
			"*.env",
			".env*",
			"*secret*.json"
		},
		cloak_pattern = {
			"=.+",
			":.+"
		},
		replace = nil
	},
	lsp_setup = {
		lua_ls = {
			settings = {
				Lua = {
					callSnippet = "Replace"
				}
			}
		},
		tsserver = {}
	}
};
