# Code Docs
## Last updated 28.6.24

### [init.lua](./../lua/ax_config/init.lua)
Initiates all other configuration files and if `enable_plugins` is true then 
initiate package manager and plugin autocommands

### [core/pre_configuration.lua](./../lua/ax_config/core/pre_configuration.lua)
* Sets colorscheme
* Loads configuration options to a global table
* Creates custom augroup for creating aucommands
* Sets global keymap methods
* Sets global key press emulatin method

### [core/custom_commands.lua](./../lua/ax_config/core/custom_commands.lua)
* Sets commands for Netrw Toggling
* Sets commands for Substitutions
* Sets commands for Live Option Changes (changing some vim options on the go)

### [core/statusline.lua](./../lua/ax_config/core/statusline.lua)
* Set highlightgroups
* Create components for statusline like filepath, position, mode, diagnostics
* Create the status line format table

### [core/neovim_options.lua](./../lua/ax_config/core/neovim_options.lua)
* Set core neovim options mainly `vim.opt.*` but also `vim.o.statusline` and 
`vim.g.netrw_winsize`

### [core/neovim_keymaps.lua](./../lua/ax_config/core/neovim_keymaps.lua)
* Set keymaps related to core neovim and custom commands

### [core/autocommands.lua](./../lua/ax_config/core/autocommands.lua)
* Create autocommand for turning colorcolumn of in netrw and help filetypes
* Create autocommand for highlighting text after yanking

### [plugin/manager.lua](./../lua/ax_config/plugin/manager.lua)
* Install (if not already) and bootsrap lazy.nvim

### [plugin/autocommands.lua](./../lua/ax_config/plugin/autocommands.lua)
* Initiate plugin keymaps on "VimEnter" event when all plugins have been 
loaded

### [plugin/keymaps.lua](./../lua/ax_config/plugin/keymaps.lua)
* Set keymaps related to plugins and plugin commands

### [plugin/list/aesthetics.lua](./../lua/ax_config/plugin/list/aesthetics)
* Plugins affecting the visual appearence of neovim

### [plugin/list/dev_tools.lua](./../lua/ax_config/plugin/list/dev_tools)
* Plugins which aid in development and code writing like lsps, completion, 
etc

### [plugin/list/essentials.lua](./../lua/ax_config/plugin/list/essentials)
* Plugins which are essential for a great neovim experience and I would 
rather not not have

### [plugin/list/other.lua](./../lua/ax_config/plugin/list/other)
* Plugins which do not directly affect neovim's tasks and text editing but 
provide some pretty cool functionality

### [plugin/list/quality_of_life.lua.lua](./../lua/ax_config/plugin/list/quality_of_life.lua)
* Plugins which improve the quality of life of using neovim but I'll survive 
without

### plugin/config/*
* Configuration for some plugins in `plugin/list/*` which have grow too BIG 
and would be better to seperate in a different file
