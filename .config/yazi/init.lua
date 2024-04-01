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
