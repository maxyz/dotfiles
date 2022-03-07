-- MAPPINGS
local map = require("core.utils").map

-- undo tree but better
map("n", "<F6>", "<cmd>GundoToggle<CR>")

-- find current file in tree
map("n", "<leader>f", "<cmd>NvimTreeFindFile<CR>")

-- List all things telescope
map("n", "<leader>cc", ":Telescope <CR>")
map("n", "<leader>q", ":q <CR>")

-- Don't use Ex mode, use Q for formatting
map("n", "Q", "gq")
map("n", "QQ", "gqq")

-- NOTE: the 4th argument in the map function is be a table i.e options but its most likely un-needed so dont worry about it

-- Spell check
vim.opt.spelllang = "en_gb"
-- unimpaired yos to toggle
-- set spelllang=en_us | set spelllang=es_ar | set spelllang=de_de
-- ]s : next |  [s : prev | z= suggestions | zg ignore | zw add
-- set dictionary+=/usr/share/dict/words
-- dictionary completion (^x^k), sadly it loads the dictionary on startup.

-- A somewhat better list of invisible chars
vim.opt.listchars = "tab:▸ ,trail:Ξ,extends:>,precedes:<,nbsp:␠,eol:¶,space:·"

-- status line takes care of showing the current mode
vim.opt.showmode = false

-- Open new splits at the bottom, or to the right
vim.opt.splitbelow = true
vim.opt.splitright = true

-- autocompletion of files and commands behave like shell
-- (complete only the common part, list the options that match)
vim.opt.wildmode = "list:longest"

-- Override the filetype configuration
require("custom.configs.filetype").setup()
