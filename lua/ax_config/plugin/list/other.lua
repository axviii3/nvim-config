-- other.lua
-- plugins which add functionality which is not related to text editing

return {
	-- hide sensitive stuff like tokens, keys, etc
	{
		"laytan/cloak.nvim",
		name = "cloak",
		opts = {
			cloak_character = "?",
			patterns = { config_options.cloak_patterns }
		}
	},

	-- wiki and markdown manager
	{
		"vimwiki/vimwiki",
		name = "vimwiki",
		init = function()
			vim.g.vimwiki_ext2syntax = nil;
			vim.g.vimwiki_global_ext = 0;
			vim.g.vimwiki_list = {
				{
					path = "/var/home/axviii3/wiki",
					syntax = "markdown",
					ext = ".md"
				}
			};
		end
	},

	-- live browser markdown file previewer
	{
		"iamcco/markdown-preview.nvim",
		name = "markdown_preview",
		build = config_options.is_yarn_installed and
				"cd app && yarn install" or
				function() vim.fn["mkdp#util#install"]() end,
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end
	}
};
