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

  -- hijack_directories = {
  --   enable = true,
  -- },
  update_focused_file = {
    update_root = true,
  },
  sync_root_with_cwd = false,

  sort = { sorter = "case_sensitive" },

  renderer = {
    -- highlight_git = true,
    icons = {
      show = {
        git = true,
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
