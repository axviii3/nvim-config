-- pre_configuration.lua
-- some setup before other config stuff can continue

-- make the options file accessible globally
local is_custom_options_available = pcall(require, "custom_options");

if is_custom_options_available then
	_G.config_options = require("custom_options");
else
	_G.config_options = require("ax_config.default_options");
end

-- create augroup for custom autocommands
vim.api.nvim_create_augroup(config_options.user_augroup_name, {
	clear = true
});

-- make keymap functions short and global
_G.map = vim.keymap.set;
_G.nmap = function(...)
	vim.keymap.set("n", ...);
end

-- emulate actual key presses
_G.emulate_keys = function(keys, mode)
	vim.api.nvim_feedkeys(
		vim.api.nvim_replace_termcodes(keys, true, true, true),
		mode,
		false
	);
end
