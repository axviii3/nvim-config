vim.api.nvim_set_hl(0, "Statusline", { bg = "#1B1B1B" });
vim.api.nvim_set_hl(0, "StatuslineNC", { bg = "#1B1B1B" });
vim.api.nvim_set_hl(0, "StatuslineTerm", { bg = "#1B1B1B" });
vim.api.nvim_set_hl(0, "StatuslineTermNC", { bg = "#1B1B1B" });

_G.statusline = {};
_G.statusline.components = {}

_G.statusline.components.filepath = function()
	return ("%%#%s#%s%%*"):format("Directory", " %<%f ");
end

_G.statusline.components.position = function()
	return ("%%#%s#%s%%*"):format("Search"," %3l:%-3c~ %2p%%  ");
end

_G.statusline.components.mode = function()
	local mode = vim.fn.mode(" ");
	local mode_name = config_options.mode_names[mode];
	mode_name = mode_name and mode_name or " " .. mode .. " ";
	return ("%%#%s#%s%%*"):format("IncSearch", mode_name);
end

_G.statusline.components.warnings = function()
	local count = vim.diagnostic.count()[vim.diagnostic.severity.WARN];
	count = count and " " .. count .. " " or "";
	return ("%%#%s#%s%%*"):format("DiffText", count);
end

_G.statusline.components.errors = function()
	local count = vim.diagnostic.count()[vim.diagnostic.severity.ERROR];
	count = count and " " .. count .. " " or "";
	return ("%%#%s#%s%%*"):format("ErrorMsg", count);
end

_G.statusline.format = {
	"%{%v:lua.statusline.components.mode()%}",
	"%{%v:lua.statusline.components.warnings()%}",
	"%{%v:lua.statusline.components.errors()%}",
	"%r", "%h", "%m", "%=",
	"%{%v:lua.statusline.components.filepath()%}",
	"%{%v:lua.statusline.components.position()%}"
};
