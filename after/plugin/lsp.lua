local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({buffer = bufnr})
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

end)

require('mason').setup({})


require('mason-lspconfig').setup({
        ensure_installed = {'pylsp', 'tsserver', 'omnisharp'}
    })

require('lspconfig').pylsp.setup({
    settings = {
        pylsp = {
            plugins = {
                pylint = { enabled = false },
                pyflakes = { enabled = false },
                pycodestyle = { enabled = false },
                mccabe = {enabled = false}
            }
        }
    }
})

require('lspconfig').tsserver.setup({
    settings = {
        completions = {
            completeFunctionCalls = { true }
        }
    }
})

require('lspconfig').cssls.setup{
    cmd = {"vscode-css-language-server", "--stdio"}
}

require('lspconfig').html.setup{
    cmd = {"vscode-html-language-server", "--stdio"}
}

require('lspconfig').gopls.setup{
}

local omnisharp_bin = "C:/Users/arezz/AppData/Local/omnisharp-vim/omnisharp-roslyn/OmniSharp"
local pid = vim.fn.getpid()

require('lspconfig').omnisharp.setup({
    cmd = {omnisharp_bin, "--languageserver", "--hostPID", tostring(pid), "--loglevel=debug"}, 
    on_attach = lsp_zero.on_attach,
    capabilities = lsp_zero.capabilities,
    on_init = function(client)
        print("OmniSharp started with client id: " .. client.id)
    end,
    on_error = function(err)
        print("Error starting OmniSharp: " .. err)
    end,
    on_exit = function(code, signal, client_id)
        print("OmniSharp exited with code: " .. code .. " and signal: " .. signal)
    end,

})
