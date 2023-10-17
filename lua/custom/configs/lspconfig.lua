local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd", "pyright", "terraformls", "tflint", "gopls"}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
--[[
lspconfig["gopls"].setup {
   on_attach = on_attach,
   capabilities = capabilities,
   cmd = "/opt/homebrew/bin/gopls"
}
]]

lspconfig.pyright.setup { }
lspconfig.tflint.setup { }
lspconfig.terraformls.setup{ }
lspconfig.gopls.setup{ }
vim.api.nvim_create_autocmd({"BufWritePre"}, {
  pattern = {"*.tf", "*.tfvars"},
  callback = function()
    vim.lsp.buf.format()
  end,
})

vim.cmd([[let g:terraform_fmt_on_save=1]])
vim.cmd([[let g:terraform_align=1]])
