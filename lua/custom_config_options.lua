-- custom_config_options.lua
-- options seperated for ease of changes

return {
	-- setup config
	user_augroup_name = "ax_augroup",
	custom_command_prefix = "ax",
	undo_files_dir = vim.fn.stdpath("cache") .. "/undofiles",

	-- options config
	mode_names = {
		["n"] = " normal ",
		["niI"] = " insert [normal] ",
		["niR"] = " replace [normal] ",
		["nt"] = " terminal [normal] ",
		["i"] = " insert ",
		["R"] = " replace ",
		["v"] = " visual ",
		["V"] = " visual [line] ",
		[""] = " visual [block] ",
		["c"] = " command ",
		["!"] = " command [external]",
		["t"] = " terminal "
		-- ["nov"] = " Operator-pending (forced charwise |o_v|) "
		-- ["noV"] = " Operator-pending (forced linewise |o_V|) "
		-- ["no"] = " Operator-pending (forced blockwise |o_CTRL-V|) "
		-- ["no"] = " Operator-pending "
		-- ["r?"] = " A |:confirm| query of some sort "
		-- ["vs"] = " Visual by character using |v_CTRL-O| in Select mode "
		-- ["niV"] = " Normal using |i_CTRL-O| in |Virtual-Replace-mode| "
		-- ["ntT"] = " Normal using |t_CTRL-_CTRL-O| in |Terminal-mode| "
		-- ["Vs"] = " Visual by line using |v_CTRL-O| in Select mode "
		-- ["s"] = " Visual blockwise using |v_CTRL-O| in Select mode "
		-- ["s"] = " Select by character "
		-- ["S"] = " Select by line "
		-- [""] = " Select blockwise "
		-- ["ic"] = " Insert mode completion |compl-generic| "
		-- ["ix"] = " Insert mode |i_CTRL-X| completion "
		-- ["Rc"] = " Replace mode completion |compl-generic| "
		-- ["Rx"] = " Replace mode |i_CTRL-X| completion "
		-- ["Rv"] = " Virtual Replace |gR| "
		-- ["Rvc"] = " Virtual Replace mode completion |compl-generic| "
		-- ["Rvx"] = " Virtual Replace mode |i_CTRL-X| completion "
		-- ["cr"] = " Command-line editing overstrike mode |c_<Insert>| "
		-- ["cv"] = " Vim Ex mode |gQ| "
		-- ["cvr"] = " Vim Ex mode while in overstrike mode |c_<Insert>| "
		-- ["r"] = " Hit-enter prompt "
		-- ["rm"] = " The -- more -- prompt "
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
