-- custom_config_options.lua
-- options seperated for ease of changes

return {
	-- setup config
	user_augroup_name = "ax_augroup",
	custom_command_prefix = "ax",
	undo_files_dir = vim.fn.stdpath("cache") .. "/undofiles",

	-- options config
	intial_colorcolumn = "78",
	initial_expand_tabs = false,
	initial_tab_length = 4,

	-- plugin config
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
