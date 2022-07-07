local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

local servers = {
	"sumneko_lua",
	"cssls",
	"html",
	"tsserver",
	"pyright",
	"bashls",
	"jsonls",
	"yamlls",
	"gopls",
}

lsp_installer.setup()

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	if server == "sumneko_lua" then
		local sumneko_opts = require("user.lsp.settings.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

	if server == "pyright" then
		local pyright_opts = require("user.lsp.settings.pyright")
		opts = vim.tbl_deep_extend("force", pyright_opts, opts)
	end

	if server == "gopls" then
		require("go").setup({
			-- notify: use nvim-notify
			notify = false,
			-- auto commands
			auto_format = true,
			auto_lint = true,
			-- linters: revive, errcheck, staticcheck, golangci-lint
			linter = "revive",
			-- linter_flags: e.g., {revive = {'-config', '/path/to/config.yml'}}
			linter_flags = {},
			-- lint_prompt_style: qf (quickfix), vt (virtual text)
			lint_prompt_style = "qf",
			-- formatter: goimports, gofmt, gofumpt
			formatter = "goimports",
			-- test flags: -count=1 will disable cache
			test_flags = { "-v" },
			test_timeout = "30s",
			test_env = {},
			-- show test result with popup window
			test_popup = true,
			test_popup_auto_leave = false,
			test_popup_width = 80,
			test_popup_height = 10,
			-- test open
			test_open_cmd = "edit",
			-- struct tags
			tags_name = "json",
			tags_options = { "json=omitempty" },
			tags_transform = "snakecase",
			tags_flags = { "-skip-unexported" },
			-- quick type
			quick_type_flags = { "--just-types" },
		})
	end

	lspconfig[server].setup(opts)
end
