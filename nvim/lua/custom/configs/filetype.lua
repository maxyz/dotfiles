return {
    setup = function()
      require("core.utils").packer_lazy_load "filetype.nvim"
      require("filetype").setup({
        overrides = {
          complex = {
            ["[dD]ocker[fF]ile.*"] = "dockerfile",
          }
        }
      })
    end,
  }
