-- pre_configuration.lua
-- some setup before other config stuff can continue

-- colorscheme
vim.cmd.colorscheme("retrobox");

-- make the options file accessible globally
local is_custom_options_available = pcall(require, "custom_config_options");

if is_custom_options_available then
	_G.config_options = require("custom_config_options");
else
	_G.config_options = require("ax_config.default_config_options");
	end

-- create augroup for custom autocommands
vim.api.nvim_create_augroup(config_options.user_augroup_name, {
		clear = true
});

-- make keymap functions short and global
_G.map = function(mode, lhs, rhs, opts, search_term)                          -- adds additional parameters to make searching keymaps with telescope easier
	if opts and opts.desc and search_term then
		local desc = opts.desc;
		opts.desc = desc .. (" "):rep(61 - desc:len()) .. search_term;
	end

	vim.keymap.set(mode, lhs, rhs, opts);
end

_G.nmap = function(...)
	map("n", ...);
end

-- emulate actual key presses
_G.emulate_keys = function(keys, mode)
	vim.api.nvim_feedkeys(
		vim.api.nvim_replace_termcodes(keys, true, true, true),
		mode,
		false
	);
end
