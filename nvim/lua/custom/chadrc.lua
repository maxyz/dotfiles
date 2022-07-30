local M = {}

local userPlugins = require("custom.plugins")

M.options = {
}

M.plugins = {
  override = {
    [ "hrsh7th/nvim-cmp" ] = function()
      return require("custom.configs.cmp")
    end,
    [ "kyazdani42/nvim-tree.lua" ] = function()
      return require("custom.configs.nvim_tree")
    end,
    [ "williamboman/mason.nvim" ] = function()
      return require("custom.configs.mason")
    end,
  },
  user = userPlugins,
}

M.ui = {
  theme_toggle = { "mountain", "one_light" },
  theme = "mountain",
}

M.mappings = require("custom.mappings")

return M
