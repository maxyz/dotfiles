require "nvchad.mappings"

local map = vim.keymap.set

-- lsp
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })

-- undo tree
map("n", "<F6>", "<cmd> UndotreeToggle <CR>", { desc = "Toggle undo tree" })

-- telescope
map("n", "<leader>cc", "<cmd> Telescope <CR>", { desc = "open telescope" })
map("n", "<leader>fk", "<cmd> Telescope keymaps<CR>", { desc = "telescope keymaps" })
map("n", "<leater>ft", "<cmd> Telescope terms<CR>", { desc = "telescope pick hidden term" })
map("n", "<leater>fr", "<cmd> Telescope resume<CR>", { desc = "telescope resume" })

-- refactoring
-- map({ "n", "x" }, "<leader>re", function() return require('refactoring').extract_func() end,
--   { desc = "refactor function", expr = true })
-- map({ "n", "x" }, "<leader>re", function() return require('refactoring').extract_func() end,
--   { desc = "refactor function", expr = true })
-- map({ "n", "x" }, "<leader>rf", function() return require('refactoring').extract_func_to_file() end,
--   { desc = "refactor function to file", expr = true })
-- map({ "n", "x" }, "<leader>rv", function() return require('refactoring').extract_var() end,
--   { desc = "refactor variable", expr = true })
-- map({ "n", "x" }, "<leader>rI", function() return require('refactoring').inline_func() end,
--   { desc = "refactor function to inline", expr = true })
-- map({ "n", "x" }, "<leader>ri", function() return require('refactoring').inline_var() end,
--   { desc = "refactor variable to inline", expr = true })


-- map({ "n", "x" }, "<leader>rr", function()
--   -- this keymap doesn't select any textobject by default, so you may need to provide one each time you use it.
--   require("refactoring").select_refactor()
-- end, { desc = "Select refactor" })

-- map({ "n", "x" }, "<leader>rbb", function() return require('refactoring').refactor('Extract Block') end,
--   { desc = "refactor block", expr = true })
-- map({ "n", "x" }, "<leader>rbf", function() return require('refactoring').refactor('Extract Block To File') end,
--   { desc = "refactor block to file", expr = true })

map({ "n", "x" }, "<leader>re", function() return require("refactoring").extract_func() end,
  { desc = "Extract Function", expr = true })
-- `_` is the default textobject for "current line"
-- map("n", "<leader>ree", function()
--   return require("refactoring").extract_func() .. "_"
-- end, { desc = "Extract Function (line)", expr = true })

map({ "n", "x" }, "<leader>rf", function() return require("refactoring").extract_func_to_file() end,
  { desc = "Extract Function To File", expr = true })

map({ "n", "x" }, "<leader>rv", function() return require("refactoring").extract_var() end,
  { desc = "Extract Variable", expr = true })

-- `_` is the default textobject for "current line"
-- keymap.set("n", "<leader>rvv", function()
--   return require("refactoring").extract_var() .. "_"
-- end, { desc = "Extract Variable (line)", expr = true })

map({ "n", "x" }, "<leader>ri", function() return require("refactoring").inline_var() end,
  { desc = "Inline Variable", expr = true })
map({ "n", "x" }, "<leader>rI", function() return require("refactoring").inline_func() end,
  { desc = "Inline function", expr = true })

map({ "n", "x" }, "<leader>rs", function() return require("refactoring").select_refactor() end,
  { desc = "Select refactor" })

-- `iw` is the builtin textobject for "in word". You can use any other textobject or even create the keymap without any textobject if you prefer to provide one yourself each time that you use the keymap
-- map("n", "<leader>pv", function()
--   return require("refactoring.debug").print_var { output_location = "below" } .. "iw"
-- end, { desc = "Debug print var below", expr = true })
-- map("x", "<leader>pv", function()
--   return require("refactoring.debug").print_var { output_location = "below" }
-- end, { desc = "Debug print var below", expr = true })

