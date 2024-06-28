local cmp = require("cmp");

cmp.setup({
	view = {
		docs = {
			auto_open = false
		}
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body);
		end
	},
	sources = cmp.config.sources({
		{
			name = "lazydev"
		}
	}, {
		{
			name = "nvim_lsp"
		},
		{
			name = "luasnip"
		},
	}, {
		{
			name = "path"
		},
		{
			name = "buffer"
		}
	})
});

cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{
			name = "buffer"
		}
	}
});

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{
			name = "path"
		},
	}, {
		{
			name = "cmdline",
			options = {
				ignore_cmds = {
					"Man", "!"
				}
			}
		}
	})
});
