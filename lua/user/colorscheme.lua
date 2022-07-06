vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_keywords = false

vim.g.tokyodark_enable_italic = false
vim.g.tokyodark_enable_italic_comment = false

local colorscheme = "tokyodark"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
	return
end
