-- aesthetics.lua
-- plugins which improve the look and feel of neovim visually

return {
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
