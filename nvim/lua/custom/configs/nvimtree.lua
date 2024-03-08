local M = {
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },
  git = {
    enable = true,
    ignore = false,
  },
  sort_by = "case_sensitive",
  update_focused_file = {
    update_root = true,
  },
  renderer = {
    -- highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
