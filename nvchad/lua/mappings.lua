require "nvchad.mappings"

local map = vim.keymap.set

-- undo tree
map("n", "<F6>", "<cmd> UndotreeToggle <CR>", { desc = "Toggle undo tree" })

-- telescope
map("n", "<leader>cc", "<cmd> Telescope <CR>", { desc = "open telescope" })
map("n", "<leader>fk", "<cmd> Telescope keymaps<CR>", { desc = "telescope keymaps" })
map("n", "<leater>ft", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })

-- refactoring
map("n", "<leader>ri", function()
  return require("refactoring").refactor "Inline Variable"
end, { desc = "refactor variable to inline" })
map("n", "<leader>rb", function()
  return require("refactoring").refactor "Extract Block"
end, { desc = "refactor block" })
map("n", "<leader>rF", function()
  return require("refactoring").refactor "Extract Block To File"
end, { desc = "refactor block to file" })
map("x", "<leader>re", function()
  return require("refactoring").refactor "Extract Function"
end, { desc = "refactor function" })
map("x", "<leader>rf", function()
  return require("refactoring").refactor "Extract Function To File"
end, { desc = "refactor function to file" })
map("x", "<leader>rv", function()
  return require("refactoring").refactor "Extract Variable"
end, { desc = "refactor variable" })
map("x", "<leader>rI", function()
  return require("refactoring").refactor "Inline Function"
end, { desc = "refactor function to inline" })
map("x", "<leader>ri", function()
  return require("refactoring").refactor "Inline Variable"
end, { desc = "refactor variable to inline" })

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
--
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

map("n", "<leader>y", "\"+y", { desc = "Yank to system clipboard" })
map("x", "<leader>y", "\"+y", { desc = "Yank to system clipboard" })
map("n", "<leader>p", "\"+p", { desc = "Paste system clipboard" })
map("x", "<leader>p", "\"+p", { desc = "Paste system clipboard" })

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
