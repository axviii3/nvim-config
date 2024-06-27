-- custom_commands.lua
-- custom user commands

_G.custom_commands = {};

local create_command = function(name, command, opts)
	local new_name = string.upper(config_options.custom_command_prefix) ..
					 name;
	custom_commands[name] = new_name;

	local desc = opts.desc;
	if opts and desc then
		opts.desc = desc .. (" "):rep(61 - desc:len()) .. "//custom/core";
	end

	vim.api.nvim_create_user_command(new_name, command, opts);
end

-- netrw
local is_netrw_open_sidebar = false;

create_command(
	"NetrwSidebarToggle",                                                     -- toggle sidebar file explorer
	function()
		if vim.bo.filetype == "netrw" and not is_netrw_open_sidebar then
			return;
		end

		if not is_netrw_open_sidebar then
			vim.g.netrw_banner = 0;                                           -- disable banner to remove clutter in small sidebar
			vim.g.netrw_liststyle = 3;                                        -- use a tree format to display files
			vim.cmd("Lexplore %:p:h");                                        -- %:p:h for current directory
		else
			vim.cmd("Lexplore");
			vim.g.netrw_banner = 1;                                           -- re-enable banner
			vim.g.netrw_liststyle = 0;                                        -- use default layout for files
			vim.g.netrw_chgwin = -1;                                          -- lex changes this and doesn't reset it causing ex to act up (bug fix?)
		end
		is_netrw_open_sidebar = not is_netrw_open_sidebar;
	end,
	{ desc = "open the netrw sidebar" }
);

create_command(
	"NetrwFullToggle",                                                        -- toggle fullscreen file explorer
	function()
		if is_netrw_open_sidebar then
			vim.cmd(custom_commands.NetrwFullToggle);                         -- close (toggle) sidebar if open
		end

		if vim.bo.filetype == "netrw" then
			vim.cmd("Rexplore");                                              -- this toggles netrw but doesn't support %:p:h and hence is only used in closing
		else
			vim.cmd("Explore %:p:h");                                         -- %:p:h for current directory
		end
	end,
	{ desc = "open the netrw fullscreen explorer" }
);

-- substitutions
create_command(
	"SubstituteWordQuick",                                                    -- subsitute all instances of the word under the cursor
	function()                                                                -- only substitutes the word if it is by itself
		vim.ui.input(
			{ prompt = "Enter the substitution: " },
			function(input)
				if not input or input == "" then
					return;
				end

				emulate_keys(
					":%s/\\<<C-r><C-w>\\>/" .. input .. "/gI<CR>",
					"n"
				);
			end
		);
	end,
	{ desc = "substitute standalone occurences of word under cursor" }
);

create_command(
	"SubstituteWord",                                                         -- substitute all instances of the word inputted
	function()
		vim.ui.input(
			{ prompt = "Enter the target: " },
			function(target)
				if not target or target == "" then
					return;
				end

				vim.ui.input(
					{ prompt = "Enter the substitution: " },
					function(substitution)
						if not substitution or substitution == "" then
							return;
						end

						emulate_keys(
							":%s/\\<" .. target .. "\\>/" .. substitution ..
							"/gI<CR>",
							"n"
						);
					end
				);
			end
		);
	end,
	{ desc = "substitute standalone occurences of inputted word" }
);

create_command(
	"SubstituteCharsQuick",                                                   -- substitute all instances of the sequence of characters under cursor
	function()                                                                -- substitutes the sequence even if it is surrounded by other characters
		vim.ui.input(
			{ prompt = "Enter the substitution: " },
			function(input)
				if not input or input == "" then
					return;
				end

				emulate_keys(
					":%s/<C-r><C-w>/" .. input .. "/gI<CR>",
					"n"
				);
			end
		);
	end,
	{ desc = "substitute occurences of character sequence under cursor" }
);


create_command(
	"SubstituteChars",                                                        -- substitute all instances of the sequence of characters inputted
	function()
		vim.ui.input(
			{ prompt = "Enter the target: " },
			function(target)
				if not target or target == "" then
					return;
				end

				vim.ui.input(
					{ prompt = "Enter the substitution: " },
					function(substitution)
						if not substitution or substitution == "" then
							return;
						end

						emulate_keys(
							":%s/" .. target .. "/" .. substitution ..
							"/gI<CR>",
							"n"
						);
					end
				);
			end
		);
	end,
	{ desc = "substitute occurences of character sequence inputted" }
);

-- live options replacing
create_command(
	"ChangeColorColumn",
	function()
		vim.ui.input(
			{ prompt = "Enter color column value: " },
			function(input)
				if not input or not input:match("^%-?%d+$") then              -- match statement checks if the input string is a number or not
					return;
				end

				vim.opt.colorcolumn = input;
			end
		);
	end,
	{ desc = "change the color column position" }
);
create_command(
	"ChangeIndentation",
	function()
		vim.ui.select(
			{ "tabs", "spaces" },
			{ prompt = "What style of indentation do you prefer: " },
			function(indentation_style)
				if not indentation_style then
					return;
				end
				vim.ui.input(
					{ prompt = "\r\n\nEnter tab length: " },
					function(tab_len)
						if not tab_len or not tab_len:match("^%-?%d+$") then  -- match statement checks if the input string is a number or not
							return;
						end

						if vim.opt.expandtab._value then                      -- if previous indentation style was spaces
							vim.opt.expandtab = false;                        -- then convert spaces to tabs
							vim.cmd(
								"%s/\\(^\\s*\\)\\@<="
								---@diagnostic disable-next-line: undefined-field
								.. (" "):rep(vim.opt.tabstop._value)          -- NOTE : we substitute instead of using the retab command as the command also
								.. "/	/g",                                  -- replaces inline spaces to tabs
								{ mods = { silent = true } }                  -- this regex was taken from https://stackoverflow.com/a/35050756
							);
							emulate_keys("<C-o>zz", "n");
						end

						vim.opt.tabstop = tonumber(tab_len);                  -- now adjust the indentation length (tabs will automatically do this)

						if indentation_style == "spaces" then                 -- indentation style is already tabs so only if required indentation style is
							vim.opt.expandtab = true;                        -- spaces then convert spaces to tabs
							vim.cmd(
								"%s/\\(^\\s*\\)\\@<=	/"
								---@diagnostic disable-next-line: undefined-field
								.. (" "):rep(vim.opt.tabstop._value)          -- NOTE : we substitute instead of using the retab command as the command also
								.. "/g",                                      -- replaces inline tabs to spaces
								{ mods = { silent = true } }
							);
							emulate_keys("<C-o>zz", "n");
						end
					end
				);
			end
		);
	end,
	{ desc = "change indentation style and tab length" }
);
