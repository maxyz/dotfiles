require "nvchad.options"

local opt = vim.opt
opt.title = true

-- Spell check
opt.spelllang = "en_gb"
-- unimpaired yos to toggle
-- set spelllang=en_us | set spelllang=es_ar | set spelllang=de_de
-- ]s : next |  [s : prev | z= suggestions | zg ignore | zw add
-- set dictionary+=/usr/share/dict/words
-- dictionary completion (^x^k), sadly it loads the dictionary on startup.

-- A somewhat better list of invisible chars
opt.listchars = "tab:▸ ,trail:Ξ,extends:>,precedes:<,nbsp:␠,eol:¶,space:·"

-- status line takes care of showing the current mode
opt.showmode = false

-- Open new splits at the bottom, or to the right
opt.splitbelow = true
opt.splitright = true

-- autocompletion of files and commands behave like shell
-- (complete only the common part, list the options that match)
opt.wildmode = "list:longest"

-- Default font for nvim gui
opt.guifont = "SauceCodePro Nerd Font Mono:h12"

-- Add extra filetypes
vim.filetype.add {
  pattern = {
    ["[dD]ocker[fF]ile.*"] = "dockerfile",
  },
}

-- Do allow the python3 provider to load
vim.g.loaded_python3_provider = nil

-- Avoid showing the hiding the text with the output
vim.g.magma_automatically_open_output = false
vim.g.magma_image_provider = "ueberzug"

-- codeium in manual mode
vim.g.codeium_manual = true
-- Disable tab in codeium
vim.g.codeium_no_map_tab = false
