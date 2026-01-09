require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- NORMAL
map({ "n", "x", "v" }, "j", "h")
map({ "n", "x", "v" }, ";", "l")
map({ "n", "x", "v" }, "k", "j")
map({ "n", "x", "v" }, "l", "k")

map({ "n" }, "<leader>j", "<C-w>h")
map({ "n" }, "<leader>;", "<C-w>l")
map({ "n" }, "<leader>k", "<C-w>j")
map({ "n" }, "<leader>l", "<C-w>k")
map({ "n" }, "<leader>fm", function()
  require("conform").format()
end)

map({ "n" }, "<leader>gb", function()
  package.loaded.gitsigns.blame_line()
end)

map("n", "<leader>x", function()
  local current_buf = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_delete(current_buf, { force = true })
end)

map("n", "<space>ft", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")

map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })

map({ "n" }, "<leader>lf", function()
  vim.diagnostic.open_float {}
end)

map("n", "<space>la", function()
  require("telescope.builtin").diagnostics { bufnr = nil }
end, { desc = "Workspace diagnostics" })

map("n", "gd", function()
  require("telescope.builtin").lsp_definitions {}
end, { desc = "LSP definitions" })

map("n", "grr", function()
  require("telescope.builtin").lsp_references {}
end, { desc = "LSP references" })

map("n", "gri", function()
  require("telescope.builtin").lsp_implementations {}
end, { desc = "LSP implementations" })

map("n", "grt", function()
  require("telescope.builtin").lsp_type_definitions {}
end, { desc = "LSP type definitions" })

-- Add current directory as workspace folder
map("n", "<space>lwa", function()
  vim.lsp.buf.add_workspace_folder(vim.fn.getcwd())
  print("Added workspace folder: " .. vim.fn.getcwd())
end, { desc = "LSP: Add workspace folder" })

-- Remove workspace folder
map("n", "<space>lwr", function()
  vim.lsp.buf.remove_workspace_folder(vim.fn.getcwd())
  print("Removed workspace folder: " .. vim.fn.getcwd())
end, { desc = "LSP: Remove workspace folder" })

-- List workspace folders
map("n", "<space>lwl", function()
  vim.print(vim.lsp.buf.list_workspace_folders())
end, { desc = "LSP: List workspace folders" })

-- Open diff
map("n", "<space>df", ":CodeDiff<CR>")

-- VISUAL
map({ "v" }, ">", ">gv")
