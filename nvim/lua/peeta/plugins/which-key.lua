return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "classic",
		delay = 300,
		plugins = {
			marks = true,
			registers = true,
			presets = {
				operators = true, -- d, c, y, ...
				motions = true,
				text_objects = true, -- i / a after an operator
				windows = true,
				nav = true,
				z = true,
				g = true,
			},
		},
		triggers = {
			{ "<auto>", mode = "nixsotc" },
		},
		spec = {
			{ "<leader>f", group = "find" },
			{ "<leader>p", group = "project" },
			{ "<leader>h", group = "git hunks", mode = { "n", "v" } },
			{ "<leader>t", group = "toggle" },
			{ "<leader>c", group = "code" },
			{ "<leader>b", group = "buffer" },
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer-local keymaps",
		},
	},
}
