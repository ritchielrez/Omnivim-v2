local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require("telescope.actions")

telescope.setup({
	defaults = {
		layout_config = {
			width = 0.75,
			prompt_position = "top",
			preview_cutoff = 120,
			horizontal = { mirror = false },
			vertical = { mirror = false },
		},

		prompt_prefix = " ",
		selection_caret = " ",
		entry_prefix = " ",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "flex",
		path_display = { "truncate" },
		winblend = 0,
		border = {},
		borderchars = { "", "", "", "", "", "", "", "" },
		file_ignore_patterns = { ".git/", "node_modules" },

		color_devicons = true,
		set_env = { ["COLORTERM"] = "truecolor" },

		mappings = {
			i = {
				["<Down>"] = actions.cycle_history_next,
				["<Up>"] = actions.cycle_history_prev,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
        ["<ESC>"] = actions.close,
			},
		},
	},
})
