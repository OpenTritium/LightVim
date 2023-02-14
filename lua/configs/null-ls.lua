local nls = require "null-ls"
local sources = {
	nls.builtins.formatting.clang_format, nls.builtins.formatting.lua_format,
	nls.builtins.formatting.csharpier
}
local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = false })
local on_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function() vim.lsp.buf.format({ bufnr = bufnr }) end
		})
	end
end
nls.setup({ sources = sources, on_attach = on_attach })
