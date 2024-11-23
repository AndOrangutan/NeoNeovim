local _M = {}

_M.border = {
	-- {"🭽", "FloatBorder"},
	-- {"▔", "FloatBorder"},
	-- {"🭾", "FloatBorder"},
	-- {"▕", "FloatBorder"},
	-- {"🭿", "FloatBorder"},
	-- {"▁", "FloatBorder"},
	-- {"🭼", "FloatBorder"},
	-- {"▏", "FloatBorder"},
	{" ", "FloatBorder"},
	{" ", "FloatBorder"},
	{" ", "FloatBorder"},
	{" ", "FloatBorder"},
	{" ", "FloatBorder"},
	{" ", "FloatBorder"},
	{" ", "FloatBorder"},
	{" ", "FloatBorder"},
}


-- lsp[<server-name>] = { '<lspconfig-name>' }
_M.lspconfig_to_lsp_name = {
    ['lua-language-server'] = "lua_ls",
    ['nil'] = "nil_ls",
}

_M.ft_gitcommit = {
    "gitcommit",
    "NeogitCommitMessage",
}

return _M
