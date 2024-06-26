vim.api.nvim_set_hl(0, "Statusline", { bg = "#1C1C1C" });
vim.api.nvim_set_hl(0, "StatuslineNC", { bg = "#1C1C1C" });
vim.api.nvim_set_hl(0, "StatuslineTerm", { bg = "#1C1C1C" });
vim.api.nvim_set_hl(0, "StatuslineTermNC", { bg = "#1C1C1C" });

_G.statusline = {};
_G.statusline.components = {}

_G.statusline.components.filename = function()
	return ("%%#%s#%s%%*"):format("Directory", " %t ");
end

_G.statusline.components.position = function()
	return ("%%#%s#%s%%*"):format("Search","  %l:%-c ~ %2p%%  ");
end

_G.statusline.components.mode = function()
	local mode = vim.fn.mode(" ");
	local mode_name = config_options.mode_names[mode];
	mode_name = mode_name and mode_name or "  " .. mode .. "  ";
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
	"%r", "%w", "%h", "%m", "%=",
	"%{%v:lua.statusline.components.filename()%}",
	"%{%v:lua.statusline.components.position()%}"
};
