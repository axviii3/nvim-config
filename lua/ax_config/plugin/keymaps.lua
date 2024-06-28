-- keymaps.lua
-- keymaps for plugins

-- manager/lazy
nmap(
	"<leader>lz",
	"<cmd>Lazy<CR>",
	{ desc = "opens the lazy installer window" },
	"//plugin/lazy"
);

-- essentials/harpoon
local harpoon = require("harpoon");

nmap(
	"<leader>ha",
	function()
		harpoon:list():add();
	end,
	{ desc = "add file to harpoon list" },
	"//plugin/harpoon"
);
nmap(
	"<C-h>",
	function()
		harpoon.ui:toggle_quick_menu(harpoon:list());
	end,
	{ desc = "open harpoon list" },
	"//plugin/harpoon"
);

nmap(
	"<leader>1",
	function()
		harpoon:list():select(1);
	end,
	{ desc = "go to the first file in harpoon list" },
	"//plugin/harpoon"
);
nmap(
	"<leader>2",
	function()
		harpoon:list():select(2);
	end,
	{ desc = "go to the second file in harpoon list" },
	"//plugin/harpoon"
);
nmap(
	"<leader>3",
	function()
		harpoon:list():select(3);
	end,
	{ desc = "go to the third file in harpoon list" },
	"//plugin/harpoon"
);
nmap(
	"<leader>4",
	function()
		harpoon:list():select(4);
	end,
	{ desc = "go to the fourth file in harpoon list" },
	"//plugin/harpoon"
);
nmap(
	"<leader>5",
	function()
		harpoon:list():select(5);
	end,
	{ desc = "go to the fifth file in harpoon list" },
	"//plugin/harpoon"
);

nmap(
	"]h",
	function()
		harpoon:list():next();
	end,
	{ desc = "go to the next file in harpoon list" },
	"//plugin/harpoon"
);
nmap(
	"[h",
	function()
		harpoon:list():prev();
	end,
	{ desc = "go to the previous file in harpoon list" },
	"//plugin/harpoon"
);

-- essentials/telescope
local telescope_builtin = require("telescope.builtin");
nmap(
	"<leader>ff",
	function()
		telescope_builtin.find_files();
	end,
	{ desc = "fuzzy find through project files" },
	"//plugin/telescope"
);
nmap(
	"<leader>fo",
	function()
		telescope_builtin.oldfiles();
	end,
	{ desc = "fuzzy find through recent files" },
	"//plugin/telescope"
);
nmap(
	"<leader>fk",
	function()
		telescope_builtin.keymaps();
	end,
	{ desc = "fuzzy find through all keymaps" },
	"//plugin/telescope"
);
nmap(
	"<leader>fg",
	function()
		telescope_builtin.live_grep();
	end,
	{ desc = "fuzzy find through grep results live" },
	"//plugin/telescope"
);
nmap(
	"<leader>fb",
	function()
		telescope_builtin.buffers();
	end,
	{ desc = "fuzzy find through all open buffers" },
	"//plugin/telescope"
);
nmap(
	"<leader>fh",
	function()
		telescope_builtin.help_tags();
	end,
	{ desc = "fuzzy find through all help tags" },
	"//plugin/telescope"
);
nmap(
	"<leader>fc",
	function()
		telescope_builtin.commands();
	end,
	{ desc = "fuzzy find through all commands" },
	"//plugin/telescope"
);

-- dev_tools/mason
nmap(
	"<leader>mn",
	"<cmd>Mason<CR>",
	{ desc = "opens the mason installer window" },
	"//plugin/mason"
);

