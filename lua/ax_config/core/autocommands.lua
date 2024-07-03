-- autocommands.lua
-- custom autocommands

local create_aucmd = vim.api.nvim_create_autocmd;

-- disable color column in some file types
create_aucmd("FileType", {
	pattern = { "netrw", "help" },
	group = config_options.user_augroup_name,
	callback = function()
		vim.opt_local.colorcolumn = "0";
	end
});

-- highlight text after yank
create_aucmd("TextYankPost", {
	group = config_options.user_augroup_name,
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 500
		});
	end
});

-- save and load views (to save folding states)
create_aucmd({ "BufLeave", "BufWrite", "BufWinLeave", "BufDelete" }, {
	group = config_options.user_augroup_name,
	command = "silent! mkview"
});
create_aucmd({ "BufEnter" }, {
	group = config_options.user_augroup_name,
	command = "silent! loadview"
});
