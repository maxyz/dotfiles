local M = {}

local enhance_server_opts = {
  pyright = function (opts)
    opts.settings = {
      python = {
        analysis = {
          useLibraryCodeForTypes = true
        },
      },
    }
  end,
}


M.setup_lsp = function(attach, capabilities)
  local lsp_installer = require("nvim-lsp-installer")

  lsp_installer.settings {
    ui = {
      icons = {
	server_installed = "✓",
	server_pending = "",
	server_uninstalled = "✗",
      },
    },
  }

  lsp_installer.on_server_ready(function(server)
    local opts = {
      on_attach = attach,
      capabilities = capabilities,
      flags = {
	debounce_text_changes = 150,
      },
      settings = {},
    }
    if enhance_server_opts[server.name] then
      -- Tweak opts
      enhance_server_opts[server.name](opts)
    end

    server:setup(opts)
    vim.cmd [[ do User LspAttachBuffers ]]
  end)
end

return M
