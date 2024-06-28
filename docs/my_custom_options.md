# My Personal Custom Options
### Last update 28.06.24

```lua
-- custom_config_options.lua
-- options seperated for ease of changes

return {
	-- setup config
	user_augroup_name = "ax_augroup",
	custom_command_prefix = "ax",
	undo_files_dir = vim.fn.stdpath("cache") .. "/undofiles",
	enable_plugins = true,

	-- options config
	mode_names = {
		["n"] = "  normal  ",
		["niI"] = "  insert [normal]  ",
		["niR"] = "  replace [normal]  ",
		["nt"] = "  terminal [normal]  ",
		["i"] = "  insert  ",
		["R"] = "  replace  ",
		["v"] = "  visual  ",
		["V"] = "  visual [line]  ",
		[""] = "  visual [block]  ",
		["c"] = "  command  ",
		["!"] = "  command [external]  ",
		["t"] = "  terminal  "
	},
	intial_colorcolumn = "78",
	initial_expand_tabs = false,
	initial_tab_length = 4,

	-- plugin config
	lsp_setup = {
		lua_ls = {
			settings = {
				Lua = {
					callSnippet = "Replace"
				}
			}
		},
		tsserver = {}
	},
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
	is_yarn_installed = true
};

```
