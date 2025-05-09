-- require("don.core")
-- require("don.lazy")

if vim.g.vscode then
  -- VSCode Neovim
  require("user.vscode_keymaps")
else
  -- Ordinary Neovim
  require("don.core")
  require("don.lazy")
end
