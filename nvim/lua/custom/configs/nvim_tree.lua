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
    update_cwd = true,
  },
}

return M
