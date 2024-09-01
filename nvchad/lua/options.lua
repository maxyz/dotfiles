require "nvchad.options"

local opt = vim.opt
-- opt.title = true
opt.clipboard = ""

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
opt.guifont = "JetBrainsMono Nerd Font:h12"
vim.g.neovide_cursor_animation_length = 0
vim.g.neovide_scroll_animation_length = 0.05
if vim.g.neovide then
  -- vim.keymap.set('n', '<C-S-s>', ':w<CR>')      -- Save
  vim.keymap.set('v', '<C-S-c>', '"+y')         -- Copy
  vim.keymap.set('n', '<C-S-v>', '"+P')         -- Paste normal mode
  vim.keymap.set('v', '<C-S-v>', '"+P')         -- Paste visual mode
  vim.keymap.set('c', '<C-S-v>', '<C-R>+')      -- Paste command mode
  vim.keymap.set('i', '<C-S-v>', '<ESC>l"+Pli') -- Paste insert mode
  -- Allow clipboard copy paste in neovim
  vim.api.nvim_set_keymap('', '<C-S-v>', '+p<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('!', '<C-S-v>', '<C-R>+', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('t', '<C-S-v>', '<C-R>+', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('v', '<C-S-v>', '<C-R>+', { noremap = true, silent = true })
end

-- Add extra filetypes
vim.filetype.add {
  pattern = {
    ["[dD]ocker[fF]ile.*"] = "dockerfile",
  },
}
vim.filetype.add { extension = { purs = "purescript" } }

-- Do allow the python3 provider to load
vim.g.loaded_python3_provider = nil

-- Avoid showing the hiding the text with the output
vim.g.magma_automatically_open_output = false
vim.g.magma_image_provider = "ueberzug"

-- codeium in manual mode
vim.g.codeium_manual = true
-- Disable tab in codeium
vim.g.codeium_no_map_tab = false
