local keymap = vim.keymap.set
local opt = { noremap = true, silent = true }

--remap leader key
keymap("n", "<Space>", "", opt)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- yank to system clipboard
keymap({ "n", "v" }, "<leader>y", '"+y', opt)

-- paste from system clipboard
keymap({ "n", "v" }, "<leader>p", '"+p', opt)

-- better indent handling
keymap("v", "<", "<gv", opt)
keymap("v", ">", ">gv", opt)

-- set relative number
keymap("n", "<leader>rn", "<cmd>:set relativenumber<CR>", opt)

-- set absolute number
keymap("n", "<leader>an", "<cmd>:set norelativenumber<CR>", opt)

-- move text up and down
keymap("v", "J", ":m .+1<CR>==", opt)
keymap("v", "K", ":m .-2<CR>==", opt)
keymap("x", "J", ":move '>+1<CR>gv-gv", opt)
keymap("x", "K", ":move '<-2<CR>gv-gv", opt)

-- paste preserves primal yanked piece
keymap("v", "p", '"_dP', opt)

-- removes highlighting after escaping vim search
keymap("n", "<Esc>", "<Esc>:noh<CR>", opt)

-- sync system clipboard
vim.opt.clipboard = "unnamedplus"

-- search ignoring case
vim.opt.ignorecase = true

-- disable "ignorecase" option if the search pattern contains upper case characters
vim.opt.smartcase = true

-- explorer keymaps
keymap({ "n", "v" }, "<leader>ee", "<cmd>lua require('vscode').action('workbench.view.explorer')<CR>")
keymap({ "n", "v" }, "<leader>ec", "<cmd>lua require('vscode').action('workbench.action.toggleSidebarVisibility')<CR>")

-- general keymaps
keymap({ "n", "v" }, "<leader>b", "<cmd>lua require('vscode').action('editor.debug.action.toggleBreakpoint')<CR>")
keymap({ "n", "v" }, "<leader>d", "<cmd>lua require('vscode').action('editor.action.showHover')<CR>")
keymap({ "n", "v" }, "<leader>a", "<cmd>lua require('vscode').action('editor.action.quickFix')<CR>")
keymap({ "n", "v" }, "<leader>sp", "<cmd>lua require('vscode').action('workbench.actions.view.problems')<CR>")
keymap({ "n", "v" }, "<leader>cn", "<cmd>lua require('vscode').action('notifications.clearAll')<CR>")
keymap({ "n", "v" }, "<leader>ff", "<cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>")
keymap({ "n", "v" }, "<leader>cp", "<cmd>lua require('vscode').action('workbench.action.showCommands')<CR>")
keymap({ "n", "v" }, "<leader>pr", "<cmd>lua require('vscode').action('code-runner.run')<CR>")
keymap({ "n", "v" }, "<leader>fd", "<cmd>lua require('vscode').action('editor.action.formatDocument')<CR>")
keymap({ "n", "v" }, "<leader>rw", "<cmd>lua require('vscode').action('workbench.action.reloadWindow')<CR>")

-- folds keymaps
keymap({ "n", "v" }, "<leader>tf", "<cmd>lua require('vscode').action('editor.toggleFold')<CR>")

-- harpoon keymaps
keymap({ "n", "v" }, "<leader>ha", "<cmd>lua require('vscode').action('vscode-harpoon.addEditor')<CR>")
keymap({ "n", "v" }, "<leader>ho", "<cmd>lua require('vscode').action('vscode-harpoon.editorQuickPick')<CR>")
keymap({ "n", "v" }, "<leader>he", "<cmd>lua require('vscode').action('vscode-harpoon.editEditors')<CR>")
keymap({ "n", "v" }, "<leader>h1", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor1')<CR>")
keymap({ "n", "v" }, "<leader>h2", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor2')<CR>")
keymap({ "n", "v" }, "<leader>h3", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor3')<CR>")
keymap({ "n", "v" }, "<leader>h4", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor4')<CR>")
keymap({ "n", "v" }, "<leader>h5", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor5')<CR>")
keymap({ "n", "v" }, "<leader>h6", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor6')<CR>")
keymap({ "n", "v" }, "<leader>h7", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor7')<CR>")
keymap({ "n", "v" }, "<leader>h8", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor8')<CR>")
keymap({ "n", "v" }, "<leader>h9", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor9')<CR>")

-- project manager keymaps
keymap({ "n", "v" }, "<leader>pa", "<cmd>lua require('vscode').action('projectManager.saveProject')<CR>")
keymap({ "n", "v" }, "<leader>po", "<cmd>lua require('vscode').action('projectManager.listProjectsNewWindow')<CR>")
keymap({ "n", "v" }, "<leader>pe", "<cmd>lua require('vscode').action('projectManager.editProjects')<CR>")

-- which key keymaps
keymap("n", "<leader>wk", "<cmd>lua require('vscode').action('whichkey.show')<CR>")

-- markdown keymaps
keymap({ "n" }, "<leader>md", "<cmd>lua require('vscode').action('markdown.showPreview')<CR>")


--[[ -- lazy plugin manager setup
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        'vscode-neovim/vscode-multi-cursor.nvim',
        event = 'VeryLazy',
        cond = not not vim.g.vscode,
        vscode = true,
        opt = {
            vim.keymap.set({ "n", "x", "i" }, "<C-d>", function()
                require("vscode-multi-cursor").addSelectionToNextFindMatch()
            end)
        },
    },
    {
        "Dan7h3x/LazyDo",
        branch = "main",
        cmd = {"LazyDoToggle","LazyDoPin","LazyDoToggleStorage"},
        vscode = true,
        keys = { -- recommended keymap for easy toggle LazyDo in normal and insert modes (arbitrary)
            {
            "<F2>","<ESC><CMD>LazyDoToggle<CR>",
            mode = {"n","i"},
            },
        },
        event = "VeryLazy",
        opts = {
          -- your config here
        },
      }, }) ]]

