-- custom_commands.lua
-- custom user commands

_G.custom_commands = {};

local create_command = function(name, ...)
	local new_name = string.upper(config_options.custom_command_prefix) ..
					 name;
	custom_commands[name] = new_name;
	vim.api.nvim_create_user_command(new_name, ...);
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
	{}
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
	{}
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
	{}
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
	{}
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
	{}
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
	{}
);
