local neogit = require "neogit"

-- open using defaults
neogit.open()

-- open a specific popup
neogit.open { "commit" }

-- open as a split
neogit.open { kind = "split" }

-- open with different project
neogit.open { cwd = "~" }
