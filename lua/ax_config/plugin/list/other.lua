-- other.lua
-- plugins which add functionality which is not related to text editing

return {
	-- hide sensitive stuff like tokens, keys, etc
	{
		"laytan/cloak.nvim",
		name = "cloak",
		opts = {
			cloack_character = "",
			patterns = config_options.cloak_patterns
		}
	}
};
