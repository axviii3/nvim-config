-- aesthetics.lua
-- plugins which improve the look and feel of neovim visually

return {
	-- my own color scheme
	{
		"axviii3/axtro_nvim",
		name = "axtro",
		priority = 1000,
		opts = {
			should = {
				auto_apply_colors = true,
				use_custom_statusline = true,
				enable_ending_tildes = true
			},
			statusline = {
				mode_strings = config_options.mode_strings
			}
		}
	},

	-- adds icons to netrw
	{
		"prichrd/netrw.nvim",
		name = "netrw",
		dependencies = { "devicons" },
		config = function()
			require("netrw").setup();
		end
	},

	-- icons set used by other plugins
	{
		"nvim-tree/nvim-web-devicons",
		name = "devicons",
		priority = 500,                                                       -- second highest priority
		otps = {}
	}
};
