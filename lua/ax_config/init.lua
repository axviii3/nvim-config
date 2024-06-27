-- init.lua
-- entry point to my config, decides order of execution

require("ax_config.core.pre_configuration");
require("ax_config.core.custom_commands");
require("ax_config.core.neovim_options");
require("ax_config.core.neovim_keymaps");
require("ax_config.core.autocommands");

require("ax_config.plugin.manager");
require("ax_config.plugin.autocommands");