-- `iw` is the builtin textobject for "in word". You can use any other textobject or even create the keymap without any textobject if you prefer to provide one yourself each time that you use the keymap
-- map("n", "<leader>pV", function()
--   return require("refactoring.debug").print_var { output_location = "above" } .. "iw"
-- end, { desc = "Debug print var above", expr = true })
-- map("x", "<leader>pV", function()
--   return require("refactoring.debug").print_var { output_location = "above" }
-- end, { desc = "Debug print var above", expr = true })
--
-- map({ "x", "n" }, "<leader>pe", function()
--   return require("refactoring.debug").print_exp { output_location = "below" }
-- end, { desc = "Debug print exp below", expr = true })
-- `_` is the default textobject for "current line"
-- map("n", "<leader>pee", function()
--   return require("refactoring.debug").print_exp { output_location = "below" } .. "_"
-- end, { desc = "Debug print exp below", expr = true })
--
-- map({ "x", "n" }, "<leader>pE", function()
--   return require("refactoring.debug").print_exp { output_location = "above" }
-- end, { desc = "Debug print exp above", expr = true })
-- `_` is the default textobject for "current line"
-- map("n", "<leader>pEE", function()
--   return require("refactoring.debug").print_exp { output_location = "above" } .. "_"
-- end, { desc = "Debug print exp above", expr = true })
--
-- map("n", "<leader>pP", function()
--   return require("refactoring.debug").print_loc { output_location = "above" }
-- end, { desc = "Debug print location", expr = true })
-- map("n", "<leader>pp", function()
--   return require("refactoring.debug").print_loc { output_location = "below" }
-- end, { desc = "Debug print location", expr = true })
--
-- map({ "x", "n" }, "<leader>pc", function()
-- `ag` is a custom textobject that selects the whole buffer. It's provided by plugins like `mini.ai` (requires manual configuration using `MiniExtra.gen_ai_spec.buffer()`).
-- return require("refactoring.debug").cleanup { restore_view = true } .. "ag"

-- this keymap doesn't select any textobject by default, so you need to provide one each time you use it.
--   return require("refactoring.debug").cleanup { restore_view = true }
-- end, { desc = "Debug print clean", expr = true, remap = true })

-- trouble
-- map("n", "<leader>tt", "<cmd> Trouble <cr>", { desc = "show troubles" })
map("n", "[R", function()
  return require("trouble").first { skip_groups = true, jump = true }
end, { desc = "first trouble" })
map("n", "]r", function()
  return require("trouble").next { skip_groups = true, jump = true }
end, { desc = "next trouble" })
map("n", "[r", function()
  return require("trouble").previous { skip_groups = true, jump = true }
end, { desc = "previous trouble" })
map("n", "]R", function()
  return require("trouble").last { skip_groups = true, jump = true }
end, { desc = "last trouble" })

-- general

-- ignore the formatexpr
map("n", "Q", "gwap", { desc = "format paragraph" })
map("x", "Q", "gw", { desc = "format selection" })

-- map("n", "<leader>fl", function()
--   vim.diagnostic.open_float { border = "rounded" }
-- end, { desc = "Floating diagnostic" })

-- Use conform formatting
map("n", "<leader>fM", function()
  require("conform").format()
end, { desc = "File Format with conform" })
-- map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>", { desc = "Escape insert mode" })

map({ "n", "x" }, "<leader>y", "\"+y", { desc = "Yank to system clipboard" })
map({ "n", "x" }, "<leader>p", "\"+p", { desc = "Paste system clipboard" })
map({ "n", "x" }, "<leader>P", "\"+P", { desc = "Paste system clipboard above" })

local nomap = vim.keymap.del
nomap("n", "<leader>pt")

-- Keyboard users
map("n", "<C-t>", function()
  require("menu").open("default")
end, {})

-- mouse users + nvimtree users!
map("n", "<RightMouse>", function()
  vim.cmd.exec '"normal! \\<RightMouse>"'

  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = true })
end, {})
