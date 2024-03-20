require "nvchad.mappings"

local map = vim.keymap.set

-- cmp
map("n", "<leader>tc", function()
  vim.g.cmp_toggle_flag = not vim.g.cmp_toggle_flag
end, { desc = "Toggle completion" })

-- codeium
map("i", "<M-CR>", function()
  -- "<Plug>call codeium#Accept()<CR>"
  return vim.api.nvim_input(vim.fn["codeium#Accept"]())
end, { desc = "Codeium apply" })
map("n", "<leader>c\\>", function()
  vim.fn["codeium#Chat"]()
end, { desc = "Codeium chat" })

-- undo tree
map("n", "<F6>", "<cmd> UndotreeToggle <CR>", { desc = "Toggle undo tree" })

-- telescope
map("n", "<leader>cc", "<cmd> Telescope <CR>", { desc = "open telescope" })
map("n", "<leader>sk", "<cmd> Telescope keymaps<CR>", { desc = "telescope keymaps" })

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
map("n", "<leader>tt", "<cmd> Trouble <cr>", { desc = "show troubles" })
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
