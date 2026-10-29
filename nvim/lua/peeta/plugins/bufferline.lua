local keys = {
	{ "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
	{ "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous buffer" },
	{ "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "Pin buffer" },
	{ "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Close other buffers" },
	{ "<leader>bd", "<cmd>bdelete<cr>", desc = "Close buffer" },
	{ "<leader>bb", "<cmd>BufferLinePick<cr>", desc = "Pick buffer" },
}

-- Czech keyboard: unshifted number row, in order 1..9
local czech_row = { "+", "ě", "š", "č", "ř", "ž", "ý", "á", "í" }

local function go_to(i)
	return function()
		require("bufferline").go_to(i, true)
	end
end

for i = 1, 9 do
	-- plain digits (US layout, or Czech with shift) and the Czech unshifted number row
	for _, key in ipairs({ tostring(i), czech_row[i] }) do
		table.insert(keys, {
			"<leader>" .. key,
			go_to(i),
			desc = "Go to buffer " .. i,
		})
	end
end

return {
	"akinsho/bufferline.nvim",
	version = "*",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = keys,
	opts = {
		options = {
			mode = "buffers",
			numbers = "ordinal",
			diagnostics = "nvim_lsp",
			always_show_bufferline = true,
			separator_style = "thin",
			show_buffer_close_icons = false,
			show_close_icon = false,
			offsets = {
				{
					filetype = "netrw",
					text = "File Explorer",
					text_align = "left",
				},
			},
		},
	},
}
