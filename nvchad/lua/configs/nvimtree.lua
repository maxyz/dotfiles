local M = {
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },

  filters = {
    git_ignored = false,
  },

  git = {
    enable = true,
    ignore = false,
  },

  update_focused_file = {
    update_root = false,
  },

  sync_root_with_cwd = true,

  sort = { sorter = "case_sensitive" },

  renderer = {
    icons = {
      show = {
        folder = false,
      },
    },
  },
  view = {
    width = {
      min = 10,
      max = 30,
    },
  },
}

return M
