-- Some additional plugins

return {
  {
    "williamboman/nvim-lsp-installer",
    config = function()
      local function on_attach(_, bufnr)
        local function buf_set_option(...)
          vim.api.nvim_buf_set_option(bufnr, ...)
        end

        -- Enable completion triggered by <c-x><c-o>
        buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

        require("core.mappings").lspconfig()
      end

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown", "plaintext" }
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      capabilities.textDocument.completion.completionItem.preselectSupport = true
      capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
      capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
      capabilities.textDocument.completion.completionItem.deprecatedSupport = true
      capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
      capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
      capabilities.textDocument.completion.completionItem.resolveSupport = {
        properties = {
          "documentation",
          "detail",
          "additionalTextEdits",
        },
      }

      local lsp_installer = require("nvim-lsp-installer")

      lsp_installer.settings {
        ui = {
          icons = {
            server_installed = "﫟",
            server_pending = "",
            server_uninstalled = "✗",
          },
        },
      }

      lsp_installer.on_server_ready(function(server)
        local opts = {
          on_attach = on_attach,
          capabilities = capabilities,
          flags = {
            debounce_text_changes = 150,
          },
          settings = {},
        }
        -- basic example to edit lsp server's options, disabling tsserver's inbuilt formatter
        -- if server.name == 'tsserver' then
        -- opts.on_attach = function(client, bufnr)
          -- client.resolved_capabilities.document_formatting = false
          -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", {})
          -- end
          -- end

          server:setup(opts)
          vim.cmd [[ do User LspAttachBuffers ]]
        end)
    end,
  },
  { "jose-elias-alvarez/null-ls.nvim",
    after = { "nvim-lspconfig", "plenary.nvim" },
    setup = function ()
      require("custom.configs.null-ls").setup()
    end,
    requires = { "plenary.nvim" },
  },
  { "tpope/vim-abolish" },
  { "tpope/vim-repeat" },
  { "tpope/vim-surround" },
  { "tpope/vim-unimpaired" },
  { "lambdalisue/suda.vim" },
  { "dstein64/nvim-scrollview" },
  { "sjl/gundo.vim",
    setup = function()
      vim.g.gundo_prefer_python3 = 1
    end,
  },
  { "towolf/vim-helm" },
}
