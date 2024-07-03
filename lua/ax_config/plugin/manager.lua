-- manager.lua
-- bootstrap and initialize lazy

local lazy_plugin_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim";
local is_lazy_installed = (vim.uv or vim.loop).fs_stat(lazy_plugin_path);
local lazy_download_command = {
	"git", "clone", "--filter=blob:none",
	"https://github.com/folke/lazy.nvim.git",
	"--branch=stable", lazy_plugin_path
};

-- download (if not already) and register lazy to runtime paths
if not is_lazy_installed then
	vim.fn.system(lazy_download_command);
end
vim.opt.rtp:prepend(lazy_plugin_path);

-- configure lazy
require("lazy").setup("ax_config.plugin.list", {
	checker = {
		enabled = true,                                                       -- check for plugin updates
		notify = false                                                        -- but don't notify
	},
	install = {
		colorscheme = {                                                       -- try to use preferred colorscheme
			"retrobox"
		}
	},
	change_detection = {
		notify = false                                                        -- don't notify on config changes
	}
});
