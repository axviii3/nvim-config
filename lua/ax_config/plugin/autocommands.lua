-- autocommands.lua
-- custom autocommands for plugins

local create_aucmd = vim.api.nvim_create_autocmd;

-- initiate plugin related stuff after the plugins are loaded
create_aucmd("VimEnter", {
	group = config_options.user_augroup_name,
	callback = function()
		require("ax_config.plugin.keymaps");
	end
});