-- dev_tools/lspsaga
nmap(
	"<leader>ca",
	"<cmd>Lspsaga code_action<CR>",
	{ desc = "open code actions for diagnostics under cursor" },
	"//plugin/lspsaga"
);
nmap(
	"<leader>gd",
	"<cmd>Lspsaga goto_definition<CR>",
	{ desc = "goto the definition of the term under cursor" },
	"//plugin/lspsaga"
);
nmap(
	"<leader>gtd",
	"<cmd>Lspsaga goto_type_definition<CR>",
	{ desc = "goto the type definition of the term under cursor" },
	"//plugin/lspsaga"
);
nmap(
	"<leader>pd",
	"<cmd>Lspsaga peek_definition<CR>",
	{ desc = "peek the definition of the term under cursor" },
	"//plugin/lspsaga"
);
nmap(
	"<leader>ptd",
	"<cmd>Lspsaga peek_type_definition<CR>",
	{ desc = "peek the type definition of the term under cursor" },
	"//plugin/lspsaga"
);
nmap(
	"]d",
	"<cmd>Lspsaga diagnostic_jump_next<CR>",
	{ desc = "jump to the next diagnostic" },
	"//plugin/lspsaga"
);
nmap(
	"[d",
	"<cmd>Lspsaga diagnostic_jump_prev<CR>",
	{ desc = "jump to the previous diagnostic" },
	"//plugin/lspsaga"
);
map(
	{ "n", "t" },
	"<leader>tr",
	"<cmd>Lspsaga term_toggle<CR>",
	{ desc = "toggle terminal" },
	"//plugin/lspsaga"
);
nmap(
	"<C-k>",
	"<cmd>Lspsaga hover_doc<CR>",
	{ desc = "show the docs for the term under the cursor" },
	"//plugin/lspsaga"
);
nmap(
	"<leader>rn",
	"<cmd>Lspsaga rename<CR>",
	{ desc = "rename term under cursor using lsp" },
	"//plugin/lspsaga"
);

-- dev_tools/nvim_cmp
local cmp = require("cmp");
local luasnip = require("luasnip");

map(
	{ "i", "s" },
	"<C-k>",
	function()
		if cmp.visible_docs() then
			cmp.close_docs();
		elseif cmp.visible() then
			cmp.open_docs();
		else
			emulate_keys(vim.keycode("K"), "i");
		end
	end,
	{ desc = "toggle completion documentation window" },
	"//plugin/nvim_cmp"
);
map(
	{ "i", "s", "n" },
	"<C-f>",
	function()
		cmp.scroll_docs(-1);
	end,
	{ desc = "scroll down completion docs" },
	"//plugin/nvim_cmp"
);
map(
	{ "i", "s", "n" },
	"<C-b>",
	function()
		cmp.scroll_docs(1);
	end,
	{ desc = "scroll up completion docs" },
	"//plugin/nvim_cmp"
);
map(
	{ "i", "s" },
	"<Tab>",
	function()
		if cmp.visible() then
			cmp.select_next_item();
		elseif luasnip.expand_or_locally_jumpable() then
			luasnip.expand_or_jump();
		else
			emulate_keys(vim.keycode("<Tab>"), "ni");
		end
	end,
	{ desc = "select next completion suggestion" },
	"//plugin/nvim_cmp"

);
map(
	{ "i", "s" },
	"<S-Tab>",
	function()
		if cmp.visible() then
			cmp.select_prev_item();
		elseif luasnip.locally_jumpable(-1) then
			luasnip.jump(-1);
		else
			emulate_keys(vim.keycode("<S-Tab>"), "ni");
		end
	end,
	{ desc = "select previous completion suggestion" },
	"//plugin/nvim_cmp"

);
map(
	{ "i", "s" },
	"<CR>",
	function()
		if not cmp.visible() and not cmp.get_active_entry() then
			emulate_keys(vim.keycode("<CR>"), "ni");
			return;
		end

		if not cmp.confirm({ select = false }) then
			emulate_keys(vim.keycode("<CR>"), "ni");
		end
	end,
	{ desc = "pick selected completion suggestion" },
	"//plugin/nvim_cmp"

);

-- quality_of_life/todo_comment
nmap(
	"]t",
	function()
		require("todo-comments").jump_next();
	end,
	{ desc = "jump to the next todo comment" },
	"//plugin/todo_comments"
);
nmap(
	"[t",
	function()
		require("todo-comments").jump_prev();
	end,
	{ desc = "jump to the previous todo comment" },
	"//plugin/todo_comments"
);
nmap(
	"tl",
	"<cmd>TodoQuickFix<CR>",
	{ desc = "show all todo comments in project quick fix list" },
	"//plugin/todo_comments"
);

