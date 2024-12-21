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
THEME.git = THEME.git or {}

THEME.git.modified = ui.Style():fg("blue")
THEME.git.added = ui.Style():fg("blue")
THEME.git.untracked = ui.Style():fg("blue")
THEME.git.ignored = ui.Style():fg("blue")
THEME.git.deleted = ui.Style():fg("blue")
THEME.git.updated = ui.Style():fg("blue")

THEME.git.modified_sign = "M"
THEME.git.added_sign = "A"
THEME.git.untracked_sign = "?"
THEME.git.ignored_sign = "I"
THEME.git.deleted_sign = "D"
THEME.git.updated_sign = "U"

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
