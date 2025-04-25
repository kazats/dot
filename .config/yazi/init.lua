require("bookmarks"):setup({
  notify = {
    enable = true,
    timeout = 2,
    message = {
      new = "New bookmark '<key>' -> '<folder>'",
      delete = "Deleted bookmark '<key>'",
      delete_all = "Deleted all bookmarks",
    },
  },
})

require("git"):setup()
th.git = th.git or {}

th.git.modified = ui.Style():fg("blue")
th.git.added = ui.Style():fg("blue")
th.git.untracked = ui.Style():fg("blue")
th.git.ignored = ui.Style():fg("blue")
th.git.deleted = ui.Style():fg("blue")
th.git.updated = ui.Style():fg("blue")

th.git.modified_sign = "M"
th.git.added_sign = "A"
th.git.untracked_sign = "?"
th.git.ignored_sign = "I"
th.git.deleted_sign = "D"
th.git.updated_sign = "U"

function Status:name()
  local h = self._current.hovered
  if not h then
    return ""
  end

  local linked = ""
  if h.link_to ~= nil then
    linked = " -> " .. tostring(h.link_to)
  end

  return " " .. h.name:gsub("\r", "?", 1) .. linked
end