-- quality_of_life/comment
nmap(
	"<C-c>",
	"<Plug>(comment_toggle_linewise)",
	{ desc = "leader for linewise commenting motions" },
	"//plugin/comment"
);
nmap(
	"<C-x>",
	"<Plug>(comment_toggle_blockwise)",
	{ desc = "leader for blockwise commenting motions" },
	"//plugin/comment"
);

nmap(
	"<C-c><C-c>",
	function()
		return vim.api.nvim_get_vvar("count") == 0 and
		"<plug>(comment_toggle_linewise_current)" or
		"<plug>(comment_toggle_linewise_count)"
	end,
	{
		expr = true,
		desc = "toggle single line commenting of the line"
	},
	"//plugin/comment"
);
nmap(
	"<C-x><C-x>",
	function()
		return vim.api.nvim_get_vvar("count") == 0 and
		"<plug>(comment_toggle_blockwise_current)" or
		"<plug>(comment_toggle_blockwise_count)"
	end,
	{
		expr = true,
		desc = "toggle block commenting of the line"
	},
	"//plugin/comment"
);

map(
	"x",
	"<C-c><C-c>",
	"<Plug>(comment_toggle_linewise_visual)",
	{ desc = "toggle single line commenting selection" },
	"//plugin/comment"
);
map(
	"x",
	"<C-x><C-x>",
	"<Plug>(comment_toggle_blockwise_visual)",
	{ desc = "toggle block commenting selection" },
	"//plugin/comment"
);

-- quality_of_life/color_picker
nmap(
	"<leader>cp",
	"<cmd>CccPick<CR>",
	{ desc = "pick a color" },
	"//plugin/color_picker"
);
nmap(
	"<leader>ch",
	"<cmd>CccHighlighterToggle<CR>",
	{ desc = "toggle color highlighting" },
	"//plugin/color_picker"
);
nmap(
	"<leader>cc",
	"<cmd>CccConvert<CR>",
	{ desc = "convert color into other forms" },
	"//plugin/color_picker"
);

-- other/cloak
nmap(
	"<leader>ct",
	"<cmd>CloakToggle<CR>",
	{ desc = "toggle cloak hiding" },
	"//plugin/cloak"
);
nmap(
	"<leader>cp",
	"<cmd>CloakPreviewLine<CR>",
	{ desc = "preview the current line" },
	"//plugin/cloak"
);

-- other/vimwiki
nmap(
	"<leader>ww",
	"<Plug>VimwikiIndex",
	{ desc = "open the vimwiki index file" },
	"//plugin/vimwiki"
);
nmap(
	"<leader>wt",
	"<Plug>VimwikiTabIndex",
	{ desc = "open the vimwiki index file in a new tab" },
	"//plugin/vimwiki"
);
nmap(
	"<leader>ws",
	"<Plug>VimwikiUISelect",
	{ desc = "list and select from available wikis" },
	"//plugin/vimwiki"
);
nmap(
	"<leader>wd",
	"<Plug>VimwikiDeleteFile",
	{ desc = "delete the current vimwiki markdown file" },
	"//plugin/vimwiki"
);
nmap(
	"<leader>wr",
	"<Plug>VimwikiRenameFile",
	{ desc = "rename the current vimwiki markdown file" },
	"//plugin/vimwiki"
);
nmap(
	"<leader>wn",
	"<Plug>VimwikiGoto",
	{ desc = "goto or create new vimwiki markdown file" },
	"//plugin/vimwiki"
);

-- other/markdown_preview
nmap(
	"<leader>mp",
	"<cmd>MarkdownPreviewToggle<CR>",
	{ desc = "toggle markdown preview for the current markdown file" },
	"//plugin/markdown_preview"
);

-- essentials/telescope + quality_of_life/undotree
nmap(
	"fu",
	"<cmd>Telescope undo<CR>",
	{ desc = "show the undo history in a telescope picker" },
	"//plugin/telescope_undo/telescope"
);

-- essentials/telescope + quality_of_life/todo_comment
nmap(
	"tt",
	"<cmd>TodoTelescope<CR>",
	{ desc = "list all todo comments the project in a telescope picker" },
	"//plugin/todo_comments/telescope"
);
