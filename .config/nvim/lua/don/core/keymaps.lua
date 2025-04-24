vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- Increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- Decrement

-- option to use hjkl as directional keys
keymap.set("i", "<C-h>", "<Left>", { noremap = true, silent = true })
keymap.set("i", "<C-l>", "<Right>", { noremap = true, silent = true })
keymap.set("i", "<C-j>", "<Down>", { noremap = true, silent = true })
keymap.set("i", "<C-k>", "<Up>", { noremap = true, silent = true })

-- wrap lines
keymap.set("n", "<leader>sw", ":set wrap<CR>", { noremap = true, silent = true })

-- unwrap lines
keymap.set("n", "<leader>sv", ":set nowrap<CR>", { noremap = true, silent = true })

-- linebreak
keymap.set("n", "<leader>sl", ":set linebreak<CR>", { noremap = true, silent = true })

-- no linebreak
keymap.set("n", "<leader>nl", ":set nolinebreak<CR>", { noremap = true, silent = true })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }, { noremap = true, silent = true }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }, { noremap = true, silent = true }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }, { noremap = true, silent = true }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }, { noremap = true, silent = true }) -- close current split window

keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }, { noremap = true, silent = true }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }, { noremap = true, silent = true }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }, { noremap = true, silent = true }) --  go to previous tab
keymap.set(
  "n",
  "<leader>tf",
  "<cmd>tabnew %<CR>",
  { desc = "Open current buffer in new tab" },
  { noremap = true, silent = true }
) --  move current buffer to new tab

-- noice keymaps
keymap.set(
  "n",
  "<leader>nd",
  "<cmd>NoiceDismiss<CR>",
  { desc = "Dismiss Noice messages" },
  { noremap = true, silent = true }
) -- dismiss Noice mesasges

-- markview keymaps
keymap.set(
  "n",
  "<leader>rmt",
  "<cmd>RenderMarkdown toggle<CR>",
  { desc = "Toggles Markdown Preview" },
  { noremap = true, silent = true }
) -- toggle RenderMarkdown for markdown files

-- Oil keymaps
keymap.set("n", "<leader>ee", "<cmd>Oil<CR>", { desc = "Open Oil" }, { noremap = true, silent = true }) -- open Oil file manager

-- copy-deep-path keymaps
keymap.set("n", "<leader>cp", "<cmd>CopyDeepPath<CR>", { desc = "Copy Deep Path" }, { noremap = true, silent = true }) -- copy deep path of current file
